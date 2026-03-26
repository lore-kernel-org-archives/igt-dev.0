Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1849D1099B5F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DB010E959;
	Thu, 26 Mar 2026 07:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAg0I4mE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AB10E2F6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774509999; x=1806045999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s2B53X5XDv2Q7GvBSm0gP/DgHRvEzKMRfNvzY0SmePY=;
 b=NAg0I4mE7fHMqlrmmJS0cs3mxj0xq/5YwiKru+NozPm064oLvHYn5Shb
 +vMCzt+B7Ur4L7fILiUU2eWuduSiTT6+i48g7GcqTlQGbs2+pjNBg+X1A
 EUEOM8I2LOMS+lZajDki0A4wCe98NpN7q6WLVp44trK/ofEFV9qcqziej
 D6dJNZPq+p+MVVx7noMrob+QFHJgnypgQUbkk3lj3K0KwPEc3NaHQn7cH
 A2MIYIfCvnVUIfdFWD14cbln7UGN8qYZFpb8fxm9d7EATBzzDEA4HhC1w
 sa9yPsDbMGz2WHWNUQz22iKpqyQiWP0nqGmszIjeUwG0w9RPYDglGKtS2 g==;
X-CSE-ConnectionGUID: +RzDp0YyQFCp6U5SsRftWQ==
X-CSE-MsgGUID: HEtDMIPMS/KInzQHeyU2qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85866215"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85866215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:39 -0700
X-CSE-ConnectionGUID: eBrVRz1dSNOKrCEO0FxqvQ==
X-CSE-MsgGUID: kyf2RKgQQz60Ss5mJ6Ozyw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:36 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 3/4] tests/intel/kms_frontbuffer_tracking: use
 intel_fbc_get_fbc_status()
Date: Thu, 26 Mar 2026 09:25:54 +0200
Message-ID: <20260326072555.160329-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326072555.160329-1-vinod.govindapillai@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
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
 tests/intel/kms_frontbuffer_tracking.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e764c9ce1..ef083fe60 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1574,8 +1574,8 @@ static struct timespec fbc_get_last_action(void)
 	char *action;
 	ssize_t n_read;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	igt_assert(action);
 
@@ -1623,8 +1623,8 @@ static void fbc_setup_last_action(void)
 	char buf[128];
 	char *action;
 
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
 	action = strstr(buf, "\nLast action:");
 	if (!action) {
 		igt_info("FBC last action not supported\n");
@@ -1642,7 +1642,8 @@ static bool fbc_is_compressing(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "\nCompressing: yes\n") != NULL;
 }
 
@@ -1655,7 +1656,8 @@ static bool fbc_not_enough_stolen(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "FBC disabled: not enough stolen memory\n");
 }
 
@@ -1663,7 +1665,8 @@ static bool fbc_stride_not_supported(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "FBC disabled: stride not supported\n");
 }
 
@@ -1671,7 +1674,8 @@ static bool fbc_plane_size_too_big(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "FBC disabled: plane size too big\n");
 }
 
@@ -1679,7 +1683,8 @@ static bool fbc_surface_size_too_big(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "FBC disabled: surface size too big\n");
 }
 
@@ -1687,7 +1692,8 @@ static bool fbc_psr_not_possible(void)
 {
 	char buf[128];
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
 }
 
@@ -1698,7 +1704,8 @@ static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
 
 	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
 
-	debugfs_read_crtc("i915_fbc_status", buf);
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, buf, sizeof(buf));
+
 	return strstr(strstr(buf, "*"), buf_plane);
 }
 
-- 
2.43.0

