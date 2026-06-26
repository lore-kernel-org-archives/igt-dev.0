Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27514CDE00B
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 03:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5010E2D7;
	Fri, 26 Jun 2026 03:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OeHZpc9F";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBDD10E2D7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 03:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKXO9OiMAIb2ADFkfNn310IQivyJxlG3cHQOjBVcxGwfvU0fh8L6Idy4g8Gjwa1QYoMDQ3M3tnoo7xugqdMtzcA0FGn8bzGofoSrNRnRGVdW1X5gkcR/abImfOC0AYCo8FKYz5FoPbF9h83jFVxXg5boM2Yzevp4OGTO92PVGuDNFqEOslIfapxnVEk03X1QH+CbHR4eqwR/3KdJ+12IoqVQ1ShTIDUaAIXufXKWePx0JmVEdxwHx3sAD7blrbk2AsveCyHf8y+rUf8+4tk9MgQaNOY+2+G61NEkm4Olvkb85cWELRBF3SF/ZO1/f1bGupo14+yS66VX3qskujwrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR25H//Qav4cEIzJK41FRSpqL2FGe3K9E2PNQuxQhXs=;
 b=PslZ3lybqSjWdNl04oWInDoCpORwJiZxWJ+0vxGQGEzGQA45+SmrX0ixz/JicfsRAX3AxqROmGaMMUhg599KTNveGl8z6tMRS/4Xq+OIML0onXXXLsVdeVY1L70jjwReYVwJ5gp3NehU2kSBZf45fmYZ2yUxRitKohuPVP2gzhsFa6w2L1abbBfSne5jwW9PEX1+YObDngD6J9XAuQ5zcXIifR2yLgIHW6mj/pRnaU5uurX5MW3im8LYfJUxUXiL2lWqsqlQzFaEpBgwnWe+/08nzNaLTmHIUFdzDf4ZSKvf2XOoSpGDHrZQBcT0d8mkrk8ytSjZGZYvi9Ots4S0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR25H//Qav4cEIzJK41FRSpqL2FGe3K9E2PNQuxQhXs=;
 b=OeHZpc9FfH6r4Cw62ttjCoJJgvBt1BEtTGhicknxGjYDkLfiKbmdnxbm8Mh3Ywni6JPOIqokSha4JfwS+TzhN9r0KMgCEpKtb5JsD7IFb+WmGVvfqw6Tw2+hnyWSBddMRnT2BKLygkksDLjUA08NJYyqTIYejlSGAFQxVM1Tzuw=
Received: from SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::6)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Fri, 26 Jun
 2026 03:20:16 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::1) by SJ2P220CA0003.outlook.office365.com
 (2603:10b6:a03:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 03:20:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 03:20:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 22:20:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 22:20:15 -0500
Received: from james-PlumDAP-MDS1.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Thu, 25 Jun 2026 22:20:09 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Discover amdgpu backlight device
 dynamically instead of hardcoding amdgpu_bl0
Date: Fri, 26 Jun 2026 11:21:59 +0800
Message-ID: <20260626032211.38353-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d58634f-c485-4587-3af0-08ded331d7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: A2y73JozzOn46XXkB4QzEQK7G+mYd87We1T/eUfyU9B8hoY31U4gZwxAUQgzjbHnv1qV2Yw8MYTSar28uZ1AEPEqHpI1ALQkp3ND1NitBxF19w75R9vcn+TIfXCpE4B2f43osFL6NPJU7JDczDmCoD+I4+vgdAqE9CJoc1x+lPHhlj3YFMcQIuKZNnmAmOa1ZVwk0eXPJHe/+rCa32MY+DeG4XPLX/p2JywR5IsF+afzzmed62EgDMLzAV+K+KaEb9vz0ZRdgvb6EZZCAxYPL4TG7vV3/Geaf4zJUKmDEhiWwHCe01lkXNJGizbsJRc0py0zCKi/xFQIeXAFqjAUbNiUeUYpmAUEQWRUuv05Uzdbv1tAwzAWzWDACtGcfUHiRGbmNXkq95HrXoPv5Qs5UTdtTfN0LCkA8BGq3M29gvYZzSQiXUgi6SjdMYsZMlPIiOTdsaymYNNHHh4n+qqLuoM+KkeSlmxQ2udhg9aKtQe62x+QG5d3aFp1Z+KrbCV9U+FFPNA48rNk747B9sV+NNegk0aMBbOeF1hOEyo7VCoiBvknQlGKFfb1Nl7G9xe+tUw1kIOFbgigZ0dZ6bEH0HCTckNaOIm67Kp/h8I2nbFcDRIEHOmds1JLscTcYEbO43vza2XWNH6UdGKGzKd+P6LZLQEfsr/KBBlLGmXy4Pw5GpDKtNtbwklTJvIGHnzB9U9abujhuXDRhqrhd3Fg/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xLzDuEFfM2lQpa8ITt65Sw8R8Kxqy7X4T9+wnw19R6dFIJC2KzM2lSE8Cr9nkA9cLgnHOAGt6eTmMeKwK9p21xp89IHTX4I6RH/69OmoZMXb4bl1zZsoSr9+HgBXGo4zJHDWhOh8Jq6eF9TGztroZN2Vjp9u4JGoX+INGOxk+ZSBEXeOqIx5z2DiXGldJTTyyrePPN04BOuU93K2DoXoA2SYq/roRFdwLalgZBYYcNvDPGgzCp86D8OzkcmIMfLXY5xxU0s6DlbIBrDcRWdZ9SGs9qM6aSV7+aLQhO6GqtvwBh3Z1S1zRe+/QrukTTepl2O+dkiAGjGVxHXuyR0R9L3CUars1GCn1w5TypQ69J+ASziHyIVe+b0tr4pYHIZJcC+lGeDgvPotxVdtHKzszuu46RrmLQEBlhheX5s+19HJVOQ1xcR+7gfe4fGCHMrp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 03:20:16.2755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d58634f-c485-4587-3af0-08ded331d7fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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

[Why]
amd_abm builds the backlight sysfs path assuming the amdgpu backlight
device is amdgpu_bl0. The amdgpu backlight device is named amdgpu_bl<N>
where N is derived from the DRM primary node index (see
amdgpu_dm_backlight.c). On systems where the amdgpu DRM node is not
card0 (e.g. simpledrm takes card0 and amdgpu comes up as card1), the
backlight device is amdgpu_bl1, not amdgpu_bl0. The hardcoded
"/sys/class/backlight/amdgpu_bl0" path does not exist, so
backlight_read_max_brightness() and backlight_write_brightness() fail
before any test logic runs, preventing dpms_cycle and the other abm
subtests from executing.

[How]
Add find_backlight_device() to scan /sys/class/backlight for the first
entry beginning with "amdgpu_bl" and store its full path in a
file-scope buffer. Call it from igt_fixture and route the brightness
and max_brightness accessors through the discovered path instead of the
hardcoded amdgpu_bl0 macro. Use igt_require_f() so a machine with no
amdgpu backlight skips cleanly rather than asserting.

Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/amdgpu/amd_abm.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index ba90344d3..7992dfd87 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -31,13 +31,44 @@
 #include <string.h>
 #include <fcntl.h>
 #include <time.h>
+#include <dirent.h>
 
 #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
-#define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
+#define BACKLIGHT_DIR "/sys/class/backlight"
 #define PANEL_POWER_SAVINGS_ATTR "amdgpu/panel_power_savings"
 #define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
 
+/*
+ * The amdgpu backlight device is named amdgpu_bl<N> where N is derived from
+ * the DRM primary node index (see amdgpu_dm_backlight.c). On systems where
+ * the amdgpu DRM node is not card0 (e.g. card1), the device is amdgpu_bl1,
+ * not amdgpu_bl0. Discover it at runtime instead of hardcoding the name.
+ */
+static char backlight_path[PATH_MAX];
+
+static void find_backlight_device(void)
+{
+	DIR *dir;
+	struct dirent *ent;
+
+	dir = opendir(BACKLIGHT_DIR);
+	igt_require_f(dir, "Cannot open %s\n", BACKLIGHT_DIR);
+
+	while ((ent = readdir(dir))) {
+		if (strncmp(ent->d_name, "amdgpu_bl", 9) == 0) {
+			snprintf(backlight_path, sizeof(backlight_path),
+				 "%s/%s", BACKLIGHT_DIR, ent->d_name);
+			break;
+		}
+	}
+	closedir(dir);
+
+	igt_require_f(backlight_path[0] != '\0',
+		      "No amdgpu_bl* backlight device found in %s\n",
+		      BACKLIGHT_DIR);
+}
+
 typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
@@ -234,7 +265,7 @@ static int backlight_write_brightness(int value)
 	char src[64];
 	int len;
 
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "brightness") < PATH_MAX);
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s", backlight_path, "brightness") < PATH_MAX);
 	fd = open(full, O_WRONLY);
 	if (fd == -1)
 		return -errno;
@@ -288,7 +319,7 @@ static int backlight_read_max_brightness(int *result)
 	char dst[64];
 	int r, e;
 
-	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, "max_brightness") < PATH_MAX);
+	igt_assert(snprintf(full, PATH_MAX, "%s/%s", backlight_path, "max_brightness") < PATH_MAX);
 
 	fd = open(full, O_RDONLY);
 	if (fd == -1)
@@ -528,6 +559,8 @@ int igt_main()
 
 		igt_display_require(&data.display, data.drm_fd);
 
+		find_backlight_device();
+
 		test_init(&data);
 	}
 
-- 
2.43.0

