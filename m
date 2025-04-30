Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020A7C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA2210E24D;
	Wed, 30 Apr 2025 01:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gajquCWI";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A6B10E24D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK48Ipo4NSPno3Q+ZEpFo1t8YqMR6q35pjdyGNS+7X7HxNg1JPskupWV3eJcb+Ytx1PbvBAQjFZX0o0C7us+vUOxyliFDmTjEDFvhH3aNh9yEkpoVURghuZ6+CroyFHoB3Et5eILVnjukwvvlB6qRtVz4Y1nTIbeKQ/gQThw5GrbB/fWUFS+WkaVx3wzrDFuLCa5NWiC0tm5suTDwvc9umTMTjAaoIHh7yarw2ekYQGcZD/aN9SnvNyMAnysfHOxBkodERRzrYXi/uARro79g0P8U2tJ9Pe59RRg9SOYPIf1XG0aj7uyZk2ViyQos05hTMeIfQbzNTBt+KDU0Rbwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF5VkuFQM5AqJ9O3U80IpDPlO6AXYobvfHDoXefkxU8=;
 b=Tnra/EbmoRjVwfh3LIwjDcrNe40ehYKTXEGM9Bf1Nb4hoPemeMdvPG+rqZ+EvknKjwjRcyKvD5Lt9a+USESRFnuu7qks7DT+zlcX2rYABaGmnrIitwlRZgkdxZd3r+MMtxZfWcbrIewM1/k38QGUk+fc311iymKSxKE9p65JRjflcRqnGSNQH9LP11se+hrnlkMrugZfbRajfk7mDrODaO63s56AHl1+RnOcxhOhwNTyi8d/Xmb5qrEmooxReWdH9bVLNNfh7pzLRxQ6mhk4HJV1iQ3glRnScmBAvAmcn/j9DDGpbm42xhYXR44+NQcOO2Ybpyc2nvbqaFF77Go1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF5VkuFQM5AqJ9O3U80IpDPlO6AXYobvfHDoXefkxU8=;
 b=gajquCWIMHcKvZG76gtVEbAaVQopUUZDxg6cXHjLfW03vgSfRsnWOlPxerjDH7LLnnnDoUk3OM3MstE/zqVzKO0yvskpLlotGhtS37Z8Z+F7paEGQ3K/p+5GeAdb6/7u51eemBYLDHBOd6Q5zZNsfFCKIbIocUgrnAgCpDw0wX0=
Received: from BY5PR17CA0011.namprd17.prod.outlook.com (2603:10b6:a03:1b8::24)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:36:36 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::74) by BY5PR17CA0011.outlook.office365.com
 (2603:10b6:a03:1b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 01:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:36:36 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:36:34 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 06/36] drm-uapi: Add 3x4 CTM
Date: Tue, 29 Apr 2025 19:34:24 -0600
Message-ID: <20250430013454.226910-7-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c525c1-e61c-412b-7106-08dd87877232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2JDhTirTv5jPO2HAzQXXGbP5G5rVMPkU3wVk53EqSSNGkYjstGSdKAEzMa8v?=
 =?us-ascii?Q?7yg1SjkGmKuIef0bneuAy9PFFA6oF+jyQuSNqS5eZPbRJAIDPZ1R8vZxWvfd?=
 =?us-ascii?Q?gcCEgIucJ2q2cwXibO3vlkyVVi18ngdW9P4zecaPVts8fws+Q+WvNUtUiDrZ?=
 =?us-ascii?Q?5ZthZ0DFnEg49NASwACboWGoTuV+Vsqn3DSeRxqNDMZi9NyXSKURVt0zEces?=
 =?us-ascii?Q?b/72g1HdaEgR2TnWTL+7XbQvIGSTG+SIhuaUh0KqOv0pcJWlWeW1r1rxVYG1?=
 =?us-ascii?Q?ox2xTgxMfVCm8RWqqMf774D5AnvdVJ3bRuDz5wAai70kU7XWOFT4uCveVvZ4?=
 =?us-ascii?Q?pq0JHsXfC+ZZNjQB44uAOmxNfQVRXde+LCFON9R5ICzlLQcVrUn+v9kj7pdD?=
 =?us-ascii?Q?YMpjgs7BvPiM0dJdqScMksY7q1VFxsS4cRis8gY9CWCG5s0eT8Gn/cMZXz0l?=
 =?us-ascii?Q?X8L190VVfR4hDPlv9jOiDsSYOx2VPFrFzcMDb6sPI+tAohzzHYgz83cFytnR?=
 =?us-ascii?Q?iK0qRV+VOQP7CFgnqxHTTaavsAv3jjAutjT/ixuJq1jtyAqE5ONx7fEOJkC1?=
 =?us-ascii?Q?CbPtD8XUG32pqpkP0eISTayOFLQN0APW9MZklr3dI2X4zOyADdQkxxkbhGBi?=
 =?us-ascii?Q?+3B6BWX5vluPKFr95iQZc53Zjn1zCOZnwQcdC8BhoudEOOgM5pC3q6/EGRie?=
 =?us-ascii?Q?3xaXVK8V3xzqHsDnN9tID1qmT2R/ZrT0Ihq2Jfs1hp7pXlce+TSCjabnWET9?=
 =?us-ascii?Q?k1ue1/Ff1FGRGSGQe8iYfgGO52fzbxo0ZBas6YTD5c6flwgnmicNwaxIzCe3?=
 =?us-ascii?Q?Vxp0vXSxQhVgGankQtUAXfjHEysLT89rI1vnqdiJi0ZCrlKfiaKBfeSUiD6g?=
 =?us-ascii?Q?cNr3YcyPpA6IWIYNauI1t8XqQgCYPC9JlgALul3G1XMJuUgYJuvdOPijKDnR?=
 =?us-ascii?Q?CuUrrFa9MwTT5JRJ5UAFO4+eVSxKJGK3uKYaP0iPpJcMlVmU1DHHbULunGtb?=
 =?us-ascii?Q?EHB2Ag8Zb18kBxNEX+vSxMq2kxDTmDD+1umJzW60WS9nF+yunAjz/Igm+9d1?=
 =?us-ascii?Q?X7Yz6jSwxfgqeK4rzH5gwL4iHyb2c0KPgU7eW49mEfXkP+N1rn8Zsz142Us+?=
 =?us-ascii?Q?WwOZSk0MllO+njEsuiZWjh+MiX7/9/ImTHjUeeJv0GPszbKA4fAMg3i8Od8D?=
 =?us-ascii?Q?esSTe+p4lEeTMrz9UQ3rYV+ds+BbOvgVmrsFcHTQzXCCWFLKwNdqat+cFSDu?=
 =?us-ascii?Q?Z2khdvaOf1Vuluy598AfTOHpChOjUqKLwrh4f0mv88aUVrX+8ZRRrQr5kfAZ?=
 =?us-ascii?Q?6xMTwXCQpB2/lmnlKWXW+Vv3gsS9hAZK6wl/t/+ciYB5TGq060bZ//KkJ7fz?=
 =?us-ascii?Q?D5Liq5CV2Zlm2z1vMqsLhxj5ngg/VmyqQrEE8eNW6qIF5IUa/0L7DuTDJSRU?=
 =?us-ascii?Q?L1014u84cZ+TN8rKeJpZBBzJMPR1QFQYtEocDPAENk8r+dwtjvksTzJslvKO?=
 =?us-ascii?Q?bpwkK4THUQhFTrYESRjhDZiQmj+zUIt+N6hB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:36:36.1307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c525c1-e61c-412b-7106-08dd87877232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  9 ---------
 include/drm-uapi/drm_mode.h   | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 3f4813879..be26cf77f 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1586,15 +1586,6 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index b31852a94..c5debc1e2 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -847,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -859,7 +875,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.43.0

