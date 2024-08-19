Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA04C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A395410E416;
	Mon, 19 Aug 2024 20:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KZ5F8JNm";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615D210E416
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8Rbt+24DxkUshp0ddLAf9ZvkDbuaL83SBtTb5AZirPRM0TJu92yBgshC04PZ4uCix5cyjJuXO7I/pkn2dxMagsSopFN2xZa20nqaQITqz9XvwNqrahPNTyg7DfCSta5Git5Ng7ofnPxSkD9ze7RU5cMm0PAVJpN0NhHPxu+7ZFacvZkcGkhygdvTRzs97Z3rjRpOG0k/3rjWFptaWGeK3c2883dS6GZ1z72BlTaTNjRF3T5DitOZR4ZyiGwUaHr2uZdLFvqDnLY1iBtt8EODGiKU5Sb4AabVT39nJPGdqKucV5s8VHNaFEBM6dcIaq/RVpm8ILi0ZMUDGD+f5bXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMK/ZZ5g42Qd48MCHrrof3IkRiM3eZKXKWRUpjDG+U8=;
 b=iCfRWSKHHyVAIgbV97FjouRzOsYfpo6eh1wUxyfin8oKIDWwqolZZBfH9IDC4yNbNGE+DrmzdnaBZXQj/9pMU9qoVAgbbQ1hdwKdcjdtMss2Wdhm+o78WDsFC6gepNHQzbWVhu6W98auIlN69AIzZS+94fSGFWbExt39rSnB5BLpj5zsTVDJpN2qxto/cXDA8uiKmzCvWeAF/ASyXK3HOpYUPaSWD2AhqQqUD+kMJPybC6bcwCDqK8K3RrsspTqnEFAQ5XdtdpTX1oJxLUsm+y6MaMWrA76N02/MEI5nyi2ez4I7qWZiqYgXObrpBtTV+ZEhYiIiR7wCilWA2Rp6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMK/ZZ5g42Qd48MCHrrof3IkRiM3eZKXKWRUpjDG+U8=;
 b=KZ5F8JNm8gFpo2u8i4EsfoWMNr0q3EIkP4FqhPO85FkkS7IKERFEcGIX5h1f/zEEXPHJOfXarQJNacSXK8J1QKtQkEzleWxZAEchOgF0jHVfn0xyCQ7PuedZuXFJUztyvJCdORJ+lEN4qSuwwQt818+OY2NbcE3EmPkjLHdi4Ao=
Received: from CH0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:610:b1::33)
 by CH3PR12MB8993.namprd12.prod.outlook.com (2603:10b6:610:17b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:33 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::e6) by CH0PR13CA0028.outlook.office365.com
 (2603:10b6:610:b1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:29 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 08/37] lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
Date: Mon, 19 Aug 2024 16:57:54 -0400
Message-ID: <20240819205823.316656-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH3PR12MB8993:EE_
X-MS-Office365-Filtering-Correlation-Id: ca05c415-fd0a-4ca2-f5cc-08dcc091afb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FbnGITkPR68Ubq5mloxrtH4WjlKDxwWwy65omKTLmKimC/AG4St7D1AZM2tL?=
 =?us-ascii?Q?0+Y/JnZ+fPKTGgT4njzL9a1EaD36Kh1vgLUpOwR2oylFPyFLz4EKrGDMjbbi?=
 =?us-ascii?Q?F/mtjIzTaU6x88naLREGyR6CuDG57/onC4krC39Wi0E80P0/1lHKtsfUYzyK?=
 =?us-ascii?Q?ckkvU2mloZPBwYPS4nOEHeXgml3DVRs9IzLUcTF88qh0DEyVgTN2qDZ2A17u?=
 =?us-ascii?Q?goZvkWrjRaIMIU4q5lmjl6Fpi9BcTR5qixrRdH1rjw46luKsUHlWu8PMWvYo?=
 =?us-ascii?Q?8RttUwUA7A4arAOxoK/3snHBGBR4M8LCi239jInkkbR5cuWgoReVDHmWCZiT?=
 =?us-ascii?Q?t/alhtVqAN1+A2+W/O/xgKmqA5v8ftM0MWHg0lzP5I8CLaMhjK+8QFP5pZF+?=
 =?us-ascii?Q?aXm4O6WRl1cW+czY+me4R8afd0LFdfpzKfKXjaB/L9O0XM0yf9iFYoWG7VFu?=
 =?us-ascii?Q?NJiri/0yFhl/dwoPsYeVLrBqxBppGyxYZvG+GiISl2zZ2Ru+pj3D/G7qnC2j?=
 =?us-ascii?Q?dhX1TMqvaRbl5+ORWq4hjompg2D4y+otfnPXMJYe8Q1VPZly42YIBGEF8ZBg?=
 =?us-ascii?Q?QKMA2UJj04NteMnaUWYYGDbsarXRvhAmhQ1867DSRHeRztmJACWaZXr59oJn?=
 =?us-ascii?Q?z4DOeyNcDw4VIWeQPmb+ZX7mxeYxk6MmCmalb/CYCIwOCYNNwgk+/aX198TR?=
 =?us-ascii?Q?o7ibn1iplNYgLSr29vXHeIyoMYFnCJJFhHrjuCWlwEyNssq919aUUmkiXf8i?=
 =?us-ascii?Q?2jo/B4a/JhctNYzN4SRd/YoXCEpgJgPt+rXrLnoaUq3RzblRFwBVjEaEaWwF?=
 =?us-ascii?Q?EHvgCWk1DQrc/Cyjlo32G8xWV9NfgG3Nd68L73XfIKW4jlIMcdpJUKbnc4zP?=
 =?us-ascii?Q?0MwhDhnvjxwWUpK7mRBSxKnkdHDWp9q1YvMFFEzAU7B6WHC4sfyDPJrNstpN?=
 =?us-ascii?Q?8BQbq2DsDqc0w+sCqjeY72tJbH/yHnLyAWdoFVxUwyfRgL2Bj2K64FYNIvgj?=
 =?us-ascii?Q?cGn3gMxsaKPWuy7CMar+YM75y/r+yUBJEPyghtUHovOOGLbpZ1cDdWKU6AZw?=
 =?us-ascii?Q?m2TDbdvZ58m6CxdtZy/Eqem0xifNp1QYRhuVWQI54qnziLtYagd1UPXK5WzJ?=
 =?us-ascii?Q?j0fINWwBv/v/kgiwywcCcp/nMWMKa2Pjb+DpmpGBS9rypH/lQ+64YiBRZy8i?=
 =?us-ascii?Q?QXLnwq4pdDEge2kx6ruYvyZ4ylkZxXONh0ltPRfbVJCMi0niaRBStfyiF4ii?=
 =?us-ascii?Q?uq2RyO4rm/IfGZH/1bR89+GD1WCChdsfBwWCbpJtS5axOMzgMbPs4IiEdAJK?=
 =?us-ascii?Q?jsR8seqYMvOV60ZbFB/91eFxV10oPAMXQVKv8F4Lbz1ldpiDtp3+gi0EKxyy?=
 =?us-ascii?Q?mDrPMeLmkKGvJllZL8wMOtPaVDG4ttfhf9kVpfV20vzzd1Emeh5mtQuZR4Rw?=
 =?us-ascii?Q?YLcMDQPbC6cWKZJ9u2QX3oJiy3xGPd5A?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:32.9558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca05c415-fd0a-4ca2-f5cc-08dcc091afb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8993
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

We've introduced a new drm_colorop object in DRM. These are
used to make up a color pipeline. Introduce the concept of
this new DRM core object to IGT, including:
 - discovery of drm_colorop objects during init
 - various helper functions for deaing with drm_colorops
 - handling drm_colorops in atomic commit

Along with this we're also introducing a new COLOR_PIPELINE
plane property to track and be able to retrieve the colorops.

v5:
 - Fix warning

v3:
 - Add commit description (Kamil)
 - Add description for public functions (Kamil)
 - Squash with COLOR_PIPELINE patch
 - Remove need for IOCTLs
 - Change colorop discovery to work without IOCTLs
 - move enum drm_colorop_type to drm_mode.h
 - Drop display from colorop prop_enum functions

v2:
 - Iterate through all next drm_colorop objects

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 269 ++++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  89 +++++++++++++++++
 2 files changed, 352 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4cc2b195174d..f02c268461c7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,6 +90,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+#define MAX_NUM_COLOROPS 32
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -687,6 +688,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
+};
+
+const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
+	[IGT_COLOROP_TYPE] = "TYPE",
+	[IGT_COLOROP_BYPASS] = "BYPASS",
+	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -754,6 +763,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 	return rotations;
 }
 
+/**
+ * igt_find_colorop:
+ * @display: display on which to look for colorop.
+ * @id: DRM object id of the colorop.
+ *
+ * Returns: An igt_colorop_t if found, or NULL otherwise.
+ */
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
+{
+	int i;
+
+	/* find corresponding igt_colorop */
+	for (i = 0; i < display->n_colorops; ++i) {
+		igt_colorop_t *colorop = &display->colorops[i];
+
+		if (colorop->id == id)
+			return colorop;
+	}
+
+	return NULL;
+}
+
+/*
+ * Retrieve all the properies specified in props_name and store them into
+ * colorop->props.
+ */
+static void
+igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
+		       int num_props, const char * const prop_names[])
+{
+	drmModeObjectPropertiesPtr props;
+	int i, j, fd;
+
+	fd = display->drm_fd;
+
+	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
+	igt_assert(props);
+
+	for (i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop =
+			drmModeGetProperty(fd, props->props[i]);
+
+		for (j = 0; j < num_props; j++) {
+			if (strcmp(prop->name, prop_names[j]) != 0)
+				continue;
+
+			colorop->props[j] = props->props[i];
+			break;
+		}
+
+		drmModeFreeProperty(prop);
+	}
+	drmModeFreeObjectProperties(props);
+}
+
+static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
+			     igt_colorop_t *colorop, uint32_t id,
+			     char *name)
+{
+	colorop->id = id;
+	colorop->plane = plane;
+
+	if (name)
+		memcpy(colorop->name, name, sizeof(colorop->name));
+
+	igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
+}
+
+static void
+igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
+			       drmModePropertyPtr prop)
+{
+	int i;
+	uint32_t colorop_id;
+
+	plane->num_color_pipelines = 0;
+
+	for (i = 0; i < prop->count_enums; i++) {
+		if (prop->enums[i].value) {
+			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
+
+			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
+
+			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
+			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
+
+			/* get all NEXT colorops */
+			colorop_id = igt_colorop_get_prop(display, colorop,
+							IGT_COLOROP_NEXT);
+			while (colorop_id) {
+				colorop = &display->colorops[display->n_colorops++];
+				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+			}
+		}
+	}
+
+	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
+
+}
+
 /*
  * Retrieve all the properties specified in props_name and store them into
  * plane->props.
@@ -785,6 +896,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2947,16 +3061,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		igt_assert(plane->drm_plane);
 
 		plane->type = get_drm_plane_type(display->drm_fd, id);
-
-		/*
-		 * TODO: Fill in the rest of the plane properties here and
-		 * move away from the plane per pipe model to align closer
-		 * to the DRM KMS model.
-		 */
 	}
 
 	drmModeFreePlaneResources(plane_resources);
 
+	/* init colorops */
+	display->colorops = calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
+	display->n_colorops = 0;
+
 	for_each_pipe(display, i) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		igt_plane_t *plane;
@@ -3594,6 +3706,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	}
 }
 
+/*
+ * Add colorop properties
+ */
+static void
+igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
+	drmModeAtomicReq *req)
+{
+	igt_display_t *display = pipe->display;
+	int i, next_val;
+
+	while (colorop) {
+		LOG(display,
+		    "populating colorop data: %s.%d\n",
+		    kmstest_pipe_name(pipe->pipe),
+		    colorop->id);
+
+		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
+			if (!igt_colorop_is_prop_changed(colorop, i))
+				continue;
+
+			/* it's an error to try an unsupported feature */
+			igt_assert(colorop->props[i]);
+
+			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+				kmstest_pipe_name(pipe->pipe), colorop->id, igt_colorop_prop_names[i],
+				colorop->values[i], colorop->values[i]);
+
+			igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->id,
+							colorop->props[i],
+							colorop->values[i]));
+		}
+
+		/* get next colorop */
+		next_val = igt_colorop_get_prop(display, colorop,
+						IGT_COLOROP_NEXT);
+		colorop = igt_find_colorop(display, next_val);
+	}
+}
+
 /*
  * Properties that can be changed through legacy SetProperty:
  * - Obviously not the XYWH SRC/CRTC coordinates.
@@ -4041,6 +4192,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
 					plane->drm_plane->plane_id, plane->props[prop]);
 }
 
+/**
+ * igt_colorop_get_prop:
+ * @colorop: Target colorop.
+ * @prop: Property to check.
+ *
+ * Return current value on a colorop for a given property.
+ *
+ * Returns: The value the property is set to, if this
+ * is a blob, the blob id is returned. This can be passed
+ * to drmModeGetPropertyBlob() to get the contents of the blob.
+ */
+uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
+{
+	igt_assert(igt_colorop_has_prop(colorop, prop));
+
+	return igt_mode_object_get_prop(display, DRM_MODE_OBJECT_COLOROP,
+					colorop->id, colorop->props[prop]);
+}
+
 static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const char *str, uint64_t *val)
 {
 	drmModePropertyPtr prop = drmModeGetProperty(drm_fd, id);
@@ -4129,6 +4299,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
 	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
 }
 
+/**
+ * igt_plane_is_valid_colorop:
+ * @plane: Target plane.
+ * @colorop: Colorop to check.
+ *
+ * Returns: True if the given @colorop is a valid color pipeline on
+ * the given @plane
+ */
+bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
+{
+	int i;
+	bool found = false;
+
+	for (i = 0; i < plane->num_color_pipelines; i++) {
+		if (plane->color_pipelines[i] == colorop) {
+			found = true;
+			break;
+		}
+	}
+
+	return found;
+}
+/**
+ * igt_plane_set_color_pipeline:
+ * @plane: Target plane.
+ * @colorop: Colorop to set as color pipeline.
+ *
+ * This function sets the given @colorop as color pipeline on @plane, or fails
+ * the test if it's an invalid color pipeline for the plane.
+ */
+void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
+{
+	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+
+	plane->assigned_color_pipeline = colorop;
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
+}
+
 /**
  * igt_plane_replace_prop_blob:
  * @plane: plane to set property on.
@@ -4161,6 +4369,50 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 	igt_plane_set_prop_changed(plane, prop);
 }
 
+/**
+ * igt_colorop_try_prop_enum:
+ * @colorop: Target colorop.
+ * @prop: Property to check.
+ * @val: Value to set.
+ *
+ * Returns: False if the given @colorop doesn't have the enum @prop or
+ * failed to set the enum property @val else True.
+ */
+bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	igt_display_t *display = colorop->plane->pipe->display;
+	uint64_t uval;
+
+	igt_assert(colorop->props[prop]);
+
+	if (!igt_mode_object_get_prop_enum_value(display->drm_fd,
+						 colorop->props[prop], val, &uval))
+		return false;
+
+	igt_colorop_set_prop_value(colorop, prop, uval);
+	return true;
+}
+
+/**
+ * igt_colorop_set_prop_enum:
+ * @plane: Target plane.
+ * @prop: Property to check.
+ * @val: Value to set.
+ *
+ * This function tries to set given enum property @prop value @val to
+ * the given @colorop, and terminate the execution if its failed.
+ */
+void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	bool result = false;
+	result = igt_colorop_try_prop_enum(colorop, prop, val);
+	igt_assert(result);
+}
+
 /**
  * igt_output_get_prop:
  * @output: Target output.
@@ -4433,6 +4685,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
 			if (plane->changed)
 				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
+
+			/* TODO iterate over assigned color pipeline and prepare colorop commit */
+			if (plane->assigned_color_pipeline)
+				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
+								  pipe_obj, req);
 		}
 
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7c9ca73a7dfb..3b4f8dbaee20 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -345,9 +345,18 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_SCALING_FILTER,
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
+       IGT_PLANE_COLOR_PIPELINE,
        IGT_NUM_PLANE_PROPS
 };
 
+enum igt_atomic_colorop_properties {
+	IGT_COLOROP_TYPE,
+	IGT_COLOROP_BYPASS,
+	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_NEXT,
+	IGT_NUM_COLOROP_PROPS
+};
+
 /**
  * igt_plane_prop_names
  *
@@ -356,10 +365,20 @@ enum igt_atomic_plane_properties {
  */
 extern const char * const igt_plane_prop_names[];
 
+/**
+ * igt_colorop_prop_names
+ *
+ * igt_colorop_prop_names contains a list of colorop property names,
+ * as indexed by the igt_atomic_colorop_properties enum.
+ */
+extern const char * const igt_colorop_prop_names[];
+
 typedef struct igt_display igt_display_t;
 typedef struct igt_pipe igt_pipe_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
+#define IGT_NUM_PLANE_COLOR_PIPELINES 4
+
 typedef enum {
 	/* this maps to the kernel API */
 	IGT_ROTATION_0   = 1 << 0,
@@ -385,6 +404,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
 }
 
+typedef struct igt_plane igt_plane_t;
+
+typedef struct igt_colorop {
+	uint32_t id;
+	igt_plane_t *plane;
+
+	char name[DRM_PROP_NAME_LEN];
+
+	uint64_t changed;
+	uint32_t props[IGT_NUM_COLOROP_PROPS];
+	uint64_t values[IGT_NUM_COLOROP_PROPS];
+
+} igt_colorop_t;
+
 typedef struct igt_plane {
 	/*< private >*/
 	igt_pipe_t *pipe;
@@ -418,6 +451,11 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
+	int num_color_pipelines;
+
+	igt_colorop_t *assigned_color_pipeline;
 } igt_plane_t;
 
 /*
@@ -476,9 +514,11 @@ struct igt_display {
 	int log_shift;
 	int n_pipes;
 	int n_planes;
+	int n_colorops;
 	int n_outputs;
 	igt_output_t *outputs;
 	igt_plane_t *planes;
+	igt_colorop_t *colorops;
 	igt_pipe_t *pipes;
 	bool has_cursor_plane;
 	bool is_atomic;
@@ -810,6 +850,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
 
+
+
+extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
+
+extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
+
+/**
+ * igt_colorop_has_prop:
+ * @colorop: colorop to check.
+ * @prop: Property to check.
+ *
+ * Check whether colorop supports a given property.
+ *
+ * Returns: True if the property is supported, otherwise false.
+ */
+static inline bool
+igt_colorop_has_prop(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
+{
+	return colorop->props[prop];
+}
+
+uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop);
+
+#define igt_colorop_is_prop_changed(colorop, prop) \
+	(!!((colorop)->changed & (1 << (prop))))
+
+#define igt_colorop_set_prop_changed(colorop, prop) \
+	(colorop)->changed |= 1 << (prop)
+
+#define igt_colorop_clear_prop_changed(colorop, prop) \
+	(colorop)->changed &= ~(1 << (prop))
+
+#define igt_colorop_set_prop_value(colorop, prop, value) \
+	do { \
+		colorop->values[prop] = value; \
+		igt_colorop_set_prop_changed(colorop, prop); \
+	} while (0)
+
+
+extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
+extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
 extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
@@ -1228,4 +1315,6 @@ int get_num_scalers(int drm_fd, enum pipe pipe);
 
 drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.46.0

