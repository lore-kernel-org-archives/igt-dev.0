Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B85C4451C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 06:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D577210E2AC;
	Wed, 22 Jul 2026 06:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QvRwZwBi";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013060.outbound.protection.outlook.com
 [40.93.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62210E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 06:21:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocalVXo5oEjSNGe1QCjyhB0CxxP5D8U5yshH04tJqc/hEVxFyrAZUpOgogN3jtWmj4nzYWOGRDl3mlmCl1zWXkjdi87GmyFB7aIcm/yneqGsz7GFSyWuCl6xcFg8cIQWo7HaLQ39GU2JIkgMEmMb9Hj4U6Vawfok4G8mo1BAM2luV7Wr23C6HLK4gh57ZY+ukbEiqFSo8x+gCXa6iPUy1SIlg/rmh1ukuBbdQEg8fZmTV+/nd+L/l2Ok7LvI2oO0kF+gc3qy3EQLzdTYwu6N3SSeZt4jMxLC414lrK3nhz6JVcOdpl7/WtWZ/WteNynBQQz0tejpbqjBjw2LCaRPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNNhvdjAkaf5cmPPqGMRk22Mpza8SPp7zd59PyaUVRE=;
 b=ZYVRJ+d4FYunmqNcpWMi65sKxvAYw6q/9LwN+Ire1ilqObsNXQrsi+G4UW+ripJ5rqLrJWmo4B6WdqhKpuJEuZkWcdZ7HAwVDwZbf/uKASbaHIe8MY6HhQOwNRrUIfJ/OSlbjFS1oqmxklVc9Xenv3tvOM4+PLVnfM7MWB2gt7uQDY4RzyCDT/ohsm3fKFQzLoLRW9BXR2CZNAfG5Ky6QFvFS+B/m4cfJi8Vvf+PRq+pgIv+jiB5u8t00MfJoAje73ZokhNxcpuymaVQszZ4hjUfy2lWaYCF/Cn/65mZlJgJRs1K8gu3/6NiKEpT4LwTnCmy/2gN/lDb6igJ78pxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNNhvdjAkaf5cmPPqGMRk22Mpza8SPp7zd59PyaUVRE=;
 b=QvRwZwBiFcBcEvvWCdCvTOZe7SvwVFuvnZ15KDWoWFQI10oqBW0C6BQEl5b7F+tSDLrv7RCdms6pn1SxIWDvA+VBPRyIwiWDUJ4fppRJbbYH1mA/f4fawSsJZ+euyhI0YqjeZjzmEiB03C2DF2aIvzP9XFnOHzL/9Ybl+y/Dv80=
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:21:45 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::6d) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 06:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 06:21:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 22 Jul
 2026 01:21:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 23:21:44 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 22 Jul 2026 01:21:37 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V2 1/2] tests/amdgpu/amd_deadlock: add gfx user-queue
 clean-hang reset test
Date: Wed, 22 Jul 2026 14:21:14 +0800
Message-ID: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: b1138cd3-a21a-4479-8672-08dee7b980f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: AcImaOmC7MWsZahdDlwFHkboUdQ1XXdqI+kkYCRmAv+J+kd5kyvVqM3bh0Vch5M6+a7Y6PIdcLSnA3NJeALSaVqRnaXhd2grHvkYXXmakUsU1YkBUpuNqqCBOl8besMVBL7J3NqfNgRGX3JICEHXeQLwGHaOpuHDlQx+ZodUgipMNnLs3QhWpDx2b+SyCWClNrH4nYCSy+Gbyx8hYaNW4Or92CgAbGg3mdRgBABhUiGAkWTOV1aCY8iaJbJFpGpdLFeKRsrQ3C5GpINCTwv+ilLLl3xex+WLSeTzuNUwDS21pV0W27L/MqC2tjHoM3FxzQhOfvNSN6/bILvhJOabF+S3w88RiqTNDQp4UD/uLsuwoHRprQvH8whq0HjHIODWLh9WTxiA7DiWp8ecL59xZsVP4e8trKvNDc0bpwZmtKKxxBjAJY6FMeaFIMIYtfSZVuc5D9Cw6j4T2RBh4WBpJplHeht/1HNn92kCSdhnBVkATKpkUPnESALR0qkUNmkuWymNw4HA6Fa+lzIohDSHEmhNgZPX7D8MMMo7tuy31Ld/HBOZJn934a6eAC6R4cwgFQ6iNgqQibZKnJ3aXP+XC6GmjdArwJvFpeEOYQ8vxlLyqeHqzIXC8MkAcMKprCcjY/Ey5Nsu3OnvSC+yDZq8TLGfK3ESq4wkkdfJWbCEaj/26UKNPPqLj+7SnOnbg1yD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xBCwrWJikpUjisH0XgqcZc5Z+x06EbOFly2tduXaebkau2pTp/2M9ZAR3d09A2oXJ060zZS+LyK7mDAXuJ7kSaT42yRiL8IBudB9olJQYz+3560W7D7cr6XBdW4fXBu6SrqLyA80QAZ1+gy8H3g9e1jPeoOqdJ5rx7OK8hsHQC/PtRwOpayuv/j0ps1EqLEG8xwU21CZiTCRt1OTpBtHdRpSm8VtR4U9O/igIpY5JGEOngW+01ogB1B2u2yFP0h9thQdPXgja0oyqz8AvAyqRMerjhz3CFMCQqEjPF2ekEI5U1LVjDgRLm22lzqybwbzWceiMiFH1eMOh0oPQyFvPb5FxwX1yp6j1w49jgLlvvtvb/eXwQ6AqQP+l4g0KypjTQqlD79jV8+JcDfaIqvtouhGwxH2u8/LYz56GZPj2QJNeOgoljvpjlDdPvRMAjcC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:21:45.1009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1138cd3-a21a-4479-8672-08dee7b980f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
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

v2: refactor deadlock helper to use standard bit macros (Vitaly)

Co-developed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 100 ++++++++++++++++++++++++++++--
 lib/amdgpu/amd_deadlock_helpers.h |   4 ++
 tests/amdgpu/amd_deadlock.c       |   9 +++
 3 files changed, 109 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 06c577085..4395fc527 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -14,6 +14,7 @@
 #include "amd_memory.h"
 #include "amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "ioctl_wrappers.h"
 
 #define MAX_JOB_COUNT 20
 
@@ -150,8 +151,8 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 							  WAIT_REG_MEM_ENGINE(0)/* me */));
 	}
 
-	base_cmd->emit(base_cmd, (ib_result_mc_address + MEMORY_OFFSET * 4) & 0xfffffffc);
-	base_cmd->emit(base_cmd, ((ib_result_mc_address + MEMORY_OFFSET * 4) >> 32) & 0xffffffff);
+	base_cmd->emit(base_cmd, lower_32_bits(ib_result_mc_address + MEMORY_OFFSET * 4) & 0xfffffffc);
+	base_cmd->emit(base_cmd, upper_32_bits(ib_result_mc_address + MEMORY_OFFSET * 4));
 
 	base_cmd->emit(base_cmd, 0);/* reference value */
 	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
@@ -412,6 +413,97 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
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
+	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc) & 0xfffffffc;
+	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
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
 
@@ -481,10 +573,10 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 			/* override  addr of buf1 and buf 2 in order to copy from buf2 to buf1 */
 			base_cmd->emit_at_offset(base_cmd, (0xffffffff & ring_context->bo_mc2), (offset - 4));
 			base_cmd->emit_at_offset(base_cmd,
-					((0xffffffff00000000 & ring_context->bo_mc2) >> 32), (offset - 3));
+					upper_32_bits(ring_context->bo_mc2), (offset - 3));
 			base_cmd->emit_at_offset(base_cmd, (0xffffffff & ring_context->bo_mc), (offset - 2));
 			base_cmd->emit_at_offset(base_cmd,
-					((0xffffffff00000000 & ring_context->bo_mc) >> 32), (offset - 1));
+					upper_32_bits(ring_context->bo_mc), (offset - 1));
 			ring_context->pm4 += ring_context->pm4_dw;
 		}
 		/* restore pm4 */
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

