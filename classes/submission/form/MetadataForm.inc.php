<?php

/**
 * @file classes/submission/form/MetadataForm.inc.php
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class MetadataForm
 * @ingroup submission_form
 *
 * @brief Form to change metadata information for a submission.
 */


import('lib.pkp.classes.form.Form');

define('COVER_PAGE_IMAGE_NAME', 'coverPage');

class MetadataForm extends Form {
	/** @var Article current article */
	var $article;

	/** @var boolean can edit metadata */
	var $canEdit;

	/** @var boolean can view authors */
	var $canViewAuthors;

	/** @var boolean is an Editor, can edit all metadata */
	var $isEditor;

	/**
	 * Constructor.
	 */
	function MetadataForm($article, $journal) {
		$roleDao = DAORegistry::getDAO('RoleDAO');
		$signoffDao = DAORegistry::getDAO('SignoffDAO');

		$user = Request::getUser();
		$roleId = $roleDao->getRoleIdFromPath(Request::getRequestedPage());

		// If the user is an editor of this article, make the entire form editable.
		$this->canEdit = false;
		$this->isEditor = false;
		if ($roleId != null && ($roleId == ROLE_ID_EDITOR || $roleId == ROLE_ID_SECTION_EDITOR)) {
			$this->canEdit = true;
			$this->isEditor = true;
		}

		$copyeditInitialSignoff = $signoffDao->getBySymbolic('SIGNOFF_COPYEDITING_INITIAL', ASSOC_TYPE_ARTICLE, $article->getId());
		// If the user is an author and the article hasn't passed the Copyediting stage, make the form editable.
		if ($roleId == ROLE_ID_AUTHOR) {
			if ($article->getStatus() != STATUS_PUBLISHED && ($copyeditInitialSignoff == null || $copyeditInitialSignoff->getDateCompleted() == null)) {
				$this->canEdit = true;
			}
		}

		// Copy editors are also allowed to edit metadata, but only if they have
		// a current assignment to the article.
		if ($roleId != null && ($roleId == ROLE_ID_COPYEDITOR)) {
			$copyeditFinalSignoff = $signoffDao->build('SIGNOFF_COPYEDITING_FINAL', ASSOC_TYPE_ARTICLE, $article->getId());
			if ($copyeditFinalSignoff != null && $article->getStatus() != STATUS_PUBLISHED) {
				if ($copyeditInitialSignoff->getDateNotified() != null && $copyeditFinalSignoff->getDateCompleted() == null) {
					$this->canEdit = true;
				}
			}
		}

		if ($this->canEdit) {
			parent::Form(
				'submission/metadata/metadataEdit.tpl',
				true,
				$article->getLocale(),
				$journal->getSupportedSubmissionLocaleNames()
			);
			$this->addCheck(new FormValidatorLocale($this, 'title', 'required', 'author.submit.form.titleRequired', $this->getRequiredLocale()));
		} else {
			parent::Form('submission/metadata/metadataView.tpl');
		}

		// If the user is a reviewer of this article, do not show authors.
		$this->canViewAuthors = true;
		if ($roleId != null && $roleId == ROLE_ID_REVIEWER) {
			$this->canViewAuthors = false;
		}

		$this->article = $article;

		$this->addCheck(new FormValidatorPost($this));
	}

	/**
	 * Get the default form locale.
	 * @return string
	 */
	function getDefaultFormLocale() {
		if ($this->article) return $this->article->getLocale();
		return parent::getDefaultFormLocale();
	}

	/**
	 * Initialize form data from current article.
	 */
	function initData() {
		if (isset($this->article)) {
			$article =& $this->article;
			$this->_data = array(
				'authors' => array(),
				'title' => $article->getTitle(null), // Localized
				'abstract' => $article->getAbstract(null), // Localized
				'coverPageAltText' => $article->getCoverPageAltText(null), // Localized
				'showCoverPage' => $article->getShowCoverPage(null), // Localized
				'hideCoverPageToc' => $article->getHideCoverPageToc(null), // Localized
				'hideCoverPageAbstract' => $article->getHideCoverPageAbstract(null), // Localized
				'originalFileName' => $article->getOriginalFileName(null), // Localized
				'fileName' => $article->getFileName(null), // Localized
				'width' => $article->getWidth(null), // Localized
				'height' => $article->getHeight(null), // Localized
				'discipline' => $article->getDiscipline(null), // Localized
				'subjectClass' => $article->getSubjectClass(null), // Localized
				'subject' => $article->getSubject(null), // Localized
				'coverageGeo' => $article->getCoverageGeo(null), // Localized
				'coverageChron' => $article->getCoverageChron(null), // Localized
				'coverageSample' => $article->getCoverageSample(null), // Localized
				'type' => $article->getType(null), // Localized
				'source' => $article->getSource(null), // Localized
				'rights' => $article->getRights(null), // Localized
				'language' => $article->getLanguage(),
				'sponsor' => $article->getSponsor(null), // Localized
				'citations' => $article->getCitations(),
				'hideAuthor' => $article->getHideAuthor(),
				'prefix' => $article->getPrefix(null), // Localized
				'subtitle' => $article->getSubtitle(null), // Localized
			);

			// load the persisted metadata controlled vocabularies
			$submissionKeywordDao = DAORegistry::getDAO('SubmissionKeywordDAO');
			$submissionSubjectDao = DAORegistry::getDAO('SubmissionSubjectDAO');
			$submissionDisciplineDao = DAORegistry::getDAO('SubmissionDisciplineDAO');
			$submissionAgencyDao = DAORegistry::getDAO('SubmissionAgencyDAO');
			$submissionLanguageDao = DAORegistry::getDAO('SubmissionLanguageDAO');

			// get the supported locale keys
			$locales = array_keys($this->supportedLocales);

			$this->setData('subjects', $submissionSubjectDao->getSubjects($article->getId(), $locales));
			$this->setData('keywords', $submissionKeywordDao->getKeywords($article->getId(), $locales));
			$this->setData('disciplines', $submissionDisciplineDao->getDisciplines($article->getId(), $locales));
			$this->setData('agencies', $submissionAgencyDao->getAgencies($article->getId(), $locales));
			$this->setData('languages', $submissionLanguageDao->getLanguages($article->getId(), $locales));

			// consider the additional field names from the public identifer plugins
			import('classes.plugins.PubIdPluginHelper');
			$pubIdPluginHelper = new PubIdPluginHelper();
			$pubIdPluginHelper->init($this, $article);
		}
		return parent::initData();
	}

	/**
	 * Get the field names for which data can be localized
	 * @return array
	 */
	function getLocaleFieldNames() {
		return array(
			'title', 'abstract', 'coverPageAltText', 'showCoverPage', 'hideCoverPageToc', 'hideCoverPageAbstract', 'originalFileName', 'fileName', 'width', 'height',
			'discipline', 'subjectClass', 'subject', 'coverageGeo', 'coverageChron', 'coverageSample', 'type', 'sponsor', 'citations', 'rights', 'source', 'prefix', 'subtitle',
		);
	}

	/**
	 * Display the form.
	 */
	function display() {
		$journal = Request::getJournal();
		$settingsDao = DAORegistry::getDAO('JournalSettingsDAO');
		$roleDao = DAORegistry::getDAO('RoleDAO');
		$sectionDao = DAORegistry::getDAO('SectionDAO');

		AppLocale::requireComponents(LOCALE_COMPONENT_APP_EDITOR); // editor.cover.xxx locale keys; FIXME?

		$templateMgr = TemplateManager::getManager();
		$templateMgr->assign('articleId', isset($this->article)?$this->article->getId():null);
		$templateMgr->assign('submissionSettings', $settingsDao->getSettings($journal->getId()));
		$templateMgr->assign('rolePath', Request::getRequestedPage());
		$templateMgr->assign('canViewAuthors', $this->canViewAuthors);

		$countryDao = DAORegistry::getDAO('CountryDAO');
		$templateMgr->assign('countries', $countryDao->getCountries());

		if ($this->article) {
			$templateMgr->assign('section', $sectionDao->getById($this->article->getSectionId()));
		}

		if ($this->isEditor) {
			import('classes.article.Article');
			$hideAuthorOptions = array(
				AUTHOR_TOC_DEFAULT => AppLocale::Translate('editor.article.hideTocAuthorDefault'),
				AUTHOR_TOC_HIDE => AppLocale::Translate('editor.article.hideTocAuthorHide'),
				AUTHOR_TOC_SHOW => AppLocale::Translate('editor.article.hideTocAuthorShow')
			);
			$templateMgr->assign('hideAuthorOptions', $hideAuthorOptions);
			$templateMgr->assign('isEditor', true);
		}
		// consider public identifiers
		$pubIdPlugins =& PluginRegistry::loadCategory('pubIds', true);
		$templateMgr->assign('pubIdPlugins', $pubIdPlugins);
		$templateMgr->assign_by_ref('article', $this->article);

		parent::display();
	}


	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
		$this->readUserVars(
			array(
				'articleId',
				'authors',
				'deletedAuthors',
				'primaryContact',
				'title',
				'abstract',
				'coverPageAltText',
				'showCoverPage',
				'hideCoverPageToc',
				'hideCoverPageAbstract',
				'originalFileName',
				'fileName',
				'width',
				'height',
				'discipline',
				'subjectClass',
				'subject',
				'coverageGeo',
				'coverageChron',
				'coverageSample',
				'type',
				'language',
				'sponsor',
				'citations',
				'hideAuthor',
				'rights',
				'source',
				'prefix',
				'subtitle',
				'keywords'
			)
		);
		// consider the additional field names from the public identifer plugins
		import('classes.plugins.PubIdPluginHelper');
		$pubIdPluginHelper = new PubIdPluginHelper();
		$pubIdPluginHelper->readInputData($this);

		$sectionDao = DAORegistry::getDAO('SectionDAO');
		$section = $sectionDao->getById($this->article->getSectionId());
		if (!$section->getAbstractsNotRequired()) {
			$this->addCheck(new FormValidatorLocale($this, 'abstract', 'required', 'author.submit.form.abstractRequired', $this->getRequiredLocale()));
		}

		$tagitKeywords = $this->getData('keywords');
		// get the supported locale keys
		$locales = array_keys($this->supportedLocales);

		if (is_array($tagitKeywords)) {
			foreach ($locales as $locale) {
				$keywords[$locale] = array_key_exists($locale . '-keyword', $tagitKeywords) ? $tagitKeywords[$locale . '-keyword'] : array();
				$agencies[$locale] = array_key_exists($locale . '-agencies', $tagitKeywords) ? $tagitKeywords[$locale . '-agencies'] : array();
				$disciplines[$locale] = array_key_exists($locale . '-disciplines', $tagitKeywords) ? $tagitKeywords[$locale . '-disciplines'] : array();
				$languages[$locale] = array_key_exists($locale . '-languages', $tagitKeywords) ? $tagitKeywords[$locale . '-languages'] : array();
				$subjects[$locale] = array_key_exists($locale . '-subjects', $tagitKeywords) ?$tagitKeywords[$locale . '-subjects'] : array();
			}

			$this->setData('subjects', $subjects);
			$this->setData('submissionKeywords', $keywords);
			$this->setData('disciplines', $disciplines);
			$this->setData('agencies', $agencies);
			$this->setData('languages', $languages);
		}
	}

	/**
	 * Check to ensure that the form is correctly validated.
	 */
	function validate() {
		// Verify that an image cover, if supplied, is actually an image.
		import('classes.file.PublicFileManager');
		$publicFileManager = new PublicFileManager();
		if ($publicFileManager->uploadedFileExists(COVER_PAGE_IMAGE_NAME)) {
			$type = $publicFileManager->getUploadedFileType(COVER_PAGE_IMAGE_NAME);
			$extension = $publicFileManager->getImageExtension($type);
			if (!$extension) {
				// Not a valid image.
				$this->addError('imageFile', __('submission.layout.imageInvalid'));
				return false;
			}
		}

		// Verify additional fields from public identifer plug-ins.
		$journal = Request::getJournal();
		import('classes.plugins.PubIdPluginHelper');
		$pubIdPluginHelper = new PubIdPluginHelper();
		$pubIdPluginHelper->validate($journal->getId(), $this, $this->article);

		// Fall back on parent validation
		return parent::validate();
	}


	/**
	 * Save changes to article.
	 * @param $request PKPRequest
	 * @return int the article ID
	 */
	function execute($request) {
		$articleDao = DAORegistry::getDAO('ArticleDAO');
		$authorDao = DAORegistry::getDAO('AuthorDAO');
		$sectionDao = DAORegistry::getDAO('SectionDAO');
		$citationDao = DAORegistry::getDAO('CitationDAO'); /* @var $citationDao CitationDAO */
		$article =& $this->article;

		// Retrieve the previous citation list for comparison.
		$previousRawCitationList = $article->getCitations();

		// Update article
		$article->setTitle($this->getData('title'), null); // Localized
		$article->setSubtitle($this->getData('subtitle'), null); // Localized
		$article->setPrefix($this->getData('prefix'), null); // Localized

		$section = $sectionDao->getById($article->getSectionId());
		$article->setAbstract($this->getData('abstract'), null); // Localized

		import('classes.file.PublicFileManager');
		$publicFileManager = new PublicFileManager();
		if ($publicFileManager->uploadedFileExists(COVER_PAGE_IMAGE_NAME)) {
			$journal = Request::getJournal();
			$originalFileName = $publicFileManager->getUploadedFileName(COVER_PAGE_IMAGE_NAME);
			$type = $publicFileManager->getUploadedFileType(COVER_PAGE_IMAGE_NAME);
			$newFileName = 'cover_article_' . $this->article->getId() . '_' . $this->getFormLocale() . $publicFileManager->getImageExtension($type);
			$publicFileManager->uploadJournalFile($journal->getId(), COVER_PAGE_IMAGE_NAME, $newFileName);
			$article->setOriginalFileName($publicFileManager->truncateFileName($originalFileName, 127), $this->getFormLocale());
			$article->setFileName($newFileName, $this->getFormLocale());

			// Store the image dimensions.
			list($width, $height) = getimagesize($publicFileManager->getJournalFilesPath($journal->getId()) . '/' . $newFileName);
			$article->setWidth($width, $this->getFormLocale());
			$article->setHeight($height, $this->getFormLocale());
		}

		$article->setCoverPageAltText($this->getData('coverPageAltText'), null); // Localized
		$showCoverPage = array_map(create_function('$arrayElement', 'return (int)$arrayElement;'), (array) $this->getData('showCoverPage'));
		foreach (array_keys($this->getData('coverPageAltText')) as $locale) {
			if (!array_key_exists($locale, $showCoverPage)) {
				$showCoverPage[$locale] = 0;
			}
		}
		$article->setShowCoverPage($showCoverPage, null); // Localized

		$hideCoverPageToc = array_map(create_function('$arrayElement', 'return (int)$arrayElement;'), (array) $this->getData('hideCoverPageToc'));
		foreach (array_keys($this->getData('coverPageAltText')) as $locale) {
			if (!array_key_exists($locale, $hideCoverPageToc)) {
				$hideCoverPageToc[$locale] = 0;
			}
		}
		$article->setHideCoverPageToc($hideCoverPageToc, null); // Localized

		$hideCoverPageAbstract = array_map(create_function('$arrayElement', 'return (int)$arrayElement;'), (array) $this->getData('hideCoverPageAbstract'));
		foreach (array_keys($this->getData('coverPageAltText')) as $locale) {
			if (!array_key_exists($locale, $hideCoverPageAbstract)) {
				$hideCoverPageAbstract[$locale] = 0;
			}
		}
		$article->setHideCoverPageAbstract($hideCoverPageAbstract, null); // Localized

		$article->setSubjectClass($this->getData('subjectClass'), null); // Localized
		$article->setCoverageGeo($this->getData('coverageGeo'), null); // Localized
		$article->setCoverageChron($this->getData('coverageChron'), null); // Localized
		$article->setCoverageSample($this->getData('coverageSample'), null); // Localized
		$article->setType($this->getData('type'), null); // Localized
		$article->setSource($this->getData('source'), null); // Localized
		$article->setRights($this->getData('rights'), null); // Localized
		$article->setCitations($this->getData('citations'));
		if ($this->isEditor) {
			$article->setHideAuthor($this->getData('hideAuthor') ? $this->getData('hideAuthor') : 0);
		}
		// consider the additional field names from the public identifer plugins
		import('classes.plugins.PubIdPluginHelper');
		$pubIdPluginHelper = new PubIdPluginHelper();
		$pubIdPluginHelper->execute($this, $article);

		parent::execute();

		// Save the article
		$articleDao->updateObject($article);

		// get the supported locale keys
		$locales = array_keys($this->supportedLocales);

		// persist the metadata/keyword fields.
		$submissionKeywordDao = DAORegistry::getDAO('SubmissionKeywordDAO');
		$submissionSubjectDao = DAORegistry::getDAO('SubmissionSubjectDAO');
		$submissionDisciplineDao = DAORegistry::getDAO('SubmissionDisciplineDAO');
		$submissionAgencyDao = DAORegistry::getDAO('SubmissionAgencyDAO');
		$submissionLanguageDao = DAORegistry::getDAO('SubmissionLanguageDAO');

		// persist the controlled vocabs
		$submissionKeywordDao->insertKeywords($this->getData('submissionKeywords'), $article->getId());
		$submissionAgencyDao->insertAgencies($this->getData('agencies'), $article->getId());
		$submissionDisciplineDao->insertDisciplines($this->getData('disciplines'), $article->getId());
		$submissionLanguageDao->insertLanguages($this->getData('languages'), $article->getId());
		$submissionSubjectDao->insertSubjects($this->getData('subjects'), $article->getId());

		// Update search index
		import('classes.search.ArticleSearchIndex');
		$articleSearchIndex = new ArticleSearchIndex();
		$articleSearchIndex->articleMetadataChanged($article);
		$articleSearchIndex->articleChangesFinished();

		// Update references list if it changed.
		$rawCitationList = $article->getCitations();
		if ($previousRawCitationList != $rawCitationList) {
			$citationDao->importCitations($request, ASSOC_TYPE_ARTICLE, $article->getId(), $rawCitationList);
		}

		return $article->getId();
	}

	/**
	 * Determine whether or not the current user is allowed to edit metadata.
	 * @return boolean
	 */
	function getCanEdit() {
		return $this->canEdit;
	}
}

?>
