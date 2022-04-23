Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D0510E1F8
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Sep 2023 18:48:37 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 24 Apr 2022 04:56:06 +0530
Message-Id: <20220423232606.7737-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230829161759.9315-1-mohammed.thasleem@intel.com>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 number of iterations on modeset-transition
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

Due to the more number of iterations, "modeset-transition" tests are
getting timed out on CI. Reducing the number of iterations on pipes
(e.g for 4 pipes it would be 8 iterations). Which can save a lot of
execution time.
Earlier it was 1 << j (nuber of pipes), which is changed to j << 1.

Table for reference:
j  | 1 << j | j << 1
---------------------
0  |    1   |   0
1  |    2   |   2
2  |    4   |   4
3  |    8   |   6
4  |   16   |   8
5  |   32   |   10

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
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
2.25.1
