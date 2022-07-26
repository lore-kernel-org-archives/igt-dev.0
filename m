Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241F2BEAE
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 10:13:17 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 12:13:12 +0200
Message-Id: <8e33260c9fdfbc3d4508d71903063ebb1a2dcc6c.1658826356.git.karolina.drobnik@intel.com>
In-Reply-To: <cover.1658826356.git.karolina.drobnik@intel.com>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/gem_exec_fence: Coordinate
 sleep with the start of the request
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
 tests/i915/gem_exec_fence.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 260aa82c..7ff7614d 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -324,7 +324,9 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
-			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
+			    .flags = IGT_SPIN_FENCE_OUT |
+				     IGT_SPIN_POLL_RUN |
+				     spin_hang(flags));
 	igt_assert(spin->out_fence != -1);
 
 	i = 0;
@@ -347,6 +349,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 		i++;
 	}
 
+	igt_spin_busywait_until_started(spin);
 	/* Long, but not too long to anger preemption disable checks */
 	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
 
-- 
2.25.1
