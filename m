Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E310BC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 13:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C17510E37A;
	Mon, 19 May 2025 13:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hyJ1kDu8";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0010E346
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 13:59:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOLpZCU2phhfvmnHk6AqZV3oZVQ+HdQkYhdy1Tv+BtUD06IN56I2+8dX1tnJNcfscCFUKKkSjIbcgKMVDqmL5W2OWPtc3uLe9hdp7u/+UazQKkuYnGmsJzdCOVVukdF8rCohRrsQ+Q+yE/NDjOI/FcnhPfVYcORXKeKaotVe+KGDacDhBnG9HWg96HV76rLLDzokAcDGwde9jmICmzBgeuyzLJ+kXOzEC8c96+n1fVTMHY7a3gS2z+hpXlPN1G+Jzj0G1OHzDNKKOjD/Sf7l9JDREDP9E9vk66g8OMYOom4GCi079T+fE6POolx8FUYAgreugTrKo6zS2qggybiPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiBG0Jf/kVsvONCE+jJvmsdJg+lIBp9iCVOiScqhR2E=;
 b=dy2XyD8VpxfUO1Skq2xB4NFy0xonPbxESPgsMyMgI3nniTWpr6Vd0PL5Hox7doEf5hlJqJdl98CF6suskehFE+ZntlHPUv2H9En3q1oZIBljARuaI9Ke4p+Byuhu7wfJgBTsZtjPtLHp/hnOP3THn8FiK/hKJ554/XDsFpTWUVtueVI/LZdkguiGsQWgu9bA2WURzg+QHo2CfPHKINe+BwoAoomaTO/2Fb5V6lcrh19t36Tm6cuYg8apwFmsjCHp7WV52mvcMsNO0Yes4GPMYDLoHEhzBX/cBQPJhSNLbgQ3p0jy9TUDo3Hq+9zCN5vpIF/W53Xqnp6PqnkxZJCs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiBG0Jf/kVsvONCE+jJvmsdJg+lIBp9iCVOiScqhR2E=;
 b=hyJ1kDu8lfaIN43WKmRn7yXNpDv/J/yJMLQKNJ3gS4xijZUfRTrPwkqEvyD2aTuWP02xOY0r+AvPPQlUcHFNI74If54Kbofl9A9wyOa6Ahod+HqmtSvtYpzQ3tNUyXEFA1OX3IIolTTcK20pmMA1goXk6jpUw+onbUu67nO6GrE=
Received: from BLAPR03CA0145.namprd03.prod.outlook.com (2603:10b6:208:32e::30)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 13:59:31 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::e7) by BLAPR03CA0145.outlook.office365.com
 (2603:10b6:208:32e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Mon,
 19 May 2025 13:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Mon, 19 May 2025 13:59:25 +0000
Received: from rtg-MAPLE.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 08:59:24 -0500
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2 1/2] tests/amdgpu: userq skip waiting for signal fence
Date: Mon, 19 May 2025 19:29:00 +0530
Message-ID: <20250519135901.3032-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc9189c-0ae9-4a53-6838-08dd96dd5d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N1fsLs87eCPd6n+eRFcumUKRRHcplmfflucXcjvfKiezqzT3+lXrhlxxob1a?=
 =?us-ascii?Q?VosrHYB7ndSkhVYzFS714UfU36hd0OkFGv4hAZ+COEN8q5DJgwoxZ4m1LoGw?=
 =?us-ascii?Q?y3lHxwBogWSOPbl61DXBau4YUfwaxeubZAEhBOA6FpM9otl4YY6prBSfLHyI?=
 =?us-ascii?Q?t0+pPZ+1M3X+/Y7Sn3TzJUrgp0bVLEuC8UITErJX9NRToIk89pHM4xauCT6C?=
 =?us-ascii?Q?Pdk06Op1Kxa7ea7upwkoBwEMQXaDtq8QdsAdtWiGFBaTKzZPV8GdAsI7XrHB?=
 =?us-ascii?Q?CkrmUOUFuUk57ESRvfD3WCHEWx7cSbwr8eBCQl+P0rUaNUDrX+qNthwrl5Bt?=
 =?us-ascii?Q?kULvGUkCxjebHD++4tw8r6/y+tnWxOtBj14tzKYXxKdxXPRo1shyCGabxt3w?=
 =?us-ascii?Q?j0+eE2pbc44PNq5jcehoZtzx6QMaOyORc/9ao9+mBJJoiO3ug4nGaguRi+6Z?=
 =?us-ascii?Q?EnbEqh6dKl8jGTtftG5SdX0N7+ZWhDQIq1/IcISHkBS3f6FaXtaNmio3cmBd?=
 =?us-ascii?Q?VrHEl742Y8tdJAwpa6x57+AU+pQ59ueRcJcPwvP+4XODO7WzbJf1HNnrYNxO?=
 =?us-ascii?Q?U8ZKpj13AH6VHSRYNgaS8ye0sg/qKsf3XX+3FbR++Le03NRFCioEoNag5DHD?=
 =?us-ascii?Q?N6e00gnUH8XUGrPW2eOfVZPs9VS91mmnxOM7wNZEZMf3nKygvNpdl5O1qROO?=
 =?us-ascii?Q?4lHrTe/k1kfL1xoc8oJSVd2T88oANGmQrcPXFaqanLReRQaoB9Hin5yThDBg?=
 =?us-ascii?Q?iAdkah4FUwuiO4anx7l2kuMXAzSQ0RdB5t0KydmDDqLqTUzcthMnTpqqJMYw?=
 =?us-ascii?Q?adVfWD9QTg0bx6JspTa7tqEQ8aTrSTNiBdydJgUETWAyRVcp8lTqW+QF+/FS?=
 =?us-ascii?Q?QJZDaXWqofyldSM6avlgYtD8YIo1EmGYOPtSyGGb487QCTjJg+6le8ZBlD/9?=
 =?us-ascii?Q?1gJH2lv6YgC+XZiMGF8nqMkscvfQtijU+YL//Mr5aIw8V50iSwxNiAwrJZfr?=
 =?us-ascii?Q?1ofZyF/Z/+vRlZFJWdeDYNwNR/h8UWD3wrXbJLrZWYUkjPR9ngRrYVaIZ0kQ?=
 =?us-ascii?Q?FF2mxC/zl6VuBZSAvIDbKlDE06lKtP6fBOVH8tF9dgy8UUXc4P6TgiFP3lbG?=
 =?us-ascii?Q?KLrxoih2ezr8LLuDh1HDQ+ezuJu/WqLlssPfJkyTaTHoKptByfOr2Ddyw4Gk?=
 =?us-ascii?Q?hh9jmPLKdYOkaGT3CrX/oAxEvNGo65BsF2AugVLaSCibDRwbLPyDFwN8bmme?=
 =?us-ascii?Q?eHwOPGoex/9Z1BVMZFBvwIkqk5PZUHrRUEHBqUDluND5bVW57V8Q0Ya803DM?=
 =?us-ascii?Q?c8qQ6YyrUNeWqsZMR6OWh5a0GB8oJHELYoID4qgZcO10swOeIvVivBdA5+1j?=
 =?us-ascii?Q?Vp2Wx0T8H7ZxM/bHhszIhMXIHbLUVkEe3YY45Ye/Qd9LC8Vo2H2Wij8OZBVR?=
 =?us-ascii?Q?EHL6n+0l/7fdDvkpiCqwstqfbtx2Ldihw9xvd0Ya3ULegjAF1aTe8HjH/GEm?=
 =?us-ascii?Q?BDqE3Uuo7f2Do1IT5WIcSVc7XvNzvsHyhmkA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 13:59:25.6673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc9189c-0ae9-4a53-6838-08dd96dd5d80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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

