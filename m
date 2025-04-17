Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2AC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 08:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74A10E19D;
	Thu, 17 Apr 2025 08:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XU7c3UIr";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA2710EA63
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 08:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvRkM7PgKbGcIKvL8GjEwkbvtL2jwaQSgtcda84cxNQWFfEE1MY2fXhI9wtlnFeLovaZDdwaqyXnYliaOXMonVYy3oghqudK73tY3AgvJ1+xX0fpHdAuhiUDGOvoRqEyWed6Djks9KvaMyG+sYDvVDiK94GX+SoTbtpzMTxVp3hwb4+ammJa6HPIVYIX2tKcWRsd+jPf5KLOj/HXw+R3L60kaMWpvgUnhc/ItvS8TAkqIySxjSkccbrr/xNXUfjWC3qOmeF1RBog6qbRGyBnW11kv4g1hbKEyxYExn0SgtCv3kXEKB0htJU1K0P/uZ2GESu8EOKcDwMtKrZxTscPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZG8YSadZ0a0UiI2mbpZrDf8lIryyDaN50viX6aHLFU=;
 b=l43XT7TCcZUma327biksKgY7L7f+nM3rsZfiN6C4PdYDIu9rAJU1UHhWhguSF2yyYZUJ23xVAJWybFO8YyGFPiLyV4JyHDSIRNYB2GQLobCDI3iur/2KisK4DwBKWVizDKwAO8YkEBVP7ZJqokK95tJMZCF2iQUyN7JtCsZk19az6TklH0xLOkeJNXi+BX9dhKlfIfkGsd/m45U17tOf04tkrjHFQz0MyAFprhSqhHegg0VpswAoHiNdg5A1hgCHmcNQqZNqoRPy5h44r/pAOpE3iWnjnKnIIQ7Uc2LghXxd1v9iEZ4fHUZ8mHl3Pr3qop+oIBBhF4P7KZnFEjHKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZG8YSadZ0a0UiI2mbpZrDf8lIryyDaN50viX6aHLFU=;
 b=XU7c3UIr7TMFE0FCE65MbPUfEwOzvDLh4R8Pz4YXAUG66PraVt+fb/LzRqJj1CAuSzjL3DEZ5vJxB01O31PSnTReSe2HC4koYTLSjiMy0hoFBZCEtv+L5h6vwnpNC+HUAJJm9tTJ1F01kD9FK6Eh3MJyvCi1uAOZQpESxmGE4/8=
Received: from DM6PR18CA0016.namprd18.prod.outlook.com (2603:10b6:5:15b::29)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Thu, 17 Apr 2025 08:53:03 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::12) by DM6PR18CA0016.outlook.office365.com
 (2603:10b6:5:15b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 08:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 08:53:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 03:53:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 03:53:01 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 17 Apr 2025 03:52:55 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, "Jesse .
 Zhang" <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure flags
 for user queues
Date: Thu, 17 Apr 2025 16:52:47 +0800
Message-ID: <20250417085247.592557-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417085247.592557-1-jesse.zhang@amd.com>
References: <20250417085247.592557-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: a6468152-08ce-4942-4fd2-08dd7d8d4366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MV0gWGb7fM/qOVJtVeXUBnGVrdoIC9y9RF6uwNqPs1zWsY+D5YWA1iGaYRDx?=
 =?us-ascii?Q?X7f6Ffc5vti+8L0p7K1byzMfqjtQUUIUNXTA2mIahuAMbN8keC/Slh+hL7vd?=
 =?us-ascii?Q?grRkh981U3Ds3CzvLGXCHmsIVtrtTavkVIStJDbnJ868hS7sSXDAfNa8Bxj6?=
 =?us-ascii?Q?kawPdbJM0Mo/f7xuFGkXfb8e6d4azGjDOaZwRCFqhbAHADFOu93OLjiT3Lrl?=
 =?us-ascii?Q?vo9HsG5v5+w7GQI+ihhWbPMldFt7UhCAmgYz8lyjAvQdbDLRp62LDagzu9aL?=
 =?us-ascii?Q?5iECIqz7WNlHipVcJKaW6wqyK4fQoko52wC83mL8yXljeRfi3DperCJc8mjQ?=
 =?us-ascii?Q?kQBinUI5RRBG1elAfcIWlzZa1EMRfTue1ED17EqETNuO3Iy6SMn2taDPaiYV?=
 =?us-ascii?Q?DPNIxiQC0eavO2URb+/l3avd4f4JfnxDmUEmY3vcVVVilWysTmqyQnsrr+/V?=
 =?us-ascii?Q?fw4PnUwoEUdHYi1r09g3QKyN698VxZlWC6u/+8M0asS6/lqfV+J7xN8h6upL?=
 =?us-ascii?Q?vL024dmQ8gHtIXnK3SZEguZIYi2pujNuj+IHrEYW1GoOhYUVnLHiW2ni15V3?=
 =?us-ascii?Q?bKf9WgAVREqbFR4SaRr9Je28ldpkzoFdqY7pZ7wGZJQQHXKh4YLYkOruQbuC?=
 =?us-ascii?Q?G4ZIQVUkzIeXFZX/Jb2buV8lvcAnfHfPcQQgrMS0pnT2iAPLCtddhBFyIIwl?=
 =?us-ascii?Q?AcL7YCz9jla1jdooO7cklZW5rqUGNSX2G+pWUkYUvDFUyW2TjIYxlogEATcw?=
 =?us-ascii?Q?B+fYqkbpl/Oizf4EqxXUVs/Q5i7eUbh9ltJLVPieUCWNqzagvU7foZ4Ur2/M?=
 =?us-ascii?Q?INgpCUdGFpAvFEF82nAttKT0r8neS3GEebYDkJFmZd2RUfLO2u3PwWPxHrRE?=
 =?us-ascii?Q?HdyI4pCcsikb+a/k3dZAqL+gvuwe+94nZT+HQfZcuQAg+2jHC/3M3LpvMwDg?=
 =?us-ascii?Q?c3Lm0ImxcZIZ9U4aETZ+TYBPAo55gEekBbLbfLbzxpdyfby5MGfnoeJyl03v?=
 =?us-ascii?Q?HX8uZEyCoxm7QqGIuVG23Ze+pz1gI2pdU1aLlaMN+Sm2uAftSERZdyU1nPQX?=
 =?us-ascii?Q?LR6HXTNJUJOgvNT0ytdRdeXjEeidYMa2VxBG38qYF3676cJEE0cQk6KsldAo?=
 =?us-ascii?Q?KHsuZcUfZc7F6xhmY5oWHFP+QsFNTKMYaS5px9bSfMFlff1b+jxAhBdmSpYw?=
 =?us-ascii?Q?FZPQAfeJOdVbMuPGkNalTkgZIE1SRx7mq74WBFLMS0jsu04Zj+OlMo9zg2ic?=
 =?us-ascii?Q?uJjwxMaRfZbJ6u+fc8NDDhBz/D5w6Fp+Y6N9WN7OTKNAf/CVt7ArGxxJPmAg?=
 =?us-ascii?Q?77111e7Uivq5FqMQ+mmAs7XKfKdjt37BhaJJ/kYw6pG+SuqhwSRLGFpLXd1k?=
 =?us-ascii?Q?arCGbXMRiTPsM2zo3l/iL5hM4dLWMRRo+IXu4LVeesnKLx/sULJx/8gdWaRU?=
 =?us-ascii?Q?uh9JOdX4caPkYmLbHCOM8QHKrfw/vjiko+vzv59EYFzA5Np+qI+ffbIvYeEk?=
 =?us-ascii?Q?MXmfepIS+rh5ttbw2vWBuItWVLX29KV7Dfw+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:53:02.9555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6468152-08ce-4942-4fd2-08dd7d8d4366
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
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

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h  |  1 +
 lib/amdgpu/amd_user_queue.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

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

