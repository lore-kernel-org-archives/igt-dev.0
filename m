Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749A510E20A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 13:00:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 14:00:23 +0100
Message-Id: <20220221130023.59748-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/gem_exec_capture: Fix alignment for
 discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Discrete hardware like DG2 has different alignment restrictions when
gem objects comes from system and device memory (page size is not enough
there). Fix this as well as handle offsets > 4GiB.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_capture.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 60f8df04c..150f98611 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -264,6 +264,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	struct offset offset;
 	int i, fence_out;
 	struct gem_engine_properties saved_engine;
+	uint64_t align = gem_detect_safe_alignment(fd);
 
 	saved_engine = configure_hangs(fd, e, ctx->id);
 
@@ -280,7 +281,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 
 	for (i = 0; i < ARRAY_SIZE(obj); i++) {
 		obj[i].offset = get_offset(ahnd, obj[i].handle,
-					   i == CAPTURE ? target_size : 4096, 0);
+					   i == CAPTURE ? target_size : 4096, align);
 		obj[i].flags |= ahnd ? EXEC_OBJECT_PINNED : 0;
 	}
 
@@ -427,6 +428,8 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	struct offset *offsets;
 	int i, fence_out;
 	struct gem_engine_properties saved_engine;
+	uint64_t align = gem_detect_min_alignment_for_regions(fd, REGION_SMEM,
+							      REGION_SMEM);
 
 	saved_engine = configure_hangs(fd, e, ctx->id);
 
@@ -437,12 +440,13 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	igt_assert(obj);
 
 	obj[0].handle = gem_create(fd, 4096);
-	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
-	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);
+	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, align);
+	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0)
+			| EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	for (i = 0; i < count; i++) {
 		obj[i + 1].handle = gem_create(fd, size);
-		obj[i + 1].offset = get_offset(ahnd, obj[i + 1].handle, size, 0);
+		obj[i + 1].offset = get_offset(ahnd, obj[i + 1].handle, size, align);
 		obj[i + 1].flags =
 			EXEC_OBJECT_CAPTURE | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 		if (ahnd)
@@ -462,8 +466,8 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	obj[count + 1].handle = gem_create(fd, 4096);
 	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
 	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
-	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
-	obj[count + 1].flags = ahnd ? EXEC_OBJECT_PINNED : 0;
+	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, align);
+	obj[count + 1].flags = ahnd ? EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS : 0;
 
 	memset(reloc, 0, sizeof(reloc));
 	reloc[0].target_handle = obj[count + 1].handle; /* recurse */
-- 
2.32.0
