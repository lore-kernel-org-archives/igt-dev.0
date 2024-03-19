Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B3CC54E58
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 01:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8218110E3CE;
	Tue, 19 Mar 2024 01:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="03+DD8HU";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58310E3CE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 01:17:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5iq+wyChK4fzEeZ5l9s3ql0NLRz0/pjjKTyck39bnOby0Y9g0POsgdoZr1KHCfA9Dv2LB0QA8OtriOAQ4gfiKMMpeGSBz9umWxyt3Tl1tYRsQngkoyytRZbnoBSrQ/rK+9r6lGflq/Whq5l0aJZdNEZQR3gGgzpyXFMhzuWlV92/KpQBitvNfDcDjAD28sqqABhJf2wHK5Gz29A/+c/F8KwPPwE9i6n4Z2XuPY6vtDyh9NDcBG0goNBUYstLTosKYvNxymbPvKo7UkLNg3KwzrwSTv6ufsLxcQ3oUiMHgwWGxGwNlbhTuGwIBrLtfTU+ZNlIN2gRG8kiXFGJFaTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3i7SNle02adg/42kvf1lIbsHy1ZcErDBh8jbeAYoXQ=;
 b=ZxKCmgdWhJAGSpEzBp2OKZm4vGCmwzWqEcnmck2J17d/pIkpkF1+ZEAjDr8P1L4JvhuAqujQ/rLcYW3wND8kPFlMCbbwYQ0yUte8jGtB69nRuXXONZ4ljwK+RYbaizY9zZy4LrFLhK+jxXk1m3Om0Ajo9f5wUZAbcavkG/qLIbeiuKfeyqmSW+6f6I9gMO47hFEeRdlGFpInGMcGIz7nGf8IuswoSy2w4ms8wC2pluDisoFb3k38nlPsVv/7+SCCKANcj5ymhq89ahdeIIf6aNkZWgxvtLAUVffYCpB8YaTOgCOVN5zoWoYcG+xzN2cFeMgWZbA1koUUWbh58cON9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3i7SNle02adg/42kvf1lIbsHy1ZcErDBh8jbeAYoXQ=;
 b=03+DD8HUYM3MfakJTBfu8YmKU9//8DrRSmaIDEnvjCbYoePDOekQwOIYj9h0vt3UcSIV0/ZFTD3c8C+aMmZ0F0TeV2LcmF8tMFOA8gvjjsnPpMavuEYt6LJJQeolGaVBn95U4noNyJt/AKJ98KkTcWkloWAA7uUhWSMEGlBiyHI=
Received: from SJ0PR03CA0152.namprd03.prod.outlook.com (2603:10b6:a03:338::7)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 01:17:48 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::72) by SJ0PR03CA0152.outlook.office365.com
 (2603:10b6:a03:338::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 01:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 01:17:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 20:17:46 -0500
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Mon, 18 Mar 2024 20:17:45 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>, <sunpeng.li@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <Hersenxs.Wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled
 after test
Date: Mon, 18 Mar 2024 21:17:43 -0400
Message-ID: <20240319011743.816756-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: hersenxs.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 956408ec-a591-44b4-4dc4-08dc47b26353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INSLUTDTyrRjrBiKdB5kwgA5OiA1Bv33CX9fFIWFIoX81/Op3psO3DvXEHeVC/b6mf0GA3bAwMHdAgeNv4HZIPxnPPtipzyGcDOX6E59RuT2trKY+kkcGGzWiAaHOk/RYQEchzdBiyEAcxcOjvyJFpq9JT+WbfW7ujX8Ho4YiGLWoFnv9WJkoDOahcMerH9bs6RdVvXmGElumLrUa6uorJ0HDGLq2YK/jE6GJKUHqO+RWYj9DuCejmWB6I+r6LXp2SrlCNInNuOom8T4CdmGeyhqQYEM4estVaPfueY/SrRIAcLyPk0+AeLr5Bchzl/itM2/whT40Pm4zbRgCpDDGVuRTigzj7OrHHb8A89xYBV3X1rn2e5Ztp4//WBZxMAZNJ3TVgxXU/06I0Jiu3CgeYBCEOjDw2oaGAMoHIzGudK4/JICtOkjnM4TbSU9A8wsWh21K8L78NKFUMOysiRrzlSRy7RHnEvWWWiTC4GXp9LaoNf80MUwAUS7pTkLYO8dAWqkkP64Q7tfK2LQlgpi6XsELA+fg3UE6Pc7tZ5JA8QpfoDkU3KFw2neyP70XEu8PYMWvKkhYJ4n8eVw3Mfogi4UG9nsmdaHU0vhrZLr4DuyAaBG7qnWEMy4uAlSmHye7HqK8S3YgFigm6nmgh3HM6xBiYb7uom0HLTc0VmU1p0GlERgPgfWsJd95My0QHfNTKcq4Vk1XdtFBuZ6ABtIE688HR/VKKfeGe7+AV9ttgENg5PhWOWLlAj0GkEn9b8J
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 01:17:47.3734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 956408ec-a591-44b4-4dc4-08dc47b26353
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518
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

From: Hersen Wu <Hersenxs.Wu@amd.com>

At end of test, with disallow_edp_enter_psr = 0, run DPMS off, on
for eDP. This will trigger DRM kernel driver enable eDP PSR.

Signed-off-by: Hersen Wu <Hersenxs.Wu@amd.com>
---
 lib/igt_amd.c          |  5 ---
 tests/amdgpu/amd_ilr.c | 69 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 56 insertions(+), 18 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index d0b53c08a..02ba8204a 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1180,11 +1180,6 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
 	const char *allow_edp_psr = "1";
 	const char *dis_allow_edp_psr = "0";
 
-	/* if current psr is not enabled, skip this debugfs */
-	if (!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_1) &&
-		!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_2))
-		return;
-
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	igt_assert(fd >= 0);
 	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 46ad6f60a..77e11aaad 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -199,28 +199,32 @@ static void test_flow(data_t *data, enum sub_test option)
 	igt_enable_connectors(data->drm_fd);
 
 	for_each_connected_output(&data->display, output) {
-		if (!igt_amd_output_has_ilr_setting(data->drm_fd, output->name) ||
+		if ((output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) ||
+			!igt_amd_output_has_ilr_setting(data->drm_fd, output->name) ||
 			!igt_amd_output_has_link_settings(data->drm_fd, output->name)) {
 			igt_info("Skipping output: %s\n", output->name);
 			continue;
 		}
 
-		/* igt_amd_output_has_ilr_setting only checks if debugfs
-		 * exist. ilr settings could be all 0s -- not supported.
-		 * IGT needs to check if ilr settings values are supported.
-		 */
-		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
-		if (data->supported_ilr[0] == 0)
-			continue;
-
 		igt_info("Testing on output: %s\n", output->name);
 
+		/* states under /sys/kernel/debug/dri/0/eDP-1:
+		 * psr_capability.driver_support (psr_en): yes
+		 * ilr_setting (ilr): yes/no
+		 * disallow_edp_enter_psr (dis_psr): no
+		 */
+
 		/* Init only if display supports ilr link settings */
 		test_init(data, output);
 
+		/* eDP is powered down within test_init
+		 * psr_en: yes; ilr: no; dis_psr: no
+		 */
+
 		/* Disable eDP PSR to avoid timeout when reading CRC */
 		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
 
+		/* psr_en: yes; ilr: no; dis_psr: yes */
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -229,8 +233,27 @@ static void test_flow(data_t *data, enum sub_test option)
 				      mode->vdisplay, DRM_FORMAT_XRGB8888,
 				      0, &data->fb);
 		igt_plane_set_fb(data->primary, &data->fb);
+
+		/* psr_en: yes; ilr: no; dis_psr: yes
+		 * commit stream. power on eDP
+		 */
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+		/* psr_en: no; ilr: yes; dis_psr: yes.
+		 * With dis_psr yes, drm kernel driver
+		 * disable psr, psr_en is set to no.
+		 */
+
+		/* igt_amd_output_has_ilr_setting only checks if debugfs
+		 * exist. ilr settings could be all 0s -- not supported.
+		 * IGT needs to check if ilr settings values are supported.
+		 * Supported_ilr is read from DPCD registers. Make sure
+		 * eDP is powered on before reading supported_ilr.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0)
+			continue;
+
 		/* Collect info of Reported Lane Count & ILR */
 		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
 					   data->link_rate, data->link_spread_spectrum);
@@ -247,18 +270,38 @@ static void test_flow(data_t *data, enum sub_test option)
 				break;
 		}
 
+		/* psr_en: no; ilr: yes; dis_psr: yes */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_OFF);
+
+		/* Power down eDP.
+		 * psr_en: no; ilr: no; dis_psr: yes.
+		 */
+
+		/* Enable PSR after reading eDP Rx CRC */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+
+		/* psr_en: no; ilr: yes: dis_psr: no */
+
+		/* Power on eDP and setup psr */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_ON);
+
+		/* psr_en: yes; ilr: yes: dis_psr: no */
+
 		/* Reset preferred link settings*/
 		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
 		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
 
+		/* psr_en: yes; ilr: yes; dis_psr: no */
+
+		/* commit 0 stream. power down eDP */
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-		test_fini(data);
+		/* psr_en: yes; ilr: no; dis_psr: no */
 
-		/* Enable eDP PSR */
-		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+		test_fini(data);
 	}
-
 }
 
 igt_main
-- 
2.25.1

