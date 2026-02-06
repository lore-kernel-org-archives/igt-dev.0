Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A8AECD9B0
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 01:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677110E20D;
	Fri,  6 Feb 2026 01:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6gFvbMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556B10E211
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 01:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770339964; x=1801875964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MCEL5uVKSd8eKAmQkITddYUOCg+mrS9eB2tLLe0pU8Q=;
 b=B6gFvbMoveUH+zta/YwH8qhbgGKLqeJkrCiuXT5k1xM87FXm3q6PvAMA
 6lHh7kv3U2EvZvcQtGOBUO+vADo7C7Qal3+ASlD5kWweRuCX4s25aO4zx
 nrcNes0ULr8b53pQ50EJycyo2zR4znS+zqoYnB9uLNpEdKYrw5euHqlDU
 mc3dsu7mt6YGEF0AbgsiqdAhEQhFa7eGF/Z4DtW6b3siDBrb0f1pJ4H0X
 NCl5v1R7CvBF9QGNTH40iuJxMRuXrV9WEEDbYMPOuqtQOaDOnCRiayiKC
 KtnRr5yOKQKjHAMrSOQsQT5Z73TCPWwKXWisI/TKvm4qUoRq6kFA6k3IO w==;
X-CSE-ConnectionGUID: 2O68d42JR5WGsN0aJeRUTw==
X-CSE-MsgGUID: DzUfflq6S8Snmi3q0V67WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82919025"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82919025"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:04 -0800
X-CSE-ConnectionGUID: 27aAOxVbQIScOlErz1B1tg==
X-CSE-MsgGUID: PF9l1oeFSZehPImA4JLRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210115680"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.188])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 17:06:03 -0800
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 1/4] mkdocs.yml: add mkdoxy and mdx_linkify
Date: Fri,  6 Feb 2026 02:05:48 +0100
Message-ID: <20260206010551.267237-2-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206010551.267237-1-pawel.sikora@intel.com>
References: <20260206010551.267237-1-pawel.sikora@intel.com>
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

Add mkdoxy to plugins used for automatic code reference build.
API reference build is split for igt-tests for 'tests' and igt-lib
for 'lib' directories.

Add mdx_linkify to markdown_extensions in mkdocs configuration.
This allows automatic link creation in generated HTML
from markdown files when a URL is provided without
the explicit []() brackets used by default in markdown.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/api.md                |  2 ++
 docs/requirements-docs.txt |  2 ++
 mkdocs.yml                 | 61 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/docs/api.md b/docs/api.md
index fdc70cd4b..2a35adfcf 100644
--- a/docs/api.md
+++ b/docs/api.md
@@ -27,3 +27,5 @@ Helper modules for:
 ##  Examples
 
 For code examples, browse the `tests/` and `lib/` directories.
+
+[DMABUF Sync File](../igt-lib/dmabuf__sync__file_8c/index.html) - DMABUF importing/exporting fencing support library
diff --git a/docs/requirements-docs.txt b/docs/requirements-docs.txt
index 9a6e5f0be..19687e9fa 100644
--- a/docs/requirements-docs.txt
+++ b/docs/requirements-docs.txt
@@ -1,3 +1,5 @@
 mkdocs
 mkdocs-minify-plugin
 mkdocs-material
+mkdoxy
+mdx_linkify
diff --git a/mkdocs.yml b/mkdocs.yml
index 0abb76704..f511aeb95 100644
--- a/mkdocs.yml
+++ b/mkdocs.yml
@@ -44,6 +44,52 @@ nav:
   - API Reference: 'api_reference/index.html'
   - News: 'NEWS.md'
   - FAQ: 'faq.md'
+  - API:
+    - 'api_reference.md'
+    - igt-tests:
+      - Links: "igt-tests/links.md"
+      - Classes:
+        - Class List: "igt-tests/annotated.md"
+        - Class Index: "igt-tests/classes.md"
+        - Class Hierarchy: "igt-tests/hierarchy.md"
+        - Class Members: "igt-tests/class_members.md"
+        - Class Member Functions: "igt-tests/class_member_functions.md"
+        - Class Member Variables: "igt-tests/class_member_variables.md"
+        - Class Member Typedefs: "igt-tests/class_member_typedefs.md"
+        - Class Member Enumerations: "igt-tests/class_member_enums.md"
+      - Namspaces:
+        - Namigt-testsace List: "igt-tests/namigt-testsaces.md"
+        - Namigt-testsace Members: "igt-tests/namigt-testsace_members.md"
+        - Namigt-testsace Member Functions: "igt-tests/namigt-testsace_member_functions.md"
+        - Namigt-testsace Member Variables: "igt-tests/namigt-testsace_member_variables.md"
+        - Namigt-testsace Member Typedefs: "igt-tests/namigt-testsace_member_typedefs.md"
+        - Namigt-testsace Member Enumerations: "igt-tests/namigt-testsace_member_enums.md"
+      - Functions: "igt-tests/functions.md"
+      - Variables: "igt-tests/variables.md"
+      - Macros: "igt-tests/macros.md"
+      - Files: "igt-tests/files.md"
+    - igt-lib:
+      - Links: "igt-lib/links.md"
+      - Classes:
+        - Class List: "igt-lib/annotated.md"
+        - Class Index: "igt-lib/classes.md"
+        - Class Hierarchy: "igt-lib/hierarchy.md"
+        - Class Members: "igt-lib/class_members.md"
+        - Class Member Functions: "igt-lib/class_member_functions.md"
+        - Class Member Variables: "igt-lib/class_member_variables.md"
+        - Class Member Typedefs: "igt-lib/class_member_typedefs.md"
+        - Class Member Enumerations: "igt-lib/class_member_enums.md"
+      - Namspaces:
+        - Namigt-testsace List: "igt-lib/namigt-testsaces.md"
+        - Namigt-testsace Members: "igt-lib/namigt-testsace_members.md"
+        - Namigt-testsace Member Functions: "igt-lib/namigt-testsace_member_functions.md"
+        - Namigt-testsace Member Variables: "igt-lib/namigt-testsace_member_variables.md"
+        - Namigt-testsace Member Typedefs: "igt-lib/namigt-testsace_member_typedefs.md"
+        - Namigt-testsace Member Enumerations: "igt-lib/namigt-testsace_member_enums.md"
+      - Functions: "igt-lib/functions.md"
+      - Variables: "igt-lib/variables.md"
+      - Macros: "igt-lib/macros.md"
+      - Files: "igt-lib/files.md"
 
 extra:
   repo_icon: 'gitlab'
@@ -119,11 +165,26 @@ plugins:
       minify_css: true
       htmlmin_opts:
         remove_comments: true
+  - mkdoxy:
+      projects:
+        igt-tests: # name of project must be alphanumeric + numbers (without spaces)
+          src-dirs: tests # path to source code (support multiple paths separated by space) => INPUT
+          full-doc: True # if you want to generate full documentation
+          doxy-cfg: # standard doxygen configuration (key: value)
+            FILE_PATTERNS: "*.c* *.h*" # specify file patterns to filter out
+            RECURSIVE: True # recursive search in source directories
+        igt-lib: # name of project must be alphanumeric + numbers (without spaces)
+          src-dirs: lib lib/i915 # path to source code (support multiple paths separated by space) => INPUT
+          full-doc: True # if you want to generate full documentation
+          doxy-cfg: # standard doxygen configuration (key: value)
+            FILE_PATTERNS: "*.c* *.h*" # specify file patterns to filter out
+            RECURSIVE: No # recursive search in source directories
 
 extra_css:
   - css/extra.css
 
 markdown_extensions:
+  - mdx_linkify
   - abbr
   - admonition
   - attr_list
-- 
2.51.0

