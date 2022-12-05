Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50710E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 20:27:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 21:27:06 +0100
Message-Id: <20221205202708.76217-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
References: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/5] lib/intel_allocator_reloc: Introduce
 stateful allocations in reloc
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

Till now reloc allocator was stateless - that means if we would
call alloc() twice for same handle + size, we would get consecutive
offsets (according to size and alignment). This is problematic
in library code, where we get handle and we would like to get offset
which must be same like in the caller. It wasn't possible thus library
instead of alloc() has to get offset from the caller instead. For
single object it is not big problem but passing more makes prototype
much longer and usage is inconvinient.

Introducing stateful allocations tracking in reloc solves this issue
- alloc() can be called many times in dependent code and same offset
will be returned until free().

Tracking was added to alloc()/free() only - reserve()/unreserve()
are not handled by reloc allocator at the moment at all.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator_reloc.c      | 115 ++++++++++++++++++++++++++-----
 tests/i915/api_intel_allocator.c |  21 ++++--
 2 files changed, 111 insertions(+), 25 deletions(-)

diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
index ee3ad43f4a..60cbb88511 100644
--- a/lib/intel_allocator_reloc.c
+++ b/lib/intel_allocator_reloc.c
@@ -9,11 +9,13 @@
 #include "igt_x86.h"
 #include "igt_rand.h"
 #include "intel_allocator.h"
+#include "igt_map.h"
 
 struct intel_allocator *
 intel_allocator_reloc_create(int fd, uint64_t start, uint64_t end);
 
 struct intel_allocator_reloc {
+	struct igt_map *objects;
 	uint32_t prng;
 	uint64_t start;
 	uint64_t end;
@@ -23,9 +25,41 @@ struct intel_allocator_reloc {
 	uint64_t allocated_objects;
 };
 
+struct intel_allocator_record {
+	uint32_t handle;
+	uint64_t offset;
+	uint64_t size;
+};
+
 /* Keep the low 256k clear, for negative deltas */
 #define BIAS (256 << 10)
 
+/* 2^31 + 2^29 - 2^25 + 2^22 - 2^19 - 2^16 + 1 */
+#define GOLDEN_RATIO_PRIME_32 0x9e370001UL
+
+/*  2^63 + 2^61 - 2^57 + 2^54 - 2^51 - 2^18 + 1 */
+#define GOLDEN_RATIO_PRIME_64 0x9e37fffffffc0001ULL
+
+static inline uint32_t hash_handles(const void *val)
+{
+	uint32_t hash = *(uint32_t *) val;
+
+	hash = hash * GOLDEN_RATIO_PRIME_32;
+	return hash;
+}
+
+static int equal_handles(const void *a, const void *b)
+{
+	uint32_t *key1 = (uint32_t *) a, *key2 = (uint32_t *) b;
+
+	return *key1 == *key2;
+}
+
+static void map_entry_free_func(struct igt_map_entry *entry)
+{
+	free(entry->data);
+}
+
 static void intel_allocator_reloc_get_address_range(struct intel_allocator *ial,
 						    uint64_t *startp,
 						    uint64_t *endp)
@@ -44,25 +78,39 @@ static uint64_t intel_allocator_reloc_alloc(struct intel_allocator *ial,
 					    uint64_t alignment,
 					    enum allocator_strategy strategy)
 {
+	struct intel_allocator_record *rec;
 	struct intel_allocator_reloc *ialr = ial->priv;
 	uint64_t offset, aligned_offset;
 
-	(void) handle;
 	(void) strategy;
 
-	aligned_offset = ALIGN(ialr->offset, alignment);
+	rec = igt_map_search(ialr->objects, &handle);
+	if (rec) {
+		offset = rec->offset;
+		igt_assert(rec->size == size);
+	} else {
+		aligned_offset = ALIGN(ialr->offset, alignment);
 
-	/* Check we won't exceed end */
-	if (aligned_offset + size > ialr->end)
-		aligned_offset = ALIGN(ialr->start, alignment);
+		/* Check we won't exceed end */
+		if (aligned_offset + size > ialr->end)
+			aligned_offset = ALIGN(ialr->start, alignment);
 
-	/* Check that the object fits in the address range */
-	if (aligned_offset + size > ialr->end)
-		return ALLOC_INVALID_ADDRESS;
+		/* Check that the object fits in the address range */
+		if (aligned_offset + size > ialr->end)
+			return ALLOC_INVALID_ADDRESS;
 
-	offset = aligned_offset;
-	ialr->offset = offset + size;
-	ialr->allocated_objects++;
+		offset = aligned_offset;
+
+		rec = malloc(sizeof(*rec));
+		rec->handle = handle;
+		rec->offset = offset;
+		rec->size = size;
+
+		igt_map_insert(ialr->objects, &rec->handle, rec);
+
+		ialr->offset = offset + size;
+		ialr->allocated_objects++;
+	}
 
 	return offset;
 }
@@ -70,30 +118,60 @@ static uint64_t intel_allocator_reloc_alloc(struct intel_allocator *ial,
 static bool intel_allocator_reloc_free(struct intel_allocator *ial,
 				       uint32_t handle)
 {
+	struct intel_allocator_record *rec = NULL;
 	struct intel_allocator_reloc *ialr = ial->priv;
+	struct igt_map_entry *entry;
 
-	(void) handle;
+	entry = igt_map_search_entry(ialr->objects, &handle);
+	if (entry) {
+		igt_map_remove_entry(ialr->objects, entry);
+		if (entry->data) {
+			rec = (struct intel_allocator_record *) entry->data;
+			ialr->allocated_objects--;
+			free(rec);
 
-	ialr->allocated_objects--;
+			return true;
+		}
+	}
 
 	return false;
 }
 
+static inline bool __same(const struct intel_allocator_record *rec,
+			  uint32_t handle, uint64_t size, uint64_t offset)
+{
+	return rec->handle == handle && rec->size == size &&
+			DECANONICAL(rec->offset) == DECANONICAL(offset);
+}
+
 static bool intel_allocator_reloc_is_allocated(struct intel_allocator *ial,
 					       uint32_t handle, uint64_t size,
 					       uint64_t offset)
 {
-	(void) ial;
-	(void) handle;
-	(void) size;
-	(void) offset;
+	struct intel_allocator_record *rec;
+	struct intel_allocator_reloc *ialr;
+	bool same = false;
 
-	return false;
+	igt_assert(ial);
+	ialr = (struct intel_allocator_reloc *) ial->priv;
+	igt_assert(ialr);
+	igt_assert(handle);
+
+	rec = igt_map_search(ialr->objects, &handle);
+	if (rec && __same(rec, handle, size, offset))
+		same = true;
+
+	return same;
 }
 
 static void intel_allocator_reloc_destroy(struct intel_allocator *ial)
 {
+	struct intel_allocator_reloc *ialr;
+
 	igt_assert(ial);
+	ialr = (struct intel_allocator_reloc *) ial->priv;
+
+	igt_map_destroy(ialr->objects, map_entry_free_func);
 
 	free(ial->priv);
 	free(ial);
@@ -174,6 +252,7 @@ intel_allocator_reloc_create(int fd, uint64_t start, uint64_t end)
 
 	ialr = ial->priv = calloc(1, sizeof(*ialr));
 	igt_assert(ial->priv);
+	ialr->objects = igt_map_create(hash_handles, equal_handles);
 	ialr->prng = (uint32_t) to_user_pointer(ial);
 
 	start = max_t(uint64_t, start, BIAS);
diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index b55587e549..87abd90084 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -195,6 +195,7 @@ static void basic_alloc(int fd, int cnt, uint8_t type)
 	igt_assert_eq(intel_allocator_close(ahnd), true);
 }
 
+#define NUM_OBJS 128
 static void reuse(int fd, uint8_t type)
 {
 	struct test_obj obj[128], tmp;
@@ -204,15 +205,15 @@ static void reuse(int fd, uint8_t type)
 
 	ahnd = intel_allocator_open(fd, 0, type);
 
-	for (i = 0; i < 128; i++) {
+	for (i = 0; i < NUM_OBJS; i++) {
 		obj[i].handle = gem_handle_gen();
 		obj[i].size = OBJ_SIZE;
 		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
 						      obj[i].size, align);
 	}
 
-	/* check simple reuse */
-	for (i = 0; i < 128; i++) {
+	/* check reuse */
+	for (i = 0; i < NUM_OBJS; i++) {
 		prev_offset = obj[i].offset;
 		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
 						      obj[i].size, 0);
@@ -225,7 +226,13 @@ static void reuse(int fd, uint8_t type)
 	/* alloc different buffer to fill freed hole */
 	tmp.handle = gem_handle_gen();
 	tmp.offset = intel_allocator_alloc(ahnd, tmp.handle, OBJ_SIZE, align);
-	igt_assert(prev_offset == tmp.offset);
+
+	/* Simple will return previously returned offset if fits */
+	if (type == INTEL_ALLOCATOR_SIMPLE)
+		igt_assert(prev_offset == tmp.offset);
+	/* Reloc is moving forward for new allocations */
+	else if (type == INTEL_ALLOCATOR_RELOC)
+		igt_assert(prev_offset != tmp.offset);
 
 	obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
 					      obj[i].size, 0);
@@ -785,10 +792,10 @@ igt_main
 			igt_dynamic("print")
 				basic_alloc(fd, 1UL << 2, a->type);
 
-			if (a->type == INTEL_ALLOCATOR_SIMPLE) {
-				igt_dynamic("reuse")
-					reuse(fd, a->type);
+			igt_dynamic("reuse")
+				reuse(fd, a->type);
 
+			if (a->type == INTEL_ALLOCATOR_SIMPLE) {
 				igt_dynamic("reserve")
 					reserve(fd, a->type);
 			}
-- 
2.34.1
