Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Aug 2020 19:26:39 +0100
Message-Id: <20200820182640.65842-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200820182640.65842-1-chris@chris-wilson.co.uk>
References: <20200820182640.65842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] i915/bb: Cleanup 32bit printfs
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use PRIx64 for 64b addresses on a 32b build.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/api_intel_bb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 6967fc5d0..cf7f6e91b 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -260,9 +260,9 @@ static void blit(struct buf_ops *bops,
 	poff_bb = intel_bb_get_object_offset(ibb, ibb->handle);
 	poff_src = intel_bb_get_object_offset(ibb, src->handle);
 	poff_dst = intel_bb_get_object_offset(ibb, dst->handle);
-	igt_debug("bb  presumed offset: 0x%lx\n", poff_bb);
-	igt_debug("src presumed offset: 0x%lx\n", poff_src);
-	igt_debug("dst presumed offset: 0x%lx\n", poff_dst);
+	igt_debug("bb  presumed offset: 0x%"PRIx64"\n", poff_bb);
+	igt_debug("src presumed offset: 0x%"PRIx64"\n", poff_src);
+	igt_debug("dst presumed offset: 0x%"PRIx64"\n", poff_dst);
 	if (reloc_obj == RELOC) {
 		igt_assert(poff_bb == 0);
 		igt_assert(poff_src == 0);
@@ -289,12 +289,12 @@ static void blit(struct buf_ops *bops,
 	poff2_dst = intel_bb_get_object_offset(ibb, dst->handle);
 
 	igt_debug("purge: %d, relocs: %d\n", purge_cache, do_relocs);
-	igt_debug("bb  presumed offset: 0x%lx\n", poff_bb);
-	igt_debug("src presumed offset: 0x%lx\n", poff_src);
-	igt_debug("dst presumed offset: 0x%lx\n", poff_dst);
-	igt_debug("bb2  presumed offset: 0x%lx\n", poff2_bb);
-	igt_debug("src2 presumed offset: 0x%lx\n", poff2_src);
-	igt_debug("dst2 presumed offset: 0x%lx\n", poff2_dst);
+	igt_debug("bb  presumed offset: 0x%"PRIx64"\n", poff_bb);
+	igt_debug("src presumed offset: 0x%"PRIx64"\n", poff_src);
+	igt_debug("dst presumed offset: 0x%"PRIx64"\n", poff_dst);
+	igt_debug("bb2  presumed offset: 0x%"PRIx64"\n", poff2_bb);
+	igt_debug("src2 presumed offset: 0x%"PRIx64"\n", poff2_src);
+	igt_debug("dst2 presumed offset: 0x%"PRIx64"\n", poff2_dst);
 	if (purge_cache) {
 		if (do_relocs) {
 			igt_assert(poff2_bb == 0);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
