Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B46C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251DE10E540;
	Tue, 17 Jun 2025 04:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="foxYtcQW";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1110E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhhWQep/W0aEQUvYn0nySL8oKogyqPud276Exxf4YMQQKGrSbvmCE0yLg3gOB5QttLzcIqTm4vI6fyYx79HWV3CONylvZwp8SFD7oXkHItozt5W12VO4+P54+l/7hhd/7x+nMl1r3Pp0yTDbP3HYkU2AP1Z18ihpSpHCXMqtJPPibHd9VuBfbB7PtM33f8wDjIks/prvHLotdJfmxDQedbrkeSkT3jASejm1e0zU8UESa36NitHntTH0yMw6OUw+MZaGDdjyDx9nf5+hE9FP2kZwN3ojVItCxxVY5rFeFxcsLAjqRzDLISnWveiEj6+M+FAZs2PvSI/XRsTyxYxxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOD2ZWW1/zOJ5zi7vgu+r9aloFtmaZ2pPdmLZc225yA=;
 b=Ut68j8ITn9X+dzzX48+jUFrPnWtKs7O2M3XV8WM5hNUe6hgkOm2rG/keYZ/6mXPmV06KSHTpcw6cHOKz1mnX3WZuxNXq4p+DH40tq9/6VJuBfAZN9mFCa3XqrLZ5+ZxwgbSNNoFnWXi13gpRQB1EINE6BlX+3k0lV1ZFsLBoFTNQh7NcrRL/sPl8qEUt3Y026uCxNESxockm/e7opKmwqOkEB8h0vBpmuWgqM+iYcC+kzL8ACPe8sAWS+oijR035V2Pg+kKtlLZPlPNTRvSoHV1HhKWs497feYGfbBVvK62ldeUAjdOlbGQMl4VC1/gpFb9uJJuROgz9jiBbzD9aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOD2ZWW1/zOJ5zi7vgu+r9aloFtmaZ2pPdmLZc225yA=;
 b=foxYtcQWAIIbW7nXPvwKFrTI272IcDs6F9HaYs7ExPK1w8vpEOa3QN7bO6/6vv74JzUkCzyFk/HByWchw1ndgRVBwZa2PVdOUtLDvybvT+a3qiKjDUxayKpmrnzrJRXUN9GR4n78Mhc7PdNa8vnIYLqf4d5JfxwjsotYcj4n6do=
Received: from CH0PR04CA0036.namprd04.prod.outlook.com (2603:10b6:610:77::11)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:43:46 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::1f) by CH0PR04CA0036.outlook.office365.com
 (2603:10b6:610:77::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:43:45 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:43:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 35/36] drm-uapi: Sync up definition with kernel colorop
 implementation
Date: Mon, 16 Jun 2025 22:36:30 -0600
Message-ID: <20250617043631.2920587-36-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 741e2439-780f-40d2-171c-08ddad598b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E87bKWOZPjjKmIPau2VX/pjIWWFKBTKVTQ3GDIq+osM4yzRCCMSFVSEkCL+m?=
 =?us-ascii?Q?bIlerMgzvaf1uYTX3PA1/L/92CyViJAtZU7s9/0QIAP7iWnEkuS/oWPCfEpy?=
 =?us-ascii?Q?LwHnJgdnEzvJZo8enVgrZgyKvM778ztLy6zNZvHvs/v+fNZzKiTiQXhTmNC0?=
 =?us-ascii?Q?14FnnXgLRZVmKdbo//GdiV0H2qn3dXB6uujZ3gVorrr+jgrgk3i6jnRIY6aJ?=
 =?us-ascii?Q?Mr0cexTU3KnPAZp2yZ0+AqNkylVcRjvRg496BQzAwD0WVyRrQ99067/7nsz7?=
 =?us-ascii?Q?LYeOs4gyAno1G1zl2/arRitNQ2hrfWugJz78JyAthIsmTlvbCNV8nLh0G4Vp?=
 =?us-ascii?Q?tbX/ZEvzjJintuT5NLQX+zUDrL925UL5CyNX9Hx6S8FhT0NlBdZBna0Wj+Gq?=
 =?us-ascii?Q?f34C2CANBHDkpVnRltRCQVELTwHfShm2b+gtk9ge2r9OlLf4lL+kTwk0fJ8X?=
 =?us-ascii?Q?YSSnZ9CtlBduH6aFLdh3JwwARAzcfbrCDIE/hzY7xY9HLIvz62dm0cZPxWEK?=
 =?us-ascii?Q?TKakNZdWGksawSNyg0hgSSl4vYKQ87LiEQ2kWqaeFsafuQ+XFLpSdWZQTOBG?=
 =?us-ascii?Q?+/3owaCBgIcsVwJnNOxuonF0s/mi40VX0dzVwOb4qccisg2ijeQrNNwWQxpo?=
 =?us-ascii?Q?1fx4DSFgGMXVLvzNYlKN9Hdu1HR74cOoXSyoQ/xEcKBPE+kh2mW0+aFdiLq7?=
 =?us-ascii?Q?+PgPSls9E/GhZk3+Wr/Ghzx7pHUpHGOWEZty7SOFQ5EqxO1k0pu7HJ41eDT7?=
 =?us-ascii?Q?xtptLk+blph7NVesO1gXyqBzA9fWV/luWbFtzS3KmeE758ytb/efo/XhpPS7?=
 =?us-ascii?Q?O0oK883Z2pk1+Nw3kBNOpGXov4o9a0FDe8eDoEi6+fCIJVk+lpbjIRgScnzD?=
 =?us-ascii?Q?Jst+tVr94GI+4XAhEHQn4n0Yk5j0VbHIswVdddcCY0doRnYHohULsVzzE5rg?=
 =?us-ascii?Q?g67utCyZdb9ZIX0xLiU8NMP4Fo8kv+v9GX8BWTTvtDICmDi557nKH7KsbH81?=
 =?us-ascii?Q?SrlPbJRGNSBYwqGWqjCCmpmqLQl06NhDSqyrC6zovY55RUfnkPVJRpr4BMcc?=
 =?us-ascii?Q?8ivWSHbNLo/kkgS1sARSULTDim+fFAEzTBjqFIJCe4pjo06OVT1vO5RpxJqU?=
 =?us-ascii?Q?8i4PYvXup29JcsYtvqzwdZMpgHMTaRH6UFm6T2hsGy5anTaedrtvnanUXTRl?=
 =?us-ascii?Q?MDIAToLTO08Xm8JglkgV9XySOOzCxsshDRcPg5MtoGwS+3ddRzMgomnJ9rf3?=
 =?us-ascii?Q?r+6HgdHeyG0Erz1QEPrQTzsFj6n3rsCqRmMCp+TYaTNG5cwLVMIFJuSqaexC?=
 =?us-ascii?Q?tglFqEYanVy7ifQwUPotdwWtuZQbA1UpNaOsEfVkjBc2lL9CBdHxSvye0pCr?=
 =?us-ascii?Q?HNbUJq8yLxN5hU4Wy6DFsq+ChHTjnO4CQkhhrLpR3BUbf3bsDZjujLcYtlqW?=
 =?us-ascii?Q?CaI4njfFbodGFWh8ItDrFIid7hS6hUIGP8iKHS6x0WFgvS8ybzLR7OKeDotp?=
 =?us-ascii?Q?fpq+dyhGmF3UjqDzoRmDU4tljn2EqJprJ6vc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:43:45.7632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 741e2439-780f-40d2-171c-08ddad598b5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580
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
index b305b3d41..4c8d404b1 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -966,6 +966,19 @@ struct drm_plane_size_hint {
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

