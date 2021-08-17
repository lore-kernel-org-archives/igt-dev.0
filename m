Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3996E213
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 17:37:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i28so16136809lfl.2
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 10:37:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 17 Aug 2021 20:36:59 +0300
Message-Id: <20210817173659.6303-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/atomic_vs_legacy_commit: check atomic
 vs legacy commit effect
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

see both ways to reset display will reset plane alpha.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/atomic_vs_legacy_commit.c | 112 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 tests/atomic_vs_legacy_commit.c

diff --git a/tests/atomic_vs_legacy_commit.c b/tests/atomic_vs_legacy_commit.c
new file mode 100644
index 000000000..bca78c928
--- /dev/null
+++ b/tests/atomic_vs_legacy_commit.c
@@ -0,0 +1,112 @@
+#include "igt.h"
+
+IGT_TEST_DESCRIPTION( "Simple atomic vs legacy commit verification");
+
+struct {
+	int drm_fd;
+	igt_display_t display;
+	struct igt_fb fb;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	igt_plane_t *primary;
+
+	igt_crc_t atomic_0xbeef_crc;
+	igt_crc_t legacy_clean_crc;
+	igt_crc_t atomic_clean_crc;
+} data;
+
+igt_main
+{
+	drmModeModeInfo *mode;
+	char *crcstr;
+	igt_crc_t mid_crc;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+
+		kmstest_set_vt_graphics_mode();
+		igt_require_pipe_crc(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+	}
+
+	igt_describe("Simple atomic vs legacy commit verification");
+	igt_subtest_f("legacy-vs-atomic-commit-reset-alpha") {
+		data.output = igt_get_single_output_for_pipe(&data.display, PIPE_A);
+		igt_require(data.output);
+		igt_output_set_pipe(data.output, PIPE_A);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+
+		mode = igt_output_get_mode(data.output);
+
+		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			1.0, 1.0, 1.0, &data.fb);
+
+		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, PIPE_A, INTEL_PIPE_CRC_SOURCE_AUTO);
+		data.primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
+
+		// get 'non reset crc'
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_plane_set_prop_value(data.primary, IGT_PLANE_ALPHA, 0xbeef);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+
+		igt_pipe_crc_start(data.pipe_crc);
+		igt_pipe_crc_get_current(data.drm_fd, data.pipe_crc, &data.atomic_0xbeef_crc);
+		igt_pipe_crc_stop(data.pipe_crc);
+		crcstr = igt_crc_to_string(&data.atomic_0xbeef_crc);
+		igt_info("non-reset 0xbeef crc %s\n", crcstr);
+		free(crcstr);
+
+		// get legacy reset crc
+		igt_display_reset(&data.display);
+		igt_output_set_pipe(data.output, PIPE_A);
+		igt_display_commit2(&data.display, COMMIT_LEGACY);
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_display_commit2(&data.display, COMMIT_LEGACY);
+
+		igt_pipe_crc_start(data.pipe_crc);
+		igt_pipe_crc_get_current(data.drm_fd, data.pipe_crc, &data.legacy_clean_crc);
+		igt_pipe_crc_stop(data.pipe_crc);
+		crcstr = igt_crc_to_string(&data.legacy_clean_crc);
+		igt_info("legacy commit reset crc %s\n", crcstr);
+		free(crcstr);
+
+
+		// get atomic reset crc, first set 0xbeef in place and check we got it.
+		igt_plane_set_prop_value(data.primary, IGT_PLANE_ALPHA, 0xbeef);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+		igt_pipe_crc_start(data.pipe_crc);
+		igt_pipe_crc_get_current(data.drm_fd, data.pipe_crc, &mid_crc);
+		igt_pipe_crc_stop(data.pipe_crc);
+
+		igt_assert_f(igt_check_crc_equal(&mid_crc, &data.atomic_0xbeef_crc), "test error! something weird!\n");
+		crcstr = igt_crc_to_string(&mid_crc);
+		igt_info("mid crc should match 0xbeef crc %s\n", crcstr);
+		free(crcstr);
+
+		igt_display_reset(&data.display);
+		igt_output_set_pipe(data.output, PIPE_A);
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+
+		igt_pipe_crc_start(data.pipe_crc);
+		igt_pipe_crc_get_current(data.drm_fd, data.pipe_crc, &data.atomic_clean_crc);
+		igt_pipe_crc_stop(data.pipe_crc);
+		crcstr = igt_crc_to_string(&data.atomic_clean_crc);
+		igt_info("atomic commit reset crc %s\n", crcstr);
+		free(crcstr);
+
+		// aftermath 
+		igt_pipe_crc_free(data.pipe_crc);
+		igt_assert_crc_equal(&data.legacy_clean_crc, &data.atomic_clean_crc);		
+	}
+
+	igt_fixture {
+		igt_display_reset(&data.display);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+		kmstest_restore_vt_mode();
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1bdfddbb2..b03d392a1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,4 +1,5 @@
 test_progs = [
+	'atomic_vs_legacy_commit',
 	'core_auth',
 	'core_getclient',
 	'core_getstats',
-- 
2.28.0
