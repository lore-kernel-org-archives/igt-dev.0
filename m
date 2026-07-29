Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE68C53219
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 06:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D326B10EAAC;
	Wed, 29 Jul 2026 06:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="23Eayqwd";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCFE10EAAD
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 06:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wls/esX0s0KaL4SPLK77CYR+1EvYyR7zcVQSEPLfd/YE40Rmi/26QoiP53cuUflRrwBrypn2PUuysBdMf1VMFlYwDAhg/B8zgo+4zUt92r2e/na4K7s70mxQnRQQ7oH7l0lgBv6SrNnR24B9kgg7axog/G78PYLdBX1Ljv6VvSEa5OQh+OUgIphMdYNOv25cj7qLWNTxiEO3vm5lFspD3QhPIjlzGkSrkhalUqSC9FOUk8WnsWtMoBTZpw0I0VB7QFTRxkR1RDAt8L0xwbLUfz8HxWwqGbYFHSdY9Wsd3hgq11Ag3ukB51NFSSlvEPW96EHBmX/pRmTIsjGUZJdRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YysZ9yAHQozfdaGjIRLQAJM/tigQSvgyy8Ljeky8QZk=;
 b=eRfgb8u85yWFTI1MUuhIIloBjZIaQg4LIP4NoNiyyQBWz6rK7m4mSmNOdtQcemn5Av4AhkKKijEfymcFlctK+RVXLJnSB/zx/LtAzNnc97wXguLU+kFY866SsqQQOAJBp0BwY/4i7iV7ofDMUoG6k30YPHXiMP20O1HqyvUW8HG/9YPhgjgMXNzV5ZfVpoHPU+DYSQAH9+FVR1Kd9jL2VtDVofHJcdSgTQVmQ8Y0PKd8cSH4sjGVjAk+mmmktcfVCH5sdxZEmfwwPkOOWSgT1F49F7BWdxO7zVb1TBOUqo+fVcst029+NLRh52Wy/AJR99pz/aJIMSCiJjZDItJzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YysZ9yAHQozfdaGjIRLQAJM/tigQSvgyy8Ljeky8QZk=;
 b=23EayqwdY+fiJHLyn6r66b5ycgLFkQsytD8/03MJzh0wUMuTpMApXf2/jMZX9YTI3BAqB7CdT9cWWbPYdyKIbZOtUWb82bO3QLzx27nhvGX3XTNfAZinhsP3bz10wCoI9iEn3Egk5UPsnwFVGPzsz7IkNk9auSil/BO3xlSiGGA=
Received: from CYXPR02CA0064.namprd02.prod.outlook.com (2603:10b6:930:cd::24)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:39:37 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:cd:cafe::88) by CYXPR02CA0064.outlook.office365.com
 (2603:10b6:930:cd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 06:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 06:39:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 01:39:36 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 29 Jul 2026 01:39:29 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_deadlock: add gfx bad-opcode
 non-zero-count reset test
Date: Wed, 29 Jul 2026 14:38:14 +0800
Message-ID: <20260729063923.892313-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e7a86e-929f-4e0f-99df-08deed3c28a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|11063799006|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: L7cOzScOmvzMXNBvJo1SQ6HbztyA1Tw0SsCLH16qGbasEaJYp1YJTGkE4yZn4eB2MnFQYym4LPAJzpQM/5NlzeYghT58GPfVnIv6zuawHK7lreucGZ5AJxhoMuBJec6MTb6fuNWD5ntZHkhH5wq+dclb4B6KjBKRpWE7k9NfyxH2YrU7sMCYhVO1ybSdOhjYRFEBAHTSVIRusB+DLW3/mQgXOzM4MxjN5JfN9izTvOeEVuZR/9Z1p/3VBD5PWFy1Tw/gJJP8E6egHPVRq+ARGGNKmjoWewO3df+7jNTbw1Y4IDkl2gpApVvGEcmj6E2FKJbvUZaPLXLliAmppfsDEidCSL5uL1dP/sDbu2IHhcsgbsaimYQSnSOGxxgCxZPY6hKNOFGAFHmVMo7SO0R3vxtFfLPujU3o0rtpBRScKlGMkUX9Jmy1zEdY1/VQd/VmqGfzkpaW2E17qYhXtUUosTLANnwgjrp9CA9RYddyz8rLWdxp751ZKMutVFwpst2jeR2nMaHAc3TvA8EJ0/5+VwK1vPwm/UHHe4GJhNNajCjCShb9IUgX0l+jO9ovnC9ctO61tSh5rqrg//i7DI4mncsQo4mEHQzxBbOTcVxNZSsmUcorlqxXyJsWWorxTXUdzJggsgCi0030/HgwdULWcPiY2Jqmek8lt6I5RDVdcMmqXOEsuAqo6WZHt1RVYsi4
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6vXG1nPc2V3R/nur4CDOvuks89UsdLmeMxQHXJaJGXw22DhbqgZ6Y5LMr2x/RfcXpzmb5ZNdsA+KovUJ+SX+kQCa3fOTW1roNjWYCrG4D2lEM2YCtBHCAAvZuUcYU4YGemlpjuLDzBvXeqeXYIPyFoRrvcfVyriyS5v/MmmV9zcfdmcs7KT6iZlRRElEMELngxUYUS8DJjyhjK81GybenbSYjuq4ksiNNPJ1Qt7y6dnae5S33rYq7YNnAMk3YlTDm7tMhX2CrjAmdLSRmi+IyMnJA9KwcpjjqsRJHTdRQZe1UEEgzhZrrxYRAiUBPDV7crLpncfd9iKm6cEtk5btwK/E22gZ8tB7BJzUuc3u5Zfbst1L19K/Yz2oI/g2es8/l/aluL+5oyqz8UVqeLfSxeRbk3TgQSnT4e7sfmkiLpAeJ8Fbbgubo59236dwQVjg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:39:36.8188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e7a86e-929f-4e0f-99df-08deed3c28a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
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

Add amdgpu-gfx-priv-fault-badcount-umq: a gfx user-queue bad opcode (0xf2)
whose PACKET3 header carries a non-zero count field but no body. The pipe HW
cannot find the packet end and stalls mid-packet, so a per-queue (vmid) reset
cannot recover it -- only a gfx pipe reset can (once that FW support lands).
Until then the case escalates to a full GPU reset.

Add a priv_fault_badcount_hang IP-block hook to emit the packet.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 80 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |  4 ++
 lib/amdgpu/amd_ip_blocks.h        | 11 +++++
 lib/amdgpu/amd_ip_blocks_ex.c     | 24 ++++++++++
 tests/amdgpu/amd_deadlock.c       |  9 ++++
 5 files changed, 128 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 71c82aa91..1ce46422f 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -529,6 +529,16 @@ static void gfx_ring_emit_priv_inst_hang(
 	ring_context->pm4_dw = i;
 }
 
+static void gfx_ring_emit_priv_fault_badcount_hang(
+	const struct amdgpu_ip_block_version *ip_block,
+	struct amdgpu_ring_context *ring_context)
+{
+	uint32_t i = 0;
+
+	ip_block->funcs->priv_fault_badcount_hang(ip_block->funcs, ring_context, &i);
+	ring_context->pm4_dw = i;
+}
+
 /*
  * Fault a user queue with an invalid opcode followed by an endless wait: the
  * bad opcode raises the gfx priv-fault interrupt and the wait hangs the queue
@@ -600,6 +610,76 @@ void amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned
 	}
 }
 
+/*
+ * Fault a user queue with a bad opcode carrying a non-zero count field and no
+ * body: the pipe HW cannot find the packet end and stalls mid-packet, so a
+ * per-queue (vmid) reset cannot recover it -- only a gfx pipe reset can (once
+ * that FW support is ready). Until then the case escalates to a full GPU reset.
+ */
+void amdgpu_priv_fault_badcount_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+					    struct pci_addr *pci, bool user_queue)
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
+	gfx_ring_emit_priv_fault_badcount_hang(ip_block, ring_context);
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
 /*
  * Fault a user queue with a privileged INDIRECT_BUFFER (priv-instruction fault)
  * followed by an endless wait: the privileged IB launch raises a fault interrupt
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 69c321ef6..0fd5eb59a 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -42,6 +42,10 @@ void
 amdgpu_priv_fault_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
 			      struct pci_addr *pci, bool user_queue);
 
+void
+amdgpu_priv_fault_badcount_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
+				       struct pci_addr *pci, bool user_queue);
+
 void
 amdgpu_priv_inst_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
 			     struct pci_addr *pci, bool user_queue);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 427010c2d..40a9735be 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -460,6 +460,17 @@ struct amdgpu_ip_funcs {
 		uint32_t *pm4_dw
 	);
 
+	/*
+	 * Emit a bad opcode with a non-zero count field and no body: the pipe HW
+	 * cannot find the packet end and stalls mid-packet, so a per-queue (vmid)
+	 * reset cannot recover it -- only a gfx pipe reset can.
+	 */
+	int (*priv_fault_badcount_hang)(
+		const struct amdgpu_ip_funcs *func,
+		const struct amdgpu_ring_context *context,
+		uint32_t *pm4_dw
+	);
+
 };
 
 extern const struct amdgpu_ip_block_version gfx_v6_0_ip_block;
diff --git a/lib/amdgpu/amd_ip_blocks_ex.c b/lib/amdgpu/amd_ip_blocks_ex.c
index 4655d9dcc..ad384ec33 100644
--- a/lib/amdgpu/amd_ip_blocks_ex.c
+++ b/lib/amdgpu/amd_ip_blocks_ex.c
@@ -228,6 +228,10 @@ static int gfx_ring_priv_inst_hang(const struct amdgpu_ip_funcs *func,
 				   const struct amdgpu_ring_context *ring_context,
 				   uint32_t *pm4_dw);
 
+static int gfx_ring_priv_fault_badcount_hang(const struct amdgpu_ip_funcs *func,
+					     const struct amdgpu_ring_context *ring_context,
+					     uint32_t *pm4_dw);
+
 void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 {
 	funcs->gfx_program_compute = gfx_program_compute_default;
@@ -240,6 +244,7 @@ void amd_ip_blocks_ex_init(struct amdgpu_ip_funcs *funcs)
 	funcs->wait_reg_mem_hang = gfx_ring_wait_reg_mem_hang;
 	funcs->priv_fault_hang = gfx_ring_priv_fault_hang;
 	funcs->priv_inst_hang = gfx_ring_priv_inst_hang;
+	funcs->priv_fault_badcount_hang = gfx_ring_priv_fault_badcount_hang;
 
 	switch (funcs->family_id) {
 	case AMDGPU_FAMILY_RV:
@@ -358,3 +363,22 @@ gfx_ring_priv_fault_hang(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+/*
+ * Emit a bad opcode (0xf2) with a non-zero count field and no body: the header
+ * claims a body that is never submitted, so the pipe HW cannot find the packet
+ * end and stalls mid-packet. A per-queue (vmid) reset cannot process it; only a
+ * gfx pipe reset can (once that FW support is ready).
+ */
+static int
+gfx_ring_priv_fault_badcount_hang(const struct amdgpu_ip_funcs *func,
+				  const struct amdgpu_ring_context *ring_context,
+				  uint32_t *pm4_dw)
+{
+	uint32_t i = *pm4_dw;
+
+	ring_context->pm4[i++] = PACKET3(0xf2, 0x3fff);
+	*pm4_dw = i;
+
+	return 0;
+}
+
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 1d729eeb4..d66a58859 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -265,6 +265,15 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Test-gfx-user-queue-bad-opcode-with-nonzero-count-recovers-via-gfx-pipe-reset");
+	igt_subtest_with_dynamic("amdgpu-gfx-priv-fault-badcount-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-gfx-priv-fault-badcount-umq")
+			amdgpu_priv_fault_badcount_ring_helper(device, AMDGPU_HW_IP_GFX, &pci, true);
+		}
+	}
+
 	igt_describe("Test-per-queue-reset-recovery-of-a-gfx-user-queue-privileged-instruction-fault");
 	igt_subtest_with_dynamic("amdgpu-gfx-priv-inst-umq") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
-- 
2.49.0

