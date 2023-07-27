Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705210E123
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 13:05:37 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Jul 2023 18:25:35 +0530
Message-ID: <20230727125535.2832-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict multi-display hang
 tests execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Restrict the hang tests execution to the first and last pipe
combinations to avoid timeouts on CI.

v2: Update the subject and combine the if condition.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ef2234f74..739939ce3 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1729,9 +1729,13 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to PIPE_A combination for hang tests */
-					if ((flags & TEST_HANG) && !all_pipes &&
-					    (n != 0 && n != resources->count_crtcs))
+					/*
+					 * Limit the execution to 2 CRTCs
+					 * (first and last combination) for hang tests
+					 */
+					if (((flags & TEST_HANG) && !all_pipes) &&
+					    ((n != 0 && n != resources->count_crtcs) ||
+					    m != resources->count_crtcs - 1))
 						continue;
 
 					run_test_on_crtc_set(&o, crtc_idxs,
-- 
2.41.0
