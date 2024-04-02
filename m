Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60604CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 07:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE8F10F3E6;
	Tue,  2 Apr 2024 07:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b+1yYlyj";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD04910F3E6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 07:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqHYy9l83OYB9EL1ZhaQ4z9zfarserQ2MpKz+EwlK+s8IdIyLuIN3HGOUyx8SdpMzau9vl9hqHgc4FFkPXfl1+ZCttP1M8xhg6H4RefMYyl7aHodVUUE2mGMSeqmD0RefaXOe/ngNy+ci2blM8phYpmbgThIIRzzBhO3Bt/Y3q0ugk5fsnafoexN7YnxNTaO7MXPnHJj2/jbEEdHgIiKpwIM6xLCnRPhopboXVhW+UVHl4CyxgLbvoPnJYzbnSLqpEbRvu6mRUxn8Laws8TRTCuRO8jUGeutusrRofpt5UL9Ix+sOdlcDSC5vaRsL/SIHXRIQglPheMoE31ILeRM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpqExxCuOqDPeFziHci+16SOL5VS2izCcLkeiuxDarw=;
 b=oa9kGN8yRJhshUDSoO1buo+If1TBxPltgbCRu9A/3a2gArpiMDZjI46G0tOH6TujdcaXMZTNlajfnFWW09+ovqmWBB44vke7/f8XY99c0F7fP3zTmBk+Sj3wVzEAsPaAjkhP+O/QvVW0/Rc7c8A1EtMLHr76Tgo//8mk0tXBvi/nhUGIVjptCv5dIFovF1AFlCHbVntL3VLJY+ihHr68NvOHqm0gQOJ3VEdbd/tkElQFtvfAXDU3hgPS+D43nbluGqg+RFAI1xdK2oR9oYrVnIRPDKKIMJJimJtD8Y3eBb2P6LbdDny0ppJx7jMRlQow1evHp2LHsBXVbUh+8PCbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpqExxCuOqDPeFziHci+16SOL5VS2izCcLkeiuxDarw=;
 b=b+1yYlyjVhwpHaAKARqDnP/ybXt2fIM5YXrsKvESzQpkxqpCYw48cSejls2QPtUhF4qsCDk0zEmuusNbrwNxXaJtj2Bn0LhKt3IiK2iQghPupC2P7WOU/kEbvOrljho9n7cvAfZqhGmHZtrSiXf7ZZ6Ksyjg1Bkchy835AOQ8D8=
Received: from CH2PR05CA0050.namprd05.prod.outlook.com (2603:10b6:610:38::27)
 by CH3PR12MB9251.namprd12.prod.outlook.com (2603:10b6:610:1bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 07:52:20 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::aa) by CH2PR05CA0050.outlook.office365.com
 (2603:10b6:610:38::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25 via Frontend
 Transport; Tue, 2 Apr 2024 07:52:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 07:52:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 02:52:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 02:52:18 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 02:52:17 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>, 
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_abm: Fix ABM level setting
Date: Tue, 2 Apr 2024 15:52:08 +0800
Message-ID: <20240402075208.21223-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH3PR12MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c6f993-5b09-4a24-f3a7-08dc52e9d2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJsQoSMlYTYkRyEj85lV7u97KTL8ccaLTuoWX8gXpPxMJksDUM4TOoEt4IDQ0IIb6P1nVtEPTAl8BWFDywsfXbwc+J0jg/gV/8GYJJE+vqdsni7Yy8/SRA7rnjSeET1E8EhNR873omiUbpOhH1ZDelzoAKNZ4DI2oy5JF0zzQy9XHLXmU8lDSvwzbEPYDVHfCT9Jjo2rtoPTwyFlyxJksU1I58bRyHYFAwRcgwbi9owQsF5A9jK9qV7VnArpdioO+halwLp6K0ATHsl5AO7qiKEhz/6v8VtRqjVu9XOtGQSv+Jwy3dJQKgrn6lOfUnKRrhQTXYXSuiin19G8ggQL856jTCnJdchTMV+XfDlwHmZ9riDXdLh/btn+ssQI4rRUmsqEb+1TPmnpOsh3bXrwx+bBRT63iO90iRQZgXvdn8zgAF4pQL00Ff5Pc9WJbUZ5Pj5rkxMi2ZSzfCKLk3rAcgrCk6e/0loXplyWZvLW6RNwjdgmQHsTkzV0DvOjoW76GaWrEdA6zOrcFJIpaa9l+xy6FPDkCFm4engETbYC27S2vW/EHVY9UK+EyzYg2ObpZBEJKBPgLNCpPOvUwQeQAb+SS1CSeYHks2x7I3d4bNBH04GdgfcOpdhtZhIYmcU/3qRtJbNSpr/fHNm5ApDB+8N3J19OcNez74HbYALCtwE0Xrr8a9hMXF0oIhKUis0p99PAaD75UfQorpthLja0j6y/9ZGRYsfA9mDGsSb6BTlLXmwPNLSLi3wd+ucnRJf/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 07:52:19.7514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c6f993-5b09-4a24-f3a7-08dc52e9d2de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9251
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
 tests/amdgpu/amd_abm.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e56000e02..24783fb57 100644
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
+	 * We need to trigger a full modeset to make new ABM level take effect.
+	 * DPMS off -> on transition is one of approaches.
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

