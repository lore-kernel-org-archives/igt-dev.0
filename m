Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACCCC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 19:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9803310E51B;
	Tue, 20 Feb 2024 19:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yiUNLWXc";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092CD10E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 19:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuyJz/nT1Ptgj1mBUPXcR4jFRae+gGbkgbs0W9K/Gj2ZzhnCp3a1uWqBzU4yQ0n8wCiwAber0EdWA5MUkuAkK+mKTwvZgmbgckwVxbBbQEOdSQ5YERRqsrqKr8/qOogD4nAUgAtsxbhKdHYkUOrHfjLPLt5h4eYH1R95mB1oJAE4adNJafYyCCwQVmpe+YP+JE5GoApCrLhQFPtz5Iq4sY/xRZ6ChlG0iIStUNvqujyLHkxS9zTGrwHGMpD+J7D7CGFKNObQIcm+at2y2f0jOcF/jgOihgM13tZdwJkIFTBaoLes045VB2DLeOn2ZReLf7hUFk25ia+w6yXEIPqNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJZ1Dx7b9ZVGgYSd1RHVcZMfsxOsU+H7Ehfdnd1znJM=;
 b=A1eXaJYIp/tzZi7zI51NNgHtkeIMAiMIgodpVa+vLHL48mBF+JGQsysPcHxitbyPpVfYeKiqUr1GwpGdKGKkTRr2mkTYRG96bzZcEgXD34s5Y3FUCdMhGBScygUpELKoC8RcSwbmsaaptMl/6m9rfewaa6ZzK9QSztkQb8x8Ppq/utjrMkh2CzcC/s/wU2qvDJ4kVpHwlOhls+lojyu2VZip8Ma+r1AuDfM8kupSjxaiXWe+OQxT52HtKCQpmpVX+0zendJ6votzIjA6hHJy4BhxYxEtePj+hxqViMrKuBUHjJnd3sPhR+gg8KP8K+FMxO5e96jSHri5v6waUc5cmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJZ1Dx7b9ZVGgYSd1RHVcZMfsxOsU+H7Ehfdnd1znJM=;
 b=yiUNLWXc8rr2mFsvwfowOQVuo5MNUtz/DXDptjEGJ3jQq7qYAT8Z7ARmufOn4HttgXjbwzoCDtnS2mWsY9R/drwww+PaW+VyE9PMhMXCtoaBl0UfZIfVxy0T9z8VlF/ep25eT9eQMCCTyvWN8bO1dpBT3MOr8N99DjRaN0A5YL0=
Received: from BL1P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::30)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 19:16:37 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::37) by BL1P221CA0018.outlook.office365.com
 (2603:10b6:208:2c5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 19:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 19:16:37 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 13:16:36 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: refactor the ABM test to use the new
 sysfs interface
Date: Tue, 20 Feb 2024 14:16:25 -0500
Message-ID: <20240220191625.27749-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6c71fb-5ea5-49f1-3814-08dc32487591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKKFLPMWBn8eu0puSicrj/Q21xseA2YVqe2HpHpzv+Ac9I/h8fscLFfJwzhMGyjgkgf1unZo7dGwizb8fg/LevFSqlXqR1bQEHp0RJjInG1hxMpGP3bBEWefiAKqt/Dad2I/dKZt0T9GeQfLPrFIsPu4oyl0f6siEWtN5zQSyt32EL08owdfO5V3UR7BoM5ok38zyflpk+xqaIsfhr7GsM3lirlp2JJ2udsi7nDJ1T3efd9iFY7k3o1gvtPxLopHZ+xQ/69FTXb1mt/4xsxlfPRPcpq84ZVb95c/W+LkhYwj3mkWE+yPcODxv97nTUoBIcp+B1gqpIiScpBkj60Qcc5yV58X2DYy+STYjXxwhKFYfYPSbJIIOa4Ku7rPVfd8cQZZEOU90HOXbVvq45tK2qTcl6w9/JtY9F0LR0wIOXqt19zinUeY123RmrbGGDjJQdL57jOZEayWLO9PiqCv5HRWARMZlkyflBxyWEDtgdd09xkugFVldbkpTMThxbe/yehtyBKHXOxU17hmAgoWh3LOKHt4YDVR7UC58904rVqhOTGe0rl6IEiQXmG0EZobN4ROLRLOlajU9JJhvz8+27O1CSu81e/P7q/uAfaO8PrqV2IA6aQG5+0YK8to1ZVZPGmYKTo3vqob/V4NEKqVKQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 19:16:37.0940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6c71fb-5ea5-49f1-3814-08dc32487591
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
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

The "abm level" DRM property is being dropped in favour of a sysfs
interface. So, change the ABM test to use the new way to set the desired
ABM level from user space.

Link: https://lore.kernel.org/r/20240216153334.83372-1-mario.limonciello@amd.com/
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 tests/amdgpu/amd_abm.c | 62 ++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 082da7ed6..e56000e02 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -35,11 +35,11 @@
 #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
+#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
 
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
-	uint32_t abm_prop_id;
 } data_t;
 
 
@@ -104,14 +104,22 @@ static int backlight_write_brightness(int value)
 	return 0;
 }
 
-static void set_abm_level(int drm_fd, int level, uint32_t abm_prop_id, uint32_t output_id)
+static void set_abm_level(char *connector_name, int level)
 {
-	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
-	int ret;
+	char buf[PATH_MAX];
+	int fd;
+
+	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
+			    connector_name) < PATH_MAX);
+
+	fd = open(buf, O_WRONLY);
+
+	igt_assert(fd != -1);
 
-	ret = drmModeObjectSetProperty(drm_fd, output_id, type,
-				       abm_prop_id, level);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
+		      write(fd, buf, 1));
+
+	igt_assert_eq(close(fd), 0);
 }
 
 static int backlight_read_max_brightness(int *result)
@@ -142,31 +150,19 @@ static int backlight_read_max_brightness(int *result)
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	drmModeConnectorPtr conn;
 	int i;
-	bool abm_prop_exists;
-	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
-	uint32_t output_id;
-
-	for (i = 0; i < display->n_outputs; i++)
-		if (display->outputs[i].config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-			break;
-	igt_skip_on_f(i ==  display->n_outputs, "no eDP connector found\n");
-
-	abm_prop_exists = false;
 
 	for (i = 0; i < display->n_outputs; i++) {
-		output_id = display->outputs[i].id;
+		conn = display->outputs[i].config.connector;
 
-		abm_prop_exists = kmstest_get_property(
-			data->drm_fd, output_id, type, "abm level",
-			&data->abm_prop_id, NULL, NULL);
-
-		if (abm_prop_exists)
-			break;
+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
+		    conn->connection == DRM_MODE_CONNECTED) {
+			return;
+		}
 	}
 
-	if (!abm_prop_exists)
-		igt_skip("No abm level property on any connector.\n");
+	igt_skip("No eDP connector found\n");
 }
 
 
@@ -187,7 +183,7 @@ static void backlight_dpms_cycle(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		set_abm_level(output->name, 0);
 		backlight_write_brightness(max_brightness / 2);
 		usleep(100000);
 		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -218,7 +214,7 @@ static void backlight_monotonic_basic(data_t *data)
 
 		brightness_step = max_brightness / 10;
 
-		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		set_abm_level(output->name, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -252,7 +248,7 @@ static void backlight_monotonic_abm(data_t *data)
 
 		brightness_step = max_brightness / 10;
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+			set_abm_level(output->name, 0);
 			backlight_write_brightness(max_brightness);
 			usleep(100000);
 			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -284,14 +280,14 @@ static void abm_enabled(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		set_abm_level(output->name, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 		pwm_without_abm = prev_pwm;
 
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data->drm_fd, i, data->abm_prop_id, output->id);
+			set_abm_level(output->name, i);
 			usleep(100000);
 			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 			igt_assert(pwm <= prev_pwm);
@@ -318,7 +314,7 @@ static void abm_gradual(data_t *data)
 
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		set_abm_level(output->name, 0);
 		backlight_write_brightness(max_brightness);
 
 		sleep(convergence_delay);
@@ -326,7 +322,7 @@ static void abm_gradual(data_t *data)
 		curr = read_current_backlight_pwm(data->drm_fd, output->name);
 
 		igt_assert_eq(prev_pwm, curr);
-		set_abm_level(data->drm_fd, 4, data->abm_prop_id, output->id);
+		set_abm_level(output->name, 4);
 		for (i = 0; i < 10; i++) {
 			usleep(100000);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
-- 
2.43.0

