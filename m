Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B98F8A151
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C097210E098;
	Thu, 16 Apr 2026 09:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGR/364c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EAF10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331584; x=1807867584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DaSTYXojbtf6dHlGSXO6Owq24hXvOTIe363KiZgxcXg=;
 b=YGR/364c0BoplUeRPdq76C1gjrg+wNUVxCfT1YtQw6THUxceMgP+3ErC
 8paEAnaqyutj3X9LKMeheuUjTBcYX2ChA60b/0XoQW9D/wqP6/pilRfcb
 F0JrGqdOdbwnTTYlaIsbT8YsV+6WHV7qzGqVfvxkBLpxXUNIMHPTQUOCu
 GGb8FuITRSmLDZKdegyWMSMHtZOLCRG+iBB0OkuJJqOiD0xaF6lsOMky3
 sR2wQIpUyN1wLmet8iHaqcNu7yVosAygF3RH+J/LitWwdN6IPrkVN/Y+Z
 1OVIBVNdjN0WxkLHwEagYC8oFGYn+V46uCCmXUZxA7EM8LXuS06V1yXXu g==;
X-CSE-ConnectionGUID: DP7bNMeUQTquGPb3nCnYVg==
X-CSE-MsgGUID: /eX1jsDNR2Wj5ib/mPBEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775899"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:24 -0700
X-CSE-ConnectionGUID: 1n7lOHr/RROvObaewnwfMA==
X-CSE-MsgGUID: QvO42FFdQbGT4chjs2kulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062986"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:21 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 03/11] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status reasons
Date: Thu, 16 Apr 2026 12:25:51 +0300
Message-ID: <20260416092559.88735-4-vinod.govindapillai@intel.com>
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

Replace the fbc status check for "mode too large for compression" wchich
is no longer being set by the driver with "plane size too big" and
"surface size too big" fbc status checks.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b01959d2c..5bdfbd105 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1667,16 +1667,25 @@ static bool fbc_stride_not_supported(void)
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
+	return strstr(fbc_status, "FBC disabled: stride not supported\n");
 }
 
-static bool fbc_mode_too_large(void)
+static bool fbc_plane_size_too_big(void)
 {
 	char fbc_status[128];
 
 	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	return strstr(fbc_status, "FBC disabled: mode too large for compression\n");
+	return strstr(fbc_status, "FBC disabled: plane size too big\n");
+}
+
+static bool fbc_surface_size_too_big(void)
+{
+	char fbc_status[128];
+
+	intel_fbc_get_fbc_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
+
+	return strstr(fbc_status, "FBC disabled: surface size too big\n");
 }
 
 static bool fbc_psr_not_possible(void)
@@ -2362,7 +2371,8 @@ static void do_status_assertions(int flags)
 	if (flags & ASSERT_FBC_ENABLED) {
 		igt_require(!fbc_not_enough_stolen());
 		igt_require(!fbc_stride_not_supported());
-		igt_require(!fbc_mode_too_large());
+		igt_require(!fbc_plane_size_too_big());
+		igt_require(!fbc_surface_size_too_big());
 		igt_require(!fbc_psr_not_possible());
 		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
 			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
-- 
2.43.0

