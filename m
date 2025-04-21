Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA32C369C2
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 01:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D3B10E030;
	Mon, 21 Apr 2025 01:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yEGSEbv0";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A0310E030
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 01:39:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5qcb7vudifnaPfqPz49HhrWoy+Qd373x2UWoACu6pyFf/IZNe7d8eF1j3eFFgrwpQre4+ate5KbsnNIDvL769hTYpR2Xnhv1JB7wl12pfMNxG89rAjQQ1hiQs60/uqTTsIn2Uemk9o+EvypxfMEkKDZ0ezqt4dZg7T7tNfTyBWbBSxwVGsZrf/17nD6v2Zo+RiHXBbngRkQtHubixAXePBVVvWUr5CQrjl7VaUG2wnTlCd6XxJPWAzfuiWhQoqnYwqhnfQcWN9WFJeLfjefr4jDFN78gE/8yYd0+tpMD0fKpMqGnRNnhnwlCCfMO3S8rIOpz/3PRO7sBUJEbSWW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BETZ3/S4RUFnKiMHypI2rkIeNSPKZ9WeB8gczH6gmeM=;
 b=sx9CNaynvhJvJsflQvmSf1oGERmkoVwqxz7oR0jO6MU061ulsaVLlF8KtaWYXSfx9Z+tUEC4oQ8i6KfTQcFnmD1aU83Y8miB8UrVdj367wvmmvyRRUIARfSEjsx4IYm3D35csYwmlx4585KmmxAOYA6X//8bPn1JjlhWjAwzNSNNYAoFQPi3JbfdQ7DyhOy2Y+PR6omZ9lJeklnMrMh090Bc3IHzXo38vp2YFoh0GsrMsnPjsaMxf8/bB47O+WTEziuxde0dcZ1i37cARrR1Ji82zZbFu2twISlf906rfa7l4IbMfMRYAXcAjgvITY/TndhXBLTFIQEgfk/HUpEG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BETZ3/S4RUFnKiMHypI2rkIeNSPKZ9WeB8gczH6gmeM=;
 b=yEGSEbv0THHJmlVkyqBMwMUli4CgylPIrb0O8yJU4Jpo5ZWU3L3h52nal5og/lk85CUMeQnWY/yRChz5VBwDj11X1KbWLB6dPpV7vc3wdO26xHMpmdCco0Fkrz6QZWda9lqEcgmJwIKjeDZPTHthrPMNdyUolnAdprrftH3tVys=
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by CH3PR12MB9315.namprd12.prod.outlook.com (2603:10b6:610:1cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 21 Apr
 2025 01:39:21 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::84) by DS7PR03CA0145.outlook.office365.com
 (2603:10b6:5:3b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 01:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 01:39:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 20 Apr
 2025 20:39:20 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Sun, 20 Apr 2025 20:39:18 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse . zhang"
 <Jesse.zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH i-g-t v3 2/2] lib/amdgpu: Implement priority and secure flags
 for user queues
Date: Mon, 21 Apr 2025 09:37:33 +0800
Message-ID: <20250421013910.796313-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421013910.796313-1-Jesse.Zhang@amd.com>
References: <20250421013910.796313-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: cf678316-3ea9-449a-7a75-08dd807556d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?blDR5ux6MMQs51Z+uQPDIe89bscLV8izxrRJmuraVvl4aRY53naaQ6UwYeZX?=
 =?us-ascii?Q?GQshOlJ08E1AHe8LpEHmptIoHgYmt7YyJHet8JlRd32fGDcna7zOUVeM39hb?=
 =?us-ascii?Q?SLLSFqS80dP4m8BoqRFDsYN3FkhNvvus6dJgDEt/kvaagX9mGr1v+lOtq8oZ?=
 =?us-ascii?Q?wx8+a4OZCtqGXkr5h1z/3j1BpNnnaknmmo+NFskQnFlSxNHQ631CToAj40U1?=
 =?us-ascii?Q?0rpGKBVqTGsrIGVJU0ywraTrKKxQ2p4OaCusc4pOFmIz5PxXOTJruld498fT?=
 =?us-ascii?Q?hmHn9/TC/GBogSbROshfN2rW+lScB+qY/ZKGX8CUuhQCm/zZWrgJ8hRhbnQx?=
 =?us-ascii?Q?3BIK9zlGZT7lfsAn+uiIfXgIiDOldLn+txNE9DwmbuXAAgZtU/fAq5hdpobe?=
 =?us-ascii?Q?Rl4xgqcSF909SkoIyrIPAE5lgSWgfHZ0CXltcY4H17jHlRwMYC1NT5NRcfqV?=
 =?us-ascii?Q?E2DQ7tn0B9Lm/aLYiyAmDxt44ZBlQS+gFw8gNqqw8XkdkO7gLylDvvvs0gDJ?=
 =?us-ascii?Q?cs4PgbD3rE1qbGVxrOc/Wb4noTzzGYwQjqUM4URE+tP32vj07fw88VfI5fhT?=
 =?us-ascii?Q?+kBVCitpQAM+eeCKXzvyYhihkzwErugumdjzHAPdhxiD+MuALuT+khF50xUR?=
 =?us-ascii?Q?A+s9j3c9GXqc+9FH5SmJo5dQL5yVpP81N+gGX2dnKMTkroczHKmfJeOqUpHf?=
 =?us-ascii?Q?4HuuiqNOfebe2lCkkMB+nT8yxF4eMX6yen+ua4yUIK2oOaIkMFuwh2994tLS?=
 =?us-ascii?Q?XDQ5weKuP9OhNyXK0a6fyjoB4gMBwTRD0C1vDVKB8yZ6n231IRxQQW7+TN2L?=
 =?us-ascii?Q?Rcv7NAJTRaAWdjlhS0J5g+hm5N+sP01jj6zcfCui+ivEbMFwSH9gfUBXh8wt?=
 =?us-ascii?Q?tagojiIoPgN9MVVlw0sv4Ua9sOopsi2+pdS+55p61lQ/vsZXFvnAA87mOxAh?=
 =?us-ascii?Q?AYflUVdhrVLFP6ae+/jpDohaKesJfdw3Xa3cyqlXzePWJqsXZYG72NLygm2b?=
 =?us-ascii?Q?l/QQUeC5I3BmBww2BGVDWviQoRtkz8zYRcyOhPw/TtCTZJGlmPz608vrlq54?=
 =?us-ascii?Q?GX1QvC3YrKHy2whH3GSka6wL0PDir0PUvR4ld2g2iuBRvRb020xZbpsL3ta7?=
 =?us-ascii?Q?LXCnbhX7YtKYAiHrQxQ9h21WwSfHwWsYLt7Ye53Ak//IpN88iFPMCyLgqqPD?=
 =?us-ascii?Q?vemhfqRu9CPU0HxcJYbgs5SfCgCXhwPuBPjDcPvzMSq2cZjvBRgMc2RyDtIq?=
 =?us-ascii?Q?r1hE+m+Db5JaHpHqku2oUPJEQOLWhtOmaCaeG8qWn/uRyEDxfC3wl4zOlpvw?=
 =?us-ascii?Q?eoq7+53FBcRqhG9OnGKpkepTkxx13cDcv2AEna365TlmoM8i98pMXsafAo6+?=
 =?us-ascii?Q?O3lhUBpXEwSkQXQVZHE06rrjD59aeSRT71fQ9l3a3guQhA++z7tM3SXMR6Zm?=
 =?us-ascii?Q?8ZYdDa4ikl9fSLRlVcG1KyiZ9ET4c8Hmff2Ii7TRBGgARWe8WpOspxeaEa0G?=
 =?us-ascii?Q?9wfvysojA8uDjPuR+GTu/1QQOz5x0mPRZRj5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 01:39:21.1704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf678316-3ea9-449a-7a75-08dd807556d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315
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

From: Jesse.zhang <Jesse.zhang@amd.com>

This patch adds support for queue priority levels and secure queue
creation flags in the user queue interface. The changes include:

1. Extended the amdgpu_ring_context struct to store queue priority

2. Modified amdgpu_user_queue_create() to:
   - Parse and pass through priority flags from context
   - Handle secure queue flag
   - Include flags in queue creation IOCTL calls

The priority levels allow workloads to specify different scheduling
priorities, with HIGH priority restricted to admin-only use. The secure
flag enables creation of queues that can access protected content.

This matches the corresponding libdrm changes in commit fdf384d4b546
("amdgpu: add priority and secure flags for user queues").

v2: add both the conditions under one if (ctxt->secure) (Sunil)
v3: fix git config issue and update the git version (Kamil)
    move the priority to bottom in the struct amdgpu_ring_context (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h  |  1 +
 lib/amdgpu/amd_user_queue.c | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 231098eb8..7d48f9107 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -118,6 +118,7 @@ struct amdgpu_ring_context {
 	uint32_t *pm4;		/* data of the packet */
 	uint32_t pm4_size;	/* max allocated packet size */
 	bool secure;		/* secure or not */
+	uint32_t priority;	/* user queue priority */
 
 	uint64_t bo_mc;		/* GPU address of first buffer */
 	uint64_t bo_mc2;	/* GPU address for p4 packet */
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 0cdd0c4f9..444f9c022 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -270,7 +270,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 			      unsigned int type)
 {
 	int r;
-	uint64_t gtt_flags = 0;
+	uint64_t gtt_flags = 0, queue_flags = 0;
 	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
 	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
 	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
@@ -281,8 +281,14 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 		return;
 	}
 
-	if (ctxt->secure)
+	if (ctxt->secure) {
 		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
+		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
+	}
+
+	if (ctxt->priority)
+		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
+
 	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
@@ -404,7 +410,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
@@ -413,7 +419,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
@@ -422,7 +428,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
-- 
2.49.0

