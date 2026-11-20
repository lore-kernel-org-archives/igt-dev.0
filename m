Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360EF606A320
	for <igt-dev@archiver.kernel.org>; Fri, 20 Nov 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=V+lavXs8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10B8112A42;
	Fri, 20 Nov 2026 13:14:27 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010013.outbound.protection.outlook.com
 [52.101.193.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8F610E20A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2026 07:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBmVlgxKruknW73v79LcQT5w5YVJ5gbuETMDlynFJxDsxcy2kwpDbdG8YCQ6tcm8FT9R7hKEjvPUOGeOSltH+092LyJ2rfINNL+Jmx2LhITF87My7e9yTIEPBS92s0eymDBdAdNBKMTeC+732Spm0hiwMfB0lYmZ5uzW71Cysaaghr5ylqYv5Pb5LsbNEnzISdqUInvDVRLw0gx///yOt751Nd4t/CM+iC6xNfB9SF857KU92pYCjPSAJhw+LpxqMZgdvVNvzunCZt7z8OZ8WqBASWDziIC17+VXx5z1/c1cida9q3yyVbO6kgBYC23r6rtHs/glyKsbl/B3GD/eUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGjBBAjpxIVAoRo8nGKq2JnNDqu4xEnzc1/QRAC+m8s=;
 b=WgW1CWGaGpnPlSOZhJNAoFv8mg09+54Aek29KPNucyADSzNj5oj4IBGrWwu+X1aN8pssu3MdweylJ2PzToudqxxPA6GBe9FSigwaaYLLccZq2BwVmGVRdV5pkYSOi0Fv6HexKgku3jgM0W4ZEniVzqrsnXkO/X+oExSPiZRmE/yTdGqrUb5CRppcHk5F/+SkC3qv14TmKILt4CqMvzvUY6OU8+R4OQuvUEWieeJb4e6O8tK9HtxDiASgzCXwHNgcKzAVGI0u8yy2YhWYLjYlJm86BqsySwIFynro4qOPQLUvddi6Ob67vi4j5HR9w2zAVe/5bXRd/BzgbibhE/fB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGjBBAjpxIVAoRo8nGKq2JnNDqu4xEnzc1/QRAC+m8s=;
 b=V+lavXs8Q2IaHrSiiv9o0a3C8zi/b47SOqZLkGinDMmpQycMZazB8H6E6ISV8i8FMNTUlGztUxJY+8DBRS78fR+maXcvGAIlwsf7tuQFvl5H751fYBIP/LXXZMyJ+rKuqYlisaq3vqSzDKaRLEJeOZd10nueMn22JoJ5pqYIqMU=
Received: from CH2PR17CA0025.namprd17.prod.outlook.com (2603:10b6:610:53::35)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:31:33 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::7e) by CH2PR17CA0025.outlook.office365.com
 (2603:10b6:610:53::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 20
 Nov 2026 07:31:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 07:31:33 +0000
Received: from vmpo-dom0.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 01:31:31 -0600
From: Yuling Li <Yuling.Li@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yuling Li <Yuling.Li@amd.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: add native cursor test with
 multiple overlays
Date: Fri, 20 Nov 2026 15:30:49 +0800
Message-ID: <20261120073049.91138-1-Yuling.Li@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ffd54b-fe2e-478e-95de-08df46d84d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261022115727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: AOSqfRcAt0jXR5W189LKKT9kqWjJ6AZpRYxx/UQWFVORFCpjYUBFfXcePnB3oKQ2yvMqvckkjl6J3skEhf7SeItCA1TZgcD9rlEqlxJQcmFROiqIr7ZeDCH5510iaSKDR4sdtXL7Jt/fFmfSiCvljyDQYBkveTBMKVc1J6N6CCszprnOtyjmofOQf9/OeE0n3XaU5npJvRdPaXYJkkYuUGQQPVO77ZIbUUYme3Nh3fNH8zJHXiPZUueA+JaLRibxkLW8cNA56Uid1ex4ntgSuXkZ6ejgALDVdF0wLAaFghsGzW++PYZmnolYDQbvcZ6lq/Pdiu2qEnnIXHZsirSEQbIelXH5T0X58k41CWKrCSNwHu5lI1K95Wfu3ATDCKXUhqtGxVv+t+EQbCs7z7UdISwUNPX09b39U7IC3eUE+j+yTuRRRsG1WAcFpb/N3HJSRg/0HqK9c6cKNjgZuP64KHHJPPmDjGg2p/K9AuQxrw4W1VsEnOEbhCbZKIlgsoAdkg0Fr8682UnEI9jTTuX2uk+vLxlEqF2x1krJiig5q0hSC+bpJbuSSwrUNRX+D+wuooRW5KRSRTofHSsWzoayhLCGwEO++eEBnzH68T/s+n7sVVQO2jcNpQ3/7p+NcZCefXzbaWXdELG1aUZoWyPIKDUlebK3cSdJpz4+tA3DeLwq01ACm0qKoQGpHyGOtWK6I/oya4vndQ0Mfs6Yf5nBgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022115727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GXSVT3XZwlt+eJy8tNHuX4ErhtOPKFfBAPIa8so7Yjz2bfESwtpFa8UDR7DTYtFp/hyipQsuU7oEWcnS9c8G0N7XFhPgGawggO0p0ubIDzOOy6eTW6Rmdm00ndKfWi7nF+xukEKZbB5BaEYcJZQJ8eUFsArwDAd1iVjyY/KOTsX2KiHoyGNvgE3T9ayj2fW8mxMZI+6FsUzq1drpNsVzMaynzxA/ExFXdJ1HDEi5zM/K1w83aAKDwcqKHVhv2mU/kbkLtFg4w/etnkTniCVqhlokUkHU2RARNcvmoP5AkTdzabE1WT+Az0NN4xwrQCJWvns3K0YluM8GtPj5uburjIjZMMHXQIRlJV/39I81WtBmDGTjzHf7S4LLe+b/zYS2wrmKSh+yAuj9bwmW9dR2IKrdB83SuQMRrhORkpP9ZMcCyx/o3+EGM8sOnMhBGt/h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:31:33.4370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ffd54b-fe2e-478e-95de-08df46d84d5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751
X-Mailman-Approved-At: Fri, 20 Nov 2026 13:13:32 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Exercise native cursor visibility while three overlay planes are
switched between quadrant positions.

This reproduces incorrect cursor suppression when a split overlay
is mistaken for a split partner that covers the lower pipe.
The issue exposed by this test was fixed in Linux kernel.

Signed-off-by: Yuling Li <Yuling.Li@amd.com>
---
 tests/kms_plane_cursor.c | 233 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 228 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..48e5a1c13 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -24,7 +24,7 @@
  * TEST: kms plane cursor
  * Category: Display
  * Description: Tests cursor interactions with primary and overlay planes.
- * Driver requirement: i915, xe
+ * Driver requirement: i915, xe, amdgpu
  * Mega feature: General Display Features
  */
 
@@ -37,6 +37,10 @@
  * SUBTEST: primary
  * Description: Tests atomic cursor positioning on primary plane
  *
+ * SUBTEST: multi-overlay
+ * Description: Tests native cursor positioning with three overlays arranged in
+ *              quadrants while switching their positions
+ *
  * SUBTEST: viewport
  * Description: Tests atomic cursor positioning on primary plane and overlay plane
  *              with buffer larger than viewport used for display
@@ -47,13 +51,14 @@
  *
  * Some assumptions made:
  * - Cursor planes can be placed on top of overlay planes
- * - DRM index indicates z-ordering, higher index = higher z-order
+ * - Overlay z-order follows zpos, with plane ID used to break ties
  */
 
 enum {
 	TEST_PRIMARY = 0,
 	TEST_OVERLAY = 1 << 0,
 	TEST_VIEWPORT = 1 << 1,
+	TEST_MPO = 1 << 2,
 };
 
 typedef struct {
@@ -73,6 +78,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_plane_t *overlay;
+	igt_plane_t *overlays[3];
 	igt_plane_t *cursor;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
@@ -81,6 +87,7 @@ typedef struct data {
 	igt_fb_t ref_fb;
 	igt_fb_t pfb;
 	igt_fb_t ofb;
+	igt_fb_t mpo_fbs[3];
 	igt_fb_t cfb;
 	int drm_fd;
 	rect_t rect;
@@ -88,6 +95,49 @@ typedef struct data {
 	uint64_t max_curh;
 } data_t;
 
+enum quadrant {
+	TOP_LEFT,
+	TOP_RIGHT,
+	BOTTOM_LEFT,
+	BOTTOM_RIGHT,
+	QUADRANT_COUNT,
+};
+
+static const enum quadrant mpo_slots[3][3] = {
+	{ TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT },
+	{ BOTTOM_RIGHT, BOTTOM_LEFT, TOP_RIGHT },
+	{ BOTTOM_LEFT, TOP_RIGHT, BOTTOM_RIGHT },
+};
+
+static const double mpo_colors[3][3] = {
+	{ 0.25, 0.25, 0.25 },
+	{ 0.50, 0.50, 0.50 },
+	{ 0.75, 0.75, 0.75 },
+};
+
+static int plane_zpos_cmp(const void *left, const void *right)
+{
+	igt_plane_t *plane_left = *(igt_plane_t * const *)left;
+	igt_plane_t *plane_right = *(igt_plane_t * const *)right;
+	uint64_t zpos_left = 0, zpos_right = 0;
+
+	if (igt_plane_has_prop(plane_left, IGT_PLANE_ZPOS) &&
+	    igt_plane_has_prop(plane_right, IGT_PLANE_ZPOS)) {
+		zpos_left = igt_plane_get_prop(plane_left, IGT_PLANE_ZPOS);
+		zpos_right = igt_plane_get_prop(plane_right, IGT_PLANE_ZPOS);
+	}
+
+	if (zpos_left < zpos_right)
+		return -1;
+	if (zpos_left > zpos_right)
+		return 1;
+	if (plane_left->drm_plane->plane_id < plane_right->drm_plane->plane_id)
+		return -1;
+	if (plane_left->drm_plane->plane_id > plane_right->drm_plane->plane_id)
+		return 1;
+	return 0;
+}
+
 /* Common test setup. */
 static void test_init(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		      unsigned int flags)
@@ -99,9 +149,20 @@ static void test_init(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 
 	data->primary = igt_crtc_get_plane_type(data->crtc,
 						DRM_PLANE_TYPE_PRIMARY);
-	if (flags & TEST_OVERLAY)
+	data->overlay = NULL;
+	memset(data->overlays, 0, sizeof(data->overlays));
+	if (flags & TEST_MPO) {
+		for (int i = 0; i < ARRAY_SIZE(data->overlays); i++)
+			data->overlays[i] =
+				igt_crtc_get_plane_type_index(data->crtc,
+							      DRM_PLANE_TYPE_OVERLAY,
+							      i);
+		qsort(data->overlays, ARRAY_SIZE(data->overlays),
+		      sizeof(data->overlays[0]), plane_zpos_cmp);
+	} else if (flags & TEST_OVERLAY) {
 		data->overlay = igt_crtc_get_plane_type(data->crtc,
 							DRM_PLANE_TYPE_OVERLAY);
+	}
 	data->cursor = igt_crtc_get_plane_type(data->crtc,
 					       DRM_PLANE_TYPE_CURSOR);
 
@@ -127,10 +188,40 @@ static void test_fini(data_t *data)
 	igt_plane_set_fb(data->primary, NULL);
 	if (data->overlay)
 		igt_plane_set_fb(data->overlay, NULL);
+	for (int i = 0; i < ARRAY_SIZE(data->overlays); i++)
+		if (data->overlays[i])
+			igt_plane_set_fb(data->overlays[i], NULL);
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static rect_t quadrant_rect(const data_t *data, enum quadrant quadrant)
+{
+	int split_x = (data->mode->hdisplay + 1) / 2;
+	int split_y = (data->mode->vdisplay + 1) / 2;
+	rect_t rect = {
+		.x = quadrant == TOP_RIGHT || quadrant == BOTTOM_RIGHT ?
+		     split_x : 0,
+		.y = quadrant == BOTTOM_LEFT || quadrant == BOTTOM_RIGHT ?
+		     split_y : 0,
+	};
+
+	rect.w = rect.x ? data->mode->hdisplay - split_x : split_x;
+	rect.h = rect.y ? data->mode->vdisplay - split_y : split_y;
+	return rect;
+}
+
+static pos_t quadrant_cursor_pos(const data_t *data, int size,
+				 enum quadrant quadrant)
+{
+	rect_t rect = quadrant_rect(data, quadrant);
+
+	return (pos_t) {
+		.x = rect.x + (rect.w - size) / 2,
+		.y = rect.y + (rect.h - size) / 2,
+	};
+}
+
 /*
  * Draws white and gray (if overlay FB is given) on the primary FB.
  * Draws a magenta square where the cursor should be over top both planes.
@@ -239,10 +330,117 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 	}
 }
 
+static void set_mpo_overlays(data_t *data, int phase)
+{
+	for (int i = 0; i < ARRAY_SIZE(data->overlays); i++) {
+		rect_t rect = quadrant_rect(data, mpo_slots[phase][i]);
+
+		igt_plane_set_fb(data->overlays[i], &data->mpo_fbs[i]);
+		igt_plane_set_position(data->overlays[i], rect.x, rect.y);
+		igt_plane_set_size(data->overlays[i], rect.w, rect.h);
+		igt_fb_set_position(&data->mpo_fbs[i], data->overlays[i], 0, 0);
+		igt_fb_set_size(&data->mpo_fbs[i], data->overlays[i],
+				rect.w, rect.h);
+	}
+}
+
+static void disable_mpo_planes(data_t *data)
+{
+	for (int i = 0; i < ARRAY_SIZE(data->overlays); i++)
+		igt_plane_set_fb(data->overlays[i], NULL);
+	igt_plane_set_fb(data->cursor, NULL);
+}
+
+static void draw_mpo_reference(data_t *data, int phase, pos_t cursor_pos,
+			       int cursor_size)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, &data->ref_fb);
+
+	igt_paint_color(cr, 0, 0, data->ref_fb.width, data->ref_fb.height,
+			1.0, 1.0, 1.0);
+
+	for (int i = 0; i < ARRAY_SIZE(data->overlays); i++) {
+		rect_t rect = quadrant_rect(data, mpo_slots[phase][i]);
+
+		igt_paint_color(cr, rect.x, rect.y, rect.w, rect.h,
+				mpo_colors[i][0], mpo_colors[i][1],
+				mpo_colors[i][2]);
+	}
+
+	igt_paint_color(cr, cursor_pos.x, cursor_pos.y,
+			cursor_size, cursor_size, 1.0, 0.0, 1.0);
+	igt_put_cairo_ctx(cr);
+}
+
+static void test_cursor_mpo(data_t *data, int size)
+{
+	igt_crc_t references[3][QUADRANT_COUNT];
+	igt_crc_t test_crc;
+	const enum quadrant positions[] = {
+		BOTTOM_RIGHT,
+		TOP_LEFT,
+		TOP_RIGHT,
+		BOTTOM_LEFT,
+	};
+
+	igt_pipe_crc_start(data->pipe_crc);
+
+	/*
+	 * Capture every software-composited reference before enabling the
+	 * overlays. This leaves the hardware pass free to switch overlay
+	 * topology while the native cursor remains enabled.
+	 */
+	for (int phase = 0; phase < ARRAY_SIZE(mpo_slots); phase++) {
+		for (int i = 0; i < ARRAY_SIZE(positions); i++) {
+			pos_t cursor_pos =
+				quadrant_cursor_pos(data, size, positions[i]);
+
+			draw_mpo_reference(data, phase, cursor_pos, size);
+			igt_plane_set_fb(data->primary, &data->ref_fb);
+			disable_mpo_planes(data);
+			igt_display_commit_atomic(&data->display, 0, NULL);
+			igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
+						 &references[phase][i]);
+		}
+	}
+
+	igt_plane_set_fb(data->primary, &data->pfb);
+
+	for (int phase = 0; phase < ARRAY_SIZE(mpo_slots); phase++) {
+		set_mpo_overlays(data, phase);
+
+		for (int i = 0; i < ARRAY_SIZE(positions); i++) {
+			pos_t cursor_pos =
+				quadrant_cursor_pos(data, size, positions[i]);
+
+			/*
+			 * The first commit for each phase switches overlay
+			 * positions with the cursor on the bottom-right pipe.
+			 * Subsequent commits only move the cursor.
+			 */
+			igt_plane_set_fb(data->cursor, &data->cfb);
+			igt_plane_set_position(data->cursor,
+					       cursor_pos.x, cursor_pos.y);
+			igt_display_commit_atomic(&data->display, 0, NULL);
+
+			if (is_amdgpu_device(data->drm_fd))
+				igt_wait_for_vblank_count(data->crtc, 1);
+
+			igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc,
+						 &test_crc);
+			igt_assert_crc_equal(&references[phase][i], &test_crc);
+		}
+	}
+
+	igt_pipe_crc_stop(data->pipe_crc);
+}
+
 static void test_cleanup(data_t *data)
 {
 	igt_remove_fb(data->drm_fd, &data->cfb);
 	igt_remove_fb(data->drm_fd, &data->ofb);
+	for (int i = 0; i < ARRAY_SIZE(data->mpo_fbs); i++)
+		igt_remove_fb(data->drm_fd, &data->mpo_fbs[i]);
 	igt_remove_fb(data->drm_fd, &data->pfb);
 	igt_remove_fb(data->drm_fd, &data->ref_fb);
 }
@@ -257,6 +455,9 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	sw = data->mode->hdisplay;
 	sh = data->mode->vdisplay;
 
+	igt_skip_on((flags & TEST_MPO) &&
+		    (size > sw / 2 || size > sh / 2));
+
 	test_cleanup(data);
 
 	igt_create_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
@@ -265,7 +466,19 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
 
-	if (flags & TEST_OVERLAY) {
+	if (flags & TEST_MPO) {
+		int width = (sw + 1) / 2;
+		int height = (sh + 1) / 2;
+
+		for (int i = 0; i < ARRAY_SIZE(data->mpo_fbs); i++)
+			igt_create_color_fb(data->drm_fd, width, height,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    mpo_colors[i][0],
+					    mpo_colors[i][1],
+					    mpo_colors[i][2],
+					    &data->mpo_fbs[i]);
+	} else if (flags & TEST_OVERLAY) {
 		int width = (flags & TEST_VIEWPORT) ? data->rect.w + pad : data->rect.w;
 		int height = (flags & TEST_VIEWPORT) ? data->rect.h + pad : data->rect.h;
 
@@ -281,7 +494,10 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 			    data->crtc);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	test_cursor_spots(data, size, flags);
+	if (flags & TEST_MPO)
+		test_cursor_mpo(data, size);
+	else
+		test_cursor_spots(data, size, flags);
 }
 
 int igt_main()
@@ -304,6 +520,9 @@ int igt_main()
 		{ "viewport", TEST_PRIMARY | TEST_OVERLAY | TEST_VIEWPORT,
 		  "Tests atomic cursor positioning on primary plane and overlay plane "
 		  "with buffer larger than viewport used for display" },
+		{ "multi-overlay", TEST_PRIMARY | TEST_MPO,
+		  "Tests native cursor positioning while switching three overlay "
+		  "planes between quadrant positions" },
 	};
 
 	igt_fixture() {
@@ -334,6 +553,10 @@ int igt_main()
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
+				if ((tests[i].flags & TEST_MPO) &&
+				    igt_crtc_count_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY) < 3)
+					continue;
+
 				igt_display_reset(display);
 
 				igt_output_set_crtc(output,
-- 
2.34.1

