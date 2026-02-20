Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EAEC56201
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDDA10E7C3;
	Fri, 20 Feb 2026 15:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHnsgL4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C5110E7F5
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599700; x=1803135700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj7SntH57ecIqlKlWgtIbY1JnbIN7FKl2hFUDM9O25g=;
 b=BHnsgL4t+YehjGV8Vu85Gr2+POUi5b5FMp8CZFmAjV5tDqBDTPOnf5Bu
 jx93XtGM85u4Od0VjyeQVT/zIlFeLb5cv/s0IrAoF0QFuiEY7twGXTTLO
 AhBMx4S9ifIowfBj/Qw5RJj6B1V66cIXAgIYcAE+Q6go5qWsHL0XsZeP6
 KZ/eErltsm1IXk2dmSTb0EgK0n0dat705Z2I3AjKOMJSzMVxLoPzzyktq
 OUczyiptR/FGNTu/Qh55kSWvRjVBF63OCo23w+lh3byC+D/XVzMEv0V2F
 VriLwvQvIyWu50skkggjr/Dve0fwqCI8HvkQq1NrDM+2gZ+NNLkzBhMkT A==;
X-CSE-ConnectionGUID: RlXv3glkRT2was7ffSltfw==
X-CSE-MsgGUID: Q9L8eOLmQwC2e7O1ZxXS9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71896960"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="71896960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:40 -0800
X-CSE-ConnectionGUID: qHsP8ruWRoKyg6uT2kaIdg==
X-CSE-MsgGUID: b7KjJSN4TxeTnb8BIvio9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="245456152"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:39 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 1/6] mkdocs.yml: add mkdocs-cdoc and mdx_linkify
Date: Fri, 20 Feb 2026 16:01:55 +0100
Message-ID: <20260220150202.1013804-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220150202.1013804-1-pawel.sikora@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
MIME-Version: 1.0
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

Add mkdocs-cdoc to plugins used for automatic code reference build.
API reference build is split for igt-tests for 'tests' and igt-lib
for 'lib' directories.

Add mdx_linkify to markdown_extensions in mkdocs configuration.
This allows automatic link creation in generated HTML
from markdown files when a URL is provided without
the explicit []() brackets used by default in markdown.

Adjust mkdocs.yml for new API reference generated content.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/requirements-docs.txt |  2 ++
 mkdocs.yml                 | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/docs/requirements-docs.txt b/docs/requirements-docs.txt
index 9a6e5f0be..986ce3e69 100644
--- a/docs/requirements-docs.txt
+++ b/docs/requirements-docs.txt
@@ -1,3 +1,5 @@
 mkdocs
+mkdocs-cdoc==1.0.6
 mkdocs-minify-plugin
 mkdocs-material
+mdx_linkify
diff --git a/mkdocs.yml b/mkdocs.yml
index 0abb76704..99f363307 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -41,7 +41,6 @@ nav:
     - Links to CI for a specific HW platform:
       - Intel GFX CI: https://intel-gfx-ci.01.org
   - Download: 'download.md'
-  - API Reference: 'api_reference/index.html'
   - News: 'NEWS.md'
   - FAQ: 'faq.md'
 
@@ -91,7 +90,6 @@ theme:
 
     # Table of contents
     - toc.follow
-    - toc.integrate
 
     # Search
     - search.suggest
@@ -109,6 +107,9 @@ theme:
     - content.code.annotate
     - content.tabs.link
     - content.tooltips
+    - content.code.copy      # Copy button
+    - content.code.select    # Line selection
+    - content.code.annotate  # Code annotations
 
 # Plugins
 plugins:
@@ -119,11 +120,38 @@ plugins:
       minify_css: true
       htmlmin_opts:
         remove_comments: true
+  - cdoc:
+      project_name: igt-gpu-tools
+      version_file: meson.build
+      parser: "auto"
+      clang_args: ["-Ilib", "-Itests", "-Iinclude"]
+      appendix_code_usages: false
+      custom_index_pages:
+        - docs/api-intro.md
+      sources:
+        - root: lib
+          nav_title: Core API
+          output_dir: api_reference/lib
+          custom_index_pages:
+            - docs/lib-intro.md
+        - root: tests
+          nav_title: Tests API
+          output_dir: api_reference/tests
+          extensions: [".c"]
+          igt:
+            group_by: [category, mega_feature, sub_category, functionality]
+          custom_index_pages:
+            - docs/tests-intro.md
+
+      # Rendering
+      convert_rst: true
+      convert_gtkdoc: true
 
 extra_css:
   - css/extra.css
 
 markdown_extensions:
+  - mdx_linkify
   - abbr
   - admonition
   - attr_list
-- 
2.51.0

