Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022526EB34
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 11:44:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 21 Oct 2021 13:44:00 +0200
Message-Id: <20211021114400.28238-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exec_await: Adopt to no-reloc mode
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In previous series most of tests were already adopted to no-reloc
mode but some still requires adoption. This change adds softpinning
with offset acquired from an allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_exec_await.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index bea57c61b..bf8eb6822 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -72,6 +72,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
 	unsigned long count;
 	double time;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0); /* just offset provider */
 
 	nengine = 0;
 	for_each_ctx_engine(fd, ctx, engine) {
@@ -97,8 +98,13 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		for (unsigned n = 0; n < ring_size; n++)  {
 			exec[e].obj[n].handle = gem_create(fd, 4096);
 			exec[e].obj[n].flags = EXEC_OBJECT_WRITE;
+			exec[e].obj[n].offset = get_offset(ahnd, exec[e].obj[n].handle,
+							   4096, 0);
+			if (ahnd)
+				exec[e].obj[n].flags |= EXEC_OBJECT_PINNED;
 
 			obj[e*ring_size + n].handle = exec[e].obj[n].handle;
+			obj[e*ring_size + n].offset = exec[e].obj[n].offset;
 		}
 
 		exec[e].execbuf.buffers_ptr = to_user_pointer(exec[e].exec);
@@ -115,6 +121,11 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		}
 
 		exec[e].exec[0].handle = gem_create(fd, 4096);
+		exec[e].exec[0].offset = get_offset(ahnd, exec[e].exec[0].handle,
+						    4096, 0);
+		if (ahnd)
+			exec[e].exec[0].flags = EXEC_OBJECT_PINNED;
+
 		exec[e].cmd = gem_mmap__wc(fd, exec[e].exec[0].handle,
 					   0, 4096, PROT_WRITE);
 
@@ -133,11 +144,17 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 			exec[e].reloc.delta = 1;
 
 		exec[e].exec[1].relocs_ptr = to_user_pointer(&exec[e].reloc);
-		exec[e].exec[1].relocation_count = 1;
+		exec[e].exec[1].relocation_count = !ahnd ? 1 : 0;
 	}
+
 	obj[nengine*ring_size].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[nengine*ring_size].handle, 0, &bbe, sizeof(bbe));
 
+	obj[nengine*ring_size].offset = get_offset(ahnd, obj[nengine*ring_size].handle,
+						   4096, 0);
+	if (ahnd)
+		obj[nengine*ring_size].flags |= EXEC_OBJECT_PINNED;
+
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj[nengine*ring_size]);
 	execbuf.buffer_count = 1;
@@ -222,16 +239,22 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		if (flags & CONTEXTS)
 			intel_ctx_destroy(fd, exec[e].ctx);
 
-		for (unsigned n = 0; n < ring_size; n++)
+		for (unsigned n = 0; n < ring_size; n++) {
 			gem_close(fd, exec[e].obj[n].handle);
+			put_offset(ahnd, exec[e].obj[n].handle);
+		}
 		free(exec[e].obj);
 
 		munmap(exec[e].cmd, 4096);
 		gem_close(fd, exec[e].exec[1].handle);
+		put_offset(ahnd, exec[e].exec[1].handle);
 	}
 	free(exec);
+	put_ahnd(ahnd);
 }
 
+#define TIMEOUT 20
+
 igt_main
 {
 	int ring_size = 0;
@@ -254,11 +277,11 @@ igt_main
 	}
 
 	igt_subtest("wide-all")
-		wide(device, ctx, ring_size, 20, 0);
+		wide(device, ctx, ring_size, TIMEOUT, 0);
 
 	igt_subtest("wide-contexts") {
 		gem_require_contexts(device);
-		wide(device, ctx, ring_size, 20, CONTEXTS);
+		wide(device, ctx, ring_size, TIMEOUT, CONTEXTS);
 	}
 
 	igt_fixture {
-- 
2.26.0
