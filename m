Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E1C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 13:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2E10E8AB;
	Mon, 25 Mar 2024 13:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cks/u2MB";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6C610E8AB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 13:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo/6+cmqY4AKzR4Q3gz6BVRlgttEDti6wZT5oLez2sfYowAsRRFCgFSKAYnvSHN082hlzeYrq4dOZBDK9VBKWIpNLd2bunjzKwaPQ6Wu2UjOZXAwjGdvEivnMQ0O4QHjXRj3t5YOGVj7ZuPPKD55GAtiPB8B1oooLUx0a5fMLnLgZhsKATlnyAiy9qofCX3jYJIr/0Z6yPHjrPPG0sEGdg2HE3D6wUKcmb3+0JspTzv/WNr+RqOXeoasSGhZs6HAYF+WI/Keo1YVY409vCoX6pOYlbUcvodtkWzPbFMucSIkk2vzCf1knoP922s/8TQsNMFS/NLsTScy8m3zTnccMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucOpsIo2e8lbzJOpLZ2AtqW/q57Qbdl6Fgn9PlJ9TeM=;
 b=Ey32L1czWac7oYX0BLronaOYWASaR+xAQMlq3v1fjAwVDPBtSMPwzmKBmE5Uf223BlGPbx+Tlbey8Gmmw4dUr02ehaYYtf6ZYzKjzVFqeRbgrbWsuOG0opHD8slJbHcivXO30UW5MXzEVhHYyJTxwcrdGRqBUQmjfqHFRSpGe3SZmfSc2lZJlyV6AnnEyDIUlzIx2OE2vQrekXRURldoab5lvotd/wXUCjagLmg/5sM4K3aXb7qykPAqtrx5bG+VKJqOaKvHambcU7tYduRE+HMFadbZzHdHngav1CCSkk/ud3hJCaF39LD5wkyBLrBdlv2eUVX4sLb3QTFtx4EZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucOpsIo2e8lbzJOpLZ2AtqW/q57Qbdl6Fgn9PlJ9TeM=;
 b=cks/u2MBOBU4RmtrYdR1It1FG8enjN+chQW8XcjYelm9MtVFcwwM8iPheytrGhUu+MigRL219PmZwgrjPBbVCcX/HhVuHFGowFQRSn/rkUc+zBP10fT69J6aMwjyY+QjeV0i0f+tEvBgjbBy3pvR9KSyEHts6UvHauViTpjsjDg=
Received: from DM6PR08CA0060.namprd08.prod.outlook.com (2603:10b6:5:1e0::34)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 13:19:53 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:1e0:cafe::69) by DM6PR08CA0060.outlook.office365.com
 (2603:10b6:5:1e0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 13:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 13:19:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 08:19:28 -0500
Received: from hersenwu-Majolica-CZN.hitronhub.home (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Mon, 25 Mar 2024 08:19:28 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>, <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <Hersenxs.Wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled
 after test
Date: Mon, 25 Mar 2024 09:19:26 -0400
Message-ID: <20240325131926.42203-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: hersenxs.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: fe178d35-7792-44d7-b765-08dc4cce4205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXPBkBC+G8vF2lFtl/F3gLXoz6MFWdxGxPw9h6Dv4Cbp+iFvqpPSUmpsRtV5U7rVN9OR4L8fKViVhB1A72aEIJ+Xppts0iy0I0EF8cmSnx8715f/DM+HidQBRJLunMVJUEUo6ar1UOTKRSd92TdlNTyQJelVhpw3Tpy78zIZhsg7r6Swwy+F2dRzPHElvC/jHsM4LY2zreTt4+adKQpb1osKxNzxfgB7cstqTflySIunpQLxAndqMuPqURBbpLwJbPxtmVEu0O2M6GotjPfO6VvlUTxBqaEaHzGbPwKc02zbS2IIdXiCuXc5Ktb4qNxUNCWzdO5I2d9dl7E+qPAxHgvVMu+CoaD8W2Jj2bz/TUoBu25lU+dy1qC7FOfa1yrdt9qXjP2pavgbSNv6AajpMHCDEKc5/WI9id8mNKnarVJW9IWQ1gIlZAZDqzcksgAgyOZGYo05iGdjKI/m88djNTucptaIEQLlgD97lt6E6vZo8lMsXpIyJSwrCeslQt6dq1B5IydeCOkmCsjhCbIgnDS5Q/OmAWbAK653bEAeHlrMWyMtRsQK2hVw4asHOjopSp8584oSqVMzDM3YWZR32Q+PI9Xn6sASaFxYZohTfIao3I5cM5oX2QnwRMxM3dOU/aHYOgEACN5RIObxUrvM6iEoKzFEbe7h40/HwQtk0IRTB+ulKSa+IqFgDyNMkZjkeZPsKai7MEuNEXsYSKE828LPwu3LDvdr9UkZx5Vx1Um6HqYFbEKiOaBoDEKWLhCG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 13:19:53.3475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe178d35-7792-44d7-b765-08dc4cce4205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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
 tests/amdgpu/amd_ilr.c | 73 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 623883dbc..d10c3c1f2 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1183,11 +1183,6 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
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
index 46ad6f60a..f63a4f782 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -199,28 +199,33 @@ static void test_flow(data_t *data, enum sub_test option)
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
+		 * psr_capability.driver_support (drv_support_psr): yes
+		 * ilr_setting (intermediate link rates capabilities,
+		 * ilr_cap): yes/no
+		 * kernel driver disallow_edp_enter_psr (dis_psr): no
+		 */
+
 		/* Init only if display supports ilr link settings */
 		test_init(data, output);
 
+		/* eDP enter power saving mode within test_init
+		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no
+		 */
+
 		/* Disable eDP PSR to avoid timeout when reading CRC */
 		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
 
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: yes */
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -229,8 +234,30 @@ static void test_flow(data_t *data, enum sub_test option)
 				      mode->vdisplay, DRM_FORMAT_XRGB8888,
 				      0, &data->fb);
 		igt_plane_set_fb(data->primary, &data->fb);
+
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: yes
+		 * commit stream. eDP exit power saving mode.
+		 */
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes.
+		 * With dis_psr yes, drm kernel driver
+		 * disable psr, psr_en is set to no.
+		 */
+
+		/* igt_amd_output_has_ilr_setting only checks if debugfs
+		 * exist. ilr settings could be all 0s -- not supported.
+		 * IGT needs to check if ilr settings values are supported.
+		 * Supported_ilr is read from DPCD registers. Make sure
+		 * eDP exiting power saving mode before reading supported_ilr.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0) {
+			/* Enable PSR after reading eDP Rx CRC */
+			igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+			continue;
+		}
+
 		/* Collect info of Reported Lane Count & ILR */
 		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
 					   data->link_rate, data->link_spread_spectrum);
@@ -247,18 +274,38 @@ static void test_flow(data_t *data, enum sub_test option)
 				break;
 		}
 
+		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_OFF);
+
+		/* eDP enter power saving mode.
+		 * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
+		 */
+
+		/* Enable PSR after reading eDP Rx CRC */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+
+		/* drv_support_psr: no; ilr_cap: yes: dis_psr: no */
+
+		/* eDP exit power saving mode and setup psr */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_ON);
+
+		/* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
+
 		/* Reset preferred link settings*/
 		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
 		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
 
+		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+
+		/* commit 0 stream. eDP enter power saving mode */
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-		test_fini(data);
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
 
-		/* Enable eDP PSR */
-		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+		test_fini(data);
 	}
-
 }
 
 igt_main
-- 
2.25.1

