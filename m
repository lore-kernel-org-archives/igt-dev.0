Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD697606A33D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 05:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OFWlHLY8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522E110E0C1;
	Fri, 13 Nov 2026 05:33:32 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD6F10E44D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 05:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NseX9I85m6F39KrtU2LND0zx30LDPMZOZMkFwFoj34peft3p8KGt7tGVNaEne4EL0Oe94f0ER0pU36FT1UUz2gGKT8fJsmRiO2j31vfiaDZ0kbdqeuMNyeRzis2lUehgBFp5S9in3t737x6gBelBA+UkIBsjlhkCLowF7Xk77YLi0yl9VD1/IyNvrUwlYOg8/Ch3PzkdxQkRmBL5SEp4Xy+fbnMWWu4AhpdIRA4nLIb6frPJX7VFTwRDCMAs6VhNbktDCDfO0bV8GQ6SbuNplJGBBt9yQYtssacGqBu/tDU1F0JEuz+Y1W7RNDt0y6Mk+imgLZfpcSZ39tNW9YcN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGlEM8rrlsXHv/ccoGE5idQYhf5ZSoFQyoX+C+qtv+E=;
 b=MIl/Vg2JxozPzCDcYJaKU2HEaCshS9Pz1JtgjLTGXtTUrn7EsSVXlrUJhJ/Y/WgmBd1lkNn95ROLCk1YxZBI9YZiEzMVw15MocNbDpnsxj12PilN6DkkfksIcrQsGcK7CRi7Kq1filCmB9SwoTsZT4EmVREta+pNxqL77bSCm4vqY6GQKBeGj0Ff3s+J2xkRvaG3m4Cy6LAyYAaldovKHgW6JxyE89DW5Cls8psbPq3qt/nQySIvR4huLPD83MwNWyw5uYJdtoVabTcizo8F+Z1vFnrO7+cwotGSwVOe9Ki4L8lK/qTA7T7eBnt+6spZ0kUuCiDQvRmU9D9F++IGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGlEM8rrlsXHv/ccoGE5idQYhf5ZSoFQyoX+C+qtv+E=;
 b=OFWlHLY8VKnhhzaKx3GIPK5m36ISKIS9BzUjmHKXkKatABoB4IdWfTiqMVhEG2Qw1/fXYry1qlF8qPWNq9OGtIS/AIXXJsgln1xiftk6SZdSuJmYvoYbr8pprlQWYZ2Ml4BRrBcgQhAyrRmaI4Jw5ssOgcTG0yetS8fzvxn2abU=
Received: from BN9PR03CA0526.namprd03.prod.outlook.com (2603:10b6:408:131::21)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 05:29:07 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::1f) by BN9PR03CA0526.outlook.office365.com
 (2603:10b6:408:131::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 05:29:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BDA.mail.protection.outlook.com (10.167.248.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 05:28:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 23:28:40 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 23:28:38 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, "Ray
 Wu" <ray.wu@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_replay: Fix state and sink status
 checks
Date: Fri, 13 Nov 2026 13:28:29 +0800
Message-ID: <20261113052845.3333547-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a35140-f02f-42ef-9b8c-08df4146fa12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261022105027099003|261028144727099003|261026140227099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: NaDOGpGpZ40Do9gfFL+ol71RiwInfqTDzWzRho1Oa85/rx+EFg80YhAHqHfnWqBzsT5wo1xl7yLgRowFoEkvbzQIDYSz+Eqs4sMswM0qWTmHehH59yRh/oI6Qk2WRxiCqnvYA6Dab0PHyv5AZFSk8TjVKiQOxd/ZUiF4tws0Q3yOoHq+4lUxCBkF6Gtmbwuil7+UdV2GWUpFm+CEoP+xryV7qZdzphADAnGAdolLcCgZzlZRKJvjW+fp/yh2EhW6DQ7ydsJLU+tlvXDfmpH82EfN+2TBhzoHMHYE2dIU1RWHsJ2su5Llkk2lGRKvxOiBTCLuLeW04gzuvYEDTaXIWlMZ9b/mU42EcoNBZ0+e3Zz3cksfPZ4wd3gIdx2HCSGkaQxgdM9qPzwitkegr6Fs/VOemNMk5lVIwN7X4OqbqV8KTnSXsq5cF3CLjIwYuKCFYDr2QsmlE6QNDpmmbA3nRsdaiAvkSONZjME/TBSHDjH7B768M6UNBSOA8oNBWoy+kTfcKv50UW/ZcUaa1jER0jv2c4wrle5k2csdT5FCAsTCoPeSvkzLGacAWro55yyFRzuYGR8xAc5TcddDRbilhb/3pj6BDZVV9UROF6hPimVJualPLnF0yQriDQ7/Ec4N/fcT+AaQvT0H2wbt6YYbBXN3JZNOpkSwuavvOrGcr6HdPE/phdUI4oHx2pbKw6cS5pUb8esBT2Q3l1rJAgvtJw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261022105027099003)(261028144727099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VM40PahO1o8N3DcpE815rWGGG2k/LTIpvxPZ9eBT446WbweCdLuNKfTgbh/B/I6xf7mjKcp4eTCFBEmNzVZaJqeNLjWM1965aRpfJd/7UuKTnnmOap7IevmZza3/5uzoJlgHja8aO85CwFNMajAilqkWLBvOP0FKQwvezzybEm5Kllm+qaTUaQI4Nx4zvI3YjlgcNBsQW/wtKbxohesM0ndZqiLIk4iEdhlZqslbBxF77amKLvTh+7apRZrouHY7Ipgb0Lspg2L8DLG1cG9gFRYbUgZ5H/6J+0kaloYHb3bA3jEXLEWzO4Ng6ulM+JHIsdQbuGsYtFE1FcQzbzOCpa37JrP1e8Tjt2uCPX8dj1N8L+VPfSqHqCLv6Mkty/O5JTH7G8grGrRX5hYh9MU4mS0YHyw+6PHRVrDaAfFSXNawbXnCHRSDILcswOqCgwhf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 05:28:40.8567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a35140-f02f-42ef-9b8c-08df4146fa12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most checks in amd_replay can never fail:
- State range checks use "&&" and are always false.
- The live-mode test_mode check misses constant live, and the
  static-screen check is always true.
- The settle check accepts REPLAY_STATE_2 (entry only).
- DPCD 0x378 is only checked for non-zero.

Use "||" for the state ranges, fix both test_mode checks and require
REPLAY_STATE_3 after settle. Fail on the 0x378 error bits (desync only
when enabled in 0x37B) and sink device status 0x7, following the amdgpu
DC bit layout.

Also read DPCD with pread() so a short read cannot return a byte from
the wrong offset, drop the double close of dir_fd, and fail instead of
skip on page flip errors.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 92 +++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 38 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 775bed190..c2eb8ec04 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -16,6 +16,19 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
 #define REPLAY_SETTLE_DELAY 10
 #define FLIP_FRAME_BEFORE_TEST 60
 
+/*
+ * FreeSync Replay sink DPCDs, aligned with amdgpu kernel
+ * 'union dpcd_replay_configuration' and
+ * 'union replay_enable_and_configuration' in dc_dp_types.h
+ */
+#define DP_SINK_PR_REPLAY_STATUS		0x378
+#define DP_SINK_PR_ENABLE_AND_CONFIGURATION	0x37B
+#define REPLAY_STATUS_STATE_TRANSITION_ERROR	(1 << 0)
+#define REPLAY_STATUS_DESYNC_ERROR		(1 << 1)
+#define REPLAY_STATUS_SINK_DEVICE_STATUS(x)	(((x) >> 2) & 0x7)
+#define REPLAY_SINK_DEVICE_STATUS_ERROR		0x7
+#define REPLAY_CONFIG_DESYNC_ERROR_VERIFY	(1 << 1)
+
 /* Common test data. */
 struct test_data {
 	igt_display_t display;
@@ -159,7 +172,6 @@ static bool dpcd_read_byte(int drm_fd,
 {
 	DIR *dir;
 	int dir_fd;
-	uint8_t buf[16] = {0};
 	*val = 0;
 
 	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
@@ -171,7 +183,7 @@ static bool dpcd_read_byte(int drm_fd,
 	for (;;) {
 		struct dirent *ent;
 		char path[5 + sizeof(ent->d_name)];
-		int fd, ret, i, j, k;
+		int fd, ret;
 
 		ent = readdir(dir);
 		if (!ent)
@@ -185,43 +197,53 @@ static bool dpcd_read_byte(int drm_fd,
 		fd = open(path, O_RDONLY);
 		igt_assert(fd >= 0);
 
-		k = (addr / 16) + 1;
-		j = addr % 16;
-
-		/* read 16 bytes each loop */
-		for (i = 0; i < k; i++) {
-			ret = read(fd, buf, sizeof(buf));
-			if (ret < 0)
-				break;
-			if (ret != sizeof(buf))
-				break;
-		}
+		ret = pread(fd, val, 1, addr);
 
 		close(fd);
 
+		/* closedir() also closes dir_fd */
 		closedir(dir);
-		close(dir_fd);
 
-		if (ret > 0)
-			*val = buf[j];
-
-		return (ret > 0);
+		return (ret == 1);
 	}
 
 	closedir(dir);
-	close(dir_fd);
 
 	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
 
 	return false;
 }
 
+/* Check sink Replay status (DPCD 0x378) reports no error */
+static void check_sink_status(struct test_data *data, igt_output_t *output)
+{
+	uint8_t status = 0, config = 0, error_mask;
+
+	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
+		     DP_SINK_PR_ENABLE_AND_CONFIGURATION, &config),
+		     "Failed to read DPCD 0x37B\n");
+	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
+		     DP_SINK_PR_REPLAY_STATUS, &status),
+		     "Failed to read DPCD 0x378\n");
+	igt_debug("DPCD 0x378 = 0x%02X, 0x37B = 0x%02X\n", status, config);
+
+	/* Desync error is only reported when desync verification is enabled */
+	error_mask = REPLAY_STATUS_STATE_TRANSITION_ERROR;
+	if (config & REPLAY_CONFIG_DESYNC_ERROR_VERIFY)
+		error_mask |= REPLAY_STATUS_DESYNC_ERROR;
+
+	igt_fail_on_f(status & error_mask,
+		      "Sink reported Replay error, DPCD 0x378 = 0x%02X\n", status);
+	igt_fail_on_f(REPLAY_STATUS_SINK_DEVICE_STATUS(status) == REPLAY_SINK_DEVICE_STATUS_ERROR,
+		      "Sink reported device error, DPCD 0x378 = 0x%02X\n", status);
+	igt_fail_on_f(status == 0, "Panel is not in replay mode\n");
+}
+
 static void page_flip_test(struct test_data *data, igt_output_t *output,
 						 enum test_mode test_mode, uint32_t frame_num)
 {
 	int ret, frame_count;
 	enum replay_state replay_state;
-	uint8_t panel_dpcd = 0;
 
 	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
 	    || frame_num <= 5) {
@@ -233,18 +255,17 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
 		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
 				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
-		igt_require(ret == 0);
+		igt_assert_eq(ret, 0);
 		kmstest_wait_for_pageflip(data->fd);
 
-		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+		if ((test_mode == TEST_MODE_CONSTANT_LIVE || test_mode == TEST_MODE_INTERMITTENT_LIVE)
 				&& frame_count > 5) {
 			/* Panel Replay state needs few frame to enter the live mode */
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state live mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
+			igt_fail_on_f(replay_state < REPLAY_STATE_4 || replay_state >= REPLAY_STATE_5,
 					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		if (frame_count % 2 == 0)
@@ -259,7 +280,6 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 	int edp_idx;
 	enum replay_state replay_state;
 	igt_output_t *output;
-	uint8_t panel_dpcd = 0;
 
 	test_init(data);
 
@@ -295,23 +315,22 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
 		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
 		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
-		igt_fail_on_f(replay_state < REPLAY_STATE_2,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3,
 			 "Panel Replay was not enabled for connector %s\n", output->name);
 
 		/* Do some page flip and let the replay go into live mode */
 		page_flip_test(data, output, test_mode, 20);
 
 		/* Check Panel Replay state in static screen */
-		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
+		if (test_mode == TEST_MODE_STATIC_SCREEN || test_mode == TEST_MODE_INTERMITTENT_LIVE) {
 			/* Panel Replay state takes some time to settle its value on static screen */
 			sleep(1);
 
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state static mode = 0x%X\n", replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		/* Do another page flip if we do the replay_intermittent_live test */
@@ -322,12 +341,11 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 			sleep(1);
 
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
-			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
 				 replay_state);
-			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 				 "State should be REPLAY_STATE_3 (Active)\n");
-			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+			check_sink_status(data, output);
 		}
 
 		igt_remove_fb(data->fd, &data->ref_fb);
@@ -342,7 +360,6 @@ static void run_check_replay_suspend(struct test_data *data)
 	int edp_idx;
 	enum replay_state replay_state;
 	igt_output_t *output;
-	uint8_t panel_dpcd = 0;
 
 	test_init(data);
 
@@ -378,11 +395,10 @@ static void run_check_replay_suspend(struct test_data *data)
 		sleep(REPLAY_SETTLE_DELAY);
 
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
-		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
 		igt_debug("replay_state static mode = 0x%X\n", replay_state);
-		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
 			 "State should be REPLAY_STATE_3 (Active)\n");
-		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
+		check_sink_status(data, output);
 
 		igt_remove_fb(data->fd, &data->ref_fb);
 		igt_remove_fb(data->fd, &data->ref_fb2);
-- 
2.43.0

