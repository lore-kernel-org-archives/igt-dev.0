Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71156EA54
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 17:40:21 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 20 Jan 2020 17:39:59 +0000
Message-Id: <20200120173959.4177379-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Fix fence leak for
 gen9-cmdparser
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
To: intel-gfx@lists.freedsktop.org
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Fixes: 9e57f8a51d59 ("lib/i915: Add query to detect if engine accepts only ro batches")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
---
 tests/i915/gem_exec_fence.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 0fc7301a0..2f802eece 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -139,14 +139,17 @@ static void test_fence_busy(int fd, unsigned ring, unsigned flags)
 	gem_set_domain(fd, obj.handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
+	i = 0;
+	if ((flags & HANG) == 0)
+		batch[i++] = 0x5 << 23;
+
 	reloc.target_handle = obj.handle; /* recurse */
 	reloc.presumed_offset = 0;
-	reloc.offset = sizeof(uint32_t);
+	reloc.offset = (i + 1) * sizeof(uint32_t);
 	reloc.delta = 0;
 	reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
 	reloc.write_domain = 0;
 
-	i = 0;
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
@@ -227,14 +230,17 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	gem_set_domain(fd, obj.handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
+	i = 0;
+	if ((flags & HANG) == 0)
+		batch[i++] = 0x5 << 23;
+
 	reloc.target_handle = obj.handle; /* recurse */
 	reloc.presumed_offset = 0;
-	reloc.offset = sizeof(uint32_t);
+	reloc.offset = (i + 1) * sizeof(uint32_t);
 	reloc.delta = 0;
 	reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
 	reloc.write_domain = 0;
 
-	i = 0;
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
@@ -257,8 +263,10 @@ static void test_fence_busy_all(int fd, unsigned flags)
 	for_each_engine(e, fd) {
 		int fence, new;
 
-		if ((flags & HANG) == 0)
-			igt_require(gem_engine_has_mutable_submission(fd, eb_ring(e)));
+		if ((flags & HANG) == 0 &&
+		    !gem_engine_has_mutable_submission(fd, eb_ring(e)))
+			continue;
+
 		execbuf.flags = eb_ring(e) | I915_EXEC_FENCE_OUT;
 		execbuf.rsvd2 = -1;
 		gem_execbuf_wr(fd, &execbuf);
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
