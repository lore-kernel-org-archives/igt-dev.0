Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1532AF013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45010E319;
	Mon, 16 Mar 2026 08:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBQKzb1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AE910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649180; x=1805185180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JorLgJr9qulMG0ztoNHHT2eD32PBC0N/kyZLKWSrRUE=;
 b=oBQKzb1oOnh8Jh6onkBzYTuhlT8agbfuv1SoyTtMQngtkBPvYcxxaDGR
 VUc9fgj/QKv8OFBCQvci9bXQlxbJ6jGpo1P5xPtpy2FhF5+hu/l9Ic/KY
 FgqqiiRVanq0odV/7Y8LjD4qON8z7sc6xaUOP41Obv3gIdr0xsw1wbhgZ
 aoxTIPEmc/n4hXa1xoEbZXowruFpTx9kYxvt+0lXVImX9Rb4UtK9Jm6UR
 cQVaftdVGdBRcbYmBkX6DUYYLsADkuhQp1ysLKvqzApNlD9XqmhF4jrKj
 x6yylrgGxpbngXAybihcO+d2OpSFJdTFE6KmE5XiSe6RmY6AQErFcaWwi w==;
X-CSE-ConnectionGUID: LtxOFvb3Tu65gehLcGUtkg==
X-CSE-MsgGUID: HpGnkLzoT8qqJuxuJ7bESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359432"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359432"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:40 -0700
X-CSE-ConnectionGUID: gZAD+g3fSI6pqmeiRiiSwg==
X-CSE-MsgGUID: cJteQSSVQVeMM8Bxkjd3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300685"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:39 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 09/17] tests/kms_cursor_crc: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:13 +0530
Message-ID: <20260316084021.419580-10-sowmiya.s@intel.com>
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
Replace manual stop+free+NULL patterns with igt_pipe_crc_cleanup()
in cleanup_crtc(), prepare_crtc() and fixture teardown.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_cursor_crc.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 1e062c38b..c6e7671d3 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -328,7 +328,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 
 			igt_pipe_crc_start(pipe_crc);
 			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
-			igt_assert_crc_equal(hwcrc, &crc_after);
+			igt_assert_crc_equal_stop_on_fail(pipe_crc, hwcrc, &crc_after);
 		}
 	} else {
 		/* If on broken situation on CHV match what hw round did */
@@ -352,7 +352,7 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 						  data->vblank_wait_count);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
-		igt_assert_crc_equal(&crc, hwcrc);
+		igt_assert_crc_equal_stop_on_fail(pipe_crc, &crc, hwcrc);
 	}
 }
 
@@ -474,10 +474,14 @@ static void test_crc_offscreen(data_t *data)
 	do_test(data, &tests[0].coords, tests[0].crc, false);
 
 	for (int i = 1; i < ARRAY_SIZE(tests); i++) {
-		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[0]);
-		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[1]);
-		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[2]);
-		igt_assert_crc_equal(&tests[0].crc[0], &tests[i].crc[3]);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc,
+						  &tests[0].crc[0], &tests[i].crc[0]);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc,
+						  &tests[0].crc[0], &tests[i].crc[1]);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc,
+						  &tests[0].crc[0], &tests[i].crc[2]);
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc,
+						  &tests[0].crc[0], &tests[i].crc[3]);
 	}
 
 	/* Make sure we get -ERANGE on integer overflow */
@@ -552,9 +556,7 @@ static void cleanup_crtc(data_t *data)
 {
 	igt_display_t *display = &data->display;
 
-	igt_pipe_crc_stop(data->pipe_crc);
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 
 	cairo_surface_destroy(data->surface);
 	data->surface = NULL;
@@ -603,8 +605,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	igt_display_commit(display);
 
 	/* create the pipe_crc object for this pipe */
-	if (data->pipe_crc)
-		igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -749,7 +750,7 @@ static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum
 	igt_display_commit(&data->display);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
 
-	igt_assert_crc_equal(&crc1, &crc2);
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, &crc1, &crc2);
 }
 
 static void test_crc_cursors(data_t *data)
@@ -1313,10 +1314,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		run_tests_on_pipe(&data);
 
 	igt_fixture() {
-		if (data.pipe_crc != NULL) {
-			igt_pipe_crc_stop(data.pipe_crc);
-			igt_pipe_crc_free(data.pipe_crc);
-		}
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

