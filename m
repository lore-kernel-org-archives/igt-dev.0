Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD1AE83041
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 02:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65CE10E4C8;
	Tue,  3 Feb 2026 02:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yKs8TNuz";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013005.outbound.protection.outlook.com
 [40.93.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A696910E4C8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 02:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnqPOChSt9Zdspyl1w7Pn4xlxRbHnsxY3MaLZJV1n13TuwylBR0osWv0W6idA1DdhJqfAqOMIGB/p8ZECV9Obik2SN/+O6PIAedain7T872ur1qUTmYZJynyECTFDhnJgWPATYFgNz3XbiNOIq2y/eQeC/usUqXhURgVQ6H+0AVB+ciy+sAfmY9K2d18PsgBb3QXTBVzDxF5g/tX0LFmP0M1m2N1C7nMzlswqO93HTU+jsDX991ZW32v3kMJe7oTRXZhCWZKDHGo8ddblD+nOfFvROkMTRPOwcRE6Y4KGc/sozaCRmpbilHnRgV8/wEkGifDNoJYJhWG7MLOiVWwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Guz4B3wkYrjO8iHmpGW2eLlDpCjlWXsopJR+jjYN/8=;
 b=wtsF0CwNObhxNWJpuKxA/Ld+rXn5f3+gfRqCQmIdC/q35vSgYa4NNjRosSTggz0/Tc3a38kf1LQnAcxhhtc5Q51EeYFLmFPbuxcwtWL1dABX3REYbrhZ/JjdOJLn6TYxcIjQk9yKWdITnLvWEqYJaUto8AgVisPYJXEdq1WovBomPhmTs3D4yPefEqyYFrDvt6YnXezizc+Ie7gF7SBNZwjlzH9+ojVe3hLbzyj0btUGyxLtZutoGfeRNtmdoXbdb1hwdAy/y60flpEpLsu6JDzNbffPAfUlnqJ2ZoapmuAjaQO6ZKNC49qAt1XiulGvF9li9tSgxHxS08ZaVB6uMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Guz4B3wkYrjO8iHmpGW2eLlDpCjlWXsopJR+jjYN/8=;
 b=yKs8TNuzAmxqfgHm8wx7NWvC/eEEu5uNkrsnhb94ee9WNCH0AHPrjs6Et4HgHOTDAKVy6q65/L8P9J/+uViiut0MWoeh/l/Aiblv/48DMNx8dYw9VVgv4FhjTPsy/VkxkORZt84AYWRhg2YvgcEY+9PhiD8HZwOFlZ0dhxQTm/s=
Received: from PH7P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::16)
 by IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:21:48 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::b9) by PH7P221CA0060.outlook.office365.com
 (2603:10b6:510:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 02:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 02:21:47 +0000
Received: from rtg-jaguar-KRK2e.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 20:21:45 -0600
From: Tessita Thomas <Tessita.Thomas@amd.com>
To: <igt-dev@lists.freedesktop.org>, Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <Tessita.Thomas@amd.com>
Subject: [PATCH v2] lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission
Date: Tue, 3 Feb 2026 07:51:24 +0530
Message-ID: <20260203022124.542472-1-Tessita.Thomas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|IA1PR12MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: eb265d86-48be-4693-f6aa-08de62cafb82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K429+EJ6ZrIhvIbiEUSBarzOGuEHGjRB93speH/GZ9vd7th00tL4cB9J7eSa?=
 =?us-ascii?Q?1YixCPU2Elh2YG+gCsIdVBCaxn5WGMtKeYRLy30IbmFJhTuocHYEK2Aks2eN?=
 =?us-ascii?Q?+y4q3AwGkC3qeX7R0C1MhDi0JEVi7X8qdJEt57i6viIkPtD8Gx3HxpQqjgbZ?=
 =?us-ascii?Q?p4nfdQrDSJ+l+NLVemKegvYj/eTkmU0SGRVnPuDUngHf7oGeW1UaG5t3+kDP?=
 =?us-ascii?Q?C48rSYpNNTrtMOWK4LXtUGYvLDKwj/iQTthxP2KTDhmPxk8o8YT3xwTeuMyC?=
 =?us-ascii?Q?RG+Yj5+oCp3ZI0SQPh4wPaSb93pwbvOzhFMT76aXWQa6Cdu5ufb3GQpewcyB?=
 =?us-ascii?Q?HsXTBFsAg/oGGIIC69xPLrOiKrpoAffrVncQd4YMgvIpU8cGqCDaemUrikCo?=
 =?us-ascii?Q?17qDag3b9fY2aIUQCldADTlD7C3+bBwMIU5Z94Q2X8r2UR1wqK1TdEullJ5m?=
 =?us-ascii?Q?HGeE8ggMWg9bu8ObI7HR6IOe+bJllzIndlFejfR/XNvw4aLIUfVyS8aU1ifm?=
 =?us-ascii?Q?1a2CCe7UgvunA0+AQLLSWOwIw356hT+SmYnrsu+bwaC+GwMqBRV+X2XbuV9T?=
 =?us-ascii?Q?LxYmVslt6VTsra8ILJJEW+bhjFM64xa4gwG1ArNpbHyY9SfOITf+vhsC88x4?=
 =?us-ascii?Q?WsGw6IYXGMx0diY2R6PwW25p6u9CkW6/pTrNMjDWwuqt5jdFwhlNBBcYS11W?=
 =?us-ascii?Q?TrUWu63l4pDv+usybYNbhKK8xUq1VOnCJPByXI29oF021Cve1PUPbHZ0YJ18?=
 =?us-ascii?Q?9Y3SjJD7zculX7YTnLXt4mUVI2TuwfdvmN8seoGLFPZrQhSGfKWvVKiKSD6k?=
 =?us-ascii?Q?jS5W2V4OQoMbK7nvJbAX34oqa+1UPBbj7G9jncm8hYavij1nz/kFw+2UbDuj?=
 =?us-ascii?Q?T6OmGh6HxBPxDy0Y930a5J/OApF4Zjqf62kULKzFw1LoZScyiVDnCMYli4Dv?=
 =?us-ascii?Q?J3TDtbrlcttyUH192wgtZxCAb78g5AeJr2u1ZUSvtrPsgxzCQWOqa/v1etY2?=
 =?us-ascii?Q?hlcP/G3rje6HypsfdS+ESPoc+qRiuW8/hDabND/axBXLF0m5iEFSC/Mbw3AY?=
 =?us-ascii?Q?i/PIMqW+5rLfR3Hy21I7pDEJha+so13BbWpBh29CDCpW35YGRjKL9bI82es/?=
 =?us-ascii?Q?OUe/6IgULW2kGIs+99Pnh0umEKJum2pTGv4IPURIDV2MPE6RuZDDt76BQiM1?=
 =?us-ascii?Q?kz1VpJHFO9wSTfCOOtlwS6SycRyjLXyDWPYFWBN+c9phlXWMlH+T2Q6z8fgX?=
 =?us-ascii?Q?0b8m9h2NqZzb0zTC/maVcAF5BaN8WfNLEyTyfySuLuGh3Htsd9VVl9H1mjb7?=
 =?us-ascii?Q?i50JiiZtL//T9NSLFuZ9TzCFZmOYkWvgdirFOP8UVb+/1qa5+z084sjLIOb6?=
 =?us-ascii?Q?+K+kwXLHHrclcIibbqFiCPgDjFIxaVBxflPXgvstwGV4IFcjrdtZQJPeaXg4?=
 =?us-ascii?Q?a4HoNPtFrQV2fZynaWt1T/zRiOzs1qJO1dJUSRVtdhjNj8m7Q4RzRQOTDD+4?=
 =?us-ascii?Q?NqHvgpVkUTogRl9QuUIqHSwbHh5odW15XhwaqYmgC71Yn/N17oGscFT3k1cm?=
 =?us-ascii?Q?QYPC6LmBbsxwRk80Gucl/GhdVrX86RmhZ9WxKO/YzluLiXpJ4kq+4dvx6yJd?=
 =?us-ascii?Q?P4Yn8fZaMDNRgEEEt885D8Y8r+QVGTZV/SaXrQOH13Yn1+ljdv/bL/46POt1?=
 =?us-ascii?Q?VLq19w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0Q1/KJRBjVJ7uOoBwqvEvmcJZIKdg9F4qdE4nBRsyh+s0weksWFsaD9hUMn4oDFXBeyACyCuDQQYAOGgMhgin2RrRQmIT0zLlH3DcwW76MW0RcRF+aNXANDaQVsC+JZDZq4Keo5fM7JyVrJcU3s4POM1N1RP0MypTN5wSSVtdsCzJ+fLFjTTgZ84zTqKl/wXhwxbOTaQRjZoClNDz6l2HWbdqfB3P06ld3cERox3HzNyC+mVic29bGJc4aL57aBKml2urQuQ3JvzgybWlD1xvLx2cUOk3pjc4bLR5p1ybq1PH8vpdCGBlhTTgeP2/MF5ugVoYp/8+38Z0ls6lJWtcwyZg772ZCVmY/s/aFkga8yZ0FxxPnw3lxeqQHg0vzlTp3JlFlhJpPOvrWadjDS+RmoMlQGR4avsH0+qlkFfjvutPf6ai09deblglZOh+jhZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:21:47.4427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb265d86-48be-4693-f6aa-08de62cafb82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7709
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

VCN 4.0.5 requires the IB buffer to be aligned according to the
hardware specification. The current IGT implementation does not add
padding for AMDGPU_HW_IP_VCN_JPEG, which causes submission failures.

Add padding logic to ensure the IB buffer is properly aligned for
VCN JPEG workloads.

Adds explicit error codes and bounds check to avoid potential
out-of-bounds writes when appending NOPs.

Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
---
 lib/amdgpu/amd_mmd_shared.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index f504db596..c6671a280 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -2,7 +2,6 @@
 /* Copyright 2023 Advanced Micro Devices, Inc.
  * Copyright 2014 Advanced Micro Devices, Inc.
  */
-
 #include "amd_mmd_shared.h"
 
 bool
@@ -161,9 +160,29 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
 	struct amdgpu_cs_fence fence_status = {0};
 	uint32_t expired;
 	int r;
+	
+	unsigned int padded_ndw = ndw;
+
+	/*
+	* VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
+	* We pad using a 2-DW NOP packet, so the initial ndw must be even.
+	*/
+	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
+        /* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
+		unsigned int ib_dw_capacity = IB_SIZE / 4;
+		igt_assert_eq(padded_ndw & 1, 0);
+
+        while (padded_ndw & 0xF) {
+			igt_assert(padded_ndw + 2 <= ib_dw_capacity);
+
+            /* 2-DW NOP packet */
+            context->ib_cpu[padded_ndw++] = 0x60000000;
+            context->ib_cpu[padded_ndw++] = 0x00000000;
+        }
+	}
 
 	ib_info.ib_mc_address = context->ib_mc_address;
-	ib_info.size = ndw;
+	ib_info.size = padded_ndw;
 
 	ibs_request.ip_type = ip;
 
-- 
2.43.0

