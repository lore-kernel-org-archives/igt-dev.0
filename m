Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0571CC28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 18:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD08510E25B;
	Tue, 11 Mar 2025 18:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdSAIjUd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C1A10E25B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741718329; x=1773254329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/v1QrSnhhp2Bhm7Xjwvh+sz7Xl/zuxHj630Yv5yx7kk=;
 b=bdSAIjUdwQpkpGtv2enobPEpRDCYXL3RbYRm8kxw6fXy5ulDIytiosCH
 SpianlegqQAR1FK0lQBRGxBIs5yYPgXe80j6j57kIwKsmlTNADp0z/8fb
 L6fHsqm865knt595aJocQSEv9HbgBUtOg9+6kqmg9Iwu/GCLyGvleS79b
 p6PSmYnbNLxtbMw74YnIezUXc4+ZRlNgMMftRvOnmiPjZRX0MDIoezOjE
 aL4o/tYI5Zcil/d7xhnvSBAdmYdPUFQ3g1vyhzxeW49PCyywVkWWmr8eQ
 ytMVP4Dl1kvHgQHr8YPe1mriTMAiseWbZfu6WZsFqzmJCtzCXIqeh/sJu A==;
X-CSE-ConnectionGUID: ZupMmxUMQo+/YEmQqHds3A==
X-CSE-MsgGUID: 1+g2Xu6URCefE69cZI7P/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53767135"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53767135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:38:49 -0700
X-CSE-ConnectionGUID: eHaKCI1BQj2CorRyPLim/A==
X-CSE-MsgGUID: R7FVuQR9RJ633cyk3p7JcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151205893"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:38:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Test some early probe
 functions
Date: Tue, 11 Mar 2025 11:38:33 -0700
Message-ID: <20250311183833.1199190-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Test-with: https://lore.kernel.org/intel-xe/20250311-fix-survivability-v2-0-729ce081155e@intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 5409d19a6..abe224cdf 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -160,11 +160,14 @@ static void set_retval(const char function_name[], long long retval)
  * arg[1]:
  * @wait_for_lmem_ready:	wait_for_lmem_ready
  * @xe_device_create:		xe_device_create
+ * @xe_device_probe_early:	xe_device_probe_early
  * @xe_ggtt_init_early:		xe_ggtt_init_early
  * @xe_guc_ads_init:		xe_guc_ads_init
  * @xe_guc_ct_init:		xe_guc_ct_init
  * @xe_guc_log_init:		xe_guc_log_init
  * @xe_guc_relay_init:		xe_guc_relay_init
+ * @xe_mmio_probe_early:	xe_mmio_probe_early
+ * @xe_pcode_probe_early:	xe_pcode_probe_early
  * @xe_pm_init_early:		xe_pm_init_early
  * @xe_sriov_init:		xe_sriov_init
  * @xe_tile_init_early:		xe_tile_init_early
@@ -325,11 +328,14 @@ igt_main
 	} probe_fail_functions[] = {
 		{ "wait_for_lmem_ready" },
 		{ "xe_device_create" },
+		{ "xe_device_probe_early" },
 		{ "xe_ggtt_init_early" },
 		{ "xe_guc_ads_init" },
 		{ "xe_guc_ct_init" },
 		{ "xe_guc_log_init" },
 		{ "xe_guc_relay_init" },
+		{ "xe_mmio_probe_early" },
+		{ "xe_pcode_probe_early" },
 		{ "xe_pm_init_early" },
 		{ "xe_sriov_init" },
 		{ "xe_tile_init_early" },
-- 
2.48.1

