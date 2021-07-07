Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF56E176
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:25 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id y2so1188034plc.8
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:32 -0500
Message-Id: <20210707144643.181001-21-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 70/81] tests/i915/gem_mmap_gtt: Convert to
 intel_ctx_t (v2)
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

v2 (Ashutosh Dixit):
 - Split the i915_query changes into their own patch

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_mmap_gtt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index cbfa222a6..60282699e 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -737,14 +737,18 @@ static void
 test_hang_busy(int i915)
 {
 	uint32_t *ptr, *tile, *x;
+	const intel_ctx_t *ctx = intel_ctx_create(i915, NULL);
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
 
-	hang = igt_allow_hang(i915, 0, 0);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION);
+	spin = igt_spin_new(i915, .ctx = ctx,
+			    .flags = IGT_SPIN_POLL_RUN |
+				     IGT_SPIN_FENCE_OUT |
+				     IGT_SPIN_NO_PREEMPTION);
 	igt_spin_busywait_until_started(spin);
 	igt_assert(spin->execbuf.buffer_count == 2);
 
@@ -785,20 +789,25 @@ test_hang_busy(int i915)
 
 	igt_spin_free(i915, spin);
 	igt_disallow_hang(i915, hang);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static void
 test_hang_user(int i915)
 {
+	const intel_ctx_t *ctx = intel_ctx_create(i915, NULL);
 	uint32_t *ptr, *mem, *x;
 	igt_spin_t *spin;
 	igt_hang_t hang;
 	uint32_t handle;
 
-	hang = igt_allow_hang(i915, 0, 0);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(igt_params_set(i915, "reset", "1")); /* global */
 
-	spin = igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION);
+	spin = igt_spin_new(i915, .ctx = ctx,
+			    .flags = IGT_SPIN_POLL_RUN |
+				     IGT_SPIN_FENCE_OUT |
+				     IGT_SPIN_NO_PREEMPTION);
 	igt_spin_busywait_until_started(spin);
 	igt_assert(spin->execbuf.buffer_count == 2);
 
@@ -835,6 +844,7 @@ test_hang_user(int i915)
 
 	igt_spin_free(i915, spin);
 	igt_disallow_hang(i915, hang);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static int min_tile_width(uint32_t devid, int tiling)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
