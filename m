Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7265C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6242B10E253;
	Wed, 30 Apr 2025 01:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qNS5SR0S";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F6B10E253
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvx8rZe0V+wh5IaWR+9fIXNh+YVp8Geuf81znBovu2/mQy7zkvfJ7Kj0v1FxKQZpbVTYQWThNX3t+QQbfRDc/662XYwmKsCumGk+e4wcqBJ3fKsh55iqgAWq3XQU3iO4hOWwGtIdCEXnokA6eWhWc0yGXTxT02iwda/3/gf8Bk8R05PuqLWe2eeOowAxc1qp0YBYuN/GxsCihjUHhMvKWTi67NLDdQotFYtVFFpsgUD9au/LPJtGt+Xx5OvdWyeq/EZSw4wjAXU9rkxBC9rHPYlJ37QxpGYhL21G3TPkBqbTykyUU8yyVFspgvfWOHpxjFDv07om7baFRUd068+g0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=jD4wJEAvnbIAfXhwJT9lPT9unqNkGm+h9SEtc2Qe7qbRLAZnokSx/00pVxiT+UzVMWrGy4XmlSfFXo/yMZoyN2eAeGGyb081PoI0euGf0MVTnvLq21IqGMpP8XYV1ERNCsfj/b0E0FEATHZy5jd3vtjESNSNeBv+TLODhe894dleUA3dDueRh8U1H5B140ik9lxNOu95h5EsiJIhA/IsU9p+A4c590rx8oVzGsaD+wOgzRC1Mz4m7/+0AnuYnF9ec2O0UXqco88pjC9UQxgh3NMW/CZ1DWFqC5bZ4YCqP7dxVIYkIZwCqEo9PNRBp21/XBYltlB8TAk5EgzOM7kZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=qNS5SR0SNI588rWqWWn7du2gg/HjFVoCuIF/q4h2yw9eq2Ld7l0oPOFESARvjQ4VXXEFwk/Sn8mGBaKx3Rvh84KHVK2tmY+mPAjQKbOLO+jgrhDKIAYU0lEjvgZuqiNEQcxAJxN7lW3wXpvlBEpW80RsI26hl0a08Z70SKKOrwg=
Received: from MW4PR04CA0130.namprd04.prod.outlook.com (2603:10b6:303:84::15)
 by SJ0PR12MB7474.namprd12.prod.outlook.com (2603:10b6:a03:48d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:35:35 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::5b) by MW4PR04CA0130.outlook.office365.com
 (2603:10b6:303:84::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:35:34 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:35:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 01/36] lib/drmtest: Add is_vkms_device()
Date: Tue, 29 Apr 2025 19:34:19 -0600
Message-ID: <20250430013454.226910-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SJ0PR12MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: e0946665-3ad1-4972-6d44-08dd87874da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KjG755z0xQYgmDGavPvUtPLsPLube19lalEYYUbEKhVif52Fs4fnbQb3oHzA?=
 =?us-ascii?Q?zsZYxJ/Q9BvfCxPkbqRw2BqditkT4DgoUyP+h8aO7dxN8g3j8tJrwzZTs5nD?=
 =?us-ascii?Q?Bxmxh60Wj3pMJFlLjoicQbk751/7s1OxforbNJQXNq/79s2eBCXT6hZd2VA9?=
 =?us-ascii?Q?Kgs+HydQCOSqn+p5EE/8UE5FYwm+Th+j65duzvyGrhPa2sJMFHOzvatEpIp0?=
 =?us-ascii?Q?zxMhhe2gJhGPFzm/R4BGMClbm9c6DR8eG7kBwAjxXm5huylNUl+jzKeyUuWJ?=
 =?us-ascii?Q?oJ5HUUlNHZ4cHToOAslUp/oe5h+VEmhEfzRcj9VWg05OHQt0lG7HCxbB0Sgn?=
 =?us-ascii?Q?gzgNZn4EqO2ZwundUj7F97SGA9Kwvdw5jqJCWiaZhb3llsGC8gm0m/3lY37y?=
 =?us-ascii?Q?fDzC+m5r990PwORhhva90dhX2KRgb+eTqCij+oBCfOnl1VzXSgON56QbNG/7?=
 =?us-ascii?Q?u5E2UCmu0dLhxGSLio6buj+R6T9o8K5GHMvxTLxacvxNlkoSqHV8PkShuWwi?=
 =?us-ascii?Q?64Nx3usp4WnVkh7Lmn2uMRTGCwXZ166+iDCr4dS8q2ydMPjCQ+V7n3RjJUMG?=
 =?us-ascii?Q?MgmmtlUilcsgaRPJhoOQ//xvyv3Y31snzNsob3ln2C9H6iy5Db+pMbWeWvFU?=
 =?us-ascii?Q?+yEVJTZTM4L2mza9Fs1iDKzn0YCu0m/Gbo0MpznIK1ztoo3ocBPiE/XUoFLS?=
 =?us-ascii?Q?OAsbtVYWGTP++vKG1GPyjgmmB4qTnv9jDlUk1bM2obQxBw25ul4JVVHD2FyJ?=
 =?us-ascii?Q?Nbx0iJ2D6AHBNJX+c/ce55nWJtFxwdQRrIgxa0M22IcnbiRMhfbNkxDE91px?=
 =?us-ascii?Q?qnbFXlFI4SWCWJSUAFnXHYwUwGes9QpFgtomoTBuEDeVcEc5v59YfxNNtVhX?=
 =?us-ascii?Q?yLH1yQOemnfjdyf0jDVqNQIKTCjbtH3UI/iAF0WJj2wtZVxyJ5HfZKvx5iBr?=
 =?us-ascii?Q?PPFiQ4Th1YOLhIebZ3UGcxaRJPSx8Zieqs5hoIfYVvoQW8xEXzRW0Vy53Ew8?=
 =?us-ascii?Q?Jyo+g6oy9ngncsfrL+f6HWLcfv48sCtZ2p061Yp+iIyMYRkcSagf2x+aBbMF?=
 =?us-ascii?Q?MnucIg8+WN1tyPaMU4sQAPPicGB9gtrl4dLQXUbmxA7vMISNNbdyg8mSA+pl?=
 =?us-ascii?Q?Bf0GL+CiIIKwlRYickrFLnuAOY+6ISqa3RTH9pXv+Zq/fJW19yla/QXM9MYB?=
 =?us-ascii?Q?IDlfxWbXdVQShxLLujI5h0ElZNsJ58HjVkmHcHq+3WWptlBMScj7DE4t6kjL?=
 =?us-ascii?Q?ftDlslODYjrZyPFnAq/baMSDNyhz3CyA29WRrBGutMDD6HwHggFt/wdvvGm0?=
 =?us-ascii?Q?G4cnSfuQgMooHTOxVzTI0vDbRdkVBoOm0h2oiapzUIN721w+Mjt4lt3Q0Xpr?=
 =?us-ascii?Q?FcI9cvgsncCzb0D/fDKhZgQYP64m7wNR1wGykeRZtAhz58ZndRxGF82Q6Y+r?=
 =?us-ascii?Q?8jisYLg/vrQkuZh3DZVHge7Bx1zO/9q2Vf1gcoH5DQVx7Jl8Hzb5XSV4WwHN?=
 =?us-ascii?Q?8cDHDIZSZiGobX914f6ijpTQ/Z3vGMLthfHN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:35:34.7753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0946665-3ad1-4972-6d44-08dd87874da0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7474
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..a3904083f 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -118,6 +118,11 @@ static bool __is_device(int fd, const char *expect)
 	return strcmp(expect, name) == 0;
 }
 
+bool is_vkms_device(int fd)
+{
+	return __is_device(fd, "vkms");
+}
+
 bool is_amdgpu_device(int fd)
 {
 	return __is_device(fd, "amdgpu");
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 27e5a18e2..b3d53f252 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -136,6 +136,7 @@ void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.43.0

