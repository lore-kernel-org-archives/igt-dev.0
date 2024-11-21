Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F955D78765
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DBE10E974;
	Thu, 21 Nov 2024 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig2ZvCmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DEC10E974
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198760; x=1763734760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6qU1Jh/neQ0Mj9Z2p8l7Nvaw18fLHvmlLdtfcmgEck=;
 b=Ig2ZvCmUGCMjTsCjrOhRMIgBQJnZ3PFW4cNraHN0mwxtgH6nGVTVKJQE
 swboWAwAJ6/RXFSqBQ+w2jxcJoDDxsdrILzByJl77GiRIsJ4/HM12UBO8
 rztjdnGSk25NbAwz03F7SzRg7Cjlc4NaEVsimgU3Cm2NayOVDw78mLXTG
 xv0TJQJ3Tm3OWau12YBwbaj4KWHv17oJkohFWXXo8Yjlrma+kUnH9C5Ot
 MNlPpijBOK8bjo8gxdtTRMuEs3UZ1+ax4hVLM3fWzj1sRjj/mZrhXY9rI
 f86eiF3ibRKic3dhVT2jdYbrqBo86HXllnyGHho3VuCvCM1qe2xqo4YQ6 Q==;
X-CSE-ConnectionGUID: FCTT8evHQU6jhvJNW1mt4A==
X-CSE-MsgGUID: 1c8qHuDwSzeY0rZgaxTkOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32449637"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32449637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:19:19 -0800
X-CSE-ConnectionGUID: cFSyIg27QdaeDuynuwbsBQ==
X-CSE-MsgGUID: Y1sbFnOoTgqt3LzFJgFANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="127788813"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.98.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:19:16 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 3/4] tests/xe/xe_sriov_flr: Use SKIP for unmet
 subcheck prerequisites
Date: Thu, 21 Nov 2024 15:18:50 +0100
Message-Id: <20241121141851.631877-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
References: <20241121141851.631877-1-marcin.bernatowicz@linux.intel.com>
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

