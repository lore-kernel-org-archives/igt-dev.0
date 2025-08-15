Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D95CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72710E97F;
	Fri, 15 Aug 2025 04:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KtB+0bI3";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9892010E97F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDt98gDvTTLWzLe74SJaBVR1RVe9K8CQJsD/mUNSpNwXTbjSdGkkgUPo8pmH/ezuKtR/CiVP2fTUge2DzNpkPDa65yDxh5Itv4jhoMkuYAu3phIrmJ0+51UAl1OnFObop9bCacReQOsfY/h/EYIgKKzKjygha4faCZT82htkA7qMEc3KDXGsoHqo3ZeSojh4S0xSG1ZsoU97yupNEmYP35Qosu/HDHQCTdT/d19bSpYphLE8Fz6fawHs8fJq0FJTaO7kccTrV3q+gmjbtJoXG/v84E/yVd+PYOF4aMpYE+0YLEurj69k1aFzc8RRjndNV4pUoh0kW4HmwZ+qiNYWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0fjeDs2rU+Q0dH2ev1gWyFtggYPDNOFN+AqxzxNgsQ=;
 b=V6TbgeQc6bPb8VIyQycHd6ss5zej+G2hWGAJ2Hm3ZSZo8/f0zw3pxlp/RMy4aiEKzi6DkUZsJ58EGZs+Pp/b6gG5NGdKMur+8gQTFr/Q2LVGodJCq6fUNbfkyjPm3Q8WVLbja1fI07+Hcj3vjNwiPqs4bai9dEeCERpczo8tLL21pMfPmHo/DT8lfg90VvOzaDM5zM9LUxf/XADIPJ8WFJC/c/4M+hsiQuY75IcUME4OX5Sij5gJoZqtHPX/BFA1J41QjdJjWtnVIBs7ajm8SnZ2Hi6g6oXK/Fq07XOMZlcZB4D3L2LoyIK+euC9VO8W2S1AT18rzo9MuEZGMUqoIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0fjeDs2rU+Q0dH2ev1gWyFtggYPDNOFN+AqxzxNgsQ=;
 b=KtB+0bI3rNhRMO5IHAOjkHvfonnEFLFKaMwkj0BxDINKWs8B7RRdEawdvTRnWjFWr02ARz2JIT9O5ApoYr+aGxMLWoQRqhOdha4yirgZq1ub12DBGKLWAZvGQsIef6f1qahD21WAJE2RqcLN6f+SHUB04CylmxFZH5KFef+rQvU=
Received: from BY5PR13CA0025.namprd13.prod.outlook.com (2603:10b6:a03:180::38)
 by CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:07:50 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::e2) by BY5PR13CA0025.outlook.office365.com
 (2603:10b6:a03:180::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 04:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:07:50 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:07:49 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 03/30] drm-uapi: Add COLOROP object
Date: Thu, 14 Aug 2025 22:06:32 -0600
Message-ID: <20250815040659.3321102-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: faa9bb4c-029d-4096-0eba-08dddbb14d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ObeSA/toCAek6n4Rgu+gDDTwYgMtXOXgfF9OBDYvHeF2zY6vCgX0Uyl/qdOC?=
 =?us-ascii?Q?KAT3QzjzaGCMGNFE8tkZhW/dxSthak8R1vUSLFYFJ5lnQ1cFHCD2GOphry71?=
 =?us-ascii?Q?xq9D5ZvpK20eL7iZzwfrps4QgrJnggKv16yghxR2TaNro0MQxyM3HwdInTFW?=
 =?us-ascii?Q?PJPmPy+AIJ+iEz7YePES1BBCivrslYnHfuqytqbXvipyR1vMO2vFHrx0sghk?=
 =?us-ascii?Q?fhMXxWQwRDd4NHF8zUGqInRPK6BPQqDjijxGIfQ9we4R33pbzxBLOXd+E3pF?=
 =?us-ascii?Q?w/M/K+6EZX1NTMDOosVBwfTMzKba9N250iW8EHcj0bNQI9MOiGz3d1kHdoj2?=
 =?us-ascii?Q?UTg6ztLNYwmg0DCp/90VgsYnUfbGA3KyTeVrtbZrdwuZw/svqsjBWIB65FOk?=
 =?us-ascii?Q?uEinPmx7I4qv3PnKKIpL5VRqVy65J35560Kjw7L3azpxdF6u+qPzvhCD+z1j?=
 =?us-ascii?Q?YHhDvfZSVCN71VZzc5IKSJoZnzZA5DlAmR1TCxBBZW+wqJRvUgr0cxIQIfjn?=
 =?us-ascii?Q?UESRuIzjZ8Wt+KPierpFuflu61+reBUGUHHdGvbEwDgx7eIrYKB3zGbWrLZs?=
 =?us-ascii?Q?Ofi9oSde1+bGbXxZUvHki+0pyNgDKQxjrQAPj8pL+ar1WLCQ1Hy8UD5/fNcf?=
 =?us-ascii?Q?530Nwqczg1G0XXDS8Wy18cO8cFVkSIS7RA18TSPMIx3dNAsXu1J3EHPFLP0L?=
 =?us-ascii?Q?gAIqwoomafK5S7DpiINgz96g8Uhs4eceZhQ2YA21UaMUV3SXCDqJSSJwvwzj?=
 =?us-ascii?Q?Ay9dvDtrVRKiZJUd0Dx16pt8VmrFitpdfmIP/rYdI0fSeFWvAOIRMZhJs4q6?=
 =?us-ascii?Q?Y4iehJejFjCNy0Nfcsnqk2J8ZWhX4XnKU6xj7tm6MegBux4cFC5/4GdeOsfO?=
 =?us-ascii?Q?Wwnxg4F3sD1BsxpDum/waUasM59O5tcNYX3FmHP8qE9mgtTIOIuU0j265bPk?=
 =?us-ascii?Q?L6LgBa1G4UMWOZQMdNkfojHNKJ05T5Xe00di0kPVsXdc5lxdIN+OlVtA+8r2?=
 =?us-ascii?Q?zYpopWMta3RW0Qq379inDS/nOVpZBatooJWQ1CumE8dOilnMoTk/ApKxFyvH?=
 =?us-ascii?Q?by2yH6UmJgQhpw/f49rZ4zRBdZFM4WINrzUF5nYdduZ15P82dn26vWdzpIr4?=
 =?us-ascii?Q?Fzzysw4AzZz9PNkDUwiwivmdflnaxrs4N8h3So+uIvk8iUtiTyVwZajwrVRo?=
 =?us-ascii?Q?hNG8+RT4lOKUqoUD7Jcy2KeQL1hv2R4JUpoxCeLfMOVoQVoxD/oIaXpzmG3e?=
 =?us-ascii?Q?ezeRJST0XTFFS/ifs3+xnV8icr6W8RHFRzBA4dV3aTt+uSb//G+4yGXGJ4ux?=
 =?us-ascii?Q?UFtFzafa0TSRQz8AP8aPKRWmKWscNOd/bnZ61c4fpkVUuKjxq/vHdpL6K8HO?=
 =?us-ascii?Q?y3hZniR25uWPClkpp7/rdTaqwklM1/hlq733fB+AYdxZuMyYPySytPWHIDN3?=
 =?us-ascii?Q?Uc1pY9k91d31/NW2U8kbePdz6HaxLNY+sT+614WW5D0QR7hlbocLfRtXhBVj?=
 =?us-ascii?Q?hzJO8unDJoGaT1PJcsWdYd7WcxePNFCFyPlj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:07:50.5690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa9bb4c-029d-4096-0eba-08dddbb14d2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
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

DRM is introducing a new DRM core obejct, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi, including the
following types:
- DRM_COLOROP_1D_CURVE,
- DRM_COLOROP_1D_LUT,
- DRM_COLOROP_CTM_3X4,

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |   9 --
 include/drm-uapi/drm_mode.h   |  23 +++
 lib/igt_kms.c                 | 272 +++++++++++++++++++++++++++++++++-
 lib/igt_kms.h                 |  89 +++++++++++
 tests/kms_properties.c        |   3 +
 5 files changed, 381 insertions(+), 15 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index b38f27d69..ca24519c7 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1590,15 +1590,6 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c082810c0..fce45b5cf 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -846,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -857,6 +874,12 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
+	DRM_COLOROP_CTM_3X4,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a9641eba4..69beb523f 100644
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
@@ -769,6 +778,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
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
@@ -800,6 +911,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -3004,16 +3118,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
@@ -3631,6 +3743,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
 		}
 	} else {
 		switch (prop) {
+		case IGT_PLANE_COLOR_PIPELINE:
+			return true;
 		default:
 			return false;
 		}
@@ -3680,6 +3794,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
@@ -4127,6 +4280,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4215,6 +4387,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
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
@@ -4247,6 +4457,51 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
@@ -4519,6 +4774,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
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
index 8ec39fa85..dc2a2d9e0 100644
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
@@ -1289,4 +1376,6 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
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

