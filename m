Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB0C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2953E10E489;
	Mon, 19 Aug 2024 20:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nexMSRL5";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5E810E482
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elvih00URqBFDe+RJaXGw+40KBFCmlt67iHpy8fUFnTEZ1UUOAKDzt2K3RTrlrmceFWSP99UIUnPLerO3h4ibjE9BB+iWhd6CYFfRmLEu+zMzSn4140sQQRTEP5BPJjc45dqHyzkZq+gANBm7hRDftcJ1/tc/m5V+Jqrh06XmvgstdpSnbQ6X2Qudpnzk+1WTJF4KEJby7F/hF1tF03tDbl0TE/vOV8xhBARyihy4rvQJr9yRfvH4dEM/vH7zYuz8tPCzI077RQrD1wWA8QgOVMJ1W/yAjd2JjH0Y2UG1aW4OLfMVSUHZxdjqLO38E1Gwn2HoFwXgDK/uk/FbVELiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc1DuSQqRTahXlix5B0ahSy5J5BtvAK/BogIKS0J3Yo=;
 b=OrVDi2lWt3xZL0NpSsBUoMmdVjQO6EbpQkrKLD0PBEWq+B7g1zyvzgd/V1E6k1321ehfvYdN/4qz3CCTTowGcoJs/gIj/VIVvlh7gfJ8pQJCjILsXejiubdwc2OqOY6Z6nATrC7xfWVBG8mXeWH91k7jCiecn62g1opxLs59cN955/ZS90dHzPfvkQAnFmfh6CeTYqbFx7BMgF+AZQBDFf9GsmRwI3ICPXdhk+fhc2eun5iqwMkTmhPt+V52LZR6owGEjrf3KnWGzSZFOiZuc6MyT5PH9zCHPGlUfkqvXp8ENnETW6cz2wl/QVOkFbTbujxqT2JjMguxH3fkYBID/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc1DuSQqRTahXlix5B0ahSy5J5BtvAK/BogIKS0J3Yo=;
 b=nexMSRL5lT7wRPMYlSYLUxfU40oUeO10Gqgqw+paGajYXSu/tXfdR322Fcm+s0lBi60ey1su3/AX0IpzJSY78npDRG9VH+xKWT061rIUCs6lbtKmOr+gJSeDTxBGrOq1Hc5ANOjthMFPBpMwyfLUMfhM8L6KrcS5w71fp4U7RGY=
Received: from CH2PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:59::32)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:58:46 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::38) by CH2PR03CA0022.outlook.office365.com
 (2603:10b6:610:59::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 37/37] drm-uapi: Sync up definition with kernel colorop
 implementation
Date: Mon, 19 Aug 2024 16:58:23 -0400
Message-ID: <20240819205823.316656-38-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: b66d27e2-aff5-41b6-ce0f-08dcc091b7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eCOO7RsXchfObVWVqHCbsLTSQKtEZCEyNHhHcrFlTPR3A5t6XkPpinNpDcGH?=
 =?us-ascii?Q?UgGxZaMMhGRUROkyB35u68oqLBqTh/s57/tVn0tdJhPoazPefky3UwOhBcHH?=
 =?us-ascii?Q?vb0TFKKVb3LnUelBmV7iP5BNk9xMNpSrYQGnqYKlatei3cc+zV+h5zqEUJQg?=
 =?us-ascii?Q?GCmKEY+4zgx6deomua1tQK82mm2D5cqjUzKOIASGZ6JyRMRoDiqfq7KFuE8k?=
 =?us-ascii?Q?lmWLdymjTVk7DVR/yk25/RWDMj0/wVfDs18ib89+wXrLddpd3vLG5ZFrlZfy?=
 =?us-ascii?Q?5oZKik7IQwgPwBfzJ1nZBDPs22MbQLptPiOiVvhHobwTOcXgiygz5XcSRjZM?=
 =?us-ascii?Q?xlc/n7Lg2oa2HTfCEyQsFOngSCCzOsPHqo4cseVUD0rX9VL/qYajjo7a9CsM?=
 =?us-ascii?Q?ne/3spbC26zWBA/pQ2SnlJCjgTAMRlKncfLThANi2AwsFBGS7+eBoI94o7w8?=
 =?us-ascii?Q?tNajoL/45bXH1llX/YeARGVfl1kX7MLZelyDWpxjKzMwFAlhF6GoJr94eOko?=
 =?us-ascii?Q?KxlQeuV/eOqfCjQQFFCxB8ig8vMxQNR+Zi/8lqv2/9xBBw1wkbM7h+x1ysOF?=
 =?us-ascii?Q?+mzqO+QeLxUgtzK9giyx6UvfykLM/yG+s+qHVPxseKLiGKZOsNpdOgKEJ2Mo?=
 =?us-ascii?Q?cqROMFUek0pYo12AAnTYgyHYMpqlrkgMntlE24oLanPokEO9Cpaq0Cwqu82a?=
 =?us-ascii?Q?5X4Y/4/KJpltqMAsLq7AJIrMhsQNuQAyCB4A73PJFlhs62LFWlOPiUU66hnm?=
 =?us-ascii?Q?JVwqBWw9nNapGur1PqeSCxJvcz6+Z3f0jjnh51iDWIazTNkVM7jMcI82BtFg?=
 =?us-ascii?Q?fF6Ky9PRnjugTFVFyLQwbi6OlG3fI/B7r0nsCHyNxTO+z64Qy1g6v/Ouxkpo?=
 =?us-ascii?Q?xfdanfh9bc4PakLk9410RrMOPaHu9pG0eg1K2CCPeL0y7hQHY5y0ELV/D/O9?=
 =?us-ascii?Q?JYOnMX8hxm9dlhXyN0rDF1manxuBT14TfwBTT8H8XiVU6hpx2AnbJE/iH9aG?=
 =?us-ascii?Q?e7OOrdmKzggleVaeN3n6xUYutfgHnzpJ9LOjDFRkUXIOMRA5yr2zgw4rnmNY?=
 =?us-ascii?Q?XBskZsMWq9SIkpFKaNjUOAo6koZqWuMN2d5p7cIx4H+rsOTrk2BUHT9drof8?=
 =?us-ascii?Q?3HnIIdv2srubdVVdsQzMtqD/K60MSlxyhYGFvtpTe15BlqhGOD+GZW5naQP9?=
 =?us-ascii?Q?GnGP3pNXxeqbE5T7rj7Qg+ECVjhGxibXzr5681dAPxX7QJwQMr9BeTeLtxuG?=
 =?us-ascii?Q?vCh5UtwdWCG28ewO2J7klAMkCcoRvvxflIhMDvWY0AUD5EeuwTrcJ4kWIQlR?=
 =?us-ascii?Q?Z6sfbxls+mmd68+rkx2z3kgWNSoD9uBSA6cOJkiIdOJDAY/Bqy0y+/3G7Umm?=
 =?us-ascii?Q?kDfVJwbPlFkSbv3R3hiro9V4Dt8gjWfq3kY9CPgQgnuq4k6tKlTdSuSw940Y?=
 =?us-ascii?Q?OBRkHNK9/mbykX8cnL1ZoPfcF15ONWYz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:46.7370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b66d27e2-aff5-41b6-ce0f-08dcc091b7ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666
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

From: Alex Hung <alex.hung@amd.com>

Add drm_colorop_lut1d_interpolation_type to IGT.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index db4a0848b0b4..210b273c9beb 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -975,6 +975,19 @@ struct drm_mode_3dlut_mode {
 	__u16 traversal_order;
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
2.46.0

