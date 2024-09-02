Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09994CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 13:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB7D10E2EF;
	Mon,  2 Sep 2024 13:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6m8nw7b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911BA10E2EF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725284969; x=1756820969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SLod/gKGZkoUtv0Y9aXTVtlvnFUcGKbgMxTl/4Ptyvs=;
 b=m6m8nw7bVOggbBwLVlMgwu7EmRkQ7hdEPS0pNamp89Rqbn66WV0WHyLq
 ycHzjB7MeCHhx/9gPr0lNi6npnsQOnmh9BBdvBEp7/yd2ml+RFaAzTz7k
 l0EdH0H0rydOBJd+2Wkpa0c+Lnf/OlhLCKhgCrv0dFeP5J2oYLwuagfek
 W7HTFRFAd+7JOJ5m63HKeVVVhWsesFkyPTHj66tp37CHMo5hoCpMO0XX3
 ii1nfpzHGEh7kKKbf0jvjdIzx5dtroI6veyZzOiuiixoW86TiRqEHMS9K
 B7/1bzdKk0vrDnTzjP+y0BbR1j63vAnzCKFxLfiGjJ4qBtK8aIJwuHZ1w w==;
X-CSE-ConnectionGUID: FCgFdVVxTEGViZvbSe8aGw==
X-CSE-MsgGUID: /UyFAi32Seudsf/hNO9wEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23382913"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23382913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:49:28 -0700
X-CSE-ConnectionGUID: e60pkNQNRva/GKMSEu72Ig==
X-CSE-MsgGUID: JCYBwLK4Q2+jsgb1lCon/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68997804"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:49:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 2/2] lib/intel_device_info: use dedicated macro for
 struct pci_id_match init
Date: Mon,  2 Sep 2024 16:49:07 +0300
Message-Id: <20240902134907.2186238-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902134907.2186238-1-jani.nikula@intel.com>
References: <20240902134907.2186238-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Now that we can pass our own macros to the INTEL_*_IDS() and XE_*_IDS()
macros, define a new macro INTEL_PCI_ID_INIT() for struct pci_id_match
initialization with designated initializers.

INTEL_VGA_DEVICE() is aimed at initializing kernel struct pci_device_id,
and it's mostly just a coincidence that it can be used to initialize
struct pci_id_match. Indeed, the member names are different, and the IGT
usage has prevented the kernel from switching to designated
initializers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/intel_device_info.c | 165 +++++++++++++++++++++-------------------
 1 file changed, 87 insertions(+), 78 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 01e7ba286311..2a118eda66c4 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -527,117 +527,126 @@ static const struct intel_device_info intel_battlemage_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+#define INTEL_PCI_ID_INIT(_id, _info) { \
+	.vendor_id = 0x8086, .device_id = (_id), \
+	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
+	.device_class = 0x03 << 16, .device_class_mask = 0xff << 16, \
+	.match_data = (intptr_t)(_info), \
+}
+
 static const struct pci_id_match intel_device_match[] = {
-	INTEL_I810_IDS(INTEL_VGA_DEVICE, &intel_i810_info),
-	INTEL_I815_IDS(INTEL_VGA_DEVICE, &intel_i815_info),
+	INTEL_I810_IDS(INTEL_PCI_ID_INIT, &intel_i810_info),
+	INTEL_I815_IDS(INTEL_PCI_ID_INIT, &intel_i815_info),
 
-	INTEL_I830_IDS(INTEL_VGA_DEVICE, &intel_i830_info),
-	INTEL_I845G_IDS(INTEL_VGA_DEVICE, &intel_i845_info),
-	INTEL_I85X_IDS(INTEL_VGA_DEVICE, &intel_i855_info),
-	INTEL_I865G_IDS(INTEL_VGA_DEVICE, &intel_i865_info),
+	INTEL_I830_IDS(INTEL_PCI_ID_INIT, &intel_i830_info),
+	INTEL_I845G_IDS(INTEL_PCI_ID_INIT, &intel_i845_info),
+	INTEL_I85X_IDS(INTEL_PCI_ID_INIT, &intel_i855_info),
+	INTEL_I865G_IDS(INTEL_PCI_ID_INIT, &intel_i865_info),
 
-	INTEL_I915G_IDS(INTEL_VGA_DEVICE, &intel_i915_info),
-	INTEL_I915GM_IDS(INTEL_VGA_DEVICE, &intel_i915m_info),
-	INTEL_I945G_IDS(INTEL_VGA_DEVICE, &intel_i945_info),
-	INTEL_I945GM_IDS(INTEL_VGA_DEVICE, &intel_i945m_info),
+	INTEL_I915G_IDS(INTEL_PCI_ID_INIT, &intel_i915_info),
+	INTEL_I915GM_IDS(INTEL_PCI_ID_INIT, &intel_i915m_info),
+	INTEL_I945G_IDS(INTEL_PCI_ID_INIT, &intel_i945_info),
+	INTEL_I945GM_IDS(INTEL_PCI_ID_INIT, &intel_i945m_info),
 
-	INTEL_G33_IDS(INTEL_VGA_DEVICE, &intel_g33_info),
-	INTEL_PNV_G_IDS(INTEL_VGA_DEVICE, &intel_pineview_g_info),
-	INTEL_PNV_M_IDS(INTEL_VGA_DEVICE, &intel_pineview_m_info),
+	INTEL_G33_IDS(INTEL_PCI_ID_INIT, &intel_g33_info),
+	INTEL_PNV_G_IDS(INTEL_PCI_ID_INIT, &intel_pineview_g_info),
+	INTEL_PNV_M_IDS(INTEL_PCI_ID_INIT, &intel_pineview_m_info),
 
-	INTEL_I965G_IDS(INTEL_VGA_DEVICE, &intel_i965_info),
-	INTEL_I965GM_IDS(INTEL_VGA_DEVICE, &intel_i965m_info),
+	INTEL_I965G_IDS(INTEL_PCI_ID_INIT, &intel_i965_info),
+	INTEL_I965GM_IDS(INTEL_PCI_ID_INIT, &intel_i965m_info),
 
-	INTEL_G45_IDS(INTEL_VGA_DEVICE, &intel_g45_info),
-	INTEL_GM45_IDS(INTEL_VGA_DEVICE, &intel_gm45_info),
+	INTEL_G45_IDS(INTEL_PCI_ID_INIT, &intel_g45_info),
+	INTEL_GM45_IDS(INTEL_PCI_ID_INIT, &intel_gm45_info),
 
-	INTEL_ILK_D_IDS(INTEL_VGA_DEVICE, &intel_ironlake_info),
-	INTEL_ILK_M_IDS(INTEL_VGA_DEVICE, &intel_ironlake_m_info),
+	INTEL_ILK_D_IDS(INTEL_PCI_ID_INIT, &intel_ironlake_info),
+	INTEL_ILK_M_IDS(INTEL_PCI_ID_INIT, &intel_ironlake_m_info),
 
-	INTEL_SNB_D_IDS(INTEL_VGA_DEVICE, &intel_sandybridge_info),
-	INTEL_SNB_M_IDS(INTEL_VGA_DEVICE, &intel_sandybridge_m_info),
+	INTEL_SNB_D_IDS(INTEL_PCI_ID_INIT, &intel_sandybridge_info),
+	INTEL_SNB_M_IDS(INTEL_PCI_ID_INIT, &intel_sandybridge_m_info),
 
-	INTEL_IVB_D_IDS(INTEL_VGA_DEVICE, &intel_ivybridge_info),
-	INTEL_IVB_M_IDS(INTEL_VGA_DEVICE, &intel_ivybridge_m_info),
+	INTEL_IVB_D_IDS(INTEL_PCI_ID_INIT, &intel_ivybridge_info),
+	INTEL_IVB_M_IDS(INTEL_PCI_ID_INIT, &intel_ivybridge_m_info),
 
-	INTEL_HSW_GT1_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt1_info),
-	INTEL_HSW_GT2_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt2_info),
-	INTEL_HSW_GT3_IDS(INTEL_VGA_DEVICE, &intel_haswell_gt3_info),
+	INTEL_HSW_GT1_IDS(INTEL_PCI_ID_INIT, &intel_haswell_gt1_info),
+	INTEL_HSW_GT2_IDS(INTEL_PCI_ID_INIT, &intel_haswell_gt2_info),
+	INTEL_HSW_GT3_IDS(INTEL_PCI_ID_INIT, &intel_haswell_gt3_info),
 
-	INTEL_VLV_IDS(INTEL_VGA_DEVICE, &intel_valleyview_info),
+	INTEL_VLV_IDS(INTEL_PCI_ID_INIT, &intel_valleyview_info),
 
-	INTEL_BDW_GT1_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt1_info),
-	INTEL_BDW_GT2_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt2_info),
-	INTEL_BDW_GT3_IDS(INTEL_VGA_DEVICE, &intel_broadwell_gt3_info),
-	INTEL_BDW_RSVD_IDS(INTEL_VGA_DEVICE, &intel_broadwell_unknown_info),
+	INTEL_BDW_GT1_IDS(INTEL_PCI_ID_INIT, &intel_broadwell_gt1_info),
+	INTEL_BDW_GT2_IDS(INTEL_PCI_ID_INIT, &intel_broadwell_gt2_info),
+	INTEL_BDW_GT3_IDS(INTEL_PCI_ID_INIT, &intel_broadwell_gt3_info),
+	INTEL_BDW_RSVD_IDS(INTEL_PCI_ID_INIT, &intel_broadwell_unknown_info),
 
-	INTEL_CHV_IDS(INTEL_VGA_DEVICE, &intel_cherryview_info),
+	INTEL_CHV_IDS(INTEL_PCI_ID_INIT, &intel_cherryview_info),
 
-	INTEL_SKL_GT1_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt1_info),
-	INTEL_SKL_GT2_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt2_info),
-	INTEL_SKL_GT3_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt3_info),
-	INTEL_SKL_GT4_IDS(INTEL_VGA_DEVICE, &intel_skylake_gt4_info),
+	INTEL_SKL_GT1_IDS(INTEL_PCI_ID_INIT, &intel_skylake_gt1_info),
+	INTEL_SKL_GT2_IDS(INTEL_PCI_ID_INIT, &intel_skylake_gt2_info),
+	INTEL_SKL_GT3_IDS(INTEL_PCI_ID_INIT, &intel_skylake_gt3_info),
+	INTEL_SKL_GT4_IDS(INTEL_PCI_ID_INIT, &intel_skylake_gt4_info),
 
-	INTEL_BXT_IDS(INTEL_VGA_DEVICE, &intel_broxton_info),
+	INTEL_BXT_IDS(INTEL_PCI_ID_INIT, &intel_broxton_info),
 
-	INTEL_KBL_GT1_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt1_info),
-	INTEL_KBL_GT2_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt2_info),
-	INTEL_KBL_GT3_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt3_info),
-	INTEL_KBL_GT4_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt4_info),
-	INTEL_AML_KBL_GT2_IDS(INTEL_VGA_DEVICE, &intel_kabylake_gt2_info),
+	INTEL_KBL_GT1_IDS(INTEL_PCI_ID_INIT, &intel_kabylake_gt1_info),
+	INTEL_KBL_GT2_IDS(INTEL_PCI_ID_INIT, &intel_kabylake_gt2_info),
+	INTEL_KBL_GT3_IDS(INTEL_PCI_ID_INIT, &intel_kabylake_gt3_info),
+	INTEL_KBL_GT4_IDS(INTEL_PCI_ID_INIT, &intel_kabylake_gt4_info),
+	INTEL_AML_KBL_GT2_IDS(INTEL_PCI_ID_INIT, &intel_kabylake_gt2_info),
 
-	INTEL_GLK_IDS(INTEL_VGA_DEVICE, &intel_geminilake_info),
+	INTEL_GLK_IDS(INTEL_PCI_ID_INIT, &intel_geminilake_info),
 
-	INTEL_CFL_S_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
-	INTEL_CFL_S_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
-	INTEL_CFL_H_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
-	INTEL_CFL_H_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
-	INTEL_CFL_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
-	INTEL_CFL_U_GT3_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt3_info),
-	INTEL_WHL_U_GT1_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt1_info),
-	INTEL_WHL_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
-	INTEL_WHL_U_GT3_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt3_info),
-	INTEL_AML_CFL_GT2_IDS(INTEL_VGA_DEVICE, &intel_coffeelake_gt2_info),
+	INTEL_CFL_S_GT1_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt1_info),
+	INTEL_CFL_S_GT2_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt2_info),
+	INTEL_CFL_H_GT1_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt1_info),
+	INTEL_CFL_H_GT2_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt2_info),
+	INTEL_CFL_U_GT2_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt2_info),
+	INTEL_CFL_U_GT3_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt3_info),
+	INTEL_WHL_U_GT1_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt1_info),
+	INTEL_WHL_U_GT2_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt2_info),
+	INTEL_WHL_U_GT3_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt3_info),
+	INTEL_AML_CFL_GT2_IDS(INTEL_PCI_ID_INIT, &intel_coffeelake_gt2_info),
 
-	INTEL_CML_GT1_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt1_info),
-	INTEL_CML_GT2_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt2_info),
-	INTEL_CML_U_GT1_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt1_info),
-	INTEL_CML_U_GT2_IDS(INTEL_VGA_DEVICE, &intel_cometlake_gt2_info),
+	INTEL_CML_GT1_IDS(INTEL_PCI_ID_INIT, &intel_cometlake_gt1_info),
+	INTEL_CML_GT2_IDS(INTEL_PCI_ID_INIT, &intel_cometlake_gt2_info),
+	INTEL_CML_U_GT1_IDS(INTEL_PCI_ID_INIT, &intel_cometlake_gt1_info),
+	INTEL_CML_U_GT2_IDS(INTEL_PCI_ID_INIT, &intel_cometlake_gt2_info),
 
-	INTEL_CNL_IDS(INTEL_VGA_DEVICE, &intel_cannonlake_info),
+	INTEL_CNL_IDS(INTEL_PCI_ID_INIT, &intel_cannonlake_info),
 
-	INTEL_ICL_IDS(INTEL_VGA_DEVICE, &intel_icelake_info),
+	INTEL_ICL_IDS(INTEL_PCI_ID_INIT, &intel_icelake_info),
 
-	INTEL_EHL_IDS(INTEL_VGA_DEVICE, &intel_elkhartlake_info),
-	INTEL_JSL_IDS(INTEL_VGA_DEVICE, &intel_jasperlake_info),
+	INTEL_EHL_IDS(INTEL_PCI_ID_INIT, &intel_elkhartlake_info),
+	INTEL_JSL_IDS(INTEL_PCI_ID_INIT, &intel_jasperlake_info),
 
-	INTEL_TGL_GT1_IDS(INTEL_VGA_DEVICE, &intel_tigerlake_gt1_info),
-	INTEL_TGL_GT2_IDS(INTEL_VGA_DEVICE, &intel_tigerlake_gt2_info),
-	INTEL_RKL_IDS(INTEL_VGA_DEVICE, &intel_rocketlake_info),
+	INTEL_TGL_GT1_IDS(INTEL_PCI_ID_INIT, &intel_tigerlake_gt1_info),
+	INTEL_TGL_GT2_IDS(INTEL_PCI_ID_INIT, &intel_tigerlake_gt2_info),
+	INTEL_RKL_IDS(INTEL_PCI_ID_INIT, &intel_rocketlake_info),
 
-	INTEL_DG1_IDS(INTEL_VGA_DEVICE, &intel_dg1_info),
-	INTEL_DG2_IDS(INTEL_VGA_DEVICE, &intel_dg2_info),
+	INTEL_DG1_IDS(INTEL_PCI_ID_INIT, &intel_dg1_info),
+	INTEL_DG2_IDS(INTEL_PCI_ID_INIT, &intel_dg2_info),
 
-	INTEL_ADLS_IDS(INTEL_VGA_DEVICE, &intel_alderlake_s_info),
-	INTEL_RPLS_IDS(INTEL_VGA_DEVICE, &intel_raptorlake_s_info),
-	INTEL_ADLP_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
-	INTEL_RPLU_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
-	INTEL_RPLP_IDS(INTEL_VGA_DEVICE, &intel_alderlake_p_info),
-	INTEL_ADLN_IDS(INTEL_VGA_DEVICE, &intel_alderlake_n_info),
+	INTEL_ADLS_IDS(INTEL_PCI_ID_INIT, &intel_alderlake_s_info),
+	INTEL_RPLS_IDS(INTEL_PCI_ID_INIT, &intel_raptorlake_s_info),
+	INTEL_ADLP_IDS(INTEL_PCI_ID_INIT, &intel_alderlake_p_info),
+	INTEL_RPLU_IDS(INTEL_PCI_ID_INIT, &intel_alderlake_p_info),
+	INTEL_RPLP_IDS(INTEL_PCI_ID_INIT, &intel_alderlake_p_info),
+	INTEL_ADLN_IDS(INTEL_PCI_ID_INIT, &intel_alderlake_n_info),
 
-	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &intel_ats_m_info),
+	INTEL_ATS_M_IDS(INTEL_PCI_ID_INIT, &intel_ats_m_info),
 
-	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
+	INTEL_MTL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
 
-	INTEL_PVC_IDS(INTEL_VGA_DEVICE, &intel_pontevecchio_info),
+	INTEL_PVC_IDS(INTEL_PCI_ID_INIT, &intel_pontevecchio_info),
 
-	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
+	XE_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
 
-	XE_BMG_IDS(INTEL_VGA_DEVICE, &intel_battlemage_info),
+	XE_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
 
-	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
+	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
+#undef INTEL_PCI_ID_INIT
+
 /**
  * intel_get_device_info:
  * @devid: pci device id
-- 
2.39.2

