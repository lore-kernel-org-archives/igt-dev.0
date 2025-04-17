Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723EEC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 08:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0988DE5;
	Thu, 17 Apr 2025 08:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dctXHsk9";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C500010E19D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 08:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1dq/xPTMKikIm4tvhZMXBu1sJVahE6oYrt3ypuMQm0TJctshkPX5Tdgw7T+i56eWBxl2sfXNS6edZwgUcgJDRktkFWcI8GMZW8ftah34qFU93C3DoNAeXIDEz27CNUxHOhXYNIFMAe4o275u98YsqDTNYOkM2ZND4X+/XbgWSrTbRxFqJTVryIrxGV1OQ1Rtro6j0LpoZA+dMt3RlUsMFR5nzntbL9qH/7WLbzGrYkuZBax6j3hbT/3qfXkayrq4U9+J5b5/GBOcUXQ3ArJJL9I720oTiRJDqPdgYQQy/3/7JQRvDXtqWjzIUJ5Ahf4V+e9BfJcPGdQkvwG15ktew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R028XxP/EgNtgjxrdOAFHApEUE3lLV7pnYnGJxCm3I=;
 b=snWO2EkRV4f9mb3SUd1JThEsOddDXepXseJfo3aossWxfViiy/1rAWlpldz91D/3dXo4EccVP9Xv1QpUWtH3snIBaOSm2K6yDeL3uTdDKAJfw6xZA5NULfpasNq8NeFNo0EG7jv+B9alZbLJRGROC3HXJV9kdT1oP6iEg+N2UNQXP6gUamk2FW2M1G2R+OpckI2zBe2mAyUm3kF1NvssRQyiqvtDuRsDWtGw0E335iQUOtPoJYPk6QgzkAVRFM6jCjHUuTjrtU75n3OwYc2S5EopHbKDdjwyQO0Ct5/Rn4HrBbQmq4Kz18narU1cM/OujFOtSvfnmxknRyjGWvMI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R028XxP/EgNtgjxrdOAFHApEUE3lLV7pnYnGJxCm3I=;
 b=dctXHsk9gmrkYjYVYEzdXtNf4GEFlfEEmw6BBM/XtVgjfAhVLAV3zgclPAb+Vm1RMjIyPeO0ro/rWWJX12/EZnGwC/lekrIwxZ6YaSUocDSzoGPNtPQdhZVHdxpyjCobF25NPHjKSdPGchVldEAMqOyhVOdHZh7vsYhAjpj3+AI=
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:52:55 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::14) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 08:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 08:52:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 03:52:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 03:52:54 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 17 Apr 2025 03:52:47 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, "Jesse .
 Zhang" <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and secure
 flags definitions
Date: Thu, 17 Apr 2025 16:52:46 +0800
Message-ID: <20250417085247.592557-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb169a0-d3ac-44d4-f5aa-08dd7d8d3ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mnBkr/KTscjjV0VUflnCNRVTNHyltsu0rCi4u2KnPRUC2zxU5L7TZLhjrc4a?=
 =?us-ascii?Q?8xVg1uPaBG4rjh4bwM0djufCYmR4+Sr3vXjTV/5DaQvSNpgVIh8D+UzFwn0h?=
 =?us-ascii?Q?PWcmsjHGYWDdIYzr47JdIKN+miQ18Hv4fNRHKANuQfXzjGY+/220GrMax8iy?=
 =?us-ascii?Q?DNQEj+s6bqku3QVV8NIKVQvhfL7H/1kn8lnM3JBtl/+uocQaUP3O5P2IJH5o?=
 =?us-ascii?Q?RW6jaz57+keQJ0uLYEnJTpnDMealAo2IACgURfutM1AeW9OoMPEKykcXbrQ6?=
 =?us-ascii?Q?FEk3p32A3NE3JS0/kN8VdOpWmzbBxMBSZUZUvb4pZA6xC1BWf5rpGR/bX9tK?=
 =?us-ascii?Q?mzSsh93ftML3llmTP01YYzFoE2dtN3UcTswzqHtEbcFMgRV9FgtbA3ejxtZA?=
 =?us-ascii?Q?HEglURfqsO64RVkLZMG/cMAflSGmUcsgcJxmqekWnEB5dShk8U1BkVJh7/jF?=
 =?us-ascii?Q?UUHZLGfVTrVYK2jtKk/2wFpDdlK+OuEK1YOBA8fp6y0ZzuIGftW0fDB3Z94A?=
 =?us-ascii?Q?InroGrcyZAqIK9yW1mWklBOyfEcoGcqTMFnNKjB7OXt5f6/tse0zYeLRKwDi?=
 =?us-ascii?Q?b/lt2OVxeKe30aSqbnTBnv+pBBuXj+p7YnUwsZEGexNOJyevm5Hco0FpkKvs?=
 =?us-ascii?Q?HYVncV7BTM53Kkd3PqIzsb4Pq383q+lIB8tHTKluZaK6FaKnXZ26tFhRdRHi?=
 =?us-ascii?Q?9muEfM+NeILu2CnEvdXoyXm4OVPq7URrRg5U5JeWHpYhIyRL+PLWGLmn3pAF?=
 =?us-ascii?Q?WjW9xTvRqWjL3JB3/7IYO2QF01/i8aRSISq1a4pZMu9QpzSdrmQmBP1mlDOB?=
 =?us-ascii?Q?jFfMgG5gyLfcv6vHCg+bNHd9+hxx4rdklToZ65zo7GpNsbfCmH252TMaA4Qr?=
 =?us-ascii?Q?46ynJmt8VbUjg3ggXQqoVP1R+KIXOBWu3wjDRGnReXhZ7MfI3dmc3etQfGTK?=
 =?us-ascii?Q?8pbn6zCs1z0eagQ/jlzKJye+mDv8koWeQap85eDy6pv2SPdC+vy0VF59fn4u?=
 =?us-ascii?Q?XFg+DB/stwDu/yXWGURmKUeEC6+9NamJW/bHkgt5RphYrbJZ9kBOZW00hgSz?=
 =?us-ascii?Q?HASjVyg4waJPxd+C9G4xYyj5fDEK85FBUIvTrqR3G90s0FoCP2O4fRq0zVry?=
 =?us-ascii?Q?X9QEt1CjbzIBPR7VYZKU38jOBL8OoYthg6DouR2/FqCZAqMUVcwo8X7gFDrv?=
 =?us-ascii?Q?BfaNS8uJt1MNYur/qzdl/dydzffyZG1IR0K6wLA+BusDc1xIxCaA8IQb5usj?=
 =?us-ascii?Q?jAQ5Cf1bQRZeuN1RS2UrFu9JFjH1RWF3Ybfj1Q4kT/F6gSgTI0w1su9++M4P?=
 =?us-ascii?Q?hfuvy+3oj/tvMic1zQ3F2A3YexkZn2vvMfkWEvoIkoaqhnTiJ3rO26ZTGhrv?=
 =?us-ascii?Q?9bqB9fboWeTYv++boejMT8ndhi/HlqyYi10yY6TeSgwJxEA9NxMMxpiE9LZs?=
 =?us-ascii?Q?zwFIEsuz70u7EbFCo4rmlESOeP0PV9BIowM6HoiOodNQ0yq4D2y+QMiGirV8?=
 =?us-ascii?Q?gkGWe3c4iQAlsWK1eQpcWB98dOvTziLfvw5C?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:52:55.2769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb169a0-d3ac-44d4-f5aa-08dd7d8d3ec1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
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

v2: In general, UAPI changes should be part of a different change and only uapi should be part of it (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
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

