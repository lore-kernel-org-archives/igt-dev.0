Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E98A10F031
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 09:10:31 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 14:39:28 +0530
Message-Id: <20220218090936.15857-9-jeevan.b@intel.com>
In-Reply-To: <20220218090936.15857-1-jeevan.b@intel.com>
References: <20220218090936.15857-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 08/16] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_plane_lowres
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
 tests/kms_plane_lowres.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 6c0fce86..3f3f77c8 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -314,6 +314,9 @@ igt_main
 			     "high and low resolution with yf-tiling.");
 		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
+
+		igt_subtest_f("pipe-%s-tiling-4", kmstest_pipe_name(pipe))
+			test_planes_on_pipe(&data, I915_FORMAT_MOD_4_TILED);
 	}
 
 	igt_fixture {
-- 
2.17.1
