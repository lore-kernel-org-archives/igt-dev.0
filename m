Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E9CF8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566910E84B;
	Thu, 16 Apr 2026 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASwZZeqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EBC10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331601; x=1807867601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0XnPGCevIswK6XpFLCkQqonUQZdiKD219or28ib20s8=;
 b=ASwZZeqrPPjD3xwMRWkhCEL6VZCrQFCp0SVH5TjVC1Lef3X0czOv+6nn
 hZJgLoZm2SVxvvLELuxFKMKrvgRQpuFU1XhPJ67a+xgoYKkTeIf/nKf5m
 hi0uWdhUQ0rrQS7n5WjZKu6IBFW8+fcsDIB9YFtmwmG4Av1FloMA7dUVv
 lu0iDeuu+KW8/yfDa4Gum+FVkt3/b28euIm13bnUcJV0Z/5tQcWWzHz61
 t4or6ezkoL+Q0mwRu/rB8f3UZswjUtY8g7Mg7CFhiX4Un3gVrwvWz2Vfn
 19anE6Qm3QuL6n08XnVLnGLnGJtscdKtBPK12Cz1JMFdMTFt3tleY/HbY w==;
X-CSE-ConnectionGUID: zsvQxKu8QAWZRekUHouXsg==
X-CSE-MsgGUID: xT1Q/9ThTCSv22lo/D8uPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775910"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:30 -0700
X-CSE-ConnectionGUID: avODRATaS2u2VGE+DAw6/w==
X-CSE-MsgGUID: rHGgoqLjTlKe/qOiqE+z6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062998"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:28 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 05/11] tests/intel/kms_frontbuffer_tracking: use a
 bigger buffer for fbc status
Date: Thu, 16 Apr 2026 12:25:53 +0300
Message-ID: <20260416092559.88735-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As the FBC status now include plane specific FBC status as well, we
need a bigger buffer to capture the complete FBC status. Define the
buffer length in a single place and use it across places where the
test need to assess the FBC status

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c                   | 2 --
 lib/i915/intel_fbc.h                   | 2 ++
 tests/intel/kms_frontbuffer_tracking.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index e2fbe3680..fde9ef03b 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -10,8 +10,6 @@
 
 #include "intel_fbc.h"
 
-#define FBC_STATUS_BUF_LEN 128
-
 void intel_fbc_enable(igt_display_t *display)
 {
 	igt_set_module_param_int(display->drm_fd, "enable_fbc", 1);
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index e4b9e5529..f83818aff 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -8,6 +8,8 @@
 
 #include "igt.h"
 
+#define FBC_STATUS_BUF_LEN 512
+
 enum psr_mode;
 
 void intel_fbc_enable(igt_display_t *display);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 4fa185e76..fd3b75b02 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1570,7 +1570,7 @@ static void drrs_print_status(void)
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 	char *action;
 	ssize_t n_read;
 
@@ -1620,7 +1620,7 @@ static void fbc_update_last_action(void)
 static void fbc_setup_last_action(void)
 {
 	ssize_t n_read;
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 	char *action;
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
@@ -1640,7 +1640,7 @@ static void fbc_setup_last_action(void)
 
 static bool fbc_is_compressing(void)
 {
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-- 
2.43.0

