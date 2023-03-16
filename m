Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB2710E22C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 15:10:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 20:42:27 +0530
Message-Id: <20230316151227.29301-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Free scalers from
 previous run
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

The planes_scaling_combo() tests were leaving scalers assigned
after running each sub-test.

To clean up the scalers from previous runs, we have to commit
after setting plane fb to NULL. This ensures that the scalers are
properly freed.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3a6904afb..1e038fa43 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,6 +695,8 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_plane_set_fb(p1, NULL);
 	igt_plane_set_fb(p2, NULL);
 
+	igt_display_commit(display);
+
 	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
 		      "Scaling op not supported by driver\n");
 	igt_assert_eq(ret, 0);
-- 
2.25.1
