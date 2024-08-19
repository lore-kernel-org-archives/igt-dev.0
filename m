Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4001C54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3310E436;
	Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qmzDuq0d";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A1F10E429
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waz8myR2G1BhRPcG+rIkN8Ltsi0xYo7cbVpyp1CfS7rItsHcIKxXqiN79mnoxxfyVCaJ0dFGzKkwKScfQkBEgQZQ9d72g59xsKambqkxQLx5atR0fimC/I0eivNEyTXAeAYa317D0PKy+TjH1BN/tPLXojdGRfX97eb4XnOqyb17ncb57SICvTrYdEPEPZspwpKZM+z5P5A+yuUvYX3PFu7Do5kFfje+kX+QmUV3CqC6wfm4lxuZWLLQitrie2KhkAdc4F4O+M9JtmlKwf26Q5UU2NdSdOOZzZwuaL3Qq0coiZOCqj0pPQVo1GEgfyTkisCwEqdoAmsAtmf7TEDpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt5FKBaDtprVKyPKTODvaSv/bNqR3NIg6VbD2AA+yzY=;
 b=OefD6zf21Yevmy59V9FljTNJ0mtzp3WJdc6kAjLPzjyCTlYHUhwRsyouxID0i7Uwt6tX96jeH16XZehjkp4uuMa4w75+boHoMYwV3HSzsrX8YCzUGXklATKA/7sFOOYHpDWaZ5K7U0pMfUGxb2zKBW2sQFioc+ToKqjsE13s8gYb6mHN5vQXwZ329aDGV1MpPGgHdOqbtHZ3X20KpR31CeMa6F9kdo6UkkKIzfuHE8/9oIbGEjr8h55gUSaifkPqCccPPoQiDuaiUw13bC8q6pWVgLFZMuVYTgu4LkwQFqqOUUEqpDiB9syuvhaEu7MBt9xfOb7NqxhhgvFmyIe4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gt5FKBaDtprVKyPKTODvaSv/bNqR3NIg6VbD2AA+yzY=;
 b=qmzDuq0d9wqI63Jdl5oX8Tv2gxt4DVtUNHuSJMvVJj+281RjYZenKRMa349aeOX7tSkqW5jud1+6vB2u3vxWLOJkjZ82p7coLNyETycqs6Ak1bxR25YS48rAOh41258nVJpfmlFk6Kvk99T39Lrd2YPOGBN+hAVSANEDUipniII=
Received: from CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:31 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::6b) by CH0PR13CA0024.outlook.office365.com
 (2603:10b6:610:b1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:27 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 04/37] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Mon, 19 Aug 2024 16:57:50 -0400
Message-ID: <20240819205823.316656-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c16ab7-a02f-4396-4f12-08dcc091aecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H33+6K5FSZlDEoOytkTMNV95+I38rthSMK8hX/mIuS8SKnlOS5AzIIZm/kcG?=
 =?us-ascii?Q?XfyeykFg/znJuvsmXa6bz9xUFDthN0CM8kweUThAT6NKkC+rKkgRumf3NUet?=
 =?us-ascii?Q?rifpZmk6ZbutsShT4+NzCGVzBHD4R3h8aBRrbqzt7wqarO2ZG/SDWx0T2B8v?=
 =?us-ascii?Q?swhlY8+rJjyoFTXB01GAJLr7vb2r3XA96RiqhCeoZl8RcuJCSGDEWlDe/2Y5?=
 =?us-ascii?Q?6goC3GOhZauLsm5oM0HF5cZNTEkwECMfwlBlRrCa2FEClv78xUD7AH6gTlOm?=
 =?us-ascii?Q?t3mTd58pLTYx2SlX8uY1L8DH/DwADf5twxRYoP+FSvUOGFxAAS0ywm+JIfe9?=
 =?us-ascii?Q?ga1DJ1OQFVe3jZW0BzovBN5JSt6e+N5hKZfQA7VE/XKq5T340OsCUAAqu9R2?=
 =?us-ascii?Q?0cBGo6SuQHoRZ9lvQ6aZ8xfdBs9RZ1Zjs1K62VfyD1wwpWZAk5ZTez5s9aWn?=
 =?us-ascii?Q?sgNygG8sSwX986bV/EcxXmlUvROrx68nIr544DGAz4OncwLzJwLHLCrid61F?=
 =?us-ascii?Q?bY5aZaN+H2W9Di8PezypmaShlFB7rdGl090uXjtYlFECn7S3WXrAHEV1sZ0X?=
 =?us-ascii?Q?/kRDBf6wxodIqbvqG9VpNLeCcooC+FYSTc0KB7jt6XmPQ4Y8F574KPrmy0ai?=
 =?us-ascii?Q?tfUdG9kovSiRlTWj9MQgLP6BnkiUeyJXmVOPnO8qCV1+9VuN8AzEPQDbKrbU?=
 =?us-ascii?Q?2D9iB5LEkRY2Gu+ColvkyrBu9n6RJdjm6AesXwxK79VE3VzxMIgNx+2ueTIs?=
 =?us-ascii?Q?/uhGh2nIbJMpE9jyUzwSEYh5rrRgusiyHVprWZmnNh6UIZ/jU0wYF9fnIyX7?=
 =?us-ascii?Q?kOCSExAjASxvykLyk8nh9OTkECy8l3mXKAfUqQtWtfdY6Q+LJ4VQbdQT8TZc?=
 =?us-ascii?Q?9FvdjkJN5q04vNWHC236exb1Mn4s3kd8yfVAo4uO1WY/VUs+rZJTQ2d7EF5c?=
 =?us-ascii?Q?E8NUTOdeG2o6IgXMF0W8QvErDLk9VDq8xDPAVCO822fSLtoUd+89y7HlJs7d?=
 =?us-ascii?Q?6k1l87JT9O36NL6y0XPD7EM5y5mLtH454TcdvfLk7b/jpbnyJIpDWusUf5z7?=
 =?us-ascii?Q?ImG17Z49TJ7ow6vjRZZP07klzexcq5gCegcVC1P5SUSeDvdgI9MsPq/T4sZx?=
 =?us-ascii?Q?BQkKGD5PyEu1+8rYZu/RrdHHePRg4LhUQ+wI9Kby3iX3zOXADz+6xxs3xfqj?=
 =?us-ascii?Q?X3PpFXtTgLVGDhPu7CulwzZpbzWnPE1w0XymeKAlOmufa7Bd75Ln3cZyTf1L?=
 =?us-ascii?Q?+o21KRgZcgcnLbcw31kcs044XFIWYGuj/L3fU9fQjKtv2Llvo4hxfDfyppvT?=
 =?us-ascii?Q?kVMXJWoTTDOEv2QwPOGJk6m1dmFJVGnSi/0kAeA1QdI+BZuj9jueJUOhlZJ4?=
 =?us-ascii?Q?Ez4XKblm94tjyoCaX8f5gRoSkT5K4ofuEoF2QKeRvR0opoVLglq8oyFu5Ltd?=
 =?us-ascii?Q?ppH7qlvETaJWdmyiVqdH3ZjIN0WlMiFJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:31.4402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c16ab7-a02f-4396-4f12-08dcc091aecc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436
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

We don't want to set this by default since existing tests
might require COLOR_RANGE and COLOR_ENCODING plane properties.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          |  4 ++++
 lib/igt_kms.h          |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248deb1..002337cc9709 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -836,6 +836,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1a1bf942c600..4cc2b195174d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2928,6 +2928,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3921bb7a5f58..7c9ca73a7dfb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -483,6 +483,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
-- 
2.46.0

