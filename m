Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA63C52D6F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 06:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7110E0BF;
	Wed,  7 Aug 2024 06:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yJOU6fZO";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD410E0BF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 06:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tht3eCVj9PGE0Eb70Bpu+gVluHlO9gOX9AdgwF+7DvZCg+JIkmijPfEAXdFV6uBySdMTVt05LClVGviLoEYZfZhZljRRATHCeW1gfyR7su3fa/zG0QgoJPh/LRK/C7leBUe6bXELRJdH7acZAqqep2zM1Blp1ZBBx33m+UblUKXFU/cdnBV94IvPYwV2FW9y7LqHslnHyE/uxqYhCDgJQbFOv8pzyudUmiFS2jDZS5PI0MvQUhREP9OS7iCs4t3c2OzUbub1eeSXwCbjj3g2GNQH4pD8OVwzaEaf4GdGyGdLN+A8L3nrr2N5OZbNx/w9N9ey9yE56T3rW5WuntkIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9/OOtxoZC70RQhlykXg9BAM78RfTlXKSQkC8WeXhtI=;
 b=C9p7TGtxFg5hBgUvov/Qn4/3oJGI2SLMTynu5GE//eKfCdh+KDfZdIe44xknwezFvSek8tD600u7lB9fnzNl4a2L/JNd5mIm/JuOh6QjnoWoTsDr0IteQ8V/FetbWCC2ZNnrMwDVv56l1+VXIOkyNvLd7t9ixurqCzIyqxRriHV3HATTfQclVLGCx5nKJ0G5ff8l+LBXIjE6hLJCFdjEWWYR3/3JIwpIYXfJe2upBMzY2l8QJeNmCtNv3GVwdeT506VjtZI0LciXCJ9C6tVsxHjeHhsNNWISPBLPqa3BiFhJ/kkjNrUeY6QI5/4byIEhA0ceJNwlDM7zyDcY6QPKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9/OOtxoZC70RQhlykXg9BAM78RfTlXKSQkC8WeXhtI=;
 b=yJOU6fZOEUCTaiJ+jkDDP3GY8wBHjWGGl3kVTTqKOrU6jQSfQdTgd95mipJo+0tkEhbxetIajUUghbP/2KWZdzMCgDuG15tetDCPSZ8zB1sHJfoWhmD1MTwh9KtQx7gU8Sjbrcl67kg45xnCK4+GWcwHIwlTY9mXEoLMstloiTU=
Received: from MW4PR03CA0036.namprd03.prod.outlook.com (2603:10b6:303:8e::11)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 7 Aug
 2024 06:34:51 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::7c) by MW4PR03CA0036.outlook.office365.com
 (2603:10b6:303:8e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Wed, 7 Aug 2024 06:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 06:34:50 +0000
Received: from ldev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 01:34:47 -0500
From: Tim Huang <tim.huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <alexander.deucher@amd.com>, <jie1zhan@amd.com>, 
 Tim Huang <tim.huang@amd.com>
Subject: [PATCH i-g-t 2/2] lib/amdgpu: add GFX1152 to GFX1150 family
Date: Wed, 7 Aug 2024 14:33:51 +0800
Message-ID: <20240807063351.727312-2-tim.huang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807063351.727312-1-tim.huang@amd.com>
References: <20240807063351.727312-1-tim.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: 578d8b86-60a6-4014-06aa-08dcb6ab0a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I2bwRxCDWH5R9rPvo4bP75DNPiYfVYubNn+eYM1zboABtlqLOdAG46Sl/G+b?=
 =?us-ascii?Q?69sFRQAIFJXMfBn4Uc3xowoVupEbVDHHkX0JtkimNtSAaZOqrgvdMRMa+XMD?=
 =?us-ascii?Q?f1heKbrh6GxIhqLZ1yjHejtBv2W7fwVjCzLDct/fKWrj0WAeaaoyMxrVw5w1?=
 =?us-ascii?Q?03zvS/MAx3w0KhtpjcjU3bsO+tRgZHpbEUfZ/iQLCJ12nixt9osWfvUcBNz9?=
 =?us-ascii?Q?9hxfxd+aM926YIiysoa1ow/D6qpaY6zxoaxHKDVbLdr3Zsmau6Fy6SO3m2o8?=
 =?us-ascii?Q?gRAvwoMxoSCnD5b2fNwGMZ5i7SSYfCn60GdTxCAxjpM82K9mKkgQLvjZXYCu?=
 =?us-ascii?Q?6Atwpy1PFNXXzYU8TZ69TUzODJqz/wRsOx5kwMmfREzVInT/U4vbOl8qZMdZ?=
 =?us-ascii?Q?pB4qeTruhgMEM8wibaSNJ6Qd+bleDRA+IF4VzxDPVyrwdwGEVPAwPBiTfCHz?=
 =?us-ascii?Q?9dEnUK9hMfJ9StPoPfnXdfGxWAkswkp/eaYjCi8CANQkCTaukqV/NA5xNWXC?=
 =?us-ascii?Q?Udfz/LAxUYZKEaP994kX1cG72ygagDjgftGFtWFeX35GD0abWCV7zYnooqwz?=
 =?us-ascii?Q?Udoi+k1T1eI34eSiKE19Xne8nj53iKrkhMWgvgIgznY9kfyLfUaM7kV/DfTe?=
 =?us-ascii?Q?Nx0tjLybZSclHrQdOP2R2s0k+5zBqSvUNs5lyY/smNiVnWltHk9macEtpeJ9?=
 =?us-ascii?Q?yrZjbyshLGS+JNJkeIN+LHgt8/3+ddOjVdRJR5C0GXbJyq4beHu7ga4zxuy2?=
 =?us-ascii?Q?zbTEX/7fffuIRduci3JernVymh2YEb+WoXTE2bG3Hj4HhFTlyQwfvNPYuN+z?=
 =?us-ascii?Q?FIwOn0OA5R9nsAJqYiqtxiKtyU/nwtLcyiKybUm0WamwDC+B9KypA0g7DQOD?=
 =?us-ascii?Q?+TVcApij3LvT3sUk/yIxFP0BmMLwiU7yVesdmEJdJyr/EWlz/JO9UDoyvOpG?=
 =?us-ascii?Q?lXwHOV9AIq8ctFOBrBxE6FT2neYk3LSEWI+xJIVbv+khnIqo1ksi5ClDaP+P?=
 =?us-ascii?Q?tLfFn5iAGPIBIZYR/e7+bf9Sleg4iGl0O1UVPdxmAMWVdofd6Fov+s5Gs6Mg?=
 =?us-ascii?Q?r+qqgx6QvHzzQO6qazNJ/9IbGWSDOyKuVfbpj70EpYpo744wH07dszHfwKcV?=
 =?us-ascii?Q?g7t5FqH5fNYcCc3VWrivoz/19hZDmJ8kizIUoFYzKdYdqzZ8JKzHY0Cny52Q?=
 =?us-ascii?Q?CrtG4DqDdepzLQR97IoziTlbZlX6Hx0HYhYsHR8LlxEJhCf50wh+TyT4MJ56?=
 =?us-ascii?Q?9E7lnWiL2C8gpslmchdbDHid4whVFkpalIEcdAmjlWK/QdeRrR7SMSSO9Zqh?=
 =?us-ascii?Q?t7XbUVrKAP0AuAswH5cVoWu2TsPR+eVDhgN16WRFnyLg9CmpDiynuKn1wUjY?=
 =?us-ascii?Q?U7wnsPHoab2B9I+9KrPwQn9dGwcCl1scTCve7h8e7Wp1kFigQweh5B902yWw?=
 =?us-ascii?Q?9y5FxfPNSnvLbYNbweloKUAXbX+savY+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 06:34:50.5246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 578d8b86-60a6-4014-06aa-08dcb6ab0a37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746
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

Add GFX1152 to the amdgpu supported chip list.

Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 1 +
 lib/amdgpu/amdgpu_asic_addr.h | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 4a5731dbf..54b0ae1d8 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -106,6 +106,7 @@ enum radeon_family {
 	CHIP_GFX1103_R2,
 	CHIP_GFX1150,
 	CHIP_GFX1151,
+	CHIP_GFX1152,
 	CHIP_GFX1200,
 	CHIP_LAST,
 };
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index f675b97dd..131251615 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -735,6 +735,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case FAMILY_GFX1150:
 		identify_chip(GFX1150);
 		identify_chip(GFX1151);
+		identify_chip(GFX1152);
 		break;
 	case FAMILY_GFX1200:
 		identify_chip(GFX1200);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 3829b0306..d5579ce4c 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -109,6 +109,7 @@
 #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
 #define AMDGPU_GFX1150_RANGE     0x01, 0x40 //# 01 <= x < 64
 #define AMDGPU_GFX1151_RANGE     0xc0, 0xFF //# 192 <= x < 255
+#define AMDGPU_GFX1152_RANGE     0x40, 0x50 //# 64 <= x < 80
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
@@ -175,6 +176,7 @@
 #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
 #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
+#define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
 #define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.43.0

