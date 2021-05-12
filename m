Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C21F6EB6A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:29 +0530
Message-Id: <20210512170536.4778-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 07/14] tests/kms_atomic_transition: Fix mode
 selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

V2:
* Fix commit message (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index be60940d7..d8085ef3b 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -100,6 +100,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_remove_fb(data->drm_fd, &fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void *fence_inc_thread(void *arg)
@@ -784,7 +785,7 @@ static void collect_crcs_mask(igt_pipe_crc_t **pipe_crcs, unsigned mask, igt_crc
 static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool fencing)
 {
 	struct igt_fb fbs[2];
-	int i, j = 0;
+	int i, j;
 	unsigned iter_max;
 	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
 	igt_output_t *output;
@@ -793,6 +794,8 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+retry:
+	j = 0;
 	for_each_connected_output(&data->display, output) {
 		drmModeModeInfo *mode = igt_output_get_mode(output);
 
@@ -839,6 +842,19 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 
 	iter_max = 1 << j;
 
+	if (igt_display_try_commit_atomic(&data->display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL) != 0) {
+		igt_output_t *out;
+		bool found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
+		igt_require_f(found, "No valid mode combo found.\n");
+
+		for_each_connected_output(&data->display, out)
+			igt_output_set_pipe(out, PIPE_NONE);
+
+		goto retry;
+	}
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	for (i = 0; i < iter_max; i++) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
