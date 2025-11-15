Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B29CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478AE10EBCE;
	Sat, 15 Nov 2025 00:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2AE2vKTN";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785C10EBCE
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbXxwhW/tSWqXmhNyHDrwaErxoq92zM5sVFjZ/GwdQisdin9E2p5zxlqGyy+wg9ihKRvYLPKBZwQfRUS6DeAinnT06CoIFH7Fs7QXHj77jgLfuSx5yXfm0FLotydNLKGNA8PPbEBZS+yPtVMLqbjm+eB7PvH7KsQmwwvIHnp4S5owB8UNn12GWURBVxhpVDG2hvTRewmYgH5/tgkFBJ+K5Gv7bCQZM+tzArRa0C9YIOJaIgpe7XGb1dvQSf88HXYm+MwmflX8IRtBXLUxqfehwf+9ry7CNzyIryKnkwL3/38ZDQLDdzvjF6bDQHZq/bvbuKMiJ+cAB4DeI7VuaRHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwBHWAXh0m0hJ0jaH3WtGT06ZmqRczpIs2lbceclvZ0=;
 b=UGKZzZI+aai8zb0rHdTgQYuU3ATy/P6KIaXjm6jWonWDtCdX0n5doz+lbNmJ9s4mx/Cu9oHjPqNAAIVLX5eHvyV5SmSp+7vjCrySMfFbGLqfqonLmT7M1r4SX20DLrrVrHpGoEQj8AyjkU/WBLDM9AtyeOqmS9/9bj4EybhUN8JFDjYH4ofmiZykv+5zaAxv5wvxoJTRQbs5eW0DQTEz8JGPqZMgntAsm4wioI+eedbR7gDK2TIgG3VLvN2+JA0JxDwHnXPKEgmaFlAcxV607dce9+X1ObvKT29VtjNiqnknFhC107maLeCKakEUqn3jbbGVF3dGTku+P29WFgZipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwBHWAXh0m0hJ0jaH3WtGT06ZmqRczpIs2lbceclvZ0=;
 b=2AE2vKTNCO6gdDUzjykzApcHieUOHDnD9GbbkWXzh/Dqv9BwQHjAQxNzLYAyMlKJSNHo7JP8avxeY3DTSz0uOZZCWO/I0k/p6DCr/QCF36MfBqrOAS/uXIo1tE2PGK9H9z1EcqCCqZNvIiwM9CHJEHBb8yS9LFTKNQcmzH5769M=
Received: from MN2PR06CA0014.namprd06.prod.outlook.com (2603:10b6:208:23d::19)
 by DM4PR12MB6160.namprd12.prod.outlook.com (2603:10b6:8:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:19:29 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::4f) by MN2PR06CA0014.outlook.office365.com
 (2603:10b6:208:23d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:19:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:19:28 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 03/32] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Fri, 14 Nov 2025 17:18:12 -0700
Message-ID: <20251115001841.3563993-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|DM4PR12MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bcc2e1-d208-4dbd-83d5-08de23dca47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHD7RzNv+P6t6AG5A61jovZHs67Pqm9Xbg1/jnIAe0fcuVMsZR6keJXwVB0x?=
 =?us-ascii?Q?u32oQXtOD8GFEouLWDBCWRhQixBq70MTUAZfk5OWlu/DiHPwGFI1om37nEkf?=
 =?us-ascii?Q?FT4HNU33NKfVgMUbnKRTswcqnEiGyqiVhyFprukD4Ds50pE+eNjEqRhEML8q?=
 =?us-ascii?Q?vVEeQ+fSnMIHyWXLTIAR23a1jk4LOfvMOoh3655OyY6PTKM3RFD+TheBRgG2?=
 =?us-ascii?Q?P0notF+Cu2KHM0484IkVanz6K8fMGvLQ5I6w0Bl9bkNuACveiIDWsi/BAXC4?=
 =?us-ascii?Q?DYEY2IjYxelg/rvsQiUnMwW7NeEyR9fLMe8KyeNgGc4atX0fufzYZsaEgcPy?=
 =?us-ascii?Q?0y46ZxUREYDLrJR+LCIsZTFNCG54oXYucZg1/muGcv+xNveLacp6rBqIcTnY?=
 =?us-ascii?Q?CzCtDf8cQ0yoMLo+MiRj01C4Br+TggP3Z8nSvx68cPVOXqyGwN8hiz/AMmU8?=
 =?us-ascii?Q?ivg+8+jJHXuhubLtW+dLuxZXSFIiRlAqZm23l7Y4BogavWJxnvQO11/aHN9k?=
 =?us-ascii?Q?gv+zXera4mZmolrNFyqK+V2DYXYxoyJRodc+X1XRKygH6dMedMoo0KJXL/gH?=
 =?us-ascii?Q?+XN7CSkVwytO8hfg4n1wEM9MSaf6tijOrv7AVLVh0UKP2fNECLyhwHvnHSKv?=
 =?us-ascii?Q?wmKVR3WgUc/y2XItdGLRcNGrvhegpYxTPeRZKdIRC5sjhFoc5YQuRjOAFfqg?=
 =?us-ascii?Q?p8ciwV+KRXZVxNEXERt5FELN1QQlDjZBnc+JTXVE08cUjmkB3r8NoRdV27e2?=
 =?us-ascii?Q?4oB3tfK9Kuz216XSFgkW6AR9SQ6ZXC95yuB59S+KzYijopHEUOxaL6d36BZs?=
 =?us-ascii?Q?OvUDapOyoB9bwV2XlZUxPZmufw/Nq6uVWQibyIVgjbQ13d0m2WqBNDd+R+1Q?=
 =?us-ascii?Q?JjXeEYa+dz76OCxZL1R+bd1Lzo6DWa69/xZdXxABGXafrO1X0j5bFQpXroqB?=
 =?us-ascii?Q?zOyJ43bjZYltVuz3AodCl6ngtEaAbq1s1jxq2fbsfnPLRfHU0Vqq0RhXQCW4?=
 =?us-ascii?Q?hjJQkjPXOwF0ptdzrOhB8acTq+/ugmMkYLD9sYWTDHsWSpgn5+11oQAFTclv?=
 =?us-ascii?Q?4n64r+2dL0Gq5HC7X32O3m0YahNux2YuHzEULfx/+Gm/wQ8aZw1rxC1IBxDz?=
 =?us-ascii?Q?prG2hc1Sod76cpvRnXax1t/2VXafoBZKt8Q8umPvSKQalCWcLL416rFDhVmM?=
 =?us-ascii?Q?/92ZQ7xQlm89LSVQZUWBiyXeuGtYx2Zaz5PL/VWBfjGy35LwsY/wbFxp0j7H?=
 =?us-ascii?Q?+5Ow4/iTd9qIpoJz9X4ugNeHh4DYj8ZMSPoGAnQIS1lNk/pQOIVVOLGg20ss?=
 =?us-ascii?Q?tKbNiczj7GZRt4nadz+93ddOXfjjhIXXdF2P15aVSyAkbIa12P6qIWlLJgp6?=
 =?us-ascii?Q?v4ZgVXcKGVki5KOGgUeWUi8YPsbu4PpNCBA4c9FYNKxnyZ6/r1xzcRjcAuJz?=
 =?us-ascii?Q?8Uqi7Z2RC2Puetpdx4/7AdgwLTv4EIcwi9DHiXd+z0o0OIH7HNbf4PDCX6bw?=
 =?us-ascii?Q?WhM0aoCquSd9SMYyy8xfroSd3O6GySbOK7Bp+N0z9lw8fk6Keyo0vVBfEPWL?=
 =?us-ascii?Q?BRPZrXClWqhZgw0qzBA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:19:29.2281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bcc2e1-d208-4dbd-83d5-08de23dca47e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6160
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

Setting the COLOR_PIPELINE plane prop is only allowed when the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.

Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_kms.c          | 52 ++++++++++++++++++++++++++++++++----------
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 20 +++++++++++-----
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8973ffdb2..19582956c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2565,6 +2565,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
 
 static void igt_plane_reset(igt_plane_t *plane)
 {
+	igt_display_t *display = plane->pipe->display;
+
 	/* Reset src coordinates. */
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
@@ -2581,13 +2583,15 @@ static void igt_plane_reset(igt_plane_t *plane)
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
 
-	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
-			igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
+	if (!display->has_plane_color_pipeline) {
+		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
+				igt_color_encoding_to_str(IGT_COLOR_YCBCR_BT601));
 
-	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
-			igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
+		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
+				igt_color_range_to_str(IGT_COLOR_YCBCR_LIMITED_RANGE));
+	}
 
 	/* Use default rotation */
 	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
@@ -3631,6 +3635,20 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 	igt_assert_eq(r, 0);	\
 }
 
+static bool
+igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	switch (prop) {
+	case IGT_PLANE_COLOR_ENCODING:
+	case IGT_PLANE_COLOR_RANGE:
+		return display->has_plane_color_pipeline;
+	default:
+		return false;
+	}
+}
+
 /*
  * Add position and fb changes of a plane to the atomic property set
  */
@@ -3650,6 +3668,13 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	    igt_plane_get_fb_id(plane));
 
 	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
+		if (igt_atomic_ignore_plane_prop(pipe, i)) {
+			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+				   kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+				   plane->values[i], plane->values[i]);
+			continue;
+		}
+
 		if (!igt_plane_is_prop_changed(plane, i))
 			continue;
 
@@ -5244,12 +5269,15 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 		igt_fb_set_position(fb, plane, 0, 0);
 		igt_fb_set_size(fb, plane, fb->width, fb->height);
 
-		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
-			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
-				igt_color_encoding_to_str(fb->color_encoding));
-		if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
-			igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
-				igt_color_range_to_str(fb->color_range));
+		if (!display->has_plane_color_pipeline) {
+			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_ENCODING))
+				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_ENCODING,
+					igt_color_encoding_to_str(fb->color_encoding));
+
+			if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
+				igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_RANGE,
+					igt_color_range_to_str(fb->color_range));
+		}
 
 		/* Hack to prioritize the plane on the pipe that last set fb */
 		igt_plane_set_pipe(plane, pipe);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f7ff0b17e..82122ee60 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -517,6 +517,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b30387888..e646b8184 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -101,7 +101,7 @@ static void cleanup_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 }
 
 static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
-			    const char *name, bool atomic)
+			    const char *name, bool atomic, bool has_color_pipeline)
 {
 	if (prop_flags & DRM_MODE_PROP_IMMUTABLE)
 		return true;
@@ -111,6 +111,14 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (atomic && !strcmp(name, "DPMS"))
 			return true;
 		break;
+	case DRM_MODE_OBJECT_PLANE:
+		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
+			return true;
+
+		break;
 	default:
 		break;
 	}
@@ -164,7 +172,7 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
 
 	return false;
 }
-static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
+static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
 {
 	drmModeObjectPropertiesPtr props =
 		drmModeObjectGetProperties(fd, id, type);
@@ -183,7 +191,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 
 		igt_assert(prop);
 
-		if (ignore_property(type, prop->flags, prop->name, atomic)) {
+		if (ignore_property(type, prop->flags, prop->name, atomic, has_color_pipeline)) {
 			igt_debug("Ignoring property \"%s\"\n", prop->name);
 
 			continue;
@@ -230,7 +238,7 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
 
-		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
+		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
 	cleanup_pipe(display, pipe, output, &fb);
@@ -244,7 +252,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }
@@ -258,7 +266,7 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
 	if (pipe != PIPE_NONE)
 		cleanup_pipe(display, pipe, output, &fb);
-- 
2.43.0

