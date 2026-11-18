Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A92606A32C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Igopvpze
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E5110E2E5;
	Wed, 18 Nov 2026 06:14:58 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA88A10E52C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+CGmUHndhHPSeqstvukwt3MELUmpfQEwk2HJh/bm2O0QtQgMZPLDLPr5tpmwBwtRnNoDUZecOwxN+i7LEvqT7XNBioaHZoPiNX1e0KUz4ggHb55yFap+E8SJuROU8wYdn+9eYesq0pTSPYSS/ZubPdIzdpfKYYeIuRPyeTHQuVaK3lBgua2eAWAmsmBuE+oEww9HXxya5f8Fl9K09hF3GbjRMBEWGPhf48+GitkuncJDTVvRBXKGmtZu3GmK7uJz+ur89sYnF+cITVLv/eoyLhsHtbCccFltq2LTx7CZsKmYZcA40Xvg3SOcMgLueUi+D3JnHlDmNvqw4GvOyKzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmq5XG2ogLrD7/RsDNpKc1JtCgN9ouvTJNlrNZiaVxA=;
 b=LFrPXGdcvjrja1wBOmjptjm1kZUbMcLAHtZPv532S+VU9VBxVur+H4UYhQdLplBgsTSxOIiW13i4LTGXOsp13Tdo0z0Qc8oDn1cPFj/Jp0WG5DJKzobE5hPrSX5zMxheSuxlrOyqiMZOUBFM4K6t7DbLl3WFKMTR/BxDK0bYERpOXfGUcAB94jehXNOluQVmD7Or1bNhXuLrZ2Nx1Q6IuEbn/BKWNKsmXLdDoqixT+aL1/ueGY6t8bmnI3pADiQupZYe2fdCKw9Gsa0D5wl1K/haAvHIHSk4II5uNmztajWcuBKOH04ycKRFXuZOoEIasLpyKaV9n0xxyHRHb04Uiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmq5XG2ogLrD7/RsDNpKc1JtCgN9ouvTJNlrNZiaVxA=;
 b=Igopvpzes9FNGh+iGA/MAWQvd91dzsuLnkvizPx5p0HE06tq69UMAOe/NkjfZ9Zkf/XlOGi7XsQauYsYpbi2shLPlG4r2L1r++qXqjuvSCYSGtfWO749Py8810NWOCXyTZFE6uezs0c67DOz4jkAlAwPhhngh8p5w0VtqXxx2ic=
Received: from MN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:52f::29)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 06:11:11 +0000
Received: from IA0PEPF00000037.namprd03.prod.outlook.com
 (2603:10b6:208:52f:cafe::29) by MN0PR03CA0019.outlook.office365.com
 (2603:10b6:208:52f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 06:11:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000037.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 06:11:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:09 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:07 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 4/8] tests/amdgpu: share the SLTH user queue test
 between GFX and compute
Date: Wed, 18 Nov 2026 14:10:45 +0800
Message-ID: <20261118061059.3012530-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000037:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: 2295cc6d-0f6d-43c3-05c7-08df453abe7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|261021130227099003|10067099003|261026135527099003|261102123227099003|11063799006|261022075727099003|261022115727099003|56012099006|261026130827099003|261026140227099003|261021123027099003|261021135927099003|261026121527099003|261028144727099003|261021133027099003|261022113327099003|261022105027099003|261021121427099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: soxeJfwcgO+jldACobqox5jsLSYDXDC4ikb2nGwQGtrv2MhBTET8/SMUSXr+ttZgAZkzdKE8lpNRQBWTEthS1uPCJckjexPm3XvbGn2BZ/+PRYh0gwMAqPR4tK95/BHWiHWK0A8LI+svkt6SWQonRL5NIbc9MquOYoK37wv5vxGV1kUsnG4dCsfksAHNuQYZLDwsH0CXs9mtnHwpmB1gDzy8Wv9og4USM3cGGZRt0hlJCQXY4S4Pu7Icu8KsjlOiG9CGLR+xAQrs2io7uemznlll5qIlX3RW56zgWMnvMS/5wtXKo70Q23Y0wR2FQRqH0PWqxLDGJgpO7mEoC5V1wOkGOGTAd8UDXbMv7IaDP+weN49aOXme/oNGxf6M6MlGp0BzfztQwAqATLapg2sOGgrxCCWBwGUNRJmzucu4wklrzoaNlniseJAhCOzGHY/B9gqkas0sP9zYFSg7ZDMkFV8vC6TWM7R1OFt2OTj9Y9wQmLFHUdPNV6omRG+6M7IIhBF9iEpRKm+gil6rocyxcsGk+vjYU0+CWctmCRUGEVPoMT483KCwpT7q497GCI12AiHR3vPOmIDRQxm3jbaOMs00L4rX13rKNEnfKr797Z0cPunh1ZFbv4D0SLZ5GPbF3YRJRlyh8UQsHWlPwm72TaAoaYNfVb65G6477uWuM9IySI1PUPSAJmuK8dCt+17roh4SIX54XIa3MP61+bvWvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(261021130227099003)(10067099003)(261026135527099003)(261102123227099003)(11063799006)(261022075727099003)(261022115727099003)(56012099006)(261026130827099003)(261026140227099003)(261021123027099003)(261021135927099003)(261026121527099003)(261028144727099003)(261021133027099003)(261022113327099003)(261022105027099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: n9UPVzkGLZb3CsLQUEGmmIxCgrewhb/+klsWFDQ1JB4uSQJfTMXQ/KZbmcJdTpYYsxL4wi4bhnzFSbMU9muPrPe2eaK2OspjOZnhvyBIw4THUZmpnfvkgO4VQB8MTMiMwiql/5GzvWfcYjIMZ9HXUPsbYIOhqZ10uCZ8bECQ765wSxJiPDvZAXdc8MTIitP2hzFlacKgGu+JkjnMI+m1ip8MQfQZ0xH7bDfQRzlLqBEK2P5Mut8LuCl/a9I9KEeHBvdFQvcoCHmdQqoYAsGsDIbN1TGtalhFQU83TxeazgUL6LPdLS8oUVnXCyW+szpHPzcsw/3pB3nEL0QHy+0d4QQjx4hGnNqfYOl6rYcCFtl6HLtDx3V6EjMcAwzArzzxHXu1g86lcInMXhAr8JB4RK1QgkZL/zy9P0nbVINMY9wxPv3ijVT1sS9ur3aXORCX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:11.5869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2295cc6d-0f6d-43c3-05c7-08df453abe7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

slth_gfx_umq_vgpr_proof_test() can only run the VGPR proof shader on a
GFX user queue. Move the body into slth_umq_run(), which takes the IP
type and the shader and returns the stored value, so the other SLTH
checks can run on GFX and compute user queues without copying it.

On compute queues program the dispatch like the compute KQ tests do:
gfx_program_compute() starts with CONTEXT_CONTROL, which is a GFX only
packet. Drop the PM4 and pointer dumps while at it.

No functional change for slth-gfx-umq-vgpr-proof.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 350 ++++++++++++---------------------------
 1 file changed, 104 insertions(+), 246 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 2fdef83fd..2037c71ad 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -1357,293 +1357,151 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
 	igt_info("SLTH GFX KQ VGPR PROOF COMPLETE\n");
 }
 
-static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
-					 int fd)
+/*
+ * Run a SLTH shader on a GFX or compute user queue and return the dword it
+ * stores. The second-level trap handler is set per GPUVM, so user queues get
+ * it like kernel queues do. The shader stores to the address in s[0:1].
+ */
+static uint32_t
+slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
+	     void (*prepare_shader)(amdgpu_device_handle device,
+				    uint8_t *isa_bin, size_t *isa_sz))
 {
-	const struct amdgpu_ip_block_version *gfx_ip =
-		get_ip_block(device, AMD_IP_GFX);
-
+	const struct amdgpu_ip_block_version *ip = get_ip_block(device, ip_type);
 	struct amdgpu_ring_context *ring_context;
-
-	amdgpu_bo_handle bo = NULL;
-	amdgpu_va_handle va = 0;
-
-	void *cpu = NULL;
-	uint32_t *ptr_pm4 = NULL;
-	volatile uint32_t *ptr_output = NULL;
-
-	uint64_t mc = 0;
-	uint64_t shader_mc_addr;
-	uint64_t output_mc_addr;
-
 	struct amdgpu_cmd_base *base_cmd;
-
+	struct slth_bufs bufs;
+	amdgpu_bo_handle bo;
+	amdgpu_va_handle va;
+	volatile uint32_t *ptr_output;
+	uint64_t mc, shader_mc_addr, output_mc_addr;
 	uint8_t isa_bin[8192];
 	size_t isa_sz = 0;
+	uint32_t value;
+	void *cpu;
+	int r, i;
 
-	const uint32_t *shader;
-	uint32_t size_bytes;
-
-	struct slth_bufs bufs;
-
-	int r;
+	igt_assert(ip_type == AMD_IP_GFX || ip_type == AMD_IP_COMPUTE);
+	igt_assert(ip && ip->funcs);
 
 	memset(&bufs, 0, sizeof(bufs));
-
-	igt_assert(gfx_ip);
-	igt_assert(gfx_ip->funcs);
-
-	igt_info("SLTH GFX UMQ VGPR PROOF\n");
-
 	slth_alloc_buffers(device, &bufs);
+	slth_prepare_tba_with_handler(device, &bufs, TrapHandlerIsaProof);
 
-	igt_info("TBA=0x%016llx\n",
-		 (unsigned long long)bufs.tba_mc_addr);
-
-	igt_info("TMA=0x%016llx\n",
-		 (unsigned long long)bufs.tma_mc_addr);
-
-	slth_prepare_tba_with_handler(device,
-				      &bufs,
-			TrapHandlerIsaProof);
-
-	igt_info("TrapHandlerIsaProof loaded into TBA\n");
-
-	r = vm_set_l2_trap(fd,
-			   bufs.tba_mc_addr,
-			bufs.tma_mc_addr);
-
+	r = vm_set_l2_trap(fd, bufs.tba_mc_addr, bufs.tma_mc_addr);
 	igt_info("SET_L2_TRAP ret=%d\n", r);
-
 	igt_assert_eq(r, 0);
 
-	slth_prepare_vgpr_proof_shader(device,
-				       isa_bin,
-			&isa_sz);
-
-	shader = (const uint32_t *)isa_bin;
-	size_bytes = (uint32_t)isa_sz;
-
-	igt_assert(shader);
-	igt_assert(size_bytes > 0);
-
-	igt_info("SlthVgprProofIsa size=%u\n",
-		 size_bytes);
-
-	igt_info("shader=%p size=%u\n",
-		 shader,
-			size_bytes);
+	prepare_shader(device, isa_bin, &isa_sz);
+	igt_assert(isa_sz > 0 && isa_sz <= 4096);
 
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	gfx_ip->funcs->userq_create(device,
-			ring_context,
-			gfx_ip->type);
-
-	igt_info("UMQ queue created\n");
+	ip->funcs->userq_create(device, ring_context, ip->type);
+	igt_info("%s UMQ %u created\n", ip_type == AMD_IP_GFX ? "GFX" : "compute",
+		 ring_context->queue_id);
 
-	igt_info("timeline=%u point=%llu\n",
-		 ring_context->timeline_syncobj_handle,
-			(unsigned long long)ring_context->point);
-
-	base_cmd = get_cmd_base();
-	igt_assert(base_cmd);
-
-	r = amdgpu_bo_alloc_and_map_sync(
-			device,
-			65536,
-			4096,
-			AMDGPU_GEM_DOMAIN_GTT,
-			AMDGPU_GEM_CREATE_CPU_GTT_USWC,
-			AMDGPU_VM_MTYPE_UC,
-			&bo,
-			&cpu,
-			&mc,
-			&va,
-			ring_context->timeline_syncobj_handle,
-			++ring_context->point,
-			true);
+	/* IB at 0x0, shader at 0x1000, output at 0x2000 */
+	r = amdgpu_bo_alloc_and_map_sync(device, 65536, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT,
+					 AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+					 AMDGPU_VM_MTYPE_UC,
+					 &bo, &cpu, &mc, &va,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, true);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_timeline_syncobj_wait(
-			device,
-			ring_context->timeline_syncobj_handle,
-			ring_context->point);
+	r = amdgpu_timeline_syncobj_wait(device,
+					 ring_context->timeline_syncobj_handle,
+					 ring_context->point);
 	igt_assert_eq(r, 0);
 
 	memset(cpu, 0, 65536);
-
-	ptr_pm4 = (uint32_t *)cpu;
-
-	memcpy((uint8_t *)cpu + 0x1000,
-	       shader,
-			size_bytes);
-
-	ptr_output =
-		(volatile uint32_t *)((uint8_t *)cpu + 0x2000);
-
-	memset((void *)ptr_output, 0, 4096);
-
+	memcpy((uint8_t *)cpu + 0x1000, isa_bin, isa_sz);
+	ptr_output = (volatile uint32_t *)((uint8_t *)cpu + 0x2000);
 	shader_mc_addr = mc + 0x1000;
 	output_mc_addr = mc + 0x2000;
 
-	igt_info("shader_mc_addr = 0x%016llx\n",
-		 (unsigned long long)shader_mc_addr);
-
-	igt_info("output_mc_addr = 0x%016llx\n",
-		 (unsigned long long)output_mc_addr);
-
-	base_cmd->attach_buf(base_cmd,
-			ptr_pm4,
-			4096);
-
-	gfx_ip->funcs->gfx_program_compute(
-			gfx_ip->funcs,
-			base_cmd,
-			shader_mc_addr,
-			output_mc_addr,
-			0x002c0040,
-			0x00000010,
-			1,
-			1,
-			1);
-
-	igt_info("PM4 dwords after gfx_program_compute = %u\n",
-		 base_cmd->cdw);
-
-	gfx_ip->funcs->gfx_dispatch_direct(
-			gfx_ip->funcs,
-			base_cmd,
-			1,
-			1,
-			1,
-			0);
-
-	base_cmd->emit_aligned(base_cmd,
-			7,
-			GFX_COMPUTE_NOP);
-
-	igt_info("PM4 dwords after dispatch = %u\n",
-		 base_cmd->cdw);
-
-	ring_context->pm4_dw = base_cmd->cdw;
-
-	igt_info("UMQ pm4_dw=%u\n",
-		 ring_context->pm4_dw);
-
-	igt_info("IB gpu addr=0x%016llx\n",
-		 (unsigned long long)mc);
-
-	igt_info("Submitting REAL UMQ dispatch\n");
-
-	igt_info("=== PM4 DUMP BEGIN ===\n");
+	base_cmd = get_cmd_base();
+	igt_assert(base_cmd);
+	base_cmd->attach_buf(base_cmd, cpu, 4096);
 
-	for (int i = 0; i < base_cmd->cdw; i++) {
-		igt_info("PM4[%02d] = 0x%08x\n",
-			 i,
-				ptr_pm4[i]);
+	if (ip_type == AMD_IP_GFX) {
+		ip->funcs->gfx_program_compute(ip->funcs, base_cmd,
+					       shader_mc_addr, output_mc_addr,
+					       0x002c0040, 0x00000010, 1, 1, 1);
+		ip->funcs->gfx_dispatch_direct(ip->funcs, base_cmd, 1, 1, 1, 0);
+	} else {
+		/*
+		 * gfx_program_compute() starts with CONTEXT_CONTROL, a GFX only
+		 * packet, so program the dispatch like the compute KQ tests.
+		 */
+		amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, ip->major);
+		amdgpu_dispatch_write_cumask(base_cmd, ip->major);
+		amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, ip->major, 0);
+
+		/* COMPUTE_USER_DATA_0..3: s[0:1] = s[2:3] = output address */
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+		base_cmd->emit(base_cmd, 0x240);
+		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
+		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
+		base_cmd->emit(base_cmd, lower_32_bits(output_mc_addr));
+		base_cmd->emit(base_cmd, upper_32_bits(output_mc_addr));
+
+		/* COMPUTE_RESOURCE_LIMITS */
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base_cmd->emit(base_cmd, 0x215);
+		base_cmd->emit(base_cmd, 0);
+
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+		base_cmd->emit(base_cmd, 1);
+		base_cmd->emit(base_cmd, 1);
+		base_cmd->emit(base_cmd, 1);
+		base_cmd->emit(base_cmd, 1);
 	}
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+	ring_context->pm4_dw = base_cmd->cdw;
 
-	igt_info("=== PM4 DUMP END ===\n");
-
-	igt_info("before submit point=%llu\n",
-		 (unsigned long long)ring_context->point);
-
-	igt_info("pre-submit wptr=%llu rptr=%llu\n",
-		 (unsigned long long)*ring_context->wptr_cpu,
-			(unsigned long long)*ring_context->rptr_cpu);
-
-	igt_info("IB first 16 DWs:\n");
-
-	for (int i = 0; i < 16 && i < ring_context->pm4_dw; i++)
-		igt_info("IB[%d]=0x%08x\n", i, ptr_pm4[i]);
-
-	gfx_ip->funcs->userq_submit(device,
-			ring_context,
-			gfx_ip->type,
-			mc);
-
-	igt_info("Returned from userq_submit()\n");
-
-	igt_info("post-submit wptr=%llu rptr=%llu\n",
-		 (unsigned long long)*ring_context->wptr_cpu,
-			(unsigned long long)*ring_context->rptr_cpu);
-
-	usleep(100000);
-
-	igt_info("100ms later wptr=%llu rptr=%llu\n",
-		 (unsigned long long)*ring_context->wptr_cpu,
-			(unsigned long long)*ring_context->rptr_cpu);
-
-	igt_info("after submit point=%llu\n",
-		 (unsigned long long)ring_context->point);
-
-	igt_info("timeline=%u point=%llu\n",
-		 ring_context->timeline_syncobj_handle,
-			(unsigned long long)ring_context->point);
-
-	r = amdgpu_timeline_syncobj_wait(
-			device,
-			ring_context->timeline_syncobj_handle,
-			ring_context->point);
-
-	igt_info("timeline wait ret=%d\n", r);
-
-	igt_info("pm4_dw=%u\n",
-		 ring_context->pm4_dw);
+	ip->funcs->userq_submit(device, ring_context, ip->type, mc);
 
-	for (int i = 0; i < 1000; i++) {
-		if (ptr_output[0])
-			break;
+	r = amdgpu_timeline_syncobj_wait(device,
+					 ring_context->timeline_syncobj_handle,
+					 ring_context->point);
+	igt_assert_eq(r, 0);
 
+	for (i = 0; i < 1000 && !ptr_output[0]; i++)
 		usleep(1000);
-	}
-
-	igt_info("final output=0x%x\n",
-		 ptr_output[0]);
-
-	igt_info("Post-dispatch output dump\n");
-
-	for (int i = 0; i < 16; i++) {
-		igt_info("OUT[%d] = 0x%08x\n",
-			 i,
-				ptr_output[i]);
-	}
-
-	igt_info("output_value=%u (0x%x)\n",
-		 ptr_output[0],
-			ptr_output[0]);
-
-	igt_info("VGPR proof output=%u\n",
-		 ptr_output[0]);
-
-	igt_assert_eq(ptr_output[0], 42);
-
-	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
-
-	amdgpu_bo_unmap_and_free(bo,
-				 va,
-			mc,
-			65536);
+	value = ptr_output[0];
+	igt_info("output_value=%u (0x%x)\n", value, value);
 
+	amdgpu_bo_unmap_and_free(bo, va, mc, 65536);
 	free_cmd_base(base_cmd);
-
-	gfx_ip->funcs->userq_destroy(device,
-			ring_context,
-			gfx_ip->type);
+	ip->funcs->userq_destroy(device, ring_context, ip->type);
+	free(ring_context);
 
 	r = vm_clear_l2_trap(fd);
-
 	igt_info("CLEAR_L2_TRAP ret=%d\n", r);
-
 	igt_assert_eq(r, 0);
-
 	slth_free_buffers(&bufs);
 
-	free(ring_context);
+	return value;
+}
 
-	igt_info("UMQ queue destroyed\n");
+static void slth_gfx_umq_vgpr_proof_test(amdgpu_device_handle device,
+					 int fd)
+{
+	uint32_t value;
+
+	igt_info("SLTH GFX UMQ VGPR PROOF\n");
+
+	value = slth_umq_run(device, fd, AMD_IP_GFX,
+			     slth_prepare_vgpr_proof_shader);
+
+	/* The trap handler sets v2 to 42 before the shader stores it. */
+	igt_assert_eq(value, 42);
+
+	igt_info("SLTH GFX UMQ VGPR PROOF COMPLETE\n");
 }
 
 static void
-- 
2.50.1

