Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF63C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7760510E557;
	Tue, 22 Apr 2025 10:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd9YXK9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6A10E557
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745318849; x=1776854849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bc+G0Unsdy/wCF+zP4GDMjcCWZq+bV91tnFc4Hqb14Q=;
 b=Kd9YXK9hyGixTGavsn448Tb3vZcAcAig/JqPQtfc2cXrsH/ZnuXMV2jP
 bA4xwy3XNb11VNq3oB5OcgCf73+baYzzLmHdYgVTWJ2tyS2RNFRA+h7V/
 Cyx3JW75fNJtr2qcI84A94/lvscjSSscgCEf/5vI+Uq6ezoEgg2VrZ/h8
 vMPOYWOVUI7Omh5D5NWMtrf1RM+mRwfAQGVmDQraDlwU8fv2eGYm221bJ
 5U8nZUQDNQzg2zVhzky1I06c5pn61bRYob6FmydRi/rvehb8ez507k8Y2
 VyM5nBxeNewATxp/aKOdP+ioaNebB7rrzJyD2/0dSNGqc6L3P/UpKulCt w==;
X-CSE-ConnectionGUID: KdarCO6eTiq8V0KH36RlFg==
X-CSE-MsgGUID: oQNIbmQXR/CvNrLHBaVHwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57853067"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="57853067"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:47:29 -0700
X-CSE-ConnectionGUID: vFoCWZaVRXGL3i3qE1SILg==
X-CSE-MsgGUID: 2R1EHPq3S9OQsxSh/4EP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="163027962"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:47:27 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_module_load: Fixed the skipped test
 issue
Date: Tue, 22 Apr 2025 10:29:36 +0000
Message-Id: <20250422102936.2950388-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422102936.2950388-1-sobin.thomas@intel.com>
References: <20250422102936.2950388-1-sobin.thomas@intel.com>
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

Fixed the xe load test getting skipped by unloading the
xe driver before loading the driver.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_module_load.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 83e37430f..15cbfb51f 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -120,6 +120,9 @@ igt_main
 {
 	igt_describe("Check if xe and friends are not yet loaded, then load them.");
 	igt_subtest("load") {
+		if (igt_kmod_is_loaded("xe"))
+			igt_xe_driver_unload();
+
 		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
 			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
 				      "%s is already loaded\n", unwanted_drivers[i]);
-- 
2.34.1

