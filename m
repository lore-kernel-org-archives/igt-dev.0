Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122FBC531C9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 06:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CB810F2CD;
	Fri, 24 Jul 2026 06:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xWQKnQd5";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010015.outbound.protection.outlook.com
 [52.101.193.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F7810F2CB
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 06:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn3cVO5pgEq8R+heXPH1yVSYvBGJ7LuRd08YvZEBwQ0xy2M9Oo9j/9pdUpCWJOuR1zPtI08RmJUiiwStoFbFhOftjYv+mYBbf1wskOia0sqym+Vxulg7po1g2xY0gVqeXnQ5U6FnTmStYM/B1D0frbXzCVwk+C2QH6zTlY6a/sDl7uqZHt2/xwz/i4SHF0qj2iKCggxob91PrHFADqYjd/9ZalEA60TUos4qUVyTregIFao8rwXebt4/cd2neSAGTFY2gmgXuP7vkgbI8SBt05kp6r695K7i1pTP5envWolAWLuSmKiWLMxxm2W48sJ1LySxX6VspuTpQvQ9MeV23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOHkBCP+qnfsi6KlL7TJ0+u+Ri5BX7sDVrYVMUVcLiE=;
 b=h+N2QYy1VRUZl4K4l+DxeaS1SEE2N23O66Wk8kCGTDDoO6eUbqMU0Y6F77h/P8WN2SCBkHBW8A3mvcSxWHdqYPOYviOEUdF6Xl/PrbRZPmCXkAQyxTvUNPNoXHK5jvdj23nhizgQzRHHH6mmPSrUTAwi3txqt/gwRzTS0u11NNI5RpqxWOBtE9ndkupLxTDNq+EC66kEi2EOiXyZ5g+NmwE4gzDLEgDcjjJbQg9Y+yjWw6nXmuPOdE27MyERtUKYeAYBc+qKf7XwQDyHeamtV9PTgs7rkuAdgiEEYEIzV9mZcobX6sEFShDt/x9DcIb1ZMPJNCqBCUM0PrmEj+2Iwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOHkBCP+qnfsi6KlL7TJ0+u+Ri5BX7sDVrYVMUVcLiE=;
 b=xWQKnQd5ZiDDE+eb00K3WkwjZZVAK7sHaGEME/3myznIHlo7Xi4epinCtNlMWWtsCW0Noi5SvmgXKRut7EpAckdmlvAWQHheFMwKV3BVLcuTjBXgw9G+Dz9NRicqPKyiva6ai8sHpyPls/55bTIgAGPsSV2rtB4+Nn/cBh+criA=
Received: from MN0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::20)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:49:19 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::83) by MN0P221CA0029.outlook.office365.com
 (2603:10b6:208:52a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 06:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 06:49:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 01:49:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 01:49:18 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 01:49:12 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V3 2/3] tests/amdgpu/amd_deadlock: add gfx user-queue
 priv-fault reset test
Date: Fri, 24 Jul 2026 14:48:23 +0800
Message-ID: <20260724064904.527135-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724064904.527135-1-Jesse.Zhang@amd.com>
References: <20260724064904.527135-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MN2PR12MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: 8734617f-9fe5-4713-07f8-08dee94fafa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cAE+zq4Nv01FyHGfcIf/vFZY0OqsvpqzgJHslkvFN+ubbYxdb0Etyo0JymLmEHEGlAZGgW3RS5Q7hLC0o5WvUaec7XCCVTcakymJzWmcg0aCX3kdhZzl2Nxla1/WqfOU0b2cDx7UJbjpvKrdb7SrrY1vSvi4A4EyvGJimP9hf1PSjRu2Fk/2ueTjufY5DRiIue3qFBE3RF9rlYBGGrL2hrSLOFZRZgxLZ3fcpTyrlAP168bRYDTGOz7R0Y1FJoRp5Q4dXXsaQcRIVPjDNhbPYRkbblmSlEBR3ngxLlFzRe12hZT9D2Zk5gKUiguIs1dXSZUSsv9PrSsIRYpkuQnqQd2pJ4KOc+qHgK5mP5R+wim1mrg3xTlvorGWFVfyB2Jferl1yLZxlXclbExTZ0GCB14oECKlRWIq2umXpIeRbUN5E/kbnWrjt8LbVbG50WDBiPfbtTFl5Jhw+xNBPIIAoEgE0Twj/HR4aGhHBfVwZnoDzR29ZplfUxMuVHadJvWUoutk493WK3rEUNwrXPC7ugt19rvguUDprk2A+avOIyaq2d/RA7kMiB/RxMSv8JM9Px5FGr+k4OBf7zc1JdlCpIK4cnp/6Oiv6gbh8GdZVxxEAtflt9CcpFUGfNUDtc9WFNHTl1NhLws0St+K8JSxokFkpwH63+q5BtjKYZ32JtGwV1X7l6UjwTiGKkTCCZA8CeAoyBXi7n/46m9+QMnJ8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wZ6KXiDrzI79cNOfgboETfxFeV58QuwSN8Y0cek1tNJHO/4vz8/BdD9793PyOWlKf6wjO6sXn0QoAZp9xTexOrFTa/MR+qo763F4vdMRXU9XwU8VxH1xvarb3PNR8fMc8lLFkdu2iGiGbbmMwKee6ds9kiBtOHlLvrJ49xpV03/ayt0U5tppUamk2DRueZVlorarakVK62HCKuSTPlABKCw+LbBNw+RGkABiZX9JL+S7f0ddexkG26ziLJVvlyr/B+Y5uN54bHfllUJ9XkZfBVbcrh6YOKAP8ZF8KTjxe7MXn+KFnyohwbvz4oOwzuqvCUfgPFaPBYkH9MDxRfEsYOIJDN7qHpvfIM3eSk7ORi97be1sjBdtFxDvY3Q8mIBSNJ9UgJ6lGbwE/P5sJhS592yVKKtiGGTK0X9yO/0cgcxf2wITMke7wVA7KWzovyZW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:49:19.1086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8734617f-9fe5-4713-07f8-08dee94fafa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

