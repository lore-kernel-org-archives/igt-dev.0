Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BF26EB97
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:15 +0200
Message-Id: <20210806134145.24634-27-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 26/56] tests/gem_exec_params: Support
 gens without relocations
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
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_params.c | 74 ++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index 729d38a43..ba79791a1 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -45,6 +45,8 @@
 #include "igt_device.h"
 #include "sw_sync.h"
 
+#define ALIGNMENT (1 << 22)
+
 static bool has_exec_batch_first(int fd)
 {
 	int val = -1;
@@ -74,24 +76,45 @@ static void test_batch_first(int fd)
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_relocation_entry reloc[2];
 	uint32_t *map, value;
+	uint64_t ahnd;
+	bool do_relocs = !gem_uses_ppgtt(fd);
 	int i;
 
 	igt_require(gem_can_store_dword(fd, 0));
 	igt_require(has_exec_batch_first(fd));
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
 	memset(obj, 0, sizeof(obj));
 	memset(reloc, 0, sizeof(reloc));
 
 	obj[0].handle = gem_create(fd, 4096);
+	obj[0].offset = intel_allocator_alloc(ahnd, obj[0].handle,
+						4096, ALIGNMENT);
+	obj[0].offset = CANONICAL(obj[0].offset);
+	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	obj[1].handle = gem_create(fd, 4096);
+	obj[1].offset = intel_allocator_alloc(ahnd, obj[1].handle,
+						4096, ALIGNMENT);
+	obj[1].offset = CANONICAL(obj[1].offset);
+	obj[1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	obj[2].handle = gem_create(fd, 4096);
-
-	reloc[0].target_handle = obj[1].handle;
-	reloc[0].offset = sizeof(uint32_t);
-	reloc[0].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc[0].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-	obj[0].relocs_ptr = to_user_pointer(&reloc[0]);
-	obj[0].relocation_count = 1;
+	obj[2].offset = intel_allocator_alloc(ahnd, obj[2].handle,
+						4096, ALIGNMENT);
+	obj[2].offset = CANONICAL(obj[2].offset);
+	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
+	if (do_relocs) {
+		reloc[0].target_handle = obj[1].handle;
+		reloc[0].offset = sizeof(uint32_t);
+		reloc[0].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc[0].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+		obj[0].relocs_ptr = to_user_pointer(&reloc[0]);
+		obj[0].relocation_count = 1;
+	} else {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+	}
 
 	i = 0;
 	map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
@@ -99,26 +122,31 @@ static void test_batch_first(int fd)
 			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 	map[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		map[++i] = 0;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
+		map[++i] = obj[1].offset >> 32;
 	} else if (gen >= 4) {
 		map[++i] = 0;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
 		reloc[0].offset += sizeof(uint32_t);
 	} else {
 		map[i]--;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
 	}
 	map[++i] = 1;
 	map[++i] = MI_BATCH_BUFFER_END;
 	munmap(map, 4096);
 
-	reloc[1].target_handle = obj[1].handle;
-	reloc[1].offset = sizeof(uint32_t);
-	reloc[1].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc[1].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-	obj[2].relocs_ptr = to_user_pointer(&reloc[1]);
-	obj[2].relocation_count = 1;
+	if (do_relocs) {
+		reloc[1].target_handle = obj[1].handle;
+		reloc[1].offset = sizeof(uint32_t);
+		reloc[1].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc[1].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+		obj[2].relocs_ptr = to_user_pointer(&reloc[1]);
+		obj[2].relocation_count = 1;
+	} else {
+		obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[2].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	i = 0;
 	map = gem_mmap__cpu(fd, obj[2].handle, 0, 4096, PROT_WRITE);
@@ -126,15 +154,15 @@ static void test_batch_first(int fd)
 			I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
 	map[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		map[++i] = 0;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
+		map[++i] = obj[1].offset >> 32;
 	} else if (gen >= 4) {
 		map[++i] = 0;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
 		reloc[1].offset += sizeof(uint32_t);
 	} else {
 		map[i]--;
-		map[++i] = 0;
+		map[++i] = obj[1].offset;
 	}
 	map[++i] = 2;
 	map[++i] = MI_BATCH_BUFFER_END;
@@ -158,8 +186,12 @@ static void test_batch_first(int fd)
 	igt_assert_eq_u32(value, 1);
 
 	gem_close(fd, obj[2].handle);
+	intel_allocator_free(ahnd, obj[2].handle);
 	gem_close(fd, obj[1].handle);
+	intel_allocator_free(ahnd, obj[1].handle);
 	gem_close(fd, obj[0].handle);
+	intel_allocator_free(ahnd, obj[0].handle);
+	intel_allocator_close(ahnd);
 }
 
 static int has_secure_batches(const int fd)
-- 
2.26.0
