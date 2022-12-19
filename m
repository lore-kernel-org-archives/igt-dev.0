Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F018B10E110
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 07:01:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Dec 2022 08:01:20 +0100
Message-Id: <20221219070120.18630-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_*: Fix release offsets
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

After changing reloc allocator to track offsets allocations all
shortcommings started to be visible. Release offsets requires
handles, not offsets so fix this in the tests.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_blits.c         | 12 ++++++------
 tests/i915/gem_ctx_isolation.c |  6 +++---
 tests/i915/gem_exec_whisper.c  |  7 ++++---
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 24e83b9f51..d9296cf2d1 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -264,11 +264,11 @@ static void buffer_set_tiling(const struct device *device,
 	gem_execbuf(device->fd, &execbuf);
 
 	gem_close(device->fd, obj[2].handle);
-	put_offset(device->ahnd, obj[2].offset);
+	put_offset(device->ahnd, obj[2].handle);
 
 	gem_close(device->fd, obj[1].handle);
+	put_offset(device->ahnd, obj[1].handle);
 
-	put_offset(device->ahnd, buffer->gtt_offset);
 	buffer->gtt_offset = obj[0].offset;
 	buffer->handle = obj[0].handle;
 
@@ -403,11 +403,11 @@ static bool blit_to_linear(const struct device *device,
 
 	gem_execbuf(device->fd, &execbuf);
 	gem_close(device->fd, obj[2].handle);
-	put_offset(device->ahnd, obj[2].offset);
+	put_offset(device->ahnd, obj[2].handle);
 
 	gem_sync(device->fd, obj[0].handle);
 	gem_close(device->fd, obj[0].handle);
-	put_offset(device->ahnd, obj[0].offset);
+	put_offset(device->ahnd, obj[0].handle);
 
 	return true;
 }
@@ -531,7 +531,7 @@ static void buffer_free(const struct device *device, struct buffer *buffer)
 {
 	igt_assert(buffer_check(device, buffer, GTT));
 	gem_close(device->fd, buffer->handle);
-	put_offset(device->ahnd, buffer->gtt_offset);
+	put_offset(device->ahnd, buffer->handle);
 	free(buffer);
 }
 
@@ -744,7 +744,7 @@ blit(const struct device *device,
 
 	gem_execbuf(device->fd, &execbuf);
 	gem_close(device->fd, obj[2].handle);
-	put_offset(device->ahnd, obj[2].offset);
+	put_offset(device->ahnd, obj[2].handle);
 
 	dst->gtt_offset = obj[0].offset;
 	src->gtt_offset = obj[1].offset;
diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index ec69357140..2def529ac3 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -437,7 +437,7 @@ static void write_regs(int fd, uint64_t ahnd,
 	}
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj.handle);
-	put_offset(ahnd, obj.offset);
+	put_offset(ahnd, obj.handle);
 }
 
 static void restore_regs(int fd,
@@ -524,8 +524,8 @@ static void restore_regs(int fd,
 	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
-	put_offset(ahnd, obj[0].offset);
-	put_offset(ahnd, obj[1].offset);
+	put_offset(ahnd, obj[0].handle);
+	put_offset(ahnd, obj[1].handle);
 }
 
 __attribute__((unused))
diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index c3fc5ba804..616231aa96 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -106,10 +106,10 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 	if (gem_has_contexts(fd)) {
 		h->ctx = intel_ctx_create(h->fd, cfg);
 		h->execbuf.rsvd1 = h->ctx->id;
-		h->ahnd = get_reloc_ahnd(fd, h->ctx->id);
+		h->ahnd = get_reloc_ahnd(h->fd, h->ctx->id);
 	} else {
 		h->ctx = NULL;
-		h->ahnd = get_reloc_ahnd(fd, 0);
+		h->ahnd = get_reloc_ahnd(h->fd, 0);
 	}
 
 	memset(&h->execbuf, 0, sizeof(h->execbuf));
@@ -174,7 +174,8 @@ static void submit_hang(struct hang *h, unsigned *engines, int nengine, unsigned
 
 static void fini_hang(struct hang *h)
 {
-	put_offset(h->ahnd, h->bb_offset);
+	gem_close(h->fd, h->obj.handle);
+	put_offset(h->ahnd, h->obj.handle);
 	put_ahnd(h->ahnd);
 	intel_ctx_destroy(h->fd, h->ctx);
 	close(h->fd);
-- 
2.34.1
