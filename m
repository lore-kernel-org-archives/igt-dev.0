Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA28C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D5910E793;
	Wed, 26 Mar 2025 23:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TEuE1bpG";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9910E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8QDmOk+asrh2Q7ZX9DRBlWh+uYwlxy4qH2kYlOj9Qodqna3lMxm0zs12tl+/S3HACgEz0iFQIrW/qtPYbxqJFLEEtJqJ7Goc3EhWxNw6pLIxagI20r6daRBHKvKGRO+TDpk1gFBJCSaXMo1V/YsRdPCXsu3aQxFRDFnzjwMwyTkxBjt0d/+0PViyquw/6mY2ekRWS7rUyOCxegrEMP5Bja6x6sWFwLz3++duWWv7t1Wdyq+ortNgO0OQjy1HatQhJMWT6GHWrlbMKfrCDslIEhoJBSJj8QuxiFtZSKcXWXgZJI9lq132ytzAiWqbeYinl1CrZHrJDL3wOFNqgATTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s8g206MXLV6EIn15v2ArpDd8DH4w/Jj8Y7o8kyxk2c=;
 b=qqJdsE2nWrlx80gBp2q3/dV+fulolF+j1N/nibHHwk33OfuX/Tqy3S05xlhkgCAqeJNk1iuINBkIPB1b6KtADh9ifQDN5yTvIbR+i6gRx/L2XdmRevzq1MBbq9lRK1X6Y+f6OgBqxO6yWY42NSKgzb1iErfm7CVTZf1bqtYkkscxRAFd3SpmB37iNP6oW6Awfmk6ejO40wtln4vVbOeJyEZSfBmj85Q0Ar4xgfJRDn3Urx8KXzAQPSo49Vr5WEqJWd3JJ4ZI/z/OpN969G3wGmuZolzMv3UX95BIQcRKMTm0dO78NzcFWPHO5ze67KHG+fd14jx86VSEwna2fr7oiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s8g206MXLV6EIn15v2ArpDd8DH4w/Jj8Y7o8kyxk2c=;
 b=TEuE1bpGfGQm5PeB4nzqNXHab+cPHYlzus34ZGtQIyzRf3hrvooMKsQJgc//sF7/KvOrSxqeIIGKvgUq91mg4XD1M3UudR0LYOxHkQk8h2IPM9wPG1dSw9NPsUNbr2MOJOovfvpizlKYtKJdhK47yogOQ6XYLA/Pqr+AwJLjFkc=
Received: from BL6PEPF00013E0C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:e) by DM3PR12MB9328.namprd12.prod.outlook.com
 (2603:10b6:0:44::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:41:12 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2a01:111:f403:f903::4) by BL6PEPF00013E0C.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:41:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:41:11 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:41:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 08/37] lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
Date: Wed, 26 Mar 2025 17:35:40 -0600
Message-ID: <20250326233609.2980110-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|DM3PR12MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad49f8c-e66f-4123-5f45-08dd6cbfb07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ayh7vQUma7MNbWDOZwSDCDzTUC8pQ4dnPTTfVX2CofuxwfhEL5mdbA3TxohJ?=
 =?us-ascii?Q?/kJd5IFQjq0dHM25DjJlmSUDyom0qUUqd4JTPuUjXjgx/oMZZ1wLxNoheRI7?=
 =?us-ascii?Q?cS0u8NrS4CG6GuUJpXDQR3rI/mxoQt485u+4MRZP8pFLTmhzUoFpb8tzEXPV?=
 =?us-ascii?Q?5VYU4Ua2xkIbwc9Apt2TpqWSdiTGP1TIvY5t+w1AATLq5XBgHWtEPH+TbYJf?=
 =?us-ascii?Q?mnpxgn/fv3JwY00WZZSOODh47oEQ0goD8OeltDlvxKWUEDniybZkWZrnQJQt?=
 =?us-ascii?Q?bF3CQjgPuV+1WM8WWs1h2FEPZk7JxcTgvzV8FhU9QbIV4yFbyu9vlvG/H3Re?=
 =?us-ascii?Q?vlufp/1b5GZ4V0d/ou/+RtqUBM40ko+BW9CaOyq9BW4QgJucLtS+4W5jDnA/?=
 =?us-ascii?Q?gQXPe/s8xALej8BsJgHoYY+kcy7OxaCIzlHyPnytjQSm+pCBx72fnF81/0a7?=
 =?us-ascii?Q?UDf1sDKsPGId9VwT8J0OWx+2dhpRCxg0gEV+nS69WlzlPRS2XGT6BxPEUEWS?=
 =?us-ascii?Q?JFiGt9a8Wj8o0dNNsUbCfOeejiHyi8x0kQu51eksCFHmpLIT8MsQll1FOIWz?=
 =?us-ascii?Q?u5oZg4D5ceXHWrwgAKBGwZry6hJhDrxoU71qusf3PzF7hoZRxAS7LPbJM8co?=
 =?us-ascii?Q?Lb2Z2ZAJcGDQQxZQ3L7eaZqAvseewP9gPGRD/IkgWDoTENgL1e3WxTqMOLvQ?=
 =?us-ascii?Q?yqWIKUQyV/Jz6KRLfIRLImyUzUUPJRtXTkIaJOGxQ3rQaRf/4+jirOp0YYa7?=
 =?us-ascii?Q?HEpB8OYqY+gIBo+uJoprIYl8F7lM+hD9gygZZIfnlt4l+xcCsPfs89O+Aro7?=
 =?us-ascii?Q?LO0NOSl2U+RH7wfw53mO7mn7j7J6cqNTnI2lDAiaiy8YasPtfmTZ5tD6UKcu?=
 =?us-ascii?Q?jqtL3sjsP0TSJ4RFp5YXckvDXwhA8QUYLqulKBcJTQxRwzQWpEqg6lzd728g?=
 =?us-ascii?Q?EjXZ1GV2O/s6YPASIQ+gN8FMHHyoffQE8jko9yr4CSMG4y76AbuI14Dnvp+s?=
 =?us-ascii?Q?0a10RU4Z0CLNx/bghwU2CsQqR3vdpbNJjL0jYJLZ4qHZOrdk9YqNzrjKYXxO?=
 =?us-ascii?Q?mgEFEUPi1aJbCAaCCyB4/JSr8Sfg8FSTYmZrXbg6UwL94i2mKtuYF0xcrMaD?=
 =?us-ascii?Q?IBc1N/H5w99HW6FUZ0ODcgLJs2X2XFt9HZ6/ei38iIgwsQCtvXs9zA4iE3hy?=
 =?us-ascii?Q?hO6WqNB/ETNOmhAhXmhvnLz8mbhWunANe696jhM3lzx9x2lYLv+Fwip3rCKZ?=
 =?us-ascii?Q?K+JuMgzRSeCqePBMgEcX2rzJGGzzsaGF4dlQHipwb8GNOSjO3kyv4hXLtJiz?=
 =?us-ascii?Q?pm1tNqqJej2zStwKU7Tqyx/8FHziWgCgK0jEfqgm2XMBmXDQuzelB7Cpi9dB?=
 =?us-ascii?Q?qH2HtsNncr+F/+Ij6IMLgiUBo/A86DAehMBQPMNzi+MAyBCqth+Bp0/nBt+1?=
 =?us-ascii?Q?JsS57tOX7WoZI5ww94IJpbvyYU+F4tglmgnLAIdS7X41Y1wz9/fOag=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:41:11.1347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad49f8c-e66f-4123-5f45-08dd6cbfb07c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9328
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

From: Harry Wentland <harry.wentland@amd.com>

We've introduced a new drm_colorop object in DRM. These are
used to make up a color pipeline. Introduce the concept of
this new DRM core object to IGT, including:
 - discovery of drm_colorop objects during init
 - various helper functions for deaing with drm_colorops
 - handling drm_colorops in atomic commit

Along with this we're also introducing a new COLOR_PIPELINE
plane property to track and be able to retrieve the colorops.

v6:
 - Ignore COLOR_PIPELINE property if
   DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set

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
 lib/igt_kms.c          | 271 ++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h          |  89 ++++++++++++++
 tests/kms_properties.c |   5 +-
 3 files changed, 358 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 88ed35f07..3f0ad25ce 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,6 +92,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+#define MAX_NUM_COLOROPS 32
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -701,6 +702,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
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
@@ -768,6 +777,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
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
@@ -799,6 +910,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2999,16 +3113,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
@@ -3626,6 +3738,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
 		}
 	} else {
 		switch(prop) {
+		case IGT_PLANE_COLOR_PIPELINE:
+			return true;
 		default:
 			return false;
 		}
@@ -3675,6 +3789,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
@@ -4122,6 +4275,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4210,6 +4382,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
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
@@ -4242,6 +4452,50 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4514,6 +4768,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
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
index 7531ae53b..04a96f47a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -365,9 +365,18 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
        IGT_PLANE_SIZE_HINTS,
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
@@ -376,10 +385,20 @@ enum igt_atomic_plane_properties {
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
@@ -405,6 +424,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
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
@@ -438,6 +471,11 @@ typedef struct igt_plane {
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
@@ -496,9 +534,11 @@ struct igt_display {
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
@@ -841,6 +881,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
@@ -1283,4 +1370,6 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 01ec3bedc..1f21fd851 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -112,7 +112,10 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 			return true;
 		break;
 	case DRM_MODE_OBJECT_PLANE:
-		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
+		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE")) {
+			printf("hwhw: ignoring COLOR_PIPELINE\n");
+			return true;
+		}		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
 			printf("hwhw: ignoring COLOR_RANGE\n");
 			return true;
 		}
-- 
2.43.0

