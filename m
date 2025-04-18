Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12122C369CF
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 02:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194210E3FB;
	Fri, 18 Apr 2025 02:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sY6NNLJq";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682510E3EC
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 02:29:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mspA+IzVj+vr/4m/9A2Zr4ryzyZYH03+Xd0PcLTNs+SSm5tg/ApWrHrcyGspK/vWmfztIBzx+XcbcUSvYWx7Sz1R+ZYKr6YwVP97lWPA6BumW42KezAtvLhHz5N3kCsQgkY12mCg69wNSIqENOouGc+SI3VbGcMqFtAH5tp5IjyaeBijzY68DZN60YorrR9XKnuq5D5jHbkqONVTYbvlRVfhRlrl0Y8CnBoB0QkhM6/LsYrV2hzBv+SbyYeoYela/YJKP0rmIneaUgoD+jOPuclUj+PfY/BajZMVn5qqWtUeygQQd5h+IYxH1at4TfeDjTnNBXpOlxI2AR+ctUZgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfx5r/ZUUkvWuEm37+1mNFU9s567CMow3DRDmFEpl6w=;
 b=vgud8NYNniysEnysGhkACElaw9GlFKq2fOOY7rQVF1MEEjqj0Pvlmq1/IBBVvJKt/CNjUR5Axsrux/wHAUBZhJb9t+uhQSdYjPbDzgt+4+T3DnHK7q/Pq+2KouDivcs5NLzViuh3cTPzwg320Fzwe0O0ayYO/OhDhErsKpvAoetS7R0lbvNqQ3wcO2rbOveMsl0M/4laGWc5GyoUXpdUK3DK+E9o0RYFAyPREojNiKDwMzvgyudOYAWVVLhXsZbuiZq/A6RSmPDc1FxF4vpz2aQEkFSL/Mt40JcV4zowwjTfwqxbecELYp3p/mJqcEXBoGTsbZuq2IpDf8wLa6Y3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfx5r/ZUUkvWuEm37+1mNFU9s567CMow3DRDmFEpl6w=;
 b=sY6NNLJqJ7Ufkk6N2I2Xf/jEJNPKiww+/8IdjzDJqSYVXO5KsXnVDpcjUkX3+fKdHG091ZTRsO6CzNjVRwr5UErt0sVFhxF9/ycS1froXkPJ3pxKvKm55Jl5aMhhSxmXMPJtlRs/OiHahavB3XJQg4+xfE4cJBj6uRI2n1Fy/k0=
Received: from BL1PR13CA0401.namprd13.prod.outlook.com (2603:10b6:208:2c2::16)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 18 Apr
 2025 02:29:33 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c2:cafe::32) by BL1PR13CA0401.outlook.office365.com
 (2603:10b6:208:2c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Fri,
 18 Apr 2025 02:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 02:29:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 21:29:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 21:29:31 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 17 Apr 2025 21:29:24 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, "Jesse . Zhang" <Jesse.zhang@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>
Subject: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and secure
 flags definitions
Date: Fri, 18 Apr 2025 10:29:17 +0800
Message-ID: <20250418022918.623643-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 546e9465-4c25-450c-0597-08dd7e20da4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nxdH/V7oL2UwdBviK8Ggk6HTU9h8Mw2RGGCO7qRDrAdQEokD7q9VypxZORoQ?=
 =?us-ascii?Q?gNNEU6wqgIcAdXxC8nRnidWEikZ4qbQTf4wzvmergJYyA+bCqqIaeoB3kfzv?=
 =?us-ascii?Q?WS61eyAG69/KbkxTa3OqH6i6RlwVTQiXl9GduAj3h4kzIxcxLc2bLfJfPZ/s?=
 =?us-ascii?Q?iFBc+3winCI7h8Zmw809pFbIHql0yTDQaI8uCfe2sHv+ABuCkqQ+8xDqZitP?=
 =?us-ascii?Q?01I8y+oE0vfyTTuNCT5PAC09CIZIhzy/3GtsFurer0S+lieYjZ0XhUvBgYTt?=
 =?us-ascii?Q?7QqVJMzTqSmapiZRBj7SoZ+hHLM/NvKKeA/aobCYiOXT2njb1guO0jAV1YiU?=
 =?us-ascii?Q?ThXczl+Kpfz+zWrzE2EkCHNeVrJKR6iLaCDQr0RPGuVG3fAyFwsd5Kqjzd2z?=
 =?us-ascii?Q?s7C5gkykqN/fX6bjk8L8OPKB+Ds/GCAhE83cqktl+gH9enMAx8GBVReQ16YM?=
 =?us-ascii?Q?AQJIwG/KQPuOsLBv6kqdBlsq5sOc3KfxnTSUCcpJkEdDevpqNWNykRXX8OlW?=
 =?us-ascii?Q?VCNk06LU9wf8ULIq9/t0m6GRfnUjzgbMifqld47SFhQejU/dkyKmkT8Co5xJ?=
 =?us-ascii?Q?XQ08aWLpJFyXr4cma4bLMv5um8CY3hKjgL6loXO+9g2ukUppP547pz4U6fS+?=
 =?us-ascii?Q?pKn2HeeFBkQr9HBrvLARLGlPLNtg8hMGrV8kEc9EezXIAiP2tR+u4WciW3Qx?=
 =?us-ascii?Q?zAyOU4JbvA595ErjBN8pfUyeeuYF2+n3zZiMGQXpdAJlB0hypncExUFwtA+r?=
 =?us-ascii?Q?/JHD0PQaqIjh5TLHhaDfBk+tml3kTLQkCshn+VK0rIy0HCWtHFB9/lZvOjfh?=
 =?us-ascii?Q?+QGX5lc6ch4Lq6Hl89I2TGDIPRvtSgm8aT0SUO4RuPOIHICEum/p7jOoSjFn?=
 =?us-ascii?Q?Sqgg/QqZ3/+97rkOBrSRhse2eLWchXZGox6Fqj3eIeAahzedykNbmy7aBJit?=
 =?us-ascii?Q?jese8rX4W4hfBHYx2sVp/dbJpIZEvQTeROW7euBlLOZ4LAD6PDoGS13Z6tP+?=
 =?us-ascii?Q?aNBu+MAkkpTl3mfFGXzonsI6kxMUL7krkR644JtR2gD10Ux5o5v6J4eW8MBw?=
 =?us-ascii?Q?iQE56MKlofLywdeR2jR6u9LPkkDKvv2GJzAhRN2KzhUeJFiuVSK75NdWFM1R?=
 =?us-ascii?Q?aQTRN72OIv5twoJ1/NaTpNlAPZORMNsTy00lvaDy1kKfiftUwVJ1/Fbj5mj5?=
 =?us-ascii?Q?O3aq68Eaev/fXkxLR/0xfW4wZEOnCVfDNrkGkYAJvDVcNRQNltW4bClj7/ux?=
 =?us-ascii?Q?higvG+JVpLdlFHx/D5C3kIkHSD4v5yHmu9DqFYCfvJlFLuMm4uFrv+pWNFKF?=
 =?us-ascii?Q?QxWhJdDfqC33Pmnr0Jcgn5WXvvHP5YSXBz+UVNGY9AtD213hlKOe88I7VLbv?=
 =?us-ascii?Q?4tri9GKQp1O6w86LL4y98a6S9OtbUt1zPNMsODZGQNfDgkAE8Xg+BpVESc+m?=
 =?us-ascii?Q?YwW9xPwhfCDa7H7hy7UeIumlDdVvogX/STjt+ZeZpqRWb/CPpDFR6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 02:29:32.2831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546e9465-4c25-450c-0597-08dd7e20da4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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

Add UAPI definitions for queue priority levels (NORMAL_LOW, LOW, etc.)
and secure queue flag in amdgpu_drm.h. This matches the libdrm changes
in commit fdf384d4b546 ("amdgpu: add priority and secure flags for user queues").
https://gitlab.freedesktop.org/mesa/drm/-/commit/fdf384d4b546850bc4c200541c42d29a62b2eca7

Related driver patches provided by Alex:
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122782.html
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122780.html
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122786.html

v2: In general, UAPI changes should be part of a different change and only uapi should be part of it (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

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
-- 
2.25.1

