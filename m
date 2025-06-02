Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347ABC5B559
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4410E589;
	Mon,  2 Jun 2025 19:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bL4azKWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C914810E589
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892365; x=1780428365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VM6Y8mXVaKU3qPDconY+kIMyu/4qsQW5eQaCCs8shfw=;
 b=bL4azKWUGlXwFJIHBa4QL7x34pAR9KdNlsIcpI/dNcR2szt4Du6HGULf
 MRLEoji9c+PBCZ4ZzOEDd4YF/hErzsklLXFniqYoPx6DqGbkbOgLTWeKb
 qJURIhihLLLdBH5Fp+1bbCmlmyVTUNFb73Tt4TX0iFxvW3EJzQWN3o0WD
 7fuaIwhfW7A8LQ4tiGn0i4+8qIDVmyy7BqJHdKHaKn03Hxf6xZyW3TOIt
 A1G++jN0UJriGp7IiWUGeObGYcz+jJvMtdcBW/moFS2ea25UaxskiF/tW
 GZaT83Vq1WKRocyHYjReq3djnH8BOXzHWdo8jjzPWG87AYMDWOlKzj72c w==;
X-CSE-ConnectionGUID: yX8fT+lSSFSWrN/LBBMDGg==
X-CSE-MsgGUID: ItVk0stkTyy47W++4jjrEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777112"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:26:05 -0700
X-CSE-ConnectionGUID: mZlluaMGQeufXwYIsUvGug==
X-CSE-MsgGUID: upjtcYIHTZmyaQCiHRxFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590231"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:26:02 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 06/11] tests/intel: Include local glib header for
 Android
Date: Mon,  2 Jun 2025 19:25:10 +0000
Message-ID: <20250602192515.95309-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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
 4 files changed, 16 insertions(+)

diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 13b1091d8..30bc8a774 100644
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
index ef95b4a2a..95a49af6d 100644
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
-- 
2.49.0

