Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32295F8A151
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCE910E098;
	Thu, 16 Apr 2026 09:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e50hv2UN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF6E10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331580; x=1807867580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BwSyI0+SawZCIEiHupxUJsvvZ3tMRn+ShPVO1DHINKM=;
 b=e50hv2UNAoKqq4eAH5O2ZtnlrX2BDktdzoek9CamDM9A5YazxHuYNnOF
 yYtWz6ee0ijttFXrmWiLfwA3l6iChYjdPorGbTZZV6HhXAvKuNoJI9LUC
 FmSzrIXNDH4R7aIIXauCWw1WcQvWfX3CP32wf6WsRkPZ3f7yGJLlJJJDJ
 qFJhkto1dUX9PxNeKbjiLGTUwVhOznPpkALUzvEBa8oZqtpElu+YGTMaU
 aD5qRINMcFVpk2saPkJ7kX5ohYf9culfE1EP0QP6y9khL84/cebmkoKov
 6irH7wedOWD27HWHGuxEisBKcLoJDkcaZopNao2132U0rzgdiJLmoggFv Q==;
X-CSE-ConnectionGUID: 9dX7dVMQTs20UkI23ePPRw==
X-CSE-MsgGUID: aetYwWKtQc+ducd3jb30LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775891"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775891"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:20 -0700
X-CSE-ConnectionGUID: DczL87CYQ9ivyxXU/JqjLQ==
X-CSE-MsgGUID: RaDVMlmHR/yLv3rT8A7Ivg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062981"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:18 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 02/11] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_fbc_status()
Date: Thu, 16 Apr 2026 12:25:50 +0300
Message-ID: <20260416092559.88735-3-vinod.govindapillai@intel.com>
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

Use the common intel_fbc_get_fbc_status() to get the fbc status

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 54 ++++++++++++++------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c16f63199..b01959d2c 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1570,13 +1570,13 @@ static void drrs_print_status(void)
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
-	char buf[128];
+	char fbc_status[128];
 	char *action;
 	ssize_t n_read;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
+	action = strstr(fbc_status, "\nLast action:");
 	igt_assert(action);
 
 	n_read = sscanf(action, "Last action: %ld.%ld",
@@ -1620,12 +1620,12 @@ static void fbc_update_last_action(void)
 static void fbc_setup_last_action(void)
 {
 	ssize_t n_read;
-	char buf[128];
+	char fbc_status[128];
 	char *action;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
+	action = strstr(fbc_status, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
 		return;
@@ -1640,10 +1640,11 @@ static void fbc_setup_last_action(void)
 
 static bool fbc_is_compressing(void)
 {
-	char buf[128];
+	char fbc_status[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "\nCompressing: yes\n") != NULL;
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(fbc_status, "\nCompressing: yes\n");
 }
 
 static bool fbc_wait_for_compression(void)
@@ -1653,45 +1654,50 @@ static bool fbc_wait_for_compression(void)
 
 static bool fbc_not_enough_stolen(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: not enough stolen memory\n");
+	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
 }
 
 static bool fbc_stride_not_supported(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: framebuffer stride not supported\n");
+	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
 }
 
 static bool fbc_mode_too_large(void)
 {
-	char buf[128];
+	char fbc_status[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: mode too large for compression\n");
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
 }
 
 static bool fbc_psr_not_possible(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
+	return strstr(fbc_status, "FBC disabled: PSR1 enabled (Wa_14016291713)");
 }
 
 static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
 {
-	char buf[PATH_MAX];
+	char fbc_status[PATH_MAX];
 	char buf_plane[128];
 
 	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(strstr(buf, "*"), buf_plane);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(strstr(fbc_status, "*"), buf_plane);
 }
 
 static bool drrs_wait_until_rr_switch_to_low(void)
-- 
2.43.0

