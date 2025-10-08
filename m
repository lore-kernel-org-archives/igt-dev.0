Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E8CCD184
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102F310E8DC;
	Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1JcnkWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E90510E8D9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957361; x=1791493361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6p+/KoimQUxSdtkkJ609lrpvF0/CBNobZ3fAOL7C0g=;
 b=V1JcnkWMeP6i3RYyWOINhJPgOnOFwNRB+xHeb41gsnQYP5YmeR8caRsH
 I0APzjFgAPlY/+x5vH79ZstXhl4ckhKYncpH/TvKLtt7Y/E3lha84uP+e
 XHxt4daK81SPsQDl1wYroaU1NPspMRz3ZmWPM47HEemAWi3slnONNoeBA
 AHbhPuiGC4/7dNoYPmFu9Xv5rwLzu7C/n4dYM4yRIU1DPYitxqh1TyL8Y
 4SoBg/x8Cbz2BGpfDyf4jjAvc4sxT4h/1ulnC9srSA0UmQPBa1dgJiGhc
 Ywgu/iMhs4gTdjijOakoVWM+kXt9QkB81TziFCUCbcDjsZmnaM9mLlHFg w==;
X-CSE-ConnectionGUID: euKKeGi0S0GbSALWHHX5HQ==
X-CSE-MsgGUID: SETXDsDTQPuxZ8cyXhkG3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61867750"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61867750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:02:40 -0700
X-CSE-ConnectionGUID: ax/UXuttTi2XdhiMgbjP1w==
X-CSE-MsgGUID: SXS2+8l9Sry2SOsGp0/RIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184920010"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2025 14:02:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 2/6] lib/xe: Use new APIs for xe device info queries
Date: Wed,  8 Oct 2025 21:02:32 +0000
Message-ID: <20251008210236.396859-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008210236.396859-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
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

Update xe library to use new runtime query APIs:
- Replace intel_gen(intel_get_drm_devid(fd)) with intel_query_gen(fd)
- Replace intel_get_device_info(device_id) with intel_query_device_info(fd)
- Replace intel_graphics_ver(device_id) with intel_query_graphics_ver(fd)

These changes enable runtime device capability queries for xe devices
instead of relying on static device ID lookups.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/xe/xe_legacy.c             | 2 +-
 lib/xe/xe_oa.c                 | 4 ++--
 lib/xe/xe_sriov_provisioning.c | 4 +---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..8e17ecff4 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -75,7 +75,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	if (flags & COMPRESSION)
-		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
+		igt_require(intel_query_gen(fd) >= 20);
 
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 428e7d0a2..a7fbf413a 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -447,7 +447,7 @@ static void query_hwconfig(int fd, struct intel_xe_topology_info *topinfo)
 struct intel_xe_topology_info *
 xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 {
-	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
+	const struct intel_device_info *devinfo = intel_query_device_info(drm_fd);
 	struct intel_xe_topology_info topinfo = {};
 	struct intel_xe_topology_info *ptopo;
 	struct drm_xe_query_topology_mask *xe_topo;
@@ -461,7 +461,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	};
 
 	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
-	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
+	if (intel_query_graphics_ver(drm_fd) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
 		query_hwconfig(drm_fd, &topinfo);
 	} else {
 		topinfo.max_slices = 1;
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 2a02f7cc8..fba79eddb 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -50,9 +50,7 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
 
 static uint64_t get_vfid_mask(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
-
-	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
+	return (intel_query_graphics_ver(fd) >= IP_VER(12, 50)) ?
 		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
 }
 
-- 
2.43.0

