Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB52ECCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 06:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7044F10E263;
	Mon, 20 Oct 2025 06:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH9x6E/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FE210E266
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760942642; x=1792478642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lf0D1gcKCdjUS79eg5DR9FhS+JhEgskDwIVO+XTjIuA=;
 b=eH9x6E/QC5taHmHvUIG99ir0Wepz/SjdY+shvF6bd5Hfjhze4yHLG7Ro
 /pcu54T6wYdaeWBii9SY0PprN4VRlR0cI8xOke7CXqluj9lcARicyMx7R
 u1DdOfC0o2Et7SJaHYzusYLMR8y0dlITK5qJlh4JNz5+osJgW6kAPI59k
 qRDVva/ONzrR+NVEpOd4WH+mTL/HtxbQAdXrru9rvz4GMiP2C1W08IVUG
 0UuJqqyOdrky5CSlojfX1Zz9vqMtsZNikni4nIzyPPAxBLv+YpRo5Ofnj
 M2wBUKplXpXMqhVUfqq7x18l6wpy2eRbtBhMewUvYWrc3gVGINmnLG5dG g==;
X-CSE-ConnectionGUID: LNWuRD2kS32MvtWHFkiMyA==
X-CSE-MsgGUID: z+RYSHtKQv6KpznqJE9PYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63097941"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="63097941"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:02 -0700
X-CSE-ConnectionGUID: kozN+Eu2QGunnVJwDM8Zmg==
X-CSE-MsgGUID: 21LsnBEnRSGFBl56tdXv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183098524"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:00 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v11 1/6] docs: Set up MkDocs for IGT documentation site
Date: Mon, 20 Oct 2025 08:40:45 +0200
Message-ID: <20251020064053.1050025-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020064053.1050025-1-pawel.sikora@intel.com>
References: <20251020064053.1050025-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This establishes the initial framework configuration
for the IGT GPU Tools documentation site using MkDocs.

 * Add mkdocs.yml for site configuration, including project
   info, navigation, theme, and plugins.
 * Create requirements-docs.txt for MkDocs dependencies.
 * Add extra.css for custom styling with Monokai theme.
 * Add Colorblind friendly adjustments to theme (Kamil)
 * Include CSS asset.

For details regarding MkDocs please refer to:
https://www.mkdocs.org/

Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/css/extra.css         | 323 +++++++++++++++++++++++++++++++++++++
 docs/requirements-docs.txt |   3 +
 mkdocs.yml                 | 177 ++++++++++++++++++++
 3 files changed, 503 insertions(+)
 create mode 100644 docs/css/extra.css
 create mode 100644 docs/requirements-docs.txt
 create mode 100644 mkdocs.yml

diff --git a/docs/css/extra.css b/docs/css/extra.css
new file mode 100644
index 000000000..ff1b47cb8
--- /dev/null
+++ b/docs/css/extra.css
@@ -0,0 +1,323 @@
+/* Clean MkDocs Material Theme - Colorblind Friendly */
+
+:root {
+  /* Blue-based color scheme (colorblind safe) */
+  --primary-blue: #2196f3;
+  --primary-blue-dark: #1976d2;
+  --primary-blue-light: #64b5f6;
+  --accent-blue: #42a5f5;
+
+  /* Gradients (keeping as requested) */
+  --gradient-primary: linear-gradient(135deg, #111111 0%, #1142ff 100%);
+  --gradient-accent: linear-gradient(135deg, #42a5f5 0%, #1142ff 100%);
+
+  /* Neutral colors */
+  --text-primary: #212121;
+  --text-secondary: #757575;
+  --border-light: rgba(0, 0, 0, 0.12);
+  --background-light: #fafafa;
+}
+
+/* Dark theme colors */
+[data-md-color-scheme="slate"] {
+  --md-default-bg-color: #1e1e1e;
+  --md-default-fg-color: #ffffff;
+  --md-code-bg-color: #0d0d0d;
+  --md-code-fg-color: #f5f5f5;
+}
+
+/* Typography - Clean and spacious */
+.md-typeset h1 {
+  color: var(--primary-blue);
+  font-weight: 600;
+  font-size: 1.6rem;
+  margin: 0 0 2rem;
+  padding-bottom: 0.5rem;
+  border-bottom: 2px solid var(--border-light);
+}
+
+.md-typeset h2 {
+  color: var(--primary-blue-dark);
+  font-weight: 600;
+  font-size: 1.4rem;
+  margin: 2.5rem 0 1.5rem;
+}
+
+.md-typeset h3 {
+  color: var(--primary-blue-light);
+  font-weight: 600;
+  font-size: 1.3rem;
+  margin: 2rem 0 1rem;
+}
+
+.md-typeset p {
+  line-height: 1.7;
+  margin-bottom: 1.2rem;
+  margin-left: 0.5rem;
+}
+
+/* Header - Gradient for both themes */
+.md-header {
+  background: var(--gradient-primary);
+  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
+}
+
+/* Ensure white text on gradient header for both themes */
+.md-header-nav__button,
+.md-header-nav__title,
+.md-header__title,
+.md-header__button {
+  color: white;
+}
+
+/* Tabs - Black background for light theme */
+.md-tabs {
+  font-weight: 500;
+  border-bottom: 1px solid var(--border-light);
+}
+
+[data-md-color-scheme="default"] .md-tabs {
+  background: #eeeeee;
+}
+
+[data-md-color-scheme="default"] .md-tabs__link {
+  color: rgba(0, 0, 0, 0.9);
+}
+
+[data-md-color-scheme="default"] .md-tabs__link--active,
+[data-md-color-scheme="default"] .md-tabs__link:hover {
+  color: var(--primary-blue);
+}
+
+/* Dark theme tabs */
+[data-md-color-scheme="slate"] .md-tabs {
+  background: #1e1e1e;
+}
+
+[data-md-color-scheme="slate"] .md-tabs__link {
+  color: rgba(255, 255, 255, 0.7);
+}
+
+[data-md-color-scheme="slate"] .md-tabs__link--active,
+[data-md-color-scheme="slate"] .md-tabs__link:hover {
+  color: white;
+}
+
+/* Navigation - Simple active states */
+.md-nav__item .md-nav__link--active {
+  color: var(--primary-blue);
+  font-weight: 600;
+}
+
+.md-nav__item .md-nav__link:hover {
+  color: var(--primary-blue-light);
+}
+
+/* Code - High contrast */
+.md-typeset code {
+  background: rgba(33, 150, 243, 0.1);
+  color: var(--primary-blue-dark);
+  padding: 0.125em 0.25em;
+  border-radius: 3px;
+  font-size: 0.9em;
+}
+
+.md-typeset pre code {
+  background: transparent;
+  padding: 1rem;
+  display: block;
+}
+
+.md-typeset .highlight {
+  margin: 1.5rem 0;
+  border-left: 3px solid var(--primary-blue);
+  border-radius: 4px;
+  overflow: hidden;
+}
+
+/* Admonitions - Simple with left border */
+.md-typeset .admonition {
+  margin: 1.5rem 0rem;
+  padding: 0;
+  border-left: 4px solid;
+  border-radius: 4px;
+  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
+  font-size: 0.8rem;
+}
+
+.md-typeset .admonition.note {
+  border-color: var(--primary-blue);
+  background: rgba(33, 150, 243, 0.05);
+}
+
+.md-typeset .admonition.tip {
+  border-color: #4caf50;
+  background: rgba(76, 175, 80, 0.05);
+}
+
+.md-typeset .admonition.warning {
+  border-color: #ff9800;
+  background: rgba(255, 152, 0, 0.05);
+}
+
+.md-typeset .admonition > .admonition-title {
+  margin: 0px;
+  padding: 0rem 0.6rem -1rem 0rem;
+  font-weight: 600;
+  font-size: 1rem;
+}
+
+/* Links - Underlined for accessibility */
+.md-typeset a {
+  color: var(--primary-blue);
+  text-decoration: underline;
+  text-decoration-thickness: 1px;
+  text-underline-offset: 2px;
+}
+
+.md-typeset a:hover {
+  color: var(--primary-blue-dark);
+  text-decoration-thickness: 2px;
+}
+
+/* Tables - Clean borders */
+.md-typeset table {
+  margin: 1.5rem 0;
+}
+
+.md-typeset table th {
+  background: var(--background-light);
+  font-weight: 600;
+  border-bottom: 2px solid var(--border-light);
+}
+
+[data-md-color-scheme="slate"] .md-typeset table th {
+  background: rgba(255, 255, 255, 0.05);
+}
+
+.md-typeset table td {
+  border-bottom: 1px solid var(--border-light);
+}
+
+/* Lists - Simple bullets */
+.md-typeset ul {
+  margin: 1rem 0;
+}
+
+.md-typeset ul li {
+  margin-bottom: 0.5rem;
+  line-height: 1.6;
+}
+
+.md-typeset ol li {
+  margin-bottom: 0.5rem;
+  line-height: 1.6;
+}
+
+/* Buttons - Clean and simple */
+.md-button {
+  background: var(--primary-blue);
+  color: white;
+  border-radius: 4px;
+  padding: 0.5rem 1rem;
+  font-weight: 500;
+  transition: background 0.2s;
+}
+
+.md-button:hover {
+  background: var(--primary-blue-dark);
+}
+
+/* Focus states for accessibility */
+*:focus {
+  outline: 2px solid var(--accent-blue);
+  outline-offset: 2px;
+}
+
+/* Search - Clean style */
+.md-search__input {
+  border-radius: 4px;
+}
+
+.md-search__input::placeholder {
+  opacity: 0.7;
+}
+
+/* Footer */
+.md-footer {
+  border-top: 1px solid var(--border-light);
+}
+
+/* Grid cards - Simple */
+.md-typeset .grid.cards > ol > li,
+.md-typeset .grid.cards > ul > li {
+  border: 1px solid var(--border-light);
+  border-radius: 4px;
+  padding: 1rem;
+  transition: box-shadow 0.2s;
+}
+
+.md-typeset .grid.cards > ol > li:hover,
+.md-typeset .grid.cards > ul > li:hover {
+  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
+}
+
+/* Horizontal rule */
+.md-typeset hr {
+  border: none;
+  height: 1px;
+  background: var(--border-light);
+  margin: 2rem 0;
+}
+
+/* Scrollbar */
+::-webkit-scrollbar {
+  width: 8px;
+  height: 8px;
+}
+
+::-webkit-scrollbar-track {
+  background: var(--background-light);
+}
+
+[data-md-color-scheme="slate"] ::-webkit-scrollbar-track {
+  background: rgba(255, 255, 255, 0.05);
+}
+
+::-webkit-scrollbar-thumb {
+  background: var(--primary-blue);
+  border-radius: 4px;
+}
+
+::-webkit-scrollbar-thumb:hover {
+  background: var(--primary-blue-dark);
+}
+
+/* Print styles */
+@media print {
+  .md-header,
+  .md-tabs,
+  .md-nav,
+  .md-footer {
+    display: none;
+  }
+}
+
+/* High contrast mode support */
+@media (prefers-contrast: high) {
+  .md-typeset code {
+    border: 1px solid var(--primary-blue);
+  }
+
+  .md-typeset a {
+    text-decoration-thickness: 2px;
+  }
+}
+
+/* Reduced motion support */
+@media (prefers-reduced-motion: reduce) {
+  * {
+    animation: none !important;
+    transition: none !important;
+  }
+}
diff --git a/docs/requirements-docs.txt b/docs/requirements-docs.txt
new file mode 100644
index 000000000..9a6e5f0be
--- /dev/null
+++ b/docs/requirements-docs.txt
@@ -0,0 +1,3 @@
+mkdocs
+mkdocs-minify-plugin
+mkdocs-material
diff --git a/mkdocs.yml b/mkdocs.yml
new file mode 100644
index 000000000..81b71a653
--- /dev/null
+++ b/mkdocs.yml
@@ -0,0 +1,177 @@
+# Project information
+site_name: "IGT GPU Tools"
+site_description: 'Documentation about IGT GPU Tools'
+site_author: 'IGT Team'
+site_url: 'https://drm.pages.freedesktop.org/igt-gpu-tools'
+docs_dir: 'docs'
+site_dir: 'site'
+# Repo information
+repo_name: 'igt-gpu-tools'
+repo_url: 'https://gitlab.freedesktop.org/drm/igt-gpu-tools'
+
+# Navigation bar
+nav:
+  - Overview:
+    - How to start: 'overview.md'
+  - Installation:
+    - How to install: 'building.md'
+    - How to cross build: 'cross-building.md'
+  - Usage:
+    - How to run tests: 'running_tests.md'
+    - What HW/SW could be used: 'platforms.md'
+  - Code:
+    - How to use the code: 'api.md'
+    - How to track/submit changes: 'patchwork.md'
+  - External tools:
+    - Chamelium: 'chamelium.md'
+  - Contributing:
+    - How to contribute: 'CONTRIBUTING.md'
+    - How to document tests: 'test_documentation.md'
+    - How to categorize tests: 'test_categories.md'
+    - How to blocklist tests: 'blocklists.md'
+    - How to get code coverage: 'code_coverage.md'
+    - How to port new IGT driver: 'new_driver.md'
+    - How to plan a new test: 'test_plan.md'
+    - How to build this documentation: 'how_to_build_docs.md'
+    - Maintainers: 'MAINTAINERS.md'
+  - Issues:
+    - How to view/report an issue: 'issues.md'
+  - CI:
+    - CI infrastructure: "ci_infrastructure.md"
+    - Links to CI for a specific HW platform:
+      - Intel GFX CI: https://intel-gfx-ci.01.org
+  - Download: 'download.md'
+  - API Reference: 'api_reference/index.html'
+  - News: 'NEWS.md'
+  - FAQ: 'faq.md'
+
+extra:
+  repo_icon: 'gitlab'
+
+# Theme
+theme:
+  name: material
+  palette:
+    - media: "(prefers-color-scheme: light)"
+      primary: custom
+      accent: blue
+      toggle:
+        icon: material/link
+        name: Switch to dark mode
+    - media: "(prefers-color-scheme: dark)"
+      scheme: slate
+      primary: black
+      accent: blue
+      toggle:
+        icon: material/toggle-switch-off
+        name: Switch to light mode
+  # Font configuration
+  font:
+    text: Inter
+    code: JetBrains Mono
+
+  # Logo and favicon
+  repo: fontawesome/brands/gitlab
+  # Features
+  features:
+    # Navigation
+    - navigation.instant
+    - navigation.instant.prefetch
+    - navigation.instant.progress
+    - navigation.tracking
+    - navigation.sections
+    - navigation.expand
+    - navigation.path
+    - navigation.prune
+    - navigation.indexes
+    - navigation.top
+    - navigation.footer
+    - navigation.tabs
+    - navigation.tabs.sticky
+
+    # Table of contents
+    - toc.follow
+    - toc.integrate
+
+    # Search
+    - search.suggest
+    - search.highlight
+    - search.share
+
+    # Header
+    - header.autohide
+
+    # Content
+    - content.action.edit
+    - content.action.view
+    - content.code.copy
+    - content.code.select
+    - content.code.annotate
+    - content.tabs.link
+    - content.tooltips
+
+# Plugins
+plugins:
+  - search
+  - minify:
+      minify_html: true
+      minify_js: true
+      minify_css: true
+      htmlmin_opts:
+        remove_comments: true
+
+extra_css:
+  - css/extra.css
+
+markdown_extensions:
+  - abbr
+  - admonition
+  - attr_list
+  - def_list
+  - footnotes
+  - md_in_html
+  - toc:
+      permalink: true
+      title: On this page
+
+  # Python Markdown Extensions
+  - pymdownx.arithmatex:
+      generic: true
+  - pymdownx.betterem:
+      smart_enable: all
+  - pymdownx.caret
+  - pymdownx.mark
+  - pymdownx.tilde
+  - pymdownx.critic
+  - pymdownx.details
+  - pymdownx.emoji:
+      emoji_index: !!python/name:material.extensions.emoji.twemoji
+      emoji_generator: !!python/name:material.extensions.emoji.to_svg
+  - pymdownx.highlight:
+      anchor_linenums: true
+      line_spans: __span
+      pygments_lang_class: true
+  - pymdownx.inlinehilite
+  - pymdownx.keys
+  - pymdownx.mark
+  - pymdownx.smartsymbols
+  - pymdownx.snippets:
+      auto_append:
+        - includes/abbreviations.md
+  - pymdownx.superfences:
+      custom_fences:
+        - name: mermaid
+          class: mermaid
+          format: !!python/name:pymdownx.superfences.fence_code_format
+  - pymdownx.tabbed:
+      alternate_style: true
+      combine_header_slug: true
+      slugify: !!python/object/apply:pymdownx.slugs.slugify
+        kwds:
+          case: lower
+  - pymdownx.tasklist:
+      custom_checkbox: true
+  - pymdownx.blocks.caption
+  - pymdownx.blocks.details
+
+copyright: 'Copyright © 2025 IGT GPU Team . SPDX-License-Identifier: MIT'
-- 
2.51.0

