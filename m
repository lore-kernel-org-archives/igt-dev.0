Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B632AC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 10:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6210E5FC;
	Tue, 25 Feb 2025 10:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HP+ZXkdM";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2861210E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 10:10:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmGbs8Gu24Es/INdcV+7EIc7k5psegnavjXdS9X4eaZC2ZnSR9eCy7och/NQ95li8sc43hlX7bpfdlVqCkQlX7j+EDJkr0+hvq3Y1w0D2pE+d8ofXLYydH6mXLh7x4V2IzRHVZktJO7Dr/RpZyzVvxAks1C0QAtjMMlrEVwllydBPHyDhUXBDZQVjMiSYBsm0CtLTviltHr8paOfuCeL4wQAQ7Ww6KPM4iBXEgaByS5Ot6tCIN0wj6opMM6CnAM9NQ1VppMd6qHe4a7b1ybaLKjLnYzaUy808ZZVzW9XBKn8I9uSWiM4ckB/dJFrkGJtZHfG1RhewjEdCquHQz9w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pokpHKDky+Cp6BE0KWmy1fEX5jEMy+4bpuJGmyAkdLM=;
 b=HkaTsnIAjyfUIPDkIYZKebRNhrrNfChnHxK+7LbI2KRtdmhRjc34WCSBIOvD6L94JsHBOeL0dDPvA5WEUgDv+/ozg+g0YaXB4rIb8OD+Yryv76aQExxDXMEGmT8nMLwoaUcKO64x1eA0JUAiPcuRLX9VE6wCXpIz6yKWnyMt2x74+mZYpzTSKndnHOXMWP0GGLQqE4W6yTJSs+SzTbxviL3XBEN7DDe/IgAl8m+t7sCeEiMON0kd34W+TueQ0n6vmaDvMuYNqm/AInHVnx0EpFeevGGlSqtEjQjTxuAeaZTYrK7w1CJgFCmo+hQ69zRuiW1WYvDUCQwDtTiVvvrVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pokpHKDky+Cp6BE0KWmy1fEX5jEMy+4bpuJGmyAkdLM=;
 b=HP+ZXkdMzbWjWQAjZ97zesadzwmaxSkyF+tB5LtJUpH+5T2M96H5settv1sqROgxO3kViAKoveYYCLT+mFWzHbhbANFTaUzTYMUVs+fjSDP9ug1BiisU2SU4mypWmnwGndz2XKi3a1vI6vJb+1me6kKYJmRaHIVWcxIbpo7pWLs=
Received: from DM6PR07CA0088.namprd07.prod.outlook.com (2603:10b6:5:337::21)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:10:11 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::ff) by DM6PR07CA0088.outlook.office365.com
 (2603:10b6:5:337::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 10:10:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 10:10:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 04:10:10 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Feb 2025 04:10:09 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,
 v3] tests/amdgpu/amd_abm: Fix test failed on self-refresh panel
Date: Tue, 25 Feb 2025 18:09:29 +0800
Message-ID: <20250225101006.10869-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: ce05063a-e6b9-462e-c7a7-08dd558496d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1kgqI1+U+qVsU+3DNgZQyWth2ug0lUxh8XOziLBpta07VmlSE6OLmBgmn1dx?=
 =?us-ascii?Q?WMds+q3kKlfqthXgMeOjjlWAewJJqHvUXIuIMdqRHaf9rPBeCYiaVzQwzYQX?=
 =?us-ascii?Q?EGcqraCiaEj3GuYr/6x5eNZlGZ1pHJyiBgNC+kncvqTVUE7uDtOWipVCiq9V?=
 =?us-ascii?Q?+q8dnNlevReFrTAVfOLEkjufqPRe4aOUyRmHZNx/cbyMrH8CcyjYFlWWy1ni?=
 =?us-ascii?Q?cNv95vH6O6xgNMOfczUnYgVr5THhdaYQT1CRIcAQIh2mCqbonbRhhV1mSfHt?=
 =?us-ascii?Q?DziNqnk1WPOR5O4CXg4n5VCohNPebPFwYusFVXcFKjgXSk2LYp13Ggg2WrtK?=
 =?us-ascii?Q?VYLBBquGMTfebranGiXBJZmRxtbkcZDor3rnduyon2DzNV0mM3El7RseK8+q?=
 =?us-ascii?Q?PFCqY8d5IHC+6qXtceE/MxXS8hEMVBuys9SKpYlry9jRva5ZT8EF/xxgCjpD?=
 =?us-ascii?Q?sjJyZSITYRNyqQxpYkOlbryi7nFjH2Ju/b/FWDyOMat6aDYirnkKOo3ekQnY?=
 =?us-ascii?Q?LL/x/M2USDQqWOyhqMgN+IzydCGOxZ0xcYJJIj+tKxjo8RuRdT/C2bEqriRa?=
 =?us-ascii?Q?PgcYVcNCdM524h38u/xR6YUFZWCrt3P1qPhaUo3+GGSc6HR7MaFLPGsD6APT?=
 =?us-ascii?Q?nbtSf9U6eO5mJ7k0dQGGwklc6j/WLxd6phiYAS+Zr8l6ND2tihyoWCTTiAOo?=
 =?us-ascii?Q?rnvqkqdbvjmZzwajdcDjWbvLcGxVT60M2+Et3kjaAiGuUwH5GzMrmP7f3mQf?=
 =?us-ascii?Q?GGRxMjrHVWBJbr2EjdRRBoMNkdS0QsoDD1CAt55NK/NoxBJLnrRLDQhOTUF5?=
 =?us-ascii?Q?hVUR/UIooXGhFvfvulznCX5kwr0f5vWbZTxL5B4GyeWnPtZiFCWsivQnIaHy?=
 =?us-ascii?Q?CtIiPqB56gorAA+prb646pq+f+TMwqML3ufFrmky5ex/pB5P0bZDYynyHmhK?=
 =?us-ascii?Q?EfjCEjGkJTFOGUbyltQveuTD4KB5N7WgOICChaid3B9AdqT+I0wHeg7KIZ1N?=
 =?us-ascii?Q?8af66JH2GE8aVkRoP6htWxQbkk9UJ5tseuZefU2Y83mqpPfA/T7KE4zS+FLm?=
 =?us-ascii?Q?YhnFM9GA055RjoXRLMbTpOfkxJSbz3doUZSwEK3OsFSmNzrPfyFbxDdPbC26?=
 =?us-ascii?Q?Giec9q3IhU2EBiDav9s151UMLyMDJ3UfcQnmoczy5M9eRYaWzqkzJxFy0vig?=
 =?us-ascii?Q?LSYspjxBl/veEyauDAXn4jQFho2stfg6lw++7kzK836b6hasqRvsrkgOhKYT?=
 =?us-ascii?Q?6qWay0Tzs/zUeC/MEx8KAkG6PeF1UmOY2TrX2q2q06UO5hiI6G0LXaCVwGG+?=
 =?us-ascii?Q?VG4SImNfIElrfK+WVWJL5jCFpFHGieuWkCN1kBJQi04SroXzYfzWRhbApF9s?=
 =?us-ascii?Q?2jtb1bUqERHTgn2kiZM6EcLFuqk5THNZc21lA19wA6Mci52ZcsQPlM6+3d+l?=
 =?us-ascii?Q?K8/nRK8hJvdyae5ekgzAUqqgimPezSiu77kmYUNgdGJqJqKkmK4lzdKAjR2n?=
 =?us-ascii?Q?RI5/2ZTeH1cyn0Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:10:11.0177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce05063a-e6b9-462e-c7a7-08dd558496d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491
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
For self-refresh enabled eDP panel, it will have some delay before
backlight take effect after set the abm and cause test failed.

[How]
Slightly reduce the brightness before test and do some page flip
during the test can resolve this issue.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
v3: fix conflict

 tests/amdgpu/amd_abm.c | 101 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 8f7f489ad..d0cfd029a 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -36,6 +36,7 @@
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
 #define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
+#define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
 
 typedef struct data {
 	igt_display_t display;
@@ -47,17 +48,74 @@ typedef struct data {
 	enum pipe pipe_id;
 	int w, h;
 	igt_fb_t ref_fb;
+	igt_fb_t ref_fb2;
+	uint32_t *fb_mem;
 } data_t;
 
 static void set_abm_level(data_t *data, igt_output_t *output, int level);
 
+static void fbmem_draw_smpte_pattern(uint32_t *fbmem, int width, int height)
+{
+	uint32_t x, y;
+	uint32_t colors_top[] = {
+		MK_COLOR(192, 192, 192), /* grey */
+		MK_COLOR(192, 192, 0),   /* yellow */
+		MK_COLOR(0, 192, 192),   /* cyan */
+		MK_COLOR(0, 192, 0),     /* green */
+		MK_COLOR(192, 0, 192),   /* magenta */
+		MK_COLOR(192, 0, 0),     /* red */
+		MK_COLOR(0, 0, 192),     /* blue */
+	};
+	uint32_t colors_middle[] = {
+		MK_COLOR(0, 0, 192),     /* blue */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(192, 0, 192),   /* magenta */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(0, 192, 192),   /* cyan */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(192, 192, 192), /* grey */
+	};
+	uint32_t colors_bottom[] = {
+		MK_COLOR(0, 33, 76),     /* in-phase */
+		MK_COLOR(255, 255, 255), /* super white */
+		MK_COLOR(50, 0, 106),    /* quadrature */
+		MK_COLOR(19, 19, 19),    /* black */
+		MK_COLOR(9, 9, 9),       /* 3.5% */
+		MK_COLOR(19, 19, 19),    /* 7.5% */
+		MK_COLOR(29, 29, 29),    /* 11.5% */
+		MK_COLOR(19, 19, 19),    /* black */
+	};
+
+	for (y = 0; y < height * 6 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			fbmem[x] = colors_top[x * 7 / width];
+		fbmem += width;
+	}
+
+	for (; y < height * 7 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			fbmem[x] = colors_middle[x * 7 / width];
+		fbmem += width;
+	}
+
+	for (; y < height; ++y) {
+		for (x = 0; x < width * 5 / 7; ++x)
+			fbmem[x] = colors_bottom[x * 4 / (width * 5 / 7)];
+		for (; x < width * 6 / 7; ++x)
+			fbmem[x] = colors_bottom[(x - width * 5 / 7) * 3 / (width / 7) + 4];
+		for (; x < width; ++x)
+			fbmem[x] = colors_bottom[7];
+		fbmem += width;
+	}
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	drmModeConnectorPtr conn;
 	bool has_edp = false;
-	int i;
+	int i, fb_id;
 
 	/* Skip test if no eDP connected. */
 	for (i = 0; i < display->n_outputs; i++) {
@@ -94,9 +152,16 @@ static void test_init(data_t *data)
 	data->h = data->mode->vdisplay;
 
 	data->ref_fb.fb_id = 0;
+	data->ref_fb2.fb_id = 0;
 
+	fb_id = igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->ref_fb);
+	igt_assert(fb_id);
+
+	data->fb_mem = igt_fb_map_buffer(data->drm_fd, &data->ref_fb);
+	fbmem_draw_smpte_pattern(data->fb_mem, data->w, data->h);
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.6, 0.6, &data->ref_fb);
+		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.05, 0.05, 0.05, &data->ref_fb2);
 }
 
 /* Common test cleanup. */
@@ -116,8 +181,11 @@ static void test_fini(data_t *data)
 	igt_display_reset(display);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
+	igt_fb_unmap_buffer(&data->ref_fb, data->fb_mem);
 	if (data->ref_fb.fb_id)
 		igt_remove_fb(data->drm_fd, &data->ref_fb);
+	if (data->ref_fb2.fb_id)
+		igt_remove_fb(data->drm_fd, &data->ref_fb2);
 }
 
 
@@ -228,6 +296,29 @@ static int backlight_read_max_brightness(int *result)
 	return errno;
 }
 
+static void page_flip(data_t *data, igt_output_t *output, uint32_t frame_num)
+{
+	int i, ret, frame_count;
+	igt_fb_t *flip_fb;
+
+	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0)
+		igt_skip("Page flip failed.\n");
+
+	for (i = 0; i < 2; i++) {
+		if (i % 2 == 0)
+			flip_fb = &data->ref_fb2;
+		else
+			flip_fb = &data->ref_fb;
+
+		for (frame_count = 0; frame_count <= frame_num; frame_count++) {
+			ret = drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
+					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data->drm_fd);
+		}
+	}
+}
+
 static void backlight_dpms_cycle(data_t *data)
 {
 	int ret;
@@ -343,7 +434,7 @@ static void abm_enabled(data_t *data)
 		igt_assert_eq(ret, 0);
 
 		set_abm_level(data, output, 0);
-		backlight_write_brightness(max_brightness);
+		backlight_write_brightness(max_brightness-max_brightness/10);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 		pwm_without_abm = prev_pwm;
@@ -351,6 +442,7 @@ static void abm_enabled(data_t *data)
 		for (i = 1; i < 5; i++) {
 			set_abm_level(data, output, i);
 			usleep(100000);
+			page_flip(data, output, 10);
 			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 			igt_assert(pwm <= prev_pwm);
 			igt_assert(pwm < pwm_without_abm);
@@ -377,7 +469,7 @@ static void abm_gradual(data_t *data)
 		igt_assert_eq(ret, 0);
 
 		set_abm_level(data, output, 0);
-		backlight_write_brightness(max_brightness);
+		backlight_write_brightness(max_brightness-max_brightness/10);
 
 		sleep(convergence_delay);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -387,6 +479,7 @@ static void abm_gradual(data_t *data)
 		set_abm_level(data, output, 4);
 		for (i = 0; i < 10; i++) {
 			usleep(100000);
+			page_flip(data, output, 10);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
 			if (pwm == prev_pwm)
 				break;
-- 
2.43.0

