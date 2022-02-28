Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2314110E4AE
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 10:45:14 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Feb 2022 16:16:23 +0530
Message-Id: <20220228104623.12757-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] IGT cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Before starting the next subtest, clean up the states to default
values, those are assumed by other tests.

v2: And also before running the subtest we need to sanitize the system state
to default, since we can't trust the state of previous subtest, used
igt_display_reset() to sanitize the state. (Bhanuprakash Modem)

Below tests are modified:
	tests/kms_concurrent.c
	tests/kms_sequence.c

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 4 +++-
 tests/kms_sequence.c   | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1b8f4b04..705546e5 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -82,7 +82,8 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
 	}
 
 	/* reset the constraint on the pipe */
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	free(data->plane);
 	data->plane = NULL;
@@ -375,6 +376,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_reset(&data.display);
 		igt_require(data.display.is_atomic);
 	}
 
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9c287480..9dbb6897 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -109,8 +109,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
-	igt_display_commit(display);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
@@ -278,6 +278,7 @@ igt_main
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
+		igt_display_reset(&data.display);
 	}
 
 	for (f = funcs; f->name; f++) {
-- 
2.26.2
