Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BE9E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 06:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371D210E0D3;
	Mon, 30 Dec 2024 06:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uouraYJa";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D2D10E0D3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 06:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muBNlzc/76OrGD+rpMzKbZjSxZcUyam6ieUfCWwoMF6DWopg6IM+y/SBvbrEoWJxdiy2cGaW8tvWwwOhGdBGq/qq8oz8joupxR2ox3EEYEYWz/T+fTHyIzDjkYMp5eOghukST5QC/cPyBxOjTFX40+wdZ9oLsGYcNZqmHjc/fDRfzDLs7IZsvXuRzCpNvH2UnoryIyRarhiXD8KqefSe1lMVhhrg/5gddS+L+Rx5bjXb6VSkb4XswHerM3d9LMuLUrSQpxysfh1pbidWucLxkacEsdFwhS2vrCFBZg29d0/Pj0PUBb6AOefp24s0a4IPUdnreDUl4bdVQFmt2qrQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RzJp0th7boMuRX6XB1gMviuCoJ1hMPeDvCT94JjAwY=;
 b=Fu/YWtgynsY9dIv4hGQvhCIopeMd06Uwb+nQX3NdePXDFLmwGg6YKTor3sl20aWF8czUTCI5llqS67r1qiitIW+P34EY3VjKUk7Yfr1ZXbjHJ0m5ld/L4NoZun04/510YaWYfjqvjxbc51M/QdU9mUbUuWfJyAusSiIeGne+v1wlFspMtyMA9jrGtJiMK4dPCMSW8sR3rQy3iV+Zu8u0IxnXv+bqu3RiliZLKp9BdXyX/fCs+G3r4/dflXQ33lOPlB+tB9be8pS6fksHeatAu+HDSh9WKmA/4oJQArAsMxrniCSyCf51ByJMrydvyQ1yec8IOXjx65XLGAeyU3GgEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RzJp0th7boMuRX6XB1gMviuCoJ1hMPeDvCT94JjAwY=;
 b=uouraYJa2/pKMcYbgD9TQXmlJs71fW+xTceiGEsuAeMha0iOmYKmhkeIxSjMnIpt8dTgXGIfthPgIxGUe2TDsT8FMqAz1rUOtyrNp2h/NEVgZo8W95XUdUapOP9UVD14S6mvalOk8iuIcpeDI4jAIp3FIDY0RyBs0/b3ApBsdJo=
Received: from SA0PR11CA0184.namprd11.prod.outlook.com (2603:10b6:806:1bc::9)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 06:56:41 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::2c) by SA0PR11CA0184.outlook.office365.com
 (2603:10b6:806:1bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.18 via Frontend Transport; Mon,
 30 Dec 2024 06:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Mon, 30 Dec 2024 06:56:40 +0000
Received: from ldev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Dec
 2024 00:56:38 -0600
From: Tim Huang <tim.huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <alexander.deucher@amd.com>, <jie1zhan@amd.com>, 
 Tim Huang <tim.huang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: add GFX1153 to GFX1150 family
Date: Mon, 30 Dec 2024 14:56:07 +0800
Message-ID: <20241230065607.3335566-1-tim.huang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb4e6d2-b223-4f7d-f430-08dd289f1d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bAPeGBFQXkcxyau5SgwkZXitnl974ZB/AGLU0VwBRcdLsxX5jZ+hfee6IRBf?=
 =?us-ascii?Q?qaAGVbT2D1G9SzcaTXj1OuT/mYL8PcSH+oxAcae1aNIl74eE00NmFYg24MRB?=
 =?us-ascii?Q?5XMQPm9bEcX5KfuXsHdH3Jh9Me9dOzp29U06z39NCJ1k0MD9bwTJTOih8Jn4?=
 =?us-ascii?Q?cL6YugNsj2Flw0ghSwussCKJ86icSfabazHRInlqoMXN1xJ6jTXPlf4fB8Z7?=
 =?us-ascii?Q?u9QdHZhQ7udV1H6wN3faQW/LCtB7UNg+uoasAU+Dtot/a79fMHcg8F74XMzQ?=
 =?us-ascii?Q?uMGLmYndRqlElP6fW8zkfTfAA/IyeYvnyBPlAGfZ6qORwRVIfQW0wCIy/4hq?=
 =?us-ascii?Q?BvLpggIleJctyXisZi9bxxtlRopjq/PblNupd3jcWwWk3svDZDbP0Z4pVKvv?=
 =?us-ascii?Q?kunvxcVtYRSZLNbkZfuPRGMyx79xXMaGux0tZiB1gJCu4roYMAsq9duKeAYA?=
 =?us-ascii?Q?8D7wsoyuL0fgsxqYW5QIefjhCqOVRBGqwsOn87sAOCaemxvfs+mlWeySHJpG?=
 =?us-ascii?Q?y7SHaLB/E58Vo9DTeT29uxJYbui1OrmSPdxygYohE8J9ozizAllG3Id8MMx+?=
 =?us-ascii?Q?Wzs4esPjgvI5F9W78VR7d8s670WnmkmE50qW5TcOSM5boQDt7eZq1ZzkndoH?=
 =?us-ascii?Q?sMRyYZI5a1WAQszxvXnOFvu2GVsT7KAdXIrXNx60pxIK8rTWa/DeGBurls/Q?=
 =?us-ascii?Q?Co/Hv/m3ggJUPK8605nCIsipTrZ0kOw5mT/igS2+q6LIt2xj5r+tw/8179pL?=
 =?us-ascii?Q?+efKSBfqzdZ3ZbRzBYjBjddjR5mE1sFihmG4Ux+Wj1h4RaEEcA3seB+blAVq?=
 =?us-ascii?Q?+/Zopml4meh6nBDX3jhMZ/vUuQ+5F9BK7qZALs2eHa3bxFR7RzJVgQ1Fi8Ek?=
 =?us-ascii?Q?j+6jcb8+UZodYuLhnG59nGMqD2r/QflNOowE/eaRnQmp+EheRpK7fjD7wolM?=
 =?us-ascii?Q?4s7+h1AWjIOY2XvZneghEV8mMwwM7Mx9j3M6Y5q6G+0LhLMBZOKpTYANCRio?=
 =?us-ascii?Q?5jqrjurkcgo4XwO+haVk1JWkDTmUJIF2vRH734k/nm+LxvK7WzrAIqyelLSB?=
 =?us-ascii?Q?n5Az7XBgGRwUykSOBGtKCZxdP4j/4yY15DdkMvXqT5bLBM92vWeQIctK6iGh?=
 =?us-ascii?Q?LkTS74EZuDa3kgMhNmxxgysyNG8Rlvwb5ANckQSJkB0AOTY5Tp1DrpODOgDo?=
 =?us-ascii?Q?8EKYtxAM33orXjVqsnzepBUl++C2ADAkSo3BRow/er9kJiR7sC39/aClWQFM?=
 =?us-ascii?Q?iX83uCLOYPXidxxkuF9CL8n9zBgFLMusc7qLT44vyMKhlkEY9EPXT0DiK/M/?=
 =?us-ascii?Q?bl3TxBGIetrFa5rsPxv9CBRR3/ywNhxSZGm2ugmQ1mrWEqPN1Ok0eudpdrSv?=
 =?us-ascii?Q?17A+cP61MM7DIjRnd8U1PNi9so7cCmqP3uX4Mo5JiBlo7Vr9MTRbBi5ZJrZW?=
 =?us-ascii?Q?SSuB9pkb3H8fHZMjEXb0PYZJ8D2CrEomyQYiTloA/NLrItl4jLXyFG+zUdrp?=
 =?us-ascii?Q?k7tCQywbdMRf0pQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 06:56:40.9730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb4e6d2-b223-4f7d-f430-08dd289f1d30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314
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

Add GFX1153 to the amdgpu supported chip list.

Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 1 +
 lib/amdgpu/amdgpu_asic_addr.h | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 54b0ae1d8..60190c639 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -107,6 +107,7 @@ enum radeon_family {
 	CHIP_GFX1150,
 	CHIP_GFX1151,
 	CHIP_GFX1152,
+	CHIP_GFX1153,
 	CHIP_GFX1200,
 	CHIP_LAST,
 };
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 980bb9b0b..cc4163bfc 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -800,6 +800,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		identify_chip(GFX1150);
 		identify_chip(GFX1151);
 		identify_chip(GFX1152);
+		identify_chip(GFX1153);
 		break;
 	case FAMILY_GFX1200:
 		identify_chip(GFX1200);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index d5579ce4c..63cea1a5d 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -110,6 +110,7 @@
 #define AMDGPU_GFX1150_RANGE     0x01, 0x40 //# 01 <= x < 64
 #define AMDGPU_GFX1151_RANGE     0xc0, 0xFF //# 192 <= x < 255
 #define AMDGPU_GFX1152_RANGE     0x40, 0x50 //# 64 <= x < 80
+#define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 <= x < 192
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
@@ -177,6 +178,7 @@
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
 #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
 #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
+#define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
 #define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.43.0

