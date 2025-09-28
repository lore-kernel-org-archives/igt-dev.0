Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6C4CAC5B5
	for <igt-dev@archiver.kernel.org>; Sun, 28 Sep 2025 03:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58F210E02F;
	Sun, 28 Sep 2025 03:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kRijJfVT";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8CB10E02F
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Sep 2025 03:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdxOrnES8hhz5/rmg0hZ+F6DMuMgs4J9Kx1B4LEIfOs3JVQ5hQQd9TdXJJAI4w+OmBUYkAE0axWajSEXIOo56KZ4GBbaGHWddcPa/4H7EKiGjlbkmvEHd2tfoJkWq5fekhvXcmumCZ9uxmjyBew49NkIg6LbZo8YddNIfPXf9WPeX+XPO9avRTzTAQyp5mR+vX7O4fb3xsW8wVnQz3KYbc0qumtS90r8gHuvWHrefboLiCmGfAHmFFzu/VWdHhAl5l0XRiTDLNKRxWOMlalbT4BthjEoouY0Gi5YyNAMSsSr5Py5vzYP0hXpkiDTFE6IZc5/9NAtiCcBwVzfDpTkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q41S5Tkk68/L/apIDypzcjbOhc0sCiNQrpOrciMZ2aU=;
 b=h5GKXu0KCgcU9maQ6TutagvMyL/46UcZLnVprouPJDqsUKeH0yNmniAUMjR/1AimUeZya/xvswf4XJvwGIj2sF3+SdyBIECrXjDxrTMU5QnvjL1Dy+DRPzKKpv/9qSl2P5K/SSZnEXkMlnJ2j8E1fK+H7yd3l39BWNX5dl55h1d/P6UEA6HaFAalANTTfSGyPTE4g4puhzkEb3pTin3JEJbRJn6pHgprTdx/dvJDwkEXAiHTgfuf6AVzoEvMwUrcK+txRi4of2Oeb7QJYkLKyAZkbqFA655ecBCHcYAe0kByJkVZ5k8atsUkuvohiWUEnKcJEJEbTn2KsZI6cr2AAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q41S5Tkk68/L/apIDypzcjbOhc0sCiNQrpOrciMZ2aU=;
 b=kRijJfVTfD2y1HPiu+6Yd7yU1b5WSTqgW5h9wXREsBDi8BKauoXbo7iZ72kQtgQa3JnXNLBto8XwgumFtZHptAqQdXEuFqXz+p24UIgyWm4AVLePJ0Q3GynU/keWxTB9VX5JFReUCT9E53Q7YN0Ew8dhGWeBGcTiR7qZ2Im2jjE=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 03:18:16 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::f5) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.8 via Frontend Transport; Sun,
 28 Sep 2025 03:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Sun, 28 Sep 2025 03:18:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 27 Sep
 2025 20:18:15 -0700
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Sat, 27 Sep 2025 20:18:14 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] lib/amdgpu: Extend JPEG direct register support to
 version 5
Date: Sun, 28 Sep 2025 11:17:21 +0800
Message-ID: <20250928031812.3006673-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250928031812.3006673-1-Jesse.Zhang@amd.com>
References: <20250928031812.3006673-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f53002-d31d-4e56-f458-08ddfe3daaad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XOH13OUCfBGzaFq4Whig3a8BIMGbKkG7LVM1fq84ynShIbtfJzmqMQjpI6O4?=
 =?us-ascii?Q?jSzN17aVgifRn0bHcUFs2K61yqch71PCbXz11VPoxW5TLmFiBibJ/tEbVEWG?=
 =?us-ascii?Q?FavCQ+7e1+WO1QObP4uoc4EBt8Aqud+sH3A2FkP/itQwOY8ECGkBbzU612MH?=
 =?us-ascii?Q?UiOoDbi20J/8S3Boodtk8jkKn4JNt+0abKfXuCfLeYI1m0cQDksnJQ60lx7l?=
 =?us-ascii?Q?RWnETIahfbkWf1FsN/7mLXes4cMomG1AoBvSUMB4IjOn/x56JmI96RdV+zR/?=
 =?us-ascii?Q?7QyEwYX+r4YWPce6uFPN6OV9YvlyR8s0Yw63XUHD9AcsRMeqMdi4eFenjg3l?=
 =?us-ascii?Q?8ZnvOwFhA3CcL+cZQZFJFr/OlL22HwCNDP3lBkshswQx3bVEWy/UoKGZt1/o?=
 =?us-ascii?Q?2gc0xK4lX5F7hSg7hU6TTUwLUDDY+kq2JZVfZgYytOg75mClj2hhTndR1Gdc?=
 =?us-ascii?Q?BKN7KrjvNYcKZKIJWIw7/1KivxwxABl2b6di3Kpv+JUR+kikTBjlQKlkgKKq?=
 =?us-ascii?Q?V0bDXZYsRGG0a4vkBrJjUvnDQh1mVolM/hdxSzEcdzHnSuXhbiwdlcCjWAZc?=
 =?us-ascii?Q?pHHmNL6loUuxBVIjMRyjN+E+t/mef5g8pWY1k3uJmOXMi1F+ztP+xVGt6b+9?=
 =?us-ascii?Q?IySGS5f8AEeSsRj69sftx7a9bmAv0C8IiQNCxxv0rkQ3QkZCQUn9AWogRd9N?=
 =?us-ascii?Q?UyQ3+2hBRQhWxbAhYYiW4pLsM5gVLVuirHGSU7+A3FW2PlkRZ507Oi8vAAts?=
 =?us-ascii?Q?iadZyVbIJeccwsFcsf4HkxdJegrSIbJF6AeMZLZ6XiK7dGT3Rh9xmC+Wxzpg?=
 =?us-ascii?Q?gULvKLjB4gRA3malIZRW8grezWWm+8LQMInxwOrGUTYJt5N4xY3lnkOegChX?=
 =?us-ascii?Q?ah/Jd/0V1TARGEE22dE16zmK8Jh1sQst/q0AVVFzCRDDOoknO/p69RddKPpy?=
 =?us-ascii?Q?g9rYipKymVHMN0HQFNcvUfGbGmtYGEqA06jEBoOp7A+SkQv3rKxCHDQ/2uQb?=
 =?us-ascii?Q?Squ9ke7cpkPNhBXsgoP/pXO00BBIlrxPHPnwwCjvLTJg15u2ZMQ1T16fb7df?=
 =?us-ascii?Q?AOF6eZrG7860Kyu24CBpFQQeM0nbPiUXey1ai8HaGspy2iTz/Mhj2iA3tuy0?=
 =?us-ascii?Q?iXi+1s8EER5xfTG7+jpDm/IfD90VYzeprbOzbJfqanS3zipWQlWWe88TpEUZ?=
 =?us-ascii?Q?VR/twE0GMUVwhm3IaRMIxNEqadaspJTIJlvYFqRniON220BMeTelqzZ76fp7?=
 =?us-ascii?Q?L9zVMjwSlEEb7B3wGHe51FxQJ6QLx3ntWrZ7Y9p/ba61HIdR/UEbS93C3Yy4?=
 =?us-ascii?Q?Iwl77uqyCuuf9i2v1zmYuoWZ937NK9ha/CILMvC9vT0ker3iPuQbtKRW20oS?=
 =?us-ascii?Q?7Z+zvcVeJLVSbG9UEb8uvqDeUQu2zyc1mCsS2MsOtgyvYRgInb3rrgrprXr1?=
 =?us-ascii?Q?yi6sG1qs/oWqlTv8IeZu16j8yY+HaLvbcLghZZE2qW//dXmELHg0rb/XgCFa?=
 =?us-ascii?Q?LnWbDxSeyGPOiEpyMbgE8BU4T1PA5fU21o2FCnFwW7Ym6Ia8lmQhONL/+LxZ?=
 =?us-ascii?Q?jAEIrnhm9i/Xy+DhpFA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 03:18:16.6050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f53002-d31d-4e56-f458-08ddfe3daaad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591
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

Update the JPEG IP version check to include version 5 for direct register access.

The change:
- Extends the condition from `info.hw_ip_version_major <= 4` to `<= 5`
- Allows JPEG version 5 hardware to use direct register access mode

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_jpeg_shared.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
index e9f673a42..4c17f89b7 100644
--- a/lib/amdgpu/amd_jpeg_shared.c
+++ b/lib/amdgpu/amd_jpeg_shared.c
@@ -22,7 +22,7 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
 
 	if (info.hw_ip_version_major == 1)
 		context->jpeg_direct_reg = false;
-	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 4)
+	else if (info.hw_ip_version_major > 1 && info.hw_ip_version_major <= 5)
 		context->jpeg_direct_reg = true;
 	else
 		return false;
@@ -188,4 +188,4 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
 	/* set jpeg_rb_wptr */
 	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
 			(JPEG_DEC_BSD_SIZE >> 2), idx);
-}
\ No newline at end of file
+}
-- 
2.49.0

