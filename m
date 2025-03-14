Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2337C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 10:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B95A10E9C1;
	Fri, 14 Mar 2025 10:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFZ7pigV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355E910E9C1
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741949827; x=1773485827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sFzDVhMsR9cjoELlt76R13LF52odi01A06gvyKG57Cw=;
 b=jFZ7pigVg+T00EoLp/rA4RDxr3KzYJtZ6G1WXBJvNjodcueKQI8vx9TY
 GXKjb8mtNiPsXaiIr1TbgrE+aQbwrUBeYuSltnr8vSt7D7sQe75nwGM2p
 CDk5gltvjHJdla1UxW3RN7+AvEGIjDQ6cDiFmS3JhHFQjAJ2M4fQcHs9I
 eO/jCFxAYspeVBJIW0YuTHb9p3JpssyEUAGjeWJpLpR/I/VsVXq+nraIN
 vkTcY0U7QblALVl+tyXO/aVT16eOSY3M2us5w2GtRpE6O1PcouIjTIyDV
 zOS0zsJLRJox8nYS0a36bABX1e90i8DlJxmSmPhbfhbREP+lzxpQD/gxZ w==;
X-CSE-ConnectionGUID: U8ME2Q3dSbiyIcFa5HmDlg==
X-CSE-MsgGUID: Ldk9JvnTR5GItMrUAGIubw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54467583"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="54467583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:57:07 -0700
X-CSE-ConnectionGUID: YpFqvqbaTCKhsuJg6actmA==
X-CSE-MsgGUID: c0pWAxPGRyOkB+PrePi2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="120959414"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.175])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 03:57:05 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Add test for
 xe_hw_engine_class_sysfs
Date: Fri, 14 Mar 2025 11:56:57 +0100
Message-ID: <20250314105657.637898-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Test-with: https://lore.kernel.org/intel-xe/20250314105050.636983-1-francois.dugast@intel.com/
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 6307e0277..09b85afb4 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -158,19 +158,20 @@ static void set_retval(const char function_name[], long long retval)
  * Functionality: fault
  *
  * arg[1]:
- * @wait_for_lmem_ready:	wait_for_lmem_ready
- * @xe_device_create:		xe_device_create
- * @xe_ggtt_init_early:		xe_ggtt_init_early
- * @xe_guc_ads_init:		xe_guc_ads_init
- * @xe_guc_ct_init:		xe_guc_ct_init
- * @xe_guc_log_init:		xe_guc_log_init
- * @xe_guc_relay_init:		xe_guc_relay_init
- * @xe_pm_init_early:		xe_pm_init_early
- * @xe_sriov_init:		xe_sriov_init
- * @xe_tile_init_early:		xe_tile_init_early
- * @xe_uc_fw_init:		xe_uc_fw_init
- * @xe_wa_init:			xe_wa_init
- * @xe_wopcm_init:		xe_wopcm_init
+ * @wait_for_lmem_ready:		wait_for_lmem_ready
+ * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
+ * @xe_device_create:			xe_device_create
+ * @xe_ggtt_init_early:			xe_ggtt_init_early
+ * @xe_guc_ads_init:			xe_guc_ads_init
+ * @xe_guc_ct_init:			xe_guc_ct_init
+ * @xe_guc_log_init:			xe_guc_log_init
+ * @xe_guc_relay_init:			xe_guc_relay_init
+ * @xe_pm_init_early:			xe_pm_init_early
+ * @xe_sriov_init:			xe_sriov_init
+ * @xe_tile_init_early:			xe_tile_init_early
+ * @xe_uc_fw_init:			xe_uc_fw_init
+ * @xe_wa_init:				xe_wa_init
+ * @xe_wopcm_init:			xe_wopcm_init
  */
 static void
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
@@ -324,6 +325,7 @@ igt_main
 		unsigned int flags;
 	} probe_fail_functions[] = {
 		{ "wait_for_lmem_ready" },
+		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
 		{ "xe_ggtt_init_early" },
 		{ "xe_guc_ads_init" },
-- 
2.43.0

