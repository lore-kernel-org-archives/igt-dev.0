Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17EECD1288
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 06:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5211253B;
	Wed,  3 Apr 2024 06:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zIRQ8n5S";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D479611253B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 06:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJFh7X9LwB356l2QkkRF5mpfH5M2ALknOIzUS74oICSyfi666psHVapzSwZ040FzIOyfkqpBv2LmGExOBTOHUaCME9R4e5mkGF+80+BXLbHPvxU8lUTKs3xl83FcfMopTPgDz7vUzT4SYUFaWRfiKlOzMhBQ+Fkp6OW/GxN/wflgotgNoVWdJFnDKMtpGX1X/V/xKD5y+aBv25SsnBuUE9qAuHlbBwXMgAvjJRf8XwGry91/rtTM8DMcnRj+RTxd1EGPn+T/K15Xd0TJxkBWnG745dv5OC3kbLvU0eOIx8WS96dvH899nD97fV6rHLefqZYkJ3r+I74Ai5rZk4/MqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssm2kFleMUGGBnalJiQVO4x8gleNT9aPTdwM9QfI4aE=;
 b=futyu8po5ZP44s4gzCdf1Ur/iPPg+5M0L1cvZG0JmMqqflyJDXpHRFc5xiqjT15yT/tguRUtIYbVwe6zyWSoXLTOtRVUqyGgPb/xCapkofWa0ljkCD4l3UytXYpPgt5sNGKnpDnbEaI6oQj4itJwLradikE8D2ubZmdwDt90+NBIJwOIgFKWUM91tcWgZTjAxO91sX6Zs//OFw+oo4HymLWIgYZwTfSIfK5H1HyOVVpzePyvUssSti+qlOdn7UU67EZxblJBPUJzDzHDtUijcD2lKm2UcYUGcgiw46b7jBvm/0ZD1E67yq9ugVCCUMRyuIsV4xFiq/c+ac/2Q6D6iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssm2kFleMUGGBnalJiQVO4x8gleNT9aPTdwM9QfI4aE=;
 b=zIRQ8n5SA7eEoOOvISeQILid4+SbPxPvoFcnF6PwoKmwa5o+nSyxn4mp1t3Q9va2n86NT4tAxSpNO2bShW4i6iC3UZ7w/NehNa7WsokEiqtvV2KGWzhG1sx2BOfH4/hxWDJhuhlqamSqDX1uQ2PM9eIthDI93+5HTVLMPko0faQ=
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 06:50:22 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::60) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 06:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 06:50:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 01:50:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 01:50:21 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 01:50:19 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>, 
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,v2] tests/amdgpu/amd_abm: Fix ABM level setting
Date: Wed, 3 Apr 2024 14:49:59 +0800
Message-ID: <20240403064959.2069-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: c88eba5e-7761-499e-7595-08dc53aa5587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDNjRQeC/VZY20VSa09jkASC+WIWKwlCcVcoArQvzNLZB4/l+dQWNX3N5YjZI3o9g26Wog16c9oQ9uoDMFF8OScVZvBCZXEAH5OkbaNAh8YhsKa7yipL5dgCWc6e+wN12HK6qqOI8gmtJrTrhPa3RDvtkdidKTFXQpIPQ3ynuW9bHi6wNO9TwT2MWJS1ptZrhQRfKz8/SqCDFmmZq6ToPCAwJ2PT8eLU/NhI2w7EI1QSMuW5Cz04ewvLlGcRilwddxx2XkeJ9SiNUO85PGKMF6WSq5ImVq+tLOiuB2K0HOGVhs3MXOQAyTUXTjkurAgjCM6gPmnMFwm3WdvTUy2eGLds23C2Lvwq97bCCjElx20euwJU9aMQ0P1dAN+nJjNiqdYZzm4PucfSyh0WMMiq5atb6pX8gAXbH7jvTxyh94zGcgMpCVguIbvIAXzhH7RxIR9Pu7i1mP7HcuEHa6O/KO+TPk7cxID0RKZ7IM1EU22gAZNc3aciv3hgBPNa1G3QPP5IEzrFTRqI2oOnMF4pyAdyrcidJ7DoICT27cgnHoIHFZyJcBb6TkGTSPWSXOonxKV+TRnUIaM14KFmtj/xK+JedwmNBRCLpSk19fodSakda+iGbKpB7fi3GNQgXoQhITK5LTETPYkBF8Van1Kc/ZopM7n1X4/czsPjzv9XhtQFa0PppVyxLihzcEFsRCXAls8UnoRX8OrYc4B1b9Ct1JZUt4VVyDIsyLfTAnrLxPMPLQEY1T3H+z6znEL6+CQ1
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 06:50:22.2691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c88eba5e-7761-499e-7595-08dc53aa5587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
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
The ABM level does not take effect right after do the ABM level
set.

[How]
Trigger a full modeset to make new ABM level take effect right away
by setting DPMS off -> on transition.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 v2: Modify some comments

 tests/amdgpu/amd_abm.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e56000e02..2882c2c18 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -104,13 +104,13 @@ static int backlight_write_brightness(int value)
 	return 0;
 }
 
-static void set_abm_level(char *connector_name, int level)
+static void set_abm_level(data_t *data, igt_output_t *output, int level)
 {
 	char buf[PATH_MAX];
 	int fd;
 
 	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
-			    connector_name) < PATH_MAX);
+			    output->name) < PATH_MAX);
 
 	fd = open(buf, O_WRONLY);
 
@@ -120,6 +120,15 @@ static void set_abm_level(char *connector_name, int level)
 		      write(fd, buf, 1));
 
 	igt_assert_eq(close(fd), 0);
+
+	/**
+	 * We need to trigger a full modeset to have the new ABM level take effect.
+	 * DPMS off -> on transition is one of many approaches.
+	 */
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+			 DRM_MODE_DPMS_OFF);
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+			 DRM_MODE_DPMS_ON);
 }
 
 static int backlight_read_max_brightness(int *result)
@@ -183,7 +192,7 @@ static void backlight_dpms_cycle(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(output->name, 0);
+		set_abm_level(data, output, 0);
 		backlight_write_brightness(max_brightness / 2);
 		usleep(100000);
 		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -214,7 +223,7 @@ static void backlight_monotonic_basic(data_t *data)
 
 		brightness_step = max_brightness / 10;
 
-		set_abm_level(output->name, 0);
+		set_abm_level(data, output, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -248,7 +257,7 @@ static void backlight_monotonic_abm(data_t *data)
 
 		brightness_step = max_brightness / 10;
 		for (i = 1; i < 5; i++) {
-			set_abm_level(output->name, 0);
+			set_abm_level(data, output, 0);
 			backlight_write_brightness(max_brightness);
 			usleep(100000);
 			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -280,14 +289,14 @@ static void abm_enabled(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(output->name, 0);
+		set_abm_level(data, output, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 		pwm_without_abm = prev_pwm;
 
 		for (i = 1; i < 5; i++) {
-			set_abm_level(output->name, i);
+			set_abm_level(data, output, i);
 			usleep(100000);
 			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 			igt_assert(pwm <= prev_pwm);
@@ -314,7 +323,7 @@ static void abm_gradual(data_t *data)
 
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(output->name, 0);
+		set_abm_level(data, output, 0);
 		backlight_write_brightness(max_brightness);
 
 		sleep(convergence_delay);
@@ -322,7 +331,7 @@ static void abm_gradual(data_t *data)
 		curr = read_current_backlight_pwm(data->drm_fd, output->name);
 
 		igt_assert_eq(prev_pwm, curr);
-		set_abm_level(output->name, 4);
+		set_abm_level(data, output, 4);
 		for (i = 0; i < 10; i++) {
 			usleep(100000);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
-- 
2.34.1

