Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48A0C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:38:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487CD10E574;
	Tue, 17 Jun 2025 04:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ldj7b66W";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC8110E574
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yis33ym/QMo7LwNbC/hSSUWRvIKG1+S/PSm0ShsflJTtTCK5gZTZYjqTAi3+gOBnryTBVR5ST0+hIXhFZknjgmwL0NHdiLSgxzfvjhcg8EcrydCzB4mrYNnFzq5w68R5WztO+GUZAuj0KbUBNbefswnpu9DFFqYf/0/64la8UkI4LpNYoMni1nETHYjA3aLVJ42+OhlGYzhzCygR9jjOC7Gll0vNHIVedPJgoMiJWmVDM0qJ3DwmJ4vTxBn57JPsZZwF21B8mo24DW5hhLSo1UVjQ/xjnA2u8fgQfTaH3No4CG0Ih9G43R1vESNrLem2DBKwY3UOVFzIdnMAE2tIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1ejEqiaCvBKx6tF+N25PFyyevj/b7vYHXBG10iEUcg=;
 b=AT2AtpUAB5Qo/6hQ7+E3sj5glSCyKlp8fdS4WSY/SlNfJN7uHPvfRguPXhwk8EEiSQp3tBx4sf6v3CmEFSwUKgRUaXZ+6wWQKoJD2zQecBQoqfjslnEx/924+JK3KrQ1Vg56AZxzutUoKHPEXCIs26AadNg38zB7roiB9DfaD/O/Onc9n399Gfvr6T6ftv+EsxERN8tTn9KX9Ctsi+jXpVKYSq8JPGL6r9gnEJD3uuaI5iYk4xMDxB0OGmFaTyBTHOi3hLqnLmWoMb5KR1JmaebA4TpeHqyBBVUhRFLAP6rru6WRkRHs2/j12r3XawPD0DgubjsyKrY9/1zpMmBH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1ejEqiaCvBKx6tF+N25PFyyevj/b7vYHXBG10iEUcg=;
 b=Ldj7b66WwVx59erLraVXscQffesOSKfE2N7Ugq5mWdRRGUk7MlflRLrnOo3803XHiDY8WM//fdNJv09SoIRMl+vf5rEo5weSjRd6nw4z0dxdmtWf9lsmJw6IDwKcFNxWsMT3NTggP0fEWnFvCVLcNytYCDB8QYFMNomnCCBm6T8=
Received: from DM6PR14CA0069.namprd14.prod.outlook.com (2603:10b6:5:18f::46)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:38:22 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:18f:cafe::14) by DM6PR14CA0069.outlook.office365.com
 (2603:10b6:5:18f::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:38:22 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:38:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 08/36] lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
Date: Mon, 16 Jun 2025 22:36:03 -0600
Message-ID: <20250617043631.2920587-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: ae71115d-230f-4eaf-d3db-08ddad58caae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VmovEwFHEsedUJSJLgSCEXMfge8+UtjeDjSylMivGZpDncEH4xnntZS0a1jH?=
 =?us-ascii?Q?vZO8M3vGsWONFvQVH5Ca+IzbBoBTu6RnLMgsbOHqa6c/qQ6jpNo06QnHnFuN?=
 =?us-ascii?Q?TmULIR98CQZIcXE5ld4z+JwQjsk30/0FbAYJvJZE3bjG09+EGzWvwsEkl2wv?=
 =?us-ascii?Q?oCHEeDX4uo8eEV6iApcc6FR5+tso+a7fFpKWdR7yJ0lcBKc/F1AyNTIQ77mr?=
 =?us-ascii?Q?aQ+QlB5ftoTKpiFJaSnbpxVZE2aPU7P9C0GZnabYm+TPmyWBfoamOXpnbqjS?=
 =?us-ascii?Q?CCfRoZzRcCXv2FlNnioRLtEeV26+hdBZme+gdMMjoSelHPfEYCtE1wY14ZO6?=
 =?us-ascii?Q?p9inN6MH4s6VM2CaZ5Rm0hQJG7R99GUwyskEdHo3LlClLS1kdmcdC9+cZHXn?=
 =?us-ascii?Q?Gj2794DpuvuLBwbz1Vr7gEYoKqCPbxLuN4yUCrDPNi4iZS1PimsrsTPa+AnE?=
 =?us-ascii?Q?gTn3IP9gVB+aM2IzzQ8mYnZDhgltLucs3znhWgO21Xgp9/3gQhtG2jm7+4Iy?=
 =?us-ascii?Q?HoErMFE9ikDFz5e2rrS3vzBs582pGTGQWkJMos3OJm2uBYQyanX+q0k5OCMz?=
 =?us-ascii?Q?FyoS9849f6YH/MuK5H9cJG57u3Hs8YnKNM7LHIQqKn15ecOE1dnqrYKjJvWe?=
 =?us-ascii?Q?yJqJ3GfHaqxmHJM4wMSSjWAKFhNda1WG/fPeazSFNDnZNDsm4KQOfslomneB?=
 =?us-ascii?Q?ty1NCFoiGe3VZlvtIFPk0rmBag4efweC+mRJ8FY7ZBk/df8OKev5WzmHMb2I?=
 =?us-ascii?Q?kFZ7wkvseYdQ2/jb7iMqBW3hhvLzXtpUA6kKIBgH/XE2Ep++nYWYoBMj7rOp?=
 =?us-ascii?Q?s+P7vJD2MsRU2UK8yvXoUBms3ih7/0ETPNvyyXMXryLitkQJnnxB14CPVSLj?=
 =?us-ascii?Q?i3woM/urFnew/60RSKAiKdoUbRnySPugqak5cNGkX9R0+gfkF9wloZXqfpng?=
 =?us-ascii?Q?cNPymBBH/tnKyjHhuvS+IhTB2Ij0x1uZiPkIm+/27asbEdq5DunysE8ZCuXA?=
 =?us-ascii?Q?eIO8OXgjCK3MyXFBqjrbSjlzii4rTH0oSvHw5UEIiWNt0P6Lha6ZwosrhL//?=
 =?us-ascii?Q?kQ8xtHrr/EalvEuYHxrwErEPMgwdDFkYzhVb+y8YeIL2evRVN5dBVr50lnK/?=
 =?us-ascii?Q?ZiUjBGRXkk0bXqUW1YhNWvxeOw73ks5m8/GqsPOP2/31Iw118eXT2gOm6VFN?=
 =?us-ascii?Q?pSmhVThV4mnM+mAeVuMOLj5v2Pxi9pzMSjri4y9eZ/I5fGk1pe/VEqEe0fs0?=
 =?us-ascii?Q?RlQvJueWt5YB4Sso19QxpS11NafVneidbJYBGtfhmghoL6+YJMRtzpOuorsI?=
 =?us-ascii?Q?AhoAv5WgWmRpOX4VKx7QRW/PV3lmcvZjmF0Beh1UT1npkq0v80RZGynYpktP?=
 =?us-ascii?Q?zhbk0PPfIuic2Mx7tWPHvhI108po/tozZddfS5Q6FcYeIzpnhYE6sNQwl2Yv?=
 =?us-ascii?Q?LiJhJnV2+gP4SA6dSBFXQNDfvtcdIHkjTcTqT3aZ8asD8RoA2EOUZP0aJXsT?=
 =?us-ascii?Q?GO+CMtpUu1PD6DytRgn2xdBknLBAs2XyP1qF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:38:22.4901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae71115d-230f-4eaf-d3db-08ddad58caae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271
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
index 57059e4f0..d0c0e5ac4 100644
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
 
@@ -3003,16 +3117,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
@@ -3630,6 +3742,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
 		}
 	} else {
 		switch(prop) {
+		case IGT_PLANE_COLOR_PIPELINE:
+			return true;
 		default:
 			return false;
 		}
@@ -3679,6 +3793,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
@@ -4126,6 +4279,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4214,6 +4386,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
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
@@ -4246,6 +4456,50 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4518,6 +4772,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
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
index bfbc3bfc8..6f9eeb578 100644
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
@@ -1284,4 +1371,6 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index df8f21992..23d6d6f76 100644
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

