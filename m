Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336510E0E6
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Aug 2023 16:48:10 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Aug 2023 22:17:29 +0530
Message-Id: <20230806164729.1016167-5-swati2.sharma@intel.com>
In-Reply-To: <20230806164729.1016167-1-swati2.sharma@intel.com>
References: <20230806164729.1016167-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_color: skip deep-color test
 for mst
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ankit.k.nautiyal@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In intel driver, for MST streams pipe_bpp is restricted to 8bpc.
So, deep-color >= 10bpc will never work for DP-MST even if panel
supports 10bpc.

Test checks panel supports 10bpc and tries to find such a
combination of mode that can really work with 10bpc. So, with
n1 modes in MST1 and n2 modes in MST2, test will try n1xn2 times
and eventually SKIP. However, trying with these many combinations
it is leading to excessive logging ultimately killing the test.

Once KMD FIXME, is resolved this MST constraint can be removed.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/8615
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b15b9572c..4a410c039 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -847,8 +847,17 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 
-		if (is_intel_device(data->drm_fd) &&
-		    !igt_max_bpc_constraint(&data->display, p, output, 10))
+		/*
+		 * In intel driver, for MST streams pipe_bpp is
+		 * restricted to 8bpc. So, deep-color >= 10bpc
+		 * will never work for DP-MST even if the panel
+		 * supports 10bpc. Once KMD FIXME, is resolved
+		 * this MST constraint can be removed.
+		 */
+		if (is_intel_device(data->drm_fd) && igt_check_output_is_dp_mst(data->drm_fd, output))
+			continue;
+
+		if (is_intel_device(data->drm_fd) && !igt_max_bpc_constraint(&data->display, p, output, 10))
 			continue;
 
 		data->color_depth = 10;
-- 
2.25.1
