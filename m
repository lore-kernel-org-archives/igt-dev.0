Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F331089B96
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 06:32:07 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Mon, 20 Sep 2021 12:00:59 +0530
Message-Id: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync.c : Add allocator
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_sync.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 6cb00c40..7c669e08 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -249,6 +249,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		double end, this, elapsed, now, baseline;
 		unsigned long cycles;
 		igt_spin_t *spin;
+		uint64_t ahnd;
 
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
@@ -260,7 +261,8 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		execbuf.flags = ied_flags(&ied, child);
 		execbuf.rsvd1 = ctx->id;
 
-		spin = __igt_spin_new(fd,
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+		spin = __igt_spin_new(fd, .ahnd = ahnd,
 				      .ctx = ctx,
 				      .engine = execbuf.flags,
 				      .flags = (IGT_SPIN_POLL_RUN |
@@ -323,6 +325,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 		igt_spin_free(fd, spin);
 		gem_close(fd, object.handle);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
@@ -341,13 +344,16 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 		double start, end, elapsed;
 		unsigned long cycles;
 		igt_spin_t *spin[2];
+		uint64_t ahnd[2];
 
-		spin[0] = __igt_spin_new(fd,
+		ahnd[0] = get_reloc_ahnd(fd, ctx->id);
+		spin[0] = __igt_spin_new(fd, .ahnd = ahnd[0],
 					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
 
-		spin[1] = __igt_spin_new(fd,
+		ahnd[1] = get_reloc_ahnd(fd, ctx->id);
+		spin[1] = __igt_spin_new(fd, .ahnd = ahnd[1],
 					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
@@ -370,6 +376,8 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 		} while ((elapsed = gettime()) < end);
 		igt_spin_free(fd, spin[1]);
 		igt_spin_free(fd, spin[0]);
+		put_ahnd(ahnd[0]);
+		put_ahnd(ahnd[1]);
 
 		igt_info("%s %ld cycles: %.3f us\n",
 			 ied_name(&ied, child),
@@ -396,6 +404,7 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		double end, this, elapsed, now, baseline;
 		unsigned long cycles;
 		igt_spin_t *spin[2];
+		uint64_t ahnd[2];
 
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
@@ -407,13 +416,15 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		execbuf.flags = ied_flags(&ied, child);
 		execbuf.rsvd1 = ctx->id;
 
-		spin[0] = __igt_spin_new(fd,
+		ahnd[0] = get_reloc_ahnd(fd, 0);
+		spin[0] = __igt_spin_new(fd, .ahnd = ahnd[0],
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
 		igt_assert(igt_spin_has_poll(spin[0]));
 
-		spin[1] = __igt_spin_new(fd,
+		ahnd[1] = get_reloc_ahnd(fd, 0);
+		spin[1] = __igt_spin_new(fd, .ahnd = ahnd[1],
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
@@ -490,6 +501,8 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		igt_spin_free(fd, spin[1]);
 		igt_spin_free(fd, spin[0]);
 		gem_close(fd, object.handle);
+		put_ahnd(ahnd[0]);
+		put_ahnd(ahnd[1]);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
@@ -1109,11 +1122,13 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 		struct drm_i915_gem_execbuffer2 execbuf;
 		double start, elapsed;
 		unsigned long cycles;
+		uint64_t ahnd;
 
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
 		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
 
+		ahnd = get_reloc_ahnd(fd, tmp_ctx[0]->id);
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(&object);
 		execbuf.buffer_count = 1;
@@ -1126,7 +1141,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 		cycles = 0;
 		do {
 			igt_spin_t *spin =
-				__igt_spin_new(fd,
+				__igt_spin_new(fd, .ahnd = ahnd,
 					       .ctx = tmp_ctx[0],
 					       .engine = execbuf.flags);
 
@@ -1142,6 +1157,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 			 ied_name(&ied, child), cycles, elapsed * 1e6/cycles);
 
 		gem_close(fd, object.handle);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
-- 
2.32.0
