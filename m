Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24475C3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413AB10E1A6;
	Tue, 20 May 2025 05:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iznBXmft";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CECA10E1A6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaImTbI2GcKUcBwwCHEQW6ZeeG+FEDC09VQxZCc0soyJzMqW7UURJfg2XxPkJ2zeyaxr471KbbXKGS9kLKT/Lgynm/owtfuNuHTCTxDKdT4N4EJqSNr1WPL8z0rNaDyH5TAHDpFZVUVPH3JotpWA+7ghmSl/sPPpuQyFPDukQtmrvavrAFOgK3FmdFyNzxJsbQ3Kewkx49LEdIMLkvasqAx0lbRuPQ3wxPPoiVZ9rQKGgu5ydpNdzgwcfSF25H1IwmQVGPHNow6uM+Ze+pNTvcZOF0I58T/gW4RI1AjYNeKJU7QKkrA/PU/NPjM8/htploWxex6mqg89/o1cfa71YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiZ6euN9Iqll6zvFtKBbrSn7oT6S2e+hCuuvLiD1YqE=;
 b=hEeKDW3uYJr6vzvtEuE3RP2PXBRrtmc//WEsW1KzxZe/hNHz8t7cwT1J1GC4PjAJHTWT+WX5FDIYneA9cTk7xJl5Pz4IuJXO4wpdoZeN6Et0bO3UpD5cshx09QixscVD7LFvz96bvOaxUjznrcM2f4cC/q7/TKcU5GQD70p0fTBoieLK4RtG+9Bj+8lMEmquQUmHyuJurZePWnEnZEGP97dd1If36hqcNIssdDUzkMmZndKB0ipvp/LEuW4PQfGchqEP36hcEu0GI3Tsi96r0u1IbZDDXDSkbCKZvjPnZud9TTdTGlWGYbXaoTHpYiNnpCSY1elGtsy+p1zQkdghPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiZ6euN9Iqll6zvFtKBbrSn7oT6S2e+hCuuvLiD1YqE=;
 b=iznBXmftmmV8PABs7mVtPjBQUZUmh8QSbiIn34sTYSD6Lq6+fJBptxtER6jnGUPizhS9JY4hIa6q0pUWYRWvreoO27gKNd5BQ7xMFWpOStOVUiPAVI4g5LaPytFT7H6kYv0kIwcvTM7LJ6wobrBAwKE5vqqoeSzsy5hwHJQL3bo=
Received: from SA1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:2ce::14)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 20 May
 2025 05:37:47 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::ce) by SA1PR04CA0005.outlook.office365.com
 (2603:10b6:806:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 05:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 05:37:45 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 00:37:44 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal fence
Date: Tue, 20 May 2025 11:07:27 +0530
Message-ID: <20250520053728.1703-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: e9df9391-b2d4-40c5-7405-08dd97607313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SxyyXTb2DF2c3OFHt7DUvm75PZfR8g4dmvgS9P6fNt0BCAHujSgWM/tQytYY?=
 =?us-ascii?Q?pioUG6DvIfda+wEOqXNa2nvxf6PZsfTgFmdpcIwed+3eyNW6JaXM8YWiH9T2?=
 =?us-ascii?Q?V9kfFcSF/ffS9mLHl9sRBz20jM8oJMFmmwtEg/U+MJDH8pQ8YogP46q8ezb+?=
 =?us-ascii?Q?TM01eP/If7v1yfjKZYDHqX387nO/BGI89SIbHxXIvpoFa8C7dPvauzwR0+H0?=
 =?us-ascii?Q?2KmRwsRCOJT8ODMJDHrVciBoiqhB9yheNDb3nVL9MVEGqszP4zbeIqY7xGW8?=
 =?us-ascii?Q?lt117vhwz+xL4+VcTySDA61nBRbybMPHcL5RzHWRzftc3WDKmnXFeCtEuvx+?=
 =?us-ascii?Q?CJ5UUDAsSfyEGRh7pJZ2WGwB1IgLcFhzo2KqLv5O4EC1EXrjnXRCK2OFC0/L?=
 =?us-ascii?Q?GlXzS60uMH/kFDxtWa5UgRh6ACOcUbqm09p9ahryYrHP9G1DYo84zgTg8s2x?=
 =?us-ascii?Q?PKWtabrsjtj50rSM0Htod+zRfdwNbqGtrXPbxzJAg9SSGIp+1Sk4h9G2lOLl?=
 =?us-ascii?Q?8+58GssAVPByfXgZoBRVHaJL0FATT/iySAcX++E1JD1Gh4HMR1+K8Ab9Rv1h?=
 =?us-ascii?Q?jFjD9vKkgdUopP0zZP58qtUQVtUvt9g3vmhwBxzPk3ZsB3mfyoxfTJ6OW1Pi?=
 =?us-ascii?Q?al7wQnhn9K5fIzocVuA8k9SEWh7e/UjGuhzTuUfHLXdr1ZSYFXazw9VTLs7S?=
 =?us-ascii?Q?oHwWZzRJWSLclD54JF6o91gLeuGfT95Thnb59X77DuQHAVe9prtw/ZsJZSIV?=
 =?us-ascii?Q?KqhbF9S4hmY+tpu+jDcibN3TxjgxKmMPc7Ni5HDDKewh4bWizuTxslRFu1YM?=
 =?us-ascii?Q?ZBkJ6gMMhwMNoXuIV9lUbPBT/g+f/taOhk6kqWZiRIEh2ZG9EtNb9ndFGibf?=
 =?us-ascii?Q?B60phFMUYR5oIdv4rGRl9SKlukKX+tC1FebmcMtsNevJ+64tus793KfibBVg?=
 =?us-ascii?Q?DZS1KgbM3rCxhFW5i14Mu0LtC8uOBtUD5tDp8n3tH6wSRmGOJ8tEVtI9kirg?=
 =?us-ascii?Q?xpZLFyOa6b4s7EbG6jR9DJKlhTJv/8bLr8B4YJ9+CILmLTrGrY3d2gH/7sBV?=
 =?us-ascii?Q?Ml4fZiOBdtzt25SGWQwA49ij4UKCyNwQyl8zjD5/DXK7Sgpt0wmbVwYWD8Fn?=
 =?us-ascii?Q?0Uc4pyeTxm8fjTOmmEiwxWYO5lBq4RsTzxmgP5qFPrS1Zo5jZW877VHKduCm?=
 =?us-ascii?Q?6iFOv7v67UvwOpEqj/byYgZZNJZFRRREXN74orNYZqaSh7ACJmdKpGcHAzJl?=
 =?us-ascii?Q?HCUja7bxfRO7cyikgynMZcQfbKxvZQtP//ApA0xc84qPXsEj7BGnO5mUmVrH?=
 =?us-ascii?Q?3bKOxyqJp7GNb/YsWhlsqYHRyuHHQBoFzskJDWQNUIIM5QYmSN5mHkYFIFGh?=
 =?us-ascii?Q?3W9rX1EDbcwSmbeOBGVHnT6NL9KXJvjJcBi9LzIUXyRKSd2fnYoADKhwmQRU?=
 =?us-ascii?Q?ADXEixzDNdWmzej2DOHwnZTEQxKeOeXCvEE6piWQzsPLimBfOAwKJ3phfco/?=
 =?us-ascii?Q?n3IUKtBpAWeGeh6CB7hoigZng85FP9hsMbtT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 05:37:45.9084 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9df9391-b2d4-40c5-7405-08dd97607313
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194
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

