Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F223210E0BE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 14:47:50 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 20:20:19 +0530
Message-Id: <20230316145019.24480-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Fix out-of-bound
 array access
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luca Coelho <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When k == n_planes - 1, we will try to access planes[n_planes],
which is out of bounds. Fix this.

Reported-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3a6904afb..8d78752cc 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -744,7 +744,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		igt_assert(0);
 	}
 
-	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
+	for (int k = 0; k < display->pipes[pipe].n_planes - 1; k++) {
 		igt_plane_t *p1, *p2;
 
 		p1 = &display->pipes[pipe].planes[k];
-- 
2.25.1
