Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080BC54FDF
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 09:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC7110EE34;
	Thu, 30 Jul 2026 09:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISJl6Y/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE27310EE66
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785404328; x=1816940328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMWR4SlMa8eRdTiihbF4f4DT1xczL4BTIHHGj//vlP0=;
 b=ISJl6Y/98/vfZBRP0lmNWQtaicZfLOGq4JXOgJ6xY7noWQCgNEURxGl8
 YTKtEqsQjspW/wJh1CK9yiuM/gfrlY66sTwL91EUmAr3uDn+Ig1yVU6qc
 CWheGMeHkTxYGnrip9/s0LnT2RrQcsHlfZPBkF/WFVVXW0EhQtatvpre7
 +hzJEkHHcUH/2GnRXWyimmGNzC1axvtVbx9NPh87yb26HPf1J/IA0TBAo
 dSePp/7YtWOAzxLyA4ovMlKfykuChcLYt7G0tOXEP4zKmENGWU7gBSQM8
 mARdjnv6H+GSAXE8sw5ss24ndSRh2pVevJBcjRXqX76StmylXkxMfYMdA g==;
X-CSE-ConnectionGUID: RiTWMTrCS0SaB4V4BZZKPw==
X-CSE-MsgGUID: 8gE4D/dgQ0STlq5HiyhSqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85892998"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85892998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:48 -0700
X-CSE-ConnectionGUID: DXhgh9rVQsKGxAuN1lDAiA==
X-CSE-MsgGUID: 5zX6e4STSma+BwFpYhbvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="283605859"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:38:46 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH 2/2] tests/intel/xe_sriov_flr: Extend GGTT clearing checks
Date: Thu, 30 Jul 2026 11:38:07 +0200
Message-ID: <20260730093807.926456-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730093807.926456-1-lukasz.laguna@intel.com>
References: <20260730093807.926456-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
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

In addition to GPA clearing, verify that VFID and the page present bit
are correctly set after VF FLR.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_ggtt.c           | 15 +++++++++++++++
 lib/xe/xe_ggtt.h           |  9 +++++++++
 tests/intel/xe_sriov_flr.c | 21 +++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/lib/xe/xe_ggtt.c b/lib/xe/xe_ggtt.c
index 96b189b7a..8a98e9027 100644
--- a/lib/xe/xe_ggtt.c
+++ b/lib/xe/xe_ggtt.c
@@ -6,6 +6,14 @@
 #include "igt.h"
 #include "xe/xe_ggtt.h"
 
+xe_ggtt_pte_mask_t xe_ggtt_get_vfid_mask(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
+		GGTT_PTE_VFID_MASK : TGL_GGTT_PTE_VFID_MASK;
+}
+
 xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd)
 {
 	if (IS_TIGERLAKE(intel_get_drm_devid(pf_fd)))
@@ -14,6 +22,13 @@ xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd)
 	return GGTT_PTE_ADDR_MASK;
 }
 
+uint8_t xe_ggtt_pte_get_vfid(int pf_fd, xe_ggtt_pte_t pte)
+{
+	xe_ggtt_pte_mask_t mask = xe_ggtt_get_vfid_mask(pf_fd);
+
+	return (uint8_t)((pte & mask) >> GGTT_PTE_VFID_SHIFT);
+}
+
 uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte)
 {
 	xe_ggtt_pte_mask_t mask = xe_ggtt_get_gpa_mask(pf_fd);
diff --git a/lib/xe/xe_ggtt.h b/lib/xe/xe_ggtt.h
index 5e4038591..ada7ddbb0 100644
--- a/lib/xe/xe_ggtt.h
+++ b/lib/xe/xe_ggtt.h
@@ -12,10 +12,19 @@
 #define TGL_GGTT_PTE_ADDR_MASK		GENMASK_ULL(38, 12)
 #define   GGTT_PTE_ADDR_SHIFT		12
 
+#define GGTT_PTE_VFID_MASK		GENMASK_ULL(11, 2)
+#define TGL_GGTT_PTE_VFID_MASK		GENMASK_ULL(4, 2)
+#define   GGTT_PTE_VFID_SHIFT		2
+
+#define GGTT_PAGE_PRESENT		GENMASK_ULL(0, 0)
+
 typedef uint64_t xe_ggtt_pte_t;
 typedef uint64_t xe_ggtt_pte_mask_t;
 
+xe_ggtt_pte_mask_t xe_ggtt_get_vfid_mask(int pf_fd);
 xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd);
+
+uint8_t xe_ggtt_pte_get_vfid(int pf_fd, xe_ggtt_pte_t pte);
 uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte);
 
 #endif /* __XE_GGTT_H__ */
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 556979d7b..34a379586 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -709,6 +709,16 @@ static bool check_pte_gpa(int pf_fd, xe_ggtt_pte_t pte, uint8_t expected)
 	return (xe_ggtt_pte_get_gpa(pf_fd, pte) == expected);
 }
 
+static bool check_pte_vfid(int pf_fd, xe_ggtt_pte_t pte, uint8_t expected)
+{
+	return (xe_ggtt_pte_get_vfid(pf_fd, pte) == expected);
+}
+
+static bool check_pte_valid(int pf_fd, xe_ggtt_pte_t pte)
+{
+	return (pte & GGTT_PAGE_PRESENT);
+}
+
 static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 {
 	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
@@ -828,6 +838,17 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 			failed = true;
 		}
 
+		if (!check_pte_vfid(pf_fd, pte, vf_id)) {
+			igt_debug("Wrong GGTT VFID on VF%u after VF%u FLR\n", vf_id, flr_vf_id);
+			failed = true;
+		}
+
+		if (!check_pte_valid(pf_fd, pte)) {
+			igt_debug("GGTT page present bit not set on VF%u after VF%u FLR\n",
+				  vf_id, flr_vf_id);
+			failed = true;
+		}
+
 		if (failed) {
 			set_fail_reason(data,
 					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
-- 
2.43.0

