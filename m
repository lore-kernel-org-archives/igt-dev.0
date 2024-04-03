Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A180CD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 14:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136910E87E;
	Wed,  3 Apr 2024 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="32WN0uUj";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B5710EC2D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 14:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz7UDlWlxa+fDCpphKHD7ZWC36itanavoAYkV28yovMbTRSz7XjZSugsCzGDFe0shle4CYqxnLKVisMiS6iKNH+PYo0s8upPqogHsPGnlB+kRSFYhhm/dIVl2DRC34CGsEk0rEuUOc+RgQ0y4bojWy880PJq8ZT+SDDzseedrMAeVx+n3N06NfnUNvDSerF6QXZ1LKcsn8W+Iuu197S/i2K8QzgnYfueccd0KHggBoGKwgSSpcRFiRTmlYOm9Jt4SgVpO9TMDokOaqMkINXDWc1qEf9AiwGwt8M/H2Vyr2Ih/KGvIA+vz4y9gRH4yWaz/dDxs011++rO0mCLAfP7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y4uG2dInBsbIZGhnlI3t8/DbdO7UDtk2m1DLPz/EYM=;
 b=mUEo8L1G/SvEQ/l34GgwNVKo41wiMT8EBmKvX2X9wP0dv/TAsc1KQ1PZ9J6gVdM6f4yuEiP0kJ//otMkouXcZ+Um8pBi2nhRM9A4/9dNJnpFYXXpcixGQH9N7qYswSDLJ5Z1HPlbE7dfsGRt2XIFEDHh18VzxqgWDx/V7J97LpJP9+AS6Mr7RiFWi5mrQkLzTrIIRzwbU3INbr92bo0642jYZu3Gdu2Qt4TYj0eM9S6SDBNk+aeLQfW0YI9oBw64SerHxqDZfOpjwkDShin2StPLalqq6GOv0A51+y8iD8rnE2Zc2DE0tWizWv8ggVj4pcLt6Di+p7F44O7QuG20DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y4uG2dInBsbIZGhnlI3t8/DbdO7UDtk2m1DLPz/EYM=;
 b=32WN0uUji186++WGiKZxaioRpx2Z1ocE3YVcZH5BTeLB35A5pF+U9y1c0UH2dcEt+3M6/pZbC6as4MsnaBib2NtDdsLA0n6zK4oygZgctizimMoj3Dn90b2Tz+oeTSjvaduvZeK8i/aWwZT3AVr8yO/6b97sZahx72+pjcxKNkU=
Received: from MN2PR13CA0009.namprd13.prod.outlook.com (2603:10b6:208:160::22)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 14:28:34 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::d6) by MN2PR13CA0009.outlook.office365.com
 (2603:10b6:208:160::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 14:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 14:28:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 09:28:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 07:28:32 -0700
Received: from hersenwu-Majolica-CZN.hitronhub.home (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 3 Apr 2024 09:28:32 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>, <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <Hersenxs.Wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled
 after test
Date: Wed, 3 Apr 2024 10:28:30 -0400
Message-ID: <20240403142830.25987-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d7db34-3478-43be-8372-08dc53ea57e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQASugbUk0UUrkkDTZOrmozOhlT1XHvTMRRwvtAG/sRGdj5F9EZhdCF6J0jzb5PRqRe41/c4nCMk+oetZmfQR5xkI08KesneaS7TFZhBmwFVmnR+KAGD721NlIFZBz+b9+N+r9iRbnGE4ybsoJ7bh07y0pvTWltSBAq5Brc72IU6VMNbv/t83g6Ezvw1Ly8v7+dgiRxoY9cWWPIFmWnTauaRESv4umhGFztYmOn04kya0Xhi7tlLbTFf64HCRhlU7ae2XnCXEQFGjV2kM3fmOiqFLWLIX8OHH+CE7sqZuXWw2ActS/7PkP+GY0HPObnVLUhydJUqI8y6brl2YJtKEDk9oFaaRfdzVvGPGaT8jD6CwhmYAmcIYJl07qAw/HnBsrHvIOjmN1U66Mtc1D60WHQ6AirkPAZd2RwIMKGohiCO8yhEFSjLijO+FMT/WXRDtXV+9eYh9l2Lwp+kjG40Sk9JHSlcugE2FbV0uK9vniRWhOeuic+JCJVvmvN+wRaT/S3VuUV5nZwRa3H4r6SIRbvw7BhKv+wHRNTb1+2hzreAO9tUvP5UHdr/FOtDsCoER1aKMibk+VqhQ/Qekebe1IT7ZH/NL+jvTcTmZI8su/f09TksClkULQrONsXdqAUiQyyrfi89zgeYnqEhxyJRyYVJcbpmxQALTt16Z1ZQ6bAxWPE0dyzxIU6H3Tm9RCF6ZFz46Fm0Uo0BcMkIWvm5w/mFBw3UmLxa6yrSp4pr/6ayiWGzYzC7p6dPl6aBc07i
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:28:33.9273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d7db34-3478-43be-8372-08dc53ea57e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289
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
Reviewed-by: Wayne Lin <wayne.lin@amd.com>
---
 lib/igt_amd.c          |  5 ---
 tests/amdgpu/amd_ilr.c | 84 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 20 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index c0c4dfc67..149af5151 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1185,11 +1185,6 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
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
index 46ad6f60a..b09980a15 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -205,21 +205,22 @@ static void test_flow(data_t *data, enum sub_test option)
 			continue;
 		}
 
-		/* igt_amd_output_has_ilr_setting only checks if debugfs
-		 * exist. ilr settings could be all 0s -- not supported.
-		 * IGT needs to check if ilr settings values are supported.
+		/* states under /sys/kernel/debug/dri/0/eDP-1:
+		 * psr_capability.driver_support (drv_support_psr): yes
+		 * ilr_setting (intermediate link rates capabilities,
+		 * ilr_cap): yes/no
+		 * kernel driver disallow_edp_enter_psr (dis_psr): no
 		 */
-		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
-		if (data->supported_ilr[0] == 0)
-			continue;
-
-		igt_info("Testing on output: %s\n", output->name);
 
-		/* Init only if display supports ilr link settings */
+		/* Init only eDP */
 		test_init(data, output);
 
-		/* Disable eDP PSR to avoid timeout when reading CRC */
-		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
+		/* set_all_output_pipe_to_none: no pipe is enabled.
+		 * DPMS on/off will not take effect until
+		 * next igt_display_commit_atomic.
+		 * eDP enter power saving mode within test_init
+		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no
+		 */
 
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
@@ -229,7 +230,44 @@ static void test_flow(data_t *data, enum sub_test option)
 				      mode->vdisplay, DRM_FORMAT_XRGB8888,
 				      0, &data->fb);
 		igt_plane_set_fb(data->primary, &data->fb);
+
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no
+		 * commit stream. eDP exit power saving mode.
+		 */
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+
+		/* igt_amd_output_has_ilr_setting only checks if debugfs
+		 * exist. ilr settings could be all 0s -- not supported.
+		 * IGT needs to check if ilr settings values are supported.
+		 * Supported_ilr is read from DPCD registers. Make sure
+		 * eDP exiting power saving mode before reading supported_ilr.
+		 * This check will let test be skipped for non-ilr eDP.
+		 */
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+		if (data->supported_ilr[0] == 0)
+			continue;
+
+		igt_info("Testing on output: %s\n", output->name);
+
+		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_OFF);
+		/* eDP enter power saving mode.
+		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no.
+		 */
+
+		/* Disable eDP PSR to avoid timeout when reading CRC */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
+		/* drv_support_psr: yes; ilr_cap: no: dis_psr: yes */
+
+		/* eDP exit power saving mode and setup psr */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_ON);
+		/* drv_support_psr: no; ilr_cap: yes: dis_psr: yes
+		 * With dis_psr yes, drm kernel driver
+		 * disable psr, psr_en is set to no.
+		 */
 
 		/* Collect info of Reported Lane Count & ILR */
 		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
@@ -247,18 +285,34 @@ static void test_flow(data_t *data, enum sub_test option)
 				break;
 		}
 
+		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_OFF);
+		/* eDP enter power saving mode.
+		 * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
+		 */
+
+		/* Enable PSR after reading eDP Rx CRC */
+		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+		/* drv_support_psr: no; ilr_cap: no: dis_psr: no */
+
+		/* eDP exit power saving mode and setup psr */
+		kmstest_set_connector_dpms(data->drm_fd,
+			output->config.connector, DRM_MODE_DPMS_ON);
+		/* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
+
 		/* Reset preferred link settings*/
 		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
 		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
+		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
 
+		/* commit 0 stream. eDP enter power saving mode */
 		igt_remove_fb(data->drm_fd, &data->fb);
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
 
 		test_fini(data);
-
-		/* Enable eDP PSR */
-		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
+		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
 	}
-
 }
 
 igt_main
-- 
2.25.1

