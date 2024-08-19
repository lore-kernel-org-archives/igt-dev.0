Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E30C54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494DF10E460;
	Mon, 19 Aug 2024 20:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NI6mq2BY";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756210E42C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbvRlwRoHuIj7G5/led0PxZHT8spnbfQBS6WK1Lyo10XBU2CIs77190v1uBWD1cHO6Fowsz14FFHpPgeCVXMyMcHpq4jHgF/JoJxyzdTzzv3f2h4UlC1bEUFggf3I1ni4UVdaDXwuqPamRhRkBkCh2uQPbL97LadxbzckTgRX2RXSnJN5JhYlDijOwOX8i39KBA1MVi0RZmQ3bitxryWURwmIKAdPc8XdKrLE6OMbM0ClGDIuo7DIDkYrKLhHyzGdx2cYr+ytXi661hz4IWKMVB43+I/7t/aN0FVaet5HSkL+oLUYf6rV6J0GUxEtOX2fUPf6EyfYbo4vJ5+PDEzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ0RMO02soIDAcQqS6oola18hbdw60BPsnrOKOG73XU=;
 b=tm4qyMx2Jy8vtn6pgSXM2c6mR0jzUJ6CQtPsRZ+z30NR7inYnC1pEQhrHrudVaSrgZ2XUiucWS3izWkvPiAdQp0xHhyqOLKQHuGDKuSjaFQU5Jghb7uta0ajpPpEJxbmtETNzyPLGAUBemI6AKuxXeS8dvxziT1kr4WMbZIioIyVZRz05g4At5cB6ETWg1pI43+RAkCYQhOtTJL1EOoy/2PAk42boWsLo+FbYxM1rV8D2YViIljrKreGm2kOH2/BdMFwAfLRFRAAY/mgwqPFs/G8sTuZ+l4v0xGwBaaPJjZhSTqcr2pj5iFObXn5BGDSuBp8pvdN64Aq71d1goFxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ0RMO02soIDAcQqS6oola18hbdw60BPsnrOKOG73XU=;
 b=NI6mq2BYVQkh8ovew6CDvHRGa/N0a27o5hjkQiMIgZ8odslcZ5xf6Bdlr/+NDcTE0ZD4Q/CV1VG8aOzStbmqMh+zzWp8zIFSlJoYy2kUH+WoHaa+1oYTpt5mtexcNmhMgEZ/HTC4QBonuANQdoRLKvfz0ssNuGtFsSr+pGvVm2o=
Received: from CH0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:610:b1::17)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:32 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::bd) by CH0PR13CA0012.outlook.office365.com
 (2603:10b6:610:b1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:28 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:28 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 05/37] include/drm-uapi: Add COLOROP object
Date: Mon, 19 Aug 2024 16:57:51 -0400
Message-ID: <20240819205823.316656-6-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a892c9e-5bb1-4a0e-0f8b-08dcc091af2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gAvyh1GD7xSG1SjbeqIU3Mzh+onXYWbYcynW/22K46R1Qgw6UolBfEsWSDIj?=
 =?us-ascii?Q?oWOuqdRTPZZJsDRvmRPKTtM50ixqCelm1EN3/FIEgZdli4IErPeUurAr6Rc/?=
 =?us-ascii?Q?FNMjE8goLKZ88KSQmstIuYXkJ3JfImEX6UoF58jUWNHroXMGTIkLWRyZhUU+?=
 =?us-ascii?Q?NaCJs3CevQ9ADlRm35Y6HnzF7HSAvAsS+9RUw6jkFdNfAj8eje5QZd0fi5KL?=
 =?us-ascii?Q?OejBE/0nsA3E5J6cJCcQXwDZmgAEsg5AsQ5OJ+yu5kUAvtIGwUTuTzgHUu3X?=
 =?us-ascii?Q?un9N89OBRgALhfR2C71D0XS5+CtNLmXMMV5UV9rWcTm8GkqfmItyjUfS5Dsj?=
 =?us-ascii?Q?ea+fpWGFIZMA4ceyctdA1JQu4Qozdmy3KtfgLTTu2BMU7hTOSt+/zvk1PWwi?=
 =?us-ascii?Q?iPR1A3IEuo1Wm2u7/RUfImc2JxXWulla7r4xP9HuRHYmVy8LlAT3AWGWKQqA?=
 =?us-ascii?Q?OGn5X6hGv0hwEZu7InVNMe1rhX69xj7XhlK4akxR/0WxJUXjsdrwa1wgXAKT?=
 =?us-ascii?Q?6BwBURhqY3jg/y3TtgD1i9hf4IqYMet+M4iQpXh/NCe3a68JgMUp/BR9vOiQ?=
 =?us-ascii?Q?tFARM/3KeTYWExhtNGCoXEQFd944ulcBAlRJoNxLsHJjAn9hSorhXPQIjjt1?=
 =?us-ascii?Q?SUzHdXfGQ2LS2GKjEmWr+WYJctz1lKwi8AhmSvRPSdOpFEgszMcy6Olvb3DX?=
 =?us-ascii?Q?oIkb+/CWBSMd6oRn47wCkUZ06YoF08rDfyZrV3Ep795GEKoq/9giTIc2Yj2f?=
 =?us-ascii?Q?aWHZJqWc0Dovz1GC7HNsH9uTOfg7bWBxixuO0lgFJTyRiamx6VqkzQqD3+s2?=
 =?us-ascii?Q?0BddmYI66orpATaTL87m/TT9auexVcPihJR+dUH/j72U3cOq2gtLVaW0G+zv?=
 =?us-ascii?Q?WQjmeCUnDSuxLdef/BPVYjp3LMqo5mBYava4jhFiDa07GIPX00Wea728ZBH1?=
 =?us-ascii?Q?wtj/a2BfAqtHzPZlrdyuqMlC/5KDcSRGDL/s5bm4FueqcDy3a7x6hzv/7nuj?=
 =?us-ascii?Q?1qoi2f3+i+2X7rTp2eyJ/WMd0hzVBJiguSFcWKXMz777ZfGp2Wu2Cs3YjAc8?=
 =?us-ascii?Q?6jj/GU8GxjpI4OZ7hno1egYqRm11TJgIEEm6wc3nSxZcu2gfHvWsHtF6/osS?=
 =?us-ascii?Q?7xMhqUbxs9v0favDdAa4Xr5O3mL6RBu85YEDtryI7jfzYunL1pJF23rdS5s+?=
 =?us-ascii?Q?QNFh+J0544oJQho32vF37hrKkVol3J3mqA9/hcV2/Tq/4EiC+zDEq0dBdecw?=
 =?us-ascii?Q?2980jDp+2eMeTcZPDEofT3uQAnX0MMYmNRU0EuEjtjTG4A5slhiQIUbg6WE9?=
 =?us-ascii?Q?uddExY21DDThJaC4tTQkRhWK0YJkF5hRyg3/QLsJ28OX5Gk9D69BY9ikLq5K?=
 =?us-ascii?Q?11pbnUPrfjdmNBGD/e4400GnbP71N6rW7myzok4v52gq4BPV0ArEbDwxxxdg?=
 =?us-ascii?Q?hZouvY/DyHEnWxpymcOfgj2JGNo7oobT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:32.0808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a892c9e-5bb1-4a0e-0f8b-08dcc091af2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350
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

DRM is introducing a new DRM core obejct, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi.

v3:
- move enum drm_colorop_type to drm_mode.h

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index ea1b639bcb28..c49526bca034 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -857,6 +858,10 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.46.0

