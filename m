Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C313C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 09:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8B810E49D;
	Wed, 15 Jan 2025 09:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KR49qCXX";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963D610E49D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 09:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwSaKS9nQt+HoNaj36tI/acdahqPiDfygspwvTyablQFJ7j3Zngn84zGMMtQ52knEQrxPUL43aETaWuKRX2oqF4vPArkOvHMikN+NFCqoJbIhfjeB/lnDThPvwHvwyJzQ1moUrhOrAcPNGwVp9/q8yImWKKqhJnSKih0RH+nyBMsLxbE7r46ChdbBT9vzbaHqmPxjshZN8Qy0VWjLbD7paxwfQlnZseB/S410Qxsxg1y+NX3/iURrC8MOshiPqZyqvfcb4nKXd+3GSICrtgAbI6N+MKcCGMqY3mJzhE2esrm5SNp0JI2T/98Mt91S3EiB6MwE6gymuXNOc2RSZKTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+RI2JC8eJuzn5ZxXIanK6L/DG5t9TB4BVO+o2ZtWZs=;
 b=wcxQxgPaC7+fg2kQGnGaScM2rJCbgmqmYNpMq59gthUBwdShLL1u8heVvjQ+2LDKQjUcYr3EZMHThqFaZ8zAlitJzAlhZjviJfbTtEXesG8LLOSiysuP8c/0ZL/FGYcv5b9wfYd0Rz8lFFRGRFH1BoAWeAALuvcyDRCN1fzP5TSWfLEKoR6gfiRBIAelmBu7HW+UOUXHsYt00tC6HFpwfs2uUVTudyBJA1k0ZV5/IP3esk84Z+qLJl2vEl2uhl7T9uMkxC8fOXVRuNOqjM47hMZOV6d3MqVtE0MCfflZ42rBSiMBjdgkgRAv8ZitpW81McSssgJ3eZmE/yfjcovGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+RI2JC8eJuzn5ZxXIanK6L/DG5t9TB4BVO+o2ZtWZs=;
 b=KR49qCXXeIdNmrmTacVzc3siRLFOHWHTiwTP4qBCi66227F+nULQnqN+salPIJwSu/dOQp9+8tCZsKpRatsrw2V8xY3mGXlwHNqfqyBd1itCqxC5gRY1qMARfhfwyLX2v2Lf/uKS9kYdd6QLutH84Ews3LGLbRXuhrXLog2cPW0=
Received: from MW4PR04CA0235.namprd04.prod.outlook.com (2603:10b6:303:87::30)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 09:59:14 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:87:cafe::1f) by MW4PR04CA0235.outlook.office365.com
 (2603:10b6:303:87::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 09:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Wed, 15 Jan 2025 09:59:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 03:59:12 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 03:59:10 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_abm: Fix test failed on self-refresh
 panel
Date: Wed, 15 Jan 2025 17:58:31 +0800
Message-ID: <20250115095904.1965-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5d1560-1aba-4284-a549-08dd354b4433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zVXTD4Mbz3pmh0VDyqSTjZfUV9VSna1qpSNLQSwzVNCu29Nxh2rjhLvF1Kr1?=
 =?us-ascii?Q?OnJHsEmw1b89wtnk6VMHR/giXCDxvjS0HWsMIz3U6UhubPYW35GqqSJYDr3N?=
 =?us-ascii?Q?t8CQ7KJiBYgeOai4m3DgoZfL/hwECQL4dwe20xpocNeW+IKYIH+2ln57+an8?=
 =?us-ascii?Q?2ixpAY6j1eBe0LOXhRSf506fbyYwGHuG++5UvgbqlE7HCJ/pe5ExUo3v6o0m?=
 =?us-ascii?Q?pFCY+/AomLvrV6p08FXFwsrWwHqxfS+OLUP3b5VC6La6PAcjWs7IQplZvcuH?=
 =?us-ascii?Q?YX22NUgCktmIN2/n6LHxReLhHI59iTtiJYBuNcvfxNwTx8pXh07d8dqo26+S?=
 =?us-ascii?Q?KU1svTLxNMREvnO7oSLXM1/+AK2ujSXSC5TwrlfcVfTneHlrIjoRxYYYAKjn?=
 =?us-ascii?Q?exohejOHPO8GVCa4iP7ynipFSvrOIyKKJ/fYyrTrd7VH/GHofjjxR4Z9XR4+?=
 =?us-ascii?Q?9U8cldMHSZk1i4u2agp9PfWj0//6AQNweFcTDZ9nmf5s0yCjEEhSc2sPTq1R?=
 =?us-ascii?Q?zcUHDBH8abSGzx+vCEXQS/XXJXCYAMLMY2D3O8JgwqDNC84cjCTW8/EHL+NF?=
 =?us-ascii?Q?5bbjWr9Y4ed6FULmqRkUPZWZuKm5Y1kw41eZ5yLwWUPX25pYN5gb+I6RrcTk?=
 =?us-ascii?Q?38jSLcHi4YTSsERAbzgrx+QHJVkpMnhXmH6h+09r03GtG/BsjHTUmUR5UBSz?=
 =?us-ascii?Q?vuxE+ypYJkFqB1/AMDkCPr+YebZWySrk0jYb4ngVQCJv/qFzf/OThMr2SeB/?=
 =?us-ascii?Q?SLyoya1KLAfPLAXmWffSbfXoVHsuraammuvm6vSBjDeRgztKG62ZoM17x8o+?=
 =?us-ascii?Q?sfc0j6ACNTzHRtMUvptM/fzeCd1BQQt6oxE6itJ9WrbcjRwJ4fk/iqFnn/ja?=
 =?us-ascii?Q?sZ2/Ziky9WKQAvLAEpgpzL1MGy5+ukLS2Lr817H20ps68TtoK+BuWmt0JvmJ?=
 =?us-ascii?Q?jqvVSQpgls4irje+qC5IOm2A/mHKdXu4yYBLMZnWp6mMzdkn2cmB6ZJmdNhp?=
 =?us-ascii?Q?zR+suN95QjzIEfx4OhlkGijWem5Mn+fsCcKig/u/hVEz19/a/Xs4S8dxAwX4?=
 =?us-ascii?Q?pc1ztTjjc5h6wps+/Cw3J6KuxPo8li87NvDR+oYAcGvf/YOp5oR39oOT6EHh?=
 =?us-ascii?Q?fS4xfoYcCZ7KMd76h1CLcfpZgNQmOIz0rPigt0xzITVUQ2V5fR66fB97G2t4?=
 =?us-ascii?Q?S3OLAzVX44osNlxtoF8Co0zTBkpvA52zNx8fkTYZJ1dx5IukFJWZ8+uad3Fk?=
 =?us-ascii?Q?W/vmjIYbkefl3I9bl1UgZNZNeIh1ocokQW7uqYybVHZ8MwWT/v2tTDWSL+DT?=
 =?us-ascii?Q?q1k5de0U6kdfylBJl7WeAzFU+foQkbIC+Eg+gVWS4E2Qv2MZpDcsz2MKWU0G?=
 =?us-ascii?Q?1sPEQLk0Q/pqd1krjpf4ifPqZOIrJK5coZdyl4bJSfaZyUTFpZ0vQBnhO+UR?=
 =?us-ascii?Q?2YtbcMBA5sZPyrfUu/wbTw0zcJZ5IVRQ2S8xDxHb5IumXXZnRazOybb2wG2I?=
 =?us-ascii?Q?QlaO2c/MPvZIdAc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:59:13.7814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5d1560-1aba-4284-a549-08dd354b4433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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
 tests/amdgpu/amd_abm.c | 102 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e196b6ebc..2ba678106 100644
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
+
+	fb_id = igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->ref_fb);
+	igt_assert(fb_id);
 
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
@@ -375,7 +467,7 @@ static void abm_gradual(data_t *data)
 		igt_assert_eq(prev_pwm, curr);
 		set_abm_level(data, output, 4);
 		for (i = 0; i < 10; i++) {
-			usleep(100000);
+			page_flip(data, output, 10);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
 			if (pwm == prev_pwm)
 				break;
-- 
2.43.0

