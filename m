Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EC5CEDD86
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA00410E258;
	Wed,  9 Oct 2024 11:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6kLPTO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616C10E258
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473457; x=1760009457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2Rt025g2br65C35lTRDSHVgRCDhEFO3TBend1BpOYw=;
 b=O6kLPTO525qR5i1s50rYAib0FpwROkf3W+uiVeX4TN2oEq909v07/cfj
 XhALONtzvRKwhrPJG/hVWeBc+3pWSD9cWBzyv2qalQe4sI3f6payu/jqw
 Xqtm/9zCuqFJ97XRk52AfrQtq+S6R2xJH2MamQpSd2WyEBI/h6h1fha9T
 r9MGKEn5DVsDyKAwJMFPRGsY1vcGfDiaVI7Uq2fPDRQE6b/yCwEC0St42
 83G9W054V6w8a0TRroSLA9bxVIJUt7pz4lRRA7870sl1NXyvmmaLkS0Gq
 HgnjoThokTMoYcCUr+kI9wb9W9SlbVDj7qkTa8AOJupKLJCx2kEuJzOd/ w==;
X-CSE-ConnectionGUID: L6afO8YdQhWk2nyWNVtKlg==
X-CSE-MsgGUID: JqoxKsI6ToiKPpE24i4eWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45286341"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45286341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:52 -0700
X-CSE-ConnectionGUID: 4MF9NBjlQ2+qJzyHogCzCQ==
X-CSE-MsgGUID: rCIh1qtiTf+fqEmKaNWimw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113700009"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:49 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_sriov_flr: Implement clear-ggtt
 subcheck
Date: Wed,  9 Oct 2024 13:30:16 +0200
Message-Id: <20241009113018.741371-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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

Introduce the implementation of the clear-ggtt subcheck, which
provides functionality to verify Functional Level Reset (FLR)
across Virtual Functions (VFs) through GGTT (Global Graphics
Translation Table) testing.

This patch sets up the basic structures for manipulating GGTT
PTEs (Page Table Entries), finds the GGTT ranges assigned to each VF,
and verifies address resets after FLR.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 284 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 283 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 26b59101f..3bce235de 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -6,6 +6,10 @@
 #include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sriov_device.h"
+#include "intel_chipset.h"
+#include "linux_scaffold.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
 
 /**
  * TEST: xe_sriov_flr
@@ -246,9 +250,287 @@ disable_vfs:
 		igt_skip("No checks executed\n");
 }
 
+#define GEN12_VF_CAP_REG			0x1901f8
+#define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
+#define GGTT_PTE_ADDR_SHIFT			12
+#define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
+#define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
+#define GGTT_PTE_VFID_SHIFT			2
+
+#define for_each_pte_offset(pte_offset__, ggtt_offset_range__) \
+	for ((pte_offset__) = ((ggtt_offset_range__)->begin);  \
+	     (pte_offset__) < ((ggtt_offset_range__)->end);    \
+	     (pte_offset__) += sizeof(xe_ggtt_pte_t))
+
+struct ggtt_ops {
+	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+};
+
+struct ggtt_provisioned_offset_range {
+	uint32_t begin;
+	uint32_t end;
+};
+
+struct ggtt_data {
+	struct subcheck_data base;
+	struct ggtt_provisioned_offset_range *pte_offsets;
+	struct xe_mmio *mmio;
+	struct ggtt_ops ggtt;
+};
+
+static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
+{
+	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
+}
+
+static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+{
+	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+}
+
+static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+{
+	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
+
+	/* force flush by read some MMIO register */
+	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
+}
+
+static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
+			uint8_t gpa, xe_ggtt_pte_t *out)
+{
+	xe_ggtt_pte_t pte;
+
+	pte = ggtt->get_pte(mmio, gt, pte_offset);
+	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
+	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
+	ggtt->set_pte(mmio, gt, pte_offset, pte);
+	*out = ggtt->get_pte(mmio, gt, pte_offset);
+
+	return *out == pte;
+}
+
+static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
+			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
+{
+	uint8_t val;
+
+	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
+
+	return val == expected_gpa;
+}
+
+static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
+{
+	return mmio->dev;
+}
+
+static uint64_t get_vfid_mask(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
+		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
+}
+
+static bool pte_contains_vfid(const xe_ggtt_pte_t pte, const unsigned int vf_id,
+			      const uint64_t vfid_mask)
+{
+	return ((pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT) == vf_id;
+}
+
+static bool is_offset_in_range(uint32_t offset,
+			       const struct ggtt_provisioned_offset_range *ranges,
+			       size_t num_ranges)
+{
+	for (size_t i = 0; i < num_ranges; i++)
+		if (offset >= ranges[i].begin && offset < ranges[i].end)
+			return true;
+
+	return false;
+}
+
+static void find_ggtt_provisioned_ranges(struct ggtt_data *gdata)
+{
+	uint32_t limit = gdata->mmio->intel_mmio.mmio_size - SZ_8M > SZ_8M ?
+				 SZ_8M :
+				 gdata->mmio->intel_mmio.mmio_size - SZ_8M;
+	uint64_t vfid_mask = get_vfid_mask(gdata->base.pf_fd);
+	xe_ggtt_pte_t pte;
+
+	gdata->pte_offsets = calloc(gdata->base.num_vfs, sizeof(*gdata->pte_offsets));
+	igt_assert(gdata->pte_offsets);
+
+	for (int vf_id = 1; vf_id <= gdata->base.num_vfs; vf_id++) {
+		uint32_t range_begin = 0;
+		int adjacent = 0;
+		int num_ranges = 0;
+
+		for (uint32_t offset = 0; offset < limit; offset += sizeof(xe_ggtt_pte_t)) {
+			/* Skip already found ranges */
+			if (is_offset_in_range(offset, gdata->pte_offsets, vf_id - 1))
+				continue;
+
+			pte = xe_mmio_ggtt_read(gdata->mmio, gdata->base.gt, offset);
+
+			if (pte_contains_vfid(pte, vf_id, vfid_mask)) {
+				if (adjacent == 0)
+					range_begin = offset;
+
+				adjacent++;
+			} else if (adjacent > 0) {
+				uint32_t range_end = range_begin +
+						     adjacent * sizeof(xe_ggtt_pte_t);
+
+				igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
+					  vf_id, range_begin, range_end, adjacent);
+
+				if (adjacent > gdata->pte_offsets[vf_id - 1].end -
+					       gdata->pte_offsets[vf_id - 1].begin) {
+					gdata->pte_offsets[vf_id - 1].begin = range_begin;
+					gdata->pte_offsets[vf_id - 1].end = range_end;
+				}
+
+				adjacent = 0;
+				num_ranges++;
+			}
+		}
+
+		if (adjacent > 0) {
+			uint32_t range_end = range_begin + adjacent * sizeof(xe_ggtt_pte_t);
+
+			igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
+				  vf_id, range_begin, range_end, adjacent);
+
+			if (adjacent > gdata->pte_offsets[vf_id - 1].end -
+				       gdata->pte_offsets[vf_id - 1].begin) {
+				gdata->pte_offsets[vf_id - 1].begin = range_begin;
+				gdata->pte_offsets[vf_id - 1].end = range_end;
+			}
+			num_ranges++;
+		}
+
+		if (num_ranges == 0) {
+			igt_assert_neq(asprintf(&gdata->base.stop_reason,
+						"Failed to find VF%d provisioned ggtt range\n",
+						vf_id),
+				       -1);
+			return;
+		}
+		igt_warn_on_f(num_ranges > 1, "Found %d ranges for VF%d\n", num_ranges, vf_id);
+	}
+}
+
+static void ggtt_subcheck_init(struct subcheck_data *data)
+{
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+
+	if (xe_is_media_gt(data->pf_fd, data->gt)) {
+		igt_assert_neq(asprintf(&data->stop_reason,
+					"%s : GGTT unavailable on media GT", SKIP_REASON), -1);
+		return;
+	}
+
+	gdata->ggtt.get_pte = intel_get_pte;
+	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
+		gdata->ggtt.set_pte = intel_mtl_set_pte;
+	else
+		gdata->ggtt.set_pte = intel_set_pte;
+
+	if (gdata->mmio) {
+		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
+			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
+
+		find_ggtt_provisioned_ranges(gdata);
+	} else {
+		igt_assert_neq(asprintf(&data->stop_reason, "xe_mmio is NULL"), -1);
+	}
+}
+
+static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+{
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+	xe_ggtt_pte_t pte;
+	uint32_t pte_offset;
+
+	if (data->stop_reason)
+		return;
+
+	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
+		  gdata->pte_offsets[vf_id - 1].begin,
+		  gdata->pte_offsets[vf_id - 1].end);
+
+	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id - 1]) {
+		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+				 (uint8_t)vf_id, &pte)) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
+						vf_id, pte, pte_offset),
+				       -1);
+			return;
+		}
+	}
+}
+
+static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+{
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
+	xe_ggtt_pte_t pte;
+	uint32_t pte_offset;
+
+	if (data->stop_reason)
+		return;
+
+	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id - 1]) {
+		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+				   expected, &pte)) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#lx at offset: %#x\n",
+						flr_vf_id, vf_id, pte, pte_offset),
+				       -1);
+			return;
+		}
+	}
+}
+
+static void ggtt_subcheck_cleanup(struct subcheck_data *data)
+{
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+
+	free(gdata->pte_offsets);
+	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
+		xe_mmio_access_fini(gdata->mmio);
+}
+
 static void clear_tests(int pf_fd, int num_vfs)
 {
-	verify_flr(pf_fd, num_vfs, NULL, 0);
+	struct xe_mmio xemmio = { };
+	const unsigned int num_gts = xe_number_gt(pf_fd);
+	struct ggtt_data gdata[num_gts];
+	const unsigned int num_checks = num_gts;
+	struct subcheck checks[num_checks];
+	int i;
+
+	for (i = 0; i < num_gts; ++i) {
+		gdata[i] = (struct ggtt_data){
+			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = i },
+			.mmio = &xemmio
+		};
+		checks[i] = (struct subcheck){
+			.data = (struct subcheck_data *)&gdata[i],
+			.name = "clear-ggtt",
+			.init = ggtt_subcheck_init,
+			.prepare_vf = ggtt_subcheck_prepare_vf,
+			.verify_vf = ggtt_subcheck_verify_vf,
+			.cleanup = ggtt_subcheck_cleanup
+		};
+	}
+	igt_assert_eq(i, num_checks);
+
+	verify_flr(pf_fd, num_vfs, checks, num_checks);
 }
 
 igt_main
-- 
2.31.1

