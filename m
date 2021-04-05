Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A72898EA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Apr 2021 18:48:21 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Tue,  6 Apr 2021 00:18:37 +0530
Message-Id: <20210405184837.3201540-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Add subtest description
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
Cc: Gupta@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_flip.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index e0d009d2..64907c2c 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1667,10 +1667,12 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests that nonblocking reading fails correctly");
 	igt_subtest("nonblocking-read")
 		test_nonblocking_read(drm_fd);
 
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		igt_describe("Basic test for validating modeset, dpms and pageflips");
 		igt_subtest_with_dynamic_f("%s%s",
 			      tests[i].flags & TEST_BASIC ? "basic-" : "",
 			      tests[i].name)
@@ -1679,6 +1681,7 @@ igt_main
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
+		igt_describe("Test for validating modeset, dpms and pageflips with a pair of connected displays");
 		igt_subtest_with_dynamic_f("2x-%s", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
@@ -1705,12 +1708,14 @@ igt_main
 		if (tests[i].flags & (TEST_EINVAL | TEST_EBUSY | TEST_HANG))
 			continue;
 
+		igt_describe("Interrupt test for validating modeset, dpms and pageflips");
 		igt_subtest_with_dynamic_f("%s-interruptible", tests[i].name)
 			run_test(tests[i].duration, tests[i].flags);
 
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
+		 igt_describe("Interrupt test for validating modeset, dpms and pageflips with pair of connected displays");
 		igt_subtest_with_dynamic_f("2x-%s-interruptible", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
