Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193EAC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C151310E792;
	Wed, 26 Mar 2025 23:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sQfL8NeF";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B9E10E797
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6mbnMOGlFb+6kAvj/CJ57u52CwucOZGCKwJjyry3dAXzZLEKiTPnfXSiyLZ+SKIiq92uZZMlCHxpNMUmXFaq/Wiy8GaqKDEjo88uBVGPSJ6s3w3h6mnSKf4+6URr4P8mfBp4uV4qEx50SD01ZrcLii0kRCOyr2RueS2i4E70rB0mROSfge5MI4QKssLIKrUvyFwLLY36yHg4le0AW26mGn9fbKtvQAk3JHGYq6ez0pCqIAy9FFDcf5fptdlp15DcRLD+k9Zm2deu7VwfRWiu8jpXnL7sG1DnZnSDtyPQ9cMZAjRY7ghVh8J9Vh6r6w8Iw9X7/zRlSULTDRVCcDyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ0YOCnjW8PvPYvQaQewDt7z5ih5EOkUNsVuTMFKLSM=;
 b=pj9HvcsfarpBt/v/O7el5KT0Eaucr8RN+UA3H6TUNRpLc3SwtE8BiCmK08H0c7JpEP39p/fjYGrb/bupaVtrQ/cncB3ewhxnKb1YFdRKUrPcx3P9H6A/drMbMyzsfjtjIoNbOGdbxuyGFr359NXCy5zQi+s0OcHRTxzY0+pPIfpD+tbTi4hOGC1dPQeIXEuRRk0czTIC8c9iulkq9LdNEWfpXCs52l6hgM3gvz2I3sRn/18qSe2qJUmC4+M/gTE7B08Rq5lR/wnemu0TSRQBf+4zkWzy6ijWPBnDz9lRqtB/bvsHatQvXL4JVH9sRVPR2m7aiIEgoiDJDfQUdgcLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ0YOCnjW8PvPYvQaQewDt7z5ih5EOkUNsVuTMFKLSM=;
 b=sQfL8NeF7TDx22Okz3esBSXXdvlSCszDW/KZrh27Z7p4PIRxzA76MwP8fBAgtYYthtpfEIomLq0a1W6JAu7kZ5/jw/uwGht+s/VxYGpBAafRIddgj7nc9yXgTQrhPr0IC9bzxIWNUaKJcrVLjXC0WRNvMx2l2bIGpmxsR+pU0D8=
Received: from LV3P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::14)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:40:45 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::48) by LV3P220CA0014.outlook.office365.com
 (2603:10b6:408:234::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:40:44 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:40:43 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 06/37] drm-uapi: Add 3x4 CTM
Date: Wed, 26 Mar 2025 17:35:38 -0600
Message-ID: <20250326233609.2980110-7-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: caac9c9b-f30d-4218-5876-08dd6cbfa0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PnMQ112Oo8Fs2tXhxCVPKBTCapswIzMewdq7jRtMlEP/69PDuqVFADbw0770?=
 =?us-ascii?Q?87BrFSoFYaNgXsUihtRFXaz/PiHvBDBlg7htxdFqh+A1cLWuNgoB+VC5n7Zb?=
 =?us-ascii?Q?yadUGNCNIjWIjEUbPkkAs4ILUVdIRnaVw7YrBbyJ/br3/+WbYtdh8itkEP1l?=
 =?us-ascii?Q?zPXYkvagbFtKQFzrgiEESKxmPmtlH987JDWhjqdeS8wYz5CTwyr/NLYmzZ1O?=
 =?us-ascii?Q?aAX9r47Unu43ZlztGU7Wu9Rq++cjE5ocE2roWyZcR5PrF9BvUW5mzZltyYjJ?=
 =?us-ascii?Q?S1W46kWFgHN1HROS9gHE7YEuKUAj//0QHx7Z8OOtmAMraD7yb8avZ0L4iOJ7?=
 =?us-ascii?Q?OdC1Dlvg8ZUHM3b2M+HRjD0yw2EQ8C2ii41UOi7tsdldoQuBbAAPpcFuu5gS?=
 =?us-ascii?Q?TcTmpbcvmCVAD8wSSq753cS1BQfY+WESQRq3vgU7FVXM3kjagcUiXeOyWcta?=
 =?us-ascii?Q?EU7hXHu9FmLNj7IyHCplVSvFwVUtH2X7kvkiqKaP8k+8CjVPqHdqJ1NW5f0Y?=
 =?us-ascii?Q?Rtbj7U6yRH1FpYjedeAwlutJ3KVn6pejcF9GrWvStEJB+gBZA5zXSZogZ4ho?=
 =?us-ascii?Q?wTqvH5Fbw/rnP/saYyPqmaRgXSY/bQXpf1NMge2yv519dcW452ku3v+qoGuB?=
 =?us-ascii?Q?FP8MZOi1NsRGgD2PVWiCL72j6/3IyQKtf4sJtOpO+AOHB/pNncQJ5NVsRgde?=
 =?us-ascii?Q?NqvguA2pbP4e0UXXz6JO9ZhI/sYFYp6wjzGOq7mKD0ZQ1tG+RP5i/0flPuhr?=
 =?us-ascii?Q?HumEsYtpz1CbEj7mAC2kHVl1BXcA085ZGeCQngd+SNDtZAFPsG8tATnAMrS6?=
 =?us-ascii?Q?0yGNlIzrogRPIMvwIzlzWGnfOP4ImFFChJKGCbwTF+wXOxEmztCVslFzZOLs?=
 =?us-ascii?Q?AEzq0ajEvZYSSAVh9SlHT7bIPGSSdUeKgEp32IYk/ZySlAhmtu07O9yTPrAw?=
 =?us-ascii?Q?NW5HIa5b+xRVQIKPiaNeHYmolL8WqWGFoJmOPwcVUDstMQ4qQhdUpP+gV0cb?=
 =?us-ascii?Q?AoaMztexuuLF47wQiud/XbiFFJYzF3s2O5+w1t7keF/2kTNE4pPhSJQWcg6W?=
 =?us-ascii?Q?PqGZcivUmdtkLcVFvI8pOPx+GDuNdEZgb9QZhsLt8Wj7FqEV45dUlUfh0lwR?=
 =?us-ascii?Q?Qamw/F09F7rWRN7Irq5Pj9hEpFhoktvIu6bSnrG6ectqZZCWMDxA4LqUBne2?=
 =?us-ascii?Q?XlvKjN9cdJ3MPth/To6el54cNcYPm14Cso2t3fcll09dDSGH2HBblDU8natT?=
 =?us-ascii?Q?04m6q+pTgfW8dfBG1gMDc96BAgsR8d/LQWViGuNiOLCCiqWUXLG80E0rtgVt?=
 =?us-ascii?Q?WwUTIkTRMov3PSeUUJyYgzWGwHinlE4PiGp8YgdcHg6advEx6bJKIkTi2Xs0?=
 =?us-ascii?Q?iwOrVirNgSH87pAAOzqiSJmE92vN6LauIjbUVmia2YEYFjn0clFAM9nn4FAZ?=
 =?us-ascii?Q?tuSVEc7B/Q5Mb/FR9TrNlm+Mb7ilVa+s33+oyqlq7jWNpQuIob6Xb8VNM2S/?=
 =?us-ascii?Q?3Zlgtr9WuFVsQs3ziz90dhzlPq48yU+ZULNY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:40:44.6605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caac9c9b-f30d-4218-5876-08dd6cbfa0b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489
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
index efe5de6ce..e44362e74 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1283,15 +1283,6 @@ struct drm_amdgpu_info_gpuvm_fault {
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

