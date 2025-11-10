Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8B6CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 17:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373910E43C;
	Mon, 10 Nov 2025 17:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H6rpxlVx";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6A310E43C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 17:00:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpB2G3a+a9EHh7278ZgN3UTBAcG9nVnlmxEBJwR7MbG6VyNU088Qz4Aia4uRtcpMpTuYTYY+xetpfVxUpA1wfoHKseA54tZt17I90VHAlP1625lz5/loB/OGOWaKGxaQKfhXOO6bhhkoGrCJLYbdGajYfRO3nyF6u2owHt7Dqji7QzfOdrRKGu0vlGBjCdTCt2937kwfe8uFCBAbGQXNEMm/e5W+Bt5NzLOgcFELoEveth/0kkQ2B6SRk/aYYrTtyrqeO655MAGJ6zIiT4R208YEzadxEogETZkoEN2OWt1Ab75VJZkwEfRXFgmI54Y5aYkPxIgLCJxCfWJ9SLFkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkqo45qtPYax5pQPDMYOzIk6FLbwGY/igYYdGwJ1Er0=;
 b=mSa6oQA+h4M4ts59dhQnu3FMjxzxPby1CaU5sniupx0tWu5cdnCMUzg1oyzFIVlrmVtNLbMIhWGjHQz3s0WUYthokWb8DbfaeU++dd1jxFRSWToU4U2bXxLjD3umx2dQHVtVIwNCAMzDEOIQV9Elcn4iJ+2xF/O9GO9veAKpyQ4Dotk8lsqO+tLdqSWmj4sLbcfWzonKrRrsYBYWExp07xEDIrIYc8PeWRp8P341NoimgrY7Lt2ezL/hJ4gCgoy7Ci3SAs0rEu4MgGYskiuoNPPKe7mcpKLOSrq+att8kbqs5BXYeSNDAxggyBIQqDpg987S5i6osZXpzxCZUobxwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkqo45qtPYax5pQPDMYOzIk6FLbwGY/igYYdGwJ1Er0=;
 b=H6rpxlVxOhvS+qbsiqs/rF7+KsmccDSumXN3CizwjBtKZsR0ZnYkxrsgz41tt5ABz6trIzgxrZxehA0fM3GH6CpeYZGghuWmb6CpM1I1hZOSrZU2fE/Ea52dNj3tF3Ff7+0C1Vjl7Wh0jOACrx865MPAwlHF1TtACLr6NeECh5U=
Received: from SJ0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:a03:333::32)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 17:00:39 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::39) by SJ0PR03CA0117.outlook.office365.com
 (2603:10b6:a03:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 17:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Mon, 10 Nov 2025 17:00:38 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 10 Nov 2025 09:00:36 -0800
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH] =?UTF-8?q?tests/amdgpu/amd=5Fbo:=20Add=20UMQ-based=20HDP?=
 =?UTF-8?q?=20flush=20VRAM=E2=86=92GTT=20coherency=20test?=
Date: Mon, 10 Nov 2025 22:30:18 +0530
Message-ID: <20251110170018.43649-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8613be-7adf-4978-1209-08de207aac73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjJvS0lvam0wVklMdHZBMzk4NE9xVEtPZ3dPL2tlaG1LendjWFVxaGNDbUIz?=
 =?utf-8?B?QVZYOTdvdDkvOUVoZ0YwRzlZNzYwV2dhSEc4SFVYTFg3alVUVk9QTnl5UnJS?=
 =?utf-8?B?clltV1NnWjlScDlUckNMTjVwQ2RDMEZvb3VHZEovRzNpajM4VmRJOFVlaStG?=
 =?utf-8?B?SU9YT3hQN3E5endaVHAzdzVseHJnQy9GTnkwZDJKaUpsbnFuQVRNQWY4Q1VS?=
 =?utf-8?B?NVA3elltVzdEM3FNM1dFSXpnamxqUkxPWitWL1dNUU12cnVyRU9ZbzE1NEVm?=
 =?utf-8?B?aUlqYkFHNFBNU0IrdERoWkl6QWdJcnpycEtBWXB2dGs1V0JJNUNpV1l0WWRj?=
 =?utf-8?B?anhqcXcvcElZU0N5L0poeEJ5aTJpUlF5dTYzSytWLzBPdnJqZDZrbWhOOGFk?=
 =?utf-8?B?cGc2a3VndW1pZ1ZyK0xabDVtUGxBVEhRd1gvUzZsUE85ZVNtbzA5MlE5RkNO?=
 =?utf-8?B?RGVWekEvNEtpTkZqc0U3RzlHN2FsYjNzVDlkLzZOd3JqMjEwRGRlSXpCVGFK?=
 =?utf-8?B?NS9lSlNRU09pUXpidjVVZHNTbURHa3BXcEZsOGJjWXBDYTJHMFY4TEtlYUN1?=
 =?utf-8?B?RWlWNnRwSGp4RmNKbXd5dmhmdXRGc0NjcGZ6ZHlaWm5DbzdDU0RaN1BtOUpL?=
 =?utf-8?B?MDZqbFVVN2dDWnZqV1E0TXZIVzYraGlTRWhiZGU2Yi9mRXJORmN0Y0ZyQ1hx?=
 =?utf-8?B?cEVEdG8vbTRUWkJXSHVNclpJTUM0eHE5TkY2ajBtdURkaHhQZXdtblJZQ1ln?=
 =?utf-8?B?WjYrMk93M2p0aUFJcmFsQit0ZUdoalBmT3VjRG0ybkFZaEtXVlIzcnNNL0Yw?=
 =?utf-8?B?MnJzeXIwMVZRcStNOVJzZkw0WnkwMm5ZTWUrbG5Fd0pUcnRNc29jMXdPRlFa?=
 =?utf-8?B?Zmk5MkJxeUVHUHR5cHhuQk5zYlNFbGtjN3ovNjMxRmpwQXdEcW5KMHJHMFdn?=
 =?utf-8?B?a0JUUHY0WEU0dGxLampkdVFsNms2ZVdzazNlWnVQL1NjUFo2U3diUER3OUFu?=
 =?utf-8?B?ZEtXNCtteVVXTmZmV1RBTndUZG9jb1BRWm16Nm1OK3M1UG51QjM0d2t6ZXZx?=
 =?utf-8?B?SjlveEdmOUpmazBackpma1B6TVZyNlJsdlFEcjN4VlVHRmF2UDlrWHp5bDlS?=
 =?utf-8?B?Q3lsUktmTnY2c0FPYkgwK3JJVVJ1WUdWU1RKWHdWOC9qY0JWTGVXTzFrNUlX?=
 =?utf-8?B?ZTUwdE5BUy9YaXV3YVVUS1VEaWdsNmovRE9LWFR4L2I5UDVxQVZsejJCN21l?=
 =?utf-8?B?QjlMM3A3UlR3aVdLcWlwUmxGVVRxcnBqbStnVXdMbFFNZlJZWElMMWZ2RlNW?=
 =?utf-8?B?WlcydWlvdU1RaklIQndBU2FNT3BZdXBRdkdwSHZ4RmNjMno1RTRsdWJra3Y5?=
 =?utf-8?B?Q1dKdDd5N0dzQ1gyUmU1ei9FQXpPVmFnUHRNNFpBd0MxRkxDSFh5eFRuT0Yz?=
 =?utf-8?B?RDdsdHR0a1A2akJ5SHVpaEkwYk1tajdxYnNLTHB6TmRrYzEzSjQ4M2wvbGQr?=
 =?utf-8?B?ZkYxQ1d1RklsTVM0d0hmUng4b1Y5TXVFSzQ3QmVDSkR6UmlsY0ljeTVQbmdG?=
 =?utf-8?B?ZVlZU0wyNU5sb3BvYkMyUjJJSnQyOG1HcGpqL0xIMml4aUlXV2ZTTTh5NUh3?=
 =?utf-8?B?cmpRRy9XOTdRdkFFVWsvb04zWkxNMkdlWHZlVWdyTDZQN2FMR1Boc25mUkVl?=
 =?utf-8?B?Z3FDais4cFY4YWIzclhrbGV2S2h4VFI5REtvMk03ajd0MmxLL3JHSFBpdzJM?=
 =?utf-8?B?VnZqTHNHVVBvZ2xhZ2lubUhQYUhUeUQ1RVFhclp5YVdjMFR4U0ovUWhtU2dP?=
 =?utf-8?B?dkRiRGthZEZoWmltUHZKMW9qN0lSclcxY2hBMWRkbFhTa21rUmpXdFBlRmkr?=
 =?utf-8?B?eHpTUHI1Z1djMG5GZzFWU1V5dWNnVWpFYnpnUXhUa2QzeDBYcjJmTzhra25z?=
 =?utf-8?B?UDJDeWlFR2FwNXRoR1U1MUw5dEdRL0lXQnpDMGUwUzJ4US9JQk1rcTlMVVV3?=
 =?utf-8?Q?7lED4EUaOIANUggIjrBwBYtfdwC+ic=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 17:00:38.3165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8613be-7adf-4978-1209-08de207aac73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803
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

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_bo.c | 295 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 295 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 2243eea04..9494348cf 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -9,6 +9,7 @@
 
 #include "igt.h"
 #include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
 
 #include <unistd.h>   /* sysconf() */
 #include <string.h>
@@ -366,11 +367,272 @@ amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
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
+	const int pm4_dw = 256;             /* dwords */
+
+	struct amdgpu_ring_context *ring_context = NULL;
+	bool userq_created = false;
+	amdgpu_bo_handle mmio_bo = NULL;
+	void *mmio_cpu = NULL;
+	bool have_mmio_flush = false;
+
+	uint32_t available_rings = 0; /* UMQ slots mask */
+	int r, ring_id;
+
+	const char *ip_tag =
+		(ip_block->type == AMDGPU_HW_IP_DMA) ? "dma" :
+		(ip_block->type == AMDGPU_HW_IP_GFX) ? "gfx" : "ip";
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
+	{
+		struct amdgpu_bo_alloc_request req = {
+			.alloc_size     = AMDGPU_GPU_PAGE_SIZE,
+			.phys_alignment = AMDGPU_GPU_PAGE_SIZE,
+			.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP,
+			.flags          = 0,
+		};
+		r = amdgpu_bo_alloc(device, &req, &mmio_bo);
+		if (!r) {
+			r = amdgpu_bo_cpu_map(mmio_bo, &mmio_cpu);
+			if (!r && mmio_cpu) {
+				have_mmio_flush = true;
+				igt_info("[umq-hdpflush][%s] MMIO_REMAP mapped: cpu=%p\n",
+					 ip_tag, mmio_cpu);
+			} else {
+				igt_info("[umq-hdpflush][%s] MMIO_REMAP map failed r=%d; "
+					 "continuing without flush\n", ip_tag, r);
+				(void)amdgpu_bo_free(mmio_bo);
+				mmio_bo = NULL;
+			}
+		} else {
+			igt_info("[umq-hdpflush][%s] MMIO_REMAP alloc r=%d; continuing without flush\n",
+				 ip_tag, r);
+		}
+	}
+
+	/* Pick the first available UMQ slot and run once */
+	for (ring_id = 0; (1u << ring_id) & available_rings; ring_id++) {
+		uint64_t src_flags = 0; /* NORMAL */
+		uint64_t dst_flags = 0; /* NORMAL */
+		uint32_t *src32, *dst32;
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
+		{
+			uint32_t got = dst32[1];
+
+			igt_info("[umq-hdpflush][%s] PASS-A dst32[1]=0x%08x (expect 0x0000BEEF)\n",
+				 ip_tag, got);
+			if (have_mmio_flush)
+				igt_assert_eq_u32(got, 0x0000BEEF);
+		}
+
+		/* PASS-B: change only the tag to 0xFACE, NO flush */
+		src32[1] = 0x0000FACE;
+		igt_info("[umq-hdpflush][%s] PASS-B tag: src32[1]=0x%08x (NO flush)\n",
+			 ip_tag, src32[1]);
+
+		ip_block->funcs->copy_linear(ip_block->funcs, ring_context,
+					     &ring_context->pm4_dw);
+		amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
+
+		{
+			uint32_t got = dst32[1];
+
+			igt_info("[umq-hdpflush][%s] PASS-B dst32[1]=0x%08x "
+				 "(expect 0x0000FACE if coherent w/o flush)\n",
+				 ip_tag, got);
+			if (got != 0x0000FACE)
+				igt_info("[umq-hdpflush][%s] PASS-B: STALE (saw 0x%08x)\n",
+					 ip_tag, got);
+			else
+				igt_info("[umq-hdpflush][%s] PASS-B: MATCH without flush\n",
+					 ip_tag);
+		}
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
@@ -383,6 +645,15 @@ igt_main
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
@@ -409,6 +680,30 @@ igt_main
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

