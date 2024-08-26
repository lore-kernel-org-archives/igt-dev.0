Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6575C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 08:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC8B10E140;
	Mon, 26 Aug 2024 08:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WcJ7Z4Ly";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8810E140
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 08:25:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjkm+PQWMVDOnU5ip/ZS3G6B7TWHnLhqhZzeRnPuE6S4BZHdS0W1heQN7SUyLhBnS4b9LMVaOxCTh1aBR8AC+IY2aezkPuYePZPnrwPJavlHmxHm9f84WrUTJga80kb6DjeCG7jOlOE/RKU5ef6tcZO8Gz3lzZFZWuYO5Qj0I8FeNDG9IFnUp3zYY/yUx7FxveDPsIk/GraDqb9gKVLwCkTD/ojWDzevCy6tBFHdzz9Lrz+BRYj5aEOFgQarqgHazwVYyp8tFVXMD3J0BHVQLHdIDi3FXkSvSuHeWMpkqKgxW5BCYQJH5AFnve62+6wAqkT+xZn7VugEFeteHw0dpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/uvz4IIpKK7pENLroL+Hb9OHui/QiszElw3/Wf2xK4=;
 b=ItFJg5q469W11nVCUiWB1RxofoauI4MKQ5oAe5nco7gMOJ6oizngP5NFtahSERA+ZEuQtBxe+1jrLiSSCsvg/bJXafG/CpznfbRZzrNLgc99DnoiBm22eDx/groeWQwVQ5iYqh/YZGTpE1uCxZjjtTLFYQhQcIm5gKXJCF27AcU67oB3iwd2CLIqaVZP7tCcuv6qHeR9lT3qcsKMLWYGNtyABf71513lZCXjTbOK0t9ORD78vcxA5gpT/14dryPw175++uYq3cerc+pB/D8apKVQblWDsTYGHy0nTl82fe7tEjCiUkh1sDPfB296iegGGYtvEDkd/5qAHp7HMIjDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/uvz4IIpKK7pENLroL+Hb9OHui/QiszElw3/Wf2xK4=;
 b=WcJ7Z4LynolAKCL7yWzKr35OqPnRwDBDXJyRH0sQZUQDeC23Kx0xAbqvh3kCAeT3pBf29qEed4WQfkHEjkbiLZ2MwwI56Oshhi35sFBNIuzkM1grirgIBH4wB8pUEwhuq+jiOznn4XqEbx8JXnARhmUv5DbDzxBd8CXi/pqQ//c=
Received: from CY5PR18CA0013.namprd18.prod.outlook.com (2603:10b6:930:5::23)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:25:25 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:5:cafe::5d) by CY5PR18CA0013.outlook.office365.com
 (2603:10b6:930:5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Mon, 26 Aug 2024 08:25:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 08:25:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 03:25:24 -0500
Received: from tom-MAPLE-HALO.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 26 Aug 2024 03:25:22 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Rodrigo.Siqueira@amd.com>, <alex.hung@amd.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_abm: Remove the modeset for ABM level
 setting
Date: Mon, 26 Aug 2024 16:25:14 +0800
Message-ID: <20240826082520.25942-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8e761a-ba20-46d1-9987-08dcc5a8a2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gR/g95Wor+ZduiNDZ9gG4bFygrNBJqP7CvqyqQydFi4A88jPPl2m9yLylIlf?=
 =?us-ascii?Q?yEJQ1EfNb1W/oB/2PtTzR0MaUmB2raeFAtiPu6FPI+xjBkbdbEgl6EPaWBR/?=
 =?us-ascii?Q?3PPekPW4WNKPq+vqtgzUZ1lHrAAUJPb2wZzaarmHHrg442shPSdP0Ak69as1?=
 =?us-ascii?Q?ewtl+ul3lfRfiM2zheek9gOwowKVU1/5ZTt4tu3sjwcdmrHfMrxKtHSz1D8V?=
 =?us-ascii?Q?zqS2RURwXaFbZqqMott4bbYVqYB456I3Cc/Jc2OV2FLm7I7j49ppOXYfM/gu?=
 =?us-ascii?Q?jlG4nGLE59khm9/1u/gVx+Jw2gFK35+4Vbn6TOlZ1Gb+TO90Ii+MFi+erLvm?=
 =?us-ascii?Q?5HH1muqHktf2+/vvRZR+po4elMq05B5q7cKfcA31P1z4HsUbWPpnljxENhET?=
 =?us-ascii?Q?X5Ri1BQ5xxwBS+KQ/IxF3tDC/rrm1BxQPJUzht9zj4SsAo34w7LKLQCsNWK9?=
 =?us-ascii?Q?LlX66XZGvMOH5k5cfbJGCQ8pte8jTEqLdxW+UXlyMeIvw9Jat0BGVwgvtaJg?=
 =?us-ascii?Q?W5OipZd0XfDnlc8arjzkQ3uGdJD+R+eRoWAFXBfIpmLEScBlI4g7yIKIxb5z?=
 =?us-ascii?Q?nzQz1wkAkeNC6tNNPEiPJIKghXFxhAH1daEdAACQXTmIkh72KQenz9Xv9kKt?=
 =?us-ascii?Q?61niPVqT9msDYbHzlGeKSBTyTBNWCX1sSZvHLrGsnMF7nTGXX34eYhw85hMI?=
 =?us-ascii?Q?M3CnlGLNgat3ZiyovVEswUZqH3OcJqz4pKECwjDRUnR4Bo4yNE5Qp0cIJTUT?=
 =?us-ascii?Q?ln8SRQJnM5oxKno2lyDnDdj91XU8s7zKZcGmiPocZj9NO7vVfns9/Egkvqen?=
 =?us-ascii?Q?NVRIl6D3DI435OaYvLX2JlmHtXFNsGiqueNP2Rmreq8uoTPpW5xMUt8b0xvT?=
 =?us-ascii?Q?AcrgBqLqb0bIWpTkjKfC85cVg3tTrCpKiJ/n4BmRv9+BMsPnI/fe2a1HDLRT?=
 =?us-ascii?Q?d5ARGVlETvA25eJ+FvkdqTrPBwvh2yvyom3zZdJCecBFf2qvilR8gBbzuwHP?=
 =?us-ascii?Q?kvgUsyJCYNueHJdPWkglBwQtvKGmhqmFYqm1jxJ3VxjDuoCEc3oK/lnsN9+E?=
 =?us-ascii?Q?H+KAq2a6mwTd5IDup5VDG2TO0ImqyEvVjzw05ON7SdxHDNhzq5B9RVA3Gf7v?=
 =?us-ascii?Q?VjGnEibmpIB+fbmQmPt/MgSLNyiwcMqs8GcgZqOuLpE8bdzXBjJkOyQSwan5?=
 =?us-ascii?Q?Jy4NzuFppp1GIoBa/dPPm+Xpa5EyHBBT+slyF31hg+vMP08btu4q1ZiG97ZM?=
 =?us-ascii?Q?zUgGGRvkR/UIO4Sz3njI5kySBmB57j+/TgS5OuazoIYK2IjAN8fw/RRvLf9L?=
 =?us-ascii?Q?xupdbN43B53Dal+pnd7KYhvLZTBxajccEX58ZRDdx2G3NQrqe2hFe8GPKi/s?=
 =?us-ascii?Q?FnzSwA3W2szu0zGd8cmmSkpXrMXln4T+cDoGnmlnzn+Pw3f1zm4OFdJgCrhh?=
 =?us-ascii?Q?7MPxDEF4wufbYAQpbfrbYti9BiKRpan7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:25:25.5406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8e761a-ba20-46d1-9987-08dcc5a8a2d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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
Set the ABM level does not need to trigger the modeset to take effect.

[How]
Replace the DPMS off -> on transition in set_abm_level() with
atomic commit.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_abm.c | 99 ++++++++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 2882c2c18..a85f444c4 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -39,9 +39,75 @@
 
 typedef struct data {
 	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_pipe_t *pipe;
 	int drm_fd;
+	drmModeModeInfo *mode;
+	enum pipe pipe_id;
+	int w, h;
+	igt_fb_t ref_fb;
 } data_t;
 
+/* Common test setup. */
+static void test_init(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	drmModeConnectorPtr conn;
+	bool has_edp = false;
+	int i;
+
+	/* Skip test if no eDP connected. */
+	for (i = 0; i < display->n_outputs; i++) {
+		conn = display->outputs[i].config.connector;
+
+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
+		    conn->connection == DRM_MODE_CONNECTED) {
+			has_edp = true;
+		}
+	}
+	if (!has_edp)
+		igt_skip("No eDP connector found\n");
+
+	/* It doesn't matter which pipe we choose on amdpgu. */
+	data->pipe_id = PIPE_A;
+	data->pipe = &data->display.pipes[data->pipe_id];
+
+	igt_display_reset(display);
+
+	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
+	igt_require(data->output);
+	igt_info("output %s\n", data->output->name);
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+	kmstest_dump_mode(data->mode);
+
+	data->primary =
+		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+
+	data->ref_fb.fb_id = 0;
+
+	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
+		data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.6, 0.6, &data->ref_fb);
+}
+
+/* Common test cleanup. */
+static void test_fini(data_t *data)
+{
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+
+	if (data->ref_fb.fb_id)
+		igt_remove_fb(data->drm_fd, &data->ref_fb);
+}
 
 
 static int read_current_backlight_pwm(int drm_fd, char *connector_name)
@@ -121,14 +187,9 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 
 	igt_assert_eq(close(fd), 0);
 
-	/**
-	 * We need to trigger a full modeset to have the new ABM level take effect.
-	 * DPMS off -> on transition is one of many approaches.
-	 */
-	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
-			 DRM_MODE_DPMS_OFF);
-	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
-			 DRM_MODE_DPMS_ON);
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_plane_set_fb(data->primary, &data->ref_fb);
+	igt_display_commit_atomic(&data->display, 0, 0);
 }
 
 static int backlight_read_max_brightness(int *result)
@@ -156,25 +217,6 @@ static int backlight_read_max_brightness(int *result)
 	return errno;
 }
 
-static void test_init(data_t *data)
-{
-	igt_display_t *display = &data->display;
-	drmModeConnectorPtr conn;
-	int i;
-
-	for (i = 0; i < display->n_outputs; i++) {
-		conn = display->outputs[i].config.connector;
-
-		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
-		    conn->connection == DRM_MODE_CONNECTED) {
-			return;
-		}
-	}
-
-	igt_skip("No eDP connector found\n");
-}
-
-
 static void backlight_dpms_cycle(data_t *data)
 {
 	int ret;
@@ -354,7 +396,7 @@ static void abm_gradual(data_t *data)
 
 igt_main
 {
-	data_t data = {};
+	data_t data = {0};
 	igt_skip_on_simulation();
 
 	igt_fixture {
@@ -382,6 +424,7 @@ igt_main
 		abm_gradual(&data);
 
 	igt_fixture {
+		test_fini(&data);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

