Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D66AE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 22:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4810E17B;
	Tue, 10 Dec 2024 22:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zJETdXp7";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C6B10E17B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 22:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fckOn7aY7xT7tFewlJynilfplGcEwQZG9xYgChVyP+JIut7Y4gbgGPWyK+EukcZtARZdepo/1H9mD9HNQ+6rAg18h1mq5513WxzMKYErbyBLrUtKIUl33KpC6oZ8WcWOBheL2LBJkRC08CEsSZ8Aq/MT4F5Eq7snRZ7Ljkk3S8CV3MpkW7fxSRX2i6pvNhqe2VTMvR6yK+mNCD/knZidQDI2u0tSQUhgJ/8rDKv+OHCIC/VLFoBo1YDP6ma7+QUriL4tsF6dlGamvO4OoSoVf7DLCRjtz7Ga/+oEztW76DeRhJ32E2CfZoclIo6EWo9tUJWJsOzCD2gzAOOpWYs+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySS3GjV8B3TUa7luMSf4znk5honz0rjzM5T78V/PXDw=;
 b=w5K2fol8j0rI76tGcKxJ8iGGV6OA2pC3M5kuBN1YZrvZ/kRsEZTGy6uyrpSVajuHI9/2LIBA47d4EAhH3UXVP7ur1lk11roMERV8IotFFpU49mbkcuWUl3b/kP/zLFQWn7w71D996hCyUaNG9Czm3iJgFTq24pKsLaJwk/3AvDn4g06vGkxhZ9wd9PPWyPfanHL0w/vd488iSX1jWMZ++IsaHcW39nzlnIfml0QdseHxbwu4fXOcyMYRKRvSuPLKTeUpdKrWD8VM1weCA8LumR52kQC9cN/PDWjxB7jdnlCxK26DWpp/Gk2VMpRK2THOcpDzpss5ZxUNOAzL92QuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySS3GjV8B3TUa7luMSf4znk5honz0rjzM5T78V/PXDw=;
 b=zJETdXp7H/mzV1dc32fRzD0QGD9FiPjmDbBfWkffGyt/0TgEI7DDosCZW0A9deqOeA0xTQtIlsLjCTpOpLTkUDIvFeV4H1vxs9xpy1V0bo58jEp0YG2a8IoyfsIBT19RnLjkI0RK7eJBWCr54IaEND21GlzkJOWvpwYgnugkyBU=
Received: from MW4PR03CA0243.namprd03.prod.outlook.com (2603:10b6:303:b4::8)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Tue, 10 Dec
 2024 22:39:14 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::25) by MW4PR03CA0243.outlook.office365.com
 (2603:10b6:303:b4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Tue,
 10 Dec 2024 22:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 22:39:14 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 16:39:13 -0600
From: <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>, <alex.hung@amd.com>, George Zhang
 <george.zhang@amd.com>
Subject: [PATCH] tests/kms_async_flips: Only check joiner mode on intel device
Date: Tue, 10 Dec 2024 17:39:03 -0500
Message-ID: <20241210223903.954518-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3886ba6c-60c6-4726-b122-08dd196b7964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BHS2gAfJgX4mD1JU9TUmj++xCnv9B9W4Hr6h2LzYVCsI19Ex73F6KPUoMg1f?=
 =?us-ascii?Q?0KRSF8SGQ47FQX4oSZMLUPDSmitWohpnBFpIfL1/8bhnO9u2/DEwKTlh/9hJ?=
 =?us-ascii?Q?oAlu3oaupB6NZ8c7G7jvRKIKBGMMQsY8xQpc+VLBMRExiq0XNDzrgrCGDisc?=
 =?us-ascii?Q?sKbXq+An/IzCgDtua6nnzgLGNIOSADBVr0rxREARJr3N/bAQpT4QEROo7vjg?=
 =?us-ascii?Q?0iC6PJ7qA+waflAX+doQW2rAbbDeVY1yBdtZmK3czhmWbPZrclf/SeD6BJtQ?=
 =?us-ascii?Q?t8XrIjPm115SX+OCk/CUEuebG5TUu1LFqmWjcptUiE6y0LpmyjmnJepiyYWu?=
 =?us-ascii?Q?+KywqC8aahinI3DnnTgU+GJlCYGCg2099e2sKmHY/+HHLVVvx4Rmbfdr8cvQ?=
 =?us-ascii?Q?Rqz5FgMhOKkoz54+KkFytApP1akRkstkCOwZKO7T7gmkhQzZplhcyEUTf3uF?=
 =?us-ascii?Q?G9AmKFsI0K4sfa4QFsBh46kSwuQTrfNzZ3xgh+MWqg+99DVYvuuEduaJU5MS?=
 =?us-ascii?Q?j0J8SVY0Vjiw6IqR8gKRS9YpOl+SPGZhsXxfnoENnW/L008QgfauS001mRU0?=
 =?us-ascii?Q?5kCVsfGwxUCx2UXJYbCiq05HF+vyi3djSUgaYyd7PRNQ6azh9iPCc2bvyO93?=
 =?us-ascii?Q?d2PX149HKx4JnyyQlUwrJzBD2sUmqlUpaascrQP5IoUTzAiSsIrOWxP5hOl5?=
 =?us-ascii?Q?r+ZkOluMTIBpgg71P1efuwqRZimg0MXaMRXtEo7uEk1ypKTtT0wEk+JoUGSI?=
 =?us-ascii?Q?BKps7kmEbL8r2GtiK+c7L8NZ3CS6UH7FUv7DdUg0DMv8mUQVLZ7ShxwlbDtv?=
 =?us-ascii?Q?VYLy2RDPu3nhHaSzjwZvAVvczKtrai4A/fBek7L80VNBJ90ggZ+/jeNYoRH9?=
 =?us-ascii?Q?X+KS0TXBSmhdxh2KnK17Hr+ozxwEnsJdvwobd7FFO6CXPAof7XG60B4q3AsP?=
 =?us-ascii?Q?o08t5m97mseq5inbBwrEVa26CkwseeFWrPCP/Wg6Sw0d4gpvvOMg9qMf/dz4?=
 =?us-ascii?Q?LKyoVk5Mbut8LRtTf+RgD2ncWNCrlIwAAc48fjVZl3f4Otbktz2JuIa8p+kN?=
 =?us-ascii?Q?Kwg8/5xgaeHCYxI0QXhzR8+R4e9ZpD0D+3A1B9CUedyYNDldd4O3NuGpc49B?=
 =?us-ascii?Q?zm5mEtpK/EKBp6oIONc/ALURBiavwI6cJXaJ23/JPfu4XPWuy4OvM6mMQNJt?=
 =?us-ascii?Q?z7VDg95fbeknROfTlp7eD1Urwfa/gJRvs1STXhuOtGpitpzon0qwqTql3/sM?=
 =?us-ascii?Q?wxmEMnjPzdkUeJ4L0vneP3ndGceIA3Y2EGuhifz2Z6uKbpBuDOvZ1nWCmZsW?=
 =?us-ascii?Q?mZdMZtaY5a0MgP+foUC0WLFZbxYKW4iwK9qAtRG25/x09SiPNcQks3yZ+/kd?=
 =?us-ascii?Q?T9c88mERH8T0JMvR2LFy9IDWTaSXubjVkF4wolpambioV6zZuK8zX73mPSQd?=
 =?us-ascii?Q?tR6Cwvgd6sm1Iwx1kDO770ovAD5D6MY/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:39:14.3596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3886ba6c-60c6-4726-b122-08dd196b7964
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
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

From: George Zhang <george.zhang@amd.com>

The joiner mode check causes the kms_async_flip tests to fail on
non-intel devices. Added a guard to only check the joiner mode if
running on intel device.

v2: Moved guard to within is_joiner_mode function

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 43ca2d4c2..3d061abc5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6467,6 +6467,9 @@ bool is_joiner_mode(int drm_fd, igt_output_t *output)
 	int max_dotclock;
 	drmModeModeInfo mode;
 
+        if (!is_intel_device(drm_fd))
+                return false;
+
 	max_dotclock = igt_get_max_dotclock(drm_fd);
 	is_joiner = bigjoiner_mode_found(drm_fd,
 					 output->config.connector,
-- 
2.34.1

