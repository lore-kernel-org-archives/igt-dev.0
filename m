Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52508C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 09:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFAC10E397;
	Thu,  8 May 2025 09:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjvqQDFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E61210E397
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746698092; x=1778234092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z0r/mOBJa0r/JTNHh6XwEythumIbYAJlA/fRKgdNvCA=;
 b=SjvqQDFqDFZPpxrOsGa37kk+wBJSfAXZwG4yZp1nEvdcyEsdY2ZFTnIH
 ClbOypg0XB+9ld/DXQN7hgANhVHbo2iNsHBHyB6DQCyJhVitF73Ev4aih
 YAnFmfgdDunzQTTc3tmmp9BeuJdMbOfOwZw/Bgsi4JkY2btYWiGH2Zd/v
 zYAjyfDNKuq6YNMSg5D/rGcu1iliUMLb5Ys8rnpP8ErwJKDr6hi3ejIUa
 //raMI+7o5Jb+0IhclBkX8R/UjoqFC4hsZAgDmvEBkvMAteihMCNpb639
 LB40FXtH+jpUVQm5JBmmSZDaDkyFS8UMyfgiEqJrHg4IzS15dtAPPTZbg A==;
X-CSE-ConnectionGUID: 2vEHZOlsRx++CBce0QWEpg==
X-CSE-MsgGUID: 92bZB2PIRLS+gR7hNS70gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47729438"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="47729438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:54:51 -0700
X-CSE-ConnectionGUID: yKg6KJ5yQcWcx2wBATRp0g==
X-CSE-MsgGUID: hZMDBUMbQx6A55Y0Sz1cqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="140283393"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:54:49 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Use
 xe_device_wait_for_vram_ready
Date: Thu,  8 May 2025 15:24:43 +0530
Message-Id: <20250508095443.226687-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use new function name xe_device_wait_for_vram_ready instead of
wait_for_lmem_ready.
This function name is changed in below kernel patch.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Test-with: https://lore.kernel.org/intel-xe/20250508090816.216176-1-karthik.poosa@intel.com/
---
 tests/intel/xe_fault_injection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 602e4cb39..2b1f22c3f 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -207,10 +207,10 @@ static void set_retval(const char function_name[], long long retval)
  * Functionality: fault
  *
  * arg[1]:
- * @wait_for_lmem_ready:		wait_for_lmem_ready
  * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
  * @xe_device_create:			xe_device_create
  * @xe_device_probe_early:		xe_device_probe_early
+ * @xe_device_wait_for_vram_ready:	xe_device_wait_for_vram_ready
  * @xe_ggtt_init_early:			xe_ggtt_init_early
  * @xe_guc_ads_init:			xe_guc_ads_init
  * @xe_guc_ct_init:			xe_guc_ct_init
@@ -491,10 +491,10 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		unsigned int flags;
 		bool pf_only;
 	} probe_fail_functions[] = {
-		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
 		{ "xe_device_probe_early" },
+		{ "xe_device_wait_for_vram_ready" },
 		{ "xe_ggtt_init_early" },
 		{ "xe_guc_ads_init", 0, true },
 		{ "xe_guc_ct_init" },
-- 
2.25.1

