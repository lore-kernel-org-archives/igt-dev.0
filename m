Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D266EA6D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 09:19:55 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Fri,  6 Nov 2020 14:57:57 +0530
Message-Id: <20201106092757.21505-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC, i-g-t] Added dynamic Subtest
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..aa2afe02 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1025,16 +1025,16 @@ igt_main
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
 	for (i = 1; i <= IGT_MAX_PIPES; i++) {
-		igt_subtest_f("%ix-modeset-transitions", i)
+		igt_subtest_with_dynamic_f("%ix-modeset-transitions", i)
 			run_modeset_transition(&display, i, false, false);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
+		igt_subtest_with_dynamic_f("%ix-modeset-transitions-nonblocking", i)
 			run_modeset_transition(&display, i, true, false);
 
-		igt_subtest_f("%ix-modeset-transitions-fencing", i)
+		igt_subtest_with_dynamic_f("%ix-modeset-transitions-fencing", i)
 			run_modeset_transition(&display, i, false, true);
 
-		igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
+		igt_subtest_with_dynamic_f("%ix-modeset-transitions-nonblocking-fencing", i)
 			run_modeset_transition(&display, i, true, true);
 	}
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
