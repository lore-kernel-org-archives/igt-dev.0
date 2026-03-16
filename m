Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C0EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7E10E344;
	Mon, 16 Mar 2026 08:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPoACM2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C4310E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649176; x=1805185176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BJpKKHyTkYHemmrlCA3YvYP2T9dMng/aAdMGUS7T0bM=;
 b=TPoACM2/4pT5g4dYyLS+citO4WjEhomlr+cTBkzgmTe1KTT0pTqHIfeR
 ZmKXuVqHVW1Yo41+opanjbMNsogXAnI+GzULkRjP2tUbH8Hlq824O8XE8
 7/ut9bL0k6+qG5yHyuLW7CCjzumhm7xaaQ+6tkdM7Vxje+vIv+IBJgtW2
 IeVhrGkVQb93fTAnwo+hVCG3eSjnMuZ9v5p51lWq3zZklK8kCAbBi4Xo3
 yn+Qep41wBQwGp0q3u4IQqaC4a45P6Dy0zCetRTlX8aJDaAyK9OZN0tUP
 ruRj/nEeyyhoRgz9XHqc1QXOoWXzBkDJ+DlcG2Eq8HqqOFx7B/LDT4eHe g==;
X-CSE-ConnectionGUID: ZaYHOJRLTFmh7JPO3NRSDw==
X-CSE-MsgGUID: /GMwrH0iRhSYpkFfyCfgfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359423"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359423"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:36 -0700
X-CSE-ConnectionGUID: bgzvNz/oS8OWRFkIgkH1NA==
X-CSE-MsgGUID: VH6ymnqHR9erDyNHpOihDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300660"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:35 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 07/17] tests/kms_async_flips: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:11 +0530
Message-ID: <20260316084021.419580-8-sowmiya.s@intel.com>
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
in vblank handler to automatically stop CRC collection on mismatch.
Replace manual stop+free with igt_pipe_crc_cleanup() in test_crc()
and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_async_flips.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a2930968..0b9927fcc 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -733,7 +733,7 @@ static void vblank_handler_crc(int fd_, unsigned int sequence, unsigned int tv_s
 	data->frame_count++;
 
 	igt_pipe_crc_get_single(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&data->ref_crc, &crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &data->ref_crc, &crc);
 
 	/* check again next vblank */
 	queue_vblank(data);
@@ -861,8 +861,7 @@ static void test_crc(data_t *data)
 		paint_fb(data, &data->bufs[frame], 1, height, rand());
 	}
 
-	igt_pipe_crc_stop(data->pipe_crc);
-	igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 
 	/* make sure we got at a reasonable number of async flips done */
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
@@ -1244,6 +1243,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		for (i = 0; i < NUM_FBS; i++) {
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
 			igt_remove_fb(data.drm_fd, &data.bufs_overlay[i]);
-- 
2.43.0

