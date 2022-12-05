Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCD310E29B
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 20:27:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 21:27:08 +0100
Message-Id: <20221205202708.76217-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
References: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/5] tests/gem_exec_parallel: Avoid
 acquiring offset for overlapping handle
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

Subtest @fds incorporates objects created in some context in new context
created on new (reopened) drm fd. This might lead to clash handles
(same handle created over different fd,ctx) so acquiring offsets from
stateful allocator (reloc is from now on stateful for alloc()/free()
ops) might lead to bind same offset for two different objects. Lets
use some artificial (last max handle + 1) handle for bb to avoid offset
overlapping.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_parallel.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 730fc4a672..429620884b 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -75,7 +75,7 @@ static void *thread(void *data)
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const intel_ctx_t *tmp_ctx = NULL;
-	uint64_t offset;
+	uint64_t offset, bb_offset;
 	uint32_t batch[16];
 	uint16_t used;
 	int fd, i;
@@ -136,6 +136,18 @@ static void *thread(void *data)
 		execbuf.rsvd1 = t->ctx->id;
 	}
 
+	/*
+	 * For FDS we have new drm fd, what means gem_create() for bb returns
+	 * handle == 1. As we're using objects from other fd it would overlap,
+	 * thus we need to acquire offset for bb from last handle + 1.
+	 * Other cases are within same fd, so obj[1].handle will be distinguish
+	 * anyway.
+	 */
+	if (t->flags & FDS)
+		bb_offset = get_offset(t->ahnd, t->scratch[NUMOBJ - 1] + 1, 4096, 0);
+	else
+		bb_offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
+
 	used = 0;
 	igt_until_timeout(1) {
 		unsigned int x = rand() % NUMOBJ;
@@ -154,7 +166,7 @@ static void *thread(void *data)
 			obj[0].offset = offset;
 			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
 					EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-			obj[1].offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
+			obj[1].offset = bb_offset;
 			obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 			gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
 		}
-- 
2.34.1
