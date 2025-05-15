Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A62C3ABDD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2E10E953;
	Thu, 15 May 2025 19:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW2BCax2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA4710E953
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338758; x=1778874758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RKUeQ5XfMcqz43tBG4vC0ucHAHToR8axHy8gmz+sGV4=;
 b=SW2BCax2ctjmoBZln4/jdgw+CJ7mqZcMgcsw2RLt9hdoyKfMGoTIvTTL
 vharpqlipvT4+b2/G3pa+PtyRmdA0dVkxCTzY5otdEphwtdVV76TCMC4c
 gk7R2AYycS/VsTYGmrXfhzKyAQ8/shcBTlAUaSVRBMSuWZDNq00Fbrvq8
 CphDOYimTEtmySHzOOPZsVvBcdnSAanNL/0ADwonE2C35nUteyUtUmXX7
 JfHwegbawjOXPp68MA+ISirdYJKKED0Fz/gQeb4S8Kfoe2ajfAu22icWa
 pwzEHhkQPk7plm5xaW+LIyifApF3m1+fRKyUH5XH6bMePd9mv22x9I7GW w==;
X-CSE-ConnectionGUID: oIpxQgGVS4+8eUAp8+qYeQ==
X-CSE-MsgGUID: 0XIKCTKxTzuAd0d684P3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454452"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:38 -0700
X-CSE-ConnectionGUID: g9zDekGYTDySSjwon03inw==
X-CSE-MsgGUID: vIcCV4jLSaGoM5GxjBqq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347346"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:36 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 03/14] tests: Include local igt_glib header for Android
Date: Thu, 15 May 2025 19:51:56 +0000
Message-ID: <20250515195207.106414-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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
 tests/intel/api_intel_bb.c | 4 ++++
 tests/intel/gem_ccs.c      | 4 ++++
 tests/intel/xe_ccs.c       | 4 ++++
 tests/intel/xe_intel_bb.c  | 4 ++++
 tests/testdisplay.h        | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4a1c9be91..a7d257363 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -35,7 +35,11 @@
 #include <errno.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <zlib.h>
 #include "intel_bufops.h"
 #include "i915/gem_vm.h"
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index af1e85f6a..a84a47cc4 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -4,7 +4,11 @@
  */
 
 #include <errno.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index e154bf4dc..bff5b5772 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -4,7 +4,11 @@
  */
 
 #include <errno.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d8bd7b519..25d172301 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -6,7 +6,11 @@
 #include <cairo.h>
 #include <errno.h>
 #include <fcntl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <inttypes.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tests/testdisplay.h b/tests/testdisplay.h
index 27f8209e2..0f606c028 100644
--- a/tests/testdisplay.h
+++ b/tests/testdisplay.h
@@ -24,7 +24,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 extern int drm_fd;
 
-- 
2.34.1

