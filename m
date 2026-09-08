Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12575C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49310E9EB;
	Tue,  8 Sep 2026 05:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cxLijfj5";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA4210E9E9
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl/+SEiv6+mZG4VuSikot+gN0BIpUhYJsRQPt8KsqE8LXOsjDYkUiF+7ThZ4A83EfTSL0MXDN1fgbaDTL7k+3fnAjD4W1zLGHmnJRl6DbqM2ZBm5cUFLGX1aR9d3zYg84YfsRm9bvsoWbBxTkrpIjUxhb6qaXNutDEtBwx47KZYeQe00s/LFjx4JgJkvLlDlAcrgEUnj7Y40HnV2apUhyaQPUVdj+k/n/5R1uc1hVbUCemQX5XNkPybLtcvBEUGTsD5uZMrtsg5weHH/UACQD7Xs9so3yooQfhUWjcaRI75B9oNeh3UorpgO4ZhOrrMW1k2woyos5uv1bLEsT7II8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WSEgZw4xLx+dibzFlkl9FuYtTKXHynMHDUM1+sif4c=;
 b=huIkzFs0EaXYC8US1yQEmr1j3oYmL8X5o8BBF/FeuJaV9BMfUFLGa0uR+5DAI4r8k8e1T8poNWqaCdzdEAF1fTniNgE+Uq0cr7eQAd43R6LIEFv7qxFoM/8CAYy0b46s6jNPYaMk0coZH2kYxqCM+AIQwz7G8fitOz63rpppfpe13BI3r7WywrHj2nAl5LLTHTY8Njx+NzVUuLcKrqj8ueTQ9agzXDoH2FUkSK72O2aHY+kim80OtphVI52sKv9OL/6Kan+A7bgKkrDi3eWcnfx2GsqytleVhHjrHg+gZDumDEdzzdayr4H5CgUE1W7zgMcrloM5X7l0Xqq87UTfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WSEgZw4xLx+dibzFlkl9FuYtTKXHynMHDUM1+sif4c=;
 b=cxLijfj5Ol9tYHo+QlsHUDyHA46iuMJUrWzT2JW+pcfUrfLX0RFKDN5s6/5SR6wpY4ABBbwkbW7dX/OtZOHg8zmXCiKKqqtV4QiaCS5lqIuv5pgXdcAgu5VZTQuJQORtFDxDtXpTI1kAyKTz+60UvZwsgcZcfJoh7yA+/zsyuYM=
Received: from BN9PR03CA0639.namprd03.prod.outlook.com (2603:10b6:408:13b::14)
 by SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 05:09:32 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::56) by BN9PR03CA0639.outlook.office365.com
 (2603:10b6:408:13b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 05:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 05:09:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 00:09:31 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 00:09:30 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/3] tests/amdgpu: add sdma atomic-loop user queue reset
 subtest
Date: Tue, 8 Sep 2026 13:09:05 +0800
Message-ID: <20260908050926.3042193-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260908050926.3042193-1-Jesse.Zhang@amd.com>
References: <20260908050926.3042193-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 12eae2bd-7932-4804-1085-08df0d675e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: PgM3j0dmFI//VHHE7PkdP8qd0YzoONL0x7t7OOrYbusUMKn3gOU23Zzfst9ECt8yBb9m7N9NF0TzvOnO5YbYni/HISzbLP16QlwffEmEklwcZjjHJGc3reKPOXbQAmcdqCaK84yje/+UYDe0QnPAMYHDaYdd4i3wu7UwSvBvABCwsBZLHOyOPynTfxNn/fIdHxNdaRoxW5CBskgATh3m6YvrUWZhHmi16L03XujjD/oj1Q37k5y4w8JItDqounJ81Du1QK6GszQZ+GfVg15FbqpwwhVa2IMKJBTs+DL5J4bqNAvUQE+I/9s+f1Dn89GA5RNO4HVJ8R3fhyCNMLvIlK1TVKbgl4OHRGVf8zZFw4c0IhTUgKb2uGUgNATPwttWfb92IRbi/+5SjLdZ5P07AZZncqEBOJRXWCsiABZ0H8fYAGbrWwzFguyMrQzpoCONqA9Oa2VGWV5WPzAQKEsbuX0dLPND50THlHiLuI6MmK07NNSAHkgL+em9C1c4o74beKHcGEeqnw5Z83+DIEwy2MhopThzsjrNnP8EMqK+CoisyyTzriAMj/hxQ9Tb4biLIKMdxe95PbMIZtzlDR9VSMCcJnqTjzymyWG7yLUnhv4PmcbKZRytTenNmxus807bKE+AD4AODxw3UDFL8X5/P5hnUzkf7/ybNMYIpKG1hPVjDV5lxb4jiVdK2Q717sCpW8RzXBrutWXFo6FYArjtvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TPvOpC7akXpgpwGHBziTeMs/v+AaJhFOoWm+nJPCqUSSdiET4ZlJHIwnmwv2BPhs5C94F+0aegRSrKDClHz1bp6FEYNNznAuk4cao/LbPo7TbTl33OeB1noMLYY9sQi61GoG4XT58FVCcmRP73H8+ktKvHMVHloZ/AgJFPpjoIFjIv6qhEtXkJPQaQXeHWIf/ALJFxHrWwftewwPsmMdtx4uDyo9xWTNfqs0ax2uu+3eUp3VCV6cQP9rISlYk1wL+3wjNaEHxANlJZS+aZQ/WIctYdJiSn573fIrMBN7AzPoBP91w/yRCKZ8gLufOuCuKoYfTG84fbQBOnJO+fOZB/ubpapyVKzfNag/rCMgVeYP+8soYePN0FOW1/1unvAUDEYNp9H2tyXQXiNGH4kJsEpVGpEtecb0wdml8CfHdAf6g5LCg2qCnqKJYvBaHijP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:09:32.1582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12eae2bd-7932-4804-1085-08df0d675e22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
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

Add amdgpu-deadlock-sdma-atomic-loop-umq: hang an SDMA user queue with
an atomic CMPSWAP that loops until its compare value is satisfied, on
memory whose value never matches. This is a valid packet that spins
forever - modelling a real application bug where an SDMA atomic used as
a spinlock/semaphore waits on a condition that never becomes true.

The queue stays resident on its HW slot, so the driver recovers it with
an MMIO per-queue reset, exercising a different hang path (atomic loop)
than the POLL_REGMEM flood/clean-hang and corrupted-header cases.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 9 +++++++++
 lib/amdgpu/amd_ip_blocks.h        | 3 ++-
 tests/amdgpu/amd_deadlock.c       | 9 +++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 3020be46e..4d3b34003 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -848,6 +848,15 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type,
 	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
 		ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 		base_cmd->emit_at_offset(base_cmd, 0x23decd3d, 0);
+	} else if (hang_type == DMA_ATOMIC_LOOP_HANG) {
+		/*
+		 * Atomic CMPSWAP with loop-until-compare-satisfied on memory
+		 * (initialised to 0) whose compare value never matches: a valid
+		 * packet that spins forever, like an app-level SDMA atomic wait
+		 * on a condition that never becomes true.
+		 */
+		ip_block->funcs->write_linear_atomic(ip_block->funcs, ring_context,
+						     &ring_context->pm4_dw);
 	} else {
 		/* Save initialization pm4 */
 		ptr = ring_context->pm4;
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 40a9735be..7e04b9a1a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -165,7 +165,8 @@ enum  cmd_error_type {
 	BACKEND_SE_GC_SHADER_INVALID_USER_DATA, /* COMPUTE_USER_DATA */
 
 	DMA_CORRUPTED_HEADER_HANG,
-	DMA_SLOW_LINEARCOPY_HANG
+	DMA_SLOW_LINEARCOPY_HANG,
+	DMA_ATOMIC_LOOP_HANG
 };
 
 #define _MAX_NUM_ASIC_ID_EXCLUDE_FILTER 3
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 399b0decf..ded933da5 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -265,6 +265,15 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Test-per-queue-reset-by-sdma-atomic-loop-user-queue");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-atomic-loop-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-atomic-loop-umq")
+			amdgpu_hang_sdma_ring_helper(device, DMA_ATOMIC_LOOP_HANG, &pci, true);
+		}
+	}
+
 	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-gfx-user-queue");
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx-umq") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
-- 
2.49.0

