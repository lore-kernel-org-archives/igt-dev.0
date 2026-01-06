Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D39C47BC2
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 07:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C414010E48C;
	Tue,  6 Jan 2026 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2IbIU3gP";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32CC10E465
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 07:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXjLdX0KFGQt6F7fzAgplF92Nd2qdaCqjjDBf19DUYda8JOwDDmmS17zDmuYO0BYC6UsiAmAFHpK/gzjvMO5viHeNhIDAWCpkk1ORaM4BZRVwryLYleFbEpJSuUema0uvfMERaEVE06adiGnPjLzEzpBsEYr+cjWdQ9IS17hJ3u8gDRdqTLWz90Om9jprGTj+0NnxzsNtcZRcy1QZ8qEudjF7LovcUupI2SLgxMvEAyuA+GDUdRYGYmQNxzXyTDt+FfB8M1LYg43A/zYK5w565AZ0N4AsHB1+tDMN5jU7dz+Wqsd6NZiolLvrEc7uS7hOaXwPRff0eZUEvvSLigdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYP7RhasjVAluAVkploo6Tm6HvLHCCT7FaMjEJquKMM=;
 b=HHxPsOUWgSLYEIfpNS66HHZcrhdNLImIZFp6d2AkaloxfawpImMfQVpvcY2j8cM81kSEeWOz+MwXE0goNXY9fXSoPmFg+exXt207i6Mxnnjsv9P/5vBsbzdDhKGxR8B24yN8OoaY5jWP/zgNIkLNv99s7tW8OgYutBK0Ca+F4t3d5TK47gBNlJQkB8+Zm8ichdau0idpd3ee01L2J7dNQV9ZB2+rBgMPqC6E5r0E1FT9mvwviXC+ZfmVjBhVtDhBnE94u+VKqkqMaQBj7Hg2YlAXN3yXY/TXy3VEgc94xRnTadM4XW2DBrhrcAAdKWmFog4ObpL1NbWIcqNkhfg6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYP7RhasjVAluAVkploo6Tm6HvLHCCT7FaMjEJquKMM=;
 b=2IbIU3gPm0A8aNt/dJPUpCC/DloSMMfhOhTcMFcrfIuDu6HQjBH/O+cR4ruaI4EijuE9GeZNCO3MKfwXKJjszQReFibR9Ip+5DfqdNn2AjLgG+LgC+O+vZlaPBBlxHTcPCXfGu4QKhvfWxOMJCcQ0qAr8pBkxUmCy5/fvOt8exQ=
Received: from CH2PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:59::12)
 by DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 07:41:48 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::5f) by CH2PR03CA0002.outlook.office365.com
 (2603:10b6:610:59::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 07:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 07:41:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 01:41:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 01:41:47 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 6 Jan 2026 01:41:40 -0600
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t V2] lib/amdgpu: implement selective sync skipping for
 error injection tests
Date: Tue, 6 Jan 2026 15:41:31 +0800
Message-ID: <20260106074139.3996790-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e6ee3e-c3e4-4c7e-9999-08de4cf70c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l3rBCvu3kiY4jNNz3pdzANWBI87Z9nAraHROTPX4VoDSSJTd61SvPIUYtsBG?=
 =?us-ascii?Q?50olySVVL3pGo/nrAbO5BSOIGGcnJ5yCMtDQxd52yAVIKCGqRGDPMmC6gal1?=
 =?us-ascii?Q?9NfLfqnGD/SUZ54r/HfJKGRhxXLQRvEIz879R7Q8LpmXGuR1+NNEFHiL7QAT?=
 =?us-ascii?Q?e3h4jc5aYFsRCRd6kr8Fud1zYJL1TdX0z85gqAPhZ57ng3lodJwwShqbFdYD?=
 =?us-ascii?Q?ttXZcbnVFRAdENYZ0eJsEK8cIBjyOVz9FGYX7iz5nowha/A3F0P9ZKRtPOLa?=
 =?us-ascii?Q?N2iRAp8OkHHbL1b4Qd1nqB+bP4rXGWdYcIgjGoHE6UpLER5KNNOd1LOqps+0?=
 =?us-ascii?Q?5w7PhNLQzrrXk/Yh+HyGSRZG+oIyMgYWaF8K+1aebEsezjCTv17jtjliWlHH?=
 =?us-ascii?Q?Awd0la+W6Wj3aEQwI+S63INVjBmZkgIKY5YC5ntC9Y4gmT6h9qOSkX1Pbd6/?=
 =?us-ascii?Q?/b01wQpbcsWtwtBRMf+Uiqc50GUOADt6PKBHilxWJUcTxOYFcphWIceKM9Kx?=
 =?us-ascii?Q?YWYFDy+nEhf4pclRilvoJl0hDajDQQ0GMV+uFv7ZjoGT8iQ3lkrn338Tzi7z?=
 =?us-ascii?Q?NHDxL8qeJtvEVkUJyPKNEPmS8slkvh/PYmUBSzML3yWpzOIF2ql9kr8XdICT?=
 =?us-ascii?Q?SnXPtTgR+UpGtnwNolhTHqHzKSEz2z9hBQLKoE/oSOkUIA8eAv6Mc8N8m0FG?=
 =?us-ascii?Q?i4A0sjMrHlSwjbhQEgrTkvMWIkZE54LI8tKdA2zgJZQQHNxPY4b0O4kEl6Dv?=
 =?us-ascii?Q?xGjHpQDQXtwdb8FL9pPiEEd50Mc9ZMUelbzXI4rCiEPhJea6RS+Rq8CRW3w9?=
 =?us-ascii?Q?RvgJz8lXvPW0HCAfSpxgcvprIJ320pqsT2mctUAXw6St8uXfxXC1NbAAEkzZ?=
 =?us-ascii?Q?pC1Y/LnV0lcjrc6QCp+Xzo8x/qJvhQnmkQ9K9UZdov7uKWTBbQ9TZTOp0kr2?=
 =?us-ascii?Q?l4mH9TE4TNVJ1VlUcWiY9JiA6ibfSE8ZgSDyTPDNhRH01sFTphmyA+kRqpod?=
 =?us-ascii?Q?QAkZH77Ht6XwPq6P+jhH+RaZ/nrHBKoYOsxvLwBh1XIdZqrEsfDAoPwXab53?=
 =?us-ascii?Q?/8xpS6ZF/j/sr8/BUe5IT5n5Q6NqSgt4/25jkICh6jUbm+xyio9QaDH4XrLD?=
 =?us-ascii?Q?K4gMthY3s1kQTVAn3NkvpIfVOVvWPK5a0/qeDFHrXRWGP0yGBHiBWtZbZJ5q?=
 =?us-ascii?Q?QS0OMual326q4ctxBg8psoqOQ1DkIE7t8sVaJnNFRzUg623lroq622ITFZ5U?=
 =?us-ascii?Q?C94jrcavqz4nk7lvtrsWnOMyTDa5QoryR7O93Aq0tglAWPwFgipuTpGdrX6M?=
 =?us-ascii?Q?I5iW9tLSF+LpD+qF1RQN+K9fb1KPVkJPyH0+fsiNmXN3RntSScjB1MMhIXgr?=
 =?us-ascii?Q?DxLNu7MKb9h4SyASQupsyMad1sz9VvR2W+180kFSnrxRTDGJQzuXzXackP4K?=
 =?us-ascii?Q?bRm1iTqgySL6XOLZuo6i685jS9PW8TOxDo7LkoYY2EQKqrNRuJExe+HQcpz8?=
 =?us-ascii?Q?OsqhdWJ66dxiUPNFcS1/5Pz5cl3qwbzKc5HRiqeYrRntjWcAt1ppcY+Mvipg?=
 =?us-ascii?Q?fl3H7unh6wlFB4UaH9k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 07:41:47.9382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e6ee3e-c3e4-4c7e-9999-08de4cf70c48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560
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
 lib/amdgpu/amd_command_submission.c | 15 ++++--
 lib/amdgpu/amd_deadlock_helpers.c   |  2 +-
 lib/amdgpu/amd_ip_blocks.c          | 72 +++++++++++++++++++++--------
 lib/amdgpu/amd_ip_blocks.h          |  7 +++
 4 files changed, 72 insertions(+), 24 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index fc5a0ed32..b776783a1 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -180,7 +180,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 		ring_context[ring_id].pm4_size = pm4_dw;
 		ring_context[ring_id].res_cnt = 1;
 		ring_context[ring_id].user_queue = user_queue;
-		ring_context[ring_id].time_out = 0;
+		ring_context[ring_id].time_out = INT64_MAX;
+		ring_context->submit_mode = UQ_SUBMIT_NORMAL;
 		igt_assert(ring_context[ring_id].pm4);
 
 		/* Copy the previously queried HW IP info instead of querying again */
@@ -370,7 +371,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	ring_context->time_out = INT64_MAX;
+	ring_context->submit_mode = UQ_SUBMIT_NORMAL;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
@@ -503,7 +505,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	ring_context->time_out = INT64_MAX;
+	ring_context->submit_mode = UQ_SUBMIT_NORMAL;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
@@ -604,7 +607,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 2;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0;
+	ring_context->time_out = INT64_MAX;
+	ring_context->submit_mode = UQ_SUBMIT_NORMAL;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
@@ -927,7 +931,8 @@ cmd_context_t* cmd_context_create(amdgpu_device_handle device,
 	ctx->ring_ctx->ring_id = ring_id;
 	ctx->ring_ctx->secure = false;
 	ctx->ring_ctx->user_queue = user_queue;
-	ctx->ring_ctx->time_out = 0;
+	ctx->ring_ctx->time_out = INT64_MAX;
+	ctx->ring_ctx->submit_mode = UQ_SUBMIT_NORMAL;
 
 	if (user_queue) {
 	/* Initialize user queue if requested */
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 5efb5e73d..c951450ce 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -347,7 +347,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context->res_cnt = 1;
 	ring_context->ring_id = 0;
 	ring_context->user_queue = user_queue;
-	ring_context->time_out = 0x7ffff;
+	ring_context->submit_mode = UQ_SUBMIT_NO_SYNC;
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

