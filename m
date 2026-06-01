Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53254CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F410E978;
	Mon,  1 Jun 2026 20:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DknCr3ju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C703A10E977
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346668; x=1811882668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ennPpljATPgmA+dl0dYW21Y6PXnp0Kl0Y5DOzjIXa3A=;
 b=DknCr3juaw2wdUpzOLJS8g7NfeZvBxua1cvaaom2kPRmXuRiJV9MCmgg
 Dv7nG+LCBdw47zGvpFZ1ewvnvAInAjBDp27CZiV81euWY/ZPWCGxnc+1+
 od1J9xS8CYMF7JC99KsN/fgCMkqzySTyZZmqItBD5DAjlRelHQ9PH4E8k
 zH7NhiyqnPI2XSV/OhdFr2S5pNIZTjTpuBSdwZPcyqvh7rY3X0QL1EzTc
 B0IjlmGPqW84+qKmmLuzweT5JQx/v6gnixb8V4iIputqEr1hfGU1pAXRl
 feEA6QfajOXpOfZB5lPdkq+V2riSvs2vGGPOTUo4Uh9IFblvfo/9TGbwR w==;
X-CSE-ConnectionGUID: FjsFbE1XQmWNhuJIL+3pzQ==
X-CSE-MsgGUID: P/OKfYyMSJCbE1W8J70BLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652848"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652848"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:28 -0700
X-CSE-ConnectionGUID: iex8bmN8Rqm11hBrYjNMyw==
X-CSE-MsgGUID: PqLYjKexS4mQbPz1A9zEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331449"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:26 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 03/12] tests/intel/kms_frontbuffer_tracking: update
 the outdated fbc status reasons
Date: Mon,  1 Jun 2026 23:43:58 +0300
Message-ID: <20260601204407.39934-4-vinod.govindapillai@intel.com>
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

Replace the fbc status check for "mode too large for compression" wchich
is no longer being set by the driver with "plane size too big" and
"surface size too big" fbc status checks.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index df8fbfa2c..fabfe11fc 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1730,16 +1730,25 @@ static bool fbc_stride_not_supported(void)
 
 	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
-	return strstr(fbc_status, "FBC disabled: framebuffer stride not supported\n");
+	return strstr(fbc_status, "FBC disabled: stride not supported\n");
 }
 
-static bool fbc_mode_too_large(void)
+static bool fbc_plane_size_too_big(void)
 {
 	char fbc_status[128];
 
 	intel_fbc_get_status(prim_mode_params.crtc, fbc_status, sizeof(fbc_status));
 
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
@@ -2497,7 +2506,8 @@ static void do_status_assertions(int flags)
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

