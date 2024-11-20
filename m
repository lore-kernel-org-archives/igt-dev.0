Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408B9D711D1
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250D10E162;
	Wed, 20 Nov 2024 17:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZeqxgXr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A9A10E162
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732124291; x=1763660291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rQMWho9C7+5sDIxhbHyKgJg984OzLYMDfSke1Hf/u1w=;
 b=RZeqxgXrYh4/Y1YjgwZgR13qM2memVLU09HTLD/U5GOAV10zHmR9i6xb
 01cLE0DoVa0wi01uzRC97bd2o8gfINPh4J5S4holYjumg5xObAPZPcFgg
 FkZ7adiQ+43MAdMk11qvTNUylLiNVPhmQvPdElQwTpOzdDjVnm71GlftE
 wwVWQYVioWUD3RhXRCzG184zzRiS9DNFFOraNroEHjrg6+slv7NBFiaQb
 i06vkmex1I51lEPHUaHjpjnub5rAIH2W0TKk42VF6zeNZ57G5sRqKAfVF
 vS5Qkfe936zoClAgK2jtap9kx42hr6OUl3DWOKXAMHJkvRJMZhVHLARpO A==;
X-CSE-ConnectionGUID: QFB8Z2rYTsiPidp7R1YV7Q==
X-CSE-MsgGUID: nR49gn2GTA+vKSgfwN3xJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35058724"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="35058724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:11 -0800
X-CSE-ConnectionGUID: jt9K646+SxKFKf1Xhh4P6Q==
X-CSE-MsgGUID: Lw/+L6BISpyPm0wEdvuJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90395697"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:07 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/3] lib/xe/xe_sriov_provisioning: Refactor range
 handling and logging
Date: Wed, 20 Nov 2024 18:37:48 +0100
Message-Id: <20241120173749.348843-3-marcin.bernatowicz@linux.intel.com>
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

Introduce an append_range helper to reduce code duplication in handling
provisioned PTE ranges. Limit debug logs to the first 70 entries for
clarity and improved reasoning. Enhance error handling by propagating
realloc failures.

v2: Update range-checking logic to iterate only within valid PTE offsets
    based on MAX_WOPCM_SIZE and GUC_GGTT_TOP.

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
 lib/xe/xe_sriov_provisioning.c | 78 +++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 7cde2c240..8e2ec41e1 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -3,7 +3,7 @@
  * Copyright(c) 2024 Intel Corporation. All rights reserved.
  */
 
-#include <stdlib.h>
+#include <errno.h>
 
 #include "igt_core.h"
 #include "intel_chipset.h"
@@ -39,6 +39,10 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
 #define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
 #define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
 #define GGTT_PTE_VFID_SHIFT			2
+#define GUC_GGTT_TOP				0xFEE00000
+#define MAX_WOPCM_SIZE				SZ_8M
+#define START_PTE_OFFSET			(MAX_WOPCM_SIZE / SZ_4K * sizeof(xe_ggtt_pte_t))
+#define MAX_PTE_OFFSET				(GUC_GGTT_TOP / SZ_4K * sizeof(xe_ggtt_pte_t))
 
 static uint64_t get_vfid_mask(int fd)
 {
@@ -48,6 +52,37 @@ static uint64_t get_vfid_mask(int fd)
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
+#define MAX_DEBUG_ENTRIES 70
+
+static int append_range(struct xe_sriov_provisioned_range **ranges,
+			unsigned int *nr_ranges, unsigned int vf_id,
+			uint32_t start, uint32_t end)
+{
+	struct xe_sriov_provisioned_range *new_ranges;
+
+	new_ranges = realloc(*ranges,
+			     (*nr_ranges + 1) * sizeof(struct xe_sriov_provisioned_range));
+	if (!new_ranges) {
+		free(*ranges);
+		*ranges = NULL;
+		*nr_ranges = 0;
+		return -ENOMEM;
+	}
+
+	*ranges = new_ranges;
+	if (*nr_ranges < MAX_DEBUG_ENTRIES)
+		igt_debug("Found VF%u GGTT range [%#x-%#x] num_ptes=%ld\n",
+			  vf_id, start, end,
+			  (end - start + sizeof(xe_ggtt_pte_t)) /
+			  sizeof(xe_ggtt_pte_t));
+	(*ranges)[*nr_ranges].vf_id = vf_id;
+	(*ranges)[*nr_ranges].start = start;
+	(*ranges)[*nr_ranges].end = end;
+	(*nr_ranges)++;
+
+	return 0;
+}
+
 /**
  * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
  * @pf_fd: File descriptor for the Physical Function
@@ -76,28 +111,23 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	uint32_t current_start = 0;
 	uint32_t current_end = 0;
 	xe_ggtt_pte_t pte;
+	int ret;
 
 	*ranges = NULL;
 	*nr_ranges = 0;
 
-	for (uint32_t offset = 0; offset < SZ_8M; offset += sizeof(xe_ggtt_pte_t)) {
+	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
+	     offset += sizeof(xe_ggtt_pte_t)) {
 		pte = xe_mmio_ggtt_read(mmio, gt, offset);
 		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
 
 		if (vf_id != current_vf_id) {
 			if (current_vf_id != -1) {
-				/* End the current range */
-				*ranges = realloc(*ranges, (*nr_ranges + 1) *
-						  sizeof(struct xe_sriov_provisioned_range));
-				igt_assert(*ranges);
-				igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
-					  current_vf_id, current_start, current_end,
-					  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
-					  sizeof(xe_ggtt_pte_t));
-				(*ranges)[*nr_ranges].vf_id = current_vf_id;
-				(*ranges)[*nr_ranges].start = current_start;
-				(*ranges)[*nr_ranges].end = current_end;
-				(*nr_ranges)++;
+				/* End the current range and append it */
+				ret = append_range(ranges, nr_ranges, current_vf_id,
+						   current_start, current_end);
+				if (ret < 0)
+					return ret;
 			}
 			/* Start a new range */
 			current_vf_id = vf_id;
@@ -107,18 +137,16 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	}
 
 	if (current_vf_id != -1) {
-		*ranges = realloc(*ranges, (*nr_ranges + 1) *
-				  sizeof(struct xe_sriov_provisioned_range));
-		igt_assert(*ranges);
-		igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
-			  current_vf_id, current_start, current_end,
-			  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
-			  sizeof(xe_ggtt_pte_t));
-		(*ranges)[*nr_ranges].vf_id = current_vf_id;
-		(*ranges)[*nr_ranges].start = current_start;
-		(*ranges)[*nr_ranges].end = current_end;
-		(*nr_ranges)++;
+		/* Append the last range */
+		ret = append_range(ranges, nr_ranges, current_vf_id,
+				   current_start, current_end);
+		if (ret < 0)
+			return ret;
 	}
 
+	if (*nr_ranges > MAX_DEBUG_ENTRIES)
+		igt_debug("Ranges output trimmed to first %u entries out of %u",
+			  MAX_DEBUG_ENTRIES, *nr_ranges);
+
 	return 0;
 }
-- 
2.31.1

