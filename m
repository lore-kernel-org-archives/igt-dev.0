Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D590C44527
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 09:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C7410E177;
	Mon, 20 Jul 2026 09:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mzmHdlGy";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70C710E169
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 09:56:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr+u0DSVGDlN574lL2qgU2ukqpJiSEY1n3rAmbo3NbBRPK6xhtKAIzjTuQhTXwumuc5CflUG/uHOT9k4FCJDgfmFBflM8UIUizh5FqE4NvRSULRTGsWNBJcpuw6m5SzJz1iNbN2tgugarODD3OuyH3UGT42gnebSxUKvGuXJcouTj12vTML1sdT+/xLjz9OANbaM9x7aDRceZrFH2LNwXlzQEebSdQkQXLwgTB0S+hLfz8l0kPEIsswGtxMil1P4W6TMzlA2ho3wd60PiSXkpsRrVzdoyYKoNcjJJDZr30fAoqW02OHmVvN5wVMj41gS5iCcQzlvnpoCpedxs3r+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuIJyBP6OQq3U+OE13mCZo0Snjub+qpj36a1G2Lr8LA=;
 b=gKsF2hxVJPASLM+SOj5Q5FGe94gSB+2Ed3MON7G7Mr07R4mFzlbZB3LF2lruqtpjBbN/2eyyIWNs8jVgbMHDkyEZ6Dyujqe7n7pGiXn/Qi2+3M/dDI28MjpwUVtf5mQWIBc8ZyGyGXmQibYXOYTOOIxMKQfYtjQ1c64l7AJrYvqNaUl9j+MXCe5sGQfD4HqNttlhHNMyFooYiKWJeX34zkfdCoYcjU2PJJ4bCP3PlXIdsV83kgezKL5oza5CkBlOSy8qPvMpj1vr3Q0DrZJZsvAVaAS2B2E0DPe1XHHDW3JzNS5MtyPQL0TveACuwsfijZsvPJ8THeLK2ciIzbNunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuIJyBP6OQq3U+OE13mCZo0Snjub+qpj36a1G2Lr8LA=;
 b=mzmHdlGyTmATPu8OMt7VOZL29X/8q9DwzVZ6rcBsCo1/TW4SuxbBt9i0BMFHHughaLIw6/bnjnnKkkLN5aR2pqNqT53xSQGfxd6qP2Zk/cV4z8aeaZrxWaKNr0zrniOkCh/WpuNqX+vDzTIkQ5uSu8jcU0+mq+x33Bpt6ilApck=
Received: from SJ0PR03CA0123.namprd03.prod.outlook.com (2603:10b6:a03:33c::8)
 by CH8PR12MB9767.namprd12.prod.outlook.com (2603:10b6:610:275::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 09:56:17 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8e) by SJ0PR03CA0123.outlook.office365.com
 (2603:10b6:a03:33c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 09:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 09:56:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 04:56:09 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 04:56:03 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu/amd_deadlock: add gfx user-queue
 priv-fault reset test
Date: Mon, 20 Jul 2026 17:55:42 +0800
Message-ID: <20260720095555.1537413-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260720095555.1537413-1-Jesse.Zhang@amd.com>
References: <20260720095555.1537413-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|CH8PR12MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d6e010-0cef-430c-0221-08dee645238c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 79HeGH1xcyxyJ0uGlc5M0JLYlLRA4gpam3/Q5tTfOHSkyShhBOEjZzsQeymk3SAFCg/vZclgeM2WuUfE2OktydyQaEP8OnUAesGOj9V01XMpP40XvO0qNKCICBbIvBdxU7Lv5pmAW74enN0ufSr1Bn7wY+akHaNZO8HIpXN2iwmsviQZJWj04KaceaO2zS6qUp9vhKiqp+m98blewIr9AZQydfF6T4UQWmFH180UxyrEwOEVH98GYMnLeT03B/EVQpFt7xPbthJtHK/53DjBeNnHi9c18N5Kasa6DDebZmMOXi2WJcJsEhO2ui5CZ/aqO1GqB57+T+v3BvmUWFfh8s5GbxIiQTvvaXAXfIkoECdh54s/8kVnuipPIgOhLHLgyIxgq6bx1drOTuQ+VmdEPezfETwLBngiul/MJf2ALW5ygUMFxqasFs7iRP+i0MAkLASvi1xIGugSXWTtL7qhX9x5AazzfoyQ9PmKenc1h+qVGOlxQrAqlK9OlRhwlFammXdAxSrojWeMtGcoYQ821vS2yUALYzNBdPIO0eMM0LsZcP/YdIG3hZ8qtT4i3b3k7uUMXkFOOz+BDAmwX5A+Qzj1C0uIo1KAqdpSmFWmo7VjnUuVdYfUpGFsqvKmsVRwuZhsxqRTb2bvXPbNapp2Qapo0sIzh4sXYL1DYsQss6OQVkvnTxKdQffqHJS6yaqc6v1Y2/HdkRZbzxGgHx9VLg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PhJNs54kVXaPToD4jpFGFjiv6tSSYGqkiHniieV28h4XTbQpkOZt8OJrJd2Emom2SNMeR0euGqJLx+h6+xr9nCWT7gUA1hNYtnOeNh2htdHY9T0GJlpUHN+sNSMIbq2QM5McoZ/WZSh3kvzxeRUl4I81/gc0/gcNHDH+0JjYluIDlTg746hQEB5ut0XaEeUXu8pslcYQf2aWJmorCbsGx6Mq/EtG5h8akrgnmtPnjG3c1AhSwAXcHo9GvozFMn53rDJ/LWBB08tXXbhiaOq5UKaOUhLdSs3wRUo7XsqmsBIZ5Pn/rj+3+S7YQD6+2g0BKt7aThnX9jZbFIK0CNWIpXq3Y0uLu8Y2d42sHOemk6ozm9Pa4Ho5jybiV7DT6ZTHT47KSQw71tWUAls8V0o0ZTouAInxnUjPCAdBBnxHk/4CyFPlOG80wR6xCPBWJJYJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:56:15.5889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d6e010-0cef-430c-0221-08dee645238c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9767
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

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 108 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |   4 ++
 tests/amdgpu/amd_deadlock.c       |   9 +++
 3 files changed, 121 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c679e60c7..402972b5c 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -503,6 +503,114 @@ void amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip
 	}
 }
 
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
+static void gfx_ring_emit_priv_fault_hang(struct amdgpu_ring_context *ring_context)
+{
+	uint32_t i = 0;
+
+	/* Invalid opcode: the CP fails to decode it and raises a
+	 * CP_BAD_OPCODE_ERROR interrupt (a gfx priv-fault). Keep it minimal so
+	 * the CP does not run off into memory.
+	 */
+	ring_context->pm4[i++] = PACKET3(0xf2, 0);
+	ring_context->pm4[i++] = 0x0;
+
+	/* Then wait forever on a resident BO (initialised to 0, polled for
+	 * != 0). The queue hangs cleanly with no page fault, so the driver can
+	 * recover it with a per-queue reset instead of a full GPU reset.
+	 */
+	ring_context->pm4[i++] = PACKET3(PACKET3_WAIT_REG_MEM, 5);
+	ring_context->pm4[i++] = WAIT_REG_MEM_MEM_SPACE(1) |
+				 WAIT_REG_MEM_FUNCTION(4) |
+				 WAIT_REG_MEM_ENGINE(0);
+	ring_context->pm4[i++] = ring_context->bo_mc & 0xfffffffc;
+	ring_context->pm4[i++] = (ring_context->bo_mc >> 32) & 0xffffffff;
+	ring_context->pm4[i++] = 0;          /* reference value */
+	ring_context->pm4[i++] = 0xffffffff; /* and mask */
+	ring_context->pm4[i++] = 0x00000004; /* poll interval */
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
+	gfx_ring_emit_priv_fault_hang(ring_context);
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

