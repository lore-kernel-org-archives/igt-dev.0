Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E871EC02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 10:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA3210E398;
	Mon, 20 Jan 2025 10:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OBCcHCse";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2EE10E398
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 10:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYo6/Go+/Z18FDFbUgubwppx1JAmsnULDe2DLXFTb2dJE7weaDG8/ti0M7M4h2ny/AYZf4sv+oAy6Xx9A4YgV8tkJNdAebIGibevnG9b3zTUTZhVQJ55i2hFMqz1Bbb9Y7WcqWMvbmRKSiMWP5oirb6fwJ73ZuqeKLtG7qL/Mzb8BY68awjJdfpYGX5qNHgn7cYFTHey/mM0t4ZazH5tZ09BzCM5Y9bD2lPzLZLLi5QF6dRk9199EKYLAmO/pub6aGp3XCwxm8fZ+GAPkQiw1hlogsgIZcnxbgxKZ3uNtT3pAMkQv0itB1zu9gDHMo7pyd3xU+f7lOVhdVbzbgj4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB9/rBk2D2yyJr62h/foYzIoyundFYYtXb3Oj10U7Ps=;
 b=idju6h2AuMzmM+lA0vlQCyn06L7HyoUqu5S0kMoTtmKgz4Za0nzepB0dKCuTVW+TtqMSe5qLInWOcoomC/jToY/PujQSYvfk7Z//pHMk21NGDcuEU/VLxiFR/tX09YNCOaHoAWKU0mEN+Ms9u8jcxPz6iW15kE2stq5s+G7mXjfDSiOYIO3R8JXsrtKfk5fmPg7mAX6NBigL/uaO3oZvZQZRGckHX/cXt9SDTZH0xcis4xcP8Bp5hN9RJhYxy5IjKzCuT/o99s8CNFIJVarEr4nY+eUb5CikKWSl/vaDcq8BL1hsLh5nvYgANKLdTxwYcXHgUXp52E3onQjF6ad2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB9/rBk2D2yyJr62h/foYzIoyundFYYtXb3Oj10U7Ps=;
 b=OBCcHCseLS72gzPW2XhtwGLay6yTo7bp2SaoFn7ip5ZH0EelbwOd0HsiItwBzKKDWbwL5a8bVkRBUajN1gYIXOAjnKVD2u4L0lNrRdFxbYDW/9RGO+BhuvlcZ4rAMgqWmC1WDwIqpXqkRiDqY94BPO0B+/a9TxK89PrN/t1PFGw=
Received: from SJ0PR03CA0355.namprd03.prod.outlook.com (2603:10b6:a03:39c::30)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:25:07 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c5) by SJ0PR03CA0355.outlook.office365.com
 (2603:10b6:a03:39c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:25:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 04:25:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 04:25:05 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 Jan 2025 04:25:03 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,
 v2] tests/amdgpu/amd_abm: Fix test failed on self-refresh panel
Date: Mon, 20 Jan 2025 18:24:03 +0800
Message-ID: <20250120102501.4164-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 405bdce8-8791-4073-7d66-08dd393cb5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6RJM48b6K0wdKySwdzI9XdyR8R9oMlSIJtbOnPkjQQ2nwB8hwR0E5IHIs+Fd?=
 =?us-ascii?Q?zF8fTSKBsfBClyM11NzKvjVVEWMwd/bcnwbL5WbsZuKe8sJE1aaFwVEikoaH?=
 =?us-ascii?Q?OBwAQlIaYonzSEyhJYvQuRJA5YzUD+Ny76o5bXB8nSiVk062UbmGDVieghMW?=
 =?us-ascii?Q?kIfhW/FB1X0UTM9y8e3AdqIDDp4xWvL4khW1wW++ImEEZcE6cwpUfn36kSp5?=
 =?us-ascii?Q?nerYe1t+iR5usqNzB1mH1bvzZ61vyFVwA1XCrU3zrRtbapwJCbjbm8TnKlKW?=
 =?us-ascii?Q?jK3VfWGVbRHoXVMsX8cbENXtjgoGKZ3chHnUwhdEVTk0ZGf+zKBtyBasDV0N?=
 =?us-ascii?Q?S860B+ZLzjGr+iLrcC+Gps36Ii23S8U1sC5B7Sm2k9Q6IZxEAKpRrronSjpI?=
 =?us-ascii?Q?L2ycK+B3ICxeOqXNhW4P1udgLyj45Gx0cRAXzWM1WFB3/OR5S6ETFdq8AH8z?=
 =?us-ascii?Q?vQwr+1yiN6laPwSjEGVtcczY4pjIjKmH+9WZiIc5znCZYdaxU3v0gWyufNz+?=
 =?us-ascii?Q?c704chcC2yK2qkBGVMi9POVD+aXys14X37GtlwqL8fzrjuiJ5eudhEW4vj3l?=
 =?us-ascii?Q?/AKx9boaKYB8YMyzAsfnblzvs1qdjS3CY5UzA1CVWocb2HY2jAv4QvbC5XF2?=
 =?us-ascii?Q?RhkwZgXOz+RB5EF2y0zZS4BiYVJalw8jFlYU6NaZcDb5zY+t2oMMQuq0FgWr?=
 =?us-ascii?Q?hgaRuweg/OgceWFxzj3zWesziK6SItW2ClT5lSV60BCfBQFYskWGd/Yn/TyW?=
 =?us-ascii?Q?0SgRPyWTTxIeiZ2eA/dQD1Kf70IEm8nk/sZkao3rzM/KkL2iGp0pAYlFRMZw?=
 =?us-ascii?Q?jj3n+JTVc5LwXKbYv2gLnKTr8oDrXmDHKCeTL2tDa1AJqRN8joTpj8+wGFmQ?=
 =?us-ascii?Q?6w1mNBdEooE6IoVtRCx8tnfq6biy1icsiTaX+AM1Bk7XCJMRbV+hT3NywDju?=
 =?us-ascii?Q?K+iz8xjVqmSI3Q2PrG/eJfhJwTwSSkQo1bgndiZAr/wEaB+kh4wECPNraoBc?=
 =?us-ascii?Q?hpSt6RbJ+cDeJjr3mypnZ83PNvcBC3MVnEhhda21kq2/+1xmmrLi2+YLvsGT?=
 =?us-ascii?Q?MYY8414rfgsLcAQyShHZxfJBF9Pclp99V9rHfZ9ZuQgpzoI88i8j4zLW1etp?=
 =?us-ascii?Q?fVmq60zlffD1VvxlxYeWvcJuToFYcxyf4HG02ueX8UOBUCLzPYJVYA7bVeuA?=
 =?us-ascii?Q?U0rS/g1iNYHRSu4/bam6Brj4jAnttfShlFfKGEJ56Q6iQXyP49VArqY5P5oG?=
 =?us-ascii?Q?nOOIPF+qvpP0SlAEBJeKpOMAwK5+jADtEeN3/ngOz4r5gjpNo6IN4VPUpnVy?=
 =?us-ascii?Q?p1BvPI6p9snRHs6tKZBDOaN/QW4E3o16AgruTkBTofe8Opq8C47OowLdTLUC?=
 =?us-ascii?Q?AkUIxh2ImxnlOfFLRCSFsyPX9R4IGj2psrB4x33H9NQB34BNVXJH7dAZVvgL?=
 =?us-ascii?Q?W04Tr4rt0m0A36mskPtX0RRZa0n3coWn9ASX0EJjvOb1KR1aO7UQMc45d/74?=
 =?us-ascii?Q?3yQgfxmUiKxrO9k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:25:06.4962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 405bdce8-8791-4073-7d66-08dd393cb5bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
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
v2: add back usleep(100000) in abm_gradual()

 tests/amdgpu/amd_abm.c | 101 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e196b6ebc..07d2ae843 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -36,6 +36,7 @@
 #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
 #define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
+#define MK_COLOR(r, g, b)	((0 << 24) | (r << 16) | (g << 8) | b)
 
 typedef struct data {
 	igt_display_t display;
@@ -47,15 +48,72 @@ typedef struct data {
 	enum pipe pipe_id;
 	int w, h;
 	igt_fb_t ref_fb;
+	igt_fb_t ref_fb2;
+	uint32_t *fb_mem;
 } data_t;
 
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
@@ -92,9 +150,16 @@ static void test_init(data_t *data)
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
@@ -105,8 +170,11 @@ static void test_fini(data_t *data)
 	igt_display_reset(display);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
+	igt_fb_unmap_buffer(&data->ref_fb, data->fb_mem);
 	if (data->ref_fb.fb_id)
 		igt_remove_fb(data->drm_fd, &data->ref_fb);
+	if (data->ref_fb2.fb_id)
+		igt_remove_fb(data->drm_fd, &data->ref_fb2);
 }
 
 
@@ -217,6 +285,29 @@ static int backlight_read_max_brightness(int *result)
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
@@ -332,7 +423,7 @@ static void abm_enabled(data_t *data)
 		igt_assert_eq(ret, 0);
 
 		set_abm_level(data, output, 0);
-		backlight_write_brightness(max_brightness);
+		backlight_write_brightness(max_brightness-max_brightness/10);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 		pwm_without_abm = prev_pwm;
@@ -340,6 +431,7 @@ static void abm_enabled(data_t *data)
 		for (i = 1; i < 5; i++) {
 			set_abm_level(data, output, i);
 			usleep(100000);
+			page_flip(data, output, 10);
 			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 			igt_assert(pwm <= prev_pwm);
 			igt_assert(pwm < pwm_without_abm);
@@ -366,7 +458,7 @@ static void abm_gradual(data_t *data)
 		igt_assert_eq(ret, 0);
 
 		set_abm_level(data, output, 0);
-		backlight_write_brightness(max_brightness);
+		backlight_write_brightness(max_brightness-max_brightness/10);
 
 		sleep(convergence_delay);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -376,6 +468,7 @@ static void abm_gradual(data_t *data)
 		set_abm_level(data, output, 4);
 		for (i = 0; i < 10; i++) {
 			usleep(100000);
+			page_flip(data, output, 10);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
 			if (pwm == prev_pwm)
 				break;
-- 
2.43.0

