Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95812C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EBF10ED2B;
	Thu, 22 May 2025 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1tboV8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4910ED2B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924494; x=1779460494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ywYIKW+h87sWk9Cba2YfKNnTM+nP47jDqe7q7L0ccH4=;
 b=D1tboV8+csn/BGMkrDBNU3WmdEOtgTvu6CfQ9GdpL012fcMGMsTkS7sk
 wsWzr0koFcLJPMSUoqmFDq1BnHKf2V8aT52uYF+yEUmOsGYoUl6ceC2ZC
 9s5ZjVPJJyk4K+hDgfwV7m4WywT+oxAZKK4h6Ap5I0uBLaEFyNldrV10S
 uvUuBkcLdrNK0StrN5I2x9dmq+v8bhUrtcHwVvJy1UqW40afnrxFZMLwg
 h6VEgT2ydEvJnETP9OcGgY+guAtJraoYIe7oG1J0anQR8Oe93dNJjYqI3
 lMYy+At3mma279aWJhDHMaLkQjjfi+03FmZ78kohZ1JHAbSmqudDuekV7 w==;
X-CSE-ConnectionGUID: 9f6ukid4R7S07C1oS96/bg==
X-CSE-MsgGUID: 4snV6qqsThWuTVreWFkDzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75351189"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="75351189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:34:54 -0700
X-CSE-ConnectionGUID: ZkQ597IxSh2ohdSQrSKhRw==
X-CSE-MsgGUID: OJbMuwUVQ4iEYSfeceAcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140495562"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:34:52 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v10 5/7] tools: Include local glib header for Android
Date: Thu, 22 May 2025 14:34:17 +0000
Message-ID: <20250522143419.28888-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local glib stub header to
build igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tools/igt_dp_compliance.h | 4 ++++
 tools/intel_pm_rpm.c      | 4 ++++
 tools/lsgpu.c             | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index 5b1688039..226a13662 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -28,7 +28,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 extern int drm_fd;
 
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 9622f0552..c1cc54b82 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <getopt.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index e68390083..6cfbf3142 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <libudev.h>
 #include <string.h>
 #include <signal.h>
-- 
2.49.0

