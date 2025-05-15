Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5AC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A3010E951;
	Thu, 15 May 2025 19:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+9gPyLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BFF10E959
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338763; x=1778874763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ljeV+xZApu8/kIkLxo81vSsilYSYSWad0TmCtlONLug=;
 b=f+9gPyLGmCAMXseB0ED92ZlYl75cn7RgJbkEOfNmxagfbK+JSbGblywc
 7RUgCrPULvxNYLEraXYqvPf0OhJbFE9weZy2CDUDxeOkquHZTqGLlc0hn
 Nt0x9D1sztj2Pd3eYtmqvtoNspLd4mBfnrv6FnPH1mKUT0NRG8GrVJgrH
 sKhxfGzhOKU0YCiw7mqq2DiYMNP3wt7J79UnQqFR4/nsfEpGsOycMXThi
 XpXEwAAC6qBKp6arm+BuYfghCPMDhq9uTQazqwKbScjb6fJgdILxAcamQ
 +GeI/ukw3y+9ES8beP4sHAjDPzXQTBFLjKqP1Chp+8+E465OJSyhDFpYn A==;
X-CSE-ConnectionGUID: u5VpWkXOToWmjBxf0DNscg==
X-CSE-MsgGUID: +VSnJM4rQz6TrDHgDMJbug==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454459"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454459"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:43 -0700
X-CSE-ConnectionGUID: +EdkhEgiRdWEDTcS35ybDw==
X-CSE-MsgGUID: aK3F6dOvTEKtKDcaz/hGUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347356"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:41 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 05/14] tools: Include local igt_glib header for Android
Date: Thu, 15 May 2025 19:51:58 +0000
Message-ID: <20250515195207.106414-6-jeevaka.badrappan@intel.com>
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
2.34.1

