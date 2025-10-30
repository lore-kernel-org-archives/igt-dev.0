Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA15DCCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9376110E246;
	Thu, 30 Oct 2025 04:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sOZa6fwo";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010A110E246
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9moitBKV2CmKmlsZGKssjOFFCXmmS+h5QpF0tYjt8SReaONEA+41t0Y3Ti+R4xcXi/qpcunBs8MpSR7fycIQPZI6wzTLbdbnuVkxdBllOWbLLqa0K/b+4S4D1brypjhTT+dbiwZk4UwGK0DkOt1JEgygt83MF/du9WBXcktOC/H8hmCczpZVjPpep/1AJGl2Aokv13V2M8SoEI6N1R7kv+NsvcnawnnPeJWoVKh224sl427Q6fDPYQZxFsjst/A5f5E3mBH4Jrd/yusE+1TAqMfZAWMgtNQCy9unUztZd6ifrR1c49Ef4S/sBdgrBC+rvTqiNN0gqLzRsWQbXVvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnhZt/T0fPmqwMUH2H4AgSW39evmo+DuGIH4MQEHhnQ=;
 b=FzEy5mJEQUCDskP7HexPLeMLDEgHRX+YM9djU5CUav+rHXA9g6kyZ9LQ/n3V9dOmqEKrkVJSxHKDs9iq7DsmvEnWFSiI9bj7Iw8ThU28Ugy01ipy3N9q1++xXtPovJULE8n9EM3KddETro9jKYI3NsUHc8Wtxy5h74E8uJqe2C2DzDKzpkl5qOPS4uwF7C+69SYaQvrswwTbxiLAGYJSH0H+KnLqRmTltLLysDM1Y0CHiJbf+3OBMn1kNkOwP/ppIhNUhc2z4IPb53cvDTg750XoUWhTiBXVN3XxWElifKd9ua93SRO2WND5Mz6erGt7j2AZw1PalXnL8G+xpwxhBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnhZt/T0fPmqwMUH2H4AgSW39evmo+DuGIH4MQEHhnQ=;
 b=sOZa6fwoNdbzdyv8oDyQqglfoSsWjbcxDZZNugp8jx6GFrzAgdw2LlQXEbUWDKj8koXNA9nrMymLJ/4h8kNAL+33NlCErpX1igpPbhvXN7YYsI8E5HxHPYz9zWCaR4pwYEQDmygVtCvIDafeIwPI4qpOjlEiCt4h2R1WnWRfsvU=
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:28:55 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::46) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 04:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:28:54 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:28:53 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 03/32] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 29 Oct 2025 22:27:32 -0600
Message-ID: <20251030042801.2315866-4-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: accb56da-787e-4221-e2aa-08de176cd5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XiyV2EA+kQL2A9ex+AaXBeMalnouuxX9ki627QU56oTKY1K8mPKxbb1fi0G6?=
 =?us-ascii?Q?OrEhytq6c7z+pj+asCW4wiuXYxthE5fon+j7EBMOg5BNhnC3harR4n7xGcnb?=
 =?us-ascii?Q?2JEvodZN7dKFQdrFMDuHZmh74RHc/shMYrJs86i5zlsD9lXhO2GPhhBNUMmi?=
 =?us-ascii?Q?Pz2PSdRZkjrmkWSc3KvBJy8Rh/u4ESr+B8rmH1ozWaQixeF30NA7LFYLhdYv?=
 =?us-ascii?Q?C+Ab7KzNkrGWcK7fJakEnNKTyWX0UctJnCWoRc1dkdorLfAfU2CZHHiW8fLK?=
 =?us-ascii?Q?7oFxkYPWGYTA4Z2BMyctVEUNI5AaV1UpzCQMhIp+2VHD/AL61zH1QbQ/TdmL?=
 =?us-ascii?Q?a1w+6Dy1kxb1UFyzKhk3ae/ZY4r1Yr8P2XlCYMNai1nXuALMQO/NUe2Fo5WV?=
 =?us-ascii?Q?U5YRC251QarGLNeqsxoxJFz4N2Kq2YKaGlsPoymehSO4mE+R3EwUzbbpfuIe?=
 =?us-ascii?Q?wBqrmA9ggLqkc1hntL9vnVH3odUv+DRTUaQ+JTtVCrL/L7MPPSjniNtf3+ou?=
 =?us-ascii?Q?YcQCbB3Oy6opCsuncDAwKtc0tNqNV5ZZ15cDMDPqmBLH8QEMIpnoiyq1KX99?=
 =?us-ascii?Q?ImUdgdJT3ymM0ofzhrajZHIz2nufe2TLxRAxsddceG8/6FxsQ7zyGFtfkjcm?=
 =?us-ascii?Q?20N5GzW3B/wSBxZ49qeefPzJfYMOIY7Bs/gCq3Awrbj0kpwYpoCibSQ5x146?=
 =?us-ascii?Q?FoNA5uzbNi2kjEy7A5tqHDLij3CETqQlj0BjN9CH1l5ahDvCJvtIyPjLMsDn?=
 =?us-ascii?Q?RowxFfLV/IkliC5TekP9cmkQO+f+BWRAbl3TICMOUAJ98dxRV2AbMaV9669a?=
 =?us-ascii?Q?vhy0bbsVXe+bHVwFT+SNGrMeip+ZIr19BfqaLU2bmbaMnArDqUlrtW58StpF?=
 =?us-ascii?Q?XxRz7nedztCpiYzizywJi9k2uX5vw1+I2YONdEU58WBqfkCI6pQoefM34UzM?=
 =?us-ascii?Q?jG7z7t6HR/3294/EjWNc5PzzKPXujyyxJ+18yChJWCerEz70HlX656B+Hxlq?=
 =?us-ascii?Q?5kBb65hqEmCRI3vdEwXcson0C9Qnkz4rI7gu0DvgZyjaztewtGUr4t9k2q+L?=
 =?us-ascii?Q?tIDxvcBALBKL4euJTzdnpPVdsBCt+RIv9vOWeUf58Gsw1jQmePUyg6CVKXG1?=
 =?us-ascii?Q?prmOByc3/4RxrsX/LLI/7j24Uv5ox4zYLroNcjBFfrSNOlce3iBWnK8kxeIr?=
 =?us-ascii?Q?dXSCLI4cR80eb6Zhn4iescia4wAEyI5g7HT43biK62BF1KB2rpcpZSWXraRW?=
 =?us-ascii?Q?Bje0A//Q104DcX8N0fhP44rMn0kBY/6hOzOEZ50S2xl2EmyNn8Ns9IiIVf6K?=
 =?us-ascii?Q?ztdHhG91JrBv50YaihkKHA+vpLDIbb7TuNBed2y07VHZagv6B/5DGBLl+vQ4?=
 =?us-ascii?Q?PP1ZFF3m+KDhx99mF+Tch1tUa68F4Jlmg7ud1LmOZiuLdy0aNghNvM0dEtGA?=
 =?us-ascii?Q?k6EhWxyXCWPZiZrX/4jDx7+FLeXtpni7hrlhF8g2lrr4dfAeRUzVR68l2suA?=
 =?us-ascii?Q?vgyxFw40qMhsDa65ua64JN2E4AfFa8Ui4VUn++4yfbCK9DJIGEOnE14+Kdxb?=
 =?us-ascii?Q?JN51DNWGIb6F7ax/8oA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:28:54.5547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: accb56da-787e-4221-e2aa-08de176cd5e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146
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
---
 lib/igt_kms.c          | 52 ++++++++++++++++++++++++++++++++----------
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 20 +++++++++++-----
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eaf483d4..35c237fde 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2545,6 +2545,8 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
 
 static void igt_plane_reset(igt_plane_t *plane)
 {
+	igt_display_t *display = plane->pipe->display;
+
 	/* Reset src coordinates. */
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, 0);
@@ -2561,13 +2563,15 @@ static void igt_plane_reset(igt_plane_t *plane)
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
@@ -3609,6 +3613,20 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
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
@@ -3628,6 +3646,13 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
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
 
@@ -5222,12 +5247,15 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
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
index 7121ab985..c8923127a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -508,6 +508,7 @@ struct igt_display {
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

