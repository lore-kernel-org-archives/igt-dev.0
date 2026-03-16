Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8455EF013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A45F10E369;
	Mon, 16 Mar 2026 08:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1Il1rcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF810E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649175; x=1805185175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPV1qu65A5oIvkSeFV6LTG2WNp5pKy3JK7SwKmOGRaM=;
 b=T1Il1rcnqaf8SAeT15rn6df0Nw0QZZwiveGXP5gEuRWHk0EkjXqqTM4W
 NGYS5bycv+VsS3BqYghGt6wxVzukj3RqdoVUud9JyO4BiiFOu3I/s7frL
 DhuVsP3eOffeWakoqg028xkNmaeeS04xFqH0WKEVCbXCpFXgNAbrNnBz9
 YC8c61K08Or82lTIvhXhVJ6qIaXGAmZ+d/0//ejwcVIkdRqYtD6UGJgxu
 HcDt3hmrAf7GLDbVRsbx9NJlGPWLkzD1dXrJBgNA8M/2bG4w8C1KTXQfb
 pTuY7Vd1LhU3NCX0lmDJoFrmTgkYh2p80zlDpCC/62LD4pQk8Ed8n6Yi9 w==;
X-CSE-ConnectionGUID: /X2m3uFXQlqJHea7JiEC4w==
X-CSE-MsgGUID: FSBRZUrrSp2rhaGAjNlzVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359418"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:34 -0700
X-CSE-ConnectionGUID: R3ziaEVURBi8HiUbr16uRg==
X-CSE-MsgGUID: lRJyYOrXR021t72x/Ugk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300647"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:33 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 06/17] tests/intel/kms_pipe_stress: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:10 +0530
Message-ID: <20260316084021.419580-7-sowmiya.s@intel.com>
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
Replace conditional free with igt_pipe_crc_cleanup() in finish_test()
and add cleanup loop in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 85ab2ec50..89b184d67 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -594,7 +594,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 		kmstest_get_vblank(data->display.drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
-		igt_assert_crc_equal(&crc, &crc2);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc[pipe], &crc, &crc2);
 
 		++pipe;
 	}
@@ -837,8 +837,7 @@ static void finish_test(struct data *data)
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		data->num_planes[i] = -1;
 		data->last_mode[i] = NULL;
-		if (data->pipe_crc[i])
-			igt_pipe_crc_free(data->pipe_crc[i]);
+		igt_pipe_crc_cleanup(&data->pipe_crc[i]);
 	}
 
 	stop_cpu_threads(data);
@@ -894,6 +893,9 @@ int igt_main() {
 	}
 
 	igt_fixture() {
+		for (int i = 0; i < IGT_MAX_PIPES; i++)
+			igt_pipe_crc_cleanup(&data.pipe_crc[i]);
+
 		igt_display_fini(&data.display);
 	}
 }
-- 
2.43.0

