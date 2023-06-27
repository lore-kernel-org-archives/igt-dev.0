Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5108110E349
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 20:23:21 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 01:43:27 +0530
Message-ID: <20230627201327.24312-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Restrict the hang tests
 execution to single pipe combinations
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

To save the CI execution time, instead of running on all pipes
restrict the hang tests execution to single pipe combinations.

If we want to execute on all pipes, we need to pass an extra
argument "-e" indicates extended.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f1e0700c1..00bb7e962 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1729,6 +1729,11 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
+					/* Limit the execution to PIPE_A combination for hang tests */
+					if ((flags & TEST_HANG) && !all_pipes &&
+					    (n != 0 && n != resources->count_crtcs))
+						continue;
+
 					run_test_on_crtc_set(&o, crtc_idxs,
 							     RUN_PAIR,
 							     resources->count_crtcs,
-- 
2.41.0
