Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F187489885
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:05:30 +0200
Message-Id: <20210809130533.27759-63-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 62/65] WIP: NOTWORKING: gem_exec_await
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/gem_exec_await.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index bea57c61b..8b45e10de 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -72,6 +72,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
 	unsigned long count;
 	double time;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 
 	nengine = 0;
 	for_each_ctx_engine(fd, ctx, engine) {
@@ -87,17 +88,22 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	exec = calloc(nengine, sizeof(*exec));
 	igt_assert(exec);
 
-	intel_require_memory(nengine*(2 + ring_size), 4096, CHECK_RAM);
+	//intel_require_memory(nengine*(2 + ring_size), 4096, CHECK_RAM);
 	obj = calloc(nengine*ring_size + 1, sizeof(*obj));
 	igt_assert(obj);
 
+	igt_info("nengine: %u, ring_size: %u\n", nengine, ring_size);
 	for (unsigned e = 0; e < nengine; e++) {
 		exec[e].obj = calloc(ring_size, sizeof(*exec[e].obj));
 		igt_assert(exec[e].obj);
 		for (unsigned n = 0; n < ring_size; n++)  {
 			exec[e].obj[n].handle = gem_create(fd, 4096);
 			exec[e].obj[n].flags = EXEC_OBJECT_WRITE;
-
+			if (ahnd) {
+				exec[e].obj[n].offset = get_offset(ahnd, exec[e].obj[n].handle, 4096, 0);
+				exec[e].obj[n].flags |= EXEC_OBJECT_PINNED;
+				obj[e*ring_size + n].offset = exec[e].obj[n].offset;
+			}
 			obj[e*ring_size + n].handle = exec[e].obj[n].handle;
 		}
 
@@ -123,6 +129,8 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		exec[e].cmd[0] = MI_BATCH_BUFFER_END;
 
 		gem_execbuf(fd, &exec[e].execbuf);
+		igt_info("obj[0].offset: %llx, handle: %u\n",
+			 exec[e].exec[0].offset, exec[e].exec[0].handle);
 		exec[e].exec[1] = exec[e].exec[0];
 		exec[e].execbuf.buffer_count = 2;
 
@@ -181,6 +189,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 				exec[e].cmd[++i] = address;
 			}
 
+			igt_info("Address: %llx\n", (long long) address);
 			exec[e].exec[0] = obj[nengine*ring_size];
 			gem_execbuf(fd, &exec[e].execbuf);
 
@@ -208,6 +217,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		for (unsigned e = 0; e < nengine; e++)
 			exec[e].cmd[0] = MI_BATCH_BUFFER_END;
 		__sync_synchronize();
+		break;
 	}
 
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
-- 
2.26.0
