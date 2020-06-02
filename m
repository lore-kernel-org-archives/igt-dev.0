Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D489B83
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2020 08:55:44 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue,  2 Jun 2020 10:54:54 +0200
Message-Id: <20200602085454.22812-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_spin_batch: Remove unncessary
 non-preemptible workload
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

Following the rule "as few non-preemptible spinners as possible", this patch
removes IGT_SPIN_NO_PREEMPTION flag from spin-all subtest, where it was used
as a precaution.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/i915/gem_spin_batch.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index e7dd58ec..af0b67ca 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -147,12 +147,10 @@ static void spin_all(int i915, unsigned int flags)
 		if (flags & PARALLEL_SPIN_NEW_CTX)
 			ctx = gem_context_create(i915);
 
-		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
 				    .ctx = ctx,
 				    .engine = eb_ring(e),
-				    .flags = (IGT_SPIN_POLL_RUN |
-					      IGT_SPIN_NO_PREEMPTION));
+				    .flags = IGT_SPIN_POLL_RUN);
 		if (ctx)
 			gem_context_destroy(i915, ctx);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
