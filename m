Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84572C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 12:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED0010E7DD;
	Mon, 25 Mar 2024 12:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3HWnZOTB";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BBD10E80D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 12:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOGhKP0pW5z/jPUNE2JMps8wG91nJuEqg0yK81+UtlOG35ngZb7yEC2f2gPjXaB7yBa7WL40zG5QpfystfPQ958X7pnGCqtYawovbRjctU2Gj+7BTQJvw5GKJH7DQXVQyLkkNZWOj+rw2g2Bzsh8yUeIvqOIUYZhEmT5u/3aa9nJ0OGV+T7N1kMCaRwJas6dqSz27RkgOdKK4HgJjpQ4v8Lztoy+Y7Y0QrkqsYTvOHNzaX1EUVBpKlp+/jBXsk/v96ZHqygQQnazteNjKo2NkNaygPSBBjC1fOxuBTXfrm/yBaLo4V6TRbUDUkunvPwYbS5dJw4eamj5Yex9/WfClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLaGjlMomFzQFbhS4Gk0ASVTkCJHnAg2mv4yKWuezK8=;
 b=BzPKhwQTzr3il4RUmLgCbLBrfMMbDLrgmhkzvlx5oHRYL70ccntqrmtdYG+k6xmxT2q7QV6fVj8IAaFd50R+qLy6dsiiYUYEUBSAvrOEA02CDqhJw7atokf9Lh53/N5N9XiGw4VtYLbA/O5ulEF6vq59EOPzIhMAA9OKP+TSLHIA+g1Cp6xq09/HgwsyEyieMyLZjg/dRnIj+h1mOv0rpG/jmhUBkZBjN2XUPDdIK8b4HY6A/rwCDdcxOT4TfM3f5NX5xvCtBMhT9fzkf0uDYDxwuxVBa9e5B3yTmZnLo4e9/QWxsrOEL4wc51Y1DdBXj+mx5lLIvw0GbDiNhMllZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLaGjlMomFzQFbhS4Gk0ASVTkCJHnAg2mv4yKWuezK8=;
 b=3HWnZOTBzEMnpDr+wxpOJlPPjEauq7AHq5L+wp6Xg9tA6/HqEgSDtHzS0CLV/26fAImiADwLcdLgceaKNasHfBg3/37blyXWkPw6qS4YHHLqn2qXC0LVvbhL7wVcSzI/ELf8kS8wiqO1Nzc+jWEpqVoUu9cIY9YCnlff3/cFK3k=
Received: from BN8PR15CA0002.namprd15.prod.outlook.com (2603:10b6:408:c0::15)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 12:08:16 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:c0:cafe::e7) by BN8PR15CA0002.outlook.office365.com
 (2603:10b6:408:c0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 12:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.0 via Frontend Transport; Mon, 25 Mar 2024 12:08:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 07:08:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 07:08:14 -0500
Received: from hersenwu-Majolica-CZN.hitronhub.home (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Mon, 25 Mar 2024 07:08:13 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>, <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <Hersenxs.Wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled
 after test
Date: Mon, 25 Mar 2024 08:08:06 -0400
Message-ID: <20240325120806.30667-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: hersenxs.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cf679c-a5ab-4c8e-20ff-08dc4cc44029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rJ5uf0WiH1xrfITngDHSsszQ96l/+s4nUepKsfzsRYC+/qhLcQFHTAcn9A+ZrkQUQFtl3ll1Yvi9NOUX1kDwcFP1YAITnFRKVZtfYbm24EGdhy5lGiO+KojTn3XOrEndkFFGZc0dK6/JdstPh8l4V1m03ciCdZH0QWVSorCi9enWk7YCEWucO3LEKx5ftpaklU/f4RIbJdfmc/IDh7bqNrMo9RXStFzGzGXTAYjuf6lC5/JwCAuQ3g4kzLGhZ84IOtfmY/llg6jcxAdHOEn6L3vOz13Noa1oy5tU2/OaXmvsbRyIdsqa2S56cG/VRdzouOBoZNmF/vLiJ256W8lzMbTaEjTuk40q7ivt+B1KdwEvgPbs5q2j0x+QMq2pYGdOKA3aqixZMSIXLBITKu3a7YMYmLX4aiHH2Uj3HgMLj+9WVhkZ49fXMMVToC37b4sLcD7e9lXIRiQVp8sDdmj8ZR4wkbGQT8uwbSgH9tnjmpe+06YGjuHu6gnXLAFP4abYYm3zJLYJNUNQ8iKSnlBLsDWnyQPcLE6+UWXOP/V7xbqWssndQzuZryrVxYnf/BJQ4YikGyoie+URyh58Ljg0OzXcZqFppgLQHZ4X3LkvL7/Pr260BQuMmDSgsHUPNyH6YWK102c2zULnH0/wWZMyPN5+FD07tHYUocv/55OrflIDI0pgDL8ZE1FXChhWpRYdvpDRrerWdbhIWuZ9Y/+/n/C7JdpnF1/RsIQ0bAW/CPY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 12:08:15.2881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cf679c-a5ab-4c8e-20ff-08dc4cc44029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
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

