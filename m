Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB92EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E720D10E319;
	Mon, 16 Mar 2026 08:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVWDFick";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CB10E28E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649167; x=1805185167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j37fHHv2Dxn2XKRVdPyTX6Q6sfK/F29I+g5wFgHd2Xw=;
 b=SVWDFickt82I37qeBTn43Q1IdppCvhqg6E206Z8Q9fRDbvl3yG8s8N+l
 1/NLknkc4c/cld6PtiLDICcR+VrF2Z/Wfs1fmj5HGWK3/T89gfvjLsbD2
 urMz5ugDLHZ6iIQ3NvaCtfRidTU6iUaHzOwQz5SxcqRShpM5UPGtpqqAu
 bo2+qPo2vk0g+MLZSpeauDc90LOrIdG9gz67eswqkzAHP/rUlEZVU/iey
 uZSavRKIl+rpVKS/0zGm2aH+CrKu/0g3wryHwjN3XD6F3Ts+DIFuTVD/e
 EE99rmEFAifvtv3AGrETvmtPrkrjNc6Xm36vzUU3+FtN4eyh65wJHJ1Au Q==;
X-CSE-ConnectionGUID: vwEDimqgSUG8yw1I37Ywow==
X-CSE-MsgGUID: tVzP/fsGS6C0wxBJp8NU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359358"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:27 -0700
X-CSE-ConnectionGUID: GcNf00R4RZmEmod+5gBMHQ==
X-CSE-MsgGUID: NksDaQwWQ/uVeW8pAD65ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300576"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:26 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 02/17] tests/intel/kms_big_fb: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:06 +0530
Message-ID: <20260316084021.419580-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Use igt_pipe_crc_free() for crc cleanup.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_big_fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index c99cf51df..daa3a890b 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -499,7 +499,7 @@ static bool test_plane(data_t *data)
 
 		igt_plane_set_fb(plane, NULL);
 
-		igt_assert_crc_equal(&big_crc, &small_crc);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &big_crc, &small_crc);
 		igt_pipe_crc_stop(data->pipe_crc);
 	}
 
@@ -911,7 +911,7 @@ static void test_cleanup(data_t *data)
 	if (!data->output)
 		return;
 
-	igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	igt_output_set_crtc(data->output, NULL);
 	igt_remove_fb(data->drm_fd, &data->big_fb);
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
@@ -1152,6 +1152,7 @@ int igt_main()
 	data.max_hw_stride_test = false;
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

