Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221DCC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88E010EB4B;
	Fri, 16 May 2025 17:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IT1ClgaL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7860710EB4B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415538; x=1778951538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPzGBptsGTFB02YIa5fv+x3rvtyUoU5glg+G/vdORfM=;
 b=IT1ClgaLv8/Dy2Yjm5+sTY8ncFvaHZEMdKo7TKJqS4Q8VrACyH+dSEdN
 q4WaRhZ+G4L+k7de74fI/CwFYGDTqQE8bIhfrApw+8TxHrUuKgT1vDIcw
 Qu35gN2AeAmzxgrI/XB9WACnaXDWr+vzeS7slX3bf+IDX1OPcEC71thhP
 piB1ditDKnXE8mqouRuZ1LKZvT5hzy1nC4Wratgx5M8xKDUsw/DpZvxfr
 7kYuI64ZIOXQ5zsJaO7YidhW28EG1dr3zUJbVuk2eCqkVbOp6G+lff9oC
 wFBjWtoV9sUwcyTWVJP/nT7nG0E8NjRK8dCgTR/MnZ7ce1Wux8G4yEau/ w==;
X-CSE-ConnectionGUID: TTLD52X7SBCsj38OZFElnA==
X-CSE-MsgGUID: yMrEXWxmRPm0MwetU3GJIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297064"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:17 -0700
X-CSE-ConnectionGUID: /kzzO79HQeaOZRfPzmNnUg==
X-CSE-MsgGUID: V2bbLWE0SJOa0KY7F9czEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793458"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:15 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 02/14] lib: Include local igt procps,
 glib and unwind header for Android
Date: Fri, 16 May 2025 17:11:41 +0000
Message-ID: <20250516171153.74079-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_aux.c           | 4 ++++
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 8 ++++++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 5 files changed, 24 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..3eca09cd9 100644
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
+#include "android/procps.h"
+#endif
 
 #include <dirent.h>
 #ifdef __linux__
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a96e36b5b..d19a78ffa 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -33,7 +33,11 @@
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>
 #include <pthread.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 #include <pixman.h>
 #include <cairo.h>
 
diff --git a/lib/igt_core.c b/lib/igt_core.c
index e1061a2ed..1d7402cb7 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -55,7 +55,11 @@
 #include <limits.h>
 #include <locale.h>
 #include <uwildmat/uwildmat.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 #include "drmtest.h"
 #include "i915/gem_create.h"
@@ -82,7 +86,11 @@
 #include "runnercomms.h"
 
 #define UNW_LOCAL_ONLY
+#ifndef ANDROID
 #include <libunwind.h>
+#else
+#include "android/unwind.h"
+#endif
 #include <elfutils/libdwfl.h>
 
 #ifdef HAVE_LIBGEN_H
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index 53e5ce669..d871b3b26 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -25,7 +25,11 @@
 #ifndef IGT_RC_H
 #define IGT_RC_H
 
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 extern GKeyFile *igt_key_file;
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..caf142949 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -26,7 +26,11 @@
  **************************************************************************/
 
 #include <search.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "android/glib.h"
+#endif
 
 #include "gpgpu_fill.h"
 #include "huc_copy.h"
-- 
2.49.0

