Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC9ED44177
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 15:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34FD10E676;
	Tue, 19 Nov 2024 15:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElRIVZ1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615E110E672
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732031768; x=1763567768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TopQZHW7rKiXkShp9wsVriCUNZmsNM1dx60+8TBkVV4=;
 b=ElRIVZ1jBKsvTPLv8PEfXkzx8s8D0xLAY7PUki9HVVLTRWZ0gxxFpVVd
 I8cbHr8iEe/K+KB8Sm/+oPuTQm2hcAbsaoR9I8F+Kl/lhJhfIsvNXbGMr
 Za9VLwsoXOdOLGKxYczSSOw7JoYBR/0bM6OVLW/Dr9SUokE1uHkah4keb
 UGhjsA3ViJtKlzzA1E6IO2u4HkO9oscuuk1Y18RdKypH9b0Auf3MfySqz
 Nz3rZ9glOoXNLZ8lSsKmzp2DuEUgYgn/cPRS4+2BHVhIjhcGqbKQvK/9c
 avyLmqqutSW/HFwtXOwdVjW7BOXUsETJ98HqK0ElqiwVeGZIO1xeg1cBF A==;
X-CSE-ConnectionGUID: urQVmQNdQImVYcwRbi1M4A==
X-CSE-MsgGUID: GrMO7/cjSnyS/VIdtWfKUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57448893"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="57448893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:56:03 -0800
X-CSE-ConnectionGUID: 8ntwHrezSjuu4GgnZ4O/TQ==
X-CSE-MsgGUID: lYdX2GaZSmOF24L801CgEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127126977"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 07:55:59 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe/xe_sriov_provisioning: Refactor range
 handling and logging
Date: Tue, 19 Nov 2024 16:55:37 +0100
Message-Id: <20241119155538.605000-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
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
 lib/xe/xe_sriov_provisioning.c | 71 ++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 7cde2c240..66c0576aa 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -3,7 +3,7 @@
  * Copyright(c) 2024 Intel Corporation. All rights reserved.
  */
 
-#include <stdlib.h>
+#include <errno.h>
 
 #include "igt_core.h"
 #include "intel_chipset.h"
@@ -48,6 +48,37 @@ static uint64_t get_vfid_mask(int fd)
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
@@ -76,6 +107,7 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	uint32_t current_start = 0;
 	uint32_t current_end = 0;
 	xe_ggtt_pte_t pte;
+	int ret;
 
 	*ranges = NULL;
 	*nr_ranges = 0;
@@ -86,18 +118,11 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
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
@@ -107,18 +132,16 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
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

