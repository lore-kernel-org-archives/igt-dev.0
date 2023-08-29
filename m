Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677D710E200
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 10:48:11 +0000 (UTC)
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 21:47:59 +0530
Message-Id: <20230829161759.9315-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 execution time on modest-transition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Thasleem@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Due to the more number of iterations, "modest-transition" tests are
getting timed out on CI. Reducing the number of iterations to half
can save a lot of execution time.

Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---
 tests/kms_atomic_transition.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a470eb88c..690202271 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -966,10 +966,7 @@ retry:
 		}
 	}
 
-	iter_max = 1 << j;
-
-	if (igt_run_in_simulation() && iter_max > 1)
-		iter_max = iter_max >> 1;
+	iter_max = j << 1;
 
 	if (igt_display_try_commit_atomic(&data->display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
-- 
2.34.1
