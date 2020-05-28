Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17C86E506
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 08:27:42 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Thu, 28 May 2020 10:27:37 +0200
Message-Id: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Reduce non-preemptible
 workload
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
List-ID: <igt-dev@lists.freedesktop.org>

Non-preemptible spinners should be avoided as often as possible.
gem_exec_fence@[basic-await, nb-await] has no reason to use non-preemptible
workload, only hanging subtests need it.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/i915/gem_exec_fence.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index ad22f9f5..d70e73a2 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -344,9 +344,10 @@ static void test_fence_await(int fd, const struct intel_execution_engine2 *e,
 
 	spin = igt_spin_new(fd,
 			    .engine = e->flags,
-			    .flags = (IGT_SPIN_FENCE_OUT |
+			    .flags = IGT_SPIN_FENCE_OUT |
+				     (flags & HANG ?
 				      IGT_SPIN_NO_PREEMPTION |
-				      (flags & HANG ? IGT_SPIN_INVALID_CS : 0)));
+				      IGT_SPIN_INVALID_CS : 0));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
