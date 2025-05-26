Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0FBC54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 13:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B18410E30A;
	Mon, 26 May 2025 13:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wr/2qYsh";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03B410E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 13:03:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPwZy7aGiNl83eAHG81azuVlWnkogMYnZyihhT6Q77Ob6WMUsEOa/7urr+DLJFhwClHZ4xQRmm0wgNapy/cpwLQPwYyKz1NT+emr0PWdAhZtdOeyOgB5MbXOhmwochOGcIdjlzOKWG4eASJvIw3D3e45/enu5o28awfZlMg0Fqvz5+oPpCcl6kTgnVhRZ2LKQXSxUlJ04DX77MJetJ7ENLw88e/R66olTgfO7WSRw7BXMSSRihouQTlqil+1hts+c1fjJGshtuIt4FolCdQRM/s3xyh+gsEdWoPBa9EXDVoyz9qKEsSYK1j9eDibpR6ip/Dt6qcIcnGBmXifkcSO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiZ6euN9Iqll6zvFtKBbrSn7oT6S2e+hCuuvLiD1YqE=;
 b=bD4QhSd8hpPN1+7u17kEwdROglxFrr2sToFqLsmkEmvQ8UUqEb+twuOkQF7hALO3S9HgHLi0eh3Nxh6AXNyrsu5c0jNEgvy7jR79UbtTo46lDKeFhNls4LMIYeJvlTKqLN/QWbG8US1SZmJyLHAtLEGudmFjO8L3x+Htk5mx7yVjp+p5CIQrFM3293e3PulEbbxYci3IIpDUhH9C2i2F8lvVfQ8TzA7DWA1lmgmg7+KkoYHXQ+3YvdP7+Rn3b8hswbIH9Zcru0kBrXC0qzKbBsmPem5kW6OaLfx3EsBAs8ZSMEGzI67GJ2LeccZHBWNWOKgS42ugtfBLlfgBbPhJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiZ6euN9Iqll6zvFtKBbrSn7oT6S2e+hCuuvLiD1YqE=;
 b=wr/2qYshJ5PmjNabpQt8ycNleEdUBCZP5IHOTimgscPKNEjrCEZaUuRCfO4NTsc8Wj79afezWmG1zvWUPF/boYetigAQLlZbNk5CUS443MQcXv4qA/Mi10rPTkqPQDXXniWXcPrOhiUq4bWQxSTFDAEWFRkwccrYgNbJX1uqq9k=
Received: from SN6PR01CA0023.prod.exchangelabs.com (2603:10b6:805:b6::36) by
 SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Mon, 26 May 2025 13:03:29 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::d6) by SN6PR01CA0023.outlook.office365.com
 (2603:10b6:805:b6::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 13:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 13:03:28 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 08:03:27 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v3 1/2] tests/amdgpu: userq skip waiting for signal fence
Date: Mon, 26 May 2025 18:33:04 +0530
Message-ID: <20250526130305.20878-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SJ0PR12MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc3bafb-f876-4092-ff36-08dd9c55b56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YS74rTlm04Pzz0F+vwzXR6heAOHiqioAKn/aY90IYZ7dsoJ+tB1jBohjJy+/?=
 =?us-ascii?Q?x1J46nyTrzzFjyVURJe0B7uZJI/iosD4TAQ7mWvzYJz/x4XcebYN/8HzqdWy?=
 =?us-ascii?Q?vfR0FcV+uLMyCfN13n5egTxEQlJQNMFbQsPNs9cpDXwa8rtYEotvXRAyNCs+?=
 =?us-ascii?Q?0Fp6QVezDsBzk4vtclZpUPMmA828eIjYMdSgc11aXuW7P6Rgx61RJ7NvJgow?=
 =?us-ascii?Q?6tp0QYHpog/vPAZb44PlZXoS6yCPF7lGJlTspCDnV6tTGrQBdjxWsX/6RMnn?=
 =?us-ascii?Q?BCQlIH+zLSkGZHsaZ1eJX0RSqlliqLq6Qk41+qrCtdl7Tm3pMgg0/1HMGbQ0?=
 =?us-ascii?Q?nXiR4ayhua1CqRzukZA4PLYldcfmPcFgJ8UWAk/p3Vc/kLkz9AUp2p8IPMiM?=
 =?us-ascii?Q?NTBkTkZ38oxqUktCmZoICu4ux6OjRp4kDiAqbugLLPL9ZZR8Q9ii/SnNc+l0?=
 =?us-ascii?Q?PoMwzN4DWVbIadAYWsac0vfbRD5UGctHBvyy5XU2RZdcNTeEYfBzkClHxZ2N?=
 =?us-ascii?Q?y9OTYYoJNWVuYsn4fY6jgucT5ZgKdiuxhb9LS3uFX+Sr2B9LIqigU3eS7Jrt?=
 =?us-ascii?Q?7j/gvSAsjtBvj2NiJcyW5gaUt0s5VlFuqcb2T3lBCQ2H2J7IkP7eNWrfA+ul?=
 =?us-ascii?Q?Cw9/8uqGR676OvOT35nm3PbMp/dCDAqsaFKYRIL9wsFzQmUCkL1pstol90uH?=
 =?us-ascii?Q?xPkb2f9b8NG96ftWYHbJt1DNI9PQsgPT2noZ0OFPgRxE4D1Xr6kMpYBcZo8q?=
 =?us-ascii?Q?di/xmSwtIzwaSpEy7vIV6+0j/AojsXBFPxPe4nXEHLY/+zH1KMTdcLQlkg9R?=
 =?us-ascii?Q?DIxat5S4AzsVI+HJVlw1BNK4z+hfCVH2OLlm8ru2mPQ731HrkQ4DVmb69PgO?=
 =?us-ascii?Q?q9Ayzvo/uMc8FZish9XfK1pK/rqMOZdMeL93Iehh4DBHn0rRXzGw7/cRDwoY?=
 =?us-ascii?Q?FVCrUBo+6aeeysAPxC+w4tfQd4GnM9Xr4gwzU8m/hPplVDibwYwV+6Oaqchh?=
 =?us-ascii?Q?zQHgvf4+jOl7GXmQ+5GHWOFWMytQNSdSPlGnPwMI3j6zPiPmL9/ZIOBTv15o?=
 =?us-ascii?Q?Sbqv1SWlAKEgAp9/WofW1MOrErW8iNf5x2Lsoe04OOMNGItJ9zwjsY40dwhA?=
 =?us-ascii?Q?7bsOxPSViRMoZgb6o6ip7BipniV0R9FUE4wVCcDk+k9aNdFBcYKbJiuYGzvl?=
 =?us-ascii?Q?0XJsYKSPiAUcsj6f+9YE62gdesZqE312Q4cLfXqRkA2yzCXZbbMGkwloIr3U?=
 =?us-ascii?Q?IPOHwimm2cHgOTTA//Q+yYcA8+S43raNAMZif0/MWmJc5ATuDCoEHcTzIMrx?=
 =?us-ascii?Q?UGrhHgOQARx8gqH+WXj47zum6z55CmhNB8JNKYuI8ZFTiWuzxn9CtuI3sxtY?=
 =?us-ascii?Q?MAlBZ718NzbclukUx/9TqVxYmCrm0OfowOZBIEIWz9EPOJ5/MK4W3GDcXy6f?=
 =?us-ascii?Q?kfaLCUVHbdXVyCkX1XNDGyeUWhlHhrx+e+wPbM1nGyU/NgsbsuQ6DEIM58i7?=
 =?us-ascii?Q?MesKxeKv5mwvLugG62ErwuEnSUFXt8TH81YE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 13:03:28.5858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc3bafb-f876-4092-ff36-08dd9c55b56e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610
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

For negative test cases where the job will not complete need to
skip signal fence. Pass a flag to amdgpu_user_queue_submit() to
skip signal fence wait.

v2: rebase to latest code

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Jesse.Zhang <Jesse.zhang@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  2 +-
 lib/amdgpu/amd_compute.c            |  2 +-
 lib/amdgpu/amd_userq.c              | 36 +++++++++++++++--------------
 lib/amdgpu/amd_userq.h              |  2 +-
 tests/amdgpu/amd_basic.c            |  4 ++--
 tests/amdgpu/amd_cs_nop.c           |  2 +-
 6 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index fcc356f8f..c3dad3231 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -68,7 +68,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
 	if (user_queue)
-		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address);
+		amdgpu_user_queue_submit(device, ring_context, ip_type, ib_result_mc_address, false);
 	else {
 		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
 		ring_context->ib_info.size = ring_context->pm4_dw;
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 95bfa53aa..008186049 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -91,7 +91,7 @@ void amdgpu_command_submission_compute_nop(amdgpu_device_handle device, bool use
 
 		if (user_queue) {
 			amdgpu_user_queue_submit(device, ring_context, AMD_IP_COMPUTE,
-						 ib_result_mc_address);
+						 ib_result_mc_address, false);
 		} else {
 			memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
 			ib_info.ib_mc_address = ib_result_mc_address;
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index f8e1a4b45..0a983834c 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -127,7 +127,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 }
 
 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-			      unsigned int ip_type, uint64_t mc_address)
+			      unsigned int ip_type, uint64_t mc_address, bool skip_signal)
 {
 	int r;
 	uint32_t control = ring_context->pm4_dw;
@@ -166,22 +166,24 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	/* Update the door bell */
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
+	if (!skip_signal) {
+		/* Add a fence packet for signal */
+		syncarray[0] = ring_context->timeline_syncobj_handle;
+		signal_data.queue_id = ring_context->queue_id;
+		signal_data.syncobj_handles = (uintptr_t)syncarray;
+		signal_data.num_syncobj_handles = 1;
+		signal_data.bo_read_handles = 0;
+		signal_data.bo_write_handles = 0;
+		signal_data.num_bo_read_handles = 0;
+		signal_data.num_bo_write_handles = 0;
+
+		r = amdgpu_userq_signal(device, &signal_data);
+		igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
-				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
-	igt_assert_eq(r, 0);
+		r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1,
+					   timeout, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+		igt_assert_eq(r, 0);
+	}
 }
 
 void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
@@ -456,7 +458,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 }
 
 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-	unsigned int ip_type, uint64_t mc_address)
+	unsigned int ip_type, uint64_t mc_address, bool skip_signal)
 {
 }
 
diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
index b29e97ccf..dc39c1ca4 100644
--- a/lib/amdgpu/amd_userq.h
+++ b/lib/amdgpu/amd_userq.h
@@ -50,6 +50,6 @@ void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu
 			       unsigned int ip_type);
 
 void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
-			      unsigned int ip_type, uint64_t mc_address);
+			      unsigned int ip_type, uint64_t mc_address, bool skip_signal);
 
 #endif
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 97a08a9a3..914d27909 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -607,7 +607,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
 		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
-					 ib_result_mc_address);
+					 ib_result_mc_address, false);
 	} else {
 		r = amdgpu_cs_submit(context_handle[1], 0, &ibs_request, 1);
 	}
@@ -647,7 +647,7 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
 	if (user_queue) {
 		ring_context->pm4_dw = ib_info.size;
 		amdgpu_user_queue_submit(device_handle, ring_context, ip_block->type,
-					ib_info.ib_mc_address);
+					 ib_info.ib_mc_address, false);
 	} else {
 		r = amdgpu_cs_submit(context_handle[0], 0, &ibs_request, 1);
 		igt_assert_eq(r, 0);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 268bc9201..658c8d050 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
 			if (user_queue) {
 				ring_context->pm4_dw = ib_info.size;
 				amdgpu_user_queue_submit(device, ring_context, ip_type,
-							 ib_info.ib_mc_address);
+							 ib_info.ib_mc_address, false);
 				igt_assert_eq(r, 0);
 			} else {
 				r = amdgpu_cs_submit(context, 0, &ibs_request, 1);
-- 
2.43.0

