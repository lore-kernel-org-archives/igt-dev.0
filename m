Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3E4890DF
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 20:28:26 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Wed, 11 Aug 2021 22:28:10 +0200
Message-Id: <20210811202811.2162-2-andrzej.turko@linux.intel.com>
In-Reply-To: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
References: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_big: Add a path
 without relocations
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

When running on platforms without relocation support,
verification of their correctness should be skipped.
What remains is exercising submission of large batches.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_big.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 1f8c720b6..a10b7dc6a 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -55,6 +55,35 @@ IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
 #define FORCE_PREAD_PWRITE 0
 
 static int use_64bit_relocs;
+static bool do_relocs;
+
+static void exec_noreloc(int fd, uint64_t handle, unsigned flags)
+{
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_exec_object2 gem_exec[1];
+
+	gem_exec[0].handle = handle;
+	gem_exec[0].relocation_count = 0;
+	gem_exec[0].alignment = 0;
+	gem_exec[0].offset = 0;
+	gem_exec[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	gem_exec[0].rsvd1 = 0;
+	gem_exec[0].rsvd2 = 0;
+
+	execbuf.buffers_ptr = to_user_pointer(gem_exec);
+	execbuf.buffer_count = 1;
+	execbuf.batch_start_offset = 0;
+	execbuf.batch_len = 8;
+	execbuf.cliprects_ptr = 0;
+	execbuf.num_cliprects = 0;
+	execbuf.DR1 = 0;
+	execbuf.DR4 = 0;
+	execbuf.flags = flags;
+	i915_execbuffer2_set_context_id(execbuf, 0);
+	execbuf.rsvd2 = 0;
+
+	gem_execbuf(fd, &execbuf);
+}
 
 static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, char *ptr)
 {
@@ -62,6 +91,11 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
 	struct drm_i915_gem_exec_object2 gem_exec[1];
 	struct drm_i915_gem_relocation_entry gem_reloc[1];
 
+	if (!do_relocs) {
+		exec_noreloc(fd, handle, flags);
+		return;
+	}
+
 	gem_reloc[0].offset = reloc_ofs;
 	gem_reloc[0].delta = 0;
 	gem_reloc[0].target_handle = handle;
@@ -137,6 +171,11 @@ static void execN(int fd, uint32_t handle, uint64_t batch_size, unsigned flags,
 	struct drm_i915_gem_relocation_entry *gem_reloc;
 	uint64_t n, nreloc = batch_size >> 12;
 
+	if (!do_relocs) {
+		exec_noreloc(fd, handle, flags);
+		return;
+	}
+
 	gem_reloc = calloc(nreloc, sizeof(*gem_reloc));
 	igt_assert(gem_reloc);
 
@@ -305,6 +344,7 @@ igt_main
 		igt_require_gem(i915);
 
 		use_64bit_relocs = intel_gen(intel_get_drm_devid(i915)) >= 8;
+		do_relocs = gem_has_relocations(i915);
 	}
 
 	igt_subtest("single")
-- 
2.25.1
