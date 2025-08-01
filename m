Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE95C87FCA
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 13:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E8C10E85D;
	Fri,  1 Aug 2025 13:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="trCMMWdq";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1510E859
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 13:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0ah1nFjIv2HIfujVK4ikqtjOaVj4ytXu4K9d3m4OaftoDnjipMj2FtrzpPXNl2y5Pl8LEUYeC3PSBQQ2petdpS12VKaf4dJGqX8gx1yaAOeqTiZZmlBqL69s0wzmj202BfR5ENca+IW6J4o2g7eiObLJDNE2dAGmaRJOOb9aBBS84RtEV+o6zaRjAuK5169X8rQx56Ius8gGbCNtGXLhaXE/kRufW7BkqJV+zEt6J+FLBFnkUAhukhogzEwlD9jMt3riMJ7QpyxAttCWa+mMw9Aiu6WTcqrqpTEeJsWbXHllQNd3GwBNq9zsGxeAwDX0+Our+mpvwL9Mr0KeCNt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHHoKeAQC110Qp6/m2rtbPDqsVtq8KQfflPTnQCK5mk=;
 b=MzKDJMny7blBUqxho5ojR8OFAIArtpT2s3RAaGt6KncT1+t9Pwz/QVAFceJWHpjE+MkGqsA8pcqMm/Zj6AbHJusS5Ut19i2tjdClgz0FGjgv7N4MVlV4Nh5E0rzwVkiC2EVV2dwXPDcEVn9EAFrbnkmrCouu+QO9HZzPCp4g1W36+54piTT5MxCV9O6lCqSt83mRHC/V94ZimmGcNsIR9y3awwMxPL4tCJF/QGoYbttAD4VPSXaSwHpte32MPDZ3fd8GvEf+7XFvuR7gTA9sBoFVxCTcaPNnC444h7l/d3b1wE2687nGLub/TR7lBmU3LxYh5qGZ6XMxx72v3V5S9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHHoKeAQC110Qp6/m2rtbPDqsVtq8KQfflPTnQCK5mk=;
 b=trCMMWdqJBRto8C3dGG73J4IcO+Y4TlS1AqeaTFbcc+/0t2iWpd9HihauP4MY2IHNTHntJKnDodjUQ6MnK2J3hq0v0ZDbbzmtAUAABTjmGb0IsCybKMLNtkrDXHzjiHKBFb1Hu7CEbTrm533CRb2YJW5huRGRJ8qyPBIFPEzX1c=
Received: from CH0P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::9)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 13:53:53 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::3c) by CH0P221CA0008.outlook.office365.com
 (2603:10b6:610:11c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 13:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 13:53:53 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Aug 2025 08:53:51 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH 1/2] tests/amdgpu: Add test for GPUVM, LDS,
 and Scratch Aperture Sizes
Date: Fri, 1 Aug 2025 19:20:51 +0530
Message-ID: <20250801135052.3487752-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
References: <20250801135052.3487752-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|CH2PR12MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cf7e95-7a4e-448b-cdf0-08ddd102da36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkRxOHN0bVhuMGpESmVGaFlkUUNNY2xNc1g5UExIWnlYMGJCMEVHcDJXOVlz?=
 =?utf-8?B?VFlnY0M3VGhOaHM2dlc1aVZVa0YxN0tpR1hqbk4rZ0RqUXpTWWwwamJ3VXUz?=
 =?utf-8?B?Z3g1K3R0YVZRWVduUWFTR25mOHhvYVpmbnNNVFI2bUlESEQ3d3hvL1g1RHlS?=
 =?utf-8?B?VE96QkNjcjE4SHJ4TElUN3dKWGlwU3lqbndVMGF4R1hCOGdhQ0JQK202d3M0?=
 =?utf-8?B?Tmt0dlZ3emluU28rT2p3akV6S1JsZllsMUFwTlhQeFhqYXZCYWdKOE5KUHdJ?=
 =?utf-8?B?OU44M1I0Nk4vVlZObWxiY2pzbnZoQWpHaExsYWVZSkFhZXFKNzFSNG1DdnRq?=
 =?utf-8?B?TTNnQnloSStzTGpyOU4zYzY4WHRFK2lzVHdRd0ZEVzVSYXp5bTVnNVhBNFBM?=
 =?utf-8?B?cEVhL1ozTzROZHhwK0tKZVpON0hyQjVQbkloUkxPeWhyeFN4eTdiUlZxb1hm?=
 =?utf-8?B?aXpMR3k3cjdMOWhJaGE5VWtNK25PMmRyQzFkazRpb2g5ZzcxSG5IbmdobkEw?=
 =?utf-8?B?OWNSclo1MDNtTUl2SnhGVkxFSWlzYkFEMVJUdkpNYVlmZFd0TGxtUmlaSkdU?=
 =?utf-8?B?bmxMMU1DY0FmOGNlSmdDL1VIVm0xeURNa1FkcE1RQm03R2dWZC9nTDRacHE0?=
 =?utf-8?B?MnVrc1lWVExnZC9mcTIvQ0xpRVNFV2pFZW9PT0swZ2lOWXo5Tks1K0ZZcm9K?=
 =?utf-8?B?bXM3aTVVclhXc0cxM21Va1JuenlaMmE2WXhPRWRVRkJLUUhhZGZKY1htaGlD?=
 =?utf-8?B?S3FtTCtWWjB5MHlYc3p0NEJ5Y1U0dWQvNmdkZ2hjWTJ5UTJVRFN1UzJDVy91?=
 =?utf-8?B?cTZRWXR5RlI2MWlvQzgzQlZVR25LMGdwT3llSDl6QnZITXlxVmZpNCtGbnd0?=
 =?utf-8?B?QWxnME4wTTFTMkg2aVhlZ3dBU2xqTEFKTnpkdFhFMCtnQ0Jmc3FQRGNRZG8w?=
 =?utf-8?B?aVVKS0dpRTFlaWVkc2RKU1NIem8vZGRNMnptN2dCWGJ1NTZNcDNHZVVFRjdD?=
 =?utf-8?B?UHgranppMFdQYmxxY3NKbllqcWc5L1JxMytTMnpzd21RbzhVcmtnTFY0Rncy?=
 =?utf-8?B?RG5OUnBJNkZRam53TklhUlpFaVRldmFwc2w2UDFIalBFekhlYldzdlZDTjRN?=
 =?utf-8?B?NmtpZEVhN0Z6dFFEMWRTcmppNG9sbFBMODlZNG5yUVNKWjBpQU1XckY0dmdo?=
 =?utf-8?B?NUlPaHNVbGtCYmhqaHhUeFBMYlVEakhkdUlpVjRLaDE5LzhyN1pzOVB1QXk4?=
 =?utf-8?B?R3ZUZENTdjVXaWlFeXQ2UU9FM3MwTmpCQW9CbWU0WFZHcCtRVWRMcm1QNldF?=
 =?utf-8?B?R21TM041RHZoT3V3WlZkZGJVUkdxb1Q4anFxZEdISnhLZ0dPVTRTZW1xMnpy?=
 =?utf-8?B?NGVYWDd4M1h0VGRRd0FHTXVQSWdyZ0Z3ZTZxcEZoNFEwNHJMRHdic3RrQSto?=
 =?utf-8?B?UW1XdEt2YTZwNFlGYktJY0pnclpqNjVrekMxZDUra1lzU29QZi84MUZjL1pV?=
 =?utf-8?B?bzNwUlVEcTdxYUJIcHhHZ3RIVzJ2R2ZDdkxSbVJ4dkkwZWNmU095eWlDY2U2?=
 =?utf-8?B?QjFmcnU5RERFaWR6NGVDK3dJaWVsVFFCZXo0Vmt3VGF6L29MRVExYitDVmE2?=
 =?utf-8?B?UmZsYXpYcEw3RC9VWWNEM0NrTEdkRVVJbjBiSHlmOTR1MnY0RWdHOHlxTXNV?=
 =?utf-8?B?c2crRkNxd21SYldoNXQ5cFFCYXZ5K2E2OGlvY2ZQMEFTNWtXeXRNTkVmaWw3?=
 =?utf-8?B?b2E3bFZVYW55MVhieWZJWWYzcUYzcWd1a2V0UW5vbVBPeUw1Ym4wNVF5Sjda?=
 =?utf-8?B?a0NuTEZ6NUpyNGdpSCttSGNaSkJqeWVNdEpvTGwvR3RvUVA5QnpIb01PazZq?=
 =?utf-8?B?R0FzMzdzekxiOVRjenVubDEvWlNrdHkxZk9sUXN2MTZ5MTVVaXJENyt3Wmsz?=
 =?utf-8?B?K0tiZUYxb2F6bjhZQ0RFUU5aWjArREQwSVIwSmNoUWdVVzNDTFhHMWZNT0Ra?=
 =?utf-8?B?WWhZVDhuSDRIUDBiNXlTcHZXbVQwMnhzOVRIWkQycmE3MnA2anRaa01jNXBS?=
 =?utf-8?Q?4QI8/V?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 13:53:53.7081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cf7e95-7a4e-448b-cdf0-08ddd102da36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
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
Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>
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

