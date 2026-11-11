Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB661606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uevt4mZq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B7C10E23C;
	Wed, 11 Nov 2026 05:50:52 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A186510E07D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfyhWeB14rJVvl40oG69TokdLrrTNb7cCtesPMrNj/d2O/vzH2HyBJP02bPjN5ESYGIo5p2SVs9yq8rNQ/2n61jhxg/iyCg2HQXh/VpVAQn3bgvWbfysZpg55JfUytd1UHEfdnZkDPQdPsNCNBW0frg9keX7P58k9MF0Z6mL3KiY7Hmhw9Y/ziD1WScRtoWj5Gf6GxEtzroel0ZkJx0/4xvBVWhZ/qwUFtE4O2N0KbBP6djDGu3CGaO7GfPJR50MX1hSahgXkuDGG3UHWpDcMM5nuAJkmgOKgZxwe9RneNT08RUfyvC22UFzknuLDP96SL6MnDVsKbTSNDQHUci0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwXDRWftGC9zev/G8Qx7LAFq3rBz2oXKls6RycQ75Jw=;
 b=gDofu9JPxbJHvYHFe7ZSL56pQ5FTtaeb290u//NaLQCJUT0BBFxVNGUyTxdjNM6ZxEGb1X4r7U2FuCtLkFTPbtQZvS7OnaP7M6Ui6lXl3yq4bfdlRX/auDtHfK6jiV+UO+Tf8ytQkABrKKzsBh+D3s98BX9/MqWQnjV4//y1o31RTDOBTn7/3QDfp5oi3AgIDGqBUfsH/IX6lOp2BMz7hKiMl0RKa8b4CbPlrO3QUz1a2lCtcV4lZpggLdGwwrKi5LBfdKAYxztFtFoFrlfdbkNSGSbqaG+9qMQO9V6urOpmOvYSrapJTC8VzpmVbUZ6vO7C93A9oW44JFMPN025fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwXDRWftGC9zev/G8Qx7LAFq3rBz2oXKls6RycQ75Jw=;
 b=uevt4mZq8QqICtjaTMpe6De99aFUI8cE4n4ykZ3y4eaq6DqjkDmK/dqCwa8CdkMJUHb147oh9pB/iLXV0x8cST+SgrZaGCqkSRQn98p2vZAUSIi3fg8ZU43IRpiSEe5OaTWLVvUWYAJ/3Yv70JHAJs/PuRq4OO5BuM9QZdIIGkc=
Received: from SJ0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:a03:333::20)
 by PH7PR12MB6443.namprd12.prod.outlook.com (2603:10b6:510:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:49:38 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::4) by SJ0PR03CA0105.outlook.office365.com
 (2603:10b6:a03:333::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Wed,
 11 Nov 2026 05:49:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:49:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:49:37 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:49:37 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 23:49:36 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: wait for the dispatch and write back
 the caches on user queues
Date: Wed, 11 Nov 2026 13:49:08 +0800
Message-ID: <20261111054935.3862301-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|PH7PR12MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 649ff29e-6fc9-42f4-049f-08df3fb792e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|261009223027099003|10067099003|261022115727099003|3023799007|261028144727099003|261102123227099003|261026135527099003|261026140227099003|261026121527099003|261026130827099003|261021133027099003|261021135927099003|261022113327099003|261021123027099003|261021121427099003|261022075727099003|261021130227099003|261022105027099003|56012099006|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 5HJ8YWmBs/VRbFiZzL3ZgGR/b+I8Qfz3Snp/B9GBj3+FjQP8d47unJS0dTcb4AdgzJ8ggkX5satOte1Wsjt5e1ORxh8kshwH5EysZAeKBtaUDTXT/acSGY/90artU/t7bKDGlv5uf/if4gJJ9Q9cis6Q7ArZrTWXnG00WKQb/jT6PKmCGY1Uqsb3+fbbX4yz2zc7CYxOWrDp3Kb+nctqR+fteJ0GRv9WqS88hlRLWkzPIForEhpQ0NSUNF0f/8d9bxsTNMOQyCilIDrikkIeq9r8xi+piMVI2Cpk3Zgq9MwIaNmBBV/DaEZad8xbbbuekh+f27Avog910aFtTqO7yJg4WfWaulzM7FDOCKyYq+suWTrNaOjn76Mb1ZAiLM9V3l4Q9T/SL67aMZi3FpqTxPdFAbQ4lwu8E3Fc6Hdt1KUBkXg50ZdqQ7g+EJ9wZMSgsMbP/Nmpblm13gR2zYqDBpPQ8jwRP/B6goPy5xLmv5UUin1xQjVpKffWUd7x3TIo3b+YSMAcQFdM33k3YlRzVxTy3TwGKsIPIeEKKHvO9qBuFmaTWMq0cJ/APDdLRhZzUpXW7vgOAZU58BNZER/OV8BhwckxAVpXZjnmieETMWDAlR1ZoTr5s+N4SV7ItWmI8mJxMarOX734hTmM5nWwyt3gmKXWZG9JM1JZMR4dbPusoYtGVTL1M/lOzsnmy1UEH7SSyHKsMftKoHqlfYiTPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(261009223027099003)(10067099003)(261022115727099003)(3023799007)(261028144727099003)(261102123227099003)(261026135527099003)(261026140227099003)(261026121527099003)(261026130827099003)(261021133027099003)(261021135927099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022075727099003)(261021130227099003)(261022105027099003)(56012099006)(5023799004)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SUGXt6meJvU7AdGR23M88zEppSiGZTrkroKpYUS5fUiiITnysiygbtoHWpUhqA96sUV4GmUIdR9O1rUYHDz8oTdgkOIzWXWKC7Z9ATU7RTQz3RxA4MASNzsIOBPpBWbTPiKvqED6hTumnWW20Mm1uzqWAGQNBkuw+JId5onuefbviogTafM4VcZ3Q9O3ckVkT/0OHKRy/fVn5DN935kLD/AnU4JF1TmrboHbjoPa4ahuoYINrYcEn7e7IDRwNYMi+NyONR/vCIvBh9zZqPgJ2M72ExCk8clFkuAgFoxKsKgPmv7Ueh5wKp9STmeA29a2Ql9nGFqfZpl4ZeI0MtXWTkaojiU06Ksb05R3EqH3evZb4sbxIIgOESbswmYDGVAJCVSZhBH5QmNT5tvklR5q4gTo0+mkWEz7IrozRa7eREd/xUEnLjy2FtBmsZDPC81E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:49:38.4551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649ff29e-6fc9-42f4-049f-08df3fb792e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6443
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

A user queue only signals its fence after the IB: unlike the kernel fence
of a kernel queue, it neither waits for the dispatched waves nor writes
the caches back. So the shader results of the dispatch helpers were never
visible on user queues, which went unnoticed as their check was skipped.
On navi31, with the check enabled:

  dst mismatch at byte 0 of 16384: got 0x00, expected 0x22

Add amdgpu_dispatch_write_sync() (CS_PARTIAL_FLUSH, then ACQUIRE_MEM
writing back and invalidating the caches) and emit it at the end of the
memset and memcpy dispatch IBs on user queues. Also wait for the page
table updates of their buffers there, and check the results on user
queues too.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c       | 85 +++++++++++++------
 .../compute_utils/amd_dispatch_helpers.c      | 44 ++++++++++
 .../compute_utils/amd_dispatch_helpers.h      |  2 +
 3 files changed, 107 insertions(+), 24 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index feac6aa2e..9cee17d6f 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -115,21 +115,34 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&bo_shader, &ptr_shader,
-					&mc_address_shader, &va_shader);
+					&mc_address_shader, &va_shader,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, CS_BUFFERCLEAR, version);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&bo_dst, (void **)&ptr_dst,
-					&mc_address_dst, &va_dst);
+					&mc_address_dst, &va_dst,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
+	/* A user queue doesn't wait for the page table updates by itself */
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 	/// TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd, version);
 
@@ -178,6 +191,10 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
 
+	/* Nothing waits for the dispatch on a user queue but the IB itself */
+	if (user_queue)
+		amdgpu_dispatch_write_sync(base_cmd, version);
+
 	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
 	resources[0] = bo_dst;
 	resources[1] = bo_shader;
@@ -199,8 +216,9 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
-		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
-				       mc_address_cmd);
+		r = ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+						  mc_address_cmd);
+		igt_assert_eq(r, 0);
 		seq_no = ring_context->point;
 	} else {
 		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
@@ -232,7 +250,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	}
 
 	/* The shader only filled the buffer if the submission completed. */
-	if (!user_queue && r == 0) {
+	if (r == 0) {
 		for (i = 0; i < bo_dst_size; i++)
 			igt_assert_f(ptr_dst[i] == 0x22,
 				     "dst mismatch at byte %d of %d: got 0x%02x, expected 0x22\n",
@@ -320,10 +338,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_shader_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_shader_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&bo_shader, &ptr_shader,
-					&mc_address_shader, &va_shader);
+					&mc_address_shader, &va_shader,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
@@ -331,17 +352,30 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&bo_src, (void **)&ptr_src,
-					&mc_address_src, &va_src);
+					&mc_address_src, &va_src,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_dst_size, 4096,
-					AMDGPU_GEM_DOMAIN_VRAM, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_dst_size, 4096,
+					AMDGPU_GEM_DOMAIN_VRAM, 0, 0,
 					&bo_dst, (void **)&ptr_dst,
-					&mc_address_dst, &va_dst);
+					&mc_address_dst, &va_dst,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
 	igt_assert_eq(r, 0);
+	/* A user queue doesn't wait for the page table updates by itself */
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 	///TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd,  version);
 	/*  Issue commands to set cu mask used in current dispatch */
@@ -407,6 +441,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
 
+	/* Nothing waits for the dispatch on a user queue but the IB itself */
+	if (user_queue)
+		amdgpu_dispatch_write_sync(base_cmd, version);
+
 	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP); /* type3 nop packet */
 
 	resources[0] = bo_shader;
@@ -429,8 +467,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	ibs_request.fence_info.handle = NULL;
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
-		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
-				       mc_address_cmd);
+		r = ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+						  mc_address_cmd);
 		seq_no = ring_context->point;
 	} else {
 		r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
@@ -455,10 +493,9 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	}
 
 	if (!hang) {
-		if (!user_queue) {
-		    igt_assert_eq(r, 0);
-		    igt_assert_eq(expired, true);
-		}
+		igt_assert_eq(r, 0);
+		if (!user_queue)
+			igt_assert_eq(expired, true);
 
 		/* verify if memcpy test result meets with expected */
 		i = 0;
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 180fbdd40..1105bb54b 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -99,6 +99,50 @@ amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
 	return base->cdw - offset_prev;
 }
 
+/*
+ * The fence the kernel emits after a job on a kernel queue waits for the
+ * dispatched waves and writes the caches back. A user queue only signals its
+ * fence after the IB, so the IB has to do that itself before the results can be
+ * read: wait for the dispatches to finish, then write back and invalidate the
+ * caches like the kernel's emit_mem_sync does.
+ */
+int
+amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base, uint32_t version)
+{
+	int offset_prev = base->cdw;
+
+	/* EVENT_WRITE: CS_PARTIAL_FLUSH, wait for the dispatches to finish */
+	base->emit(base, PACKET3_COMPUTE(PACKET3_EVENT_WRITE, 0));
+	base->emit(base, 0x7 | (4 << 8));
+
+	if (version == 9) {
+		/* ACQUIRE_MEM: CP_COHER_CNTL SH_ICACHE, SH_KCACHE, TC, TCL1 and TC_WB actions */
+		base->emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 5));
+		base->emit(base, (1 << 29) | (1 << 27) | (1 << 23) | (1 << 22) | (1 << 18));
+		base->emit(base, 0xffffffff);	/* CP_COHER_SIZE */
+		base->emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
+		base->emit(base, 0);		/* CP_COHER_BASE */
+		base->emit(base, 0);		/* CP_COHER_BASE_HI */
+		base->emit(base, 0xa);		/* POLL_INTERVAL */
+	} else {
+		/*
+		 * ACQUIRE_MEM: GCR_CNTL GL2 and GLM write back and invalidate,
+		 * GL1, GLV, GLK and GLI invalidate
+		 */
+		base->emit(base, PACKET3_COMPUTE(PACKET3_ACQUIRE_MEM, 6));
+		base->emit(base, 0);		/* CP_COHER_CNTL */
+		base->emit(base, 0xffffffff);	/* CP_COHER_SIZE */
+		base->emit(base, 0xffffff);	/* CP_COHER_SIZE_HI */
+		base->emit(base, 0);		/* CP_COHER_BASE */
+		base->emit(base, 0);		/* CP_COHER_BASE_HI */
+		base->emit(base, 0xa);		/* POLL_INTERVAL */
+		base->emit(base, (1 << 15) | (1 << 14) | (1 << 5) | (1 << 4) |
+			   (1 << 9) | (1 << 8) | (1 << 7) | (1 << 0));
+	}
+
+	return base->cdw - offset_prev;
+}
+
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr, uint32_t version, enum  cmd_error_type hang)
 {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index c0113519b..e1c6e37f4 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -33,6 +33,8 @@ int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base_cmd, uin
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
+int amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base_cmd, uint32_t version);
+
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
 int execute_compute_dispatch(amdgpu_device_handle device,
-- 
2.50.1

