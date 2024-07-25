Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC75C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 14:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DD610E835;
	Thu, 25 Jul 2024 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gMRoFTQP";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EA410E835
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 14:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNAvH7KC7fFHjTJlsbY6aHVzrpppgtCVKSRWw+46cNm654OBv+dRbLDVJzwVE8ViZFLrr85HU6E/oEm/IBWWTkndcu+cqioBO4+Q3WbcnhQ7e5Zs4nZypgjbjQFr2RCHXLgADctwBfa6utn1sPgO4bnRtVTAzpb4G4gpoVe+hRag1/hRYFjanQ2g5Kq8vQPi78Mxk5jYs2ngbJdVrGELgRtFDnfJW73sq/wbyqG9PsMYs1dNgUx+xDyhP9ERZ+JyKEcy15hcGp7JXoJT2pjNCSAn2XXFSsBj4comIzxhb/x1xuCb97CeMS3Noqx+7zgQkWFMRBacSKt34qkY1wP8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anSf/oMwgDzfWZ5U3mobGPb3e5xLeEZ4TwGg9faDVBE=;
 b=rHnvtVMI0h9g+pkC74DqfX4Y6ATuEcJ+7ejggsdhCA86Yqq2gxIgnpWBC8XtwNLqGaT5llGyql18hOhCNRUxftp5P9LgoRdz5D5JY7ymA5ZL5eaDx+EAPVJBCSk8qBxdl/9WDOBRjU8K+wzlGBTNWqdP0MbQ2R/CRwwUbD6G5+7Ryu6JyLpSLaqIVhZzr9Dqt7GgnmnjjDWPTcOIE4Iie9puMG6iFyFrYQ5kpJOhiSK5lWEoI0nhlsUpsCZKcTHqJPFHQ3VGmU0AOdD1TGat5GqFStq9d2pCUGUalenqDXMts3QziVQ9elSfsiYli7Iuas0WpRnajTyWd0cHEG6VtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anSf/oMwgDzfWZ5U3mobGPb3e5xLeEZ4TwGg9faDVBE=;
 b=gMRoFTQPKzZXrCMSWhs0qgu/Kd9/ZSAuCJrhiMe4MpFvDWtKaCDzQpd8Xqo/DneOav++8Rx8b2jd8+sEKR593E5OO/2LTFkIMHjMCwpZYOM3+ODu/6NXw+UXBfTWyX3Tn7n6NtAvqhVz8diwHA6ypKjR8p8mIrbyQHdiHw3hxaU=
Received: from SJ0PR13CA0239.namprd13.prod.outlook.com (2603:10b6:a03:2c1::34)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 14:25:28 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::24) by SJ0PR13CA0239.outlook.office365.com
 (2603:10b6:a03:2c1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Thu, 25 Jul 2024 14:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 14:25:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 09:25:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 09:25:26 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 25 Jul 2024 09:25:26 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: refactor deadlock tests
Date: Thu, 25 Jul 2024 10:25:17 -0400
Message-ID: <20240725142518.175829-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e73bb4-026c-4d1b-cf85-08dcacb5a1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NHTPqD4U5kf+quNlbu/yQ0q0QBu7iZ66jGJdZhGcWvEPtx7SEx7YUNzwWStS?=
 =?us-ascii?Q?iZdXivQmtCjd3rBSfjdyy78NNxpb4XIXyeWJcBNK6Ghez6DqlnjtI0qEMWDW?=
 =?us-ascii?Q?C9bXnGQG+W0yZH/tBeVUEVV+rYzfoPUeWv4O+3/uiNDOr1YpI9clHi9A6p8s?=
 =?us-ascii?Q?egEbGSPOG4V7PCu23JEGDD1cPrCF56jOP1RVPm/uIO7bP/6eRBNVQAlEuJ0b?=
 =?us-ascii?Q?KSQZhsk4juUhd8n90+EUb9haHLXReof5wZpwrxcxg6ql3j2vK4Qac37Yr/v5?=
 =?us-ascii?Q?d7b4+toLsjq3wrcd+xtU+OYAmaZPMpyFQ9+UwAVgx5kvIE9GF2vHfV0QVgQo?=
 =?us-ascii?Q?2cxlT/QEN9vXeVovqD8xBm+NgLNAuXVb8WYJ2dFqpy9BQLcMtJ+qozyIImeu?=
 =?us-ascii?Q?KFjuAZ+HrVJ4uSadN5f9/rmqYH++mxTrI1Gh9PIktj/2jxegBPMouKRRUrKr?=
 =?us-ascii?Q?0zXoN6YzShzJVOCgP9yrdG6ZEmjMf/+wMalvzBiAdL1ALgUs9kAgjc7dk6iF?=
 =?us-ascii?Q?Bc9VIqUeVbhyu3Nmmb9v/a4aQGm2RM2In17ORlDqMGN//DPLplRYTxaE0DIN?=
 =?us-ascii?Q?YB6s0FLsN8R8U8eOUW1JbN5S9PvS5kh4aGLCzogY8D8cjVAu2FLBedB7YfYG?=
 =?us-ascii?Q?y4HgY71BxGZ9e9xMa5Bkfg9Vpr/QrknQKYt7qNV8jqTNj87Ze5BGGc5os1cA?=
 =?us-ascii?Q?Sp8sGZKHgkvPM8fJ2UdTSaEKWgOICV5rKO55FdMlpgs/8m2e0LE6/kcDmM5n?=
 =?us-ascii?Q?4PrrdyIdqXl9x2/sItMS+673WjwJyjAQdWXPxCW5l0NqazxCT0o0WnR5eHN4?=
 =?us-ascii?Q?NCagPp0gb1s+e4073+25df23Tz6qipw1340hn7y9AnnmAKhkC07sjo3EovSi?=
 =?us-ascii?Q?o9Pmt065dGGfq8AGF2MYfX2xbxbohF/cO7zdgwfgrlwwIgy0jjTCxFR2rHXK?=
 =?us-ascii?Q?hGVP8RvvzsIdcxvB0KnvHB/c6Z5tcVjnjeU10DYvptDAAF5XPVdx9uNwQi21?=
 =?us-ascii?Q?IkLqAPmoHMwSS27gu9E4J3G2c/fwVw5WfYx4pVolF5sy0MdazuEUY94jX1S1?=
 =?us-ascii?Q?f85d6PqgTU1XQhbjEsXyCJRf4F33gRDVrnBTHEfrItuXkatB7Kg+jABdhCUB?=
 =?us-ascii?Q?HpaKdOwEAIptjp7aP5/3t4HDYzXsFfWVPuUM4BH9aFJ5GpTsRPWoUJPbCHan?=
 =?us-ascii?Q?UtTL/YdOq7ducLYhWpQbgOCWGeuPu2Yq28eAEx6VOpGSxe9hDicWbuq65gBU?=
 =?us-ascii?Q?KWB3QOgcZxxuj5KL0S2RMc/WP2+oIA/jKWHyCZfCYAIJs2/D8cG0FIJKpd6Z?=
 =?us-ascii?Q?aP9Cag+7N21um7kdAvVAYZ5zRaBgAH3ntSVVrbJREKZdvHE6GjwB1db/Q/9l?=
 =?us-ascii?Q?b7mLLuq7Ey1g+sLOiTz6Xcn4cmJI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 14:25:27.9483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e73bb4-026c-4d1b-cf85-08dcacb5a1a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Refactor error handling and simplify code for packet processing

- Declare different error types for packets in a central location for
  better manageability and consistency.
- Implement ASIC-specific function bad_write_linear to handle specific
  hardware requirements.
- Simplify the function bad_access_helper to streamline error handling
   and improve code readability.

These changes enhance the maintainability of the code and ensure that
error handling is more robust and easier to update.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c |  25 ++++---
 lib/amdgpu/amd_command_submission.h |   2 +-
 lib/amdgpu/amd_deadlock_helpers.c   | 102 ++++++++++------------------
 lib/amdgpu/amd_deadlock_helpers.h   |   4 +-
 lib/amdgpu/amd_dispatch.c           |  19 +++---
 lib/amdgpu/amd_dispatch.h           |   6 +-
 lib/amdgpu/amd_dispatch_helpers.c   |  95 +++++++++++---------------
 lib/amdgpu/amd_dispatch_helpers.h   |  12 +---
 lib/amdgpu/amd_ip_blocks.c          |  49 ++++++++++++-
 lib/amdgpu/amd_ip_blocks.h          |  20 ++++++
 tests/amdgpu/amd_deadlock.c         |   6 +-
 tests/amdgpu/amd_dispatch.c         |   2 +-
 12 files changed, 182 insertions(+), 160 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index c5e900b0c..a0c72fb47 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -17,8 +17,8 @@
  * submit command stream described in ibs_request and wait for this IB accomplished
  */
 
-void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
-				struct amdgpu_ring_context *ring_context, int expect)
+int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
+				struct amdgpu_ring_context *ring_context, int expect_failure)
 {
 	int r;
 	uint32_t expired;
@@ -31,7 +31,7 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
 
 	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
 
-	if (expect) {
+	if (expect_failure) {
 		/* allocate IB */
 		r = amdgpu_bo_alloc_and_map(device, ring_context->write_length, 4096,
 					    AMDGPU_GEM_DOMAIN_GTT, 0,
@@ -74,7 +74,13 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
 
 	/* submit CS */
 	r = amdgpu_cs_submit(ring_context->context_handle, 0, &ring_context->ibs_request, 1);
-	igt_assert_eq(r, 0);
+	if (expect_failure)
+		igt_info("amdgpu_cs_submit %d PID %d\n", r, getpid());
+	else {
+		if (r != -ECANCELED && r != -ENODATA) /* we allow ECANCELED or ENODATA for good jobs temporally */
+			igt_assert_eq(r, 0);
+	}
+
 
 	r = amdgpu_bo_list_destroy(ring_context->ibs_request.resources);
 	igt_assert_eq(r, 0);
@@ -89,15 +95,16 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
 	r = amdgpu_cs_query_fence_status(&fence_status,
 					 AMDGPU_TIMEOUT_INFINITE,
 					 0, &expired);
-	if (expect) {
-		igt_assert_neq(r, 0);
-		igt_assert_neq(expired, true);
+	if (expect_failure) {
+		igt_info("EXPECT FAILURE amdgpu_cs_query_fence_status %d expired %d PID %d\n", r,  expired, getpid());
 	} else {
-		igt_assert_eq(r, 0);
-		igt_assert_eq(expired, true);
+		if (r != -ECANCELED && r != -ENODATA) /* we allow ECANCELED or ENODATA for good jobs temporally */
+			igt_assert_eq(r, 0);
 	}
+
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 				 ib_result_mc_address, 4096);
+	return r;
 }
 
 void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 44f0cc958..e3139a402 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -28,7 +28,7 @@
 
 #include "amd_ip_blocks.h"
 
-void amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
+int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
 				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
 				int expect);
 
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 612f127fd..c71272e58 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -12,7 +12,6 @@
 #include <signal.h>
 #include "amd_memory.h"
 #include "amd_deadlock_helpers.h"
-#include "amd_ip_blocks.h"
 #include "lib/amdgpu/amd_command_submission.h"
 
 #define MAX_JOB_COUNT 200
@@ -171,83 +170,50 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
 }
 
 void
-bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned int ip_type)
+bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
 {
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle ib_result_handle;
-	void *ib_result_cpu;
-	uint64_t ib_result_mc_address;
-	struct amdgpu_cs_request ibs_request;
-	struct amdgpu_cs_ib_info ib_info;
-	struct amdgpu_cs_fence fence_status;
-	uint32_t expired;
-	const unsigned int bo_cmd_size = 4096;
-	const unsigned int alignment = 4096;
-	int r;
-	amdgpu_bo_list_handle bo_list;
-	amdgpu_va_handle va_handle;
-	struct amdgpu_cmd_base *base_cmd;
 
-	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
-	igt_assert_eq(r, 0);
+	const struct amdgpu_ip_block_version *ip_block = NULL;
+	const int write_length = 128;
+	const int pm4_dw = 256;
 
-	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, alignment,
-									AMDGPU_GEM_DOMAIN_GTT, 0, 0,
-									&ib_result_handle, &ib_result_cpu,
-									&ib_result_mc_address, &va_handle);
-	igt_assert_eq(r, 0);
-	base_cmd = get_cmd_base();
-	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
+	struct amdgpu_ring_context *ring_context;
+	int r;
 
-	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
+	ring_context = calloc(1, sizeof(*ring_context));
+	igt_assert(ring_context);
+	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
 	igt_assert_eq(r, 0);
 
-	base_cmd->emit(base_cmd, PACKET3(PACKET3_WRITE_DATA, 3));
-	base_cmd->emit(base_cmd, (reg_access ? WRITE_DATA_DST_SEL(0) :
-										   WRITE_DATA_DST_SEL(5)) | WR_CONFIRM);
-
-	base_cmd->emit(base_cmd, reg_access ? mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR :
-					0xdeadbee0);
-	base_cmd->emit(base_cmd, 0);
-	base_cmd->emit(base_cmd, 0xdeadbeef);
-	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
-
-	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
-	ib_info.ib_mc_address = ib_result_mc_address;
-	ib_info.size = base_cmd->cdw;
-
-	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
-	ibs_request.ip_type = ip_type;
-	ibs_request.ring = 0;
-	ibs_request.number_of_ibs = 1;
-	ibs_request.ibs = &ib_info;
-	ibs_request.resources = bo_list;
-	ibs_request.fence_info.handle = NULL;
-
-	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
-	/* see kernel change */
-	/* https://lists.freedesktop.org/archives/amd-gfx/2023-May/092770.html */
-	if (r != 0 && r != -ECANCELED && r != -ETIME)
-		igt_assert(0);
+	/* setup parameters */
+	ring_context->write_length =  write_length;
+	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	ring_context->pm4_size = pm4_dw;
+	ring_context->res_cnt = 1;
+	ring_context->ring_id = 0;
+	igt_assert(ring_context->pm4);
+	ip_block = get_ip_block(device_handle, ip_type);
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    ring_context->write_length * sizeof(uint32_t),
+				    4096, AMDGPU_GEM_DOMAIN_GTT,
+					AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ring_context->bo,
+				    (void **)&ring_context->bo_cpu,
+				    &ring_context->bo_mc,
+				    &ring_context->va_handle);
+	igt_assert_eq(r, 0);
 
+	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
+	ring_context->resources[0] = ring_context->bo;
 
-	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
-	fence_status.context = context_handle;
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = 0;
-	fence_status.fence = ibs_request.seq_no;
+	ip_block->funcs->bad_write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw, cmd_error);
 
-	r = amdgpu_cs_query_fence_status(&fence_status,
-			AMDGPU_TIMEOUT_INFINITE, 0, &expired);
-	if (r != 0 && r != -ECANCELED && r != -ETIME)
-		igt_assert(0);
+	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context,
+			cmd_error == CMD_STREAM_EXEC_SUCCESS ? 0 : 1);
 
-	amdgpu_bo_list_destroy(bo_list);
-	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
-					 ib_result_mc_address, 4096);
-	free_cmd_base(base_cmd);
-	amdgpu_cs_ctx_free(context_handle);
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
+				 ring_context->write_length * sizeof(uint32_t));
+	free(ring_context->pm4);
+	free(ring_context);
 }
 
 #define MAX_DMABUF_COUNT 0x20000
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 9c0d245a9..e36227950 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -30,10 +30,10 @@ enum  hang_type {
 };
 
 void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
 
 void
-bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
+bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type);
 
 void
 amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 8b97ca269..0de0ce816 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -159,10 +159,10 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_cs_ctx_free(context_handle);
 }
 
-void
+int
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			    uint32_t ip_type, uint32_t ring, uint32_t version,
-			    enum shader_error_type hang)
+			    enum cmd_error_type hang)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -172,7 +172,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	uint32_t *ptr_cmd;
 	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd;
 	amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
-	int i, r;
+	int i, r, r2;
 	int bo_dst_size = 16384;
 	int bo_shader_size = 4096;
 	int bo_cmd_size = 4096;
@@ -326,9 +326,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			i++;
 		}
 	} else {
-		r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
-		igt_assert_eq(r, 0);
-		igt_assert_eq(hang_state, AMDGPU_CTX_UNKNOWN_RESET);
+		r2 = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
+		igt_assert_eq(r2, 0);
 	}
 
 	amdgpu_bo_list_destroy(bo_list);
@@ -338,6 +337,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
 	amdgpu_cs_ctx_free(context_handle);
+
+	return r;
 }
 
 static void
@@ -538,16 +539,16 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type,
-					    ring_id,  version, 0);
+					    ring_id,  version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
 						      ring_id, version, AMDGPU_CTX_UNKNOWN_RESET);
 
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
-					    version, 0);
+					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS);
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum shader_error_type hang)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum cmd_error_type hang)
 {
 	int r;
 	struct drm_amdgpu_info_hw_ip info;
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 5f05ee693..9aa7a1b78 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -28,13 +28,13 @@
 #include "amd_dispatch_helpers.h"
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type, enum shader_error_type hang);
+			      uint32_t ip_type, enum cmd_error_type hang);
 
-void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t ip_type,
 					uint32_t ring,
 					uint32_t version,
-					enum shader_error_type hang);
+					enum cmd_error_type hang);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type);
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 6b2e8f39f..9c9d04e30 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -1,26 +1,8 @@
-/* SPDX-License-Identifier: MIT
- * Copyright 2014 Advanced Micro Devices, Inc.
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
- *  *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
+ * Copyright 2014 Advanced Micro Devices, Inc.
  */
 
 #include "amd_dispatch_helpers.h"
@@ -29,7 +11,8 @@
 #include "amd_ip_blocks.h"
 #include "igt.h"
 
- int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base * base, uint32_t version)
+int
+amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base, uint32_t version)
 {
 	int i = base->cdw;
 
@@ -87,34 +70,36 @@
 	return base->cdw - i;
 }
 
-int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version)
- {
- 	int offset_prev = base->cdw;
- 	if (version == 9) {
- 	/*  Issue commands to set cu mask used in current dispatch */
- 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
- 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
- 		base->emit(base, 0x216);
- 		base->emit(base, 0xffffffff);
- 		base->emit(base, 0xffffffff);
-	} else if((version == 10) || (version == 11)) {
+int
+amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base, uint32_t version)
+{
+	int offset_prev = base->cdw;
+
+	if (version == 9) {
+	/*  Issue commands to set cu mask used in current dispatch */
+	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+		base->emit(base, 0x216);
+		base->emit(base, 0xffffffff);
+		base->emit(base, 0xffffffff);
+	} else if ((version == 10) || (version == 11)) {
 		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
- 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
- 		base->emit(base, 0x30000216);
- 		base->emit(base, 0xffffffff);
- 		base->emit(base, 0xffffffff);
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
+		base->emit(base, 0x30000216);
+		base->emit(base, 0xffffffff);
+		base->emit(base, 0xffffffff);
 	}
 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
 	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
- 	base->emit(base, 0x219);
- 	base->emit(base, 0xffffffff);
- 	base->emit(base, 0xffffffff);
+	base->emit(base, 0x219);
+	base->emit(base, 0xffffffff);
+	base->emit(base, 0xffffffff);
 
 	return base->cdw - offset_prev;
- }
+}
 
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version, enum shader_error_type hang)
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr, uint32_t version, enum  cmd_error_type hang)
 {
 	static const uint32_t bufferclear_cs_shader_registers_gfx9[][2] = {
 		{0x2e12, 0x000C0041},	//{ mmCOMPUTE_PGM_RSRC1,	0x000C0041 },
@@ -157,18 +142,18 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 			if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING) {
 				/* - Gfx11ShRegBase */
-				base->emit(base,bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
-				if (bufferclear_cs_shader_invalid_registers[j][0] ==0x2E12)
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_invalid_registers[j][0] == 0x2E12)
 					bufferclear_cs_shader_invalid_registers[j][1] &= ~(1<<29);
 
-				base->emit(base,bufferclear_cs_shader_invalid_registers[j][1]);
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][1]);
 			} else {
 				/* - Gfx11ShRegBase */
-				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
-				if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
+				base->emit(base, bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_registers_gfx11[j][0] == 0x2E12)
 					bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
 
-				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+				base->emit(base, bufferclear_cs_shader_registers_gfx11[j][1]);
 			}
 		}
 	} else {
@@ -179,21 +164,21 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 				base->emit(base, bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
 				base->emit(base, bufferclear_cs_shader_invalid_registers[j][1]);
 			} else {
-				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
-				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+				base->emit(base, bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
+				base->emit(base, bufferclear_cs_shader_registers_gfx9[j][1]);
 			}
 		}
 	}
 	if (version == 10) {
 		/* mmCOMPUTE_PGM_RSRC3 */
 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
-		base->emit(base,0x228);
-		base->emit(base, 0 );
+		base->emit(base, 0x228);
+		base->emit(base, 0);
 	} else if (version == 11) {
 		/* mmCOMPUTE_PGM_RSRC3 */
 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
-		base->emit(base,0x228);
-		base->emit(base, 0x3f0 );
+		base->emit(base, 0x228);
+		base->emit(base, 0x3f0);
 	}
 	return base->cdw - offset_prev;
 }
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
index 7ae88cd78..55398377e 100644
--- a/lib/amdgpu/amd_dispatch_helpers.h
+++ b/lib/amdgpu/amd_dispatch_helpers.h
@@ -25,20 +25,14 @@
 #define AMD_DISPATCH_HELPERS_H
 
 #include <amdgpu.h>
-enum  shader_error_type {
-	BACKEND_SE_GC_SHADER_EXECSUCESS,
-	BACKEND_SE_GC_SHADER_INVALID_SHADER,
-	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
-	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
-	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
-};
+#include "amd_ip_blocks.h"
 
 struct amdgpu_cmd_base;
 
-int amdgpu_dispatch_init( uint32_t ip_type,struct amdgpu_cmd_base *base_cmd, uint32_t version);
+int amdgpu_dispatch_init(uint32_t ip_type, struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum shader_error_type);
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
 #endif
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 06e069725..f675b97dd 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -184,6 +184,51 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+static int
+gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
+		      const struct amdgpu_ring_context *ring_context,
+		      uint32_t *pm4_dw, unsigned int cmd_error)
+{
+	uint32_t i, j;
+
+	i = 0;
+	j = 0;
+
+	 /* Invalid opcode are different for different asics,
+	  * But the range applies to all asics.
+	  * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
+	  */
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
+		ring_context->pm4[i++] = PACKET3(0xf2, 2 +  ring_context->write_length);
+	else if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
+		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, (ring_context->write_length - 2));
+	else
+		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
+
+	if (cmd_error == CMD_STREAM_TRANS_BAD_REG_ADDRESS) {
+		ring_context->pm4[i++] =  WRITE_DATA_DST_SEL(0);
+		ring_context->pm4[i++] = lower_32_bits(mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR);
+		ring_context->pm4[i++] = upper_32_bits(mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR);
+	} else if (cmd_error == CMD_STREAM_TRANS_BAD_MEM_ADDRESS) {
+		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+		ring_context->pm4[i++] = lower_32_bits(0xdeadbee0);
+		ring_context->pm4[i++] = upper_32_bits(0xdeadbee0);
+	} else if (cmd_error == CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC) {
+		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(1);
+		ring_context->pm4[i++] = lower_32_bits(0xdeadbee0);
+		ring_context->pm4[i++] = upper_32_bits(0xdeadbee0);
+	} else {
+		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
+		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	}
+
+	while (j++ < ring_context->write_length)
+		ring_context->pm4[i++] = func->deadbeaf;
+	*pm4_dw = i;
+	return i;
+}
+
 static int
 gfx_ring_atomic(const struct amdgpu_ip_funcs *func,
 		      const struct amdgpu_ring_context *ring_context,
@@ -362,6 +407,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = gfx_ring_write_linear,
+	.bad_write_linear = gfx_ring_bad_write_linear,
 	.write_linear_atomic = gfx_ring_atomic,
 	.const_fill = gfx_ring_const_fill,
 	.copy_linear = gfx_ring_copy_linear,
@@ -413,7 +459,7 @@ struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
 
 /* we may improve later */
 struct amdgpu_ip_blocks_device amdgpu_ips;
-const struct chip_info  *g_pChip = NULL;
+const struct chip_info  *g_pChip;
 struct chip_info g_chip;
 
 static int
@@ -610,6 +656,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{},
 	};
 	struct chip_info *info = &g_chip;
+
 	g_pChip = &g_chip;
 
 	switch (amdinfo->family_id) {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index d4364d604..7fd883608 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -7,6 +7,8 @@
 #ifndef AMD_IP_BLOCKS_H
 #define AMD_IP_BLOCKS_H
 
+#include <amdgpu_drm.h>
+
 #include "amd_registers.h"
 #include "amd_family.h"
 
@@ -27,6 +29,22 @@ enum amd_ip_block_type {
 	AMD_IP_MAX,
 };
 
+enum  cmd_error_type {
+	CMD_STREAM_EXEC_SUCCESS,
+	CMD_STREAM_EXEC_INVALID_OPCODE,
+	CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+	CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,
+	CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+	CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+	CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,
+
+	BACKEND_SE_GC_SHADER_EXEC_SUCCESS,
+	BACKEND_SE_GC_SHADER_INVALID_SHADER,
+	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
+	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
+	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
@@ -84,6 +102,8 @@ struct amdgpu_ip_funcs {
 	uint32_t	pattern;
 	/* functions */
 	int (*write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*bad_write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context,
+				uint32_t *pm4_dw, unsigned int cmd_error);
 	int (*write_linear_atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*const_fill)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 7a27fae51..01185bfd3 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -71,7 +71,8 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
-			bad_access_helper(device, 1, AMDGPU_HW_IP_GFX);
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+					AMDGPU_HW_IP_GFX);
 		}
 	}
 
@@ -79,7 +80,8 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
-			bad_access_helper(device, 0, AMDGPU_HW_IP_GFX);
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_GFX);
 		}
 	}
 
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 00564903f..2c17e90ab 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -32,7 +32,7 @@ amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
 }
 
 static void
-amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum shader_error_type error)
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum cmd_error_type error)
 {
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error);
 }
-- 
2.25.1

