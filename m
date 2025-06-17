Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5CDC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EAF10E564;
	Tue, 17 Jun 2025 04:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xc6VSpqQ";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1B10E564
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhTGc2Y+1mp34p7d2m4F33z/eLHgafGvLKCSlxV3jGT+ayvWk+x20gkxuM58qSk/8MWnu6X0+ZDyaZfHDC1068DBYTBM3iNY3eYKDF69D4VY5m6nEvrNzvi/19vhjHbzR+Rd1tSR29ZzNnZxOccZIS1bg27weN3m2i/ioubd2IwdqtzhlLm/f/7q6gr4zAQf248FTmCqG5Yq83Lc+ljSnkjFkSv+3qni/ggwJsPhMRrTxNlugB0tQ7R4cD/qDiTx5i17QXlJECY9OayXnsBUFvPb8k3otfJLG9GLAyTvIwHh1MqtuF/lhi2fVENbFDl6lVpEaiw7enZb6quEolQtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96xfPjtXeyq0hZIxH9SLhznjSm3JsYhYUAeJTDpMaNA=;
 b=B35UtLVx74fOmrUsC+6VLlPtj+YQeiDwgU3BONPWy2hqGrYKoASdjdG4K+8d9+DiV99jNREwxnhdMz5U9TZ3ZsiUH2yMkwb828wonngrHACQDmbwRIac+6L4T4hdOFWnJ47CNw16W40BK/lPMMmwSFiXhhxipvl1BVsNWy9xo39oxkdRZbjwwtbb0UL9Ml7g2EM3osQhHMrbWr+BB61VWjaldxNHei1gzZHfjDG4HRdjazee77n5w4ifUFiOJakjJR1i/B8H28POYHcdTlWaz6YCOkQcVPdAqazG5b4UO/co5LLf6SbTp3uHoesQ0GDDMlWqD+0yeTwSQWyFtSNRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96xfPjtXeyq0hZIxH9SLhznjSm3JsYhYUAeJTDpMaNA=;
 b=Xc6VSpqQGg3j5XaPIbaQ4KKyppv49Try4TD+LrfruWT7Vybjjimod12LdaT3IlWATJ6kbEeq1aVox6ev8+ZZUIj9oHqXJ7hFMCo+otijsIvTvfQOEXg9ASw43taJegrv4PhoBpg7ZqLf5jKlZwMZ6hyM0kgcNKYOllkU9p/P2vc=
Received: from SJ0PR03CA0203.namprd03.prod.outlook.com (2603:10b6:a03:2ef::28)
 by PH0PR12MB7095.namprd12.prod.outlook.com (2603:10b6:510:21d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:37:11 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::42) by SJ0PR03CA0203.outlook.office365.com
 (2603:10b6:a03:2ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 17 Jun 2025 04:37:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:37:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:37:09 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 02/36] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Mon, 16 Jun 2025 22:35:57 -0600
Message-ID: <20250617043631.2920587-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH0PR12MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdfbc9d-adbf-4d36-fbd5-08ddad589fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tEl2Yv8WcaaLQ3ggZUFaMVg/QM0fugI5SymeQLOJV5hrsxSNMOdJOqJsHBhJ?=
 =?us-ascii?Q?IxUpUuY+/EyZKRXOgJn/xen3wnn+uAigtjT327wzqFCKy+veFSxVXBsG0XK/?=
 =?us-ascii?Q?bKOIL9xYU388JO8feqsmGGwzz3xNR6W/UAu7jhjTpMu+8/K2Fq7MluJbGzzW?=
 =?us-ascii?Q?C9jZPOA3akgBrnnJarGuQV8K6dayAgLUPYCChHVh9Y5FxtzUqrIL3hvSNuK9?=
 =?us-ascii?Q?nXjNALCImhmDPdZBmGVFnU2iKM+lDO36VJLk92ynkORsG2pZRGZsKm20WNAq?=
 =?us-ascii?Q?jy9RwZA/9fEXgm+ASAg5uMpu0iXVvuMPVooo+r962+pU6ran3z1yOHu7cuon?=
 =?us-ascii?Q?F/YA8SSxQUh7/1XIhG6m+pHY3HaKfhRlM7fMAa4RH+flbODDxzyczYsZV4ti?=
 =?us-ascii?Q?aybKth+MxhetG5DZGL1uIVli7EwJT0WW6qqbZB2ofQc/Gf9pmIw5KVeblXFG?=
 =?us-ascii?Q?jsAz0tjHzsFaWJI29jqirmUNsdrYAY9e1QEMAOeg1JKO7CMCYTn0dloanEX8?=
 =?us-ascii?Q?DMLS/k1QS56Qj/wpDEki02VVeHz4Z8PTvhwPMz+NCiBuVw79CeMmDjUWMosg?=
 =?us-ascii?Q?WdVrsqC5esNg07ktlelL8CCRiV57EVYsW/pcKAPusY6UVsckM0Fvp4MaH96k?=
 =?us-ascii?Q?LXrvJQ4rJYY1PXDX/7IWgrpsHBgwvpraa236O157sqxXlPD7A+BNxmogo4n6?=
 =?us-ascii?Q?TuhyQHQTv3FJUVY5lE+u7cWKYPQTAuzmI1zlj7LbernfkPZdcfv9oY6eStEC?=
 =?us-ascii?Q?W0dPZSd8jRZP4bVU656CSxLbwSsYyT/MNcDMDPuVfqHbKQelkZ6oKrT9//fD?=
 =?us-ascii?Q?jvxOLO/a+y01/+/ejf9T16+lp6jb/4rikyog8unj3bpyq30/oWZMf5HcVPVd?=
 =?us-ascii?Q?86W867G1wzlYbH3dCMh7J5DXzS04FpyhklrizGCtXXw/Pm9vvvLjNgBFNefT?=
 =?us-ascii?Q?7RV4/By1oGPPJDQJdULrAE7e6lQhWaM4UX9g3jxMW/AZtUC25jGx1uIxBOem?=
 =?us-ascii?Q?aNmKipDFfXmhaJ6ya7VXoPvnrjnlK+EN6oGJvgO6qQG6MZWfOtp5F5Ntg0xX?=
 =?us-ascii?Q?A0gi9Os8Ywo0+wJafU3wt6cIRWujNCPrfXPbJoXSQaxIc2WQdnM7lP+xcUtR?=
 =?us-ascii?Q?6hzCbXXpwW1+rQJ0vXQ6UjADQk4ipn5PFOeJpFs22Mu9Z6qaBAWRJ9thFruh?=
 =?us-ascii?Q?Clsej9AGT8JcEGUAfze87B3Ftm8Z/h1Y6W09IhhlK3P0b8FnHlp5ssni0rrh?=
 =?us-ascii?Q?72GjfuIKSobpUr82a12qQNOjTOp/apGIRvzIpR24jgVjRf3p5W4yNRYZRsz7?=
 =?us-ascii?Q?JwYA/dG7TXE5mnHm9rskej1V6vLwNA52sm/jbKdCYPne8jdopUDx1MQ0CZfE?=
 =?us-ascii?Q?nATS4IAP27VwnCkhOlTpgT6NkmMQgrlcVA//LcKJ85KjdEH0C3JSj+HSGrVI?=
 =?us-ascii?Q?EKO5s62+po2E5mdMDvk5m0ZA9lGCWx8Fpjh5tDLeOYV2ZrE3J4X6N5Z3FgVl?=
 =?us-ascii?Q?Pt73jOB7rOfj+3ahHEmtduwKps5NXo0aa38r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:37:10.5013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdfbc9d-adbf-4d36-fbd5-08ddad589fc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7095
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

VKMS doesn't like us to add buffers with unknown fourcc
type. Other drivers might behave similarly. Make sure
we avoid creating 10bpc buffers if they are not supported.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 05680837e..8765fda34 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -131,6 +131,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -140,7 +144,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -590,12 +593,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
+		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					      mode.vdisplay,
+					      DRM_FORMAT_XRGB2101010,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &input_fb_10bit);
+			igt_assert(fb_id >= 0);
+		}
 
 		igt_plane_set_fb(plane, &input_fb);
 
-- 
2.43.0

