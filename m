Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552261121AF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 14:01:20 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Jul 2022 16:01:04 +0200
Message-Id: <d9a1b5eb559af9658a2201397c1fb725102213a7.1658322887.git.karolina.drobnik@intel.com>
In-Reply-To: <cover.1658322887.git.karolina.drobnik@intel.com>
References: <cover.1658322887.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/gem_exec_fence: Coordinate sleep
 with the start of the request
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Wait until we know the request is running on the GPU before sleeping
and giving a chance for other fences to run ahead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
---
 tests/i915/gem_exec_fence.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c1bd2a38..5f15fbdd 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -324,7 +324,10 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
-			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
+			    .flags =
+			    IGT_SPIN_FENCE_OUT |
+			    IGT_SPIN_POLL_RUN |
+			    spin_hang(flags));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
@@ -347,6 +350,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 		i++;
 	}
 
+	igt_spin_busywait_until_started(spin);
 	/* Long, but not too long to anger preemption disable checks */
 	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
 
-- 
2.25.1
