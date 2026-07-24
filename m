Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2390C531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 06:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E010F2D2;
	Fri, 24 Jul 2026 06:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pRWeRe2I";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013058.outbound.protection.outlook.com
 [40.93.196.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD84110F2CB
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 06:49:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+/oJXfR43v0m0FDlB1HI9BrumAPpF/Axsho0V7qkLcOI57lbNNhv+zre3UsuVq+/kd8ChZFJbhMUWtLoaKnv+aIkXZbAkv1DUQcB92e7x8QNmzI4xGH0be9YMPCem48a7VaA9wdJ9zM5VKNBMpHV2u/8UWgqLTeyGLAxni+JNYsZf3FDYI75R5M0fj8wvGLutp9/pWDuewTn3GcinQCnTeGq77wZGNr0dVwcd/e/xCNqPxbGxYA0uuFkevDNB3cDXkUUM+30ZnsiPukvkbji8S6UdkJ7zp7TTLPZJEDUHuit1M5MzgA9bQSSGEkdtDJi0aI6H6MoydYUiuPDAZH4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENIevLIRlCZHkxJElCcoBmR9SVkKShcHoq2IlpPGFMc=;
 b=Vb8cZQrpyvzAI1chsRlCvNj451Tv/BRudgIgFS/ri8thpUpkO1ZzGq+Qt7Flq1OSu0YcBUnqNRhf3TvxOklxmm96bqQNlJuIcirPfr1HmECyz0BdCk3GwbZk7lIrnkmLNM8NW+rofS9o+1i8kZCumnpC5Ku51d6sVwBvzJhDvINkMV9+OXyetXPAI902oGDsWQp1f4I0bvAaN+lLMIM869I0xT1zspLVmIu/246220FrgLfYoWRuo3cJXDokK1oxOhHeXuQHQCSOeL/ri8ayTQyuzeDpwsljL6tzaKLf/DMK5Eq8SdsGELlsVG4loEdOsHPyHOd6AyoVdvycRfXyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENIevLIRlCZHkxJElCcoBmR9SVkKShcHoq2IlpPGFMc=;
 b=pRWeRe2IVJjKNRnnL9+Wd3a2F91IQ3ZHOPxE66sYpOYs4UyfdoJr+AnjVj8YhjlA1fjT4c9CFshK9T/PPCewZnoLRJifCrEHMZc5ga2eyNKam1wxOQdZgC3TGw+GXg6Se0CYN/KpEgUJcplyWpp4FO7lmoOloP+clQADtSeoacY=
Received: from BN1PR13CA0013.namprd13.prod.outlook.com (2603:10b6:408:e2::18)
 by SA5PPFE91247D15.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:49:27 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::95) by BN1PR13CA0013.outlook.office365.com
 (2603:10b6:408:e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 06:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 06:49:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 01:49:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 01:49:25 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 01:49:19 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V3 3/3] tests/amdgpu/amd_deadlock: add gfx user-queue
 priv-instruction reset test
Date: Fri, 24 Jul 2026 14:48:24 +0800
Message-ID: <20260724064904.527135-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724064904.527135-1-Jesse.Zhang@amd.com>
References: <20260724064904.527135-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb96c1f-a5df-4d54-d2a6-08dee94fb3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: RSBvN1sWLgrTlPZWaLorRRzLk0j5+wI1m8ri6qymiMnQnNGnCqmaUpPwu4RXZ5LhccuWKWUKJjiZ3H4nHLEJh9uEbeDvA93he5y/LVe9ajUBUfdnCzqNaZIgJTXAxz6/Abe5QnMroBCOHtubLUi6c9A3rKJCBbVKxE7iQPuF2O2eaLjJmNSdLqscKAXhCk1AftST68eEw6h1H5MsuOGIbq1u1qXpab3lf5OMu+ILc3SOIzGY5wk8auzi+C/XCP3TwW4YvkJmb9fD/D3g4stvRRiJcLGFW6mC81/PbIDWqe+FsSeLij6BWLpPkYN25qdtg5Lhai52dQ+Aa/kNSCm3VtuSloNbQbsXtABFuXL1JpTfksvY6+qRaM3VygaFBlE3M1qyz3dYjcTv86NxG3BIf1W1+giWKzpp9OuekjyXQ74xgT2XgzM25r7Nq3wWW9XGPAitC0GIRVEI3e+Bnn3arRIzqPlfS+kswjkCCmJOZRTnsluahFro9f8GEQ0e3KBMDgfd5zQbeiWlB8p+x9oXYVnwUTOqc1l1orIeDryaQpcosk6W2tfQ0K/PFmMzd0DUwL3JdtwameRDNt5/pVKdLyv9Fr6V7GAKTz166FaNpci+smL6SCvEHfeCrrfx36rsy5tJ5AbXi0H2mLfBZ9nPJlsIOADOxQB9ubJ/iz7vJbpY4S07EzJoGraejr88X0qUf6bGNBupreGFweqsYMCPdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mLQikJtBPgLQndg2qy2TSPwK8TtQ8FE/uaIMivOiJHoFlI62hgLPGSJpnXV6xDMTMLsrDZPvPLpB/N4o9JzEAnFZF4ced/iR5GpYXAmWyOgagV4r4goNUuyQt8fiIkrKdpLsF2FdiQl7lU7dekW7478Re3F9jq2SphCeTkLhyRk2lrQLkgzCNVAtSO42pgY8QqAheHSwY5c+eWxrcQbvU3M+ZJLuSHxF70dws5eoB3vNM6xF+vX9nrYxKuxaOYThhecdjW8/RkQf7wCoiKDiOTmQW1amo5NMmBLcPmEi9sGl37bYnQlxfNzO1qU4xPY3zEd/TGtKm9m/KUoGiNj2tq7LDrEWqOnnCH7UqQ5UZq3T1HMVT63vPNwSxJKhKggo2t7QPEsDQ/95Ls3AHtFnT0FxeFJmL6HnsWvTq9PTXqFbgh1MlV4vUHL8++poeHl2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:49:26.1824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb96c1f-a5df-4d54-d2a6-08dee94fb3d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15
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

Add amdgpu-gfx-priv-inst-umq, a companion to amdgpu-gfx-priv-fault-umq that
exercises a different gfx fault class. It raises a privileged-instruction fault
by launching a privileged INDIRECT_BUFFER (PRIV bit set) from an unprivileged
user queue, followed by a WAIT_REG_MEM that never completes. The queue hangs
cleanly without the CP running off into memory, so the driver recovers it with a
per-queue reset (no full GPU reset). Verified on GFX11/navi31 and GFX12/navi48.

The fault packet is emitted through a new priv_inst_hang IP-block hook
(gfx_ring_priv_inst_hang), mirroring the existing priv_fault_hang path.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 81 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |  4 ++
 lib/amdgpu/amd_ip_blocks.h        | 12 +++++
 lib/amdgpu/amd_ip_blocks_ex.c     | 39 +++++++++++++++
 tests/amdgpu/amd_deadlock.c       |  9 ++++
 5 files changed, 145 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 92d816e13..71c82aa91 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -519,6 +519,16 @@ static void gfx_ring_emit_priv_fault_hang(
 	ring_context->pm4_dw = i;
 }
 
+static void gfx_ring_emit_priv_inst_hang(
+	const struct amdgpu_ip_block_version *ip_block,
+	struct amdgpu_ring_context *ring_context)
+{
+	uint32_t i = 0;
+
+	ip_block->funcs->priv_inst_hang(ip_block->funcs, ring_context, &i);
+	ring_context->pm4_dw = i;
+}
+
 /*
  * Fault a user queue with an invalid opcode followed by an endless wait: the
  * bad opcode raises the gfx priv-fault interrupt and the wait hangs the queue
@@ -590,6 +600,77 @@ void amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned
 	}
 }
 
+/*
+ * Fault a user queue with a privileged INDIRECT_BUFFER (priv-instruction fault)
+ * followed by an endless wait: the privileged IB launch raises a fault interrupt
+ * and the wait hangs the queue cleanly, so the driver recovers it with a
+ * per-queue reset (no full GPU reset). The submit uses the normal (synchronised)
+ * path so it blocks until the per-queue reset completes the fence.
+ */
+void amdgpu_priv_inst_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+				  struct pci_addr *pci, bool user_queue)
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
+	gfx_ring_emit_priv_inst_hang(ip_block, ring_context);
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
 #define MAX_DMABUF_COUNT 0x20000
 #define MAX_DWORD_COUNT 256
 
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 6e69e62cb..69c321ef6 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -41,5 +41,9 @@ amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type
 void
 amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
 			      struct pci_addr *pci, bool user_queue);
+
+void
+amdgpu_priv_inst_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+			     struct pci_addr *pci, bool user_queue);
 #endif
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 6e8ac1511..427010c2d 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -448,6 +448,18 @@ struct amdgpu_ip_funcs {
 		uint32_t *pm4_dw
 	);
 
+	/*
+	 * Emit a privileged INDIRECT_BUFFER (PRIV bit) from an unprivileged user
+	 * queue followed by a WAIT_REG_MEM hang: this raises a priv-instruction
+	 * fault and the queue then hangs cleanly, so the driver recovers it with a
+	 * per-queue reset.
+	 */
+	int (*priv_inst_hang)(
+		const struct amdgpu_ip_funcs *func,
+		const struct amdgpu_ring_context *context,
+		uint32_t *pm4_dw
+	);
+
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
index cec0f4d66..4655d9dcc 100644
--- a/lib/amdgpu/amd_ip_blocks_ex.c
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -224,6 +224,10 @@ static int gfx_ring_priv_fault_hang(const struct amdgpu_ip_funcs *func,
 				    const struct amdgpu_ring_context *ring_context,
 				    uint32_t *pm4_dw);
 
+static int gfx_ring_priv_inst_hang(const struct amdgpu_ip_funcs *func,
+				   const struct amdgpu_ring_context *ring_context,
+				   uint32_t *pm4_dw);
+
 void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 {
 	funcs->gfx_program_compute = gfx_program_compute_default;
@@ -235,6 +239,7 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 	/* Deadlock/hang test hooks */
 	funcs->wait_reg_mem_hang = gfx_ring_wait_reg_mem_hang;
 	funcs->priv_fault_hang = gfx_ring_priv_fault_hang;
+	funcs->priv_inst_hang = gfx_ring_priv_inst_hang;
 
 	switch (funcs->family_id) {
 	case AMDGPU_FAMILY_RV:
@@ -288,6 +293,40 @@ gfx_ring_wait_reg_mem_hang(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+/*
+ * Emit a privileged INDIRECT_BUFFER (PRIV bit set) launched from an
+ * unprivileged user queue, followed by a WAIT_REG_MEM hang. The privileged IB
+ * launch is rejected by the CP with a fault interrupt and the queue then hangs
+ * cleanly, so the driver recovers it with a per-queue reset.
+ */
+static int
+gfx_ring_priv_inst_hang(const struct amdgpu_ip_funcs *func,
+			const struct amdgpu_ring_context *ring_context,
+			uint32_t *pm4_dw)
+{
+	uint32_t i = *pm4_dw;
+
+	/* Privileged IB launch on an unprivileged UMQ -> priv-instruction fault. */
+	ring_context->pm4[i++] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc) & 0xfffffffc;
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	ring_context->pm4[i++] = 4 | (1u << 31); /* IB size (dwords) | PRIV bit */
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
 /*
  * Emit an invalid opcode followed by a WAIT_REG_MEM hang for priv-fault tests.
  * The invalid opcode raises CP_BAD_OPCODE_ERROR (a gfx priv-fault) without
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 0d0e4ba6e..1d729eeb4 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -264,6 +264,15 @@ int igt_main()
 			amdgpu_priv_fault_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
 		}
 	}
+
+	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-privileged-instruction-fault");
+	igt_subtest_with_dynamic("amdgpu-gfx-priv-inst-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-gfx-priv-inst-umq")
+			amdgpu_priv_inst_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
+		}
+	}
 #endif
 
 	igt_fixture() {
-- 
2.49.0

