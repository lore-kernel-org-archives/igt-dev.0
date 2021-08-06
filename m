Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8D06E053
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:43:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:31 +0200
Message-Id: <20210806134145.24634-43-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 42/56] tests/gem_watchdog: Adopt to use
 no-reloc
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
---
 tests/i915/gem_watchdog.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 4d4aaee48..db562335a 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -111,10 +111,13 @@ static void physical(int i915, const intel_ctx_t *ctx)
 	unsigned int num_engines, i, count;
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin[GEM_MAX_ENGINES];
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	i = 0;
 	for_each_ctx_engine(i915, ctx, e) {
-		spin[i] = igt_spin_new(i915, .ctx = ctx,
+		spin[i] = igt_spin_new(i915,
+				       .ahnd = ahnd,
+				       .ctx = ctx,
 				       .engine = e->flags,
 				       .flags = spin_flags());
 		i++;
@@ -125,6 +128,7 @@ static void physical(int i915, const intel_ctx_t *ctx)
 
 	for (i = 0; i < num_engines; i++)
 		igt_spin_free(i915, spin[i]);
+	put_ahnd(ahnd);
 
 	igt_assert_eq(count, num_engines);
 }
@@ -216,6 +220,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	unsigned int expect = num_engines;
 	intel_ctx_cfg_t cfg = {};
 	const intel_ctx_t *ctx[num_engines];
+	uint64_t ahnd;
 
 	igt_require(gem_has_execlists(i915));
 
@@ -239,10 +244,12 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 			igt_assert(i < num_engines);
 
 			ctx[i] = intel_ctx_create(i915, &cfg);
+			ahnd = get_reloc_ahnd(i915, ctx[i]->id);
 
 			set_load_balancer(i915, ctx[i]->id, ci, count, NULL);
 
 			spin[i] = igt_spin_new(i915,
+					       .ahnd = ahnd,
 					       .ctx = ctx[i],
 					       .flags = spin_flags());
 			i++;
@@ -254,8 +261,10 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	count = wait_timeout(i915, spin, num_engines, wait_us, expect);
 
 	for (i = 0; i < num_engines && spin[i]; i++) {
+		ahnd = spin[i]->ahnd;
 		igt_spin_free(i915, spin[i]);
 		intel_ctx_destroy(i915, ctx[i]);
+		put_ahnd(ahnd);
 	}
 
 	igt_assert_eq(count, expect);
-- 
2.26.0
