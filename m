Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7845FCA1010
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 00:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F4710E096;
	Thu,  4 Sep 2025 00:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rxQazcOb";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23CF10E21F
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 00:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf7HBz0TIc302wf7Svx1jIVS6TNfxfAOTBHLtrlq994EL1F/NlbTG9wBOCWgsXKDULPcIkB/inko9ZRfR0p0EG1mWp7GzjIAdpoKevqM/AtBaeWk8dzpZib3uAc46XpPYtvaPbuKmfqQIZ5FURPvGqCXa1wYhYAcmSulVifozxpM8fsCChnugf0M3eUnjkdWVX5ArsiMmpX1jKGC3f4Homai4tuv8WO4F54+WD0TDvfW5OgmNNCu3J+T/ekfrn2fkI12znQ4VPSnF4AxsEoM6cRU0xBDS+vm4KeXXUSa+0zbnw0m+U3sZVGBo5oEQJ6JL6ecJJCRfoyj7NBtiO2NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwceZ7jTrCBh2weRzZ/WWgnTRt5MGf/A2QlsTX62UGU=;
 b=K4nTH/2B9HvbazCc1aFD0oahhe0+dnrMMadi5T/xEhyyun2gt/ARrAsyFh44PyQr08NfgZZ5is9wadrQbqhdsqqdmhS9KGfJWWfI7042I+yqAABLd5qe7sM9KSMI8MRP5sR8jRphmvXEOT6gkb7FbgDHB6ZDDMzzajJ4kJemv18HPBxnWrP0SWXPHeQHF4DJdb0hQhEGgASv5dnHlBmzI6DGf7vnQqdejHEV8+eo7rtMMNkUyjDxJhHTkjje2YQ8yKEeU3sTPSQgnlzJvl+CFNVegtSG8Os3PyAdPJ5yxmYdORlA6QcrBeYnF/nFvbwtueVy6n/xJwLgwRUPfyfEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwceZ7jTrCBh2weRzZ/WWgnTRt5MGf/A2QlsTX62UGU=;
 b=rxQazcObbHh8/cLOTVGosN4YY3pBftHVGuwFf7rOSIr3aKxxhmDnZN8J2zwQjLpw2fHPTHOhFXqxPnlZE3hsE2taQvX6ssGXd+jxvsP8Dv8sA+QrjTiPa1Y5IP1069gX7x0aF079ad9JALrfOu/Uc/D+7pD8b+/jkwRShsK4xA8=
Received: from SJ0PR05CA0123.namprd05.prod.outlook.com (2603:10b6:a03:33d::8)
 by DS2PR12MB9686.namprd12.prod.outlook.com (2603:10b6:8:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 00:20:21 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::c8) by SJ0PR05CA0123.outlook.office365.com
 (2603:10b6:a03:33d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Thu,
 4 Sep 2025 00:20:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 00:20:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 19:20:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 19:20:19 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Sep 2025 19:20:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: add CE write/fence subtest using new PM4
 hooks
Date: Wed, 3 Sep 2025 20:20:12 -0400
Message-ID: <20250904002012.123970-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904002012.123970-1-vitaly.prosyak@amd.com>
References: <20250904002012.123970-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|DS2PR12MB9686:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7f4fb6-ab89-4938-79bb-08ddeb48d553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2xXUGEvcmFyQWpKY3lzVDlkZEdJbTZXYUJhT0hCRnU1dHZnamJqNUM4YTRr?=
 =?utf-8?B?SGpjNE1DK3pGeVNwMnJWdU5kdUhGamtDcC9hOEZTbFVFQ3RlT3RIdDEzWWNY?=
 =?utf-8?B?SmRZZFI1MDZmU2NrRVpEaEEzNExxSFhPeHhaaGtHNVFYcU5nYjlYSDBFK2J6?=
 =?utf-8?B?QndBTUNucGUvYTRxMzdacGpBdVY1YjB2dFMwN0hMVXBJZ0RLQUZXM2h3VFk5?=
 =?utf-8?B?WS84OGhaRkRxbVpKZ0RNcnRvdGhWS3JJWDNieVN6UUdUTTN2MjZJUFBveTFT?=
 =?utf-8?B?N3hZN1hOdjNGM3hJOUg5V3U4OTRqZUNRc0hTbDJPRVRYYUNYdFpyMi93ckxr?=
 =?utf-8?B?QTdkdENiNGdLWFYxc1dMeitBVnFReDdQOFF5Q2pFU1AyTDR6QW9hQWFwSDA0?=
 =?utf-8?B?cXhYc0lZUEJ1ZnRkei9INjNta0JlMVBLVHBSYUFJSVkxbFU1YjBRQ3k1WWlO?=
 =?utf-8?B?WWNLbmZ1VkRBclVIc29nVjRBc0lJTG9VL2RURG50VFNmNENMdnp3MXd1Titk?=
 =?utf-8?B?aWN2Vjk0YTNraVlhSlU0L3hxU0d5UTRmUFlvODZWenhrL25DQ3hJWjNFSyti?=
 =?utf-8?B?RS9oM2FCei9ucitLc3ZPRS9BeGhuMjNPQ1p2bXlVcEZBVGVVamtpb0JEdE1I?=
 =?utf-8?B?WUE1ZHlRYmRMM2FQajM0dG9HYXhyNXE4TFRpcUNVSkljWUZoQ0JxN1pxNHdB?=
 =?utf-8?B?K2VVRENpTi9mNnNMb3QyQjJmNDFId0V4aU5rZC9ENWpWRTJBdVp0a0kvWGc3?=
 =?utf-8?B?Z1J1ZUw1emRodE0rb3hna1VlSTZZV05jTUJCVEl3dHFGZjVlWmJNbGNzaUdZ?=
 =?utf-8?B?QzkzNDl2VTN5Rlk2Z2J3emp4cmduSzJPNGVGUUtRck9ZUXdzYXdteE85MjlI?=
 =?utf-8?B?Qk1ha1pJOS9sWlY0MTFLQVJUaTgwUUdLWlVGWmptZTRjOEVtcXg5NW1FMXQv?=
 =?utf-8?B?aERJd2t2VFZzWVZQWjBBVm90aFZKUVJmMjVWWkh2QmVzc3NQSDBPQnRKRXJn?=
 =?utf-8?B?eXFTSGdhSTg0Rmhlc1FDdmwrVXBySUQwVXo3RGo3U2ozWE5oWWZsdzkrd1l2?=
 =?utf-8?B?OFd1K0FCeEFJd3o5Rk45TGRWRDNtZkx3VVppSm8xaG1vTnhDbWMyVE1kSzZE?=
 =?utf-8?B?SDVFOXRSVjkxRUprTTNVbUg5UE5kYUk2amFSTGZhY2NCNEs3bGRvSnhTa01S?=
 =?utf-8?B?TXY5VmRVc3Fvd05qTFZuSEhLWkRVR1o1Sk05ZWRobElBVkFlenRrZTR4b0pl?=
 =?utf-8?B?SFliZDBMcXdiMTVCVUtRSHhKVEZrMEpMZmtCNk1ZT3hBV3dpTTRKQlhWL08r?=
 =?utf-8?B?WS9NN3UzZEJwb0lYWXhCTEQ5K3d1NUFoQTdRTkU3ZldiVVV0NVVkSnJRT0Qz?=
 =?utf-8?B?dVZmYk0xRWVwcERoUCtrTkZCU3gycTE2Y2p3VE5yQ2xPdUFqZ2haeCtHNXFw?=
 =?utf-8?B?MmF1Ny9SYjVhSHlwTzRxbU9WZXVTaEJpdnJMeGp6NElrKzVOZ1ZwQnlaUExw?=
 =?utf-8?B?R3R3bWJLQmpvRTBYVHB0Nm1WeWJXK1ZQcjFETi9wZXVsdUt1Ti9vTjRiS2ha?=
 =?utf-8?B?cGlyNGlmQ3hOMGRXMjhoYk5QQkdGWGtqTVNkWURFSlFmb3RlOWh4NGtzcUV0?=
 =?utf-8?B?L1VTeGYvMlBuVU9iNHFzNHo4UmZyM2p3eDlQWUxVMmJ1OVIwUk04bkxKUHAr?=
 =?utf-8?B?bi84T3JTRnNxRGpha2NsRXFtUkg0dFpQVDNheHRpL1FxaXVjRDB5ZWdZeHJs?=
 =?utf-8?B?TFRuaUNGOW5NbDVMNVBrbldSWFM1QW1sOUxJTStWbWRrZ01FY1dBV0x1L1ZB?=
 =?utf-8?B?VWp3bWNzeG01UGs0VXljVWsvMkZoSlUxZ01Nd1NKQUg5N1Nva2ZUQVFhaTAx?=
 =?utf-8?B?NzV5ZUVNNXZobXNQc0s1TzhKc09yTjBGSFNQR1FYNHdWczhRaTJLSnprUUVN?=
 =?utf-8?B?aTZRTE5wZlo5WWpYd1lNYzQrQ2dydVJqWEVRTTVweGJ3M0xDSzRzamgvZjFn?=
 =?utf-8?B?dXZoNG1zSXZGZnF4LzB1ejkzakY0ZXdxRFJ0a3l6ei9LemMrVkR0cDNjd0FQ?=
 =?utf-8?Q?N3kPW+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 00:20:20.4312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7f4fb6-ab89-4938-79bb-08ddeb48d553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9686
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

Add a new subtest that validates CE (Constant Engine) behavior on the
GFX ring. The test emits an IB containing:
  - 256k PACKET3 NOPs to create measurable latency
  - one PACKET3 WRITE_DATA (engine_sel=CE) that writes 0xdeadbeef to a
    GTT buffer with WR_CONFIRM

The IB is submitted with AMDGPU_IB_FLAG_CE. The test waits the CS fence,
then polls the destination buffer (optionally flushing CPU cache via a
weak wrapper around amdgpu_bo_cpu_cache_flush()) until the sentinel
value appears. It logs the time from submission to fence, and from
submission to visibility.

The test calls newly added hooks:
  - gfx_emit_nops()
  - gfx_write_data_mem()

so PM4 encodings remain hidden from the test, and family-specific
differences can be handled centrally.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_basic_ex.c | 63 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 tests/amdgpu/amd_basic_ex.c

diff --git a/tests/amdgpu/amd_basic_ex.c b/tests/amdgpu/amd_basic_ex.c
new file mode 100644
index 000000000..ff8e75a0b
--- /dev/null
+++ b/tests/amdgpu/amd_basic_ex.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_command_submission.h"
+
+
+static void
+amdgpu_ce_write_after_fence(amdgpu_device_handle device_handle)
+{
+	int r;
+	amdgpu_context_handle context_handle;
+
+	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	igt_assert_eq(r, 0);
+	amdgpu_command_ce_write_fence(device_handle, context_handle);
+	amdgpu_cs_ctx_free(context_handle);
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+	}
+
+	igt_describe("CE memory write visibility after fence");
+	igt_subtest_with_dynamic("command_ce_write_fence") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("ce_write_fence")
+			amdgpu_ce_write_after_fence(device);
+		}
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 2d2a60aef..4c3af24fd 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -5,6 +5,7 @@ if libdrm_amdgpu.found()
 	amdgpu_progs += [ 'amd_abm',
 			  'amd_assr',
 			  'amd_basic',
+			  'amd_basic_ex',
 			  'amd_basic_multi_gpu',
 			  'amd_bo',
 			  'amd_bypass',
-- 
2.34.1

