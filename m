Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D09CD262B7
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 04:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BF210E0CE;
	Wed, 21 Jan 2026 04:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLsr67Jn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FC510E0CE
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 04:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768971006; x=1800507006;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=igvBZL6vJqWL88hUz7hozd2tGQuoO71U7cHo6qkbgQw=;
 b=XLsr67JnjUS87qmM35LruIDR8grBj90i6mo+VhqkiLcqN6l1HDEHvRnS
 q/M+Sc9esQWqq3D6dpvh0KLFfD5hAiaHC5QubLs94VDylFJ2oU4EmB8wB
 IruvjUT/fommwn16iQ2HMfU+5CWyBhKU3hRd13Aygx7t71SN2ETVM31Ha
 +3ZdnbYVxS7829PAssrw9Bc8/T/3+PLlEn0ywcRxMf2Y0y9jDA6y3e2s5
 z8a2C+oiLeGv2iVV5fOVpPOtjJWKYmrlrRx3Bc8C+1ksXS2zdde1+l99L
 /shXPo0J4TXekCyuRlijDnqZW2mOzVRTyQuBR5HeTO4M4Dvnxa3sbg+WQ Q==;
X-CSE-ConnectionGUID: yql8UmpcShC0Liv53XOYhQ==
X-CSE-MsgGUID: Yi9YaZooSsaM29rU4T9i3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80818775"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="80818775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 20:50:06 -0800
X-CSE-ConnectionGUID: zXZzIVakSGmuHq+8x7MDtA==
X-CSE-MsgGUID: WFZIWHeoTNig9KnGASeg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210826787"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 20:50:05 -0800
From: nishit.sharma@intel.com
To: stuart.summers@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload before
 force-probe
Date: Wed, 21 Jan 2026 04:50:03 +0000
Message-ID: <20260121045003.116426-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Previously, a skip condition prevented the IGT test from executing if
certain drivers were present. This change removes the skip logic and
instead explicitly unloads any unwanted drivers using
igt_intel_driver_unload(unwanted_drivers[i]) before invoking
load_and_check_xe("force_probe=*"). This ensures the test runs reliably
by cleaning up the environment, allowing the Xe driver to be loaded and
tested as intended.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_module_load.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 6fcf4f806..0c75c4ebc 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -134,8 +134,7 @@ int igt_main()
 
 	igt_subtest("force-load") {
 		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
-			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
-				      "%s is already loaded\n", unwanted_drivers[i]);
+			igt_intel_driver_unload(unwanted_drivers[i]);
 		}
 
 		load_and_check_xe("force_probe=*");
-- 
2.43.0

