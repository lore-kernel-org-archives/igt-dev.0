Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3461C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8910E23C;
	Tue,  3 Jun 2025 16:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0HBW7iDR";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641FA10E23C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjGNdRilAyENNWiTK0yxKaPQXTb3uLIup9IqNA4m6vrTb9xYSSuVcUMN8c9I5aQjIZ5sfLxOLQAye6nfyix3rH/V911iEAkuLXj/CfWh3K4BfXj0W5hFwYJzu1qgDw574eVCZ2D3MtW0LB3rBzftiyFFhRdJSTexJ8hvY6/aDwUwdO6gLiZMtDH2c/m/0BVqRgXvipAujNjt4c00ipCBxy7ew5CElX7e1OwGx1WpMAFTOdcI2gdY2C+q0Y38ewbgkuZ12usAXl+VSjKEOpsIPfEjzCIciJ+Ssn02mUB/Ryt6FfSGTlEhhbD2F7WWewnPEM7chQBJt6B55/xAipWFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HU0lsqg0Kyrrkb2dkLTx+QQZmr2a8OWxZq8eB9FKio=;
 b=lWtv0gv/u5bK70bLtD4oVoro2FxvSc9fuiCI/4vB7bhuvyNr08GPwkTdRaSYeQa9oumlpQLExSVoP/xedjtnuolQRQyyO9o66qrt1SZzP0p1eyF4yTb5O3HmMOPjCae1h6N4VqUrw7/mHrKg7dpDgZnuES6ylzyeVo/+r2GmHOiLkAJ4FLei9GZp7CG/OzZqPLrqI8+0sa3VRDX2vXZfV7E2eymGif9Hput26nRTnReBh20IwaKhzIFz1aeN3cHE9TVDxY7LAXVNVng6BpwApZ6fE5kkcsQHb2mdBndVvw4BhXGpeT3fSmt1JTvMSR8P16sNwfb/1nwx+zFcpKgsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HU0lsqg0Kyrrkb2dkLTx+QQZmr2a8OWxZq8eB9FKio=;
 b=0HBW7iDRJXwwcHiCplbagpDHmB/4pgjMQcKUu8XwYF2HcUipmQTXNEnBbEgXVmxNVQk6bu/La/o0LixslWUTYfR5gJcT5thWqL1EW6CXdWuCHB9+MK8msrlv7M8GpSqH6Xw67U68m/HdA61DgEz2tjGU+Igzb3LcQLnYA/bUddc=
Received: from SN7PR04CA0063.namprd04.prod.outlook.com (2603:10b6:806:121::8)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 3 Jun
 2025 16:24:29 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::9a) by SN7PR04CA0063.outlook.office365.com
 (2603:10b6:806:121::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 3 Jun 2025 16:24:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 16:24:28 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 11:24:26 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, "Jesse
 Zhang" <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 1/2] tests/amdgpu: userq skip waiting for signal fence
Date: Tue, 3 Jun 2025 21:53:48 +0530
Message-ID: <20250603162349.5229-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DS7PR12MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b21655-cde8-43f5-d236-08dda2bb1d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dXKJ4TxVCrgfbMsqTVgYgNn1BG1fyrGX9tolBdAaOMrMFQdJD2n/OjzGK8mS?=
 =?us-ascii?Q?QXABVZBgrqjb9JQHQz0Q6dZN1iuncnCy1fKXpWkxjK7LWNV5vUbn2kxWI2ry?=
 =?us-ascii?Q?W9nfbmsH16AF1Lzsru+v3zx6LqtxRUDna3EvWhui0IOPNQNGbrJUj+iNwoCU?=
 =?us-ascii?Q?QEpXd6zdvL8OCJh+hsLklRfV99wNM9qHtQgp2TrvGFwGJ05AnabPzNoBr59e?=
 =?us-ascii?Q?egtlYKa8GI5G55AqTaMH1x71HC9BRxVZTZACC8jpsdtM1AJYtcFeuoGicFU+?=
 =?us-ascii?Q?vI8PVWMRNXqj6/wewPohg4V/z8tf349eNx9IFM5JXJBvH+Wjbv1hzvtOlM/p?=
 =?us-ascii?Q?pt5+2bZss5dA5YUKqxUM2gb9mzc6BriW870yxLzIKmsGyrrDgngQtp81mU0v?=
 =?us-ascii?Q?Jf2VNFkxgXuGJp10FcRHdoHr1KKMaWpI4z4xp7KpRj/h8tpqvjwAqq+OtaXL?=
 =?us-ascii?Q?UH699pZXmXKtxEnO2ciDPbRJDwsb0KpuVXNHiRSkCMCrtCxd08ZHGon2BFcU?=
 =?us-ascii?Q?4HzwLHBn+FDNJfmRLeOosTqMucXkUPHMMm5CeSvQ182dk+D96JU0TMyjEXgw?=
 =?us-ascii?Q?a6v8FnSi9HTCKh+0/IJCv/wpDPb/94Ol79qP3UALLEETwbjdUmBdi1oBadNf?=
 =?us-ascii?Q?03FMRZLZ1Hk9uaqJaXi73s+wYiNOipTaZ4jVIWqzYS6TWgFGTXcGHMhZivRf?=
 =?us-ascii?Q?9Yh0ftks9NFt7xf0R3QOn2VMFzAvIx+HfKh1YcJzlJVlFSy/SuG6emY+DpPY?=
 =?us-ascii?Q?49xkRQVronakFIx86UNNqY6Oc2XpNBOthLorFwyQgKUuqyAIdShXctA3brhA?=
 =?us-ascii?Q?yTnjqIH1JmyLscsE6/JPqJHCuFiXHKqsp1/V1M3cfywxgPxSSGdKXMvpTd8s?=
 =?us-ascii?Q?XCQCatbFWijfoAV4p3PbTFcT3GRrnIMtnnT+gF37MCSrZp3kCOzgPLAFksLz?=
 =?us-ascii?Q?aT4nEmji2WYMVZh0ojqemLxYsFe0L+AbcaWKTkAoFl1esqYmW9dcFcbyvtKT?=
 =?us-ascii?Q?deByAbGkuMFkyaUN4RGYe3hYLfcKUCjv0B7FRkA2hrtvN7G/0nCgGUdXK+55?=
 =?us-ascii?Q?zNm9EVQhkCGA/tkX1DTpo4cV88P/l3f4w0AMvXDRM0cptMfja0JTcg9z1W4L?=
 =?us-ascii?Q?31gAD6sZUZohU+4GDDdmgqgBnh9tIutAjl5Q9X9TfZKV6sWwlr75g62sEjUg?=
 =?us-ascii?Q?TXft+4YVeHnNoRmfSYErpToNiGIJXRdeTFA1ejFEc0htGlt++fr50jcBTCVv?=
 =?us-ascii?Q?6x7gTQuQzJ1pxWIiAiigOUhvzBSkE7THG0vf8R0VXYhYA8DaGez4o9vSiliZ?=
 =?us-ascii?Q?708HU09XVIX1I05nFO7W+y+14aBIWQ5cbEPV68T5HjWLak2JHHAFMZAyjVzU?=
 =?us-ascii?Q?/r+DyCDE7clMjpuB5QMxq1YweXlWfmqjx3U7IpClYgbMO174n5aaeBat7CP1?=
 =?us-ascii?Q?cnC7WvzCzmg0IQ5uIoXEMiKsKIjsRph6OP/Y1FbvGDRsaC1P2lfADtgo1J9z?=
 =?us-ascii?Q?/eY9D+cLrQGICidmDRPYxTvuE5k6pwieH2A5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:24:28.6290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b21655-cde8-43f5-d236-08dda2bb1d15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
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

