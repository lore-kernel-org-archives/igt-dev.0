Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6358C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 02:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9F10E3EC;
	Fri, 18 Apr 2025 02:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wTOl5My+";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03110E3FB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 02:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UanBFOw3ScRCRvUAb1m3POb8SxE7gKzzRCPy9LQr2TrPP75FT77KCeQi6ZESX1cowU81ZPbDxnPjCmOdD1sLtuB4FECxEezhr3Gv9zj2byrnrThK9JCyYbnDhMG9LO4X4ePIfQwN1qUHxBEoXSffR7nYvl5pGKqg/lMi6LzZFA3D4zadYjBxQF5cV9CMISXJyh/sDi+7Xerbipi9vX/U22P8WdiRVpf5jWNQY3dn5J5mh0zXreRU7h3otQoG4nGy21o8uBae7hwKw7bufVRY6DLKNRBb3vP5NmKG9ug1Sw78IRF4/xv8/lvxghaf6M6f93CciPW+uWbyvpqy8GqYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sah8AybflulfHBMWM8ATK1xtgqlDms1wlm/l7VTcXlw=;
 b=WCTpcZfKp0n9zfiAyM02euXaSyE7h1dQozucQm8GYbF0cYtK0Q8YmTuBxfyHMPD3ulMMBuOlobfGmw6Bp8RGK/ECrTp2RwT2SKGEJzQtpQQLOsqvxR8WccXJynWsDctI9V+xjHeKx8jZ1V1cJVRf83FAiDLC6ZSX3g9WGKymIn4ETlzjElUpLURq7eGGXLzZxNIBwG/NHqHw5V/gvftna83/ZSGx0oCQFUsi62rfVvkAiAQHtkw/01Ka7fOjY1C07BT9CbLYo1w8zXC65pe4s7EtOMuw1kfhk9lpBvBxnzQwAuwSsyLrH9QiSv4guRH1Moci2Uk0r/E5OAPffcLH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sah8AybflulfHBMWM8ATK1xtgqlDms1wlm/l7VTcXlw=;
 b=wTOl5My+OuO/qNDAx2YZRS38mOzXi1hpWUKZCgljzhqW/lRKT0UpBfRzyh1Zg9odEqcfVXrnf/ypxMn6fMjwsvgKXU2ho1YpaFxM8h5dvkJXenE49CagLXA75qiKbrrMFn9Db222Mgtwg3cdeRnaoQDIe3joncicGr8aZ9DbRwk=
Received: from BY3PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:217::35)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 02:29:35 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::a1) by BY3PR04CA0030.outlook.office365.com
 (2603:10b6:a03:217::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Fri,
 18 Apr 2025 02:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 02:29:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 21:29:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 21:29:33 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 17 Apr 2025 21:29:31 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure flags
 for user queues
Date: Fri, 18 Apr 2025 10:29:18 +0800
Message-ID: <20250418022918.623643-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250418022918.623643-1-jesse.zhang@amd.com>
References: <20250418022918.623643-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: c79958f5-9d14-490b-3548-08dd7e20dbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fkTnTwzGAHICEo9fKsLZPFz0t6ikF6Cul31AjG/vSCMB4+gF0e0ZPzRPspNU?=
 =?us-ascii?Q?LcazmszF/FfvtQsi/O0rOzOy8kJ6HxJcQsglCZT3yDzw5I0+He7za2W3rn6U?=
 =?us-ascii?Q?W1hmGYFNtD5QOpgEVWudOk97bTkA34L10nff5GKdPidPSrp3bSWfG2z62dCK?=
 =?us-ascii?Q?FVFdc/DEoX7V8Sq8aP7uUtl3l/ToFd9DCu4hFmv9tUgxf6DuA5639fKBnuRd?=
 =?us-ascii?Q?mN9PaJ/AVI9t/lvhRS1W21P+/CYIv3BR+6yDQYHUQYHwceSwe7Kj8Ll1dvU5?=
 =?us-ascii?Q?KXv39LKO0OAMFJzMWZ+WXf3SoFBd65A/cbLGruB/cWw0ofed1m3qiK3D2Pi9?=
 =?us-ascii?Q?kZFjw8xWes/E5Z5FPBmNJ+/OvHvp6n2Sjx6MF58wmWBQQC2ZzwrottBUGjKb?=
 =?us-ascii?Q?IWjH6pVBH5jzH6OnW8fQrpHxdBerJJUIRLPnzAbC+t+RCdg55mJL8TwlGRU4?=
 =?us-ascii?Q?kyA5dPRIiQLBOr2jXRdAoFjFTqUjmGu0JUy/2UnoCtwezC4SLY3MFVD8ArHb?=
 =?us-ascii?Q?77BatP3UVgOkhf1XGnQlgtCXyGyVm8zoAeIcgbnNguSNBKCL7Jp9BX++PfqA?=
 =?us-ascii?Q?WbnblbvHy/GGLHkZXmYboT5rMohIPUX7uC7sZGnvEmOXP62eU8kmx/6GDI24?=
 =?us-ascii?Q?BmGycj4ifI+lbKAC+5sIReaWXJ45LBYEAD2dESOWdP7SPPJgn68an35M+XiI?=
 =?us-ascii?Q?Wr0D+qbJSWhXg5rJUWKNyXEf90N1YhOFtprO20h2THCDKpci6s5U3PCbqLSs?=
 =?us-ascii?Q?+aacKb0Sx159RuG1MeD5V4hrjB7LNCNtuSHflQ1fVUVpLgZe5FC39P7MiJmR?=
 =?us-ascii?Q?rYOXWxieJnC0gWBOOjjTJ60I3JIbCx2cVAPTpNgRdKQS/MzUGkVZJPNOIjuF?=
 =?us-ascii?Q?N7xVyP7pf3OEPVkxqNQkeaWTahu2jzIe4hweoPxw9A5SkW0ZV1X8yJcEm4o/?=
 =?us-ascii?Q?PW8K9UkKRlvLYMyQsDpkmccljEoTLLceY/qiyp2iQPpJeNJcGh9aSjw0w4zI?=
 =?us-ascii?Q?JRVXY1dgyTHdl7blsIt2OGaAabuElJfc2L0PwyiE0ffHudSYwaO7aduP1Z+U?=
 =?us-ascii?Q?1LAnPmokH5VO6VmozkIlz/a1G0lmhIsLXJddEg56B24RqShF+pFt7pJQVbWG?=
 =?us-ascii?Q?6PXTV9r0tLxejhBeXO+EkXnWOw9dtvQcW5oaXov6x4PMDYTXHxg0ofQmgrIa?=
 =?us-ascii?Q?MMCjlRuWBb+g1tT8qrwKluRIbs84GwAn7Hs6laKMFpbgeCdgETZzktDJ13nU?=
 =?us-ascii?Q?tqxMJDWb0l/Uw/gLO0UcUzxGXmv0J+wCOsdmXcVVX+bpJVgf4qdKXHupvOR+?=
 =?us-ascii?Q?EqZn9VVSdBoE3DezuNezVBnt42v7to6Ywwq1HZH34e1H4MNuD4EqSdg3Icy5?=
 =?us-ascii?Q?hHMY6z4RiNORkGxMMfUQE5DbZuGS21cnYkQJbH9LvxheGSSnTUBaWpGSy9MQ?=
 =?us-ascii?Q?prc1MCvKURlGINNnDpqaM5S7cHVyT+9JvIbn6ewoNsyBGuYKuCSo0oJRy8YM?=
 =?us-ascii?Q?2GK1WzY8A7cVS7OA6zy6/fTPSgJLqRjExy1e?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 02:29:34.8947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79958f5-9d14-490b-3548-08dd7e20dbee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

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

add both the conditions under one if (ctxt->secure) (Sunil)

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
2.25.1

