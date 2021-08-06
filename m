Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684FD6EBB7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:38 +0200
Message-Id: <20210806094649.21162-46-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 45/56] tests/i915_module_load: Adopt to
 use allocator
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
 tests/i915/i915_module_load.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 98ceb5d85..993c78325 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -42,6 +42,7 @@ static void store_all(int i915)
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	uint32_t engines[I915_EXEC_RING_MASK + 1];
 	uint32_t batch[16];
+	uint64_t ahnd, offset, bb_offset;
 	unsigned int sz = ALIGN(sizeof(batch) * ARRAY_SIZE(engines), 4096);
 	struct drm_i915_gem_relocation_entry reloc = {
 		.offset = sizeof(uint32_t),
@@ -91,6 +92,12 @@ static void store_all(int i915)
 	cs = gem_mmap__device_coherent(i915, obj[1].handle, 0, sz, PROT_WRITE);
 
 	ctx = intel_ctx_create_all_physical(i915);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
+	if (ahnd)
+		obj[1].relocation_count = 0;
+	bb_offset = get_offset(ahnd, obj[1].handle, sz, 4096);
+	offset = get_offset(ahnd, obj[0].handle, sizeof(engines), 0);
+
 	for_each_ctx_engine(i915, ctx, e) {
 		uint64_t addr;
 
@@ -100,6 +107,16 @@ static void store_all(int i915)
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
+		if (ahnd) {
+			i = 1;
+			batch[i++] = offset + reloc.delta;
+			batch[i++] = offset >> 32;
+			obj[0].offset = offset;
+			obj[0].flags |= EXEC_OBJECT_PINNED;
+			obj[1].offset = bb_offset;
+			obj[1].flags |= EXEC_OBJECT_PINNED;
+		}
+
 		batch[value] = nengine;
 
 		execbuf.flags = e->flags;
@@ -109,7 +126,8 @@ static void store_all(int i915)
 		execbuf.rsvd1 = ctx->id;
 
 		memcpy(cs + execbuf.batch_start_offset, batch, sizeof(batch));
-		memcpy(cs + reloc.offset, &addr, reloc_sz);
+		if (!ahnd)
+			memcpy(cs + reloc.offset, &addr, reloc_sz);
 		gem_execbuf(i915, &execbuf);
 
 		if (++nengine == ARRAY_SIZE(engines))
@@ -126,6 +144,9 @@ static void store_all(int i915)
 	gem_read(i915, obj[0].handle, 0, engines, nengine * sizeof(engines[0]));
 	gem_close(i915, obj[0].handle);
 	intel_ctx_destroy(i915, ctx);
+	put_offset(ahnd, obj[0].handle);
+	put_offset(ahnd, obj[1].handle);
+	put_ahnd(ahnd);
 
 	for (i = 0; i < nengine; i++)
 		igt_assert_eq_u32(engines[i], i);
-- 
2.26.0
