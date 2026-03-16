Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D77EF013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED6110E37E;
	Mon, 16 Mar 2026 08:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMRilgKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BF010E369
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649184; x=1805185184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mRlU6MrGIiA0uPa2p4YiBb4Vk3D1BuXDpOJ/hg4lyw=;
 b=YMRilgKKSMj5+9gDw7pyj/nQAKWXLdz+8qd7Np0Ko7S/fa/+GuTr2l5l
 4YUq9ZBh8ChH1jOck0c5qAt5PvVIQiUyQIo3WVpbDK3Qg2Rcp4YP3l/Et
 kt9Qd9Ys9BPa7Xtm33o8U3k/vH0uHRtQSBgn5CsNwoRS6nJjBBfbEjFxo
 IcUEVkp5+bO8+gqnS65o2dGOtx8KjpbtnEdkZ35ST4V9Mhlf4k0zwnyv/
 6NwA2T+/B1vUR4ziLOhkNunU6eou1BgT9Z3s5aUWd0BT3SAuCuySZyBoe
 tGMPj0gSNahh6lTC07LIBI+iTC1LJ8taLROHIo+tkw/JJRKc01tvk9qwV g==;
X-CSE-ConnectionGUID: sl57xqcfTfy/URiu7NWMhQ==
X-CSE-MsgGUID: o+5qfYdmTYW6Yb/MKSTkSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359440"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:43 -0700
X-CSE-ConnectionGUID: +WDKyyghS1OocW+YQC/d7A==
X-CSE-MsgGUID: lGesaeSBT8qiNTDttwuW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300711"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:42 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 11/17] tests/kms_cursor_legacy: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:15 +0530
Message-ID: <20260316084021.419580-12-sowmiya.s@intel.com>
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
Replace conditional free+NULL with igt_pipe_crc_cleanup() in
find_connected_pipe() and add cleanup in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_cursor_legacy.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..8ee067845 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -424,10 +424,8 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	bool first_output = false;
 	bool found = false;
 
-	if (!second) {
-		igt_pipe_crc_free(pipe_crc);
-		pipe_crc = NULL;
-	}
+	if (!second)
+		igt_pipe_crc_cleanup(&pipe_crc);
 
 	/* Clear display, events will be eaten by commit.. */
 	igt_display_reset(display);
@@ -1666,7 +1664,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
 
-		igt_assert_crc_equal(&crcs[i], &crcs[2]);
+		igt_assert_crc_equal_stop_on_fail(pipe_crc, &crcs[i], &crcs[2]);
 	}
 
 	/* Clean-up */
@@ -1779,7 +1777,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_plane_set_fb(plane_primary, &fb_info[0]);
 		igt_display_commit2(display, COMMIT_UNIVERSAL);
 
-		igt_assert_crc_equal(&crcs[i], &test_crc);
+		igt_assert_crc_equal_stop_on_fail(pipe_crc, &crcs[i], &test_crc);
 	}
 
 	igt_pipe_crc_stop(pipe_crc);
@@ -2116,6 +2114,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&pipe_crc);
 		if (intel_psr2_restore)
 			i915_psr2_sel_fetch_restore(display.drm_fd, NULL);
 		igt_display_fini(&display);
-- 
2.43.0

