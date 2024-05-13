Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97684C25B79
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 23:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206210E351;
	Mon, 13 May 2024 23:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KMOiLsOU";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1010E351
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 23:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkWlwim/6O1c/PxKc2R6l9wUwwT1/Q8pRC+/z59+LcFXazqLjRmNiklI+wyLbF56yrU3fWDA0QVskp+8Y9TvX0Wg9A9NAlyPo5IHvBQy6cjaAr1e5C47pA0XtMdlZVys+WtdSVI4wp48t5ejhBafsEC9whUuejqX8pNDEh/fPVCf0smkYKF75DHsXMe/5euflqV7Uu2caT47/StzwKCKxZZ2cBnNb0CcHYd6W0KLoVvePRor1XYWpxspd1T4ikxd5WpVnGO4ugfx3mmge0gElnByQzc7zJffXBnyd1RgrWWZ5Xpd1EFNp9z1QsaUHtSItx/q+5g1Cvh1bRx8k/bMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhHXgb/UFtFlUG5vr/uvbQEe56e1Ida1GbDZh/XfuC4=;
 b=mPapRRa69gV8RVqaMbm/EW+xfJk+uwlf5FPwxLQKV2UFUXCPbs0IdXialZBDpkQvY3qkU+sd99ktBS/nu+8/8s4U+c/2whn4hX22bjpwGd28ySdxyeCdbMCUdnNS3vygMmXDI6nlooD8xlemrd1+qpvGD3/9lGYX9XIfI92ganYPctut5dKpqXpaGBuk+lBxJFf7xbZsEWvkMnY0ZJF3uOZwjoZhQi1aR/II+KxNPdCEV3BP5DGUUlJ9g8A1pTPLMhprDpjfd45PYqZt4BPzx2U6kDNtowi+cNYveb4eELYGNw2k8UU7UqZ7MTyI5FMkcXhW4ZAli0GJLlkTPWvbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhHXgb/UFtFlUG5vr/uvbQEe56e1Ida1GbDZh/XfuC4=;
 b=KMOiLsOUbbDgJwEQBHik3wjnWzH9QN6LB4tYqNOFTHV50qfVjX5zb7LVbkG4wS9X6fGXvaUo/i4OCHWFwngOd6wQn9hhW+4bu3zZjPYqIXx/hHK2aBpaf6tBM+Gbie504Z9kZbSuWpBuks6Zf8XFAlQODQHjQkbYex2UGAXRf0Y=
Received: from MN2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:208:134::41)
 by MN0PR12MB5738.namprd12.prod.outlook.com (2603:10b6:208:371::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 23:04:08 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:134:cafe::1a) by MN2PR16CA0028.outlook.office365.com
 (2603:10b6:208:134::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Mon, 13 May 2024 23:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 23:04:08 +0000
Received: from moon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 13 May
 2024 18:04:07 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, <quic_abhinavk@quicinc.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_writeback: Set atomic and writeback_connector early
Date: Mon, 13 May 2024 17:03:56 -0600
Message-ID: <20240513230356.695515-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MN0PR12MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f49f9f7-7fda-4428-1542-08dc73a0fec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e+Bf8QHLbse08ovCBl2zoK0un5Bbo9qNjXKW/TupzLJUDqIBrGv+S58K1zcX?=
 =?us-ascii?Q?8EpN1CQRJdcWe6SKL+BO4ejVLueogRzaaT3k1jNEvfejFIyl3/SgNN3/Qj4t?=
 =?us-ascii?Q?Dnw/0Gq/kv1hP2HrMODPUQEvBJh2vv/aXh7rUyM3C8nDfG/LhHn38mYnNYBw?=
 =?us-ascii?Q?l2cq8HNALJbcR07HOMVv7o3HuswxyT856HscIReUKzSgF9lQKGtfq8jBFNVm?=
 =?us-ascii?Q?L6QJPz6Uh4MiuOBVO/Ee7fXxysMebD9D1Ptpj5ByyILhc+X0PHWvS+TcmyTh?=
 =?us-ascii?Q?j3OWnB1WNIBR8weyEVyN1cya4A9+Xti7qbTjDQcQqjDlg7wKBgItXAKcqMyH?=
 =?us-ascii?Q?7egDa2gdFlHNiDkXqOsBe9IKk6R0RQM1f4nJ8GRuVnHWIqFeBX/o1IxoM1bB?=
 =?us-ascii?Q?mSr4ZHJswUH5tc0YaCL5rdPfBjhXrQjpfJqDI26bUPMMcjz/3BL/+eRf6Dc5?=
 =?us-ascii?Q?FaTks52/8VB4x+Z8i+IraMdT6K56MvDjFX52WtqiZ5YbNfo2oIcd1jdPaa8X?=
 =?us-ascii?Q?0xx79V3f1n4P1rjmOlhvbg8iv46ENtb+QBj2eKHLUVBK3REWO4QG8UKdYNSX?=
 =?us-ascii?Q?aCEe9helFqjABldmGPe2yKdlKBA1eqbmN7pBBFq+xd8GFZkRSjASOx2bEVHs?=
 =?us-ascii?Q?Q6zHVaJ9nVb1SdG/3AorTZAzUNMNqmkw4tt0pyxj8lQWrz1ZAk2ZJkUYVcCP?=
 =?us-ascii?Q?L/LlWaeWAzx8DeTasBY3fGYiLHjIb5c05DNIvbwBkwm+1TjxaPTWbUH0MITp?=
 =?us-ascii?Q?FnEjzsXkfBQwSI+GwlJzS6Epq4iJ+LVrme/G771jm8bPzJVNGindSY88h7iS?=
 =?us-ascii?Q?82g4NbWDW24LDDhuQDnRfZoC/bBXhAIGEAg7Kjnx12iEW5vHU/MnNIkVOVsw?=
 =?us-ascii?Q?W7F4SsH/ieibHgVClOgv7c7Bp6PhkuEKbOZxpioX1w6Az4k5c2kCtYVGeLH5?=
 =?us-ascii?Q?U2TiXJR4fZNQjSJaFGN6UD2+duw07OzW5ZBCjB89DUd+Bm0qApO6XSrcMkSQ?=
 =?us-ascii?Q?OroRtA7VsiWUI+7HSMZpSPSmFZJrMc74FtUub/x2SMjmlgwRMNYPHn7Kg9n4?=
 =?us-ascii?Q?eBk3LSKtt5hgnS19MXeLuZHiNuUvO9BHXD+ek7ijy+2LFxrfBcdjGvAbqFvf?=
 =?us-ascii?Q?xXmfJk6IW0QPLtg4ca+LPOabPuBRH7R0fs4dFi0MZuzPvXmtlfXhzJWj8u9C?=
 =?us-ascii?Q?Uj2SAoW5+yIMW9iMU/RokKszuTAJi4k8SqU5cOgjEnnyGK/HbiyL6HtGLeXz?=
 =?us-ascii?Q?SiiUNHcZlgd1eR9VZT7VgjjzLurfJe7T9xt9H4qz/Q9no20pM9nCA5hNj0cJ?=
 =?us-ascii?Q?TzxqST91jQRurW8sSENH9qL5mdMTo9Wiyso/kP3mQM/0t1tESJXB2Kt+9OfA?=
 =?us-ascii?Q?3hdkNWo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 23:04:08.5695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f49f9f7-7fda-4428-1542-08dc73a0fec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5738
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

With dc2d7fb4f978, all kms_writeback subtests are skipped.

DRM_CLIENT_CAP_ATOMIC and DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
need to be set before igt_require which initializes a list
of outputs including writeback.

Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_writeback.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f89b2d62f..65d4db26b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -567,14 +567,17 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&display, display.drm_fd);
-
-		igt_require(display.is_atomic);
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			display.is_atomic = 1;
 
 		ret = drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
+		igt_display_require(&display, display.drm_fd);
+
+		igt_require(display.is_atomic);
+
 		output = kms_writeback_get_output(&display);
 		igt_require(output);
 
-- 
2.34.1

