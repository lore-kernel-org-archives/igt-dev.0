Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A482110E5AC
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 08:55:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Apr 2022 10:54:53 +0200
Message-Id: <20220405085453.28963-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_isolation: Use allocator
 for registers write
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

For no-reloc we need to ensure all offset management is done with
userspace allocator. Leaving register write intact was wrong as
offsets returned by allocator could overlap with proposed by the
kernel (write_regs() didn't have EXEC_OBJECT_PINNED before).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_ctx_isolation.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index c4fd771edf..bcb9b73410 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -366,7 +366,7 @@ static uint32_t read_regs(int fd,
 	return obj[0].handle;
 }
 
-static void write_regs(int fd,
+static void write_regs(int fd, uint64_t ahnd,
 		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       unsigned int flags,
@@ -423,8 +423,13 @@ static void write_regs(int fd,
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags;
 	execbuf.rsvd1 = ctx->id;
+	if (ahnd) {
+		obj.flags |= EXEC_OBJECT_PINNED;
+		obj.offset = get_offset(ahnd, obj.handle, batch_size, 0);
+	}
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj.handle);
+	put_offset(ahnd, obj.offset);
 }
 
 static void restore_regs(int fd,
@@ -658,7 +663,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 
 		igt_debug("%s[%d]: Setting all registers to 0x%08x\n",
 			  __func__, v, values[v]);
-		write_regs(fd, ctx, e, flags, values[v]);
+		write_regs(fd, ahnd, ctx, e, flags, values[v]);
 
 		if (flags & DIRTY2) {
 			const intel_ctx_t *sw = intel_ctx_create(fd, &ctx->cfg);
@@ -750,7 +755,7 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		if (flags & DIRTY1) {
 			igt_debug("%s[%d]: Setting all registers of ctx 0 to 0x%08x\n",
 				  __func__, v, values[v]);
-			write_regs(fd, ctx[0], e, flags, values[v]);
+			write_regs(fd, ahnd[0], ctx[0], e, flags, values[v]);
 		}
 
 		/*
@@ -768,7 +773,7 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		if (flags & DIRTY2) {
 			igt_debug("%s[%d]: Setting all registers of ctx 1 to 0x%08x\n",
 				  __func__, v, ~values[v]);
-			write_regs(fd, ctx[1], e, flags, ~values[v]);
+			write_regs(fd, ahnd[1], ctx[1], e, flags, ~values[v]);
 		}
 
 		/*
@@ -882,7 +887,7 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 	for (int v = 0; v < num_values; v++) {
 		ctx[v] = intel_ctx_create(fd, cfg);
 		ahnd[v] = get_reloc_ahnd(fd, ctx[v]->id);
-		write_regs(fd, ctx[v], e, flags, values[v]);
+		write_regs(fd, ahnd[v], ctx[v], e, flags, values[v]);
 
 		regs[v][0] = read_regs(fd, ahnd[v], ctx[v], e, flags);
 	}
-- 
2.32.0
