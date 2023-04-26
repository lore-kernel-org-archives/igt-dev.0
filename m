Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93010E96E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:08 +0530
Message-Id: <20230426114725.2244653-29-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 28/45] tests/kms_atomic_transition: Add XE
 support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic_transition.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 7c7be578c..9f39d033d 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -136,7 +136,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	if (data->extended)
 		return false;
 
-	if (!is_i915_device(data->drm_fd))
+	if (!is_intel_device(data->drm_fd))
 		return false;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -848,7 +848,7 @@ retry:
 		/* count enable pipes to set max iteration */
 		j += 1;
 
-		if (is_i915_device(data->drm_fd))
+		if (is_intel_device(data->drm_fd))
 			data->pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i,
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -943,7 +943,7 @@ retry:
 			commit_display(data, i, nonblocking);
 			collect_crcs_mask(data->pipe_crcs, i, crcs[4]);
 
-			if (!is_i915_device(data->drm_fd))
+			if (!is_intel_device(data->drm_fd))
 				continue;
 
 			for (int k = 0; k < IGT_MAX_PIPES; k++) {
@@ -996,7 +996,7 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 	unset_output_pipe(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	if (is_i915_device(data->drm_fd)) {
+	if (is_intel_device(data->drm_fd)) {
 		for_each_pipe(&data->display, pipe)
 			igt_pipe_crc_free(data->pipe_crcs[pipe]);
 	}
-- 
2.40.0
