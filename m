Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CC9C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4510E76B;
	Thu, 29 May 2025 17:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFzfHAGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6228D10E0BC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748538803; x=1780074803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=deSgOyq3oL+4dkBX5zEss4A/EymZCcZSNU3P6ZI7arI=;
 b=dFzfHAGsFIzxE4tTp1J2N8C+weJx7+MjtWKqbnDW+Z/qGq67BbgNZ5ol
 af3NzWIVUfPnCM+vI4u7XNI+60x1ejwIezEJNPfdamCFR4mwZ1Hu+ZNkN
 ZKdaT6Lj0pbv8+JfYgT8PUv4KcWoT5GO6HUKQDKp7mRSMu8VmH83M5SKb
 nPy0dShm6vgSnbzaRCPQM97S55D/q6X1nrl85hJNn+Ayf1IfWYcPfjgkV
 BxD7AjnRKASBUawmw0UUsHU5gf2igBxGjQvucXS8lt8YhGmAqAJEDA8VU
 gfzxqY59l3T/pEO+4uYvt8y13I+JWNtU0wI8VbKNxFbUmAhLtIxntNCcA g==;
X-CSE-ConnectionGUID: YcA5hCvuQ9+Hcq30O0Vqmg==
X-CSE-MsgGUID: uoVcuW0eS7+/bpEHvVHp/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62016798"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62016798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:13:23 -0700
X-CSE-ConnectionGUID: iHcpinTKQ1ywvbEEvdBt8Q==
X-CSE-MsgGUID: h5zsrRMESjeWuoGrbiC80w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143537966"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 29 May 2025 10:13:20 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v11 2/7] lib: Include local igt procps,
 glib header for Android
Date: Thu, 29 May 2025 17:12:41 +0000
Message-ID: <20250529171246.74375-3-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
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

As procps, glib are not available in Android, added local stub
procps, glib headers to build igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_aux.c           | 6 +++++-
 lib/igt_chamelium.c     | 4 ++++
 lib/igt_core.c          | 4 ++++
 lib/igt_rc.h            | 4 ++++
 lib/intel_batchbuffer.c | 4 ++++
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 2905824a5..92adcf70b 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -55,10 +55,14 @@
 
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
-#else
+#elif HAVE_LIBPROC2
 #  include <libproc2/pids.h>
 #endif
 
+#ifdef ANDROID
+#include "android/procps.h"
+#endif
+
 #include <dirent.h>
 #ifdef __linux__
 #  include <libudev.h>
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
index b06cdfd89..c2674a272 100644
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
index 03ce65ded..af0547281 100644
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

