Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C47CC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF8210E42C;
	Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C/Q0Fgva";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDE310E416
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYHrEl9gM2DT3yfUjOV0ljXg1MSYKR82zSVO+2zHFFwxzx31itV5G9qwnOC7DNreLq/K+bkG5EL07vaKMCj6/18r1keAs+A3BexW2r1xfHydzprCdHQqdsHCG5aLogkJ2wQtFMLeBb4V4W+i6dqUJP3dHP2WEO8HNjIvaCbHifZi58X1kSN+EappeYE4Lcilc9wtkx1GgWp3/a7gXUyu3WeHi60AbW3qeoonMV1Tnb4KBwSTU95YB6pl0b8SMFYuirB2UrvS9JLxtCRCtMGoyRxW8ypQOz0L8gZPTK768K6HCP5gWgdYkY9SCcoVLZvUC9VwwFW+f3RstyYtmgaEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INJv4tBcJUFjP/3pl1/Y1emzRbln40B9LyuNYcOUN1I=;
 b=QNJrFijuA7eYaUI6kodk3ZpEgEtmgrtY6P3yyln/JgewFeVD0dxOiUwZjcAjZJz34+2mIA6/DdhNiblyHP+L2Qn3ujVTVI7/vbEbzLiMwjtQfoJFcZG8M0jxiXkaP8ttqBXOOfmFE9VZG2SQbrG1fz3wyx7fwqUHsn5XA8wqZEdCji4QXYqAi+HjXiyltcX20LDhsElHe/W0CAeIChmxyUiZlC4WFPRFbWR8SZvmkLSX101sUnmORFkoGHucEjYUet0RzFAinfnsXewqJZM3l/g2NaAY6VboJjUKXMO9zFC+mU7OyIwMxGeE9QghjD9LtWUWYn4pCPXfr/dgreV7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INJv4tBcJUFjP/3pl1/Y1emzRbln40B9LyuNYcOUN1I=;
 b=C/Q0Fgva5j07zaq/VcwlySM5yUDMP4N0ulG6OngaUfMs9i8qFDLjP3XiTqDdfA6NiW2yXtY63jCv4fkzI4f6HUrXagYQDu+KhehkTzaL/Yn15ypm/rrQvmNTv1puwF+d4KRj6thd76pr4nYWkof7q6bASdb3YEKJEgt7gKQJwGs=
Received: from CH0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:610:b1::27)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:32 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::22) by CH0PR13CA0022.outlook.office365.com
 (2603:10b6:610:b1::27) with Microsoft SMTP Server (version=TLS1_2,
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
 2024 15:58:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:29 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 07/37] drm-uapi: Add 1D LUT drm_colorop_type
Date: Mon, 19 Aug 2024 16:57:53 -0400
Message-ID: <20240819205823.316656-8-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DM6PR12MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f83d8f4-f96b-4b49-6f23-08dcc091af6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9o/U/F3+v+A3KwPWC4Juyv/TU4XzK7WgJX2hmx+5sRKFUAc6PG8Q914ORD//?=
 =?us-ascii?Q?cd+DELm3EyA3bnI4IQBNaT2r+nCH5KDGA1jj6sbRolUL4VNVdO0FKvxCbWhx?=
 =?us-ascii?Q?ehKkpaL/3SGfQVnGYRJSV9/9ZGDl5DVh13q8IX23sgxxoxSuplsix0agbLYZ?=
 =?us-ascii?Q?esnY5jmO/CR5poJrsl21BdAtziF0iG89m2BEAr46Em2+M1Us77mib3GXMFpi?=
 =?us-ascii?Q?HHg/IltHpCbPo5ZW60PglBF43rsWkP6aw1dKft/dadW3zqxAwnx8QJjjYwwt?=
 =?us-ascii?Q?qELjWpa62BD/bXvN826cpUI3LdubfL8rSTF6Z2GNnxO2ig6Pl/2TUWzsxHP9?=
 =?us-ascii?Q?4HIC9RZt60NY88owFbvDNrI3p1m+XDIimHUTn0PEkq1OqMyMlNu1PShUl+Yq?=
 =?us-ascii?Q?nbTRzmpWz06Eafo0N8GFmZ9RQu/LOowXRqkLh0eAgqVYPsS1FNRyQSABep9q?=
 =?us-ascii?Q?gdjpWgbm/l8bvhZeEuy81NFlS757l1d7SAOIzlOI8NtoQMxSkT245+k2Mu8Z?=
 =?us-ascii?Q?rnmJY3nbVoPFniVn00+DvO05Vo2G4CwH70WLgX+7p7d/0VSX02aK7heqzy0Y?=
 =?us-ascii?Q?4U8tS7nSx1ZTf9J7e3cZJn+ibyjOibbD1LBTLBaS9pC+a5z6cou3wFWkQ7hl?=
 =?us-ascii?Q?CZ44RhtPzulBd5YIRLyRYlmIEdXqA/rTK05c6LwNeMAKXVHRHjEMQS4xk5XX?=
 =?us-ascii?Q?VLQMJ/Ecb+CR18Ul65puVqlcCyTdQKbku34cvog609dKBgQYzwnet/5YWeqH?=
 =?us-ascii?Q?iTrStiTMr5r/s5GiWEVwBhrB9/MKHPFMge9dCpTpSgfRzqGMNdrYfWOTUMcd?=
 =?us-ascii?Q?BxhS8h4K0LIJ88Dwop0+99YEFOgl1lRGqQAAp8FesT+Gn6rCAEm3YXsjvI2x?=
 =?us-ascii?Q?rCWwqqDs51C/aGbdHYc/jvJdO/eo5V+DK+vY9gbJRgwdp1ICkTkdJfthpUDi?=
 =?us-ascii?Q?2nGZm2M1KJZXjdQDfWqXv5is7zE8h+Dn27r1Z9aEqWP001xt1SxexLKA5rPk?=
 =?us-ascii?Q?1zIKmZR/nJ0rQSsRplAcfW66MZn3xj6eqrp+yD38BmeP8AYQtb6j7IVWrj9x?=
 =?us-ascii?Q?8xTot6rNngydPTkBnC6OeMfWQGxYE3l75HFIGJPCDglXyIu7oCIz7zPH2kp1?=
 =?us-ascii?Q?eudrOJh6bNADNZdlMzXBEelR4xHHK4cDiqWo6vgIgWkR+7XZX7dtFVsdyVrK?=
 =?us-ascii?Q?+wWASqmbaGrKVDHRKn6n4w13AWASv7Sw+eqj6U+lVI732wQGSVCTzEB9z/W3?=
 =?us-ascii?Q?CwSQJ7h81VX6RKcQIGwHyhlZ8Py6c7NChFRJGQttXPCH0Azow8z/YWG30X6M?=
 =?us-ascii?Q?TxH/s5A82gjmRbiJnzIC4WSYrpRAtgfTD+YXxBnK+r6dZ4itgyxjE1sdux0i?=
 =?us-ascii?Q?1r49/5Tbs2L6EFM/u6ejbJCWBatYgeWqGdaf63HoDDwBbeq8vrW2/mM6Hkhm?=
 =?us-ascii?Q?hBTpm+S3vT+IrT9o0oIxHIh6/lx2+2Hy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:32.5027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f83d8f4-f96b-4b49-6f23-08dcc091af6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 358c5c313bd8..59dc8dcaa481 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.46.0

