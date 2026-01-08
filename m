Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C37D148AE
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A2610E696;
	Thu,  8 Jan 2026 06:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mLGPvebY";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013053.outbound.protection.outlook.com
 [40.93.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40C10E696
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqV+QKohVZ7kku3HiNRzRLrhSaIeF8S1ndeCtJFzc6Bts+v4pZR5LP5KpQ6hwZ8/uV2MV6ss3aMcND5CHcF+b3f+0AxUTwAEIXrBoCPToMJV3jEIFjbMBWRqv3MgO/oq8bDOMJJh1TmHG8f73+q1RYof6/mn/M7edeo8xL6CAAPEogO1XkvAHcvksffp4sB7VfTdz2brJh/lk+DXR6uaXlbex9pcKsnLlQL7wuEln9P8NNAFtNZalWD6MO4Zdo3o0CTm54Yua3d5B5TJ29s7awFVBA4iDXiq0cDERaVfbHyQJOLsu4SfUcSgJcamGN978AovfIKP3azW5xcmYL34gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh5CavAYh/IzNaVgy3nniR+eQ7IJYMQqr5AYm2YtHKA=;
 b=pgmRZNePYpLz9+WvIQhGgHqeguJbq0r2wIXvlfv4/kjBqkCaIiuNUVQH0NkIUtiPwboO2Wvl+uGst0ei+KhkG6F0w3S5ZdPc7UIzgplPoWoHm2YMuRGF2SrOVhsfFh5gs4xBlqwKu9VKa9ocpU8Vw6i2msDisinVrDw2NrSVI7ayhUWNaNDPSll02zJ2Y0tiIaEJzSK5Kvp0yfYFiGkAMw8NlQ08jiThh9zufmIB8YaQgz+9wDgZCA8J64bxKLrqrXQQXKe/k/jiEn5P6upLtlyR5FmarbCmWVFJyCEBC1yeyilBk1znjdXFepaafzKQKwEZXmRduVnnfM/HsdI4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh5CavAYh/IzNaVgy3nniR+eQ7IJYMQqr5AYm2YtHKA=;
 b=mLGPvebYT7hMh5Imxf80R4mhM+hoi2w9JKVGpxdqX/eD+jdn3jnj1NLQuevFUHm5xTXH7+Mnqe28YAoPmOfbg3El/4HpLfAA7/sqywfue3RuQGEoDsMVWGbGwqB2xfSqw7sOK4GoHReA1z0q+FH6EfxnCw18jF+YH3sJkEjCC1Y=
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 SA1PR12MB8887.namprd12.prod.outlook.com (2603:10b6:806:386::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 06:35:05 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::53) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 06:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 06:35:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 00:35:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 00:35:03 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 7 Jan 2026 22:34:57 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3] lib/amdgpu: implement selective sync skipping for
 error injection tests
Date: Thu, 8 Jan 2026 14:33:36 +0800
Message-ID: <20260108063451.4110907-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA1PR12MB8887:EE_
X-MS-Office365-Filtering-Correlation-Id: a673edc2-5814-4891-cda1-08de4e800f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H7eIfPQCE1yuVzKr/HjWnJz8eSsRwJGP5zwXqf0XL6OOBevHIGm355VsqCvF?=
 =?us-ascii?Q?ikqY/YKvVATTbO2VuUS4zD1F6/+CkjilRIo7FLdazH7++DNxyZumka4EvAG2?=
 =?us-ascii?Q?qSVEUEaGc9xULp2RpFYgbLfk56xYZhIiIO5r3iiDSCli3JZ2MEtvi5j/iKKf?=
 =?us-ascii?Q?KjLNVjS3cZ0/WVTPXGjXaA8MKfyBc8+gpW/zkp1nnx8925f1Szyvl2NosJfO?=
 =?us-ascii?Q?wYPzJsCIAGt0X5pZFfqWkbdPdb0ZFQ0Ix1sjmg2blAHLn1rhlTH9wg3whUrH?=
 =?us-ascii?Q?uWl2SLLGurd6pRuhzG9UHcqu/TgGD+7RqJlMmZt71gWFjmv6x27YphoPMzYS?=
 =?us-ascii?Q?GHyWoLMb/wUuBTGFR6WEXH42EQPw6GFOBudhC57dYSSn4yIhmhvBBFhZLias?=
 =?us-ascii?Q?JLUDP3GHBfQIXjQ+xxjr2T+43Rh7okaGM+6f9HmgZDGi8zqaOp9hgiFOkIrL?=
 =?us-ascii?Q?b82f8qijktYAfNWDI/o2GiV0RXBep0rMovmFhYG0HFLhsPTu2UjgVSLf0ZMT?=
 =?us-ascii?Q?21CazHD1jyLJJ0Pza6/FkPpctkiR0jOnC8P9ymkBi6PcVYIBLrVNl2bEuP2R?=
 =?us-ascii?Q?hvmBdu+3ze5I49780W/jZKDCArcyRg5BzCdRO/XMSqv/f3IwT0Hk1IctlZ+d?=
 =?us-ascii?Q?i/Fh8zRPFbqQz2jnVT2iY4LTNxQb6itzmkVnecjlNGkvgA08mfsqg0LSAdFv?=
 =?us-ascii?Q?jZAa/oeqni4cvsqvCDmXeb/V4mPWpFgBKVYWfMbzcFwVUyORXbDYml+gqH1y?=
 =?us-ascii?Q?Yn/GPfYPCemSBWfQQ+ap4y4l0BCtNJzoo8cxL/9yD+hCdNqvcGQD7CXIwND6?=
 =?us-ascii?Q?YM6+0560XwINlNo0JYl6fng8icYDCrib14SbxrbLo9YFkhQln5Duuz0bbLXO?=
 =?us-ascii?Q?Ip60JrGkTKYbi8ld2ugqwoDvWr2mOcTzugzp4WawgMrBj6VQwp6ufca3u/IX?=
 =?us-ascii?Q?v6np2FB/a9xTwdhvxem/dlx+pnFrsW8ad/sS5tuW08xygB+pgnAHSwdb5sBm?=
 =?us-ascii?Q?ufxCRUn6JWB+56+0FT5OWABYjsvBeWPjjukzhOILXCbUfLPaLVbcVVSxhuKR?=
 =?us-ascii?Q?ZAG4w/wdI8g+kIb3YqBrDhN6KvVFfU0xwsqc2ueZnYqmgIO5Gu3cG7Xe6ak7?=
 =?us-ascii?Q?NfK4BkKFQHt7Ze3oTKw8+Xgk2BgIz++HinMeyJOnNPKikczE+Uf4OWC/2Ley?=
 =?us-ascii?Q?P03+z3rJumovmpQIHa5lN6JKcvsh3H5amm926ZVLG3nOKrBcbzA3kEH1r6QT?=
 =?us-ascii?Q?+WbsMHcVIv+WYxvfLJzhGLuEmoxb2vQLNnqhihklHXCaalYE/wGwqZqBj2GE?=
 =?us-ascii?Q?zKf/mCXQlQMW9MbxMXSeqcuepVk1JIfbk5/ssNjhlAtHjbGMR7qdIORPFD8O?=
 =?us-ascii?Q?4ICUDDASlPdYiHI9kMoF4RCsVgHGNgCwf1zKjftNP8JA26D3MQUurhSifCNX?=
 =?us-ascii?Q?pD8hvc8aRUSoChszGLUpBAasFct+OwDNtUTzz1G/tEPQjDaASWbwkIzF3X2z?=
 =?us-ascii?Q?1YLMRSXTt1qvioLLQQ9NP1wGxADmL0jfHnARD/NyPFpNbQu4xrJBo+TPmGoW?=
 =?us-ascii?Q?Rt63UoiSJu2YpUj0jaw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 06:35:04.7795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a673edc2-5814-4891-cda1-08de4e800f0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8887
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

Refactor user queue submission to handle error injection cases where
GPU commands are intentionally invalid and would cause syncobj waits
to hang indefinitely.

Key changes:
1. Introduce `enum uq_submission_mode` with two modes:
   - UQ_SUBMIT_NORMAL: Full synchronization (default)
   - UQ_SUBMIT_NO_SYNC: Skip sync for error injection

2. Add helper functions:
   - `wait_for_packet_consumption()`: Busy-waits with timeout for GPU
     to process commands without synchronization
   - `create_sync_signal()`: Extracts signal creation and wait logic
     for normal submissions

3. Update `user_queue_submit()` to switch between modes:
   - NO_SYNC mode: Waits for command consumption via rptr/wptr polling
   - NORMAL mode: Creates sync signal and waits for completion

4. Modify `bad_access_helper()` to use UQ_SUBMIT_NO_SYNC mode for
   error injection tests, replacing the hardcoded timeout value

Benefits:
- Prevents permanent hangs when submitting invalid commands in tests
- Maintains full synchronization for normal operation
- Provides timeout protection for error injection cases
- Improves code organization with clear separation of concerns
- Enables future expansion of submission modes

The fix specifically addresses deadlock test scenarios where invalid
GPU commands would cause `amdgpu_cs_syncobj_wait()` to block forever,
preventing proper resource cleanup in `user_queue_destroy()`.

v2: fix build warning


Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 20 ++++++--
 lib/amdgpu/amd_deadlock_helpers.c   |  1 -
 lib/amdgpu/amd_ip_blocks.c          | 72 +++++++++++++++++++++--------
 lib/amdgpu/amd_ip_blocks.h          |  7 +++
 4 files changed, 76 insertions(+), 24 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index fc5a0ed32..6129b7104 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -70,6 +70,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
 	if (user_queue) {
+		if (expect_failure)
+			ring_context->submit_mode = UQ_SUBMIT_NO_SYNC;
+		else
+			ring_context->submit_mode = UQ_SUBMIT_NORMAL;
+
 		r = ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
 		if (!expect_failure)
 			igt_assert_eq(r, 0);
@@ -180,7 +185,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 		ring_context[ring_id].pm4_size = pm4_dw;
 		ring_context[ring_id].res_cnt = 1;
 		ring_context[ring_id].user_queue = user_queue;
-		ring_context[ring_id].time_out = 0;
+		if (user_queue)
+			ring_context[ring_id].time_out = INT64_MAX;
 		igt_assert(ring_context[ring_id].pm4);
 
 		/* Copy the previously queried HW IP info instead of querying again */
@@ -370,7 +376,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	if (user_queue)
+		ring_context->time_out = INT64_MAX;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
@@ -503,7 +510,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	if (user_queue)
+		ring_context->time_out = INT64_MAX;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
@@ -604,7 +612,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 2;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	if (user_queue)
+		ring_context->time_out = INT64_MAX;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
@@ -927,7 +936,8 @@ cmd_context_t* cmd_context_create(amdgpu_device_handle device,
 	ctx->ring_ctx->ring_id = ring_id;
 	ctx->ring_ctx->secure = false;
 	ctx->ring_ctx->user_queue = user_queue;
-	ctx->ring_ctx->time_out = 0;
+	if (user_queue)
+		ctx->ring_ctx->time_out = INT64_MAX;
 
 	if (user_queue) {
 	/* Initialize user queue if requested */
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 5efb5e73d..01c0f9928 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -347,7 +347,6 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context->res_cnt = 1;
 	ring_context->ring_id = 0;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0x7ffff;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_bo_alloc_and_map_sync(device_handle,
 				    ring_context->write_length * sizeof(uint32_t),
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 73bdace5a..0a9487c95 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -582,15 +582,55 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 	return r;
 }
 
+static
+int wait_for_packet_consumption(struct amdgpu_ring_context *ring_context)
+{
+	uint64_t count = 0;
+
+	while (*ring_context->rptr_cpu == *ring_context->wptr_cpu) {
+		if (count > 2000) {
+			igt_warn("Timeout waiting for bad packet consumption\n");
+			return -ETIMEDOUT;
+		}
+		count++;
+		usleep(1000);
+	}
+	return 0;
+}
+
+static
+int create_sync_signal(amdgpu_device_handle device,
+                             struct amdgpu_ring_context *ring_context,
+                             uint64_t timeout)
+{
+	uint32_t syncarray[1];
+	struct drm_amdgpu_userq_signal signal_data;
+	int r;
+
+	syncarray[0] = ring_context->timeline_syncobj_handle;
+	signal_data.queue_id = ring_context->queue_id;
+	signal_data.syncobj_handles = (uintptr_t)syncarray;
+	signal_data.num_syncobj_handles = 1;
+	signal_data.bo_read_handles = 0;
+	signal_data.bo_write_handles = 0;
+	signal_data.num_bo_read_handles = 0;
+	signal_data.num_bo_write_handles = 0;
+
+	r = amdgpu_userq_signal(device, &signal_data);
+	if (r)
+		return r;
+
+	return amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle,
+				  1, timeout, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+}
+
 static int
 user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 			      unsigned int ip_type, uint64_t mc_address)
 {
 	int r;
 	uint32_t control = ring_context->pm4_dw;
-	uint32_t syncarray[1];
-	struct drm_amdgpu_userq_signal signal_data;
-	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
+	uint64_t timeout = ring_context->time_out;
 	unsigned int nop_count;
 
 	if (ip_type == AMD_IP_DMA) {
@@ -640,21 +680,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 #endif
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
-	/* Add a fence packet for signal */
-	syncarray[0] = ring_context->timeline_syncobj_handle;
-	signal_data.queue_id = ring_context->queue_id;
-	signal_data.syncobj_handles = (uintptr_t)syncarray;
-	signal_data.num_syncobj_handles = 1;
-	signal_data.bo_read_handles = 0;
-	signal_data.bo_write_handles = 0;
-	signal_data.num_bo_read_handles = 0;
-	signal_data.num_bo_write_handles = 0;
-
-	r = amdgpu_userq_signal(device, &signal_data);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
-				DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+	switch (ring_context->submit_mode) {
+	case UQ_SUBMIT_NO_SYNC:
+		/* Error injection: wait for packet consumption without sync */
+		r = wait_for_packet_consumption(ring_context);
+		break;
+	case UQ_SUBMIT_NORMAL:
+	default:
+		/* Standard submission with full synchronization */
+		r = create_sync_signal(device, ring_context, timeout);
+		break;
+	}
 	return r;
 }
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 51f492da2..8fd9fde9a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -194,6 +194,12 @@ struct amdgpu_userq_bo {
 	void *ptr;
 };
 
+/* Submission modes for user queues */
+enum uq_submission_mode {
+	UQ_SUBMIT_NORMAL,        /* Full synchronization */
+	UQ_SUBMIT_NO_SYNC,       /* Skip sync for error injection */
+};
+
 #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
 
 /* set during execution */
@@ -272,6 +278,7 @@ struct amdgpu_ring_context {
 	uint64_t point;
 	bool user_queue;
 	uint64_t time_out;
+	enum uq_submission_mode submit_mode;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
-- 
2.49.0

