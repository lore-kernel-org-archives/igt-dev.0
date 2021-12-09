Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784F089226
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 06:48:36 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Thu,  9 Dec 2021 12:18:47 +0530
Message-Id: <20211209064847.1412190-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This test makes assumptions about the backend scheduling algorithm that
a real world UMD would never assume. This test is not testing a UMD-KMD
contract, rather a specific backend.It is an invalid test case thus we
are skipping.

Changes Since v1:
             -Updated commit message

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/i915/gem_exec_balancer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index cc07a5a9..d58734ab 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -3320,6 +3320,7 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
+			igt_require(!gem_using_guc_submission(i915));
 			intel_allocator_multiprocess_start();
 		}
 
-- 
2.25.1
