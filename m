Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B3C36010
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26B510E793;
	Wed, 26 Mar 2025 23:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GBXkg8jZ";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3D710E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5Hv0oxZScNL8R1l9ZNu5DgPoVwt3xbPWU/wBILJD2M71FS/jf25QcFXQvaJ6Tm1hNNDEcjgJxzVzbHWyYVuE3kZBBAryC4FLWa//ntPFZ66lZtqGgF4DoTu0irnEAYyWoHliXwKRgeI2G/LsBkQGqGzH9Pq6tq7jQFcpcwGFSN3Kc/Miui0d6LrKo9PECIR3elbFlTeP3Ey0D91aWSJZFuzn6gJnD1qqmrKKxG57muP+thu81tx9lbbCXofx/LBThfTef7djBTQFqMn3jOFDVEkzY8wkclWGG3uP0kBCFWO0zpgjjm2Vhgvp0ZYk/j+dYjNlyHQxv6tPeWwNmp0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBjfunds1d4Hpt9EbOxvfu6izvVAfqFWRLzw5JYox6g=;
 b=B9EDKCCG6v0fdlyUmHXHIvB2cX98DltQL03X/ZE8YqPpYMsl4qPUErySyqJw/HFhSPUoroAOgFNGsqw/iDShUFpb8ZOmSZU+oQa5RYfMokRhRhqkTFD3h9GoX5O9/MI91XyrwBsb42bruhsZfCI7m4f2/4i8187IYfd+pGm4YZtmnvOjzkkxFo4nM27TlnnXo2TSwADrRL2MYFXE13hAsWWyQxQ0Qwr0kxMsndlLsASAelQhrlWyu8VShL44mP9oT7w9Vob6+15KdA60Dx7fKqM2ikKqQA6ZUsZ6JX+Z6c4KjYcf/EhohmZb/OvBqvhjZAKJcHzgmdCvBqHizZDsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBjfunds1d4Hpt9EbOxvfu6izvVAfqFWRLzw5JYox6g=;
 b=GBXkg8jZO4IRmYKVFCWVcr7e+RCfgegkDD8RBc73eRMg6680l2lLjdrl8Y+QPHj/SYGLuUrR9ibnL62QoJlT+Q1ZYSKkzVF0gf/T9A156v4nrJyDpChQrM7UlSetYzlmX9wEZd017AyPH0oaBwBUAhnPS5fjIf+Ga1RuSjzEDqs=
Received: from CH0PR04CA0017.namprd04.prod.outlook.com (2603:10b6:610:76::22)
 by BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:46:57 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::67) by CH0PR04CA0017.outlook.office365.com
 (2603:10b6:610:76::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:46:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:46:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 37/37] drm-uapi: Sync up definition with kernel colorop
 implementation
Date: Wed, 26 Mar 2025 17:36:09 -0600
Message-ID: <20250326233609.2980110-38-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c76890-8720-46f3-a09a-08dd6cc07eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GYbhBY773rkCc/onSx/xWPd3beN54c4RzL9SHzILB6PXZHZ23kLhDuuOSkkW?=
 =?us-ascii?Q?gGJ2KcYcW3m5Ihpm2A14Cn41V6l484FeEQj1fIGtoqdLaavGZhZ75SXFv8sK?=
 =?us-ascii?Q?7t20/Ehr+BIzJzeR4EECg0LuSRSYE1gpmeHUtdbLf0GEQaSvqutN6+yyOch3?=
 =?us-ascii?Q?XpDLLxc+xJ4EDCNektFITfc7GenCcVCzbZTCvJy7PNachcqFKcnbOf1KGHuy?=
 =?us-ascii?Q?w8f4V3WeKbslWJmK/jWrXoOQjOF0Fi8wBS0IzM/yktiHQi/igBZdjFhlaXbs?=
 =?us-ascii?Q?Jsi3nheZwutXCujqm+D49Gy3wFIG3zQo/5xaXnIT6HLIKeAV5usvLucjB+hY?=
 =?us-ascii?Q?bLg7Yk2Bp4rBvBZS8Hlf3DL06ZqfYZXlhKW0tVMCKbED5GLRcAEvRyKt6Y3u?=
 =?us-ascii?Q?0XhOSF8Kd//Ah3nZ2/eu0dJ/70ZQsL5EGLvXSJ52OTIYYEOlfiAwXpxCA3Zi?=
 =?us-ascii?Q?DGOU/uhwfDHkWvL39lv/ZX+rxc/Z2uNHAUygQYqRi97nt3IBTZpEciYhSbv1?=
 =?us-ascii?Q?b3RkDZUb5ZooByeI0dIT2BAaGeZ057zxopOuiB+9xgsiiT8Pf3WASYHROQ9W?=
 =?us-ascii?Q?EmDEIDoezXl6g1zKva+X4u6tNZyzOfoojiNXlFI0DhW3rPQ/K3jqJmBdbGMt?=
 =?us-ascii?Q?hDvCqCSZIKSII6yxjbcX3zuvSj2c0YUQ9LA5ATN+PtXlAvz14cdQKYcYbZUb?=
 =?us-ascii?Q?6xZLoi9v15BuDJJVFHyGONO6bN4KWqW8VoYOB9L7ZK6ifVhSX0IZneKU/rZL?=
 =?us-ascii?Q?Lq3Au4UY8tGnKXa/mTYtCJbTEZVo8H9N9N1vTBvXS5gMbT/JflAYE8e6xCYC?=
 =?us-ascii?Q?0RZlpBv6qpKd8/SFZLE3IASnA2zl1+UoiZO9gIDoQi00+fe/was4qyzHWBQB?=
 =?us-ascii?Q?pyd1zDg1JUTRuz0gBH1m3R+yaOiVMZF4q4k9XGpZBpHap5rY2ZQnqSQ9akJf?=
 =?us-ascii?Q?Y6EY1wjC20eBAbLM5PkdDeaHtHVpofBQZnCk31X1ho8tPZT+m028C5GcsdkV?=
 =?us-ascii?Q?tQ361h9YeoPRoRPQpvv2/muLrRdwCxYPsgISGXoeIzWGraui8IBAHqcYNy5D?=
 =?us-ascii?Q?kiGbSBdZ4HibhN57WMDZbu2yaQjCs28XWy6L5AWqwa5QZ8FoJnQKseElU3i4?=
 =?us-ascii?Q?HlS4NuvdOpsOEQplIeToA3sPRzDiFpnxe0f/4JOE+cd2M0BKC62Qh+xwdzev?=
 =?us-ascii?Q?yECGjwWFbC7rn7QchOJ+eogMgCfivL/A+k5DlId+W2pN5pYhJMIpVysQTwub?=
 =?us-ascii?Q?AGxeTSirdFqt9OKtm09ma72xCs0hGoRxkfJOZd4PNN1tS4a90qJrLA67clRZ?=
 =?us-ascii?Q?eMtIX/fO3Z9m4tXyI9fbPDxDK/RulnNc9q6Cbh0U/6bsBEgzdzSrrm3SJBg9?=
 =?us-ascii?Q?aKNAFzNUIluIcXyOcxqepYvbdmzDzBMEnPqGpV/NUmuK5oDb3wrml3se8IpQ?=
 =?us-ascii?Q?/vRkx31OAmwSHIfYHMIyQK8qbLl0pD6qjBGdhzkX/1c9BioJR44koupv4gkg?=
 =?us-ascii?Q?YZQX0+xWurfmpiY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:46:57.4872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c76890-8720-46f3-a09a-08dd6cc07eed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705
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

Add drm_colorop_lut1d_interpolation_type to IGT.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 9e34d43db..f749eebf8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -956,6 +956,19 @@ struct drm_plane_size_hint {
 	__u16 height;
 };
 
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.43.0

