Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BDFAD3FA
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 03:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CB810E2EB;
	Thu, 23 Apr 2026 03:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ED9QyqRb";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010016.outbound.protection.outlook.com [52.101.85.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E957010E2EB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 03:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgVQTEO0KKo8GR/ETrVL+2CQrxt93QVw5CzSy9ar6xSe6e/i/ptIY6Mt/DwdXe6yzxOvofxc2W0kMAkzlbnSmD5lVv1C/BP/wtYW8cvZYPWk/6LOJnwp68tAFcU7IbgOl5dssxkmbHPa0RjbIZwjOM5hOcmBmu1n2pvfCtmtJ+yp5c8eDYtDyfQfj0aRkgZEbCVay9wVINUcvhdrl+v+xAEkQxOH2KV/75XyFv5U4jK8KclLZ08T86FyMe8PWlc/1mJGsLpLpgyzqRxeuo1P5hHGxk457IaIE+8G3kl9OBjaAm4FoEbGLnTju5111syGMeuNEvMAzxydJGlox6JSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhfxNmFWcL937QuLfTF+D+5Cy49KZViaZnnxDxV9yJc=;
 b=nmC8EA0J6NaV3cbiVFG+WMtLe+HjM/lRlxj7B5iEDL6XxE+rpg1LLjtHpgQ4cy4acONEgxPxELZ12ZPnQyNfNBH/HEvplxzDxhveyltdCjIHrzej0EB31coqJhlp4kz9VKTXrvg4hGeo7YHaAnvfrChUUUUU1sOD6uJRHccGNjHSAfTB+a3QdSiidAAHLzQtJMWWHaGXu+udeZA0nV61kfmk+5agKDdpCh5a+2wYw5sMPVCP4Ql/FGeBQO6uQWvRJdkwJB1Pu5ikEvcxKxU0muqAYKuMBoUdf6i0UtOTwJ7bnn8Dzh+uCYVKyxIswWZFYHqUU9Fcw3goREHgasu9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.55.251) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhfxNmFWcL937QuLfTF+D+5Cy49KZViaZnnxDxV9yJc=;
 b=ED9QyqRb40fjVmDBGuwg9ZoRdBs7QtjuihZQ6y/lne1DmnbfwSPkZNPx6rCfVcsxruaLktT6y/ZlxE11Ih8Mo7xCzG2xPo/9JtYkjfwnXj+ImohK32Tb1o5ohNAOyoG79Yqq1yL3Zg7s/zad0MTMMppWoGWzPd57TDgxZDDocrY=
Received: from MN2PR06CA0029.namprd06.prod.outlook.com (2603:10b6:208:23d::34)
 by DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 03:57:10 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::83) by MN2PR06CA0029.outlook.office365.com
 (2603:10b6:208:23d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 03:57:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.55.251) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.55.251 as permitted sender)
Received: from satlexmb07.amd.com (165.204.55.251) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 03:57:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 22:12:07 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 22:12:07 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Wed, 22 Apr 2026 23:10:47 -0400
Message-ID: <20260423031204.5033-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260423031204.5033-1-vitaly.prosyak@amd.com>
References: <20260423031204.5033-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DM4PR12MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: db8fd489-09f7-427c-e2de-08dea0ec6502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zvzXvlEOHhIZWZpq8aOYybGub6ZCzKfZGc5OORYxfJywbUGnBVBgm3B8Nq5j+TJGd+hytieNmk/9JcEnuDgteTmVv7yhxvS0rZeXJebKj3NLFlOQSFxESTqHoPwhvmI4qNa8WJNDU51fzLIttsAD+jvOFrRyQ6/F7+Qx6h5AukCNjrIPt5WkggVwXkLBge8Y5F6sqTWs3dTwjSlDzcPu7ddzmXJmhh0aZ0n40j342+m/l6g3DT15v+zwdvbLCPbkjwTWYcnJRpy3KQl3oRN5QTI5UAxDICCd4XmPwGUgsyjMWWdDryVWHv9lXTUE8HOVn7FN30IDF6K4kX7Gp+8VZ7+xLXU1V5uY81vUrz54WZYBxAkhjz9UBUNKyuCY+fHkk7i+PE10Fd/4DnQp6RZrND4Q5YfoIhro81+lXrfX6dlKgImAN8fR1D0QSRvT6hV7kznMIGbqGSyJCXCu9bKTAARJTpJnu5fSPnOzAYvqo95WMQ9nYx9N+89xmGPdFYfaHgLxr7dbNLs+pUO8r5H+di2Lti+uqj1lAYLCwId2dmIO6j7yUrwFLWrrMiAVTUzi3hhQJrh8SRJLNtRCUMj12k23h/FfRMCMLpQqNcxS9uWndM5+fAJdDmK7bpwUu/ElVCj5cTtMFt/rJ+0MS7AP+LZRioa/tjrs9n30whbt1mGutKVkdCl+w5/e5nIPsOlwZ1UWVsDG8pkMGv5gCAyIfVndCyasaeibSZYJOSEmzXJR0yVJJ52C5IGCaPSVH0iqwJ554meeGmLWBNniS32Oxg==
X-Forefront-Antispam-Report: CIP:165.204.55.251; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PHwV6okfegvKHF3pkAaSu9D2/Cgly9suPVnPM48s6tWOIjojQhgfo9efZt4p/MOyyDw/kPbuR1L6Si1W/0EiN795ELAZk/D8gUWjSluZSxfdQoaVs7KjxBsV6EU10nmbWnJWhGRKdSFMOhkmxof5FGPNlQDd0IOGs6qieo2U12ZNEJ+6Pw5NH7k38zc8GUmewfVlKGkLkPAOp4JGpStFZ9GU/5nY40DZ+4ke6Sa1nhiE4cRScSlCjnqp689XU5KnP0iVDQZBuTdYLZe19lKNWqHKKsqaU93w8FwCgse5iK72Z9v4TkPZ4YTvOGCBkOx5eKXw6rlW0U8ibmirkiTHKEMvrljEK3NS2dQmKalEkUiXAs2I7/rjKkNjBZAGDcCaZAgxuMsaFPRsHiL9vY2kHcl0DyJyD+EHU++Eeqfyx3lemuyVDk3C7gNIQjdr0jYY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 03:57:09.8305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8fd489-09f7-427c-e2de-08dea0ec6502
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.55.251];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6280
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add platform filtering integration to amd_basic test to enable
per-platform test skipping via the generic filtering framework.

Changes:
- Add include for lib/amdgpu/amd_platform.h
- Initialize platform filter in igt_fixture via amd_platform_filter_init()
- Add igt_platform_require() call at the start of each subtest

This allows tests to be skipped based on:
1. Built-in production rules (requires rebuild)
2. Config file /etc/igt/platform_skip.conf (no rebuild)
3. Environment variable IGT_PLATFORM_SKIP_CONFIG (no rebuild)

Subtests integrated (15 total):
- userptr-with-IP-DMA
- cs-gfx-with-IP-GFX
- cs-compute-with-IP-COMPUTE
- cs-multi-fence-with-IP-GFX
- cs-sdma-with-IP-DMA
- semaphore-with-IP-GFX-and-IP-DMA
- eviction-test-with-IP-DMA
- sync-dependency-test-with-IP-GFX
- cs-gfx-with-IP-GFX-UMQ
- cs-compute-with-IP-COMPUTE-UMQ
- sync-dependency-test-with-IP-GFX-UMQ
- cs-sdma-with-IP-DMA-UMQ
- all-queues-test-with-UMQ
- cs-gfx-fwm-UMQ
- cs-compute-fwm-UMQ

Usage example (skip UMQ tests on Navi48):
  export IGT_PLATFORM_SKIP_CONFIG=navi48:amd_basic:*-UMQ:Testing
  ./build/tests/amdgpu/amd_basic

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..4149a0192 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,6 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -883,6 +884,9 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+
+		/* Initialize platform filtering */
+		amd_platform_filter_init(&gpu_info);
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
@@ -892,6 +896,7 @@ int igt_main()
 	igt_subtest_with_dynamic("userptr-with-IP-DMA") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("userptr")
+			igt_platform_require(igt_test_name(), "userptr-with-IP-DMA");
 			amdgpu_userptr_test(device);
 		}
 	}
@@ -900,6 +905,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx")
+			igt_platform_require(igt_test_name(), "cs-gfx-with-IP-GFX");
 			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, false);
 		}
 	}
@@ -908,6 +914,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute")
+			igt_platform_require(igt_test_name(), "cs-compute-with-IP-COMPUTE");
 			amdgpu_command_submission_compute(device, false);
 		}
 	}
@@ -916,6 +923,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-multi-fence-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
 			igt_dynamic_f("cs-multi-fence")
+			igt_platform_require(igt_test_name(), "cs-multi-fence-with-IP-GFX");
 			amdgpu_command_submission_multi_fence(device);
 		} else {
 			igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
@@ -926,6 +934,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("cs-sdma")
+			igt_platform_require(igt_test_name(), "cs-sdma-with-IP-DMA");
 			amdgpu_command_submission_sdma(device, false);
 		}
 	}
@@ -934,6 +943,7 @@ int igt_main()
 	igt_subtest_with_dynamic("semaphore-with-IP-GFX-and-IP-DMA") {
 		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("semaphore")
+			igt_platform_require(igt_test_name(), "semaphore-with-IP-GFX-and-IP-DMA");
 			amdgpu_semaphore_test(device);
 		}
 	}
@@ -942,6 +952,7 @@ int igt_main()
 	igt_subtest_with_dynamic("eviction-test-with-IP-DMA") {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("eviction_test")
+			igt_platform_require(igt_test_name(), "eviction-test-with-IP-DMA");
 			amdgpu_bo_eviction_test(device);
 		}
 	}
@@ -950,6 +961,7 @@ int igt_main()
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test")
+			igt_platform_require(igt_test_name(), "sync-dependency-test-with-IP-GFX");
 			amdgpu_sync_dependency_test(device, false);
 		}
 	}
@@ -958,6 +970,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-with-umq")
+			igt_platform_require(igt_test_name(), "cs-gfx-with-IP-GFX-UMQ");
 			amdgpu_command_submission_gfx(device, info.hw_ip_version_major < 11, true);
 		}
 	}
@@ -966,6 +979,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-compute-with-IP-COMPUTE-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-with-umq")
+			igt_platform_require(igt_test_name(), "cs-compute-with-IP-COMPUTE-UMQ");
 			amdgpu_command_submission_compute(device, true);
 		}
 	}
@@ -974,6 +988,7 @@ int igt_main()
 	igt_subtest_with_dynamic("sync-dependency-test-with-IP-GFX-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("sync-dependency-test-with-umq")
+			igt_platform_require(igt_test_name(), "sync-dependency-test-with-IP-GFX-UMQ");
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
@@ -982,6 +997,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("cs-sdma-with-umq")
+			igt_platform_require(igt_test_name(), "cs-sdma-with-IP-DMA-UMQ");
 			amdgpu_command_submission_sdma(device, true);
 		}
 	}
@@ -992,6 +1008,7 @@ int igt_main()
 				userq_arr_cap[AMD_IP_COMPUTE] &&
 				userq_arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("all-queues-with-umq")
+			igt_platform_require(igt_test_name(), "all-queues-test-with-UMQ");
 			amdgpu_test_all_queues(device, true);
 		}
 	}
@@ -1000,6 +1017,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("cs-gfx-fwm-umq")
+			igt_platform_require(igt_test_name(), "cs-gfx-fwm-UMQ");
 				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
 		}
 	}
@@ -1008,6 +1026,7 @@ int igt_main()
 	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
 		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("cs-compute-fwm-umq")
+			igt_platform_require(igt_test_name(), "cs-compute-fwm-UMQ");
 				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
 		}
 	}
-- 
2.54.0

