Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6DD10F99B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:22:50 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon,  7 Feb 2022 23:51:43 +0530
Message-Id: <20220207182152.31211-9-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 08/17] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_plane_multiple
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

Adding subtest to test new tiling format.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_multiple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index ebadc14b..1679f7ce 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -398,6 +398,9 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_subtest_f("atomic-pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
 
+	igt_subtest_f("atomic-pipe-%s-tiling-4", kmstest_pipe_name(pipe))
+		test_plane_position(data, pipe, I915_FORMAT_MOD_4_TILED);
+
 	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, DRM_FORMAT_MOD_LINEAR);
 }
-- 
2.17.1
