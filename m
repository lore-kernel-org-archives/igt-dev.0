Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B17F6E578
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 04:22:01 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 10:02:04 +0530
Message-Id: <20210406043204.14388-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vrr : Added subtest description
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

Added subtest description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 5b854100..e28864f5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -469,12 +469,18 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate");
 	igt_subtest("flip-basic")
 		run_vrr_test(&data, test_basic, 0);
 
+	igt_describe("Tests with DPMS that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate.");
 	igt_subtest("flip-dpms")
 		run_vrr_test(&data, test_basic, TEST_DPMS);
 
+	igt_describe("Tests that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate in a suspend test");
 	igt_subtest("flip-suspend")
 		run_vrr_test(&data, test_basic, TEST_SUSPEND);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
