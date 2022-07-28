Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556F99B7F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 12:06:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 14:06:20 +0200
Message-Id: <20220728120620.54065-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/batchbuffer: Ensure obj.alignment is
 zeroed for softpinning
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

Passing obj.alignment doesn't make sense for softpinning as offsets
are under full control of allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_batchbuffer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 36cb55048d..ef1b594771 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1346,7 +1346,6 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 
 	igt_assert(ibb);
 
-	ibb->allows_obj_alignment = gem_allows_obj_alignment(i915);
 	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(i915);
 	ibb->devid = intel_get_drm_devid(i915);
 	ibb->gen = intel_gen(ibb->devid);
@@ -1359,6 +1358,13 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
 	if (!ibb->uses_full_ppgtt)
 		do_relocs = true;
 
+	/*
+	 * For softpin mode allocator has full control over offsets allocation
+	 * so we want kernel to not interfere with this.
+	 */
+	if (do_relocs)
+		ibb->allows_obj_alignment = gem_allows_obj_alignment(i915);
+
 	/* Use safe start offset instead assuming 0x0 is safe */
 	start = max_t(uint64_t, start, gem_detect_safe_start_offset(i915));
 
-- 
2.34.1
