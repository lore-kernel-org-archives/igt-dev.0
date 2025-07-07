Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE26C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 07:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379C010E424;
	Mon,  7 Jul 2025 07:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EpNp0ET1";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9471610E424
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 07:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6lRFy7L0iqRRX1cDVuBCi0JFs+Q1sX39FvsHKqQO+Dprv64HvsKcf6P6sVa9kVZ73TEJ5lPgXe2TARseNSvioWza/9jsIKeDumB/7OyNNsfval63OPWTzSoKBEcQ5rUxv2c05LB4ysdVfHGT860OGdVQyDEekpSmj3LBvhlQJm/vck2oovMUvYxgauiaYsMRdwl7vBm/xsDkUQAVk7gg4+twAyEHrX1Bs6Fc93d8pyrPnFSBRXl7ewCxyMS2muzZSVqneY6X/tWIHwz4+nKd5lRI3ymRTRJrcw7Lk5lJoZ6l3FyeS2p78hamq3iP79cGEhHPXF0uBiOBYSxhLQmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHIrmRH9dRod6H+08gdTaF53ei7MLfnmmmMcujfKLsk=;
 b=vfUqoAJ/ZqHTyiIRcm1oSgxyHgnNpG0xbZW57JqYgH8qcvmYaUQrWG+nsT9sfxaEP1D5nAoYIVKnw6dpbGjMGKoyg+pWgJXVQA/LgoqCzgtkGWYAfQWjl4vUkvcWQigjtK+qDZatzgKlU1+iSNV/yiOIjHeOlcvJ+Pe9SMI7ICEDoyoVBf07FJwcgMkoSJiwjF0UXGd51BNtNebjKL5TGB6uD5MqfwKEeAZ9K1M8TMvW9xzcIMwmtt9UsT/qGmtEQkiDZEKmgUz18qjS9CF+vTY4RqhDCIrKmR5OvYpIC023ey2lLnfdfwxH16d9mByGBja3XhVb9eZmDDGPqgxGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHIrmRH9dRod6H+08gdTaF53ei7MLfnmmmMcujfKLsk=;
 b=EpNp0ET1r5tMrfROwQe4m0tRRvb3jTDq7D2a5WGE9p0a7wLR2AiFsNeY9utGehmtmFJGGIbDJ4tdKE3xtPSqehU/yNK5kCZnYvSFQnbg23xIInd8zaJHf+1HMXr19q92vuO9J0iZKaKtYmaPJAn8HnnAmfSo3iPXzwcmmAIkuJU=
Received: from CH0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:610:e7::24)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 07:09:39 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::17) by CH0PR03CA0229.outlook.office365.com
 (2603:10b6:610:e7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 07:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 07:09:38 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Jul 2025 02:09:36 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH] tests/amdgpu: Add test for GPUVM, LDS,
 and Scratch Aperture Sizes
Date: Mon, 7 Jul 2025 12:39:23 +0530
Message-ID: <20250707070923.4045891-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cacb67-e8ba-424f-2134-08ddbd253cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXVQOFVDVE8wckczb0VZNTlCSFg5amZNWEQ2TDZaODBlUDF5RkdoUTlyZ2JF?=
 =?utf-8?B?dm5vM01YQkNObU9lSGV1Z1pNZk1lVDBtZk9NTjkyWFZlLzJlMGpDMUdNZUdp?=
 =?utf-8?B?cVl3R29aVG5pYkR3VmpESE85UnJzQ1FQUXovNG1ZRmd2dDBqcUJMVnhGc0Jt?=
 =?utf-8?B?ZVRCdWJzS3FHbk1mVzFUWC8xbzBjSVFCZjhQVEMwTXh0UHV5a3IxUGlGWGVN?=
 =?utf-8?B?RzlBbkRVWW1BT3VjSHJnQ1l6OWZWU1J2V3Z0ZCtGbkFPWTVVbjJ2YkdmU1dj?=
 =?utf-8?B?NWtMRHRsM1JqZnhjd1NtQ2ZjWmFwTjNYT2xUampZQ3pBd2k5S1BaS3VySHpz?=
 =?utf-8?B?dGhaQjNsQmhuUFY1VS9OcTF2M1Y0cHNKTFRBcys4aHFRK1JGZmZsMkd1WUFX?=
 =?utf-8?B?TlFMaGxmMVVnVkk0dEFnWFBlMW1FVHA5YW8vc2wyaExzTHhLT2xFci8zNGlv?=
 =?utf-8?B?R3ljdDlBclYrOFN6cEMwWXNrQVU5eWlncGthWHpuM3Z1dHRMVWRWMjlSbm9E?=
 =?utf-8?B?bWdlQXM2c24ySWZFNGZsWXF2M3VqSFFzd2RwdHU1VjZiRllCS1RQTm44cFU4?=
 =?utf-8?B?b2lnbGljN0F6b3NBdFFtdHFHUkNhRmxhbE5uWGZZWDlja0pWbFBmMU1aVUxU?=
 =?utf-8?B?Z3lXVXBBM0dyR2FjZmdTamEzaDZGaUhoSXkvZEt5UTZSNEtWUGI4ZTJRaHYx?=
 =?utf-8?B?MW1tRU5uempDTmsxbHpyR3pQZ05BRXZ5bUc0RGtoUGppd0FlTDJNMXAxUmZF?=
 =?utf-8?B?SGNEc2puN0dvWS94UGZndmZneFRLZHhqcVVxa0Y0eE9QdUpzbmZDcDFoU0F3?=
 =?utf-8?B?c3lqbFJZT2krZTRrOUpBRTNmZzRRQ1pGSEs2UWh2ZzVGMHR2ODU4eGQ5TUJX?=
 =?utf-8?B?VjJXdFBqK3RzaGdqVXNxSE1jYVhVOEE4NEJPMnFnbG9pblR6TC9LbmNuU2xp?=
 =?utf-8?B?YlJ4UkUvVExKZUpZbjdoQnQrSEd3NkZkaVozZ0d4SWRBNDZjb2k5aFROSy8y?=
 =?utf-8?B?eExVZ05rdGhqMTRqS0REbjI4ZDNFUGh1ckx2RjF2a2RlTS95ck14ak0yQVZt?=
 =?utf-8?B?eVJ6N2dBR0pDbFpwSlk2WGwraUV4akkvM3c2ODFTTyt4UENnN3FqaTVid0NI?=
 =?utf-8?B?U0lUZjNyK2hERGtBSlBrN05IMXhwZmVkMVVBS0VlVHNwSzBBallZTDZsVG9j?=
 =?utf-8?B?NVk5dnM0OHRNWHBYeXpaOHNWdHJXelpyZjFSemNOQkZua2F0Wmp5TEdVaVUw?=
 =?utf-8?B?c2F2NXBqeEZmQU43Ulp6NHMyZnRNLzlzWitwNTVqem1wZmVGRVJWaDhtdVFV?=
 =?utf-8?B?NmxkMk0rTS9ibHQ2UkhwWUNWMEx6WDZyRUtFNndZbmNWZW0yTTZJM0pneEhh?=
 =?utf-8?B?MWpVbStNY3VWMm9hYWdSZDI0QmZoQmRKUGZhaXFSQTVyOTd2VkgyQXgrejkv?=
 =?utf-8?B?dTY2SFFPR1hOU3J3N3BsNlZKYXZEdGhVN0pBN0U3dTYzVzQrR2MrRHUxek5O?=
 =?utf-8?B?NFd2ZmNjRFZ6aGg5dVViU2tCdkpxSDBCSFQ4NTY4b3RzZ295NERFaXpobFdy?=
 =?utf-8?B?dlhwSE5IOTFQTGYxa3oycVlIMytOY0crTTZFdEJXNFlSRzEvTFZpcFRKQWpn?=
 =?utf-8?B?MzA0QlljeXdSbERTUUdlZzRqNmMxWm4zaUV2WGQrMURiVTJvNVNrQmh0VVgw?=
 =?utf-8?B?OWM5eStacUg4V00rT0l2TjVjbFlUMzY1VGZCOFJzWTFuc092WTZhNzdTQmJ5?=
 =?utf-8?B?TzgzRVNLc1YzLzR5REV2T0hoaHB3K21mUU5WamlEbnlHMUJFVHVnNFo5a3Rx?=
 =?utf-8?B?TG5oVzJiSEltSVEwcjlRaU50bWt4Y041R0ZFLzJSS3BLWENyNW4xY1FHTzdv?=
 =?utf-8?B?YWlETTY5R2l3bEdMWkltak5LZUhGdm9NYlRMSWRyS3o0WEpzV25rSmk0N05E?=
 =?utf-8?B?dGludzg5d2RPS1IrVm44YmNZUEpEaUtqOGl4S0ZrckZ2QWdZdjV5dURiYXht?=
 =?utf-8?B?eUJQUkU3YTJESHo3YmptVW5QVDhBRXJhUndReWQzeE1pbWFOcURqUlVuSmlY?=
 =?utf-8?Q?Aastm/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 07:09:38.9467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cacb67-e8ba-424f-2134-08ddbd253cec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
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

This patch adds a new IGT subtest "amdgpu-vm-aperture-sizes-test" that
queries the AMDGPU_INFO_DEV_INFO ioctl to validate GPU virtual memory
(GPUVM) aperture sizes, including LDS and scratch base and limit
addresses.

The test prints the LDS and scratch aperture sizes in bytes, gigabytes,
and terabytes, and asserts that the sizes match expected values (e.g.,
4GB).

It also prints and validates the GPUVM virtual address ranges, including
low and high virtual address ranges, and calculates the total GPUVM
size.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_vm.c | 90 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index 9cd56e2b5..1c5212463 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -13,6 +13,9 @@
 #include "lib/amdgpu/amd_cp_dma.h"
 #include "lib/amdgpu/amd_memory.h"
 
+#define BYTES_IN_GB (1024ULL * 1024ULL * 1024ULL)
+#define BYTES_IN_TB (1024ULL * BYTES_IN_GB)
+
 static bool
 is_vm_tests_enable(uint32_t family_id)
 {
@@ -197,6 +200,88 @@ amdgpu_vm_mapping_test(amdgpu_device_handle device_handle)
 	amdgpu_bo_free(buf);
 }
 
+static void
+amdgpu_vm_aperture_sizes_test(amdgpu_device_handle device_handle)
+{
+	struct drm_amdgpu_info_device dev_info = {0};
+	int r;
+	u64 lds_size, scratch_size;
+	u64 low_range, high_range, total_gpuvm_size;
+
+	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
+			      sizeof(dev_info), &dev_info);
+	igt_assert_eq(r, 0);
+
+	lds_size = dev_info.lds_limit - dev_info.lds_base + 1;
+
+	igt_info("LDS Base: 0x%llx\n", (unsigned long long)dev_info.lds_base);
+	igt_info("LDS Limit: 0x%llx\n", (unsigned long long)dev_info.lds_limit);
+	igt_info("LDS aperture size: %llu bytes\n", (unsigned long long)lds_size);
+	igt_info("LDS aperture size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
+		 (unsigned long long)lds_size,
+		 (unsigned long long)(lds_size / BYTES_IN_GB),
+		 (unsigned long long)(lds_size / BYTES_IN_TB));
+
+	scratch_size = dev_info.scratch_limit - dev_info.scratch_base + 1;
+
+	igt_info("Scratch Base: 0x%llx\n", (unsigned long long)dev_info.scratch_base);
+	igt_info("Scratch Limit: 0x%llx\n", (unsigned long long)dev_info.scratch_limit);
+	igt_info("Scratch aperture size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
+		 (unsigned long long)scratch_size,
+		 (unsigned long long)(scratch_size / BYTES_IN_GB),
+		 (unsigned long long)(scratch_size / BYTES_IN_TB));
+
+	/* Validate that limits are greater than bases */
+	igt_assert(dev_info.lds_limit > dev_info.lds_base);
+	igt_assert(dev_info.scratch_limit > dev_info.scratch_base);
+
+	/* Validate size is expected (e.g., 4GB) */
+	igt_assert_eq_u64(dev_info.lds_limit - dev_info.lds_base + 1, 0x100000000ULL);
+	igt_assert_eq_u64(dev_info.scratch_limit - dev_info.scratch_base + 1, 0x100000000ULL);
+
+	/* Print and validate GPUVM virtual address ranges */
+	igt_info("GPUVM virtual_address_offset: 0x%llx\n",
+		 (unsigned long long)dev_info.virtual_address_offset);
+	igt_info("GPUVM virtual_address_max: 0x%llx\n",
+		 (unsigned long long)dev_info.virtual_address_max);
+	igt_info("GPUVM high_va_offset: 0x%llx\n",
+		 (unsigned long long)dev_info.high_va_offset);
+	igt_info("GPUVM high_va_max: 0x%llx\n",
+		 (unsigned long long)dev_info.high_va_max);
+
+	igt_assert(dev_info.virtual_address_max > dev_info.virtual_address_offset);
+
+	if (dev_info.high_va_offset)
+		igt_assert(dev_info.high_va_max > dev_info.high_va_offset);
+
+	low_range = dev_info.virtual_address_max - dev_info.virtual_address_offset;
+	igt_info("GPUVM low range size: 0x%llx\n", (unsigned long long)low_range);
+	igt_info("GPUVM low range size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
+		 (unsigned long long)low_range,
+		 (unsigned long long)(low_range / BYTES_IN_GB),
+		 (unsigned long long)(low_range / BYTES_IN_TB));
+
+	high_range = dev_info.high_va_max > dev_info.high_va_offset ?
+			      dev_info.high_va_max - dev_info.high_va_offset : 0;
+	igt_info("GPUVM high range size: 0x%llx\n", (unsigned long long)high_range);
+	igt_info("GPUVM high range size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
+		 (unsigned long long)high_range,
+		 (unsigned long long)(high_range / BYTES_IN_GB),
+		 (unsigned long long)(high_range / BYTES_IN_TB));
+
+	/* Calculate and print total GPUVM size */
+	total_gpuvm_size = low_range + high_range;
+	igt_info("Total GPUVM size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
+		 (unsigned long long)total_gpuvm_size,
+		 (unsigned long long)(total_gpuvm_size / BYTES_IN_GB),
+		 (unsigned long long)(total_gpuvm_size / BYTES_IN_TB));
+
+	/* Size checks (adjust thresholds as appropriate) */
+	igt_assert(low_range > (1ULL << 30));  // at least 1GB low range
+	if (high_range)
+		igt_assert(high_range > (1ULL << 30));  // at least 1GB high range if present
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -230,6 +315,11 @@ igt_main
 	igt_subtest("amdgpu-vm-mapping-test")
 	amdgpu_vm_mapping_test(device);
 
+	/* Subtest for GPUVM, scratch, and LDS aperture sizes */
+	igt_describe("Validate GPUVM, scratch, and LDS aperture sizes from amdgpu_info ioctl");
+	igt_subtest("amdgpu-vm-aperture-sizes-test")
+		amdgpu_vm_aperture_sizes_test(device);
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.34.1

