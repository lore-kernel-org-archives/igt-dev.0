Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700556E05A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 13:40:20 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 28 Jul 2020 18:47:32 +0530
Message-Id: <20200728131732.27299-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_multipipe_modeset: Changes based
 on lib updates and minor fixes
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

-Due to changes in igt lib, the igt_display_get_n_pipes() function now
 returns IGT_MAX_PIPES as opposed to the maximum pipes supported by a
 given platform which it was returning before. Made changes in the test
 to accommodate this.

-Removed the redundant kms_unset_all_crtcs, which also speeds up the test.

-Added freeing of resources which was missing.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_multipipe_modeset.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index fb0b9662..b06c4e82 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -112,12 +112,11 @@ static void run_test(data_t *data, int valid_outputs)
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static void test_multipipe(data_t *data)
+static void test_multipipe(data_t *data, int num_pipes)
 {
 	igt_output_t *output;
-	int valid_outputs = 0, num_pipes;
+	int valid_outputs = 0;
 
-	num_pipes = igt_display_get_n_pipes(&data->display);
 	for_each_connected_output(&data->display, output)
 		valid_outputs++;
 
@@ -142,15 +141,15 @@ igt_main
 
 		res = drmModeGetResources(data.drm_fd);
 		igt_assert(res);
-
-		kmstest_unset_all_crtcs(data.drm_fd, res);
 	}
 
 	igt_describe("Verify if simultaneous modesets on all the supported "
 		     "pipes is successful. Validate using CRC verification");
 	igt_subtest("basic-max-pipe-crc-check")
-		test_multipipe(&data);
+		test_multipipe(&data, res->count_crtcs);
 
-	igt_fixture
+	igt_fixture {
+		drmModeFreeResources(res);
 		igt_display_fini(&data.display);
+	}
 }
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
