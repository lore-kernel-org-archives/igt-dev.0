Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5D6E558
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:46:58 +0200
Message-Id: <20210813074703.18778-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/gem_exec_big: Skip relocation part
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Andrzej Turko <andrzej.turko@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When running on platforms without relocation support, verification
of their correctness should be skipped.  What remains is exercising
submission of large batches.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_big.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 1f8c720b6..90230fc33 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -55,6 +55,7 @@ IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
 #define FORCE_PREAD_PWRITE 0
 
 static int use_64bit_relocs;
+static bool has_relocs;
 
 static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, char *ptr)
 {
@@ -70,7 +71,7 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
 	gem_reloc[0].presumed_offset = 0;
 
 	gem_exec[0].handle = handle;
-	gem_exec[0].relocation_count = 1;
+	gem_exec[0].relocation_count = has_relocs ? 1 : 0;
 	gem_exec[0].relocs_ptr = to_user_pointer(gem_reloc);
 	gem_exec[0].alignment = 0;
 	gem_exec[0].offset = 0;
@@ -100,6 +101,9 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
 	igt_warn_on(gem_reloc[0].presumed_offset == -1);
 	gem_set_domain(fd, gem_exec[0].handle, I915_GEM_DOMAIN_WC, 0);
 
+	if (!has_relocs)
+		return;
+
 	if (use_64bit_relocs) {
 		uint64_t tmp;
 		if (ptr)
@@ -134,11 +138,13 @@ static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags,
 #define reloc_ofs(N, T) ((((N)+1) << 12) - 4*(1 + ((N) == ((T)-1))))
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 gem_exec[1];
-	struct drm_i915_gem_relocation_entry *gem_reloc;
-	uint64_t n, nreloc = batch_size >> 12;
+	struct drm_i915_gem_relocation_entry *gem_reloc = NULL;
+	uint64_t n, nreloc = has_relocs ? batch_size >> 12 : 0;
 
-	gem_reloc = calloc(nreloc, sizeof(*gem_reloc));
-	igt_assert(gem_reloc);
+	if (has_relocs) {
+		gem_reloc = calloc(nreloc, sizeof(*gem_reloc));
+		igt_assert(gem_reloc);
+	}
 
 	for (n = 0; n < nreloc; n++) {
 		gem_reloc[n].offset = reloc_ofs(n, nreloc);
@@ -173,6 +179,10 @@ static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags,
 	igt_permute_array(gem_reloc, nreloc, xchg_reloc);
 
 	gem_execbuf(fd, &execbuf);
+
+	if (!has_relocs)
+		return;
+
 	for (n = 0; n < nreloc; n++) {
 		if (igt_warn_on(gem_reloc[n].presumed_offset == -1))
 			break;
@@ -305,6 +315,7 @@ igt_main
 		igt_require_gem(i915);
 
 		use_64bit_relocs = intel_gen(intel_get_drm_devid(i915)) >= 8;
+		has_relocs = gem_has_relocations(i915);
 	}
 
 	igt_subtest("single")
-- 
2.26.0
