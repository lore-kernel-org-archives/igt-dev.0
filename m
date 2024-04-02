Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB1CD1293
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 15:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E35110FDC8;
	Tue,  2 Apr 2024 15:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZgZ4oeSa";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB15610FDC8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 15:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtLn59IWaazCUIZFwDZ7XLG9Fz6GMNEOSu0ODKnyIGFd92N+dqNnl9zDB/fF6dsSklBb5nbS3LZRYKyS9lFi7Yh/7JdTU5WpVuzrkA8oN5BA7ZlnYxQXu10nlIlCginYEk9sL6ga63EIc2PeuREIfqelnsKZV/zXpP8xiXnhTvKJKY3IWdghlCpV5SxcvvZllg2rFm1xQVygMj6FZh2CQ4XSYVN2oTGBU2lv4OsdhEACfh12/i38MtH1o32AuhURTuy5BzuBWxVBglSyM0Pxd82GhrmqVMGQpDNVpgBgJNFsYl5Rdo/BsiwGgaieH7NZwwfoa9vtNmVcXTE0KvXgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTKlEXYFwyD2G0/Vsw2RQrmgJYcmbv3HwKZGSWJDjPM=;
 b=oOR47PrrTeH2wCzFoTw7HVOZUAmqCGjZSutAmyoNOn4KlBINM8bEO9g4j4NaGCRaBs0Iq5WXNmIC7svRtsKSycSfiYqNxM9xde9EQ0jNFbb9G2k2gw8dselq+8P94Djlen6a74WPz+5JBXtn9mYDWTuHiprUBHcn3yzLAWEGNCSi0Rg5+1Y/sITCKhssWryYZ5WPuH2HWmx0jI9BbiEfifNYGhsZWKOsMp/xVzxBVfh4o9+zw72VGGJ8bsIy98SObCk6gF6sezOrPMzCvIIK+M1hgQOe0YoFFzJuQtrzCts2uU77cimh/JBd7t6FFR1GUBfXV6CLRvc/P0+ZUUCgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTKlEXYFwyD2G0/Vsw2RQrmgJYcmbv3HwKZGSWJDjPM=;
 b=ZgZ4oeSaEJ41lk/9aZKI8T8Plp2HgsfR+4a146VLGFlYRVpvIF8aR0/h9QWM+XT7ImhIuG/9DQd4lL6V/19vy9U4IYksoceN9uguacYuCsqBYS0LebC2ilG9UwLq5j3zl0F707g7WD1gCHr+u2REu6a/zlUQrN2p4EMIinKmp04=
Received: from MN2PR18CA0009.namprd18.prod.outlook.com (2603:10b6:208:23c::14)
 by IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 15:20:49 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::59) by MN2PR18CA0009.outlook.office365.com
 (2603:10b6:208:23c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 15:20:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 15:20:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 10:20:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 08:20:47 -0700
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Tue, 2 Apr 2024 10:20:47 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <sunpeng.li@amd.com>, <wayne.lin@amd.com>
CC: <markyacoub@google.com>, Hersen Wu <Hersenxs.Wu@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be re-enabled
 after test
Date: Tue, 2 Apr 2024 11:20:40 -0400
Message-ID: <20240402152040.29149-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|IA0PR12MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: bf40d6b8-6c87-49b8-c1b2-08dc53287a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QefSJggeMMpdE6ud4WVwE2ClgcokLYuDe8YquOm9igf+KhYX73PdCIWVJfVMjMf7k0cWOuVbb3p6OiHW4ScX1EeEkWjich1/FIwkz6CGdYsR0fOHyCocHjlIHlXOBWABrEXxoUvTx5x7CrDltH1+H7UR1/lP4cx+ye0v/SIbvZPKcjhWszbqYUgLh79ltMqT32UjVBSiQlIU7VZ45c+TuEZoI9V9lNTpq3KNXNRC5l8zurrokeE91RKJVoTIJ5V4S2dgOn5lSoZtWrXj/rt2/DeMl79Dwjvkvnhgk0OBJvF/qGpiCHTRKOowTNRbIYY1AeZA2V35NAZlbhce9P273Bk5vwGvJAz9WDjgJofxUca3KQeq4YSVRos3zIm54iTW+Mt745iRtHi6SqkzIRiAZw2y8ijFmZu2nLLEFK1fNC6/TXjFh2PzPztvohd7Q+cRxZKxNDTT6/l6TVlEDvVGs7YamjhqWadGTx/DGSsEGIEj9Nb4yzSCmVrmdU7lKKVJUuPCKei6IG5CwWkT/ldq06GSfyqx0HtHnVWNYnYljqZbUsKUDSq0Jq3YuE7RpV2/QYVO7wgJ9kdL5mHENnEWvNweGIR6/2v641hQXQKAlEdPVvqI/LvcUjR+PZeCwVw7OD4dJwhgvEuypOLAZcQuK0vexjb6Ehm19juPAIcQfxIQYD5l7Phdcb47PvZsZIjIgsTzKHy1j/rHCDseEG4HM8ra+EitwIDuPET0piVBguCX+8My9aPXfLDb2dky1tch
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 15:20:49.0672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf40d6b8-6c87-49b8-c1b2-08dc53287a25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673
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

