Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076FC6E284
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Feb 2020 00:11:44 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Fri, 31 Jan 2020 16:11:35 -0800
Message-Id: <20200201001135.10927-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_faulting_reloc: Use a
 coherent mapping
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

With mappable aperture not being available on some platforms, use a
different mapping. While this is changing a portion of the test, it
should keep intact the spirit of the same by submitting relocations to
faulting addresses.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_faulting_reloc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_exec_faulting_reloc.c b/tests/i915/gem_exec_faulting_reloc.c
index c2aea039..82d67a68 100644
--- a/tests/i915/gem_exec_faulting_reloc.c
+++ b/tests/i915/gem_exec_faulting_reloc.c
@@ -39,12 +39,11 @@
 #include <sys/time.h>
 #include "drm.h"
 
-/* Testcase: Submit patches with relocations in memory that will fault
+/* Testcase: Submit batches with relocations in memory that will fault
  *
- * To be really evil, use a gtt mmap for them.
  */
 
-IGT_TEST_DESCRIPTION("Submit patches with relocations in memory that will"
+IGT_TEST_DESCRIPTION("Submit batches with relocations in memory that will"
 		     " fault.");
 
 #define OBJECT_SIZE 16384
@@ -111,7 +110,7 @@ static int gem_linear_blt(uint32_t *batch,
 			b += 8;
 		length -= height * 16*1024;
 	}
-	
+
 	if (length) {
 		int i = 0;
 		b[i++] = COPY_BLT_CMD_NOLEN | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
@@ -167,7 +166,7 @@ static void run(int object_size)
 	struct drm_i915_gem_relocation_entry reloc[4];
 	uint32_t buf[40];
 	uint32_t handle, handle_relocs, src, dst;
-	void *gtt_relocs;
+	void *relocs;
 	int fd, len;
 	int ring;
 
@@ -203,7 +202,7 @@ static void run(int object_size)
 
 	handle_relocs = gem_create(fd, 4096);
 	gem_write(fd, handle_relocs, 0, reloc, sizeof(reloc));
-	gtt_relocs = gem_mmap__gtt(fd, handle_relocs, 4096,
+	relocs = gem_mmap__device_coherent(fd, handle_relocs, 0, 4096,
 				   PROT_READ | PROT_WRITE);
 
 	exec[2].handle = handle;
@@ -212,7 +211,7 @@ static void run(int object_size)
 	else
 		exec[2].relocation_count = len > 40 ? 4 : 2;
 	/* A newly mmap gtt bo will fault on first access. */
-	exec[2].relocs_ptr = to_user_pointer(gtt_relocs);
+	exec[2].relocs_ptr = to_user_pointer(relocs);
 	exec[2].alignment = 0;
 	exec[2].offset = 0;
 	exec[2].flags = 0;
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
