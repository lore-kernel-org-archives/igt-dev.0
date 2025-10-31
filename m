Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED8CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA4810E2C9;
	Fri, 31 Oct 2025 12:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSqRtIf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1310E2C9
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761915464; x=1793451464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QbVmyWb1vw8ZmEUK9118eAQrlZ1I3J6LbRON/kiksCs=;
 b=nSqRtIf+zZwphfeDyYPEUjV1CjcT4YrsiFIacJ8jq3WovXOIQqfqKMMr
 fjr2WtdcVth+PYYFrEvP3HhfIJDSsCC2D0QjJuhug/Om3Z5hhtrmnGSdb
 BvLvG4BUFPz/L5dvbDRX1LrS6ENzyZVc0ZJgYh0ghHv6RZ+g1zbttcml7
 jO/qc3H7GzmgDGW2SGC6iH2MhSI5ey+cpPLus0QQM8YnGg9mcw0mxuMvb
 EUupNAon3d9T4EN9NIYCFx/xjGaMXjLr5KfPKs/VWwV3FTya/9IqNipq7
 fsf5WFEh0KSiCJX6FFlhVv1C/G+Klnzaiw3nPML5LCl7GvVX596v2z/be Q==;
X-CSE-ConnectionGUID: au24msXeTi+h8D20QAEA9g==
X-CSE-MsgGUID: ldiPadNbRvqMp1iHD5wMgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64116535"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64116535"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:44 -0700
X-CSE-ConnectionGUID: pqYLSPahQES8pFzxaRNL0g==
X-CSE-MsgGUID: Vojl+uMgRk6X/hgxo1Ihnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="190577703"
Received: from lburylo-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.246.19.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/6] tests/xe_sriov_flr: Make subchecks Tile aware
Date: Fri, 31 Oct 2025 13:56:31 +0100
Message-ID: <20251031125633.1374273-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
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

Follow up on Piotr's adjustments for tile-aware FLR tests.

Replace GT ID with Tile ID in struct subcheck_data and adapt the code
to use new MMIO tile helpers. Each tile now has its own set of subchecks
initialized in clear_tests, with separate data structures per tile.

Keeping the Tile ID in subcheck_data allows verify_flr() to remain
unchanged and avoids an xe_for_each_tile "explosion".

Link: https://patchwork.freedesktop.org/series/156216/
Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 276 ++++++++++++++++++-------------------
 1 file changed, 135 insertions(+), 141 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 077ed15af..38b303391 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -66,8 +66,7 @@ const char *SKIP_REASON = "SKIP";
  * @pf_fd: File descriptor for the Physical Function.
  * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
  *           used to iterate over and manage the VFs during the testing process.
- * @gt: GT under test. This identifier is used to specify a particular GT
- *      for operations when GT-specific testing is required.
+ * @tile: Tile under test.
  * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
  *               This field is crucial for controlling the flow of subcheck execution.
  *               If set, it should prevent further execution of the current subcheck,
@@ -79,12 +78,12 @@ const char *SKIP_REASON = "SKIP";
  * Example usage:
  * A typical use of this structure involves initializing it with the necessary test setup
  * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
- * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
+ * and using `pf_fd`, `num_vfs`, and `tile` as needed based on the specific subcheck requirements.
  */
 struct subcheck_data {
 	int pf_fd;
 	int num_vfs;
-	int gt;
+	uint8_t tile;
 	char *stop_reason;
 };
 
@@ -207,16 +206,19 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
 	for (int i = 0; i < num_checks; ++i) {
 		if (checks[i].data->stop_reason) {
 			if (is_subcheck_skipped(&checks[i])) {
-				igt_info("%s: %s", checks[i].name,
+				igt_info("%s: Tile%u: %s", checks[i].name,
+					 checks[i].data->tile,
 					 checks[i].data->stop_reason);
 				skips++;
 			} else {
-				igt_critical("%s: %s", checks[i].name,
+				igt_critical("%s: Tile%u: %s", checks[i].name,
+					     checks[i].data->tile,
 					     checks[i].data->stop_reason);
 				fails++;
 			}
 		} else {
-			igt_info("%s: SUCCESS\n", checks[i].name);
+			igt_info("%s: Tile%u: SUCCESS\n", checks[i].name,
+				 checks[i].data->tile);
 		}
 	}
 
@@ -470,8 +472,8 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
 #define GGTT_PTE_ADDR_SHIFT			12
 
 struct ggtt_ops {
-	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
-	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
+	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
 };
 
 struct ggtt_provisioned_offset_range {
@@ -491,68 +493,66 @@ struct ggtt_data {
 	struct ggtt_ops ggtt;
 };
 
-static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
+static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset)
 {
-	return xe_mmio_ggtt_read(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset);
+	return xe_mmio_ggtt_read(mmio, tile, pte_offset);
 }
 
-static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile,
+			  uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
 }
 
-static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile,
+			      uint32_t pte_offset, xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, xe_gt_get_tile_id(mmio->fd, gt), pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_tile_read32(mmio, xe_gt_get_tile_id(mmio->fd, gt), GEN12_VF_CAP_REG);
+	xe_mmio_gt_read32(mmio, tile, GEN12_VF_CAP_REG);
 }
 
-static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			uint8_t gpa, xe_ggtt_pte_t *out)
+static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
 {
 	xe_ggtt_pte_t pte;
 
-	pte = ggtt->get_pte(mmio, gt, pte_offset);
+	pte = ggtt->get_pte(mmio, tile, pte_offset);
 	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
 	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
-	ggtt->set_pte(mmio, gt, pte_offset, pte);
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	ggtt->set_pte(mmio, tile, pte_offset, pte);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 
 	return *out == pte;
 }
 
-static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
+static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
 {
 	uint8_t val;
 
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
 
 	return val == expected_gpa;
 }
 
-static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
-{
-	return mmio->dev;
-}
-
 static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 {
 	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt = gdata->base.gt;
+	uint8_t tile = gdata->base.tile;
+	unsigned int nr_ranges;
 
 	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
 	igt_assert(gdata->pte_offsets);
 
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, xe_gt_get_tile_id(pf_fd, gt),
-							 gdata->mmio, &ranges, &nr_ranges);
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio,
+							 &ranges, &nr_ranges);
 	if (ret) {
-		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
-				gt, ret);
+		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
+				ret);
 		return -1;
 	}
 
@@ -597,12 +597,6 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
-	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
-		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
-				data->gt);
-		return;
-	}
-
 	gdata->ggtt.get_pte = intel_get_pte;
 	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
 		gdata->ggtt.set_pte = intel_mtl_set_pte;
@@ -610,7 +604,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 		gdata->ggtt.set_pte = intel_set_pte;
 
 	if (gdata->mmio) {
-		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
+		if (!xe_mmio_is_initialized(&gdata->mmio[0]))
 			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
 
 		populate_ggtt_pte_offsets(gdata);
@@ -628,12 +622,13 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	if (data->stop_reason)
 		return;
 
-	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
+	igt_debug("Tile%u: Prepare gpa on VF%u offset range [%#x-%#x]\n",
+		  gdata->base.tile, vf_id,
 		  gdata->pte_offsets[vf_id].start,
 		  gdata->pte_offsets[vf_id].end);
 
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
 			set_skip_reason(data,
 					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
@@ -654,7 +649,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 		return;
 
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
 				   expected, &pte)) {
 			set_fail_reason(data,
 					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
@@ -669,8 +664,6 @@ static void ggtt_subcheck_cleanup(struct subcheck_data *data)
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
 	free(gdata->pte_offsets);
-	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
-		xe_mmio_access_fini(gdata->mmio);
 }
 
 struct lmem_data {
@@ -739,37 +732,33 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt;
+	unsigned int nr_ranges, main_gt;
 	int ret;
 
+	main_gt = xe_tile_get_main_gt_id(data->pf_fd, data->tile);
 	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
 	igt_assert(ldata->vf_lmem_size);
 
-	xe_for_each_gt(data->pf_fd, gt) {
-		if (!xe_is_main_gt(data->pf_fd, gt))
-			continue;
-
-		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
-								  XE_SRIOV_SHARED_RES_LMEM,
-								  gt, &ranges, &nr_ranges);
-		if (ret) {
-			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
-					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
-					gt, ret);
-			return -1;
-		}
-
-		for (unsigned int i = 0; i < nr_ranges; ++i) {
-			const unsigned int vf_id = ranges[i].vf_id;
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
+							  XE_SRIOV_SHARED_RES_LMEM,
+							  main_gt, &ranges, &nr_ranges);
+	if (ret) {
+		set_skip_reason(data, "Failed read %s on main GT (%d)\n",
+				xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
+				ret);
+		return -1;
+	}
 
-			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
-			/* Sum the allocation for vf_id (inclusive range) */
-			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
-		}
+	for (unsigned int i = 0; i < nr_ranges; ++i) {
+		const unsigned int vf_id = ranges[i].vf_id;
 
-		free(ranges);
+		igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
+		/* Sum the allocation for vf_id (inclusive range) */
+		ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
 	}
 
+	free(ranges);
+
 	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
 		if (!ldata->vf_lmem_size[vf_id]) {
 			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
@@ -839,7 +828,7 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
 
 struct regs_data {
 	struct subcheck_data base;
-	struct intel_mmio_data *mmio;
+	struct xe_mmio *mmio;
 	uint32_t reg_addr;
 	int reg_count;
 };
@@ -857,31 +846,21 @@ static void regs_subcheck_init(struct subcheck_data *data)
 static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
+	uint8_t tile = data->tile;
 	uint32_t reg;
 	int i;
 
 	if (data->stop_reason)
 		return;
 
-	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
-		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
-
-		if (!pci_dev) {
-			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
-			return;
-		}
-
-		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
-			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
-			return;
-		}
-	}
+	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
+		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
 
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
+		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
 			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
 			return;
 		}
@@ -901,7 +880,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], data->tile, reg) != expected) {
 			set_fail_reason(data,
 					"Registers check after VF%u FLR failed on VF%u\n",
 					flr_vf_id, vf_id);
@@ -910,50 +889,42 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	}
 }
 
-static void regs_subcheck_cleanup(struct subcheck_data *data)
-{
-	struct regs_data *rdata = (struct regs_data *)data;
-	int i;
+static void regs_subcheck_cleanup(struct subcheck_data *data) { }
 
-	if (rdata->mmio)
-		for (i = 1; i <= data->num_vfs; ++i)
-			if (is_intel_mmio_initialized(&rdata->mmio[i]))
-				intel_register_access_fini(&rdata->mmio[i]);
+static void cleanup_mmio(struct xe_mmio *mmio, int num_vfs)
+{
+	for (int i = 0; i <= num_vfs; ++i)
+		if (xe_mmio_is_initialized(&mmio[i]))
+			xe_mmio_access_fini(&mmio[i]);
 }
 
 static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 {
-	struct xe_mmio xemmio = { };
-	const unsigned int num_gts = xe_number_gt(pf_fd);
-	struct ggtt_data gdata[num_gts];
-	struct lmem_data ldata = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
-	};
-	struct intel_mmio_data mmio[num_vfs + 1];
-	struct regs_data scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
-		.mmio = mmio,
-		.reg_addr = SCRATCH_REG,
-		.reg_count = SCRATCH_REG_COUNT
-	};
-	struct regs_data media_scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
-		.mmio = mmio,
-		.reg_addr = MED_SCRATCH_REG,
-		.reg_count = MED_SCRATCH_REG_COUNT
-	};
-	const unsigned int num_checks = num_gts + 3;
+	struct xe_mmio mmio[num_vfs + 1];
+	const uint8_t num_tiles = xe_tiles_count(pf_fd);
+	struct subcheck_data base;
+	struct ggtt_data gdata[num_tiles];
+	struct lmem_data ldata[num_tiles];
+	struct regs_data scratch_data[num_tiles];
+	struct regs_data media_scratch_data[num_tiles];
+	const unsigned int subcheck_count  = 4;
+	const unsigned int num_checks =	subcheck_count * num_tiles;
 	struct subcheck checks[num_checks];
-	int i = 0, gt_id;
+	unsigned int i = 0, t;
 
 	memset(mmio, 0, sizeof(mmio));
 
-	xe_for_each_gt(pf_fd, gt_id) {
+	xe_for_each_tile(pf_fd, t) {
+		igt_assert_lt(i, num_tiles);
+		base = (struct subcheck_data){ .pf_fd = pf_fd,
+					       .num_vfs = num_vfs,
+					       .tile = t };
+
 		gdata[i] = (struct ggtt_data){
-			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
-			.mmio = &xemmio
+			.base = base,
+			.mmio = mmio,
 		};
-		checks[i] = (struct subcheck){
+		checks[i * subcheck_count + 0] = (struct subcheck){
 			.data = (struct subcheck_data *)&gdata[i],
 			.name = "clear-ggtt",
 			.init = ggtt_subcheck_init,
@@ -961,33 +932,56 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 			.verify_vf = ggtt_subcheck_verify_vf,
 			.cleanup = ggtt_subcheck_cleanup
 		};
+
+		ldata[i] = (struct lmem_data){
+			.base = base,
+		};
+		checks[i * subcheck_count + 1] = (struct subcheck){
+			.data = (struct subcheck_data *)&ldata[i],
+			.name = "clear-lmem",
+			.init = lmem_subcheck_init,
+			.prepare_vf = lmem_subcheck_prepare_vf,
+			.verify_vf = lmem_subcheck_verify_vf,
+			.cleanup = lmem_subcheck_cleanup
+		};
+
+		scratch_data[i] = (struct regs_data){
+			.base = base,
+			.mmio = mmio,
+			.reg_addr = SCRATCH_REG,
+			.reg_count = SCRATCH_REG_COUNT,
+		};
+		checks[i * subcheck_count + 2] = (struct subcheck){
+			.data = (struct subcheck_data *)&scratch_data[i],
+			.name = "clear-scratch-regs",
+			.init = regs_subcheck_init,
+			.prepare_vf = regs_subcheck_prepare_vf,
+			.verify_vf = regs_subcheck_verify_vf,
+			.cleanup = regs_subcheck_cleanup
+		};
+
+		media_scratch_data[i] = (struct regs_data){
+			.base = base,
+			.mmio = mmio,
+			.reg_addr = MED_SCRATCH_REG,
+			.reg_count = MED_SCRATCH_REG_COUNT,
+		};
+		checks[i * subcheck_count + 3] = (struct subcheck){
+			.data = (struct subcheck_data *)&media_scratch_data[i],
+			.name = "clear-media-scratch-regs",
+			.init = regs_subcheck_init,
+			.prepare_vf = regs_subcheck_prepare_vf,
+			.verify_vf = regs_subcheck_verify_vf,
+			.cleanup = regs_subcheck_cleanup
+		};
 		i++;
 	}
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&ldata,
-		.name = "clear-lmem",
-		.init = lmem_subcheck_init,
-		.prepare_vf = lmem_subcheck_prepare_vf,
-		.verify_vf = lmem_subcheck_verify_vf,
-		.cleanup = lmem_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&scratch_data,
-		.name = "clear-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&media_scratch_data,
-		.name = "clear-media-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup
-	};
-	igt_assert_eq(i, num_checks);
+	igt_assert_eq(i, num_tiles);
+	igt_assert_eq(i * subcheck_count, num_checks);
 
 	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
+
+	cleanup_mmio(mmio, num_vfs);
 }
 
 igt_main
-- 
2.43.0

