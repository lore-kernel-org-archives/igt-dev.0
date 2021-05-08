Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0E6E867
 for <igt-dev@lists.freedesktop.org>; Sat,  8 May 2021 08:33:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat,  8 May 2021 21:52:56 +0530
Message-Id: <20210508162303.8235-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v5 i-g-t 07/14] tests/kms_atomic_transition: Fix mode
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

When two monitors connected through MST, the second monitor also
tries to use the same mode. So two such modes may not fit into the
link bandwidth.

This patch will find a combination of modes that fit into the BW.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index be60940d7..e6931de5f 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -100,6 +100,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_remove_fb(data->drm_fd, &fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void *fence_inc_thread(void *arg)
@@ -793,6 +794,7 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+retry:
 	for_each_connected_output(&data->display, output) {
 		drmModeModeInfo *mode = igt_output_get_mode(output);
 
@@ -839,6 +841,19 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 
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
