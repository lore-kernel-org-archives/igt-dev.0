Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A4C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9833B10E851;
	Wed,  7 May 2025 16:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/7Gqg/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908B10E851
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633879; x=1778169879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NA5pLBmhIj0LLrZphz74Rla4ZSKwKd/CQhc+ED7yf5I=;
 b=f/7Gqg/yIBRIYncNJEo7WU9doi23tQUwlWWFUyrPA0BgBOn5DObfc8Gn
 EdHps4zunhpvslqYFzYS77lWJsIwmKzAm4CJz1dXpB8qkF2lblosn1Gg4
 mkkJh7r/OBaH+ybt9E1Mrv4qgsuNq8o5NYtQaR+mKfpBaG9STFOIxNp8B
 pIYI/CRczh5Ip/WVNMS8SyaXH3DNtzVQPUPAf/NquE/D/aDYMBRlF09e4
 W7A3adkdOFnadolwOaIVHZo4kZ+ajuykbbE0JjpXcXqzlMxx4DMzWi4DE
 EsrW56jyAvxmy8mBlfZNJsy/h7tbRtkKZmO/wvTeNrAZtHnicmF4IKh7G g==;
X-CSE-ConnectionGUID: oYzmjC09SMq+zcfsAxvn1g==
X-CSE-MsgGUID: cr13iQxATUWJpq7Vfqyvqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519158"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:32 -0700
X-CSE-ConnectionGUID: m2xtTeStT2+6HHLIL5jmNw==
X-CSE-MsgGUID: XcMlG5znTyu27osat18+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200708"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:30 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 02/15] lib: Include local igt procps,
 glib and unwind header for Android
Date: Wed,  7 May 2025 16:01:35 +0000
Message-ID: <20250507160148.53857-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_aux.c           | 4 ++++
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 8 ++++++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 5 files changed, 24 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..d8f76137b 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -53,11 +53,15 @@
 #include <assert.h>
 #include <grp.h>
 
+#ifndef ANDROID
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
 #else
 #  include <libproc2/pids.h>
 #endif
+#else
+#include "igt_procps.h"
+#endif
 
 #include <dirent.h>
 #ifdef __linux__
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a96e36b5b..de7649170 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -33,7 +33,11 @@
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>
 #include <pthread.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 #include <pixman.h>
 #include <cairo.h>
 
diff --git a/lib/igt_core.c b/lib/igt_core.c
index e1061a2ed..6c89e136b 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -55,7 +55,11 @@
 #include <limits.h>
 #include <locale.h>
 #include <uwildmat/uwildmat.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 
 #include "drmtest.h"
 #include "i915/gem_create.h"
@@ -82,7 +86,11 @@
 #include "runnercomms.h"
 
 #define UNW_LOCAL_ONLY
+#ifndef ANDROID
 #include <libunwind.h>
+#else
+#include "igt_unwind.h"
+#endif
 #include <elfutils/libdwfl.h>
 
 #ifdef HAVE_LIBGEN_H
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index 53e5ce669..9811d0408 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -25,7 +25,11 @@
 #ifndef IGT_RC_H
 #define IGT_RC_H
 
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 
 extern GKeyFile *igt_key_file;
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..497fe0e08 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -26,7 +26,11 @@
  **************************************************************************/
 
 #include <search.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 
 #include "gpgpu_fill.h"
 #include "huc_copy.h"
-- 
2.34.1

