Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739FDCA1009
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 09:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BEA10E3CB;
	Wed,  3 Sep 2025 09:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SUONCwSr";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3310E3CB
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 09:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQGeBx9HcXUgTkb/FfDhZERjxI4GM5mud5XV2LJiLc3JRSR2hGZtq3+Hro7IzyJ1dQJ2mNCfLyubfp2c2oxJtMgAQhYPLQz3EdZR9p2dGo1GrYH4jRetf3TSKMBxnIcrjvJ9+tdWBpK0UPJUbRcYesAON0RPecXKPAIMgyNYgH4WMQrX5Wb2zHTGN/yr7vX2hNvQibZzN+9EZJhroXrusPUa0Z8EQ6km8KjZHZl5yHDV2oAS+9URxDu2vwWhTo0lCkkNvaKOTCp/Neu3MuMwxhR0LAb7nBrXU1Mmj1bgH3wa0b3Mf45rTggY+/CQW2wEng8c7JW7Fn+tEIgJ8/G5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz1Jn4S6Zz5FgiOL4qlyDivJQQYZtMy7H1owCcrx1Ko=;
 b=jRIkqrBEseBSicAprQ1CBfOKt1HsonBPvlESs76j9qF2cT+n2goWIo18DYxRvqBETObP/5xm4hXUrqdNZbOMNmQdMw2Nn6K61uaado/mrXYnZBhy69IqBaFy+/pe6PyZS8ixsW1CLzl6+RbQKeCy18ZIIh4t9IIuDYfAiYNppRpbmeYcqjUcIq4zJaunVnbVwzGvKH3hIbdELzn7t/v7Kzo4SNz5LqsXSPwOS4rrM2zjouEv+XC/3W9wANUVUd0PvWin6QLFPuZQN0+AaUJ6Gd1ZNQRYnJW8UkYtjIBaeZPyFAMKOtxepm0HjCebr9iYRglECV7S/8fxMDSmWdouTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz1Jn4S6Zz5FgiOL4qlyDivJQQYZtMy7H1owCcrx1Ko=;
 b=SUONCwSrzr2TEN1/e3N+C5+swcIR12WXk2/2IsO8YbcMnvOJ0Q4hZN1QN5S273UE2N8vGhhwOzx1P8nicG5vHihgDSUoSt2HhxGyOmMNSP2h7VgtO03fAFh29cbskmJz+9EZeO8L8iaRFGJ1GzdV5U4/3I/JRNKKn/wtYHC+Vsk=
Received: from SJ0PR13CA0143.namprd13.prod.outlook.com (2603:10b6:a03:2c6::28)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 09:29:19 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::d7) by SJ0PR13CA0143.outlook.office365.com
 (2603:10b6:a03:2c6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Wed,
 3 Sep 2025 09:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 09:29:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 04:29:17 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 3 Sep 2025 04:29:10 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.zhang <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: add support for user queue mode in dispatch
 tests
Date: Wed, 3 Sep 2025 17:29:06 +0800
Message-ID: <20250903092909.2606696-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4d5be0-bea4-4119-68bf-08ddeacc5b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SKaLLQfxfUEaCzmrBdFsECpflmFSzSVoYuInWjw783uiX5tCjv5WBcCfQCcJ?=
 =?us-ascii?Q?MNsB6/n+7C3PpqmdTVctfgoDyZYkGl8JGH1cYxYmCr5ayMfSb8S4mv0aR9P6?=
 =?us-ascii?Q?PN/dhQsLLSeQETYYALy/onc4zvL+FZQ79yBapAHh3PPHHcLF8qmw4aT+o/ks?=
 =?us-ascii?Q?hvJmuZrjDjUvRDcE9/E75SP79qeW4UHf8ASFYzzqBzXbHK08tHmlhSJ9ivUp?=
 =?us-ascii?Q?mCTqBhd59pTpd/kbMuROQAm6X+StKT8w+y5mi0Ncq0LaNeFgW0dZCHYRtp6b?=
 =?us-ascii?Q?qmaHls7TPoZ1UAkREXIjgzDDvq1lSI5EMZQlsKtMBW4W0Ay5yIPUGK9BoP3A?=
 =?us-ascii?Q?ddL7pBUxLMo4jj8bru7KLC5Dwo8MUedIunAkofz2hEVqAxl1QcA88eMqtcyx?=
 =?us-ascii?Q?54t4SeapcGxihYwuOEn+lhZtqo2KIGoON6wl5yi3+R1/UWflyEFH+EB1S/o6?=
 =?us-ascii?Q?/K+xeUNF2gJplhYnhWvHMalIypOlFrHXJfW1K1oFVF0ElPX8QwzrW5oR+fFM?=
 =?us-ascii?Q?ENyij00mxMzITnvrydtwjqzPHUAPDkq/8BoWLFXvEg++vOFDeD5fPIVCBBFn?=
 =?us-ascii?Q?bHZIvB2bW/ieOTaMuiwFarkwEIOjNg8FT/xT1l9Wo0BNSrYR+xNADSLi6jn5?=
 =?us-ascii?Q?7tlHTCYH95ZTF7xS2PAMGxBOMTNpMuuyELMKlAPNBSsCDNfD19W9Iebzy18m?=
 =?us-ascii?Q?T4jkkYvbT7Ksnk92fLEPqsL+aYUzTNFesvErfQgei0WYB4dmu22FlHNUcaEM?=
 =?us-ascii?Q?K2/4h1yyKfdhloQeiWxp+hJJJakk7KpeQddcnqE15tmMQmnVKe+M/sneoBmp?=
 =?us-ascii?Q?hZTN3CyMVUdpD58z9SnuxwlLjhCHQb0yvPU/dVhZ1JfjFhuWVvOne2gkPjVh?=
 =?us-ascii?Q?RO7g/qLaVU/ciobC7xLo5MLdrhFpkoJ53Bx0OM1s2oUuPHjHG9eU1lFq9aJH?=
 =?us-ascii?Q?FWqf0x2MVvZ/Hc1ZAXqfqVtabuqh9KwRmyR5WCL0O7ga4iEDpKHIWeUFkLfZ?=
 =?us-ascii?Q?mnfI4DxxmqHfjdWz726UhjwNW36Wh/Qy1DqKdGpj281hPU6DZAjUqcRgl8nS?=
 =?us-ascii?Q?+6ScoRWczrRmRyAtt57FHoHnkps99sDY/nWIYvEan7qoPmyT6cRQD2X9iI2E?=
 =?us-ascii?Q?4je1DKqv6GyQa7N6lrIB1kJac9HOVUjEhQgOL/WXLUpvOB20ntBFsV3wDnRn?=
 =?us-ascii?Q?M51BB+TMzRjWHcBZQC0REpQHaocL4FtgECv/RS53BSCL8VnHmYz3Zh/+xPL4?=
 =?us-ascii?Q?oJuCxa+lZAgy8lzcoeHLnE17B1hB8iYCVfv5tEiti0iXL4Uv7YciyYmkg0fZ?=
 =?us-ascii?Q?vSiyXI09QinHzVcz4j1I2MYKZhWgR28mMVn7tGwlKmTSzkpKRrufBre+bxEd?=
 =?us-ascii?Q?vk7SE5DzPGczSYLq/svckYv5i1wm9AFyoPrBqrOF7nwrAw/iGE02YmanA/oF?=
 =?us-ascii?Q?mkdMNBfCZkE1gNfciZJbgWTdye5HyDwdpjHE6p1YbLhE38ytz3MXdZQFa4Hl?=
 =?us-ascii?Q?742gq1vJy/QvxjFCFnpgwZp4AKse4APfYR+V?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 09:29:17.9259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4d5be0-bea4-4119-68bf-08ddeacc5b30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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

From: "Jesse.zhang" <Jesse.zhang@amd.com>

This commit introduces user queue mode functionality to the amdgpu dispatch tests,
allowing tests to run using user queues.
Key changes include:

Added user_queue parameter to test functions to toggle between traditional
and user queue modes.

Implemented user queue creation, submission, and destruction paths alongside
existing code.

Added timeline syncobj handling for user queue synchronization.

Extended IP block capabilities checking to include user queue readiness.

The changes ensure both kernel queue and user queue modes can coexist, with the
kernel mode remaining as the default. User queue tests are conditionally
enabled via environment variable and hardware capability checks.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c      | 312 ++++++++++++++++++++++-----------
 lib/amdgpu/amd_dispatch.h      |   7 +-
 tests/amdgpu/amd_dispatch.c    |  74 ++++++--
 tests/amdgpu/amd_queue_reset.c |   2 +-
 4 files changed, 274 insertions(+), 121 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 3153d88a0..8fb0c4694 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -36,18 +36,37 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	uint32_t expired;
 
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	struct amdgpu_ring_context *ring_context = NULL;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	uint64_t seq_no;
+	bool use_uc_mtype = false;
 
-	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
-		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
-	else
-		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if (user_queue) {
+		ring_context = calloc(1, sizeof(*ring_context));
+		igt_assert(ring_context);
 
-	igt_assert_eq(r, 0);
+		ip_block = get_ip_block(device_handle, ip_type);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+	} else {
+		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
+		    r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+		else
+		    r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+		igt_assert_eq(r, 0);
+	}
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
-					AMDGPU_GEM_DOMAIN_GTT, 0,
-					&bo_cmd, (void **)&ptr_cmd,
-					&mc_address_cmd, &va_cmd);
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
+					AMDGPU_GEM_DOMAIN_GTT, 0, 0,
+					&bo_cmd, (void **)&ptr_cmd, &mc_address_cmd, &va_cmd,
+					user_queue ? ring_context->timeline_syncobj_handle : 0,
+					user_queue ? ++ring_context->point : 0,
+					user_queue);
+
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+		       ring_context->timeline_syncobj_handle,
+		       ring_context->point);
+	}
 	igt_assert_eq(r, 0);
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
@@ -119,8 +138,11 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	resources[0] = bo_dst;
 	resources[1] = bo_shader;
 	resources[2] = bo_cmd;
-	r = amdgpu_bo_list_create(device_handle, 3, resources, NULL, &bo_list);
-	igt_assert_eq(r, 0);
+
+	if (!user_queue) {
+		r = amdgpu_bo_list_create(device_handle, 3, resources, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
@@ -131,25 +153,33 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	ibs_request.ibs = &ib_info;
 	ibs_request.fence_info.handle = NULL;
 
-	/* submit CS */
-	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		ring_context->pm4_dw = ib_info.size;
+		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+				       mc_address_cmd);
+		seq_no = ring_context->point;
+	} else {
+		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+		igt_assert_eq(r, 0);
+		seq_no = ibs_request.seq_no;
+	}
 
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(r, 0);
 
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = 0;
-	fence_status.context = context_handle;
-	fence_status.fence = ibs_request.seq_no;
+		fence_status.ip_type = ip_type;
+		fence_status.ip_instance = 0;
+		fence_status.ring = 0;
+		fence_status.context = context_handle;
+		fence_status.fence = seq_no;
 
-	/* wait for IB accomplished */
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	igt_assert_eq(r, 0);
-	igt_assert_eq(expired, true);
+		r = amdgpu_cs_query_fence_status(&fence_status,
+				 AMDGPU_TIMEOUT_INFINITE,
+				 0, &expired);
+		igt_assert_eq(r, 0);
+		igt_assert_eq(expired, true);
+	}
 
 	/* verify if memset test result meets with expected */
 	i = 0;
@@ -160,7 +190,14 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
 	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
-	amdgpu_cs_ctx_free(context_handle);
+
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+		free(ring_context);
+	} else {
+		amdgpu_cs_ctx_free(context_handle);
+	}
+	free_cmd_base(base_cmd);
 }
 
 int
@@ -168,7 +205,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 				amdgpu_context_handle context_handle_param,
 				uint32_t ip_type, uint32_t ring, uint32_t priority,
 				uint32_t version, enum cmd_error_type hang,
-				struct amdgpu_cs_err_codes *err_codes)
+				struct amdgpu_cs_err_codes *err_codes, bool user_queue)
 {
 	amdgpu_context_handle context_handle_free = NULL;
 	amdgpu_context_handle context_handle_in_use = NULL;
@@ -190,9 +227,18 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_bo_list_handle bo_list;
 	struct amdgpu_cs_fence fence_status = {0};
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
-
-	if (context_handle_param == NULL) {
-		if( priority == AMDGPU_CTX_PRIORITY_HIGH) {
+	struct amdgpu_ring_context *ring_context = NULL;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	uint64_t seq_no;
+
+	if (user_queue) {
+		ring_context = calloc(1, sizeof(*ring_context));
+		igt_assert(ring_context);
+
+		ip_block = get_ip_block(device_handle, ip_type);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+	} else if (context_handle_param == NULL) {
+		if (priority == AMDGPU_CTX_PRIORITY_HIGH) {
 			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle_in_use);
 			context_handle_free = context_handle_in_use;
 			igt_assert_eq(r, 0);
@@ -205,10 +251,19 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		context_handle_in_use = context_handle_param;
 	}
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
 				    &bo_cmd, (void **)&ptr_cmd,
-				    &mc_address_cmd, &va_cmd);
+				    &mc_address_cmd, &va_cmd,
+				    user_queue ? ring_context->timeline_syncobj_handle : 0,
+				    user_queue ? ++ring_context->point : 0,
+				    user_queue);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+		       ring_context->timeline_syncobj_handle,
+		       ring_context->point);
+	}
+
 	igt_assert_eq(r, 0);
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
@@ -307,8 +362,10 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	resources[2] = bo_dst;
 	resources[3] = bo_cmd;
 
-	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
@@ -318,26 +375,38 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
 	ibs_request.fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
+	if (user_queue) {
+		ring_context->pm4_dw = ib_info.size;
+		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+				       mc_address_cmd);
+		seq_no = ring_context->point;
+	} else {
+		r = amdgpu_cs_submit(context_handle_in_use, 0, &ibs_request, 1);
+		seq_no = ibs_request.seq_no;
+	}
+
 	if (err_codes)
 		err_codes->err_code_cs_submit = r;
 
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = 0;
-	fence_status.context = context_handle_in_use;
-	fence_status.fence = ibs_request.seq_no;
-
-	/* wait for IB accomplished */
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
-	if (err_codes)
-		err_codes->err_code_wait_for_fence = r;
+	if (!user_queue) {
+		fence_status.ip_type = ip_type;
+		fence_status.ip_instance = 0;
+		fence_status.ring = 0;
+		fence_status.context = context_handle_in_use;
+		fence_status.fence = seq_no;
+
+		r = amdgpu_cs_query_fence_status(&fence_status,
+				 AMDGPU_TIMEOUT_INFINITE,
+				 0, &expired);
+		if (err_codes)
+		    err_codes->err_code_wait_for_fence = r;
+	}
 
 	if (!hang) {
-		igt_assert_eq(r, 0);
-		igt_assert_eq(expired, true);
+		if (!user_queue) {
+		    igt_assert_eq(r, 0);
+		    igt_assert_eq(expired, true);
+		}
 
 		/* verify if memcpy test result meets with expected */
 		i = 0;
@@ -346,29 +415,37 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			igt_assert_eq(ptr_dst[i], ptr_src[i]);
 			i++;
 		}
-	} else {
+	} else if (!user_queue) {
 		r2 = amdgpu_cs_query_reset_state(context_handle_in_use, &hang_state, &hangs);
 		igt_assert_eq(r2, 0);
 	}
 
-	amdgpu_bo_list_destroy(bo_list);
+	if (!user_queue) {
+		amdgpu_bo_list_destroy(bo_list);
+	}
+
 	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
 
-	if(context_handle_free)
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+		free(ring_context);
+	} else if (context_handle_free) {
 		amdgpu_cs_ctx_free(context_handle_free);
+	}
 
-
+	free_cmd_base(base_cmd);
 	return r;
 }
 
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
-				      int version, uint32_t gpu_reset_status_equel)
+				      int version, uint32_t gpu_reset_status_equel,
+				      bool user_queue)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -392,21 +469,40 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	struct amdgpu_cs_fence fence_status = {0};
 
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	struct amdgpu_ring_context *ring_context = NULL;
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	uint64_t seq_no;
 
 	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
 	igt_assert_eq(r, 0);
 
-	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
-		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
-	else
-		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+	if (user_queue) {
+		ring_context = calloc(1, sizeof(*ring_context));
+		igt_assert(ring_context);
 
-	igt_assert_eq(r, 0);
+		ip_block = get_ip_block(device_handle, ip_type);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+	} else {
+		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
+			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+		else
+			r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+		igt_assert_eq(r, 0);
+	}
 
-	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, bo_cmd_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
 				    &bo_cmd, (void **)&ptr_cmd,
-				    &mc_address_cmd, &va_cmd);
+				    &mc_address_cmd, &va_cmd,
+				    user_queue ? ring_context->timeline_syncobj_handle : 0,
+				    user_queue ? ++ring_context->point : 0,
+				    user_queue);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+					       ring_context->timeline_syncobj_handle,
+					       ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 	igt_assert_eq(r, 0);
 	memset(ptr_cmd, 0, bo_cmd_size);
 	base_cmd->attach_buf(base_cmd, ptr_cmd, bo_cmd_size);
@@ -495,8 +591,10 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	resources[1] = bo_src;
 	resources[2] = bo_dst;
 	resources[3] = bo_cmd;
-	r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
-	igt_assert_eq(r, 0);
+	if (!user_queue) {
+		r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	ib_info.ib_mc_address = mc_address_cmd;
 	ib_info.size = base_cmd->cdw;
@@ -506,50 +604,64 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	ibs_request.number_of_ibs = 1;
 	ibs_request.ibs = &ib_info;
 	ibs_request.fence_info.handle = NULL;
-	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		ring_context->pm4_dw = ib_info.size;
+		ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
+					      mc_address_cmd);
+		seq_no = ring_context->point;
+	} else {
+		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+		igt_assert_eq(r, 0);
+		seq_no = ibs_request.seq_no;
+	}
 
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = 0;
-	fence_status.context = context_handle;
-	fence_status.fence = ibs_request.seq_no;
+	if (!user_queue) {
+		fence_status.ip_type = ip_type;
+		fence_status.ip_instance = 0;
+		fence_status.ring = 0;
+		fence_status.context = context_handle;
+		fence_status.fence = seq_no;
 
-	/* wait for IB accomplished */
-	r = amdgpu_cs_query_fence_status(&fence_status,
-					 AMDGPU_TIMEOUT_INFINITE,
-					 0, &expired);
+		/* wait for IB accomplished */
+		r = amdgpu_cs_query_fence_status(&fence_status,
+						 AMDGPU_TIMEOUT_INFINITE,
+						 0, &expired);
 
-	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
-	igt_assert_eq(r, 0);
-	r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
-	igt_assert_eq(r2, 0);
+		r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
+		igt_assert_eq(r, 0);
+		r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
+		igt_assert_eq(r2, 0);
 
-	if (!(reset_flags == 0 ||
-		  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
+		if (!(reset_flags == 0 ||
+			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
+			/* If we're in reset and reset hasn't occurred, then check
+			 * that the hang state is equal to the GPU reset status and
+			 * assert otherwise.
+			 */
+			igt_assert_eq(hang_state, gpu_reset_status_equel);
+		}
 
-		/* If we're in reset and reset hasn't occurred, then check
-		 * that the hang state is equal to the GPU reset status and
-		 * assert otherwise.
-		 */
-		igt_assert_eq(hang_state, gpu_reset_status_equel);
+		r = amdgpu_bo_list_destroy(bo_list);
+		igt_assert_eq(r, 0);
 	}
 
-	r = amdgpu_bo_list_destroy(bo_list);
-	igt_assert_eq(r, 0);
-
 	amdgpu_bo_unmap_and_free(bo_src, va_src, mc_address_src, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_address_cmd, bo_cmd_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
-	amdgpu_cs_ctx_free(context_handle);
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+		free(ring_context);
+	} else {
+		amdgpu_cs_ctx_free(context_handle);
+	}
 	free_cmd_base(base_cmd);
 }
 
 void
 amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-				 uint32_t ip_type, const struct pci_addr *pci)
+				 uint32_t ip_type, const struct pci_addr *pci, bool userq)
 {
 	int r;
 	FILE *fp;
@@ -628,12 +740,12 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
 					    ring_id, prio, version,
-						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
+						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      prio, version, AMDGPU_CTX_UNKNOWN_RESET);
+						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
-					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
+					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
 	}
 
 	/* recover the sched mask */
@@ -645,7 +757,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 }
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type,
-		enum cmd_error_type hang, const struct pci_addr *pci)
+		enum cmd_error_type hang, const struct pci_addr *pci,  bool userq)
 {
 	int r;
 	FILE *fp;
@@ -724,9 +836,9 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 			igt_assert_eq(r, 0);
 		}
 		amdgpu_memset_dispatch_test(device_handle, ip_type, prio,
-					    version);
+					    version, userq);
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
-					    version, hang, NULL);
+					    version, hang, NULL, userq);
 	}
 
 	/* recover the sched mask */
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 166c6d7a8..45858ba4b 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -29,7 +29,7 @@
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
 			      uint32_t ip_type, enum cmd_error_type hang,
-				  const struct pci_addr *pci);
+				  const struct pci_addr *pci, bool userq);
 
 int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					amdgpu_context_handle context_handle,
@@ -38,10 +38,11 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t priority,
 					uint32_t version,
 					enum cmd_error_type hang,
-					struct amdgpu_cs_err_codes *err_codes);
+					struct amdgpu_cs_err_codes *err_codes,
+					bool userq);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
-				      uint32_t ip_type, const struct pci_addr *pci);
+				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
 
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index ceedbccd9..06bfebd14 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -15,30 +15,30 @@
 
 static void
 amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
-		const struct pci_addr *pci)
+		const struct pci_addr *pci, bool userq)
 {
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX, pci);
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX, pci, userq);
 }
 
 static void
 amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle,
-		const struct pci_addr *pci)
+		const struct pci_addr *pci, bool userq)
 {
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE, pci);
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE, pci, userq);
 }
 
 static void
 amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle,
-		enum cmd_error_type error, const struct pci_addr *pci)
+		enum cmd_error_type error, const struct pci_addr *pci, bool userq)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pci);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, error, pci, userq);
 }
 
 static void
 amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle,
-		enum cmd_error_type error, const struct pci_addr *pci)
+		enum cmd_error_type error, const struct pci_addr *pci, bool userq)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error, pci, userq);
 }
 
 static void
@@ -72,8 +72,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu,
 	r = amdgpu_cs_ctx_free(context_handle);
 	igt_assert_eq(r, 0);
 
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci);
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0, pci, false);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0, pci, false);
 }
 
 igt_main
@@ -84,6 +84,13 @@ igt_main
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -104,13 +111,14 @@ igt_main
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 
 	}
 	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-test-compute")
-			amdgpu_dispatch_hang_slow_compute(device, &pci);
+			amdgpu_dispatch_hang_slow_compute(device, &pci, false);
 		}
 	}
 
@@ -118,7 +126,7 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-dispatch-test-gfx")
-			 amdgpu_dispatch_hang_slow_gfx(device, &pci);
+			 amdgpu_dispatch_hang_slow_gfx(device, &pci, false);
 		}
 	}
 
@@ -127,7 +135,7 @@ igt_main
 		if (arr_cap[AMD_IP_GFX] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
-			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
+			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
 		}
 	}
 
@@ -136,7 +144,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, false);
 		}
 	}
 
@@ -145,7 +153,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, false);
 		}
 	}
 
@@ -154,7 +162,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, false);
 		}
 	}
 
@@ -163,7 +171,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
-			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, false);
 		}
 	}
 
@@ -175,6 +183,38 @@ igt_main
 		}
 	}
 
+	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-hang-test-compute-umq")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER, &pci, true);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute-uqm")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, &pci, true);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute-uqm")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, &pci, true);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE-UQM") {
+		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute-uqm")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA, &pci, true);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 83dabf775..0e33e44a2 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -722,7 +722,7 @@ run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
 
 		if (is_dispatch) {
 			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, 0,version,
-					job.error, &err_codes);
+					job.error, &err_codes, false);
 		} else {
 			ret = amdgpu_write_linear(device, local_context,
 					ip_block_test, &job, &err_codes);
-- 
2.49.0

