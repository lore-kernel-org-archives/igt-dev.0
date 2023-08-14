Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657FE10E151
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 08:01:53 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Aug 2023 13:35:27 +0530
Message-Id: <20230814080527.3017102-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] RFC: tests/kms_setmode: rename subtest to
 simplify test combinations
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

Both 'basic-clone-single-crtc' and 'invalid-clone-single-crtc' tests aim to
assess a scenario where two connectors are attempted to be run with a single
CRTC, which is not feasible.  Consequently, the  'basic-clone-single-crtc'
test is marked as invalid and skipped due to the impractical scenario. On the
other hand, the 'invalid-clone-single-crtc' test serves as a negative scenario,
confirming the failure of the 'ioctl' and indicating a successful test.

similarly, the 'invalid-clone-exclusive-crtc' test attempts to run two connectors
with two CRTCs, which is indeed possible, rendering the test nonsensical.
Consequently, the 'clone-exclusive-crtc' test runs and passes as expected.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
---
 tests/kms_setmode.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 035bbd0b0..0c65e3937 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -932,12 +932,8 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		const char *name;
 	} tests[] = {
 		{ TEST_TIMINGS, "basic" },
-		{ TEST_CLONE | TEST_SINGLE_CRTC_CLONE,
-					"basic-clone-single-crtc" },
 		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE,
-					"invalid-clone-single-crtc" },
-		{ TEST_INVALID | TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
-					"invalid-clone-exclusive-crtc" },
+					"clone-single-crtc-negative" },
 		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
 					"clone-exclusive-crtc" },
 		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE | TEST_STEALING,
-- 
2.25.1
