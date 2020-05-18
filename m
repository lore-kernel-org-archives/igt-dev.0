Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 18 May 2020 23:14:08 +0100
Message-Id: <20200518221408.1540038-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
References: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf: Hide any leak in
 gen8-unprivileged-single-ctx-counters
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

gen8-unprivileged-single-counters appears to leak contexts, and does not
appear to be doing so intentionally.. Let's assume it's a bug in the
test and see if the contexts are released along with the device fd.
(If they are not released, that is more clearly an issue.)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_fence.c | 2 +-
 tests/perf.c                | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 5b504e5c8..b88472c3a 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -1479,7 +1479,7 @@ static void test_syncobj_future_submit(int i915, unsigned int engine)
 	/*
 	 * Here we submit client A waiting on client B, but internally client
 	 * B has a semaphore that waits on client A. This relies on timeslicing
-	 * to reorder B before A, even though userspace has asked to submit
+	 * to reorder A before B, even though userspace has asked to submit
 	 * A & B simultaneously (and due to the sequence we will submit B
 	 * then A).
 	 */
diff --git a/tests/perf.c b/tests/perf.c
index d4ebae30d..c78f02a8d 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3428,6 +3428,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 				.format = test_set->perf_oa_format
 			};
 
+			drm_fd = gem_reopen_driver(drm_fd);
+
 			bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
 			drm_intel_bufmgr_gem_enable_reuse(bufmgr);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
