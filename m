Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30497C30658
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 04:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A6B10E205;
	Fri,  5 Jul 2024 04:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEIjKTcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C33D10E0D9
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 04:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720154708; x=1751690708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I+Ug1dkmqLrTVl6zpVnz9rFGx0Qm0ZKeW0bMUw9BnGY=;
 b=FEIjKTcHDe+BBAan1lvfmC5MR+HETLrTxTO2W/iwn7xF8r2eHQLKAJoT
 +pZbWFJRSF7ECFY9zp2PkchH4GDFTAYKV55D7/6Z0basc8HchA+ACG70c
 Pp0U3X8YULBEvZTsGHXrsLMIJxp6c1wm0WWAM17s+gKX0eLRJML2b1nE+
 HvYyjOPWsRkmrhmZsQocMdtQ6Stvhnr0OWl+sCyDik7qvcAEkgEOogjub
 FqhJPTSjsY6rxAJ4H4xThdFqFxuPiDxaDcB/Z47+trvEbzNOfWa9JYYRD
 FEbGmyyaIcXcrzQa3PaBuIP4V4E8b/1056zFQohwMhdJju3sZakG+rkT+ Q==;
X-CSE-ConnectionGUID: vKBSVDbQT2G2Si1SQ7UOvA==
X-CSE-MsgGUID: 6b6twrx5S4e7DcL+Cqlxag==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28828542"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28828542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 21:45:07 -0700
X-CSE-ConnectionGUID: MdHy5Gz8ROmMsS8dTSxLpw==
X-CSE-MsgGUID: D94arCtXSvOfkV4ZjTCfIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="77507942"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 21:45:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_getfb: Skip getfb2-accept-ccs subtest on
 Xe2 platforms
Date: Fri,  5 Jul 2024 10:15:15 +0530
Message-Id: <20240705044515.700219-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

The getfb2-accept-ccs subtest tests on ccs modifiers.
With Xe2 platforms we no more have the ccs modifiers.

Adding a check to verify the platform. If it is
Xe2 platform then test will skip, otherwise it
will execute further.

v2: modified the check as 
    intel_graphics_ver(devid) < IP_VER(20, 0) (Juha-pekka)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_getfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index bb9679bc9..9cc783776 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	igt_require(has_addfb2_iface(fd));
 	devid = intel_get_drm_devid(fd);
 
+	igt_require_f(intel_graphics_ver(devid) < IP_VER(20, 0),
+		      "No ccs modifiers on Xe2\n");
+
 	if (HAS_FLATCCS(devid)) {
 		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
 		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
-- 
2.34.1

