Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363D606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wv9WOHi+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DF110E6EB;
	Tue, 24 Nov 2026 08:42:27 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E810F2F3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNuMaVfwhWieQDSbp9JXEWOGBy7GHON9Sy3dFtoTTFpkLM0cIdBJTaIaer+4KYnj4g1fYyO0x6EKlPKKabpSbLoTBpqstoHUxVRZzmFn4Li8MqcexLvoqaM1sxjSaJlAniv9CQ/0rjKOjnSKmohQmSQMk0Un0/G6sKOCv2H6tiLyfR5lWo9cc63CTlv89AukIifpixAI8CVYm9eHCStBA+nLf0KjVL+uB5q7EXK1/Rh7YW1+NNfjavuvEnsk1ZVhVcGgRNDxou2fBnj/RTk2k9X438H5oUDfn74EQ+8hiC26BQ9m36IvZ2pkfkkwL7lPXB3Gz9s7PPB2Napu4F86+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9omxXpCALzIY6DqNOkRmYSMJAksRjzuV6uLEeNRsJgk=;
 b=j8xOZpb7GMsoWcN6HY1hcLrgiLcuasWvyswCO5HmuhgUEACcsN3ZtpknLc9qCETl6ApfGXHXfIhLRNR6uorB9dKykBWc/7mimpfXdBffIS0wzGmmqP1nzP26DBb2TkhRcHr/zlQ7CruthTqvzZ/XIQ3BU1no/f0sv7HQRbdftIX0bTGbpgxTYScIN75fXODqJxcaNbonan1Izzv7AmAUbtIqxYR97Uflv8TdE78Yp/joQt1E0tySXIkkv5iX3Khu2SyVqIcTrnZ+AZj6grQno4KpsZBl+EJP0l4fg3F6Qb/FzaoY+HbdmxgDjovNjOH8IiZfWxQI4unm3rbuhKI9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9omxXpCALzIY6DqNOkRmYSMJAksRjzuV6uLEeNRsJgk=;
 b=Wv9WOHi+FmIuwgA464ZcHPx58pA2YvQdLLHasws/b8ulZdDEjxaEe1HlJa7zaNoawxjVGA6aRpvR6c7F8eDPPYGdBm1il0ZYFbdyYz72ncagXonuuUTnJduOblAIoBA0ehDsZHTTNa52yjD3VaIYdvsl7DxpjEq912LqRYC7jO8=
Received: from CH0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:610:74::25)
 by SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:28:33 +0000
Received: from CH2PEPF000166C0.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::91) by CH0PR04CA0080.outlook.office365.com
 (2603:10b6:610:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:28:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166C0.mail.protection.outlook.com (10.167.252.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:31 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:31 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:29 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 04/12] tests/amdgpu: share the SLTH user queue test
 between GFX and compute
Date: Tue, 24 Nov 2026 16:27:34 +0800
Message-ID: <20261124082819.2089694-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C0:EE_|SA0PR12MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0a2a5e-2960-4d21-bf3c-08df4a04ecee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|18002099003|22082099003|261009223027099003|3023799007|261021123027099003|261021130227099003|261021133027099003|261021121427099003|261021135927099003|261022113327099003|261022105027099003|261102123227099003|261026140227099003|261022115727099003|261022075727099003|261026130827099003|261026135527099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: kR6mpo31XnXQ38njlstFyyqwTVepoWcrZw643YtEEi9t2zuo7nN56AzGN3EshmhaTYMmNZmQBRk3s+JYgyhB5v709Ip0b2uWzRjxNmVvY73ITMWfiBIIJEC5kBL2VISYZ24dK3KGFT1H/FZLDDs9ds9oOdvHdQ9vEbSvdbi8xh1X/R/Vqpci2bLzK3uvDPdRA9GtUCumeVX5epytoPpcXl8MLwzU9b1L6J1r0ipSp6ibqg5heqhycgf3W8eICHhtrYJ+/ti5YiBghe4gVDRv8oyT7//cEgW1+reVXThLo8qX2t3ifHNlGYGYdJfT7Msi3vztuiASyIMHcJChrxSF0TUhooJWl0NtXekwU3RRkbuE7abBBPOklkWa7uUUnkAhR285UeyU0Y+Rd/kJRL+yBLTBtKol48xHev6SGwXr3e1TkrWCCOmB0YKjAwZINCb8Chu6cvrMKaS80BzYUb2nZ65G0mhBjBZwY6E0Jp9zvvfqAYFnd+0tVHGAqwEgAe4w2QGMibtlOUC427TWehuIhRXX0z+hJJiXISRSqokOJOljRzOjATOQCtel6wrVuf6feQ1KY72pkLHO8Sdv46c1AIFQWUN8QSje6QANP5NHNZoAo1xCe3kX4hd6MO8EmHQix9RlPT/yLR0D4HpJpCplhXnnLM754FSPWUulQjuhcKhJYh8jbB+lf00U0fLyhjLMka6C75mmLU8NnBWTgUHRWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(3023799007)(261021123027099003)(261021130227099003)(261021133027099003)(261021121427099003)(261021135927099003)(261022113327099003)(261022105027099003)(261102123227099003)(261026140227099003)(261022115727099003)(261022075727099003)(261026130827099003)(261026135527099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bj/jCf1g6yYGSmXQ2Ix1tPGTImQzT0datciRLkEZOSEsATORv6zKbJkD6o8BmjNZFhN7+ZmD8PilikG0Cvf4C8eY//M+8G1eLzvpZjtkItfwG7ByVq3Gw1PLKuEPq131t2T8mfGjPH8lC7WvGdKc0o9jqzTVgbrrL6ezy8PGxTUBW+WX6TVdjbWS9amkK5JzcM41lreLHBmTtCaNC0Fi5A23lceXHJJZU4mlvhMEyz65i6ktUSAAgVsxGHDs/5/HxjajVVXP10Q4deR3AVXtkS7HjynDFieTQcfWneAEAknLbCA5jcL3sR2baUXhLq6dy76gcpf0A3wr6TY278lxFqzhIkIw3zlC/ZDAbHfURhQr6QJA72dAbv3OJykrWv/9HsEcbQ2PfgsW5++Rv/5YWLx+4rkS+nKttQYIEcqNjPxEHzQlfEv7aWiCYM1UOwcx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:32.4980 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0a2a5e-2960-4d21-bf3c-08df4a04ecee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091
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
Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_slth.c | 354 ++++++++++++----------------------------
 1 file changed, 106 insertions(+), 248 deletions(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 4c70ef055..1adbcb629 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -534,293 +534,151 @@ static void slth_gfx_kq_vgpr_proof_test(amdgpu_device_handle device,
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
-
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
+	ip->funcs->userq_create(device, ring_context, ip->type);
+	igt_info("%s UMQ %u created\n", ip_type == AMD_IP_GFX ? "GFX" : "compute",
+		 ring_context->queue_id);
+
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
-
-	for (int i = 0; i < base_cmd->cdw; i++) {
-		igt_info("PM4[%02d] = 0x%08x\n",
-			 i,
-				ptr_pm4[i]);
+	base_cmd = get_cmd_base();
+	igt_assert(base_cmd);
+	base_cmd->attach_buf(base_cmd, cpu, 4096);
+
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

