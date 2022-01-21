Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903B10E307
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 15:07:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p27so34555484lfa.1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 07:07:26 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 21 Jan 2022 17:07:11 +0200
Message-Id: <20220121150711.31407-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_flip_tiling: Handle lost
 flip event
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
List-ID: <igt-dev@lists.freedesktop.org>

If test fails to receive flip event within 50ms time period
running test as well as all following subtests will fail.
Fix actually failing test to be only one to be flagged and
following subtests will not be affected by previous failure.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_flip_tiling.c | 40 ++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index 913657993..ba9ff46ed 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -39,7 +39,9 @@ typedef struct {
 	int gen;
 	uint32_t testformat;
 	struct igt_fb fb[2];
+	struct igt_fb old_fb[2];
 	igt_pipe_crc_t *pipe_crc;
+	bool flipevent_in_queue; // if test fails may need to handle rogue event
 } data_t;
 
 static void pipe_crc_free(data_t *data)
@@ -71,12 +73,13 @@ static int try_commit(igt_display_t *display)
 static void
 test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
 {
-	struct igt_fb old_fb[2] = { data->fb[0], data->fb[1] };
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	igt_crc_t reference_crc, crc;
 	int fb_id, ret;
 
+	memcpy(&data->old_fb, &data->fb, sizeof(data->fb));
+
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane(output, 0);
@@ -117,14 +120,16 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	 */
 	igt_require(ret == 0);
 
+	data->flipevent_in_queue = true;
 	kmstest_wait_for_pageflip(data->drm_fd);
+	data->flipevent_in_queue = false;
 
 	/* Get a crc and compare with the reference. */
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc);
 	igt_assert_crc_equal(&reference_crc, &crc);
 
-	igt_remove_fb(data->drm_fd, &old_fb[0]);
-	igt_remove_fb(data->drm_fd, &old_fb[1]);
+	igt_remove_fb(data->drm_fd, &data->old_fb[0]);
+	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
 }
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
@@ -141,7 +146,31 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb[1]);
 }
 
-static data_t data;
+static void handle_lost_event(data_t *data) {
+	// wait for max 5 seconds in case hit swapping or similar in progress.
+	drmEventContext evctx = { .version = 2 };
+	struct timeval timeout = { .tv_sec = 5};
+	fd_set fds;
+	int ret;
+
+	FD_ZERO(&fds);
+	FD_SET(data->drm_fd, &fds);
+	do {
+		errno = 0;
+		ret = select(data->drm_fd + 1, &fds, NULL, NULL, &timeout);
+	} while (ret < 0 && errno == EINTR);
+
+	// TODO: if still failed may need to reset/restart everything to
+	// avoid consecutive tests failing.
+
+	igt_assert(drmHandleEvent(data->drm_fd, &evctx) == 0);
+
+	data->flipevent_in_queue = false;
+	igt_remove_fb(data->drm_fd, &data->old_fb[0]);
+	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
+}
+
+static data_t data = {};
 igt_output_t *output;
 
 igt_main
@@ -189,6 +218,9 @@ igt_main
 						      igt_fb_modifier_name(modifier[0]),
 						      igt_fb_modifier_name(modifier[1]))
 						test_flip_tiling(&data, pipe, output, modifier);
+
+					if (data.flipevent_in_queue)
+						handle_lost_event(&data);
 				}
 			}
 			test_cleanup(&data, pipe, output);
-- 
2.28.0
