Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B4C369BD
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 02:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC4510E099;
	Thu, 17 Apr 2025 02:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yr58FkAZ";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3710E099
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 02:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE6Qia9ujwxAnojggKZbPy8Z9kHW3wgUSNYld/EDTSxetwvxhj8ZJ57j2wlw87ZGdJzTyx9gO2ZCSEeKv3o0fKj+1jJ4APHtk8AB3GaeGdIRqTBoOpBF3PLTom6Y36gYN99lt8tTNtkqfKrXXVKHhhLK7Ob9lMzuC1dP06ogbW+1K8BcGVfPdIO4oADWBazfLFY1gXAS1rL5fupR/wVjD1pbmwSNovXjZv6/zDtcIl2oOCzoxibIIXSfSCifbI4S5IMRAl1SmidxoF1bbOFpf9cAUlZ9GW+0Ij+3UYAnWMESOpAL18kc4eZITPQYkvtyg6GL5bB89gKONYLj5Yxabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q6ff+wj0h5e5y84oV0tNiJstGA/JpLL6GRzkKX2+9M=;
 b=vJkrB0z5nEGQ/1xPc+3/22gZz1mu9JxOSgXj5k3bByQ06O5Iw/bCRQ9nbkjhjjco8n1Ws15Kqb4KVANb8fn19tasAQuTzopdigFMpkpttyTEZMpEnyMqO9pNeduP/1/At/elyNAbGCT0FJpytxInmTkXAGuy491dXd1FHChIBZ/pOgLy5xU9oFcXAmKk98k8IHEwrbQhhMSm84YyPK+J0rJcjvMaB2bGyE5jpUKnjzX99faiWd3J/Z3d5FaUamiouvkw/owOo6rI5jAvnJV6QkHA8vplqp4tgU/X+gfrTCFog/6dfh+DjQf3gh1QlczaZgIuwY4ES8Cma+B/e/jfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q6ff+wj0h5e5y84oV0tNiJstGA/JpLL6GRzkKX2+9M=;
 b=Yr58FkAZ0ThIKd4vRm7pEYBMDqFzghAbnw1nyXQEuGLwyFqhxNrfXhRkNDKGz4vX68+8pJcaT9GHHmRiyfO9zhTd4Emmbxg1WUjqKq0mfmF9xr5J1AspI00LQRZmdOIoc+/lKSpZQCl8R5qU899x8CaCBH0RsQtLDIY3mkGgRkY=
Received: from MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::21)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 02:11:55 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::f) by MW4P221CA0016.outlook.office365.com
 (2603:10b6:303:8b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 02:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 02:11:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 21:11:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 21:11:47 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 16 Apr 2025 21:11:05 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig --subject-prefix=PATCH i-g-t
 <christian.koenig@amd.com>, "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 "Jesse . Zhang" <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Add priority and secure flags support for
 user queues
Date: Thu, 17 Apr 2025 10:11:04 +0800
Message-ID: <20250417021104.539935-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA1PR12MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8a8e51-6a4f-4962-5f0c-08dd7d553974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NVVKEIPcFDsMV45eE0i0PE+9sM26R7T8wYJkGJCDnDznLT7lL06ABE/JAqWt?=
 =?us-ascii?Q?HQ+DO3s/n/RrvfL6con9sxqW/z6uwjPQRrb3le8/PJMC6ZEeVQTtxcMj5ea2?=
 =?us-ascii?Q?06FLzohdXltAOAF1q9Sg6epaXIJ29dVnIwO6k3fikMGW8SdIKpEEa+un/Qqs?=
 =?us-ascii?Q?v9idvH/sWMzhlEWIcOLs7Al3nQfA+k7U06cT0tcYcDLpHNZF3OW5difUaFyy?=
 =?us-ascii?Q?DDIc7wNhwHunYPoefknrEXUIQu510GoMDJoCLNQMH16nqoyBqgnU/UBcERNg?=
 =?us-ascii?Q?X9leAd9GGEPWPTWqbT7cQThxcR3vNs5P4Ybv2JQyZaiWpU6GeraEb29+GOKH?=
 =?us-ascii?Q?U6yd2WS+Q9zA1uG5uqTgoQEu+oMAyCFdzLbkax+X94Ocq6GHGPAQfjVmg1Ri?=
 =?us-ascii?Q?rzVJUZVfNTX0Jtb+VxgHcfkggjsVuKZxqj9BdhUE0GkGG9D5r7xOe4y6WDtX?=
 =?us-ascii?Q?1Zq9+JEhDQEKC9GNXlLq66gE17JOPprhGTJnZ6GJ5VER6T/eqk0y/tcQXtu4?=
 =?us-ascii?Q?ycN3a+fSRWUqF9JOKhCYalTSMAY2nJ4GnEcRuSjtoCBXXHaERxZIVnr5uj9D?=
 =?us-ascii?Q?ysbNm8aZ8MHNb0CXovuWO3JcfQOOcgeCvuvgMo2OSOznbwQppPj6ii+cMLqi?=
 =?us-ascii?Q?6Viv0uKPRHKX91SiZjQTzqj5iu1wWIuH1voTtOCxPom9P/m7JJV+jbz89SO6?=
 =?us-ascii?Q?m6khfHkOHQzuLfhLFdTfN7pWz4xFquq8+5tXQgQ3H9OCZaW2n1LFdaMW+IVy?=
 =?us-ascii?Q?srRJxqX9GOYa4tl0Qc7XtVOOUNBXUWYcrUwzdG2DI9iX1dysffwfw2JVNyTp?=
 =?us-ascii?Q?8hhe+oOaEdos6T1lw+qTNSg1UWLJdKRJ0NPcZfHX5lK8z4TlcAWxkT85mpuO?=
 =?us-ascii?Q?cyqKbfGbSh4f0C3krb8iYiIUy5fR8+TASo5snYnyZU4fes2Cl6Lyqozy+0R8?=
 =?us-ascii?Q?0SGACaqvMP9K6wgaV7Dlriu4bK7Vbv9FXpVH2WyXE7KMMY6Zt5iFFjzWqd+o?=
 =?us-ascii?Q?ycZCxJ17N9il4P/qZo96aZ/EWF8+6UqkmOF6uEP5M/nkU8MQq8NGULmQgs3P?=
 =?us-ascii?Q?S1nS7w+uFMSxyghHV0D3CwA05SqpC7ZT2Stq8zJVFowfoV+tMgGogNFnik5E?=
 =?us-ascii?Q?NlXr+Hep4mcOkyHc+2Rlic4oUIgVy1APkniyvn2KhuSteF5Fi9dCjkX7+Tx5?=
 =?us-ascii?Q?vD32qjAprA6u5QD670JKlRXIbMyRJ+qdxeqK1mBvtTkEHzCGU8mqO0B20Ds1?=
 =?us-ascii?Q?8qPPQyceQ1qvBkMas70aPCFTLA0ylR6GtxJMIBvItVzPpensqgnptVRJJrSl?=
 =?us-ascii?Q?GJeoPFov5soNWnf5/ojtkU2cRNHlzU01+J2KbNC19Jj0Vk9SkbSChlYX4WTZ?=
 =?us-ascii?Q?g3aHh9I7B3sLGJOoA7IwbHsIE9y6G8yaOHhv5LcSFGUY9EFJcd6RlBK7t8CP?=
 =?us-ascii?Q?VS36ykC9Jl9yI+EcARg93rfbjl/C+O3q+8tJt7c9x7xHNmGZ2GYJVwY8BnKF?=
 =?us-ascii?Q?KAxWD+FK/y988aOoWoBdtYhFJQwcZsF4Rauo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:11:54.4847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8a8e51-6a4f-4962-5f0c-08dd7d553974
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869
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

This patch adds support for queue priority levels and secure queue
creation flags in the user queue interface. The changes include:

1. Added priority level definitions in amdgpu_drm.h:
   - NORMAL_LOW, LOW, NORMAL_HIGH, HIGH (admin only)
   - Priority mask and shift values for flag handling
   - Secure queue flag for protected content access

2. Extended the amdgpu_ring_context struct to store queue priority

3. Modified amdgpu_user_queue_create() to:
   - Parse and pass through priority flags from context
   - Handle secure queue flag
   - Include flags in queue creation IOCTL calls

The priority levels allow workloads to specify different scheduling
priorities, with HIGH priority restricted to admin-only use. The secure
flag enables creation of queues that can access protected content.

This matches the corresponding libdrm changes in commit fdf384d4b546
("amdgpu: add priority and secure flags for user queues").

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
 lib/amdgpu/amd_ip_blocks.h    |  1 +
 lib/amdgpu/amd_user_queue.c   | 15 +++++++++++----
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 8191d0bd0..3f4813879 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -329,6 +329,16 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_CREATE	1
 #define AMDGPU_USERQ_OP_FREE	2
 
+/* queue priority levels */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_LOW 1
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_HIGH 2
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
+/* for queues that need access to protected content */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
+
 /*
  * This structure is a container to pass input configuration
  * info for all supported userqueue related operations.
@@ -355,7 +365,7 @@ struct drm_amdgpu_userq_in {
 	 * and doorbell_offset in the doorbell bo.
 	 */
 	__u32   doorbell_offset;
-	__u32 _pad;
+	__u32 flags;
 	/**
 	 * @queue_va: Virtual address of the GPU memory which holds the queue
 	 * object. The queue holds the workload packets.
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
index 0cdd0c4f9..b396d0307 100644
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
@@ -283,6 +283,13 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 
 	if (ctxt->secure)
 		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
+
+	if (ctxt->secure)
+		queue_flags |= AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
+
+	if (ctxt->priority)
+		queue_flags |= ctxt->priority & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
+
 	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
@@ -404,7 +411,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
@@ -413,7 +420,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
@@ -422,7 +429,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 					    ctxt->db_handle, DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
-					    mqd, &ctxt->queue_id);
+					    mqd, queue_flags, &ctxt->queue_id);
 		igt_assert_eq(r, 0);
 		break;
 
-- 
2.25.1

