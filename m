Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C6DCD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A9C10E97C;
	Mon,  1 Jun 2026 20:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aleFUIEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513D910E977
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346665; x=1811882665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NEv7IrpzkbVqtWQBQvc9GwQyOScMnbRw9XOyRHr3YJI=;
 b=aleFUIEFq6N+uUvlXSa6yYbr7GxpbCYJjxkgS52s8gCA801Tdy7zsv/X
 Fzk5c2zmbWMoSkQdqdG9mGc+GiMImNshX2TgWJSl6TwAhG+5Ls05Ptgf9
 ngHgSOwtaqGDx7lFasDSMffXB6gH16QkOtQZAWAOJijxLLWRvR+6pcHML
 uHWFszlFsivdn4EVaULuI4OfBtUMH7lw36Q47IuqNa0V+H+0ZtCEbkSrs
 vkZgx+FYT+p91Iz384OGDYqzeHATbZQXW40w75F1lQe2WNeL1RFAdR3QX
 oNIzy6EZyCfWFQHuevMJIS803kRClpIfEGuH46hrvvc9HXNtFzPCJyb+i Q==;
X-CSE-ConnectionGUID: 6pHrDgeYSVmujglK/PBSJg==
X-CSE-MsgGUID: UNquEiAmRoW22L+In+CcTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652845"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652845"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:25 -0700
X-CSE-ConnectionGUID: s8zBDweRQfas6+jey9ZlRg==
X-CSE-MsgGUID: Qy2lz3oKSx+BM68QX0OWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331436"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:23 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 02/12] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_status()
Date: Mon,  1 Jun 2026 23:43:57 +0300
Message-ID: <20260601204407.39934-3-vinod.govindapillai@intel.com>
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

Use the common intel_fbc_get_status() to get the fbc status

v2: intel_fbc_get_status() function name change

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 54 ++++++++++++++------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 37706cab5..df8fbfa2c 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1633,13 +1633,13 @@ static void drrs_print_status(void)
 static struct timespec fbc_get_last_action(void)
 {
 	struct timespec ret = { 0, 0 };
-	char buf[128];
+	char fbc_status[128];
 	char *action;
 	ssize_t n_read;
 
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
+	action = strstr(fbc_status, "\nLast action:");
 	igt_assert(action);
 
 	n_read = sscanf(action, "Last action: %ld.%ld",
@@ -1683,12 +1683,12 @@ static void fbc_update_last_action(void)
 static void fbc_setup_last_action(void)
 {
 	ssize_t n_read;
-	char buf[128];
+	char fbc_status[128];
 	char *action;
 
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	action = strstr(buf, "\nLast action:");
+	action = strstr(fbc_status, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
 		return;
@@ -1703,10 +1703,11 @@ static void fbc_setup_last_action(void)
 
 static bool fbc_is_compressing(void)
 {
-	char buf[128];
+	char fbc_status[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "\nCompressing: yes\n") != NULL;
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(fbc_status, "\nCompressing: yes\n");
 }
 
 static bool fbc_wait_for_compression(void)
@@ -1716,45 +1717,50 @@ static bool fbc_wait_for_compression(void)
 
 static bool fbc_not_enough_stolen(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
-	return strstr(buf, "FBC disabled: not enough stolen memory\n");
+	return strstr(fbc_status, "FBC disabled: not enough stolen memory\n");
 }
 
 static bool fbc_stride_not_supported(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
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
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
 }
 
 static bool fbc_psr_not_possible(void)
 {
-	char buf[128];
+	char fbc_status[128];
+
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
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
+	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(strstr(fbc_status, "*"), buf_plane);
 }
 
 static bool drrs_wait_until_rr_switch_to_low(void)
-- 
2.43.0

