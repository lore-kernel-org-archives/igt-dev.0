Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB4CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 07:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7310E9A7;
	Tue, 23 Jun 2026 07:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DV3y8AEt";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE5310E9A7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 07:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOKV5ZyY2oGRFVlRV9dZhSMu9S2oblLpWkMa6DT256/iR1z7FVC6bJ3BtMp6XG0Gk/B6jtMzImoGrU4xQGUaipo4dAqd07YLFSkO0k1nMbP0dVJfs4XHqPnt1HRWMyiLQk8pulaWaA+vA+8mPzxYeyZT5h1ST8lCs+G5HJJgsb2y7AmZKK4tgqqNdaa65A+eg2LTWD0uXTJnSpbdKciyhCZtf37Tlfb/R9Bx5tpA+x2rhLn6qwCbotiQozJnF7cWmf8YN+O4xo3QLdWi164ZLh3GJPhxf1OlbPj0my6B0IOjpkn2QXBK4aKsZ6k5K3lfl1VlqcM+ED9lbjlAeLmR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1SYCP/9eM7j8UJ2Qq1gvEgFktJ8pAyfwOaXYxyb3FQ=;
 b=fjATz5iBR7oZ6wPTrPRiBl+zmgcMfXBI7p+NG86IyIChIawe3y1b8na6d0s5BRYUmoyjf4UmLkazvKI0EF9HCmJ5StL1W9va1QDbfc5UUhBbnN/W7CpVqlg+jRckF1aG7jRZhOwu3uye314u7+TeYgs5agTW6zBlvUSqDJKjuaQlTBFjc/uKOq5fB9tHRHeZusneKgtnKGgImGtH3Bugtu/UyrdJCtMYUCP/CiuH1EtfCII9YyIGf9FQh9Hm7NDJI3pN3lJ1UDO1BH350HRxicH9AsorJf/CoRfDvx/+YfLavBS5wa8V5lo0vSH3FE/I9zb9f+MWIy5s6HOmEYakqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1SYCP/9eM7j8UJ2Qq1gvEgFktJ8pAyfwOaXYxyb3FQ=;
 b=DV3y8AEtwZyKht+8yjEgQos19tgtsw/ZG5fGQZnfppte+Dr6ECwMyz/2Rc+qQ9zvrE8X+uebwQiodye26BCQzc8wk8y8E57mKMhWDRsejHqxhhXz5EWWsZSV8+s/6Fsg26Nq7SvzM9YyCoUTkhAlmryfG+0MthgyFWb2DlmaIWk=
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 07:46:14 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::ab) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 23 Jun 2026 07:46:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 07:46:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 02:46:12 -0500
Received: from james-PlumDAP-MDS1.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 23 Jun 2026 02:46:06 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Resolve DRM card index dynamically
 instead of hardcoding card0
Date: Tue, 23 Jun 2026 15:47:28 +0800
Message-ID: <20260623074749.13734-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: a2effe00-a042-45b7-86ad-08ded0fb8068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: rlOIcxkHM25FcIq0/SaT5ZWGhm/mVsz4KYwoL5hO9XLp+7JHLnySXlFblJS/b+sKIYw2ZVY8P018Y2ZlYJc3BSS9AIx4/LOHBp8CdqlX5HS/4gCkgk42h70ftXjnjOvjzGqFtqquPTCEYEYkQgBTGdpe8hx/RsNYZDKtaosDrAd9cfYrn79F+qKIJthLdb5qjvIIpCu7NuNqX4pi25Ic3eeUpKN1IkF5ppev4weOtZQ0SvUfcpzCFQNrf+DZuw5teMZUvh39oO1JG0gv0ih4pkQEP7fRsl6tzLKbyfj9LwoaiuYeoXMevRjiNbSZgiPHMv2c/jx99qP68Qd67os+Cwxc6A/NgrELxVQu0xZrQtH5EOnsaKrtxtZhYmAkNk9kcFnXn6mIqYWCHSo0VPkuptwh58iSChuyzD0rB5k44mWkIT3tv9/PwSavj7GObZx5+qLuOD+AQa+FwG0mcbD4bN5C55+5hD0Vl6N59NUtqsV/uVVTNHaCgdxr4DouLXbSQlfNZUcOZRIWlTALVYLOkB+rhNzXiXLna97e4tU03oiDUN9gpUuNbV99WEZyaA18ir57mFoJSLRsPz6ZAuFuP2JYTpExeujnrClHPh+BuVtZtBIfjJdXgXUWYoJS2PIh/Woqniw7PGUAUK7x8SXuD5pqrRSICIgvb8gI769assd293jCYP/2M5MSIs3g0V0FV8PkMw3Llz5fFW4f9LVHcg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oYZlL3fEHEmR5F4SCtz8Tu+fGm/AfxaWLcLd4/lI7wAF3RiKZgN27NcYnj0Abcs1RBWB0Mui1ZDf52JlKjGpkw2VLHO3UTC8vlyC5tbsl3bUjt5wpMNPGFqsfZghQU8vpooakCpCQQXO+QC0jn5wHZeeh5XXXBBUJqT2BwJb3yg0tjUCAUYAtRM9KgABKMiyYlcsZmxsfFenE5aODgOTfIr3R769iGq4ZThQSmOe2ziKvgoJdVxKLGFunlde8VuxHhFnPZGnE/yqccRdatHipbEabDAyHaZeqlsS5/UrEUtYVRCgPC8Muf+9kcV8hTcyEsP7rHS+GwTxFj8ucLbhv+NZqk+22aFEGADWV7rEPZfcCCaauF6mjoMAA/Sr7sDPyg/kIg1+L6PGQERfIzRxjnvN4Id+CxHwq4TaDMtNuddHvxzTz0vDG9HgZ+yrLqH2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 07:46:14.1448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2effe00-a042-45b7-86ad-08ded0fb8068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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
amd_assr and amd_abm build connector sysfs paths assuming the amdgpu
device is card0. On systems where simpledrm registers the boot
framebuffer first, it takes card0 and amdgpu comes up as card1.
Since DRM minor numbers are never reclaimed, amdgpu stays card1 even
after simpledrm goes away, so the hardcoded "card0-<connector>" paths
do not exist and find_aux_dev() and set_abm_level() fail, preventing
the tests from running.

[How]
Open the connector's sysfs directory via igt_connector_sysfs_open(),
which derives the real DRM card index, and access the AUX device and
panel_power_savings relative to that directory instead of building a
card0 path by hand.

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/amdgpu/amd_abm.c  | 27 ++++++++++++++++++---------
 tests/amdgpu/amd_assr.c | 26 ++++++++++++++------------
 2 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 207d075b0..ba90344d3 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -35,7 +35,7 @@
 #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
-#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
+#define PANEL_POWER_SAVINGS_ATTR "amdgpu/panel_power_savings"
 #define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
 
 typedef struct data {
@@ -252,14 +252,23 @@ static int backlight_write_brightness(int value)
 static void set_abm_level(data_t *data, igt_output_t *output, int level)
 {
 	char buf[PATH_MAX];
-	int fd;
-
-	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
-			    output->name) < PATH_MAX);
-
-	fd = open(buf, O_WRONLY);
-
-	igt_skip_on_f(fd == -1, "Cannot find %s. Is it an OLED?\n", buf);
+	int fd, conn_fd;
+
+	/* Open the connector's sysfs directory via the IGT helper, which
+	 * derives the real DRM card index instead of assuming card0. On
+	 * systems where the amdgpu device is not card0 (e.g. another DRM
+	 * node grabbed card0), the previous hardcoded "card0-<conn>" path
+	 * did not exist and panel_power_savings could never be found.
+	 */
+	conn_fd = igt_connector_sysfs_open(data->drm_fd, output->config.connector);
+	igt_skip_on_f(conn_fd < 0, "Cannot open sysfs dir for connector %s\n",
+		      output->name);
+
+	fd = openat(conn_fd, PANEL_POWER_SAVINGS_ATTR, O_WRONLY);
+	close(conn_fd);
+
+	igt_skip_on_f(fd == -1, "Cannot find %s for %s. Is it an OLED?\n",
+		      PANEL_POWER_SAVINGS_ATTR, output->name);
 
 	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
 		      write(fd, buf, 1));
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 71209e79f..ae8420183 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -63,25 +63,27 @@ static void test_fini(data_t *data)
 static char *find_aux_dev(data_t *data, igt_output_t *output,
 				char *aux_dev, size_t max_aux_dev_len)
 {
-	char sysfs_name[PATH_MAX] = { 0 };
-	/* +7 only to get rid of snprintf_chk warning.
-	 * Path name cannot exceed the size of PATH_MAX anyway.
-	 */
-	char conn_dir_name[PATH_MAX+7] = { 0 };
 	DIR *dir;
 	struct dirent *dirent;
+	int conn_fd;
 
 	aux_dev[0] = 0;
 
-	if(igt_sysfs_path(data->fd, sysfs_name, sizeof(sysfs_name))) {
-			snprintf(conn_dir_name, sizeof(conn_dir_name),
-					"%s%scard0%s%s",
-					sysfs_name, "/", "-", output->name);
-	}
+	/* Open the connector's sysfs directory via the IGT helper, which
+	 * derives the real DRM card index instead of assuming card0. On
+	 * systems where the amdgpu device is not card0 (e.g. another DRM
+	 * node grabbed card0), the previous hardcoded "card0-<conn>" path
+	 * did not exist and the AUX device could never be found.
+	 */
+	conn_fd = igt_connector_sysfs_open(data->fd, output->config.connector);
+	if (conn_fd < 0)
+		return NULL;
 
-	dir = opendir(conn_dir_name);
-	if (!dir)
+	dir = fdopendir(conn_fd);
+	if (!dir) {
+		close(conn_fd);
 		return NULL;
+	}
 
 	while((dirent = readdir(dir))) {
 		if (strncmp(dirent->d_name, "drm_dp_aux", sizeof("drm_dp_aux")-1))
-- 
2.43.0

