Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F4D10E0E5
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 16:14:52 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 21:43:53 +0530
Message-Id: <20230316161353.30915-1-swati2.sharma@intel.com>
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

With this fix we are solving 2 issues. Firstly, the
planes_scaling_combo() tests were leaving one scaler assigned
after running sub-test with two consecutive planes because
one scaler was getting reused in the next run.

Secondly, when k == n_planes - 1, we were trying to access
planes[n_planes], which led to array out of bounds error.

Suggested-by: Luca Coelho <luciano.coelho@intel.com>
Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reported-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3a6904afb..3898446ed 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -744,7 +744,7 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		igt_assert(0);
 	}
 
-	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
+	for (int k = 0; k < display->pipes[pipe].n_planes; k += 2) {
 		igt_plane_t *p1, *p2;
 
 		p1 = &display->pipes[pipe].planes[k];
-- 
2.25.1
