Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BBEC282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 05:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F313B10E125;
	Mon, 10 Mar 2025 05:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOdfmEdZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDF810E125
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741583594; x=1773119594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tdZohhIZW2/AKVed6tbCcIGzfMIifCtMrYIHY2QButc=;
 b=nOdfmEdZd4Ji8r2RkZJjyQO/siinIFtvqAMK3+sSy+l3l7PgSya4Znza
 JB0yvP67wwNFsNPyhhqgUoDyZlxlUIIzuoFf8O/Uufo2awg5e+W7EXBfy
 SzdUAwHn4hgIGuE0o+iVNfF+ZeyZxmNzIosstjdWt632X/1ZJVJjoey1u
 suFdkXM2hP0AJa+gXjC3G3bSX8P9Py9UEvd2v1WHx2VBhoQl/cAQXKT2B
 4PAKTGc2hXiDeDfnd6Ctx29d++564GFm6My0Ekj4Ux0UWS5utMQfUDbzN
 xBwcfRUwyZN6Y3FojvHSebpt7ROVi4sMFfT9APSAM/9AhTbwtYRuG9fsx g==;
X-CSE-ConnectionGUID: wGIJP72bQry82VBLCDYSxg==
X-CSE-MsgGUID: BH4YLkBWRjajF30BbzttsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="60114734"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="60114734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:13:14 -0700
X-CSE-ConnectionGUID: uo/SNiGcTqORhnOkoLHjMw==
X-CSE-MsgGUID: b07MTQD3TBKK0Uwx/tmukg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="124883255"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:13:13 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	juha-pekka.heikkila@intel.com
Subject: [PATCH] tests/kms_cursor_crc.: Test async cursor crc
Date: Mon, 10 Mar 2025 10:43:03 +0530
Message-Id: <20250310051303.119966-1-shekhar.chauhan@intel.com>
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

Check if cursor IOCTLs are behaving in timely manner via CRC.
Test CRC of the display with 2 cursors, separated by a vblank and a
sleep so that the drawing of the cursors only happens when the screen is
active and then compare the CRC of the two cases. This helps validates
that there is no tearing when doing cursor changes midframe. Test
consists of two subtests, one for checking the timely change and the
second test also adds changing position into the first test.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/kms_cursor_crc.c | 142 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7c6f61f55..02c6ebbb8 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -100,6 +100,19 @@
  * @max-size:              Max supported size
  */
 
+/**
+ * SUBTEST: async-cursor-crc-framebuffer-change
+ * Description: When changing cursor midframe, there shouldn't be any tearing.
+ * Using CRC, validating that cursor IOCTLs don't cause any tearing. This test
+ * changes the framebuffer for validating the display.
+ */
+
+/**
+ * SUBTEST: async-cursor-crc-position-change
+ * Description: Similar to async-cursor-crc but instead of changing the
+ * framebuffers, this test changes the position of cursor.
+ */
+
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate cursor plane functionality. "
    "The test will position the cursor plane either fully onscreen, "
@@ -123,6 +136,11 @@ enum cursor_buffers {
 	MAXCURSORBUFFER
 };
 
+enum cursor_change {
+	FIRSTIMAGE,
+	SECONDIMAGE
+};
+
 typedef struct {
 	int x;
 	int y;
@@ -151,6 +169,7 @@ typedef struct {
 	double alpha;
 	int vblank_wait_count; /* because of msm */
 	cursorarea oldcursorarea[MAXCURSORBUFFER];
+	struct igt_fb timed_fb[2];
 } data_t;
 
 static bool extended;
@@ -674,6 +693,78 @@ static void test_cursor_transparent(data_t *data)
 	data->alpha = 1.0;
 }
 
+static void do_timed_cursor_fb_change(data_t *data, enum cursor_change change)
+{
+	if (change == FIRSTIMAGE) {
+		igt_plane_set_fb(data->cursor, &data->timed_fb[0]);
+		igt_plane_set_position(data->cursor,
+				       data->left + data->cursor_max_w - 10,
+				       data->bottom - data->cursor_max_h - 10);
+	} else {
+		igt_plane_set_fb(data->cursor, &data->timed_fb[1]);
+	}
+}
+
+static void do_timed_cursor_fb_pos_change(data_t *data, enum cursor_change change)
+{
+	if (change == FIRSTIMAGE) {
+		igt_plane_set_fb(data->cursor, &data->timed_fb[0]);
+		igt_plane_set_position(data->cursor,
+				       data->left + data->cursor_max_w - 10,
+				       data->bottom - data->cursor_max_h - 10);
+	} else {
+		igt_plane_set_position(data->cursor,
+				       data->left + data->cursor_max_w + 20,
+				       data->bottom - data->cursor_max_h + 20);
+	}
+}
+
+static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum cursor_change))
+{
+	igt_crc_t crc1, crc2;
+
+	data->cursor = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_CURSOR);
+	changefunc(data, FIRSTIMAGE);
+
+	igt_display_commit(&data->display);
+
+	/* Extra vblank wait is because nonblocking cursor ioctl */
+	igt_wait_for_vblank_count(data->drm_fd,
+				  data->display.pipes[data->pipe].crtc_offset,
+				  data->vblank_wait_count);
+
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
+
+	/* get the screen refresh rate, then wait for vblank, and
+	 * wait for 1/5 of time of screen refresh and change image.
+	 * change it mid screen to validate that the change happens
+	 * at the end of the current frame.
+	 */
+	usleep(1.0f / data->refresh / 5.0f * 1e6);
+
+	changefunc(data, SECONDIMAGE);
+	igt_display_commit(&data->display);
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
+
+	igt_assert_crc_equal(&crc1, &crc2);
+
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
+
+	/* check next frame will be different as expected*/
+	igt_assert_f(igt_find_crc_mismatch(&crc1, &crc2, NULL),
+		     "crc values were not supposing to match!\n");
+}
+
+static void test_crc_cursors(data_t *data)
+{
+	timed_cursor_changes(data, do_timed_cursor_fb_change);
+}
+
+static void test_crc_pos_cursors(data_t *data)
+{
+	timed_cursor_changes(data, do_timed_cursor_fb_pos_change);
+}
+
 static void test_cursor_opaque(data_t *data)
 {
 	data->alpha = 1.0;
@@ -1013,6 +1104,57 @@ static void run_tests_on_pipe(data_t *data)
 	}
 
 	igt_fixture {
+		igt_create_color_fb(data->drm_fd, data->cursor_max_w, data->cursor_max_h,
+				DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+				1.f, 1.f, 1.f, &data->timed_fb[0]);
+
+		igt_create_color_fb(data->drm_fd, data->cursor_max_w, data->cursor_max_h,
+				DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+				1.f, 0.f, 0.f, &data->timed_fb[1]);
+	}
+
+	igt_describe("Validate CRC with two cursors");
+	igt_subtest_with_dynamic("async-cursor-crc-framebuffer-change") {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
+			data->pipe = pipe;
+
+			if (!valid_pipe_output_combo(data))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s",
+					  kmstest_pipe_name(pipe),
+					  data->output->name)
+				run_test(data, test_crc_cursors,
+					  data->cursor_max_w, data->cursor_max_h);
+		}
+	}
+
+	igt_describe("Validate CRC with two cursors and cursor position change");
+	igt_subtest_with_dynamic("async-cursor-crc-position-change") {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
+			data->pipe = pipe;
+
+			if (!valid_pipe_output_combo(data))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s",
+					  kmstest_pipe_name(pipe),
+					  data->output->name)
+				run_test(data, test_crc_pos_cursors,
+					  data->cursor_max_w, data->cursor_max_h);
+		}
+	}
+
+	igt_fixture {
+		igt_remove_fb(data->drm_fd, &data->timed_fb[0]);
+		igt_remove_fb(data->drm_fd, &data->timed_fb[1]);
+
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
 	}
 
-- 
2.34.1

