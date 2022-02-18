Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FD10F015
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 09:10:29 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 14:39:27 +0530
Message-Id: <20220218090936.15857-8-jeevan.b@intel.com>
In-Reply-To: <20220218090936.15857-1-jeevan.b@intel.com>
References: <20220218090936.15857-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 07/16] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_plane_multiple
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
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
