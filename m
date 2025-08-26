Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9992CA0EE4
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 06:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D6110E5CB;
	Tue, 26 Aug 2025 06:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2y8dgIBg";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80F810E184
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 06:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xINIjqqOQ1rhwQpzz1HnSfAuKqIZjtzN4nLyfY+ayFaNi0FaiRrKcIE0gNJ4jWETD1NJ8JGuNNpP2mENf8j1VxhcrUR81rGh2EcYc9tKC6OATBQ5W8YVfZv92yiwgMixSPh16/Vr8kwjy/a5cdTFCqYPQOZXUR0+2wUJZV+PksKBzljtUtlj3Vh6h5gCNxVAvjkaKxFonzLrCeV64JVI6Wl//RKNrIgB2A+usEz38y4n21CLkS/93uq5IXckzSz2t77mN+EYVscRVzrktGoEcWUGK15EeOAqeyAebVLadxMuTAT9nnJK/PA6dJt3/JuuOmncM8T+ppEz0odh2aGOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62vsQyU1AToA9BknKAThfMyxEghv2hDLM4tX081mQwg=;
 b=Nr55xqNt1GLiOqz2Oj93VKeU8+HywcfQTtjt9xuSW6hKEAQJ76L5B61+FqUN1nXGr7YVN7mGqMdPcxhQ95+tjtEGvMKXTHxUv0tMp5PgGK91EFDIL2Zt77iPyBLdH7GgBZ2PHVQ4zEVdaHb0EFm7RtuPVWJ4SnjK6M7OveANYlwTmF9oaqCBudMdLECJPlfMoR8omMpFvlukMyDMACMxKjuChXAIJQUXw14FUdctNQ6bbnhDKQyk/Ww7w0n3QBEX3uGcl06hZw4bvgmbMOsxilOFzWocAE5BozZfp9CK89ttS5cNwEBp3xTo1InjcBeLco3MYthjacjosIJc7/cBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62vsQyU1AToA9BknKAThfMyxEghv2hDLM4tX081mQwg=;
 b=2y8dgIBgyl+Q+7S8TbC63jYbhY/IX+2dttRK4ujOyK6cyPYN3+rLIsijMEClwCAkaw2Tr2W0k3fM++dRAHUc27gpJd+bIB+WdRiNfHhJeHY19w260iCqZKFifaUVe0dFXKqgtDrR/RRsLrKA39hkRLkOLnw2oV84qYdvQYsAR5E=
Received: from BL1P223CA0035.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::19)
 by IA1PR12MB9465.namprd12.prod.outlook.com (2603:10b6:208:593::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:45:41 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::e9) by BL1P223CA0035.outlook.office365.com
 (2603:10b6:208:5b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 06:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 06:45:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 01:45:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 25 Aug
 2025 23:45:37 -0700
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Aug 2025 01:45:36 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: Add user queue support to
 amdgpu_wait_memory_helper
Date: Tue, 26 Aug 2025 14:45:11 +0800
Message-ID: <20250826064530.1721892-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|IA1PR12MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: 4146ccdb-18fc-43ae-3174-08dde46c2c3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9IXaVvhYPSLCv4382SInXy6U6D1p5kzVLzjj7fUw7EQ4YWaRfC+uHXT/pChT?=
 =?us-ascii?Q?NXavDSDQaV4gxdCjWF3Zabq1qL56k6Lc3FWKQRjaXVpHSNSi95ZiDcfsRa8a?=
 =?us-ascii?Q?2aCG3EsA+gOCjiYAImsWdhp8DOS0jobvg2uRdwLFMVtYJEgwpwyNJUYIZVV/?=
 =?us-ascii?Q?0RfwuHy/wZBYK5gfrMKshR4eFgPuoIthWwisFgwzxr0qQfLcQ78GdsdDegIu?=
 =?us-ascii?Q?CCbXR2p3dLXhJY+kbS6B55gtiEtm/tJ4m0KlTItNcuHmJcb4Ul6cwFHlnG9O?=
 =?us-ascii?Q?0gymIWRbhekxBAnsV4WJk9ziIaXHHQUF1Zj+96LFyiFCexgJ/E2/A43tPyVg?=
 =?us-ascii?Q?BOTREM2A4mFt9571Y1r+qeLpUj5TnLWHspiz3Fydyzk5OnNMH2darz3eugP2?=
 =?us-ascii?Q?eKF1UP/I3mfjDbmCHSwbrS+M/qZwOU7hitpr347jpPtgcfpTu5XEdATTRVRV?=
 =?us-ascii?Q?bMMmEw2eCNel0kSe6u2OR+u1/u7axrxsof6IOg5VWwwN9qfs9pA/nwdzRiz4?=
 =?us-ascii?Q?N8Fx/+X+10onxGVWaxfczfRZgJZRkxXWF6D9jkZh2zSR2lzkKtzEeOLScNFv?=
 =?us-ascii?Q?Ykf6RWXoO6qkF6DoiTu7iVAondge/GsTna9MbSL0S9KaxzCukV4zMSic2+bz?=
 =?us-ascii?Q?2q1q9ZRHN76C/Ayz67RB/7QX7BepvrF0gyr4+CLzCMA/ExbjhasdgitILmod?=
 =?us-ascii?Q?ri+NUL5X1OUwFFFnuEDEvQoGxwOqvOD0xvTo2nG81C0LMMWFUI+jsnx5xiP5?=
 =?us-ascii?Q?BOf/JrrqQoLIhoqHw/sK4ygDBi3VivsW8iPodX1lCV8IO5ekHj+4w7BNchUU?=
 =?us-ascii?Q?1Kzis3VrAjcOJ10Qjq3ENvqZAggpcrKaStqK5KV3Pup0cYPlfO6VUBMYS5IH?=
 =?us-ascii?Q?MRi7pNT9WEUU/H7kqL4uO6VLuLLkrtcsvd3BguJ04919bYDdkbw00jxu8DJG?=
 =?us-ascii?Q?6jeNDZ0NcpNSMeEDi27EDYXR+TLXmauOwDE2Lw9XWsIPDK8ddoPgKzwQlQPx?=
 =?us-ascii?Q?NWokK8EpXisncP39S8Qk8drzc/Df1LDYXEaFV+01gwMlPMZyJBKDWA6jSoxY?=
 =?us-ascii?Q?EARdvMoK4n9oWl3WRNodNo2VJ1DrL/uxEeXpdHxq35ar3KQsMGqoAzrsJiHa?=
 =?us-ascii?Q?K7uzvF8fQvWloBBfxC+AjNf+j4EbB9Nq8/BnmahAExW+qxo+a941bUV79qaL?=
 =?us-ascii?Q?uz/J0gq12+AMqJpj8ACkCbZHy0iOAikyZeagOY0FSmetygdOBcGT/WJQnMW/?=
 =?us-ascii?Q?Hbf8b+6Wy9K/3gMcgfX3pdCHfWWrDzQY8vEnuFwtHYfN6WWc8idMxUjJhLLT?=
 =?us-ascii?Q?NrzAay46UrcaB/G5M8SGK/q+BgrFjZ0SKHmhvJ5D0Kouut4/ggaEVjqswo3x?=
 =?us-ascii?Q?7UACcI3bQ+CDILnvlPYwWdfwZZWJn3gEGBcNHyL0eUoUhFgKiV8A92c6IDXV?=
 =?us-ascii?Q?6cZYS+4NsBC744v3Cp6GEeZkPXLMFtbmac+MzuFSwMicvpC2kSXrg8FBTesL?=
 =?us-ascii?Q?7+xq8OVjerdbdg+uT513IYEiE/2MS8o0FPgk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:45:40.5718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4146ccdb-18fc-43ae-3174-08dde46c2c3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9465
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

This commit enhances the amdgpu_wait_memory_helper function to support
user queues in addition to  kernel queues.

The changes maintain backward compatibility with existing kernel queue
functionality while adding support for the newer user queue model.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 100 ++++++++++++++++++++----------
 lib/amdgpu/amd_deadlock_helpers.h |   2 +-
 2 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 84635e043..c7799b00a 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -45,7 +45,7 @@ write_mem_address(void *data)
 }
 
 static void
-amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uint32_t priority)
+amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uint32_t priority, bool userq)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle ib_result_handle;
@@ -56,7 +56,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 	struct amdgpu_cs_ib_info ib_info;
 	struct amdgpu_cs_fence fence_status;
 	uint32_t expired;
-	int r;
+	int r = 0;
 	amdgpu_bo_list_handle bo_list;
 	amdgpu_va_handle va_handle;
 	int bo_cmd_size = 4096;
@@ -64,23 +64,34 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 	pthread_t stress_thread = {0};
 	struct thread_param param = {0};
 	int job_count = 0;
+	struct amdgpu_ring_context *ring_context = NULL;
 	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, ip_type);
 
-	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
-		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
-	else
-		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
-
-	igt_assert_eq(r, 0);
+	if (userq) {
+		ring_context = calloc(1, sizeof(*ring_context));
+		igt_assert(ring_context);
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+	} else {
+		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
+			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
+		else
+			r = amdgpu_cs_ctx_create(device_handle, &context_handle);
+		igt_assert_eq(r, 0);
+	}
 
 	r = amdgpu_bo_alloc_and_map_raw(device_handle, bo_cmd_size, bo_cmd_size,
 			AMDGPU_GEM_DOMAIN_GTT, 0, use_uc_mtype ? AMDGPU_VM_MTYPE_UC : 0,
 						    &ib_result_handle, &ib_result_cpu,
 						    &ib_result_mc_address, &va_handle);
 	igt_assert_eq(r, 0);
-
-	r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
-	igt_assert_eq(r, 0);
+	if (userq) {
+		r = amdgpu_timeline_syncobj_wait(device_handle, ring_context->timeline_syncobj_handle, ring_context->point);
+		igt_assert_eq(r, 0);
+	} else {
+		r = amdgpu_get_bo_list(device_handle, ib_result_handle, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
 
 	base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
 
@@ -145,42 +156,55 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 		/* GPU hung is detected becouse we wait for register value*/
 		/* submit jobs until it is cancelled , it is about 33 jobs for gfx */
 		/* before GPU hung */
-		r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+		if (userq) {
+			ring_context->pm4_dw = ib_info.size;
+			ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type, ib_result_mc_address);
+		} else {
+			r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
+		}
 		job_count++;
 	} while (r == 0 && job_count < MAX_JOB_COUNT);
 
 	if (r != 0 && r != -ECANCELED && r != -ENODATA)
 		igt_assert(0);
 
-
-
-	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
-	fence_status.context = context_handle;
-	fence_status.ip_type = ip_type;
-	fence_status.ip_instance = 0;
-	fence_status.ring = 0;
-	fence_status.fence = ibs_request.seq_no;
-
-	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
-			&expired);
-	if (r != 0 && r != -ECANCELED && r != -ENODATA && r != -ETIME)
-		igt_assert(0);
-
+	// Wait for completion (syncobj for userq, fence for kernel queue)
+	if (userq) {
+		r = amdgpu_timeline_syncobj_wait(device_handle, ring_context->timeline_syncobj_handle, ring_context->point);
+	} else {
+		memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
+		fence_status.context = context_handle;
+		fence_status.ip_type = ip_type;
+		fence_status.ip_instance = 0;
+		fence_status.ring = 0;
+		fence_status.fence = ibs_request.seq_no;
+
+		r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
+				&expired);
+		if (r != 0 && r != -ECANCELED && r != -ENODATA && r != -ETIME)
+			igt_assert(0);
+	}
 	/* send signal to modify the memory we wait for */
 	pthread_kill(stress_thread, SIGUSR2);
 
 	pthread_join(stress_thread, NULL);
 
-	amdgpu_bo_list_destroy(bo_list);
+	// Cleanup
+	if (!userq) {
+		amdgpu_bo_list_destroy(bo_list);
+		amdgpu_cs_ctx_free(context_handle);
+	} else {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+		free(ring_context);
+	}
 
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 							 ib_result_mc_address, 4096);
-
 	amdgpu_cs_ctx_free(context_handle);
 	free_cmd_base(base_cmd);
 }
 
-void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci)
+void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci, bool userq)
 {
 	int r;
 	FILE *fp;
@@ -197,6 +221,18 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
+	if (userq) {
+		/* User queue specific setup */
+		igt_info("Using user queue mode\n");
+
+		/* For user queues, we typically want to use normal priority */
+		prio = AMDGPU_CTX_PRIORITY_NORMAL;
+
+		/* Skip the scheduler mask manipulation for user queues */
+		amdgpu_wait_memory(device_handle, ip_type, prio, true);
+		return;
+	}
+
 	support_page = is_support_page_queue(ip_type, pci);
 
 	if (ip_type == AMD_IP_GFX)
@@ -267,7 +303,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 			igt_assert_eq(r, 0);
 		}
 
-		amdgpu_wait_memory(device_handle, ip_type, prio);
+		amdgpu_wait_memory(device_handle, ip_type, prio, false);
 	}
 
 	/* recover the sched mask */
@@ -466,10 +502,6 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	if (user_queue) {
-		if (info.hw_ip_version_major < 11) {
-			igt_info("SKIP ... as user queueu doesn't support %d\n", ip_type);
-			return;
-		}
 		/* No need to iterate each ring, user queues are scheduled by hardware */
 		bad_access_helper(device_handle, cmd_error, ip_type, prio, user_queue);
 		return;
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index fdbeb409c..c46ebb67b 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -27,7 +27,7 @@
 #include "amd_ip_blocks.h"
 
 void
-amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
+amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci, bool userq);
 void
 bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue);
 
-- 
2.49.0

