Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E283FC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9200F10E269;
	Mon, 24 Mar 2025 09:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQ6er5Av";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B242210E269
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742808521; x=1774344521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HXaF5oGlSgEhP6RywxWyLAWSMeWAy7zBGA28dyyaaSE=;
 b=HQ6er5AvZ1XD++EFhZ3KdZENDuwimBhW1XIGi/ULluo8dHOm9AXn0Qnt
 NE/xeF0Sq5/veuSOmrlSqmJBElIoU5FyE8GTThRJXY0+mF64YnWOW3D5r
 rWhwa4O9f4rkzOF3PUwhPdcmoKrzk3pHi61d+oGwm8EFx0d+E93Y03nq6
 ZZdW8l6wkslWcrCK/pbCJHIEo7eE+S7xbSPT0yC/gz7qq7v6xreU2FMN6
 YeKMHzrLBu/SPasJaIwjP75C0w5FIoSeUMPlUNKCixYi8M9agzmA0Wor0
 ciaREQfZHCUQrvKh8XdIAPBHuVzJySK5E0NLDHlu55Uo0eXC2Rn8DQ15m A==;
X-CSE-ConnectionGUID: p2VyuSt4RL6gJiJLeZjzSQ==
X-CSE-MsgGUID: 5MDXT1geSvKKAVTXXKVGGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44018829"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="44018829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:28:41 -0700
X-CSE-ConnectionGUID: Kw/WeuKxRI6CtNsMsCQutw==
X-CSE-MsgGUID: Fb6cQUrbRvOefNlP0miqSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124445141"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 02:28:39 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST bandwidth
 constraints
Date: Mon, 24 Mar 2025 15:14:19 +0530
Message-Id: <20250324094419.1180224-1-jeevan.b@intel.com>
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

Instead of checking only the current modes, find a combination of
modes in the MST topology that can be accommodated within the
available link bandwidth.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 588820170..d1083f470 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -49,6 +49,22 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
+static bool fit_modes_in_bw(data_t *data)
+{
+	bool found;
+	int ret;
+
+	ret = igt_display_try_commit_atomic(&data->display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret != 0) {
+		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
+		igt_require_f(found,
+			      "No valid mode combo found for modeset\n");
+	}
+	return true;
+}
+
 static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
 {
 	int connector_id;
@@ -93,6 +109,8 @@ static void run_extendedmode_basic(data_t *data,
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
+	igt_assert(fit_modes_in_bw(data));
+
 	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
 	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -138,6 +156,7 @@ static void run_extendedmode_basic(data_t *data,
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
+	igt_assert(fit_modes_in_bw(data));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
@@ -158,6 +177,7 @@ static void run_extendedmode_basic(data_t *data,
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_assert(fit_modes_in_bw(data));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	/*Compare CRC*/
-- 
2.25.1

