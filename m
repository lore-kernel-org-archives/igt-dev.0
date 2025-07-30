Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB6C87FC9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 08:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A84710E1A4;
	Wed, 30 Jul 2025 08:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4LswNOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F4110E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753865703; x=1785401703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vrf7lyuQ/QQcsk4wwMg55t3VugzW3cYmCyCZJ7uD4LU=;
 b=T4LswNOYtH8DCqsa/qiKC3f0pam1GoEUshBSxpHaVeH+i2uSAhXRicLs
 2ZBc0rfMq9ErLya4cpIerll2d3HYulerKJPNkNORbBZe+2t84dotHUuh/
 YldYMaQ2iKHEE4nwvs3ijoumPRW6jlnloh+tgGfmr7js3A/GoF1EU4qsA
 PQMO63IpOOGwGeJxBEy82ZGUo/EDrURtgRoKFFem35o5m9Mz0FJyIezDu
 we97aEPwtCA3QZo1k5Y3FNs5P8PEYTKLDiy3MfxQ3Xdn8KGhDuLmuK25i
 SLZ2uNNAiMNtl6uJnZkhaFyXEV8vA48wpw71q+Zpw6gLHDaanowJ2W8GL g==;
X-CSE-ConnectionGUID: VdwU0FwyQImjrxSzG4Jk1A==
X-CSE-MsgGUID: uwTflOlNSMiFIMCa+kXgew==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67601252"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67601252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:55:03 -0700
X-CSE-ConnectionGUID: nUHjfQCvRduLTwTyORuSkg==
X-CSE-MsgGUID: jvoH05ykSEONFoATesYAtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162194159"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 01:55:00 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: [PATCH i-g-t 1/3] docs: Set up MkDocs for documentation site
Date: Wed, 30 Jul 2025 10:54:26 +0200
Message-Id: <20250730085428.47298-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730085428.47298-1-pawel.sikora@intel.com>
References: <20250730085428.47298-1-pawel.sikora@intel.com>
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

From: Pawel Sikora <pawel.sikora@linux.intel.com>

This establishes the initial framework configuration
for the IGT GPU Tools documentation site using MkDocs.

 * Add mkdocs.yml for site configuration, including project
   info, navigation, theme, and plugins.
 * Create requirements-docs.txt for MkDocs dependencies.
 * Add extra.css for custom styling with Monokai theme.
 * Include logo and CSS assets.

For details regarding MkDocs please refer to:
https://www.mkdocs.org/

Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
---
 docs/assets/intel_logo.png | Bin 0 -> 34697 bytes
 docs/css/extra.css         | 550 +++++++++++++++++++++++++++++++++++++
 docs/mkdocs.yml            | 221 +++++++++++++++
 docs/requirements-docs.txt |   8 +
 4 files changed, 779 insertions(+)
 create mode 100644 docs/assets/intel_logo.png
 create mode 100644 docs/css/extra.css
 create mode 100644 docs/mkdocs.yml
 create mode 100644 docs/requirements-docs.txt

diff --git a/docs/assets/intel_logo.png b/docs/assets/intel_logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..1667320a025fe73e61d83caa0d5deab6cb1cfd96
GIT binary patch
literal 34697
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

literal 0
HcmV?d00001

diff --git a/docs/css/extra.css b/docs/css/extra.css
new file mode 100644
index 000000000..5c5807e0d
--- /dev/null
+++ b/docs/css/extra.css
@@ -0,0 +1,550 @@
+/* Custom CSS for Prometheus-CLI Documentation - Monokai Theme */
+
+:root {
+  /* Monokai color palette */
+  --monokai-bg: #272822;
+  --monokai-bg-light: #ffffff;
+  --monokai-fg: #f8f8f2;
+  --monokai-comment: #75715e;
+  --monokai-red: #42a5f5; /* changed from #f92672 */
+  --monokai-orange: #fd971f;
+  --monokai-yellow: #e6db74;
+  --monokai-green: #a6e22e;
+  --monokai-cyan: #66d9ef;
+  --monokai-purple: #2196f3; /* changed from #ae81ff */
+
+  /* Material Design integration with Monokai */
+  --md-primary-fg-color: #2196f3; /* blue 500 */
+  --md-primary-fg-color--light: #64b5f6; /* blue 300 */
+  --md-primary-fg-color--dark: #1976d2; /* blue 700 */
+  --md-accent-fg-color: #42a5f5; /* blue 400 */
+
+  /* Monokai gradient colors */
+  --md-gradient-primary: linear-gradient(135deg, #111111 0%, #1142ff 100%);
+  --md-gradient-accent: linear-gradient(135deg, #42a5f5 0%, #1142ff 100%);
+
+  /* Enhanced shadows with Monokai colors */
+  --md-shadow-z1: 0 0.1rem 0.3rem rgba(39, 40, 34, 0.3), 0 0 0.05rem rgba(33, 150, 243, 0.1);
+  --md-shadow-z2: 0 0.2rem 0.6rem rgba(39, 40, 34, 0.4), 0 0.1rem 0.2rem rgba(33, 150, 243, 0.15);
+  --md-shadow-z3: 0 0.3rem 1rem rgba(39, 40, 34, 0.5), 0 0.2rem 0.5rem rgba(33, 150, 243, 0.2);
+}
+
+/* Custom dark theme with specified colors */
+[data-md-color-scheme="slate"] {
+  /* Custom background colors */
+  --md-default-bg-color: #1F2129;
+  --md-default-fg-color: var(--monokai-fg);
+  
+  /* Code styling with custom colors */
+  --md-code-bg-color: #14151A;
+  --md-code-fg-color: var(--monokai-fg);
+  
+  /* Monokai syntax highlighting */
+  --md-code-hl-color: rgba(174, 129, 255, 0.15);
+  --md-code-hl-number-color: var(--monokai-purple);
+  --md-code-hl-special-color: var(--monokai-red);
+  --md-code-hl-function-color: var(--monokai-green);
+  --md-code-hl-constant-color: var(--monokai-purple);
+  --md-code-hl-keyword-color: var(--monokai-red);
+  --md-code-hl-string-color: var(--monokai-yellow);
+  --md-code-hl-name-color: var(--monokai-cyan);
+  --md-code-hl-operator-color: var(--monokai-red);
+  --md-code-hl-punctuation-color: var(--monokai-fg);
+  --md-code-hl-comment-color: var(--monokai-comment);
+  --md-code-hl-generic-color: var(--monokai-fg);
+  --md-code-hl-variable-color: var(--monokai-cyan);
+}
+
+/* Tabs enhancements */
+.md-tabs {
+  background: var(--monokai-bg);
+}
+
+/* Header enhancements */
+.md-header {
+  background: var(--md-gradient-primary);
+  box-shadow: var(--md-shadow-z1);
+  backdrop-filter: blur(8px);
+}
+
+/* Custom header color for dark theme */
+[data-md-color-scheme="slate"] .md-header {
+  background: var(--md-gradient-primary);
+  box-shadow: var(--md-shadow-z1);
+  backdrop-filter: blur(8px);
+}
+
+.md-header__title {
+  font-weight: var(--md-text-font-weight-bold);
+  font-size: 1.1rem;
+}
+
+/* Navigation enhancements */
+.md-nav__title {
+  font-weight: var(--md-text-font-weight-bold);
+  text-transform: uppercase;
+  letter-spacing: 0.5px;
+  font-size: 0.75rem;
+}
+
+.md-nav__item .md-nav__link--active {
+  color: var(--md-accent-fg-color);
+  font-weight: var(--md-text-font-weight-bold);
+}
+
+
+
+/* Content enhancements */
+.md-content {
+  background: linear-gradient(180deg, transparent 0%, rgba(96, 125, 139, 0.02) 100%);
+}
+
+/* Typography improvements */
+.md-typeset h1 {
+  background: var(--md-gradient-accent);
+  background-clip: text;
+  -webkit-background-clip: text;
+  -webkit-text-fill-color: transparent;
+  font-weight: 700;
+  margin-bottom: 1.5rem;
+  line-height: 1.2;
+}
+
+.md-typeset h2 {
+  color: var(--md-accent-fg-color);
+  font-weight: 600;
+  border-bottom: 2px solid var(--md-accent-fg-color);
+  padding-bottom: 0.3rem;
+  margin-top: 2rem;
+  display: flex;
+  align-items: center;
+  gap: 0.75rem;
+}
+
+.md-typeset h2 .twemoji {
+  flex-shrink: 0;
+  width: 1.25rem;
+  height: 1.25rem;
+}
+
+.md-typeset h3 {
+  color: var(--md-accent-fg-color);
+  font-weight: 600;
+}
+
+/* Code block enhancements */
+.md-typeset .highlight {
+  border-radius: 6px;
+  overflow: hidden;
+  box-shadow: var(--md-shadow-z1);
+  border: 1px solid rgba(255, 255, 255, 0.08);
+}
+
+.md-typeset .highlight code {
+  border-radius: 0;
+}
+
+/* Inline code styling - Monokai */
+.md-typeset code {
+  background: var(--monokai-bg);
+  color: var(--monokai-green);
+  padding: 0.1em 0.3em;
+  border-radius: 3px;
+  font-weight: 500;
+  border: 1px solid rgba(174, 129, 255, 0.4);
+}
+
+/* Admonition enhancements */
+.md-typeset .admonition {
+  border-radius: 6px;
+  box-shadow: var(--md-shadow-z1);
+  border: none;
+  overflow: hidden;
+  margin: 1.5rem 0;
+  font-size: 0.7rem;
+}
+
+.md-typeset .admonition > .admonition-title {
+  background: var(--md-gradient-accent);
+  color: white;
+  font-weight: var(--md-text-font-weight-bold);
+  text-transform: uppercase;
+  letter-spacing: 0.5px;
+  font-size: 0.8rem;
+  display: flex;
+  align-items: center;
+  gap: 0.5rem;
+}
+
+.md-typeset .admonition > .admonition-title .twemoji {
+  display: none;
+}
+
+/* Button styling */
+.md-button {
+  background: var(--md-gradient-primary);
+  color: white;
+  border: none;
+  border-radius: 20px;
+  padding: 0.6rem 1.2rem;
+  font-weight: var(--md-text-font-weight-bold);
+  text-transform: uppercase;
+  letter-spacing: 0.3px;
+  transition: all 0.2s ease;
+  box-shadow: var(--md-shadow-z1);
+}
+
+.md-button:hover {
+  transform: translateY(-1px);
+  box-shadow: var(--md-shadow-z2);
+}
+
+.md-button--primary {
+  background: var(--md-gradient-primary);
+}
+
+/* Search enhancements */
+.md-search__form {
+  border-radius: 20px;
+  background: rgba(255, 255, 255, 0.08);
+  backdrop-filter: blur(8px);
+  border: 1px solid rgba(255, 255, 255, 0.15);
+}
+
+.md-search__input {
+  color: white;
+  background: transparent;
+}
+
+.md-search__input::placeholder {
+  color: rgba(255, 255, 255, 0.6);
+}
+
+/* Footer enhancements */
+.md-footer {
+  background: var(--md-default-bg-color);
+  color: white;
+}
+
+.md-footer-meta {
+  background: rgba(0, 0, 0, 0.15);
+}
+
+/* Social links styling */
+.md-social {
+  display: flex;
+  gap: 0.5rem;
+}
+
+.md-social__link {
+  background: rgba(255, 255, 255, 0.08);
+  border-radius: 50%;
+  padding: 0.5rem;
+  transition: all 0.2s ease;
+}
+
+.md-social__link:hover {
+  background: rgba(255, 255, 255, 0.15);
+  transform: translateY(-1px);
+}
+
+/* Table enhancements */
+.md-typeset table:not([class]) {
+  border-radius: 6px;
+  overflow: hidden;
+  box-shadow: var(--md-shadow-z1);
+}
+
+.md-typeset table:not([class]) th {
+  background: var(--md-gradient-primary);
+  color: white;
+  font-weight: var(--md-text-font-weight-bold);
+  text-transform: uppercase;
+  letter-spacing: 0.5px;
+  font-size: 0.8rem;
+}
+
+/* Progress bar enhancement */
+.md-progress {
+  background: var(--md-gradient-primary);
+  height: 2px;
+}
+
+/* Tooltips enhancement */
+.md-tooltip {
+  background: var(--md-gradient-primary);
+  border-radius: 6px;
+  box-shadow: var(--md-shadow-z2);
+  border: 1px solid rgba(255, 255, 255, 0.1);
+}
+
+/* Custom animations - more subtle */
+@keyframes fadeInUp {
+  from {
+    opacity: 0;
+    transform: translateY(20px);
+  }
+  to {
+    opacity: 1;
+    transform: translateY(0);
+  }
+}
+
+.md-content__inner {
+  animation: fadeInUp 0.4s ease-out;
+}
+
+/* Scroll behavior */
+html {
+  scroll-behavior: smooth;
+}
+
+/* Selection color */
+::selection {
+  background: var(--md-accent-fg-color);
+  color: white;
+}
+
+/* Custom scrollbar for webkit browsers */
+::-webkit-scrollbar {
+  width: 6px;
+}
+
+::-webkit-scrollbar-track {
+  background: rgba(0, 0, 0, 0.05);
+}
+
+::-webkit-scrollbar-thumb {
+  background: var(--md-gradient-primary);
+  border-radius: 3px;
+}
+
+::-webkit-scrollbar-thumb:hover {
+  background: var(--md-primary-fg-color--dark);
+}
+
+/* Grid cards enhancement - more subtle */
+.md-typeset .grid.cards > ol > li,
+.md-typeset .grid.cards > ul > li {
+  border-radius: 8px;
+  background: linear-gradient(135deg, rgba(96, 125, 139, 0.03) 0%, rgba(120, 144, 156, 0.03) 100%);
+  border: 1px solid rgba(38, 198, 218, 0.15);
+  box-shadow: var(--md-shadow-z1);
+  transition: all 0.2s ease;
+  overflow: hidden;
+}
+
+.md-typeset .grid.cards > ol > li:hover,
+.md-typeset .grid.cards > ul > li:hover {
+  transform: translateY(-2px);
+  box-shadow: var(--md-shadow-z2);
+  border-color: var(--md-accent-fg-color);
+}
+
+.md-typeset .grid.cards > ol > li > hr,
+.md-typeset .grid.cards > ul > li > hr {
+  border-color: rgba(38, 198, 218, 0.2);
+  margin: 1rem 0;
+}
+
+/* Enhanced icon styling in cards */
+.md-typeset .grid.cards .twemoji.lg {
+  background: var(--md-gradient-primary);
+  border-radius: 50%;
+  padding: 1rem;
+  color: white;
+  box-shadow: var(--md-shadow-z1);
+}
+
+/* Feature section styling */
+.md-typeset h3 {
+  display: flex;
+  align-items: center;
+  gap: 0.75rem;
+  margin-top: 2rem;
+  margin-bottom: 1rem;
+}
+
+.md-typeset h3 .twemoji {
+  background: var(--md-gradient-accent);
+  border-radius: 50%;
+  padding: 0.4rem;
+  color: white;
+  flex-shrink: 0;
+  width: 1.5rem;
+  height: 1.5rem;
+  display: inline-flex;
+  align-items: center;
+  justify-content: center;
+}
+
+/* Enhanced quote styling */
+.md-typeset .admonition.quote {
+  background: linear-gradient(135deg, rgba(96, 125, 139, 0.08) 0%, rgba(120, 144, 156, 0.08) 100%);
+  border-left: 4px solid var(--md-accent-fg-color);
+}
+
+/* Tabbed content enhancement */
+.md-typeset .tabbed-set {
+  border-radius: 6px;
+  overflow: hidden;
+  box-shadow: var(--md-shadow-z1);
+}
+
+.md-typeset .tabbed-labels {
+  background: var(--md-gradient-primary);
+}
+
+.md-typeset .tabbed-labels > label {
+  color: rgba(255, 255, 255, 0.8);
+  font-weight: var(--md-text-font-weight-bold);
+  text-transform: uppercase;
+  letter-spacing: 0.5px;
+  font-size: 0.8rem;
+}
+
+.md-typeset .tabbed-labels > label:hover {
+  color: white;
+  background: rgba(255, 255, 255, 0.08);
+}
+
+.md-typeset .tabbed-set input:checked + label {
+  color: white;
+  background: rgba(255, 255, 255, 0.15);
+}
+
+/* Code block in tabs */
+.md-typeset .tabbed-content .highlight {
+  margin: 0;
+  border-radius: 0;
+}
+
+/* Enhanced info admonition */
+.md-typeset .admonition.info {
+  background: linear-gradient(135deg, rgba(96, 125, 139, 0.08) 0%, rgba(120, 144, 156, 0.08) 100%);
+  border: 1px solid rgba(96, 125, 139, 0.2);
+}
+
+.md-typeset .admonition.info > .admonition-title {
+  margin-bottom: 10px;
+  background: var(--md-gradient-primary);
+}
+
+/* Enhanced tip admonition */
+.md-typeset .admonition.tip {
+  background: linear-gradient(135deg, rgba(76, 175, 80, 0.08) 0%, rgba(139, 195, 74, 0.08) 100%);
+  border: 1px solid rgba(76, 175, 80, 0.2);
+}
+
+.md-typeset .admonition.tip > .admonition-title {
+  background: linear-gradient(135deg, #4caf50 0%, #8bc34a 100%);
+}
+
+/* Horizontal rule styling */
+.md-typeset hr {
+  border: none;
+  height: 1px;
+  background: var(--md-gradient-primary);
+  margin: 2rem 0;
+  border-radius: 1px;
+}
+
+/* List enhancement */
+.md-typeset ul {
+  list-style: none;
+  padding-left: 0;
+}
+
+.md-typeset ul > li {
+  position: relative;
+  padding-left: 2rem;
+  margin-bottom: 0.5rem;
+}
+
+.md-typeset ul > li::before {
+  content: "▶";
+  position: absolute;
+  left: 0;
+  color: var(--md-accent-fg-color);
+  font-weight: bold;
+}
+
+/* Code inline enhancement for project structure */
+.md-typeset pre code {
+  color: var(--md-code-fg-color);
+  background: transparent;
+  border: none;
+  padding: 0;
+}
+
+/* Responsive enhancements */
+@media screen and (max-width: 76.25em) {
+  .md-nav--primary .md-nav__title[for="__drawer"] {
+    background: var(--md-gradient-primary);
+    color: white;
+  }
+}
+
+/* Print styles */
+@media print {
+  .md-header,
+  .md-tabs,
+  .md-nav,
+  .md-footer {
+    display: none !important;
+  }
+  
+  .md-content {
+    margin: 0 !important;
+  }
+} 
+
+/* Hover-activated dropdown tabs for Material for MkDocs */
+.md-tabs__item--active {
+  position: relative;
+}
+
+.md-tabs__item--active:hover .md-tabs__link + .md-tabs__dropdown {
+  display: block;
+  opacity: 1;
+  pointer-events: auto;
+  transform: scale(1);
+}
+
+.md-tabs__dropdown {
+  display: none;
+  position: absolute;
+  top: 100%;
+  left: 0;
+  min-width: max-content;
+  background: var(--md-default-bg-color);
+  border-radius: 4px;
+  box-shadow: var(--md-shadow-z2);
+  z-index: 999;
+  padding: 0.5rem 0;
+  opacity: 0;
+  pointer-events: none;
+  transition: opacity 0.2s ease, transform 0.2s ease;
+  transform: translateY(0.5rem);
+}
+
+.md-tabs__dropdown a {
+  display: block;
+  padding: 0.4rem 1.2rem;
+  color: var(--md-default-fg-color);
+  text-decoration: none;
+  white-space: nowrap;
+}
+
+.md-tabs__dropdown a:hover {
+  background-color: rgba(255, 255, 255, 0.05);
+}
+
+/* Optional: Smooth dropdown animation and styling */
+.md-tabs__dropdown {
+  transition: opacity 0.2s ease, transform 0.2s ease;
+  transform: translateY(0.5rem);
+  border-radius: 4px;
+  box-shadow: var(--md-shadow-z2);
+  background: var(--md-default-bg-color);
+}
diff --git a/docs/mkdocs.yml b/docs/mkdocs.yml
new file mode 100644
index 000000000..38b5a3330
--- /dev/null
+++ b/docs/mkdocs.yml
@@ -0,0 +1,221 @@
+# Project information
+site_name: "IGT GPU Tools"
+site_description: 'Documentation about IGT GPU Tools'
+site_author: 'IGT Team'
+site_url: 'https://drm.pages.freedesktop.org/igt-gpu-tools'
+docs_dir: '.'
+site_dir: '../site'
+# Repo information
+repo_name: 'igt-gpu-tools'
+repo_url: 'https://gitlab.freedesktop.org/drm/igt-gpu-tools'
+
+
+# Navigation bar
+nav:
+        - Overview: 
+          - How to start: 'overview.md'
+        - Installation:
+          - How to install: 'building.md'
+        - Usage:
+          - How to run tests: 'running_tests.md'
+        - Code:
+          - How to use the code: 'api.md'
+          - How to track/submit changes: 'patchwork.md'
+        - Contributing:
+          - How to contribute: 'CONTRIBUTING.md'
+          - How to document tests: 'test_documentation.md'
+          - How to get code coverage: 'code_coverage.md'
+          - Maintainers: 'MAINTAINERS.md'
+        - Issues: 'https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues'
+        - CI (Intel Xe): 'https://intel-gfx-ci.01.org/tree/intel-xe/index.html'
+        - Download: 'https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/releases'
+        - API Reference: 'api_reference/index.html'
+        - News: 'NEWS.md'
+        - FAQ: 'faq.md'
+
+extra:
+  repo_icon: 'gitlab'
+
+# Theme
+theme:
+  name: material
+  logo: assets/intel_logo.png
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
+  - mike:
+      # These fields are all optional; the defaults are as below...
+      alias_type: symlink
+      redirect_template: null
+      deploy_prefix: ''
+      canonical_version: null
+      version_selector: true
+      css_dir: css
+      javascript_dir: js
+  - same-dir
+  - search
+  - minify:
+      minify_html: true
+      minify_js: true
+      minify_css: true
+      htmlmin_opts:
+        remove_comments: true
+  - mermaid2:
+        arguments:
+          theme: 'dark'
+          lineColor: 0xfffff
+  - git-latest-changes:
+        limit_to_docs_dir: True
+        repo_vendor: gitlab
+        enabled_on_serve: True
+        history_limit: 5
+        timestamp_format: "%Y-%m-%d %H:%M"
+        table_features:
+          - "page_path_link"
+          - "timestamp"
+          - "author"
+          - "message"
+  - git-authors:
+        show_contribution: true
+        show_line_count: false
+
+extra:
+  # Analytics
+  analytics:
+    provider: google
+    property: !ENV GOOGLE_ANALYTICS_KEY
+
+  # Version/Language selector
+  alternate:
+    - name: English
+      link: /en/
+      lang: en
+  
+  # Generator info
+  generator: false
+
+extra_css:
+  - css/extra.css
+
+extra_javascript:
+  - javascripts/mathjax.js
+  - js/extra.js
+  - https://polyfill.io/v3/polyfill.min.js?features=es6
+  #- https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js
+  #- https://cdn.tailwindcss.com
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
+  - pymdownx.magiclink:
+      normalize_issue_symbols: true
+      repo_url_shorthand: true
+      user: berkay
+      repo: prometheus-cli
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
+copyright: 'Copyright Intel, 2025 , made by IGT Team'
diff --git a/docs/requirements-docs.txt b/docs/requirements-docs.txt
new file mode 100644
index 000000000..e00979e3c
--- /dev/null
+++ b/docs/requirements-docs.txt
@@ -0,0 +1,8 @@
+mkdocs
+mkdocs-minify-plugin
+mkdocs-same-dir
+mkdocs-material
+mkdocs-mermaid2-plugin
+mkdocs-git-authors-plugin
+mkdocs-git-latest-changes-plugin
+mike
-- 
2.34.1

