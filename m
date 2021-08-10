Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F389E50
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:28 +0200
Message-Id: <20210810052711.7866-23-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 22/65] tests/gem_exec_suspend: Adopt to
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
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_suspend.c | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 0ef26ce11..dbe0c8a71 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -83,6 +83,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	unsigned engines[I915_EXEC_RING_MASK + 1];
 	unsigned nengine;
 	igt_spin_t *spin = NULL;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
@@ -120,27 +121,39 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	gem_close(fd, obj[1].handle);
 
-	memset(&reloc, 0, sizeof(reloc));
-	reloc.target_handle = obj[0].handle;
-	reloc.presumed_offset = obj[0].offset;
-	reloc.offset = sizeof(uint32_t);
-	if (gen >= 4 && gen < 8)
-		reloc.offset += sizeof(uint32_t);
-	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-
-	obj[1].relocs_ptr = to_user_pointer(&reloc);
-	obj[1].relocation_count = 1;
+	if (!ahnd) {
+		memset(&reloc, 0, sizeof(reloc));
+		reloc.target_handle = obj[0].handle;
+		reloc.presumed_offset = obj[0].offset;
+		reloc.offset = sizeof(uint32_t);
+		if (gen >= 4 && gen < 8)
+			reloc.offset += sizeof(uint32_t);
+		reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+
+		obj[1].relocs_ptr = to_user_pointer(&reloc);
+		obj[1].relocation_count = 1;
+	} else {
+		/* ignore first execbuf offset */
+		obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	for (int i = 0; i < 1024; i++) {
 		uint64_t offset;
 		uint32_t buf[16];
 		int b;
 
-		obj[1].handle = gem_create(fd, 4096);
-
 		reloc.delta = i * sizeof(uint32_t);
-		offset = reloc.presumed_offset + reloc.delta;
+
+		obj[1].handle = gem_create(fd, 4096);
+		if (ahnd) {
+			obj[1].offset = get_offset(ahnd, obj[1].handle, 4096, 0);
+			obj[1].flags |= EXEC_OBJECT_PINNED;
+			offset = obj[0].offset + reloc.delta;
+		} else {
+			offset = reloc.presumed_offset + reloc.delta;
+		}
 
 		b = 0;
 		buf[b] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
@@ -165,7 +178,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	}
 
 	if (flags & HANG)
-		spin = igt_spin_new(fd, .engine = engine);
+		spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine);
 
 	switch (mode(flags)) {
 	case NOSLEEP:
@@ -201,6 +214,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 
 	check_bo(fd, obj[0].handle);
 	gem_close(fd, obj[0].handle);
+	put_ahnd(ahnd);
 
 	gem_quiescent_gpu(fd);
 
-- 
2.26.0
