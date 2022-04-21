Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1CF10E3B2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 17:22:17 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 19:49:35 +0530
Message-Id: <20220421141935.1460-1-mohammed.thasleem@intel.com>
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

Due to the higher number of iterations, "modeset-transition" tests are
getting timed out on CI. Reducing the number of iterations can save a
lot of execution time.

Instead of having (2 ^ j) iterations, reduce it to (2 * j) where j is
the number of active pipes.

v2: Update commit message.
v3: Update commit message and minor changes.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_atomic_transition.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a470eb88c..6c914ec21 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -966,10 +966,7 @@ retry:
 		}
 	}
 
-	iter_max = 1 << j;
-
-	if (igt_run_in_simulation() && iter_max > 1)
-		iter_max = iter_max >> 1;
+	iter_max = (j > 0) ? (j << 1) : 1;
 
 	if (igt_display_try_commit_atomic(&data->display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
-- 
2.25.1
