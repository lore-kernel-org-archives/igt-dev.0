Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF7ACA5FA7
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 18:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A29F10E442;
	Tue, 29 Sep 2026 18:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xmievf9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9510E442
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706189; x=1822242189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BZmHVVRTVxMLrgLMSg1Jh9/742oUgzrqpYns4exMRzE=;
 b=Xmievf9NK7y+w343PRrI9NtOmwnwxUkaDbxrNSG97M9TkHrfARx1V5S4
 YGkiPyZ2EM4jNXxs7+66D+spI652ZJCZJdE3SJecv6NvuwIeSx8yqYEJH
 AbrvTQcKKAI5Ik5HlEcv1n7EXlENdRq+DhVpFmZPykZLMQtTymkAP4EFX
 2FGF4r12pGQM5kxKHlcUHo4BgmSh6mddp/uPRoKKOfPeBONeTguXoYpSK
 WuurfauNg8ZnlKudZmD9qKnlj1CoavblcNYz0SGuxU60knXyAL24Lpa7e
 Yptw0NwHJc7GsTuTRd3LCqgEQahQbh6SOQ/5HeNo61yyBdQtRxYktxb3p Q==;
X-CSE-ConnectionGUID: Pzof2PnyTMy3aRWs9PkOag==
X-CSE-MsgGUID: iQd8UqiMTsaXwHUQVKg3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="94147974"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="94147974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:23:09 -0700
X-CSE-ConnectionGUID: 5B3TCKxORQKN91maeU+W3w==
X-CSE-MsgGUID: rVFs6IB1Tce60Zjx1WgLKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275582522"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:23:07 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color: Check crtc/output combo in bg-color
 test
Date: Wed, 30 Sep 2026 00:02:16 +0530
Message-Id: <20260929183216.1139425-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The background-color subtest does not validate whether the
crtc/output combination is valid before committing. On
big-joiner configurations, the output cannot be driven by a
given pipe (e.g. pipe D), so the atomic commit fails and the
dynamic subtest reports FAIL instead of SKIP.

Add crtc_output_combo_valid() check after test_setup(), so
unsupported combinations are skipped.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 79ad6640a..fd419489d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -994,6 +994,8 @@ run_background_color_tests_for_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t
 
 	mode = igt_output_get_mode(output);
 
+	igt_require(crtc_output_combo_valid(data, crtc));
+
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
-- 
2.25.1

