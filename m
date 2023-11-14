Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5472A10E1B8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 04:38:56 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 10:22:19 +0530
Message-Id: <20231114045224.622841-2-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231114045224.622841-1-sujaritha.sundaresan@intel.com>
References: <20231114045224.622841-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 1/6] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

This reverts commit f6f5903348eff6510f8877043f9397a2a5cb94b3.

This patch is causing the regression in CI.

[1767/1775] Generating i915_tests.rst with a custom command
FAILED: docs/testplan/i915_tests.rst
./igt_doc.py --config ../tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path ./build
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted doesn't exist on source files
Warning: Documented igt@syncobj_timeline@invalid-single-wait-available-unsubmitted doesn't exist on source files
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
Please refer: docs/test_documentation.md for more details
[1771/1775] Compiling C object runner/runner_test.p/runner_tests.c.o
ninja: build stopped: subcommand failed.

Cc: Erik Kurzinger <ekurzinger@nvidia.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/syncobj_timeline.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 0422bca51..b4e1d093a 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1782,7 +1782,7 @@ igt_main
 						WAIT_SIGNALED)) != 1)
 			continue;
 
-		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
+		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
 			err = -EINVAL;
 		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
 			err = -ETIME;
@@ -1851,7 +1851,7 @@ igt_main
 			continue;
 
 		err = 0;
-		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
+		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
 			err = -EINVAL;
 		} else if (flags & WAIT_ALL) {
 			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
-- 
2.25.1
