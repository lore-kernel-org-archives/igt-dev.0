Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F2BC28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 04:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8213810E04A;
	Tue, 11 Mar 2025 04:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhA7ByH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E511410E04A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 04:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741667419; x=1773203419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xfJyjXh/sTkMBBIxwUG0D4zkzL1EdYKUuJrz3PRSQss=;
 b=bhA7ByH+IiIHhczrBZfTRHGnialACpPl2hYp4aFA1r9ltYeRs7g/YrLf
 deG8rArT+qOxHMtNLzfRgO80SGalnpR4aojXYRaJyQpHeOq9dH9ua45St
 mhTM1BtP3L/lEBTvhYKy604dXmQp+P7CxUWcwC90V+U5Ewjegd1RRalgk
 qDogPMWVqrQJOxLfBAbMV87B8RT2lcASuPKSSci1xieHQ0iAZSZZkeOxh
 D7rFEtSW2vkABQZoE4lblYtJBGT0BN/BtXSo1nc51Zwku2uHnXuGVpnZh
 iEp4+F9uyh8/ZUJ4okVQmE0ACJyS9iVti6pcd8+QiXcGAAGU8y4cV54Og w==;
X-CSE-ConnectionGUID: 4JvrS9/2QnacLWpN0TCFgg==
X-CSE-MsgGUID: N7vvV4wyTOuYRRbMTAf8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53316776"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="53316776"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 21:30:11 -0700
X-CSE-ConnectionGUID: Sk5Rs5TmScmkW9rzUIjbQg==
X-CSE-MsgGUID: wiF46ARfR2KepVppvMzF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120413681"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 21:30:10 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	juha-pekka.heikkila@intel.com
Subject: [PATCH v2] tests/kms_cursor_crc.: Test async cursor crc
Date: Tue, 11 Mar 2025 10:00:02 +0530
Message-Id: <20250311043002.127979-1-shekhar.chauhan@intel.com>
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

v2: Trim down the description.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/kms_cursor_crc.c | 139 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7c6f61f55..e3de107c8 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -100,6 +100,16 @@
  * @max-size:              Max supported size
  */
 
+/**
+ * SUBTEST: async-cursor-crc-framebuffer-change
+ * Description: Validate cursor IOCTLs tearing via framebuffer changes and CRC.
+ */
+
+/**
+ * SUBTEST: async-cursor-crc-position-change
+ * Description: Similar to async-cursor-change, but this test changes position.
+ */
+
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate cursor plane functionality. "
    "The test will position the cursor plane either fully onscreen, "
@@ -123,6 +133,11 @@ enum cursor_buffers {
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
@@ -151,6 +166,7 @@ typedef struct {
 	double alpha;
 	int vblank_wait_count; /* because of msm */
 	cursorarea oldcursorarea[MAXCURSORBUFFER];
+	struct igt_fb timed_fb[2];
 } data_t;
 
 static bool extended;
@@ -674,6 +690,78 @@ static void test_cursor_transparent(data_t *data)
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
@@ -1013,6 +1101,57 @@ static void run_tests_on_pipe(data_t *data)
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

