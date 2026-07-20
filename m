Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0675EC44525
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 09:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9772E10E177;
	Mon, 20 Jul 2026 09:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dYFVkUEq";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C6A10E169
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 09:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfSN7yEDgf2yFQffH5e0phQQx84tB8pnzF6p4tfsduzZmUPI53x9KssKFTZ40grSeHenOMd6/QCAHC1TCVw4beyUBfRo3hB+HrIuwUTQWKiDvSw6bw2Her2Ng/ert7wmL5YOmx/BH26AmIltXjW0Al+RYD3fe8K4HEajJXqA6/onYiJuXoGbG61utn4HApG5ZY7u6BCo57npfMxR7kGLr9nGewt9MEDyR7yqHwu+JeA6GkSyaeRqWPkwYR7qBa1rwwpahs42Nu/hNwK6JDfKbYnRKAUynkVQY2k6BXyD32Mbr8CF0hN2A5t1MingixoXtqzGQHESHzLm/KrEpxTKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgOr3huoesQzeP1QqMmynGW64rE02peCJ06G2j8lZJ0=;
 b=aXlbODz1DbyOjK6dc6sdIDim1i6oUJQoDQvZWN/R4aqEmjbUQbLehVuxzOC6sMwN20xrFSE+pmqri3BeVwNO912QB5+m1/5mqurFjOykb1nrnFxbb9AwBd6IidE+jgKcskVxE4SyYAJ0WWsxu2JvLsw5K9HeWOsJvKi/444vVPG8pUqHwIe5ieHI6hExNg4e5AATcQhtkzSO3enKFm5UKgrckzsYfJGxHPCmhH16miR/zRuj77F6c6jZJdJrVzZPzd7Pk3i51nR8GNfRw4K+RZPeTV+D1XRgnPThCkKk3hlJnxf21NnO0eRcjCumdbJE0h8omE4i7FhzZgtyr15ohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgOr3huoesQzeP1QqMmynGW64rE02peCJ06G2j8lZJ0=;
 b=dYFVkUEqmmRhWQ6qwzeIYK7x7PHLgxWNfvA8eAd8NnsUnd4IK0w8uKBuhxav3+IenEgbV5MYaiVtl/TbS7lcnxbh9zTVrltzIe0+nVpkoYkkaXnP/y32MdjijIZxzeCHHwleS6E+tRoXRkSoHxrINv0NUdqvL9IXorWck2I/YgM=
Received: from MW4PR03CA0125.namprd03.prod.outlook.com (2603:10b6:303:8c::10)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:56:07 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::13) by MW4PR03CA0125.outlook.office365.com
 (2603:10b6:303:8c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 09:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 09:56:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 04:56:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:56:02 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 04:55:56 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 1/2] tests/amdgpu/amd_deadlock: add gfx user-queue
 clean-hang reset test
Date: Mon, 20 Jul 2026 17:55:41 +0800
Message-ID: <20260720095555.1537413-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 3520bcbd-7deb-4eb7-bad1-08dee6451e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: DSGvLMW8dVcr6ZzsEsUFIFmE7Fl+UriebRPWMILlVk66zkLFBQhCsTwE+2H1P1NxQ2CIgmoc8ojIorBKJcVr68TdaNv1a4lCLfg5AMQYHBFsyRZwKQVez5geevm1JktXF9Pb/poR38rjR/XCqg4Xo4oPCCmwhpyJAMV7MgyZM/VtcwuA8VcKO5SvcfK16uANoNeS8MMkVs1e2PI3QvM+T0Bc9xifhUfyZflkFSbq+ZLUYJ41P1ksJUlIg6M5TuSHITx8ubqffbg90oGMs5eHSh4DD8RQagno1CLPjdCjaoQcOlWdxj++EfnvSuu+hvODZyNl6MU+RBVz9qO3AdKKHMmJtIUQFTuI6JBnnQ9jrGCoJo9pPuMR3+GLGSinBEsVGv4IcmmvkCgTIUhGbmBhLIG06U1qP45D5b1RCaKvoLoobaWATxc9PHM1Oeh7XyqpXqCMhZ71CoWUq8HTzAIoHV0qbPbmWlrc2lZJ8Lx8nVam27onexNwvuK91H57pjfs8jg5Dp2NO/DLOyEJPBGKyb3kXO9Psb/gECL+RHBC6UfOp21MXuOYuIxYHQVi4gZ2vEmQB7XGhmz2WK4naw7AztK+75goOV/ymm9es5h1hNSGzc/VGUZ/RNsBYb1BnbaXHkziLMqnQ8abFp0vmm88JbopGjE8k93m/eO8WFBqXM/3hqzWWnuOD2ClYz6fsJJi
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TsogaOAgDURVf3HJGCmxMs6iapZxinnCflatTzbx99dj6G+YgjyztIRNsMEtl740/eTUQIFwxx4clGzrHwcP6BdCFIPrlIszRh0d5G+uhCmQm77k8kxVAEotIHpdOUjLMe0ochOC4k/axcgLbfXod0m0OdwNvE/c5cuBuyUjNAF7ILOEpPF1YfWk0nKejgQnBlTeatWh0kNV4wX4KFZKOqwYVYIY7EyN8IMe+K4itNKXG6LHkuaOEtXrGNir4AF52vl1bjmD21+xp+ZD8P2I4b6GgpX/2p57AaoTjc8J9/2lpK315e4gV5VwysbKSMkErBbr+WfIMBu7Ys6ODfXv9Wmx0ft70Qc6Tur3G1kVDPcnc32I053ymHp6a4YMjl1wTCPUCgdt2fVsFjrkR4eMbV+F237qudOfTJmMGaIY3tylywggq1RkREW1Vg8/2N6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:56:07.2451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3520bcbd-7deb-4eb7-bad1-08dee6451e9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712
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

Submit a gfx user-queue job whose only packet is a WAIT_REG_MEM that never
completes (polls a resident BO for a value that never arrives). The queue
hangs with no fault, so the driver recovers it with a per-queue reset. Add
it as the amdgpu-deadlock-gfx-umq subtest, gated on AMDGPU_ENABLE_USERQTEST
and per-queue reset capability.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 91 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |  4 ++
 tests/amdgpu/amd_deadlock.c       |  9 +++
 3 files changed, 104 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 06c577085..c679e60c7 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -412,6 +412,97 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	}
 }
 
+/*
+ * Emit a WAIT_REG_MEM that waits forever: poll bo_mc (initialised to 0) for a
+ * value != 0. This is a valid packet that never completes, i.e. a clean hang
+ * with no page fault, so it can be recovered by a per-queue reset.
+ */
+static void gfx_ring_emit_wait_reg_mem_hang(struct amdgpu_ring_context *ring_context)
+{
+	uint32_t i = 0;
+
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = WAIT_REG_MEM_MEM_SPACE(1)  | /* memory */
+				 WAIT_REG_MEM_FUNCTION(4)  | /* != */
+				 WAIT_REG_MEM_ENGINE(0);     /* me */
+	ring_context->pm4[i++] = ring_context->bo_mc & 0xfffffffc;
+	ring_context->pm4[i++] = (ring_context->bo_mc >> 32) & 0xffffffff;
+	ring_context->pm4[i++] = 0;          /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
+	ring_context->pm4_dw = i;
+}
+
+/*
+ * Submit a single job that hangs the queue on a WAIT_REG_MEM (no fault) and
+ * let per-queue reset recover it. Uses the normal (synchronised) submit path
+ * so the CP actually runs the packet.
+ */
+void amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+			     struct pci_addr *pci, bool user_queue)
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
+	/* the memory the queue polls stays 0, so the queue hangs */
+	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+	ring_context->resources[0] = ring_context->bo;
+
+	gfx_ring_emit_wait_reg_mem_hang(ring_context);
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
index c46ebb67b..accbf2e41 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -33,5 +33,9 @@ bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_erro
 
 void
 amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
+
+void
+amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+			struct pci_addr *pci, bool user_queue);
 #endif
 
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 5325c0ade..118948992 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -246,6 +246,15 @@ int igt_main()
 			amdgpu_wait_memory_helper(device, AMDGPU_HW_IP_DMA, &pci, true);
 		}
 	}
+
+	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-gfx-user-queue");
+	igt_subtest_with_dynamic("amdgpu-deadlock-gfx-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-gfx-umq")
+			amdgpu_hang_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
+		}
+	}
 #endif
 
 	igt_fixture() {
-- 
2.49.0

