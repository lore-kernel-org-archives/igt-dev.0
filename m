Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6CDC36010
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6AD10E11A;
	Wed, 26 Mar 2025 23:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e+RVMTkh";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E1910E78F
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYHXEc1H2LBLY+WMIwHyvY3fH9KTZacTWEiFktGboFCKIIkAK2QDo3KrhsS77huNIyiQqdgDJEdGe3QuKGOfV0mmN9ZYY9PxMhRy5jBn1x/kdBdKFs/7E6JL62DJ5iv1ldwqCOYxz8PoMAQ4iwFTaNnmAhC7YHSeMWplOO8LsINvPxDcxEwWa6hhYwFB5eFvQNonBpb+g8EUOrHmiDoETs5GRxbRoCQ6rsiRwcTCfTeSqpalNQJNwHv6FjOnszBdsYrk5hZyJdyO4++LlajpXAvrmrEEy8rUAmxnZHrOo3ks13vLrDStlHZ+rQolXyX9KZHaXVrNF5SHBeB/CFIyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFbYsM8ccFh9gYUTsrLA4WZdX3hG128J19znw4j64ss=;
 b=uVSBySI7F4OM71XdFZXv07EYn9aCaYLMrCxNbs8NCDC7Cb/qix7n4dEb8OHljLSR6DgSgExmf41xezH/IjJm4eO6Rp2XFjnvetq1+uSyAxLwdDAyHMX2PrkmHtP4jhs/z5yuHk/mo7o1MeR5nG1ouMTsDBoCF86v8JFMRu6z1YutfiOIydN058TLeEgAystO6CVuzYO2zug5YvR19CsH1Yg2tOdPBXAsfD7Y9neUZR5HMCkU0cCuj7kTAfcqQe5GR95UGROzSRfS4A43cCqHpjm9jHZi5+ovPc32EMuyi/COTh2NiYBvv25R8243LTDVwAo4DZO3O2r6az0xgX8gjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFbYsM8ccFh9gYUTsrLA4WZdX3hG128J19znw4j64ss=;
 b=e+RVMTkhqWdQ4cqO3Bzbhd4mxPDdZHEg9uw98nRtJYqMRDb19/FfE6YLqdmV+02459AJZUQ+7JRTR1eWWMZJaPvfwN2iVhUC5rTeaCtyxxGlW0UMHvQFuF/bT0EZLqK/cARM762obH3G/sRYZZac2evqjtMlx07TgTmvD9TK2DI=
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by LV8PR12MB9082.namprd12.prod.outlook.com (2603:10b6:408:180::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:40:21 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:303:8c:cafe::ad) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:40:21 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:40:19 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 04/37] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 26 Mar 2025 17:35:36 -0600
Message-ID: <20250326233609.2980110-5-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|LV8PR12MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c743a6-af39-420c-b305-08dd6cbf92c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIrP6ZKa/qidhbKGhzAVwuPtWYD82ojbFjVgZjvZ0Y6mLGgJUJr2zxolAvVp?=
 =?us-ascii?Q?0dMY+uNVcgrt4NSNFlVIzl6AWHEngOTh+14GpvoqYAq9MUhmSI2JOF5tttwj?=
 =?us-ascii?Q?qpk33gpHMbkK7Nv6O7W0+YvfU478DB6vkX39vyEEoDf3ajaXFTO1hCZ1mdUP?=
 =?us-ascii?Q?wnUwPxcUJjCt0gx+xrRUuhJx7TCykP2ehoyniZLADAI5cXWkHsjOAtfyvI5U?=
 =?us-ascii?Q?LaiSLf7uN8vl4fWgaWt5tHCh7HkqyUT6FnX/ojj5Q3qZBMwVeX1NEjEQaTas?=
 =?us-ascii?Q?k6zJgcVTA/5QjT6eIE36e2USRjBUVNUtAF9TgAO6AaJFH7toAxCa7Los2QZp?=
 =?us-ascii?Q?BO+ktD7jEFergt7kKSSbFzlWZEsvHCtjmD8DAHIzAJNyU/pZnXZDJyOLQB0n?=
 =?us-ascii?Q?2ObHa5I1J94K7LDr/zSNtueGIJZjRvoLwvQBDM1Ysf/K433/K5c7ARWxwhz2?=
 =?us-ascii?Q?jhBHMlYfmm6c2A8+rk1OEFQpaJjplzG4m6E+WB6Zcgk4aUhufAMr/KS7GAC6?=
 =?us-ascii?Q?YEKmBSbWWA49K0oZkM9jRfM4bgwcfJUNVkXZjx/pwqXwZoAY4BCRcoWQMJmk?=
 =?us-ascii?Q?33lVFhVVESupDeplB4PB/OvWagniecWabdlUgE9zEyJuFu3wkpHXVrYCelgg?=
 =?us-ascii?Q?6Jlm+xeI1tEa5DDQPM5rNnxjKGCVBTaoVUQ4Uvrn1i0Z1TB1mykVxoi80+8t?=
 =?us-ascii?Q?RBGaoC3axJ+MCBKE/eJaWxUn8czuL9uFlDJjdWf1ugHtHysRMClt40wjkBoe?=
 =?us-ascii?Q?FCRtY0sF4AqUxVNGJpxHXVrTLSG5sgddzQbawaM9B0WvGonEFEp1M6g5HKnH?=
 =?us-ascii?Q?1dR0PU9E07BRy0bA0/uvX6Q31MbfamT0+wnGfASvMpOIvdCtzUYs3goW2QBL?=
 =?us-ascii?Q?iTR/KVIR1Wl/xp9Tss7EFg5bpjtqvpGchddIR4oiYc+QLwKuovGenf0m/tSi?=
 =?us-ascii?Q?+dbGObKsSn2EDNf2b3EYiuFHtMBYgkFU/uPuNbW+FD/GRPtnMB79TXdlHy7k?=
 =?us-ascii?Q?t6KC5Sr2S5N3AslYVV2kMWiimUQbejMurKb0z4inEgd0JCjNtD2v4eXLbmTT?=
 =?us-ascii?Q?HlgzHuHiLA+symnBPxFJ5lSTBYF03C7VGtpa3NlSEeMu4FZsj88CTsGbRdwV?=
 =?us-ascii?Q?v9cNkxiJ9P89mkVyj0Edmst/KwVtTBc/20QLOYtGjIrOMRmntvfLuPoF+uu6?=
 =?us-ascii?Q?D0J94lXVbj3m5X9vhLR9scQdMGOmhIT3A1FFaXv3GtEv6dZT5Vy+Li2nKpMZ?=
 =?us-ascii?Q?xHleHyYa0Bg8p0LQTtDwOOJ6fj8ew78A8lFAhrpr7s/cJ1fANLFaLky19+SV?=
 =?us-ascii?Q?DND2gjFRZgitSEMmHMorcTRCr0gFrvqXWEcIFT0oInfCxDaKliOEncO/SjBm?=
 =?us-ascii?Q?tVS/tQimXouhqUSvvSefb+nGFq2dnWq25tMy1aoSJSuQ7YlACVFeV6SaoXm0?=
 =?us-ascii?Q?sP+dobE7F3X9C6ENwX5ceGBwl3JSBg1V9ctlnlweVkQqqQV4qpkhBpoHHEyg?=
 =?us-ascii?Q?2yYWiF51HtsBKNg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:40:21.2145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c743a6-af39-420c-b305-08dd6cbf92c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9082
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

v6:
 - Ignore COLOR_RANGE and COLOR_ENCODING plane properties
   when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h          |  1 +
 tests/kms_properties.c | 22 ++++++++++++++++------
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 4e4f7c2c3..6b9af3348 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -869,6 +869,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 884d78749..88ed35f07 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2981,6 +2981,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
@@ -3608,6 +3611,29 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 	igt_assert_eq(r, 0);	\
 }
 
+static bool
+igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	if (display->has_plane_color_pipeline) {
+		switch(prop) {
+		case IGT_PLANE_COLOR_ENCODING:
+		case IGT_PLANE_COLOR_RANGE:
+			return true;
+		default:
+			return false;
+		}
+	} else {
+		switch(prop) {
+		default:
+			return false;
+		}
+	}
+
+	return false;
+}
+
 /*
  * Add position and fb changes of a plane to the atomic property set
  */
@@ -3627,6 +3653,12 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	    igt_plane_get_fb_id(plane));
 
 	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
+		if (igt_atomic_ignore_plane_prop(pipe, i)) {
+			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+				kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+			plane->values[i], plane->values[i]);			continue;
+		}
+
 		if (!igt_plane_is_prop_changed(plane, i))
 			continue;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9b5a940f7..7531ae53b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -503,6 +503,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 408e23578..01ec3bedc 100644
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
@@ -111,6 +111,16 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (atomic && !strcmp(name, "DPMS"))
 			return true;
 		break;
+	case DRM_MODE_OBJECT_PLANE:
+		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE")) {
+			printf("hwhw: ignoring COLOR_RANGE\n");
+			return true;
+		}
+		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING")) {
+			printf("hwhw: ignoring COLOR_ENCODING\n");
+			return true;
+		}
+		break;
 	default:
 		break;
 	}
@@ -164,7 +174,7 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
 
 	return false;
 }
-static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
+static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
 {
 	drmModeObjectPropertiesPtr props =
 		drmModeObjectGetProperties(fd, id, type);
@@ -183,7 +193,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 
 		igt_assert(prop);
 
-		if (ignore_property(type, prop->flags, prop->name, atomic)) {
+		if (ignore_property(type, prop->flags, prop->name, atomic, has_color_pipeline)) {
 			igt_debug("Ignoring property \"%s\"\n", prop->name);
 
 			continue;
@@ -230,7 +240,7 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
 
-		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
+		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
 	cleanup_pipe(display, pipe, output, &fb);
@@ -244,7 +254,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic, false);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }
@@ -258,7 +268,7 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
 	if (pipe != PIPE_NONE)
 		cleanup_pipe(display, pipe, output, &fb);
-- 
2.43.0

