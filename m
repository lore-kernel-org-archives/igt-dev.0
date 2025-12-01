Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD6DD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 19:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9C710E06C;
	Mon,  1 Dec 2025 19:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vViNOYSt";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A8C10E06C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 19:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amAWOdhgb4N1A4G6kC6USXo9X4gJCpl/nfGFdTDpPM5hPBOgRNULZyE8Xdshwf2oP5Vhr1xMXoHJjuFwxLoJwO6BNPgnfltO2cOfkvz5ylwrnAxjJpAWFZgxbvRws4iozhaZPpiYb1r8RWUN45qIFd38JbIw9ATwxfN4twzdhl8m6QIo4sKXI5gNMdrqvlfydM55Fsim7MGhmCWtOsrDmi9YwVnzZRt8aU3HvlQv7KowfvE0pwInImZ4Sy06vLialu0Iul+rNRbyGv6vZMCZbZhB0K+wiUSGls6UYjWuOxh4Va5DVLfpmFViF4kwoKoxyYCATcJIlp8k+69Gl+9Hbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuMGruyuwElzqCVllg+6meJuUhc+nZLLPAIYCDPjEpY=;
 b=PyZatYvmSLe7IzO9A7tKxVeS9X/eaDYWhD7CTnTjCmrr0KT9Q8oHpb1HipzdNbcjzbSKb5UMbZyDoewPQFTy11S8QVqsTUvbwRDaqRKmrX7iXKYWId4n9CyuvoTiwTCxoePCW18SoBOQjmGe9XpY/Qh4F0TQD7w9FJS3ov5cyRbhRM0jZ9XHf7z0x17ClR2oBCjw5AMscw6hZSJQAqN40v0WKOcDq+6Czh7FI8zxYwN+ak3b/0Bt8QeiVrgts467cnTU6fJehtmMUME91Spm7wNPtX06DtEYDb9dQsBXVxmoFbCrmI9N5ljOYqzXfWSlgTIqDQ9C9Mf0ULkcdwQtig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuMGruyuwElzqCVllg+6meJuUhc+nZLLPAIYCDPjEpY=;
 b=vViNOYStZnQr39i4FHCROKcQFdaqroPz3wt8e23Bu8hEnDDTnz2gLxZCfiKUKcAAAr1HQnu5hYW32RS6eLVVBc0z1wvhmniF1qdl3yM0Whr0/cs0DJ+OfWhRFv4CSSPm0L8HkkDfL1iW6+jTfKoTLySAi/Acp/Dz/Gw3q8XBZcM=
Received: from DS7PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:3b5::9) by
 DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 19:00:10 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::b) by DS7PR03CA0034.outlook.office365.com
 (2603:10b6:5:3b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 19:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 19:00:09 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Dec 2025 13:00:01 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH v2] =?UTF-8?q?tests/amdgpu/amd=5Fbo:=20Add=20UMQ-based=20H?=
 =?UTF-8?q?DP=20flush=20VRAM=E2=86=92GTT=20coherency=20test=20v2?=
Date: Tue, 2 Dec 2025 00:29:47 +0530
Message-ID: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 3902520b-c772-4fd0-dc1b-08de310bd9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXI2Ry9xbXN3RnRhQXMzbXlDMmx3Y0NBTVg2cHZTV0hhQVVpZms4MmxKbE4w?=
 =?utf-8?B?bXdVL3RDUU9YM2VvY1haY1c3d1ZSWElBcXZBSGJLeXpQbUsyUjlhOW5DZXR1?=
 =?utf-8?B?eFRrRjd4TFlBVmE4REVPYUM1NWV1dFEvbkpJUnk0YzFxRWd0VFN1NlA1VlVo?=
 =?utf-8?B?bytVM2RwbmlPYnQxZlg5Zks2emVNdGFyU2ZWRU9rUHRzRC95TDdQOVJaVHY2?=
 =?utf-8?B?RWUyd1RneFNJNExUTzRCWGV1RGV6OFlQQVJSWUh0OUk5SFpqQUJIS0dIMGVO?=
 =?utf-8?B?RmE2RExMaUdCZlR4S0xuekJMbEV4OE5tTXFPaVBzSW9UT1UzZGhyeHpFMEtO?=
 =?utf-8?B?b2NIbjhXLzROWllsUW5iUWpmQWUzMkNtQnB5Y3ZSa3J3OXRwdWN5a1dWell5?=
 =?utf-8?B?SS9INjhHTFo4aVRIWCtocHhJSGZYbkIxM2VSaElnMjNpeHdNZU1ibTRlRGVx?=
 =?utf-8?B?LzN4Kzdzb3A3VDMxUlpMUGJnUnE0SzI2RlZESFdVSjNlMDQ5VlQvbHNFMnE1?=
 =?utf-8?B?dndUQ3V6L2tJMXpadXd4YjZrd2hFS2hDRXNkV0M1QTdhdnd5YnNKVXN5M01R?=
 =?utf-8?B?VENJTjJpcGM4MGhqemVKZFpFRXlPOGYxc2VpbGV6Y25nYmk1RmVDRzNBcXdY?=
 =?utf-8?B?eWpWaEpaRzRSUFplSDIvYzhOTEhzQXhaN1VNV3RvZ0U5WnlkY2luVitwTTdZ?=
 =?utf-8?B?RG10cUI5WnpXSDc2czRnR0trV0dVY3ZBWHdQQ3c2TjZxbEdPQkNRQ2lIRG15?=
 =?utf-8?B?MkVTMlZNbzB2T2VoSm1NWXQydzNDU0NBbjdWMUZMRng3dll5RnY5enFFS01D?=
 =?utf-8?B?RWZVTERyM3J3NlVPWVRHVHJJUzR5NWlpaW5SSlZXOFhWQ2NMeW1aekpTck9k?=
 =?utf-8?B?SmFSOXh0YWR0T0JPT0QwY0JOQUQ5a2hyaGNFNUFxNHlWYUxMMTNidzVsNTFT?=
 =?utf-8?B?TnErRU1Vekxxbzd5Y0NsTzdxSXlsc0dRM1lNMzhvWjBtOUlzNjdNQjZ1aGI0?=
 =?utf-8?B?M2daZm1VVldkbEJwVzN6bXFTRHgzc0hOTlFEckNCNEhNMGlpYy9MOUY3SXNH?=
 =?utf-8?B?T0xBZnF1ZEZuMDdpTjdqYXVCSE9ocUNVcEVreUtLWVpiaFJCUXhNYThoQ2VJ?=
 =?utf-8?B?K3F4cklJRUtDZWsvbkkrTzViUlhTU1B4UngvU05jNXpKb1VoQzlKTkh5eDUz?=
 =?utf-8?B?Z1pqU1AreHhzaTQ5WC9XR1JYbTlNc2pxbjRSRVdVVkpkNnpqTnBjWVFNR1E4?=
 =?utf-8?B?RVoxcXcyKzBlcFdrYk5yQ2loVms2LzZBbkk4dEFBUU1MUnV3cWdFYWtIemRV?=
 =?utf-8?B?OGl4UWRieXp2MGRmb3RDdWJIVmd1WXAraUdVYnM5ZXY1N0lFTTdlanBiUTlF?=
 =?utf-8?B?MWtTbVIxK2hzcm51NEVUVmlQVEIrUVhQUHVzL1pGdG9RRmwrU3FZdmt6SUdS?=
 =?utf-8?B?L1MwUFloYjJOQjd5TUwrUERQUzJuQXVJOWFiYVZHLzlCK1Bwb21xYVNuQnpQ?=
 =?utf-8?B?SjBJdGlBa3k2aEUrZmRTK0tUajNVSDhCWVQ4WnY1WXcrd01pYmp3bkJCZHlk?=
 =?utf-8?B?bkhpelpVZHFmdDI0dWhxb3VMNkI4Tjg0UmpHYUY3OVl5YnkvNjJqZXpYNmFN?=
 =?utf-8?B?eUxVYUo2UDFtSTl0L0FPQ2xkYTgvSHIrK0RUTm9DelhTOUxwU2dEYW9kN1Rr?=
 =?utf-8?B?VHQzNEI4ZVBIbnBtbFFQdHBiMjFPcWpwdDF1NTk4b3l1Z1NwM01KUWovQ2NN?=
 =?utf-8?B?Q1IvTzFrNDEyZGJXOTBWN2pWZkJYWDI3RWFjaVNyUFVuVldsbXQ5T0JBUmVQ?=
 =?utf-8?B?dnFjY1c1dHBUbHdYSm9pbjJRN25hVi9ndTNZY1hiQWpYMkIwM09LWXQ3aGxs?=
 =?utf-8?B?c1VpTFdpdnVCSlQ2M1kyeGxEeXpqVVpnT05LVW51VmJ6UkdKZ1F2K1ZDU3dR?=
 =?utf-8?B?RlhKT2k0bHBoMk1kL3lHdENyNTc1MzA3RUV6UzhBd1hQZnRVTWNDRDJQUm1s?=
 =?utf-8?Q?dcUyJJKXO5wSNK/rsjtfYXgWSzjndU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:00:09.8629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3902520b-c772-4fd0-dc1b-08de310bd9a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
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

Introduce a UMQ-only coherency test that validates host HDP flush behaviour
using MMIO_REMAP and a VRAM→GTT linear copy. The flow performs one PASS-A
(with flush) and one PASS-B (without flush) to detect whether CPU writes
propagate without an explicit HDP poke.

v2:
 - Move all local declarations to the top of their blocks. (Vitaly)
 - No functional changes from v1; logic and test flow remain identical.

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_bo.c | 296 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 296 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 2243eea04..3d16f78a8 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -9,6 +9,7 @@
 
 #include "igt.h"
 #include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
 
 #include <unistd.h>   /* sysconf() */
 #include <string.h>
@@ -366,11 +367,273 @@ amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
 	igt_assert_eq(r, 0);
 }
 
+/* Order CPU stores -> poke FLUSH_CNTL -> readback to post the write. */
+static inline void hdp_flush_mmio(uint32_t *mmio_base)
+{
+	__sync_synchronize();
+	mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4] = 1;
+	(void)mmio_base[MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4];
+	__sync_synchronize();
+}
+
+/*
+ * UMQ HDP flush VRAM->GTT copy check (single-shot; UMQ-only)
+ *  - PASS-A: write pattern + tag 0x0000BEEF, HDP flush (if available) -> copy
+ *            expect dst[1] == 0x0000BEEF
+ *  - PASS-B: change tag to 0x0000FACE, NO flush -> copy -> report stale/coherent
+ */
+static void amdgpu_umq_hdpflush_vram2gtt(amdgpu_device_handle device,
+					 const struct amdgpu_ip_block_version *ip_block,
+					 bool user_queue)
+{
+	const int sdma_write_length = 1024; /* bytes */
+	const int pm4_dw            = 256;  /* dwords */
+	struct amdgpu_ring_context *ring_context;
+	bool userq_created;
+	amdgpu_bo_handle mmio_bo;
+	void *mmio_cpu;
+	bool have_mmio_flush;
+	uint32_t available_rings;           /* UMQ slots mask */
+	int r;
+	int ring_id;
+	const char *ip_tag;
+	/* moved out of inner scopes */
+	struct amdgpu_bo_alloc_request remap_req;
+	uint64_t src_flags;
+	uint64_t dst_flags;
+	uint32_t *src32;
+	uint32_t *dst32;
+	uint32_t got;
+
+	ring_context    = NULL;
+	userq_created   = false;
+	mmio_bo         = NULL;
+	mmio_cpu        = NULL;
+	have_mmio_flush = false;
+	available_rings = 0;
+	ip_tag = (ip_block->type == AMDGPU_HW_IP_DMA) ? "dma" :
+		 (ip_block->type == AMDGPU_HW_IP_GFX) ? "gfx" : "ip";
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	ring_context->write_length = sdma_write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	igt_assert(ring_context->pm4);
+
+	ring_context->secure = false;
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 2;
+	ring_context->user_queue = true; /* UMQ-only */
+	ring_context->time_out = 0;
+
+	igt_info("[umq-hdpflush][%s] start (user_queue=%d)\n", ip_tag, (int)user_queue);
+
+	/* Query UMQ rings/slots */
+	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
+	igt_info("[umq-hdpflush][%s] query_hw_ip_info: r=%d ip_type=%u avail_rings=0x%x\n",
+		 ip_tag, r, ip_block->type, ring_context->hw_ip_info.available_rings);
+	igt_info("[umq-hdpflush][%s] userq_slots=%u\n",
+		 ip_tag, ring_context->hw_ip_info.num_userq_slots);
+	igt_assert_eq(r, 0);
+
+	available_rings = (ring_context->hw_ip_info.num_userq_slots >= 32)
+		? 0xFFFFFFFFu
+		: ((1u << ring_context->hw_ip_info.num_userq_slots) - 1u);
+
+	if (!available_rings) {
+		igt_info("[umq-hdpflush][%s][SKIP] no available UMQ slots\n", ip_tag);
+		goto cleanup_top;
+	}
+
+	/* Create UMQ context only */
+	igt_info("[umq-hdpflush][%s] userq_create...\n", ip_tag);
+	ip_block->funcs->userq_create(device, ring_context, ip_block->type);
+	userq_created = true;
+	igt_info("[umq-hdpflush][%s] userq_create done\n", ip_tag);
+
+	/* Map one MMIO_REMAP page to poke HDP flush */
+	memset(&remap_req, 0, sizeof(remap_req));
+	remap_req.alloc_size     = AMDGPU_GPU_PAGE_SIZE;
+	remap_req.phys_alignment = AMDGPU_GPU_PAGE_SIZE;
+	remap_req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+	remap_req.flags          = 0;
+	r = amdgpu_bo_alloc(device, &remap_req, &mmio_bo);
+	if (!r) {
+		r = amdgpu_bo_cpu_map(mmio_bo, &mmio_cpu);
+		if (!r && mmio_cpu) {
+			have_mmio_flush = true;
+			igt_info("[umq-hdpflush][%s] MMIO_REMAP mapped: cpu=%p\n",
+				 ip_tag, mmio_cpu);
+		} else {
+			igt_info("[umq-hdpflush][%s] MMIO_REMAP map failed r=%d; "
+				 "continuing without flush\n", ip_tag, r);
+			(void)amdgpu_bo_free(mmio_bo);
+			mmio_bo = NULL;
+		}
+	} else {
+		igt_info("[umq-hdpflush][%s] MMIO_REMAP alloc r=%d; continuing without flush\n",
+			 ip_tag, r);
+	}
+
+	/* Pick the first available UMQ slot and run once */
+	for (ring_id = 0; (1u << ring_id) & available_rings; ring_id++) {
+		src_flags = 0; /* NORMAL */
+		dst_flags = 0; /* NORMAL */
+
+		ring_context->ring_id = ring_id;
+		igt_info("[umq-hdpflush][%s] == ring/slot %d begin ==\n", ip_tag, ring_id);
+		igt_info("[umq-hdpflush][%s] map combo: src=NORMAL dst=NORMAL\n", ip_tag);
+
+		/* SRC in VRAM (CPU writes go via HDP) */
+		r = amdgpu_bo_alloc_and_map_sync(device,
+						 ring_context->write_length,
+						 4096, AMDGPU_GEM_DOMAIN_VRAM,
+						 src_flags,
+						 AMDGPU_VM_MTYPE_UC,
+						 &ring_context->bo,
+						 (void **)&ring_context->bo_cpu,
+						 &ring_context->bo_mc,
+						 &ring_context->va_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ++ring_context->point, true /* UMQ */);
+		igt_info("[umq-hdpflush][%s] SRC: r=%d bo=%p cpu=%p mc=0x%016llx\n",
+			 ip_tag, r, (void *)ring_context->bo, (void *)ring_context->bo_cpu,
+			 (unsigned long long)ring_context->bo_mc);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+
+		/* DST in GTT */
+		r = amdgpu_bo_alloc_and_map_sync(device,
+						 ring_context->write_length,
+						 4096, AMDGPU_GEM_DOMAIN_GTT,
+						 dst_flags,
+						 AMDGPU_VM_MTYPE_UC,
+						 &ring_context->bo2,
+						 (void **)&ring_context->bo2_cpu,
+						 &ring_context->bo_mc2,
+						 &ring_context->va_handle2,
+						 ring_context->timeline_syncobj_handle,
+						 ++ring_context->point, true /* UMQ */);
+		igt_info("[umq-hdpflush][%s] DST: r=%d bo2=%p cpu2=%p mc2=0x%016llx\n",
+			 ip_tag, r, (void *)ring_context->bo2, (void *)ring_context->bo2_cpu,
+			 (unsigned long long)ring_context->bo_mc2);
+		igt_assert_eq(r, 0);
+
+		r = amdgpu_timeline_syncobj_wait(device,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+
+		/* Init buffers */
+		memset((void *)ring_context->bo_cpu,
+		       ip_block->funcs->pattern,
+		       ring_context->write_length);
+		memset((void *)ring_context->bo2_cpu,
+		       0,
+		       ring_context->write_length);
+		ring_context->resources[0] = ring_context->bo;
+		ring_context->resources[1] = ring_context->bo2;
+
+		/* Tag for PASS-A */
+		src32 = (uint32_t *)ring_context->bo_cpu;
+		dst32 = (uint32_t *)ring_context->bo2_cpu;
+		src32[1] = 0x0000BEEF;
+		igt_info("[umq-hdpflush][%s] PASS-A tag: src32[1]=0x%08x\n", ip_tag, src32[1]);
+
+		/* Build copy PM4/IB */
+		ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+					     &ring_context->pm4_dw);
+
+		/* WITH HDP flush if available */
+		if (have_mmio_flush) {
+			igt_info("[umq-hdpflush][%s] PASS-A: HDP FLUSH\n", ip_tag);
+			hdp_flush_mmio((uint32_t *)mmio_cpu);
+		} else {
+			igt_info("[umq-hdpflush][%s] PASS-A: NO HDP flush available\n", ip_tag);
+		}
+
+		/* Submit and verify PASS-A */
+		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
+		got = dst32[1];
+		igt_info("[umq-hdpflush][%s] PASS-A dst32[1]=0x%08x (expect 0x0000BEEF)\n",
+			 ip_tag, got);
+		if (have_mmio_flush)
+			igt_assert_eq_u32(got, 0x0000BEEF);
+
+		/* PASS-B: change only the tag to 0xFACE, NO flush */
+		src32[1] = 0x0000FACE;
+		igt_info("[umq-hdpflush][%s] PASS-B tag: src32[1]=0x%08x (NO flush)\n",
+			 ip_tag, src32[1]);
+
+		ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+					     &ring_context->pm4_dw);
+		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
+		got = dst32[1];
+		igt_info("[umq-hdpflush][%s] PASS-B dst32[1]=0x%08x "
+			 "(expect 0x0000FACE if coherent w/o flush)\n",
+			 ip_tag, got);
+		if (got != 0x0000FACE)
+			igt_info("[umq-hdpflush][%s] PASS-B: STALE (saw 0x%08x)\n",
+				 ip_tag, got);
+		else
+			igt_info("[umq-hdpflush][%s] PASS-B: MATCH without flush\n",
+				 ip_tag);
+
+		/* Free once and break (single-run) */
+		amdgpu_bo_unmap_and_free(ring_context->bo,
+					 ring_context->va_handle,
+					 ring_context->bo_mc,
+					 ring_context->write_length);
+		amdgpu_bo_unmap_and_free(ring_context->bo2,
+					 ring_context->va_handle2,
+					 ring_context->bo_mc2,
+					 ring_context->write_length);
+		igt_info("[umq-hdpflush][%s] == ring/slot %d end ==\n", ip_tag, ring_id);
+		break;
+	}
+
+cleanup_top:
+	/* tear down */
+	if (ring_context) {
+		free(ring_context->pm4);
+		if (userq_created) {
+			igt_info("[umq-hdpflush][%s] userq_destroy...\n", ip_tag);
+			ip_block->funcs->userq_destroy(device, ring_context, ip_block->type);
+			igt_info("[umq-hdpflush][%s] userq_destroy done\n", ip_tag);
+		}
+		free(ring_context);
+	}
+
+	if (mmio_bo) {
+		if (mmio_cpu)
+			(void)amdgpu_bo_cpu_unmap(mmio_bo);
+		(void)amdgpu_bo_free(mmio_bo);
+	}
+
+	igt_info("[umq-hdpflush][%s] end\n", ip_tag);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
 	struct bo_data bo;
+	struct amdgpu_gpu_info gpu_info = {0};
+	struct drm_amdgpu_info_hw_ip info = {0};
 	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -383,6 +646,15 @@ igt_main
 			 major, minor);
 		err = amdgpu_bo_init(device, &bo);
 		igt_require(err == 0);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 	}
 
 	igt_subtest("amdgpu_bo_export_import")
@@ -409,6 +681,30 @@ igt_main
 	igt_subtest("mmio_remap_map_and_poke")
 	amdgpu_mmio_remap_hdp_flush_poke(device);
 
+	igt_describe("UMQ HDP flush VRAM->GTT: PASS-A (with flush) and PASS-B (without flush) on GFX (UMQ only)");
+	igt_subtest_with_dynamic("umq_hdpflush_gfx_vram2gtt") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("umq-gfx-hdpflush")
+				amdgpu_umq_hdpflush_vram2gtt(device,
+							     get_ip_block(device, AMDGPU_HW_IP_GFX),
+							     true /* UMQ */);
+		} else {
+			igt_info("[umq-hdpflush][gfx] skipping: UMQ disabled or GFX UMQ not available\n");
+		}
+	}
+
+	igt_describe("UMQ HDP flush VRAM->GTT: PASS-A (with flush) and PASS-B (without flush) on SDMA (UMQ only)");
+	igt_subtest_with_dynamic("umq_hdpflush_dma_vram2gtt") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("umq-dma-hdpflush")
+				amdgpu_umq_hdpflush_vram2gtt(device,
+							     get_ip_block(device, AMDGPU_HW_IP_DMA),
+							     true /* UMQ */);
+		} else {
+			igt_info("[umq-hdpflush][dma] DMA UMQ not available on this ASIC; skipping\n");
+		}
+	}
+
 	igt_fixture {
 		amdgpu_bo_clean(device, &bo);
 		amdgpu_device_deinitialize(device);
-- 
2.34.1

