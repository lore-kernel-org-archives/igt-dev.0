Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E44C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B073210EB6A;
	Fri, 16 May 2025 18:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX2oYQtL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319BF10EB6A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747420055; x=1778956055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jjzniqzIzk7EhvpHPUEVdR3UnqX1TSJJykh+UHvDuko=;
 b=EX2oYQtL48fl949kUQ9Jif7HYZe9Q7tJ7pbpRI8KfhWfDiaHAVRelk0Z
 2qlu//rsYKt6QJhJUPeVflR6VHRW0c03hnplHxi11CVLy5rl14wXh1EHJ
 EpBmanMPeViC2eOSzRRGSjKz+D2zJNzy4Zir4MLs46fKBl04l0VAr0nVq
 lApiB9JyGipLe9CavQRCyWg0JE1+KntQjRA/zT33d6mPU7GIzTbhylaBQ
 A0lcprh8rn5c3YCH/3/ter5EgjJAvsAE2MPkxooY7XlPs5zipN5OYFm64
 Zk1/+/1DDh59RebO1978ZXgy0YucllsDNb6i30ytTPRiqPZk6Ept4K9ha g==;
X-CSE-ConnectionGUID: BJ570OJITpKMiGPRh+t+JA==
X-CSE-MsgGUID: 0eMxGyFNQJCRgfiJfJQdPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60059844"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60059844"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:27:35 -0700
X-CSE-ConnectionGUID: WpkKs/RZR0eIaphyrHhbBQ==
X-CSE-MsgGUID: zYmr84DtQvaI7LO79NWT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143736886"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa004.jf.intel.com with ESMTP; 16 May 2025 11:27:32 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com, adrinael@adrinael.net,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v8 03/14] tests: Include local glib header for Android
Date: Fri, 16 May 2025 18:26:53 +0000
Message-ID: <20250516182704.97912-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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
2.49.0

