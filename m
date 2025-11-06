Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3588CCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B428310E92F;
	Thu,  6 Nov 2025 15:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX7MFTTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11E410E935
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762442907; x=1793978907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ik6cGYvvuHLW9i5OVwr7RMR9ARP647mGUBr8UQrJwAM=;
 b=ZX7MFTTtC6pJIIhDW/m+MWYOfB/LVbjyyiv3mjfdyIroltlLlBAXXHUB
 azKrDo2Eq93uehJTodQ9oiPYtHDLfaQB14XOH/ryxrRWDWPcqk/IYXFml
 IRAJ3+dXayCbpWSXe8YOttneEoftGbks4stubVWvIMlGE7NcfnsHmfQ2P
 JRlpywaj14lYXUaW8OGN9sWX6kmkRbwOI89TSc/pUQIAcFyomPVcFEtPB
 anJVVJ5KZArvgS3vVl8YoWmV6GcOGpWkCWf4Lyeo6VFc02P8PPgKuiA9x
 e3DRIjamjbDvoPX9yZH2kuTLzHpnoDLAwgCs4EoVc6lF1ooXnShCzVQnf g==;
X-CSE-ConnectionGUID: 8Wg11t33S0uGnBBZGVZL2Q==
X-CSE-MsgGUID: LtfZ0pUSRmSj4WL315nLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63789024"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="63789024"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:26 -0800
X-CSE-ConnectionGUID: HHqYR7QTRfCTlU+8c0ZkNA==
X-CSE-MsgGUID: HVuOYYPISWmN3tkJkQeH+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192059945"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:23 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t 1/6] lib/xe_mmio: Introduce tile-level XE MMIO access
 helpers
Date: Thu,  6 Nov 2025 16:28:05 +0100
Message-ID: <20251106152811.1997614-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
References: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add new helpers for tile-based MMIO access:
 - xe_mmio_tile_read32()
 - xe_mmio_tile_read64()
 - xe_mmio_tile_write32()
 - xe_mmio_tile_write64()

These functions provide explicit MMIO read/write operations within
a given tile by applying TILE_MMIO_SIZE offsetting logic.
GGTT is also a per-tile resource, so let's adjust the GGTT access
helpers to use tile IDs instead of GT.

v2:
 - find the real tile based on gt instead of assuming root tile
v3:
 - drop misleading GT-oriented helpers (Lukasz)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_mmio.c               | 78 ++++++++++++++++------------------
 lib/xe/xe_mmio.h               | 13 +++---
 lib/xe/xe_sriov_provisioning.c |  6 +--
 lib/xe/xe_sriov_provisioning.h |  2 +-
 tests/intel/xe_sriov_flr.c     | 12 +++---
 5 files changed, 52 insertions(+), 59 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 834816133..b52e90dba 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -107,94 +107,88 @@ void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
 	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
 }
 
-/**
- * xe_mmio_gt_read32:
+/** xe_mmio_tile_read32:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: mmio register offset in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: mmio register offset in the tile
  *
- * 32-bit read of the register at @offset in tile to which @gt belongs.
+ * 32-bit read of the register at @offset in the specified @tile
  *
- * Returns:
- * The value read from the register.
+ * Returns: The value read from the register.
  */
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
 {
-	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * tile));
 }
 
-/**
- * xe_mmio_gt_read64:
+/** xe_mmio_tile_read64:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: mmio register offset in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
  *
- * 64-bit read of the register at @offset in tile to which @gt belongs.
+ * 64-bit read of the register at @offset in the specified @tile
  *
- * Returns:
- * The value read from the register.
+ * Returns: The value read from the register.
  */
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
 {
-	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
+	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * tile));
 }
 
 /**
- * xe_mmio_gt_write32:
+ * xe_mmio_tile_write32:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: mmio register offset
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
  * @val: value to write
  *
- * 32-bit write to the register at @offset in tile to which @gt belongs.
+ * 32-bit write to the register at @offset in the specified @tile
  */
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val)
 {
-	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * tile), val);
 }
 
 /**
- * xe_mmio_gt_write64:
+ * xe_mmio_tile_write64:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: mmio register offset
+ * @tile: tile id
+ * @offset: mmio register offset in the @tile
  * @val: value to write
  *
- * 64-bit write to the register at @offset in tile to which @gt belongs.
+ * 64-bit write to the register at @offset in the specified @tile
  */
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val)
 {
-	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
-			       val);
+	xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * tile), val);
 }
 
 /**
  * xe_mmio_ggtt_read:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  *
- * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ * Read of GGTT PTE at GGTT @offset in the @tile.
  *
  * Returns:
  * The value read from the register.
  */
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t offset)
 {
-	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+	return xe_mmio_tile_read64(mmio, tile, offset + GGTT_OFFSET_IN_TILE);
 }
 
 /**
  * xe_mmio_ggtt_write:
  * @mmio: xe mmio structure for IO operations
- * @gt: gt id
- * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @tile: tile id
+ * @offset: PTE offset from the beginning of GGTT in @tile
  * @pte: PTE value to write
  *
- * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ * Write PTE value at GGTT @offset in the @tile.
  */
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, xe_ggtt_pte_t pte)
 {
-	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+	return xe_mmio_tile_write64(mmio, tile, offset + GGTT_OFFSET_IN_TILE, pte);
 }
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
index f144d4b53..35cafa448 100644
--- a/lib/xe/xe_mmio.h
+++ b/lib/xe/xe_mmio.h
@@ -29,13 +29,12 @@ uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
 void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
 void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
 
-uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
-uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
+uint32_t xe_mmio_tile_read32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+uint64_t xe_mmio_tile_read64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset);
+void xe_mmio_tile_write32(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint32_t val);
+void xe_mmio_tile_write64(struct xe_mmio *mmio, uint8_t tile, uint32_t offset, uint64_t val);
 
-void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
-void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
-
-xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
-void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
 
 #endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index ff9d1f7d2..2ca73d2ef 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -90,7 +90,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
 /**
  * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
  * @pf_fd: File descriptor for the Physical Function
- * @gt: GT identifier
+ * @tile: Tile id
  * @mmio: Pointer to the MMIO structure
  * @ranges: Pointer to the array of provisioned ranges
  * @nr_ranges: Pointer to the number of provisioned ranges
@@ -106,7 +106,7 @@ static int append_range(struct xe_sriov_provisioned_range **ranges,
  *
  * Returns 0 on success, or a negative error code on failure.
  */
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges)
 {
@@ -122,7 +122,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
 	     offset += sizeof(xe_ggtt_pte_t)) {
-		pte = xe_mmio_ggtt_read(mmio, gt, offset);
+		pte = xe_mmio_ggtt_read(mmio, tile, offset);
 		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
 
 		if (vf_id != current_vf_id) {
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index e1a9d0a63..1e1dca866 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -92,7 +92,7 @@ struct xe_sriov_provisioned_range {
 
 const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res, unsigned int gt);
-int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
+int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, uint8_t tile, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
 const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index aabbd8c05..077ed15af 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -493,20 +493,20 @@ struct ggtt_data {
 
 static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
 {
-	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
+	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
 }
 
 static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
 }
 
 static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
+	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
 }
 
 static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
@@ -548,8 +548,8 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
 	igt_assert(gdata->pte_offsets);
 
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
-							 &ranges, &nr_ranges);
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
+							 gdata->mmio, &ranges, &nr_ranges);
 	if (ret) {
 		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
 				gt, ret);
-- 
2.43.0

