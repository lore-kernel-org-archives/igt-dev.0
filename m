Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E09CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4810E894;
	Thu, 30 Oct 2025 04:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mVb/VcuP";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012000.outbound.protection.outlook.com
 [40.93.195.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F97510E894
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xlt8rnceELHFEczhxHnP5zayaC73JUYhnZzsiF2htyoIiZPMadd4xBiIDWHkuGCymRt75p7mpoiSTy5bV4CgkImBoomTN/enQjw1OsS3/IyHLkCMh5xzeG0Sz7axPAJxGi6lwWkFUSJmDqRWUOYpVO0A78XKMZRdwUqiHTXhgwvXhlknu2tbeXk0i00JUkbdH4Q7O/sk5OHkTGpjph85lCkjykufZqT3kYDTNHONHmv/Muj3+LdNTg9LxfAlb6xU6bDkEr8HAHBMGdKSRChmHOgaJflkp4/BmvaUJjYTmew1H6wLGMrTyi9m7aOR9QJvL/l2b4GSqyLNd493DtdzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMWuPncYPV8svVqW55P8KRhusjkyyDRfHWY0+JETJR4=;
 b=dOJeg7y96M1uQ6zg3kPDvq3iIK6EX7nw87uDH0dLpT0Vu36LU0oB4IA/fmghaHmKKrFnwi39kT22+Le5U9vZNsLPAqb56heHFu/wKxxshdeONUWpWvIDMYtlmSUmQFBldEKn7J8hv2sGj19eINfwKcedANJQ+72XySWGEDO+lSYH/66i4Xcgbhop1R8ZvvBwwCM2zeonYLflr9AqN0eYuZQtphyI5iEYc4L741J2eZWmA5pD6EsfGYQ2oxx9CVegpd+3V12NAdJi1OfElrpAzqwOmttzyxq4MZiOmsvxtxFcxImCjf6pCPwghIBNsIjpOZULvkDvraLQEa9azoT0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMWuPncYPV8svVqW55P8KRhusjkyyDRfHWY0+JETJR4=;
 b=mVb/VcuPfpXkiSWO2+fIu7vL99R5skRsuAjC6RmiShRZMYkKOw6f3YsF/3iotX8qYnvqbfCqgpD2EkHEOFJmiCDShEMMhVm7tzMEaxfAypYSwojADpsfYSM8l094reR1YqCEqUp2FV/OC3kcqBOrxV1IF9xHyONX4jdYexVTSac=
Received: from MN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:52f::30)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:29:20 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::cc) by MN0PR03CA0014.outlook.office365.com
 (2603:10b6:208:52f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:29:19 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:29:17 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 05/32] lib/igt_kms: Add COLOROP properties and helper
 functions
Date: Wed, 29 Oct 2025 22:27:34 -0600
Message-ID: <20251030042801.2315866-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d39b7f-e555-4312-a703-08de176ce4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eIOQ/F7DWL4tlmVW66D7M5EDveCJQoq45eywZcCj8sD/Qbnx0nfpAvCysQSM?=
 =?us-ascii?Q?nu2s7y5vEzy0oHrR/FOF7POXRt7eQjMcX2qGxtrH8zZgypLQXenP6z7z0VvR?=
 =?us-ascii?Q?7xckt+MVT1RwCWbI7kvG0xs86drL1YTrwVaCAR95B04xfCEHJrMWAhmfdVgC?=
 =?us-ascii?Q?HlvKUl7BBpWI38oO6wQjdnBAP63AloWNrVvK/jen1lzql33rEULTsQElBO14?=
 =?us-ascii?Q?+K4aqdN712ALBR0RZpR80prXTSDn8fBTI5MsY53RrGRYsQS4wLKCI+eYmdnn?=
 =?us-ascii?Q?1UpLTy2w4fujRv+vzrGl+0+N8hhz9KSkZyBCDOCXlUHMPnnmCnQKayrXLxZv?=
 =?us-ascii?Q?TqUaGLE6w25spAmjl8bxbm4Q3k/Q6Q/8yLaVX0vcl8c46jw8P0wopTMgfuG5?=
 =?us-ascii?Q?bVILuaVbPWd5wkRLUTEDp6o8jcDSH9Tmh5Kngy9zZI+hc08xkpJkhzV1vEL/?=
 =?us-ascii?Q?PziKk47zY3Q83foTpVVfUo942QNJi3Q4oavS8H3RTHLtN3/hwm30z5mkjyoZ?=
 =?us-ascii?Q?JNS7IcfGoh248SDCtMjsBvOr5R82wVfSuj0G7VYMwB5MHMf+31iLhRZm4wpY?=
 =?us-ascii?Q?6I6vOqQGNNKBwlRYdYU4xnSqGNndpIWo3ngrSWk9WaEsa3o5q9/bC1b/V1tX?=
 =?us-ascii?Q?QSQ7PtY8S6D8EB5ByR7n0ZtPnG5CuSmKAZZtIWPk1E14cmqZnasyu8Ic7Dcu?=
 =?us-ascii?Q?3HswJa1MJSgUnyMjpQXcuI+wD44CcGmR6hM2ppq1S8eYa+ewZSxphP95aTZI?=
 =?us-ascii?Q?3qDQ3BAVk7uUs4FanSbxuxYIfQaQLvIKpl9vUBgX1gCXjWorBeKce9pLLOT/?=
 =?us-ascii?Q?5z3gMR3Zs9MXCWNO0oW3L1lQW6Vpb0UZlJPGFtttv1hpdtlarAOSISmpiUbq?=
 =?us-ascii?Q?Cax91S96us61ZvvaglMBCUJAb74xZawPBufDA6ccH/RqCPUVIL4fdEm9JFLU?=
 =?us-ascii?Q?xa6Fi3WXmBxc/SNz+mo3NLn4gmi7b/vH7EcH0/qlFSF/frhA+5X+ONfNXKus?=
 =?us-ascii?Q?u27cexbjlrMAEiAsnhDBkiPVM23KrSBAK2u79lM2eM51SbDXX9dsCJy0konN?=
 =?us-ascii?Q?cgLyamWS1KvryiKHtEeHs5OEDZgNN86oN5IHo2eSha0VEHAYge7sMaf9g97x?=
 =?us-ascii?Q?gSsruqW8jYSLMHjISFQdJgTXEuvCHKfPFRm4awNrqe8VTttFFjdWsmIxwfZO?=
 =?us-ascii?Q?uDRDKdCdadJf5OIAMr3UCB4XMe8Bo7pEHQZStCq8hZL+M7YHXaPn565HlbwU?=
 =?us-ascii?Q?p6wp0fPMXG0sZQdxCiwAJTMEVwMufA+z4F06NibO/sR218SrSHx+3i9B/8qq?=
 =?us-ascii?Q?hiT2QKiD9j4Fhr/XZh2IjO1AF+xK282M6QKjFNiWM1c05peLn0V6vx/1Tg5i?=
 =?us-ascii?Q?oh7fH/ek8OI60CYli18SO0dwjdloSQrPjX0Zwf7gOtI0jdiwN64uRTRZRYVU?=
 =?us-ascii?Q?4A2MBb/cC7ExDXcbDwNX/XDWLQdZ7t8MrgidxgeYo1NOB6E1jThyISdzAooW?=
 =?us-ascii?Q?p8PeWwmQyMgqcQrrQvtBvcX+QpcVq3lr52T4oTVJRmkn07E16YI32oTWJSdJ?=
 =?us-ascii?Q?aR69HAI2lzLEmpljkK0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:29:19.4371 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d39b7f-e555-4312-a703-08de176ce4be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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

Introduce colorop properties (TYPE, BYPASS, CURVE_1D_TYPE, NEXT) and
helper functions for color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c          | 278 ++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h          |  89 +++++++++++++
 tests/kms_properties.c |   3 +
 3 files changed, 364 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 35c237fde..1305044de 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,6 +92,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+#define MAX_NUM_COLOROPS 128
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
@@ -702,6 +703,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
 	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
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
@@ -769,6 +778,109 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
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
+		snprintf(colorop->name, sizeof(colorop->name), "%s", name);
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
+				igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
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
@@ -800,6 +912,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2594,6 +2709,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -3001,16 +3119,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
@@ -3321,12 +3437,15 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
 	display->pipes = NULL;
 	free(display->planes);
 	display->planes = NULL;
+	free(display->colorops);
+	display->colorops = NULL;
 }
 
 static void igt_display_refresh(igt_display_t *display)
@@ -3622,6 +3741,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
 	case IGT_PLANE_COLOR_ENCODING:
 	case IGT_PLANE_COLOR_RANGE:
 		return display->has_plane_color_pipeline;
+	case IGT_PLANE_COLOR_PIPELINE:
+		return !display->has_plane_color_pipeline;
 	default:
 		return false;
 	}
@@ -3669,6 +3790,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
@@ -4116,6 +4276,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4204,6 +4383,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
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
@@ -4236,6 +4453,51 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
+
+	result = igt_colorop_try_prop_enum(colorop, prop, val);
+	igt_assert(result);
+}
+
 /**
  * igt_output_get_prop:
  * @output: Target output.
@@ -4508,6 +4770,10 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
 			if (plane->changed)
 				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
+
+			if (plane->assigned_color_pipeline)
+				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
+								  pipe_obj, req);
 		}
 
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c8923127a..14152fad5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -366,9 +366,18 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_HOTSPOT_Y,
        IGT_PLANE_SIZE_HINTS,
        IGT_PLANE_IN_FORMATS_ASYNC,
+       IGT_PLANE_COLOR_PIPELINE,
        IGT_NUM_PLANE_PROPS,
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
@@ -377,10 +386,20 @@ enum igt_atomic_plane_properties {
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
@@ -406,6 +425,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
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
@@ -443,6 +476,11 @@ typedef struct igt_plane {
 	uint64_t *async_modifiers;
 	uint32_t *async_formats;
 	int async_format_mod_count;
+
+	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
+	int num_color_pipelines;
+
+	igt_colorop_t *assigned_color_pipeline;
 } igt_plane_t;
 
 /*
@@ -501,9 +539,11 @@ struct igt_display {
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
@@ -846,6 +886,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
+	((colorop)->changed |= 1 << (prop))
+
+#define igt_colorop_clear_prop_changed(colorop, prop) \
+	((colorop)->changed &= ~(1 << (prop)))
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
@@ -1291,4 +1378,6 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index e646b8184..3bdf23aad 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -112,6 +112,9 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 			return true;
 		break;
 	case DRM_MODE_OBJECT_PLANE:
+		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
+			return true;
+
 		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
 			return true;
 
-- 
2.43.0

