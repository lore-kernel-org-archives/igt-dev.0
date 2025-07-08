Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25369C83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 07:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAB810E15B;
	Tue,  8 Jul 2025 07:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zPqXt+xo";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1E910E15B
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 07:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0S3/d+AN+OMBkdquYpycDCRcCA6yHxZ3dheV0Nu5bwqNQpePglJ9zasAHO8PxrMQpotAz8FJZG6SvdTQ4K6PvLgpvdTSWlMghZN0bH6oYUFjuODwkGNxnVF6PmkNtzRnm8W8nVZLXFD2tim/L1jz9smIWzoRnZuUtqSgL4Lx7ep+qf6hhKrdsw0j0XwupMwyGdjr3bNSwrzoOccTlvDi59nijT3PA0LT2FBDyS5wLLhZPJnlCBffeQFDf6hxR8vUCqS0fawtyE7bMYpYEGDhQXU1W5fu5cLyINye2JoKyx+2G8Qn5Va0ZB7FcHQxYne5uAz2qbfdV/We1YnObn58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0CdlhBNOvhZou8U+ZNypsaxzlh3B7dwrKg1N0Oisug=;
 b=KqtNC2+lZ8gBwZNDgZfxXVPhjkBRm4kPpq/udtXRA5I+SGe9CaIM1K+/EpVQtbNMYfIIiy/lQpOTI6YS+u7pjsLXiVYY2xZSqNCf5aI/0Amx1XJb8jZc3JDwx2kztYC4ft24A00cj0buqH9gHijz/hTFtuHiu7pNFiZYhLFopeMl3wjFNYqX/P18noHzoURWUwntHmMyAcwGiKZnMxH7Gx4aOTt/DWeveitsThmDFbayAT5qx50b4WqHARgamVS5NduQCznCHhkGBNYC6eS0lzNe65LBofiP3qvU0+LxY9rMufGjZspajFgSkq/8ZpkePbGoujpnz5XaQ4i8MgndbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0CdlhBNOvhZou8U+ZNypsaxzlh3B7dwrKg1N0Oisug=;
 b=zPqXt+xoGCBE/dtfromh9cEvjCjZgTUn3LGHOb8+0bb6l9aUhyMXWEdcPNQEaQ+/itIaelExO0NAcfb00fFufRHGlAJ7gchQGJqZ15nzW0/MskarApeSy1bv4p2pFiiIQns6WUVvO/HkKXGBfINdCkJ6z9wOIRM4sHH+k4IBbqw=
Received: from MN0P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::25)
 by BN7PPF5D27497F1.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 07:48:24 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::20) by MN0P221CA0021.outlook.office365.com
 (2603:10b6:208:52a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 07:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:48:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:48:23 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 8 Jul 2025 02:48:22 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/4] lib/amdgpu: add multi-IP block write command
 submission helper
Date: Tue, 8 Jul 2025 15:47:48 +0800
Message-ID: <20250708074819.624367-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708074819.624367-1-Jesse.Zhang@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|BN7PPF5D27497F1:EE_
X-MS-Office365-Filtering-Correlation-Id: c7610f43-e01c-4c3f-e76d-08ddbdf3d16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dmMKGaLDIA3/w5idO0Y8oPySeXxWip5IGd59rcRQoULW75RGqdKEM0QUS4ev?=
 =?us-ascii?Q?RwATqvps3IVQBFvyz0C6eE5k2wZWAmCsitU67XIKtNvh2dBSZittasO1/wZy?=
 =?us-ascii?Q?1uqJOPGvVy0hpvjjSYx2wAxa02PwntZ3CH4RsJEBVEtdl67lJU+h0pDERH8W?=
 =?us-ascii?Q?KDFdqu1fZmujA8jvzKZAOjxSWuveKjfeVIKaGndp4APvaGpaYhd3EBBOf4JE?=
 =?us-ascii?Q?jk1WK7Wqu96FhskYPHo9EckBq3z4rBdMDiU861PAZvy+ncPntgSoGm6vkfRU?=
 =?us-ascii?Q?JotYhUX/gi+SPCRANlErdzobJ58de1r87Ceiwc3LBLEgEiLFyN8RfmMcPuQy?=
 =?us-ascii?Q?rCTPrkSyGTPlbcxP67wLYOt1zMbqcwOzs76J+p+qM1ZTpGZxY8cYX6gCbES7?=
 =?us-ascii?Q?Aq/CbSuJXCl8MxyAY1gLL7R3BYEXt61tOazI+TLLxF+fdtvsoVxs8nwwDbKH?=
 =?us-ascii?Q?0Esh/HshiuI24TpzCLPNOCUXxcffikU+Ob++mIR5x42M5AC1N5lai02BHLlD?=
 =?us-ascii?Q?p04yZB6DiplsFNQa69Tqtvy3ZRssf7gVemEwHjZsPwCcRzQNUNKJLJlhABU1?=
 =?us-ascii?Q?Lk1lFKQuTk3z7dh7xKGM1DA+TGr4F/ARP6HUiEAx89QfhmsZypwgFEo72hD6?=
 =?us-ascii?Q?ZH+lORQm+1n86PAIhnBRrTkngCDHtn443JNDO2vpv89pmhCxc2XUEEdAxE0a?=
 =?us-ascii?Q?gDqC+5IqN3Y+t9mZExQpeAUsJLplLromr5/3aQmqNluet1m3V5dF/ZG6Z4t9?=
 =?us-ascii?Q?9cbZXlEu2GFSL2lTpsHBdTNa5nC0N0HRuierwPT/xJ8UuxUIHd0Dh33eiwR2?=
 =?us-ascii?Q?JMYpMnz/eOaepOnBCJfGKkRA2YqiXnR465NmcmP6vr5ek42+LByivfelnG5e?=
 =?us-ascii?Q?TRFeqNIi0zmW3zZUhnxfIvkCNy+Wp7H8MMcvGk/mz0J+h43kzkjJxGa87D+u?=
 =?us-ascii?Q?WdBdqmWYKXEhAqmIZfR/autCOiNW61RWpcxfNlfG/frEQBvspR221XDbqgR7?=
 =?us-ascii?Q?LnIG5MYEJ23BStAZZAzv/CuAbClKp6TbtmJZl1ScJL5fNsaYD1tIdvxtpED6?=
 =?us-ascii?Q?VMvYGl1IcNYIcmqo25aHlVU4uKG2nRWQnYcwkPgb4joM09hTfkEB2Gb4N9Lg?=
 =?us-ascii?Q?iUOo/b6lR82wo1oyPJifPWGJMgjD9/GSlzDOu/HdE9C/AdSVKAgj48oGF2ok?=
 =?us-ascii?Q?sqNQPCaLl2SujrPzxKQHFodZb+hPSwXbRlxl5ZRzT+IqeNz0fLB3XPTXLZP1?=
 =?us-ascii?Q?i3wOtiSq5qXNJWr19RgQBtfXKun808wT456JItssV/ZxZjCpA9rtq6pOvIuG?=
 =?us-ascii?Q?Xp4crlx7/L4vt7Tck0I8gJuQ94t/nlqQ/4jZncWuFde+MapKDw519kYiRvdD?=
 =?us-ascii?Q?bANQaMv+jxS0GRHUGgfPrX59Y5UJW3I5i7Hibwqc7/N48n5JLEGydcLm9DID?=
 =?us-ascii?Q?gcXsTvn7g1G39c+o3jpVNvUzr6Sv7v0brOG2vZdRms7Ng11roYGZKL1Ma/Ha?=
 =?us-ascii?Q?SNV0xV2j8NgAW8FrklHMEVHiMB+Y1XmAWiHC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:48:24.4405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7610f43-e01c-4c3f-e76d-08ddbdf3d16e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF5D27497F1
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

Add a new helper function amdgpu_command_submission_write_linear_helper2()
that supports testing across multiple IP blocks (GFX, COMPUTE, DMA) in a
single call. The implementation includes:

1. amdgpu_create_ip_queues() - Creates and initializes queues for a given IP block
2. amdgpu_command_submission_write_linear() - Handles command submission and verification
3. amdgpu_destroy_ip_queues() - Cleans up allocated resources

This provides a more flexible way to test command submission across
multiple hardware IP blocks compared to the single-IP version.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 208 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |   3 +
 2 files changed, 211 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 154c264e9..0279b22c8 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -133,6 +133,214 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	return r;
 }
 
+static void amdgpu_create_ip_queues(amdgpu_device_handle device,
+                         const struct amdgpu_ip_block_version *ip_block,
+                         bool secure, bool user_queue,
+                         struct amdgpu_ring_context **ring_context_out,
+                         int *available_rings_out)
+{
+	const int sdma_write_length = 128;
+	const int pm4_dw = 256;
+	struct amdgpu_ring_context *ring_context = NULL;
+	int available_rings = 0;
+	int r, ring_id;
+
+	/* Get number of available queues */
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
+
+	/* First get the hardware IP information */
+	memset(&hw_ip_info, 0, sizeof(hw_ip_info));
+	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &hw_ip_info);
+	igt_assert_eq(r, 0);
+
+	available_rings = user_queue ? ((1 << hw_ip_info.num_userq_slots) - 1) :
+				hw_ip_info.available_rings;
+	if (available_rings <= 0) {
+		*ring_context_out = NULL;
+		*available_rings_out = 0;
+		igt_skip("No available queues for testing\n");
+		return;
+	}
+
+	/* Allocate and initialize ring_id contexts */
+	ring_context = calloc(available_rings, sizeof(*ring_context));
+	igt_assert(ring_context);
+
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
+		memset(&ring_context[ring_id], 0, sizeof(ring_context[ring_id]));
+		ring_context[ring_id].write_length = sdma_write_length;
+		ring_context[ring_id].pm4 = calloc(pm4_dw, sizeof(*ring_context[ring_id].pm4));
+		ring_context[ring_id].secure = secure;
+		ring_context[ring_id].pm4_size = pm4_dw;
+		ring_context[ring_id].res_cnt = 1;
+		ring_context[ring_id].user_queue = user_queue;
+		ring_context[ring_id].time_out = 0;
+		igt_assert(ring_context[ring_id].pm4);
+
+		/* Copy the previously queried HW IP info instead of querying again */
+		memcpy(&ring_context[ring_id].hw_ip_info, &hw_ip_info, sizeof(hw_ip_info));
+	}
+
+	/* Create all queues */
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
+		if (user_queue) {
+			ip_block->funcs->userq_create(device, &ring_context[ring_id], ip_block->type);
+		} else {
+			r = amdgpu_cs_ctx_create(device, &ring_context[ring_id].context_handle);
+		}
+		igt_assert_eq(r, 0);
+	}
+
+	*ring_context_out = ring_context;
+	*available_rings_out = available_rings;
+}
+
+static void amdgpu_command_submission_write_linear(amdgpu_device_handle device,
+                         const struct amdgpu_ip_block_version *ip_block,
+                         bool secure, bool user_queue,
+                         struct amdgpu_ring_context *ring_context,
+                         int available_rings)
+{
+	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
+	int i, r, ring_id;
+
+	/* Set encryption flags if needed */
+	for (i = 0; secure && (i < 2); i++)
+		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
+
+	/* Test all queues */
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
+		/* Allocate buffer for this ring_id */
+		r = amdgpu_bo_alloc_and_map_sync(device,
+			ring_context[ring_id].write_length * sizeof(uint32_t),
+			4096, AMDGPU_GEM_DOMAIN_GTT,
+			gtt_flags[0],
+			AMDGPU_VM_MTYPE_UC,
+			&ring_context[ring_id].bo,
+			(void **)&ring_context[ring_id].bo_cpu,
+			&ring_context[ring_id].bo_mc,
+			&ring_context[ring_id].va_handle,
+			ring_context[ring_id].timeline_syncobj_handle,
+			++ring_context[ring_id].point, user_queue);
+		igt_assert_eq(r, 0);
+
+		if (user_queue) {
+			r = amdgpu_timeline_syncobj_wait(device,
+			ring_context[ring_id].timeline_syncobj_handle,
+			ring_context[ring_id].point);
+			igt_assert_eq(r, 0);
+		}
+
+		/* Clear buffer */
+		memset((void *)ring_context[ring_id].bo_cpu, 0,
+		       ring_context[ring_id].write_length * sizeof(uint32_t));
+
+		ring_context[ring_id].resources[0] = ring_context[ring_id].bo;
+
+		/* Submit work */
+		ip_block->funcs->write_linear(ip_block->funcs, &ring_context[ring_id],
+			  &ring_context[ring_id].pm4_dw);
+
+		amdgpu_test_exec_cs_helper(device, ip_block->type, &ring_context[ring_id], 0);
+
+		/* Verification */
+		if (!secure) {
+			r = ip_block->funcs->compare(ip_block->funcs, &ring_context[ring_id], 1);
+			igt_assert_eq(r, 0);
+		} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
+			ip_block->funcs->write_linear_atomic(ip_block->funcs, &ring_context[ring_id], &ring_context[ring_id].pm4_dw);
+			amdgpu_test_exec_cs_helper(device, ip_block->type, &ring_context[ring_id], 0);
+		} else if (ip_block->type == AMDGPU_HW_IP_DMA) {
+			uint32_t original_value = ring_context[ring_id].bo_cpu[0];
+			ip_block->funcs->write_linear_atomic(ip_block->funcs, &ring_context[ring_id], &ring_context[ring_id].pm4_dw);
+			amdgpu_test_exec_cs_helper(device, ip_block->type, &ring_context[ring_id], 0);
+			igt_assert_neq(ring_context[ring_id].bo_cpu[0], original_value);
+
+			original_value = ring_context[ring_id].bo_cpu[0];
+			ip_block->funcs->write_linear_atomic(ip_block->funcs, &ring_context[ring_id], &ring_context[ring_id].pm4_dw);
+			amdgpu_test_exec_cs_helper(device, ip_block->type, &ring_context[ring_id], 0);
+			igt_assert_eq(ring_context[ring_id].bo_cpu[0], original_value);
+		}
+
+		/* Clean up buffer */
+		amdgpu_bo_unmap_and_free(ring_context[ring_id].bo, ring_context[ring_id].va_handle,
+		ring_context[ring_id].bo_mc,
+		ring_context[ring_id].write_length * sizeof(uint32_t));
+	}
+}
+
+static void amdgpu_destroy_ip_queues(amdgpu_device_handle device,
+                         const struct amdgpu_ip_block_version *ip_block,
+                         bool secure, bool user_queue,
+                         struct amdgpu_ring_context *ring_context,
+                         int available_rings)
+{
+	int ring_id, r;
+
+	/* Destroy all queues and free resources */
+	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
+		if (user_queue) {
+			ip_block->funcs->userq_destroy(device, &ring_context[ring_id], ip_block->type);
+		} else {
+			r = amdgpu_cs_ctx_free(ring_context[ring_id].context_handle);
+			igt_assert_eq(r, 0);
+		}
+		free(ring_context[ring_id].pm4);
+	}
+
+	free(ring_context);
+}
+
+void amdgpu_command_submission_write_linear_helper2(amdgpu_device_handle device,
+                            unsigned type,
+                            bool secure, bool user_queue)
+{
+	struct amdgpu_ring_context *gfx_ring_context = NULL;
+	struct amdgpu_ring_context *compute_ring_context = NULL;
+	struct amdgpu_ring_context *sdma_ring_context = NULL;
+
+	// Separate variables for each type of IP block's ring_id count
+	int num_gfx_queues = 0;
+	int num_compute_queues = 0;
+	int num_sdma_queues = 0;
+
+	/* Create IP slots for each block */
+	if (type & AMDGPU_HW_IP_GFX)
+		amdgpu_create_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_GFX), secure, user_queue, &gfx_ring_context, &num_gfx_queues);
+
+	if (type & AMDGPU_HW_IP_COMPUTE)
+		amdgpu_create_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE), secure, user_queue, &compute_ring_context, &num_compute_queues);
+
+	if (type & AMDGPU_HW_IP_DMA)
+		amdgpu_create_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_DMA), secure, user_queue, &sdma_ring_context, &num_sdma_queues);
+
+	/* Submit commands to all IP blocks */
+	if (gfx_ring_context)
+		amdgpu_command_submission_write_linear(device, get_ip_block(device, AMDGPU_HW_IP_GFX), secure, user_queue,
+												gfx_ring_context, num_gfx_queues);
+
+	if (compute_ring_context)
+		amdgpu_command_submission_write_linear(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE), secure, user_queue,
+												compute_ring_context, num_compute_queues);
+
+	if (sdma_ring_context)
+		amdgpu_command_submission_write_linear(device, get_ip_block(device, AMDGPU_HW_IP_DMA), secure, user_queue,
+												sdma_ring_context, num_sdma_queues);
+
+	/* Clean up resources */
+	if (gfx_ring_context)
+		amdgpu_destroy_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_GFX), secure, user_queue,
+												gfx_ring_context, num_gfx_queues);
+
+	if (compute_ring_context)
+		amdgpu_destroy_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_COMPUTE), secure, user_queue,
+												compute_ring_context, num_compute_queues);
+
+	if (sdma_ring_context)
+		amdgpu_destroy_ip_queues(device, get_ip_block(device, AMDGPU_HW_IP_DMA), secure, user_queue,
+												sdma_ring_context, num_sdma_queues);
+}
+
 void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   const struct amdgpu_ip_block_version *ip_block,
 						   bool secure, bool user_queue)
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index d0139b364..abbae2ff3 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -36,6 +36,9 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   const struct amdgpu_ip_block_version *ip_block,
 						   bool secure, bool user_queue);
 
+void amdgpu_command_submission_write_linear_helper2(amdgpu_device_handle device, unsigned type,
+						    bool secure, bool user_queue);
+
 void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 						 const struct amdgpu_ip_block_version *ip_block,
 						 bool user_queue);
-- 
2.49.0

