Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63DCEFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B8510E2DB;
	Mon, 16 Mar 2026 08:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3czXmPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EE210E2DB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649169; x=1805185169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RZcJGC90a9tLRa1bYPdzGcW8aP7v8eNguzfXhR9KvM=;
 b=h3czXmPqgWULtALwtzLKeaEAEqE06QjgHE5x4qJhDhkfnBMCjO24oDzX
 4bfm2Gxj9Ce7/Nv13D3ox3hHCLd6+vTzSCne881erNfxyKfla94nxKVzd
 AOjigdshFWBDOskCFGlNfXMYe4owef4R4dVX+ydMo2vb/rIa+htedA576
 JQKS9bjxiouiphNNEzF8iYcMwoHowPCZ2WpbLrkUJ5IRpEHE87N5pDa06
 GHFPxk1zenjr2q1vBrKrbEfseZf4I2eR+GEW8s+jvz11Zn54xQuFpPJb+
 3upz6lXXdpeUsHZT5SXHkh9ATeJ1/7lxhImjQj/oKRLYrMOvwOdG9WBtN A==;
X-CSE-ConnectionGUID: kkkBjKWPRoSCSh//SKll0Q==
X-CSE-MsgGUID: Tgr++hh6TziPvq0Eta+x3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359359"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:29 -0700
X-CSE-ConnectionGUID: 7RzjqdbpRdCWVqOZIFkSQQ==
X-CSE-MsgGUID: lCN2DzkwS7eIPWeOQKf2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300614"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:28 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 03/17] tests/intel/kms_fbc_dirty_rect: Use CRC
 stop-on-fail assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:07 +0530
Message-ID: <20260316084021.419580-4-sowmiya.s@intel.com>
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
Use igt_pipe_crc_cleanup() in fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 9a0146460..5297a900a 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -219,7 +219,7 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
 	update_rect_with_dirtyfb(data, &data->fb[MAIN_FB_IDX], &data->fb[2], &rect2);
 	/* Now the screen must match 1st screen - with whole blue */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&crc, &main_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &main_crc);
 
 	/* 5th screen - Copy the first rect at 100,100 with dirtyfb.
 	 * Copy rect1 area from fb2 to fb3.
@@ -227,7 +227,7 @@ static void fbc_dirty_rectangle_dirtyfb(data_t *data)
 	update_rect_with_dirtyfb(data, &data->fb[1], &data->fb[2], &rect1);
 	/* Now the screen must match 2nd screen - with one rect at 100,100 */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-	igt_assert_crc_equal(&crc, &fb2_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &fb2_crc);
 }
 
 /**
@@ -280,7 +280,8 @@ static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
 	for (int i = DIRTY_RECT_FBS_START_IDX; i < N_FBS; i++) {
 		set_damage_area(primary, &rect[i], sizeof(rect[i]));
 		set_fb_and_collect_crc(data, primary, &data->fb[i], &rect_crc[i]);
-		igt_assert_crc_equal(&rect_crc[i], &rect_crc[MAIN_FB_IDX]);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &rect_crc[i],
+						  &rect_crc[MAIN_FB_IDX]);
 	}
 }
 
@@ -369,22 +370,22 @@ static void fbc_dirty_rectangle_basic(data_t *data)
 	/* Put full blank screen back */
 	set_damage_area(primary, &full_rect, sizeof(full_rect));
 	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
-	igt_assert_crc_equal(&crc, &main_fb_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &main_fb_crc);
 
 	/* Set combined rect - draw two white rects using damage area */
 	set_damage_area(primary, rect_combined, sizeof(rect_combined));
 	set_fb_and_collect_crc(data, primary, &data->fb[3], &crc);
-	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &rect_combined_fb_crc);
 
 	/* Clear first rect using damage area. Only the second rect should be visible here! */
 	set_damage_area(primary, &rect1, sizeof(rect1));
 	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
-	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &rect_2_fb_crc);
 
 	/* Clear the second rect as well. Now back to original blank screen */
 	set_damage_area(primary, &rect2, sizeof(rect2));
 	set_fb_and_collect_crc(data, primary, &data->fb[MAIN_FB_IDX], &crc);
-	igt_assert_crc_equal(&crc, &main_fb_crc);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc, &main_fb_crc);
 }
 
 static void cleanup(data_t *data)
@@ -541,6 +542,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
-- 
2.43.0

