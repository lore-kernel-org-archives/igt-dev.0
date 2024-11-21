Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1F8D78765
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 14:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB9D10E970;
	Thu, 21 Nov 2024 14:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kA8u9tHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677C10E970
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732198767; x=1763734767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNfDPXO7+kqgeel/NXu9uCFWx4mnMpU5pWZnLNJvtLc=;
 b=kA8u9tHEkXKwdewh+vLbSa1u/710LWN+AbGraB1khIFqfYKos908K5Cz
 PL+rRpaL69tv2ICC+5UFIMirkBlrlA53E/0LYT50GhATW0Q4Wla+OD0uB
 UX0S7FACRXKvNtZ9aBKK3TW3nwfHdtbYi3ctxcfAen6hTs1VBX3CyC4Vb
 +bbzTRFs4XdQg68QJKtV9HKSRWk2fRTacKuAapPgRRTsOMpr2QlzJ7xjh
 dVFVsWjAXNjxa3GS6VIvgJWn/G99Us+MIf8tcgEalcjuDACxXZu3xzKcQ
 0etDLv99WNO6hN9TSBP4o83aDdvOAN9vUrrQz+UydNSoVSBVkN2h1IIap w==;
X-CSE-ConnectionGUID: 0b2xQ2C2Sh+FViFiz4BcPQ==
X-CSE-MsgGUID: kDI95VUbSSWxPftZa4SVPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32449656"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32449656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:19:27 -0800
X-CSE-ConnectionGUID: Bbrhc+ymQQqrcbJxaZUmEQ==
X-CSE-MsgGUID: kNOsyyGtTjmhPo+lHBV+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="127788864"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.98.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:19:23 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 4/4] lib/xe/xe_sriov_provisioning: Iterate only
 within valid PTE offsets
Date: Thu, 21 Nov 2024 15:18:51 +0100
Message-Id: <20241121141851.631877-5-marcin.bernatowicz@linux.intel.com>
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

Update range-checking logic to iterate only within valid PTE offsets
based on MAX_WOPCM_SIZE and GUC_GGTT_TOP.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3507
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
 lib/xe/xe_sriov_provisioning.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index d448a53d8..67ae9cf54 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
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
@@ -112,7 +116,8 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 	*ranges = NULL;
 	*nr_ranges = 0;
 
-	for (uint32_t offset = 0; offset < SZ_8M; offset += sizeof(xe_ggtt_pte_t)) {
+	for (uint32_t offset = START_PTE_OFFSET; offset < MAX_PTE_OFFSET;
+	     offset += sizeof(xe_ggtt_pte_t)) {
 		pte = xe_mmio_ggtt_read(mmio, gt, offset);
 		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
 
-- 
2.31.1

