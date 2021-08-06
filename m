Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6B16EB90
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:40:59 +0200
Message-Id: <20210806134145.24634-11-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 10/56] tests/gem_create: Adopt to use
 allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_create.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 1acf8ee6a..45804cde0 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -249,12 +249,16 @@ static void busy_create(int i915, int timeout)
 	const intel_ctx_t *ctx;
 	igt_spin_t *spin[I915_EXEC_RING_MASK + 1];
 	unsigned long count = 0;
+	uint64_t ahnd;
 
 	ctx = intel_ctx_create_all_physical(i915);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_fork_hang_detector(i915);
 	for_each_ctx_engine(i915, ctx, e)
-		spin[e->flags] = igt_spin_new(i915, .ctx = ctx,
+		spin[e->flags] = igt_spin_new(i915,
+					      .ahnd = ahnd,
+					      .ctx = ctx,
 					      .engine = e->flags);
 
 	igt_until_timeout(timeout) {
@@ -263,7 +267,9 @@ static void busy_create(int i915, int timeout)
 			igt_spin_t *next;
 
 			handle = gem_create(i915, 4096);
-			next = igt_spin_new(i915, .ctx = ctx,
+			next = igt_spin_new(i915,
+					    .ahnd = ahnd,
+					    .ctx = ctx,
 					    .engine = e->flags,
 					    .dependency = handle,
 					    .flags = IGT_SPIN_SOFTDEP);
@@ -277,6 +283,7 @@ static void busy_create(int i915, int timeout)
 	}
 
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 
 	igt_info("Created %ld objects while busy\n", count);
 
-- 
2.26.0
