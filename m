Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5896E402
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 09:12:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Nov 2021 10:12:03 +0100
Message-Id: <20211123091203.6076-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/api_intel_bb: Use alignment only when
 kernel support it
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Test uses intel-bb api so we're responsible to pass valid alignment
or 0 when it is not supported by the kernel. Add appropriate check
to avoid failing on such kernels.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/api_intel_bb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 82943a341..5c996f644 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -469,6 +469,7 @@ static void object_reloc(struct buf_ops *bops, enum obj_cache_ops cache_op)
 	uint64_t flags = 0;
 	uint64_t shift = cache_op == PURGE_CACHE ? 0x2000 : 0x0;
 	bool purge_cache = cache_op == PURGE_CACHE ? true : false;
+	uint64_t alignment = gem_allows_obj_alignment(i915) ? 0x2000 : 0x0;
 
 	ibb = intel_bb_create_with_relocs(i915, PAGE_SIZE);
 	if (debug_bb)
@@ -490,7 +491,7 @@ static void object_reloc(struct buf_ops *bops, enum obj_cache_ops cache_op)
 	igt_assert(poff_h2 == INTEL_BUF_INVALID_ADDRESS);
 
 	intel_bb_add_object(ibb, h1, PAGE_SIZE, poff_h1, 0, true);
-	intel_bb_add_object(ibb, h2, PAGE_SIZE, poff_h2, 0x2000, true);
+	intel_bb_add_object(ibb, h2, PAGE_SIZE, poff_h2, alignment, true);
 
 	/*
 	 * Objects were added to bb, we expect initial addresses are zeroed
@@ -516,7 +517,7 @@ static void object_reloc(struct buf_ops *bops, enum obj_cache_ops cache_op)
 
 	if (purge_cache) {
 		intel_bb_add_object(ibb, h1, PAGE_SIZE, poff2_h1, 0, true);
-		intel_bb_add_object(ibb, h2, PAGE_SIZE, poff2_h2 + shift, 0x2000, true);
+		intel_bb_add_object(ibb, h2, PAGE_SIZE, poff2_h2 + shift, alignment, true);
 	}
 
 	poff_bb = intel_bb_get_object_offset(ibb, ibb->handle);
-- 
2.26.0
