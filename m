Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFBECD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348C510E97A;
	Mon,  1 Jun 2026 20:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxG8UF3N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2F10E977
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346673; x=1811882673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ps/3r9nJWsfid2eYVWSECacHIYS8+VRm5v+QEgIC1kM=;
 b=fxG8UF3NNldK4aY8Zrb6mgNO6pwy75cIt+tWjAWcMypiAFCGwJECcvO2
 MA70ujXb0Jf4wzIF/6llsGlitStrItZUOniQDp4OqYMXJAyq/n/g8YNNd
 0Z8Bh41pyoN/EW6D0tCsMgxlUpxStbUBAtXtv4ag1t9OpbmdY9C0SpyWX
 cyMYN8tQtR5iNPw19jtIee54EFzN/DMt3sSi7Dy06Q0TP4hCFO6wbigUu
 wQnlOpxYSQrpgUsDU3kjtBpDHH599S+QQXXLEt1tzEZBn12ylr5zkUHWa
 FYSW3McWWQ/dTf3cp0ijHrfpSaxtaq//Su2IldwmhrknOPYTb8jVWIR0b A==;
X-CSE-ConnectionGUID: 3pigCgvxT5i8HInna4d13Q==
X-CSE-MsgGUID: m4W0UqDrTt+o+WFVq6vjEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652859"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:33 -0700
X-CSE-ConnectionGUID: DWmTkpX/RBuyH6FDKfYZxg==
X-CSE-MsgGUID: yudUIaekR6m+l0oJGXh4Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331468"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:31 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 05/12] tests/intel/kms_frontbuffer_tracking: use a
 bigger buffer for fbc status
Date: Mon,  1 Jun 2026 23:44:00 +0300
Message-ID: <20260601204407.39934-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/i915/intel_fbc.c                   | 2 --
 lib/i915/intel_fbc.h                   | 2 ++
 tests/intel/kms_frontbuffer_tracking.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 5692c6af8..ccd7f411c 100644
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
index 32126309e..a82a96d20 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -8,6 +8,8 @@
 
 #include "igt.h"
 
+#define FBC_STATUS_BUF_LEN 512
+
 enum psr_mode;
 
 void intel_fbc_enable(igt_display_t *display);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 4155939b6..a839833a3 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1633,7 +1633,7 @@ static void drrs_print_status(void)
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 	char *action;
 	ssize_t n_read;
 
@@ -1683,7 +1683,7 @@ static void fbc_update_last_action(void)
 static void fbc_setup_last_action(void)
 {
 	ssize_t n_read;
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 	char *action;
 
 	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
@@ -1703,7 +1703,7 @@ static void fbc_setup_last_action(void)
 
 static bool fbc_is_compressing(void)
 {
-	char fbc_status[128];
+	char fbc_status[FBC_STATUS_BUF_LEN];
 
 	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-- 
2.43.0

