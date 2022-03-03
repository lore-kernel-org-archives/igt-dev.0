Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6743A10E191
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 04:25:47 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Mar 2022 09:57:00 +0530
Message-Id: <20220303042700.3690-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] IGT cleanup
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
 tests/kms_sequence.c   | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1b8f4b04..72a55e65 100644
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
@@ -316,6 +317,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_fixture {
 		int valid_tests = 0;
+		igt_display_reset(&data->display);
 
 		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9c287480..2afdb13a 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -109,8 +109,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
-	igt_display_commit(display);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
@@ -278,6 +278,7 @@ igt_main
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
+		igt_display_reset(&data.display);
 	}
 
 	for (f = funcs; f->name; f++) {
@@ -289,6 +290,7 @@ igt_main
 				     "drmCrtcQueueSequence");
 			igt_subtest_f("%s-%s", f->name, m->name) {
 				data.flags = m->flags;
+				igt_display_reset(&data.display);
 				run_test(&data, fd, f->func);
 			}
 		}
-- 
2.26.2
