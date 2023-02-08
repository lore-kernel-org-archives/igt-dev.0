Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BC610E6E1
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 09:19:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	nidhi1.gupta@intel.com
Date: Wed,  8 Feb 2023 14:45:08 +0530
Message-Id: <20230208091508.1488751-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_atomic_transition: Reduce the execution
 time on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Due to the more number of iterations, "modest-transition" tests are
getting timed out on pre-si CI. Reducing the number of iterations to
half can save a lot of execution time.

This patch will also do some cleanup before exiting the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 6d2ebbbff..3d206aaa2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -714,6 +714,9 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+	if (fb == NULL)
+		return event_mask;
+
 	for_each_pipe(&data->display, pipe) {
 		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
 			DRM_PLANE_TYPE_PRIMARY);
@@ -858,6 +861,9 @@ retry:
 
 	iter_max = 1 << j;
 
+	if (igt_run_in_simulation() && iter_max > 1)
+		iter_max = iter_max >> 1;
+
 	if (igt_display_try_commit_atomic(&data->display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
-- 
2.39.0
