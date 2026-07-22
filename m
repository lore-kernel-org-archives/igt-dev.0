Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9BAC4451C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 06:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887910E2AC;
	Wed, 22 Jul 2026 06:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BCfq8jY5";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300310E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 06:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOuUhXsIFdv10l6yhfX6VbRz5yiF8PUWUnzNEaoIbOCy9QvfD8V7L3ZuZUoltxub20Nmv/DrvBiQ7GMA2J2r0gLbB+v2YOGmVkZ7dgv6NmkHuf0iuLzcWvVIAhHnE58kYo5jAYDH/KRbNeTa0oCl6/cvW2WJvxygCOmYaTNEde+sCz8yVzlRBVDAHGHysN7Bp0d3KlX0/OeM3qv5/YpZnc5LrpRMuIHJjxR4VWSp/YOBXOIKSOwCs/21hbVMjpKS7KM2iyrsKXdUOeyo2vYj87tGX88PV06gEX7hqi5DLRjcOsm7YqXPGinSch8tm3QdsGFgNISiUElL28RwpoVHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOHkBCP+qnfsi6KlL7TJ0+u+Ri5BX7sDVrYVMUVcLiE=;
 b=A30UVNxgxVMKt90gSvqnmHErrP5QSwl3qoeHjnZ02lFrdWmpMI72iq0TH759l3Bu6EWK25ltIQ30CMSePJ+WwYkYKFJK+DMpZ9JI45jNno5u8t0fcUt/JclcHxVgkjP44Wzyjx7zh+aip68VdTtLC4120eLsqAthXsPfn8fBWTuX3wU45rzfbYiNYSu6NlG6+oXOxuBVdTaIEiGuvoVB1T0fjSN4NCwWZe5ZGbgmsz25jI2elm0iotHTPb0b2bdjY+ky2QD6Cu+LsPtCVIQI2hCGKr6+0QoLaUKOQZLmEXD1WNIbz5nGp4LE7SGEP7B+7+NVTLVF5carfP736kdlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOHkBCP+qnfsi6KlL7TJ0+u+Ri5BX7sDVrYVMUVcLiE=;
 b=BCfq8jY5aQxhUrizIUc5INa8X/FNifaYEkAfP3d4HwqhlSQJ5qq/xhUGEicT3T/GPIf/g292PhtrohPOpJpw0vybvPRm1ddouaoPsWVlXd9NH3i2873zFgN6X3Ms67tqMhXsDq9TwcL7UHwID1jhj9nPXSoeJye07PbWKH897oA=
Received: from CY5PR15CA0024.namprd15.prod.outlook.com (2603:10b6:930:14::16)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:21:52 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::43) by CY5PR15CA0024.outlook.office365.com
 (2603:10b6:930:14::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 06:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 06:21:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 01:21:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 23:21:51 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 22 Jul 2026 01:21:44 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V2 2/2] tests/amdgpu/amd_deadlock: add gfx user-queue
 priv-fault reset test
Date: Wed, 22 Jul 2026 14:21:15 +0800
Message-ID: <20260722062137.3019454-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
References: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5484c9-a152-467e-9116-08dee7b98522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: Np88OaVEOlXr50pTAGOB7FuWvjSxCtjpDLIYFHhc+wAH8OulYEiTyVsTWEsoPLASBopGPZ7ipjD8fdz9K++b23ZpRWxLnLEtHHpHlyXsQ51+NJTj/BuT4800r143iGkIR3IIP8Ele7/LEVJASUmXSSurEbfUiRudRsfEVi/+fJtdMWTww/Okab2pDs0Nuw7O8O3j6VSut+DqQPPZxdTa+n9BYqTK37e4AlkzxjIoEuPr4j8C1JKT0KYWP7HIn6TNQ4YW8L2rek0q4Ew7JRJHcJwlub9H/qLP7iJR+sqy5gneIXEzwVEnsGJgfIl2taVFdT7bbvSr0ptVIMJ+++i+oQxnUJX06sdI57kRWONckpuL2tld3ys1zJ9mXa5xXVXvhOnmlKolw3+wcb4R9NBo7TSe/GpB773sEptEMeeccbh3HqLiNDcg5wCDuZGzaEvQcRF7Ri2F59aWBaEze6vM0CtyCyW2i7VgCFqN1XC736sHbExIn39fEFa6mQXrE/PHVSuvqHZ732Cnmo4pn0yClWtgh3PLgIA2VU+meYY4xWLGdsFxGbMnWOEBs/7YyGXjFrayJSVGrUvhtY/ee5kjGoNM6MjYVrbp67vkhACyTxyDMdLo8dzoHxQVgofzrxh3kJ83Bzb1WPNF44evB5o2zG6Uz6Lw+4K7ga0FiaYyxF6Kz0Wc193viZXtVY+V4TDJ1VHOeKgcSJcyZI+Ktzxemg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EQlIeTNHvM/rWzXwqmVFBF9ukk3xY3GuNUpsOdfMJI/P8VtoHIoa6JvBowJ7418AdrjMKCmQrpw+ds4dcJy1u8sKMqc6MlZ3mtK9ZaKy4omMJIv9m0w1KUuo/xrZ5mKb/QQfrIa3tQC0Qyr2SdEfttiZnDOA13aH2wZ3Hq193ZVjh0KwXEQMjz8AvUN+5dFwvuUZkezj1+uNu95LWT1hDi3r3OTPSJujgZNN3m6SJRvfnFpjGaunA1NFZdIJnhHjxxPtw6iKj0AkYDRlW041OeR/0UIV1mC6+ri278jg5OqFmYM3tjpMPFx+WktrYmRFU6DwVlE5xni8LqlgXcD1MsewZ8WhHn4EV5K1TDI4A9G9hEM00sXBFrudbOau61I/ekPFYuF9nemNFUUYQR5tO+E5XL0ZGUTN3/6TsQ1hFPjdQt3t+zlnvfdiyhDphKAA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:21:52.0913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5484c9-a152-467e-9116-08dee7b98522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258
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

Submit a gfx user-queue job that raises a priv-fault interrupt and then
hangs cleanly: a minimal invalid opcode (0xf2) makes the CP raise
CP_BAD_OPCODE_ERROR without running off into memory, and a trailing
WAIT_REG_MEM that never completes keeps the queue hung. The driver recovers
it with a per-queue reset instead of a full GPU reset. The job is submitted
on the synchronised path so it blocks until the reset completes the fence.
Add it as the amdgpu-gfx-priv-fault-umq subtest, gated on
AMDGPU_ENABLE_USERQTEST and per-queue reset capability.

v2: move all hang packet creation into ip-block hooks wait_reg_mem_hang
    and priv_fault_hang in amd_ip_blocks_ex.c; deadlock helpers now call
    the hooks only, no direct PACKET3() in test code (Vitaly)

Co-developed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 110 ++++++++++++++++++++++++++----
 lib/amdgpu/amd_deadlock_helpers.h |   4 ++
 lib/amdgpu/amd_ip_blocks.h        |  22 ++++++
 lib/amdgpu/amd_ip_blocks_ex.c     |  68 ++++++++++++++++++
 tests/amdgpu/amd_deadlock.c       |   9 +++
 5 files changed, 201 insertions(+), 12 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 4395fc527..92d816e13 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -416,21 +416,16 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 /*
  * Emit a WAIT_REG_MEM that waits forever: poll bo_mc (initialised to 0) for a
  * value != 0. This is a valid packet that never completes, i.e. a clean hang
- * with no page fault, so it can be recovered by a per-queue reset.
+ * with no page fault, so it can be recovered by a per-queue reset. All packet
+ * creation lives in the IP block hook for ASIC portability.
  */
-static void gfx_ring_emit_wait_reg_mem_hang(struct amdgpu_ring_context *ring_context)
+static void gfx_ring_emit_wait_reg_mem_hang(
+	const struct amdgpu_ip_block_version *ip_block,
+	struct amdgpu_ring_context *ring_context)
 {
 	uint32_t i = 0;
 
-	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
-	ring_context->pm4[i++] = WAIT_REG_MEM_MEM_SPACE(1)  | /* memory */
-				 WAIT_REG_MEM_FUNCTION(4)  | /* != */
-				 WAIT_REG_MEM_ENGINE(0);     /* me */
-	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc) & 0xfffffffc;
-	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
-	ring_context->pm4[i++] = 0;          /* reference value */
-	ring_context->pm4[i++] = 0xffffffff; /* and mask */
-	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	ip_block->funcs->wait_reg_mem_hang(ip_block->funcs, ring_context, &i);
 	ring_context->pm4_dw = i;
 }
 
@@ -490,7 +485,98 @@ void amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip
 	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
 	ring_context->resources[0] = ring_context->bo;
 
-	gfx_ring_emit_wait_reg_mem_hang(ring_context);
+	gfx_ring_emit_wait_reg_mem_hang(ip_block, ring_context);
+
+	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 0);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+				 ring_context->write_length * sizeof(uint32_t));
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_type);
+	} else {
+		free(ring_context->pm4);
+		free(ring_context);
+	}
+}
+
+/*
+ * Build a packet stream that raises a gfx priv-fault interrupt and then hangs
+ * the queue cleanly: a minimal invalid opcode (CP_BAD_OPCODE_ERROR) followed by
+ * a WAIT_REG_MEM that never completes. The bad opcode alone would let the CP
+ * run to completion (self-recovering), and a bad opcode with a mis-parseable
+ * body drags the CP into a page fault (only recoverable by a full GPU reset).
+ * Combining a minimal bad opcode with a clean wait gives the wanted case: the
+ * priv-fault interrupt fires, the queue hangs without faulting the CP, and the
+ * driver recovers it with a per-queue reset.
+ */
+static void gfx_ring_emit_priv_fault_hang(
+	const struct amdgpu_ip_block_version *ip_block,
+	struct amdgpu_ring_context *ring_context)
+{
+	uint32_t i = 0;
+
+	ip_block->funcs->priv_fault_hang(ip_block->funcs, ring_context, &i);
+	ring_context->pm4_dw = i;
+}
+
+/*
+ * Fault a user queue with an invalid opcode followed by an endless wait: the
+ * bad opcode raises the gfx priv-fault interrupt and the wait hangs the queue
+ * cleanly, so the driver recovers it with a per-queue reset (no full GPU
+ * reset). The faulting submit uses the normal (synchronised) path so it blocks
+ * until the per-queue reset completes the fence.
+ */
+void amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+				   struct pci_addr *pci, bool user_queue)
+{
+	const struct amdgpu_ip_block_version *ip_block;
+	const int write_length = 128;
+	const int pm4_dw = 256;
+	struct amdgpu_ring_context *ring_context;
+	int r = 0;
+
+	ip_block = get_ip_block(device_handle, ip_type);
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	if (user_queue) {
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_type);
+	} else {
+		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
+
+	ring_context->write_length = write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	ring_context->ring_id = 0;
+	ring_context->user_queue = user_queue;
+	igt_assert(ring_context->pm4);
+
+	r = amdgpu_bo_alloc_and_map_sync(device_handle,
+				    ring_context->write_length * sizeof(uint32_t),
+				    4096, AMDGPU_GEM_DOMAIN_GTT,
+				    AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+				    AMDGPU_VM_MTYPE_UC,
+				    &ring_context->bo,
+				    (void **)&ring_context->bo_cpu,
+				    &ring_context->bo_mc,
+				    &ring_context->va_handle,
+				    ring_context->timeline_syncobj_handle,
+				    ++ring_context->point, user_queue);
+	igt_assert_eq(r, 0);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+			ring_context->timeline_syncobj_handle,
+			ring_context->point);
+		igt_assert_eq(r, 0);
+	}
+
+	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+	ring_context->resources[0] = ring_context->bo;
+
+	gfx_ring_emit_priv_fault_hang(ip_block, ring_context);
 
 	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 0);
 
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index accbf2e41..6e69e62cb 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -37,5 +37,9 @@ amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_ty
 void
 amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
 			struct pci_addr *pci, bool user_queue);
+
+void
+amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+			      struct pci_addr *pci, bool user_queue);
 #endif
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 2adea2f58..6e8ac1511 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -426,6 +426,28 @@ struct amdgpu_ip_funcs {
 		bool wr_confirm
 	);
 
+	/*
+	 * Emit PACKET3_WAIT_REG_MEM for deadlock/hang tests. Uses FUNCTION(4)
+	 * for != comparison and polls ring_context->bo_mc (initialised to 0)
+	 * for a value that never arrives, hanging the queue for reset testing.
+	 */
+	int (*wait_reg_mem_hang)(
+		const struct amdgpu_ip_funcs *func,
+		const struct amdgpu_ring_context *context,
+		uint32_t *pm4_dw
+	);
+
+	/*
+	 * Emit an invalid opcode followed by a WAIT_REG_MEM hang for priv-fault
+	 * tests: the bad opcode raises CP_BAD_OPCODE_ERROR, then the queue hangs
+	 * cleanly so the driver recovers it with a per-queue reset.
+	 */
+	int (*priv_fault_hang)(
+		const struct amdgpu_ip_funcs *func,
+		const struct amdgpu_ring_context *context,
+		uint32_t *pm4_dw
+	);
+
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
index b3b708507..cec0f4d66 100644
--- a/lib/amdgpu/amd_ip_blocks_ex.c
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -217,6 +217,13 @@ static void gfx_write_data_mem_default(
 }
 
 
+static int gfx_ring_wait_reg_mem_hang(const struct amdgpu_ip_funcs *func,
+				      const struct amdgpu_ring_context *ring_context,
+				      uint32_t *pm4_dw);
+static int gfx_ring_priv_fault_hang(const struct amdgpu_ip_funcs *func,
+				    const struct amdgpu_ring_context *ring_context,
+				    uint32_t *pm4_dw);
+
 void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 {
 	funcs->gfx_program_compute = gfx_program_compute_default;
@@ -225,6 +232,10 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 	funcs->gfx_emit_nops = gfx_emit_nops_default;
 	funcs->gfx_write_data_mem = gfx_write_data_mem_default;
 
+	/* Deadlock/hang test hooks */
+	funcs->wait_reg_mem_hang = gfx_ring_wait_reg_mem_hang;
+	funcs->priv_fault_hang = gfx_ring_priv_fault_hang;
+
 	switch (funcs->family_id) {
 	case AMDGPU_FAMILY_RV:
 	case AMDGPU_FAMILY_NV:
@@ -251,3 +262,60 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 	}
 }
 
+/*
+ * Emit PACKET3_WAIT_REG_MEM for deadlock/hang tests. Uses FUNCTION(4) for !=
+ * comparison, polling a memory location (initialised to 0) for a value that
+ * never arrives, so the queue hangs cleanly for per-queue reset testing.
+ */
+static int
+gfx_ring_wait_reg_mem_hang(const struct amdgpu_ip_funcs *func,
+			   const struct amdgpu_ring_context *ring_context,
+			   uint32_t *pm4_dw)
+{
+	uint32_t i = *pm4_dw;
+
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = (WAIT_REG_MEM_MEM_SPACE(1) | /* memory */
+				  WAIT_REG_MEM_FUNCTION(4) | /* != */
+				  WAIT_REG_MEM_ENGINE(0));   /* me */
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc) & 0xfffffffc;
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = 0;          /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	*pm4_dw = i;
+
+	return 0;
+}
+
+/*
+ * Emit an invalid opcode followed by a WAIT_REG_MEM hang for priv-fault tests.
+ * The invalid opcode raises CP_BAD_OPCODE_ERROR (a gfx priv-fault) without
+ * running the CP off into memory, then the WAIT_REG_MEM hangs the queue cleanly.
+ */
+static int
+gfx_ring_priv_fault_hang(const struct amdgpu_ip_funcs *func,
+			 const struct amdgpu_ring_context *ring_context,
+			 uint32_t *pm4_dw)
+{
+	uint32_t i = *pm4_dw;
+
+	/* Invalid opcode: CP raises CP_BAD_OPCODE_ERROR (gfx priv-fault). */
+	ring_context->pm4[i++] = PACKET3(0xf2, 0);
+	ring_context->pm4[i++] = 0x0;
+
+	/* Then hang cleanly on a WAIT_REG_MEM that never completes. */
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = (WAIT_REG_MEM_MEM_SPACE(1) |
+				  WAIT_REG_MEM_FUNCTION(4) |
+				  WAIT_REG_MEM_ENGINE(0));
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc) & 0xfffffffc;
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = 0;          /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	*pm4_dw = i;
+
+	return 0;
+}
+
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 118948992..0d0e4ba6e 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -255,6 +255,15 @@ int igt_main()
 			amdgpu_hang_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
+
+	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-priv-fault");
+	igt_subtest_with_dynamic("amdgpu-gfx-priv-fault-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-gfx-priv-fault-umq")
+			amdgpu_priv_fault_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
+		}
+	}
 #endif
 
 	igt_fixture() {
-- 
2.49.0

