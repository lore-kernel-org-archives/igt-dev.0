Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CEFD711CF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526F389496;
	Wed, 20 Nov 2024 17:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBS37gmg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D6A89496
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732124315; x=1763660315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6qU1Jh/neQ0Mj9Z2p8l7Nvaw18fLHvmlLdtfcmgEck=;
 b=fBS37gmgQiBIR9X3/HC7XQa1lUGr28MF2r+2VbVDr/4WTq5gml17GBcR
 qpJ+A65IDAf5oXcuWFVfgU5y8B/G5u8vW9Mv688mHQ+qsLm49ZQF8IERK
 WyQZW7nT+KeLNyUod7jCu8IHpDnM4qDoGHxb1SV2hRC9Raq1/ara6U/Xr
 rSvmx4MvAVK4GxtSr7kjP/13d3CLAb5RL+Hh4FZlKIhJlTxAuZqB1k/mD
 bQzVMeMD2WkbhM4h1OoNiGu6DRVid2mR99Tev6BQHXFnCN9bkhrDCqSut
 bG7CuKqDnjI6o2s1zSbkgyHp5NhJdWwBp/9Nvuv9c1/mki+p1l3B5j76Z A==;
X-CSE-ConnectionGUID: 8Wk0vMkQTuWyuqS7q5SFkg==
X-CSE-MsgGUID: mBCvADyGSgKK8l1kGX3qyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="19793886"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="19793886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:35 -0800
X-CSE-ConnectionGUID: VX3zvc5kQ2uAe7fpwtwcIg==
X-CSE-MsgGUID: 7DssBHG3RJmx9HaSVHnlMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="94932259"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.199])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:31 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 3/3] tests/xe/xe_sriov_flr: Use SKIP for unmet
 subcheck prerequisites
Date: Wed, 20 Nov 2024 18:37:49 +0100
Message-Id: <20241120173749.348843-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
References: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
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

Handle missing prerequisites by marking subchecks as SKIP instead of FAIL.
This avoids misleading results suggesting FLR issues when tests haven't
started or conditions aren't met.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: C V Narasimha <narasimha.c.v@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 1049cffec..550d58bb9 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 		if (vf_id == 0)
 			continue;
 
-		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
+		if (vf_id < 1 || vf_id > num_vfs) {
+			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
+					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			free(ranges);
+			return -1;
+		}
 
 		if (gdata->pte_offsets[vf_id].end) {
 			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
@@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 
 	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
 		if (!gdata->pte_offsets[vf_id].end) {
-			set_fail_reason(&gdata->base,
+			set_skip_reason(&gdata->base,
 					"Failed to find VF%u provisioned GGTT PTE offset range\n",
 					vf_id);
 			return -1;
@@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 
 		populate_ggtt_pte_offsets(gdata);
 	} else {
-		set_fail_reason(data, "xe_mmio is NULL\n");
+		set_skip_reason(data, "xe_mmio is NULL\n");
 	}
 }
 
@@ -460,7 +465,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
 		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
-			set_fail_reason(data,
+			set_skip_reason(data,
 					"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
 					vf_id, pte, pte_offset);
 			return;
@@ -696,7 +701,7 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
 				    ldata->vf_lmem_size[vf_id], vf_id)) {
-		set_fail_reason(data, "LMEM write failed on VF%u\n", vf_id);
+		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
 	}
 }
 
@@ -758,12 +763,12 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
 
 		if (!pci_dev) {
-			set_fail_reason(data, "No PCI device found for VF%u\n", vf_id);
+			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
 			return;
 		}
 
 		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
-			set_fail_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
+			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
 			return;
 		}
 	}
@@ -773,7 +778,7 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 
 		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
 		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
-			set_fail_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
+			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
 			return;
 		}
 	}
-- 
2.31.1

