Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A166E053
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:19 +0200
Message-Id: <20210806134145.24634-31-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 30/56] tests/gem_mmap_gtt: Add allocator
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
To: igt-dev@lists.freedesktop.org
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_mmap_gtt.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 60282699e..92bbb5d2a 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -335,10 +335,12 @@ test_pf_nonblock(int i915)
 {
 	igt_spin_t *spin;
 	uint32_t *ptr;
+	uint64_t ahnd;
 
 	igt_require(mmap_gtt_version(i915) >= 3);
 
-	spin = igt_spin_new(i915);
+	ahnd = get_reloc_ahnd(i915, 0);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	igt_set_timeout(1, "initial pagefaulting did not complete within 1s");
 
@@ -349,6 +351,7 @@ test_pf_nonblock(int i915)
 	igt_reset_timeout();
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void
@@ -741,11 +744,13 @@ test_hang_busy(int i915)
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
+	uint64_t ahnd;
 
 	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	spin = igt_spin_new(i915, .ctx = ctx, .ahnd = ahnd,
 			    .flags = IGT_SPIN_POLL_RUN |
 				     IGT_SPIN_FENCE_OUT |
 				     IGT_SPIN_NO_PREEMPTION);
@@ -788,6 +793,7 @@ test_hang_busy(int i915)
 	munmap(ptr, 4096);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 	igt_disallow_hang(i915, hang);
 	intel_ctx_destroy(i915, ctx);
 }
@@ -800,11 +806,13 @@ test_hang_user(int i915)
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
+	uint64_t ahnd;
 
 	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	spin = igt_spin_new(i915, .ctx = ctx, .ahnd = ahnd,
 			    .flags = IGT_SPIN_POLL_RUN |
 				     IGT_SPIN_FENCE_OUT |
 				     IGT_SPIN_NO_PREEMPTION);
@@ -843,6 +851,7 @@ test_hang_user(int i915)
 	munmap(ptr, 4096);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 	igt_disallow_hang(i915, hang);
 	intel_ctx_destroy(i915, ctx);
 }
-- 
2.26.0
