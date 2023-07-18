Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B839810E312
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 11:09:46 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jul 2023 16:30:06 +0530
Message-ID: <20230718110006.28283-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict the hang tests
 execution to first and last pipe combinations
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

restrict the hang tests execution to single pipe combinations still
causing timed-out so limiting the combination to first and last pipe.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ef2234f74..ee4e8a43d 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1729,10 +1729,14 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to PIPE_A combination for hang tests */
+					/* Limit the execution to 2 CRTCs
+					 * (first and last combination) for hang tests */
 					if ((flags & TEST_HANG) && !all_pipes &&
 					    (n != 0 && n != resources->count_crtcs))
 						continue;
+					if ((flags & TEST_HANG) && !all_pipes &&
+					    m != resources->count_crtcs - 1)
+						continue;
 
 					run_test_on_crtc_set(&o, crtc_idxs,
 							     RUN_PAIR,
-- 
2.41.0
