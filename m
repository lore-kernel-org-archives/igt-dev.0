Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8523C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BFE10EB1B;
	Fri, 16 May 2025 16:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9CEz/tI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DDC10EB19
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411585; x=1778947585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPzGBptsGTFB02YIa5fv+x3rvtyUoU5glg+G/vdORfM=;
 b=J9CEz/tI3eU46XLC4lu+3p9yFyms1ioIALqsV8HTkLYcYXDNftC6j+a/
 vXUOSE1Y3PoZ5R4S0xJtFVbvev1VY1PcrDpLRCwcxvTd2FKuwVQgn7h04
 lSptaAQfjWZto+Md9PcLU7UcXnAoxX6PUr8NFhTIrnkD5bbkkOZjJUYVl
 3h1N/68n2F12uitbK50Ct5W190dMUdIgBADTHE94Qn8L6TnLOUDUcn4Ae
 lm9PsaAbtWk4y+GOpLOeNVuVQDcWBwrJ3X3+jU8fuuBakiAAT6V8fAElO
 5Jt/OKJ7Hzg2oq/Tgmi4gBsn1lTxrJerB10zlk9RdJia0Nq7t76vyuKy6 g==;
X-CSE-ConnectionGUID: ZPA6t1lnSH2/HPQIbLhbNQ==
X-CSE-MsgGUID: GbiWTbPdQguxPdyZe9cm8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941095"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941095"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:24 -0700
X-CSE-ConnectionGUID: AX8ybW8QQz6JrylcUmpDRw==
X-CSE-MsgGUID: UHWchl0iTmSMV7Q8eph6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772470"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:19 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 02/14] lib: Include local igt procps,
 glib and unwind header for Android
Date: Fri, 16 May 2025 16:05:39 +0000
Message-ID: <20250516160551.58760-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

