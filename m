Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820986E3C4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Nov 2021 01:56:45 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Fri, 26 Nov 2021 07:27:35 +0530
Message-Id: <20211126015735.908681-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
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

This a known failure when running igt@gem_exec_balancer@bonded-(dual|pair|sync)
tests with GuC submission.The hang is expected with GuC submission since the
test was written to expect execlist scheduling hence added skip if Guc
submission enabled.

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
