Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE314CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 19:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C17810EBB9;
	Wed, 10 Jun 2026 19:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XIvoZnzW";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012047.outbound.protection.outlook.com
 [40.107.200.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8055810EBB9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 19:22:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhi9xqK0K9HUWxHejpn8WIM3WNpw+sTHda7zfg8EHBRZIfkdpvXDtJe5qLd2XeOo2rMcPQ8AgtfK7Z6yIve7HcQwmkE3Ywr4dpynty6MZqXKaaVZyz5nqV+6Y66yYCnz8GEwj9oI5poOF3/k3cdZHaZtAHShbXGbE6/DUYeANVVEqMRMnTJYPGQJLN2+h2/tz4HbbNiP3zC5lma3IdfC6ZKm8qR8fjmPWR1gjUiTHrSd9nx9s2DfFzEKCgI8MUDCFbsDALljj2OenA0P4uJQftXO6N9N+iOoXhRb3h0cV98XRFLrn9xM63favqNynL/DfuuWTb46y6IDlKzPF8NiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Km/Fi442mO5xS2JWu5Thq5wyF1yfW/FhFQ+2vXH2rQ8=;
 b=BrWXDd0WzrznRusimuewMvW1L2qD4TjPmnM+gpYXjl1SLMTHYLApu9AVUYH9Kn9mx7FoCYaaoaErpNHeG71+c7jwTAWkRwbw7mLRkTiIqYTAv2nH8ZqvwK55PcVw2BWnx25N0FnEL+93+MjyMKmZC9CtdiaHtH/H4+zILy5moXbHwc0/dh4pP+GHKh5lHq3y1MKWAcKZ6+l5Pq8duRnveptxi5jLaozHL6U0rqoPQRrgV/lqcdnFr5cVpwTvhGXoGmgCFH3QCBluL67zYLAw2zynzJQk+CQnm0Sz9xyiFP39NAQR0DluGe8hZfC5knDXnbQ0A5gQNvV7WxvkUyI3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Km/Fi442mO5xS2JWu5Thq5wyF1yfW/FhFQ+2vXH2rQ8=;
 b=XIvoZnzWckNUBbhaZZ2He2TMcxZtjbqa0TH9cZC0VEUFeIdgxvJZoeWVaAv6TafNX0jsKnjo4N7wEV8E79yoEQyLV+HvD+HW++MtD5+Io5izmQ/C/Pvd/hP2eShpOSiSwZBLxqQQeLSGI9n+lKn1s+xn/gSUAL1iVTqV+d44yP8=
Received: from PH8PR02CA0040.namprd02.prod.outlook.com (2603:10b6:510:2da::17)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 19:22:16 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::66) by PH8PR02CA0040.outlook.office365.com
 (2603:10b6:510:2da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 19:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 19:22:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 14:22:13 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 14:22:12 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 4/4] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Wed, 10 Jun 2026 15:21:27 -0400
Message-ID: <20260610192208.88992-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610192208.88992-1-vitaly.prosyak@amd.com>
References: <20260610192208.88992-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e34b7e-85f3-4993-cd0b-08dec72594d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: mow7xo+IAmjZfZbFQ0FP15jcuLh7G6Wvhp6iKKKyGZJN2vn90wvsT4oWHr1rhq9LD9SLlGxLkxj8nCLVIM1oNNSNjbpftYQ4kIEPbotgdcZ2tfKJDaGigfe7YjSKqPeYkg0dtpUyZmuvmiEgznx75Gz6TYcrJI2xbNVBTg1aZsFy8C6/YglYvKQ61kwT3u3NzXZH2TPY01IwQEnmA4AH1rVmI9+BxuJC4IConbHx8wP1rN27+7QKHSnnvN75IO+uaD+G5hUjgDo6nAwD5JTsSa7QNYd/TnJaXQvZgJ2no4hOxOloPQ3jNdRa50smIXWIdi8mTglQ8G98mLTRZwpA9+Dp33e3ewFDT2VQHV21OiGeyjrWu41jfKfxPs+NFPEcP/mpnXjpQBYbAj2dCox7zmw5gu5URRPu+1kZv/7PmfLptn4hxwy2hBtZ731IuTOP5hyreJRSX7zK7QD+u+IUXGpPAhadWIMb/C+TXWYfs+9Cs3Zl/v6oHFVEMJ+VmS3ByR++Qcg2IreeJbDCEiGgj83qeDtoy24S1kvjTmAxNKimso48WzPTCC6BJlPkQbudQrTHzrVYTIxa6mzK+K1mey4ylNMBU/fgV+/+Cv9GFmXi7DfTJTbVi8zNnHwbcTWbCk3jLtQCmKdkHtxDT1+uIHMd6Ofs7qdnAFyNJf7GNa8dF98m7k4ci9nSj4p9zarYX+Vk2m6P2DwKebDzW9KIQRc8MErhswtAXbXc8+rQONE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EgewSEbucCkuib3hJGQqOYczZS1Y47m8XqkIqRns1aDhWxo2k33uRyP0pN/4xxKO4W6REDilB6YVBr0DDzA9aZUyOi+33suPJJr8QyvK+cfk7fC3QSp4WTrJi8MNG/EnsQEHTQ1V4Fi1gx2kNKRasfwQp571aaq0PRo9brVzTwdG1NjXSEtAohHxUqXlGxs5LOrh/r53NvA3CwPOxr0hV5bzHAJDy7nlCtKePnGwp7Y6oe3bioQtZbpE1hslhbdL3DYqDs7CCVYUz44EkakTjJYmycbVEmTdhcQU87/M+Gm1DrUpcA1bqFDnKlIT3k+WV+rugMsa63HbZpIsAmlVa8TeRowatZM8W8V/bNloQgjqJ1sVwYYlE4jRgXyH4mhpk5wgd3AQruWof/QHxljDiRC6GDiqwtI76PYRz/W3Zb2gS30hJHEuua4ya+JUis1j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 19:22:15.7301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e34b7e-85f3-4993-cd0b-08dec72594d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934
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
- Initialize platform filter in igt_fixture via amd_platform_filter_init()
- Add igt_platform_require() call at the start of each subtest

This allows tests to be skipped based on:
1. Built-in production rules (requires rebuild)
2. Config file /etc/igt/platform_skip.conf (no rebuild)
3. Environment variable IGT_PLATFORM_SKIP_CONFIG (no rebuild)

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

