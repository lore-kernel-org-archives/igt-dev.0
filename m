Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825DAC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0EC10E47C;
	Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VdCviGKS";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6D10E429
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyzOBtXBuMuR4SatryiZEG4y5K/by6GErd395LuEdl1Sp2CRwAqTGk9zv3h+zk93zsA42Ya2+xC5SWU0IIJjAGwzq+Dv4UHA2bgFNmy8VaCALVwApfoDCVOLpmIwr3XL3dPaS8dn0Kk2oPVBrmsi8NxknXtGfJLo7X/OVDtxoOXwo9532y/tWk2dQxg8vPyg7mamb9xyNB+G+DB/ZEifZS2OMyhnH44rx0d0QX/e8Sok8LTLABFZzUtPV1K+yKFRMf5IC1nOK+9/kpUf14FSpcd160wP2nZj3BwYB8QAMMWK4iVY8maf5CUBGhENAsI8hbdx14j6Sz3V/oGgrWV2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnFXx5GsTWuEeihlqxfoISf4f/noSB/Xc29usqa7Diw=;
 b=q7M0Xsj+4ydF2DqfHp/yA3rcKDGN0Cg/6I966nkgyT6uLRAhZ8IvPG24lTZTp6OVbxuoJ2gwBRb83naWAv5wUGjMyViVFyxEfSvnm59mJpdaiuoS6ON74Nkxja9OBMB+oOyFfyENNAxZS/WoT3SmN8VhHlTqg4xq7sEDM5jBL6BJTy/7GvSsbjmmr3hYSggPmWKMHt5ez/ACvnEJKM9BfOA1OwwTRb0dFJk1AYmal9mV6llk1kAwhIQHDTc/gvguo3H6ATtDtQKlphiPOB8NcbUPk/mKcGHYFIhlwsMtL1gAAjjAbEkle/7gCVxUaUsfunzrXGqi9CPmbafWUTk68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnFXx5GsTWuEeihlqxfoISf4f/noSB/Xc29usqa7Diw=;
 b=VdCviGKSbK7evRVWfHw4wrGBay9RXOdM1zIWG76UcOyrTLxSVIq1uwZkzDodOudrUoT7xUHbvV28U1VBn8fAl4ffv8VUP4rSIJohrzoppZpR3Li22nElgzzS0jklYy0U5eojcFjatc5DsNdrF3FHNmU6mNvY/mV+8mMkRsx4+oI=
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 20:58:37 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::c6) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:36 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 21/37] kms/colorop: Do proper setup and cleanup
Date: Mon, 19 Aug 2024 16:58:07 -0400
Message-ID: <20240819205823.316656-22-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e98ae6a-b9ac-473a-f7b8-08dcc091b22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DmRqCoHsZwneDpv4LU1rWcjM/0t4VFgI8fILZb3Q/Sj0QxyhEB5eHqGA5Y4n?=
 =?us-ascii?Q?U80X5rzZbeybTKxDDJAZHFwAlbZMwOQOxMfJGYAeL8DefJZ0mcdXG8xvMiIK?=
 =?us-ascii?Q?kAAZk9VGDNPfd3nbnfoLzoUwxI55hf5Wduoxc7sxwZ04GyxLzW/ww3rNnDDo?=
 =?us-ascii?Q?ZKMp37TqknnVlvPd9Y9zY6MJQgijvV7uVjdqRpMHKGKnZHSyWpjjIhzclljZ?=
 =?us-ascii?Q?t7Fv+4Md1zW/6Ggr/pR69X3aS/NYUzCCSFzQQew5EgmMPeOzVf7ayA2QCBN4?=
 =?us-ascii?Q?l2CBuhBozPzp81RCz6S6opfNUYrKxzGHQnqidAMq9MgaIbB1Mgt9mYt2N65N?=
 =?us-ascii?Q?l8SZdu1CcnNHzTIwbTaCGc9IBWyXBsKxtzKjdhyyKiajTlXssVAgnuE4c/0u?=
 =?us-ascii?Q?Q75VEogAHJqD6HCRRRT8BIgBx2uB94BV0dJGOi9B/9wF2BOaCv9YBjl1vznn?=
 =?us-ascii?Q?Ls4MQ7nAWyDX8KTjOVFJQtotmARI76ThdTMPonxbSlODXd4DhOjy0FO4ZM0Q?=
 =?us-ascii?Q?67SRaZ1tgpmWJi314t8EdgfzwtdnAeqvinnPoIEmIFa+GCtuDhFi/xZwbuK2?=
 =?us-ascii?Q?uh9Vy+cq9VhBG5+dAXWsupTAA1H+79q6YStNZzlbNmYLB8LfW31767eX3D8R?=
 =?us-ascii?Q?RirDn4ya6AU1e6Po6sAtA/1F7+3R04lkpofqz1ZWj6yQ9Kq3Y1xYeXc+bBVV?=
 =?us-ascii?Q?9bbf6tWHlObqpmcGRZEQQfuW+lc0d1f6/hlKo4UPvrg+3R1/QxhrJKBQh1kP?=
 =?us-ascii?Q?KEoSsgrLk7RZvu1tdsQUotX/gzansx324PwZhSO64w0ctyPNg5N+953pA3WE?=
 =?us-ascii?Q?w5xmNsDdng01/BAzsr+5IsjOfVezFRp5wc14dLtIMBEBmu13Ne3a5ERiZDI1?=
 =?us-ascii?Q?oUr/rP8z3Yy/JcQM4r6UIW9EQ/Q2NKSTZLEZhWtdacgjS4kqU5qh6c0H10Aw?=
 =?us-ascii?Q?AuxPCsHc/UtQNjJCBaCM1CsvXArcFR6/8mUUDyo7JIeZlND1P7pmyTI4HdJZ?=
 =?us-ascii?Q?NXIg2wm6bWmpBaeug0Z8WJBMY1wfBYFuOCHCEdF5s2sE+DSbupuZCY/Mu9hh?=
 =?us-ascii?Q?cTOaZ//YGVmqBeWqLHW8kPTYKpQWSAoXUTBUQLlL2Ex3Kd1VSpRCY8kPO1yx?=
 =?us-ascii?Q?d45L4/ml1NHzJn30kTZheWI3kiK0O5tUF5THzChRlTNC4oakt/ktXIJkx1zp?=
 =?us-ascii?Q?EnWbFpSVBsMi4z41II7N2gSGyhJZssnj9A6dM2e8PX7nS0DgHVXMqchj2kEs?=
 =?us-ascii?Q?w58wTEUGuSgq/hzMVwt0L0dwZW1rZm4dqC7meoEBJT+xxrqbTk2sS8irN8B5?=
 =?us-ascii?Q?62tXXigZbugDG94z+yW/YLSnkLKCGi2Yq0jICQ0Y/dYX5jnxBkcXhGIwFyY9?=
 =?us-ascii?Q?lTfMpWw30O3gaJpGRVpwfVuoUICLFeH4Xxb0jL5I5kUCJB1+HJuC5IxD3BZ8?=
 =?us-ascii?Q?o+LxfLR7nLRUBGCFsfKH31xGgXzuN759?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:37.1043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e98ae6a-b9ac-473a-f7b8-08dcc091b22e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775
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

We need to ensure framebuffers get removed and crcts detached
when tests fail, otherwise consecutive test runs might fail.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 139 +++++++++++++++++++++++++-------------------
 1 file changed, 78 insertions(+), 61 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4c1751c3be1c..3fa799e7c084 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -390,52 +390,20 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
 }
 
 static void colorop_plane_test(igt_display_t *display,
+			       igt_output_t *output,
+			       igt_plane_t *plane,
+			       igt_fb_t *input_fb,
+			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
 			       kms_colorop_t *colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
-	igt_output_t *output;
-	igt_plane_t *plane;
-	igt_fb_t input_fb;
 	igt_fb_t sw_transform_fb;
-	igt_fb_t output_fb;
-	drmModeModeInfo mode;
-	unsigned int fb_id;
 	igt_crc_t input_crc, output_crc;
+	int res;
 
-	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
-	igt_require(output);
-
-	if (output->use_override_mode)
-		memcpy(&mode, &output->override_mode, sizeof(mode));
-	else
-		memcpy(&mode, &output->config.default_mode, sizeof(mode));
-
-	/* create input fb */
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_assert(plane);
-
-	fb_id = igt_create_color_pattern_fb(display->drm_fd,
-					mode.hdisplay, mode.vdisplay,
-					fourcc_in, DRM_FORMAT_MOD_LINEAR,
-					0.2, 0.2, 0.2, &input_fb);
-	igt_assert(fb_id >= 0);
-	igt_plane_set_fb(plane, &input_fb);
-#if DUMP_FBS
-	igt_dump_fb(display, &input_fb, ".", "input");
-#endif
-
-	/* create output fb */
-	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-				fourcc_in,
-				igt_fb_mod_to_tiling(0),
-				&output_fb);
-	igt_require(fb_id > 0);
-
-	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
-
-	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
 
 	/* reset color pipeline*/
 
@@ -443,8 +411,8 @@ static void colorop_plane_test(igt_display_t *display,
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
@@ -452,14 +420,15 @@ static void colorop_plane_test(igt_display_t *display,
 	get_and_wait_out_fence(output);
 
 	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
+	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
 
 	igt_assert_crc_equal(&input_crc, &output_crc);
 
 	/* create sw transformed buffer */
+	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
+	igt_assert_lte(0, res);
 
-	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
-	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
+	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
 	apply_transforms(colorops, &sw_transform_fb);
 #if DUMP_FBS
@@ -480,7 +449,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline(display, plane, colorops, color_pipeline);
 	}
 
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	/* commit COLOR_PIPELINE */
 	igt_display_commit_atomic(display,
@@ -488,28 +457,24 @@ static void colorop_plane_test(igt_display_t *display,
 				NULL);
 	get_and_wait_out_fence(output);
 #if DUMP_FBS
-	igt_dump_fb(display, &output_fb, ".", "output");
+	igt_dump_fb(display, output_fb, ".", "output");
 #endif
 
 	/* compare sw transformed and KMS transformed FBs */
-	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
+	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
 	set_color_pipeline_bypass(plane);
 
 	/* Commit */
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	igt_plane_set_fb(plane, input_fb);
+	igt_output_set_writeback_fb(output, output_fb);
 
 	igt_display_commit_atomic(output->display,
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
 				NULL);
 	get_and_wait_out_fence(output);
 
-	/* cleanup */
-	detach_crtc(display, output);
-	igt_remove_fb(display->drm_fd, &input_fb);
-	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
 igt_main
@@ -561,17 +526,69 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 
 		igt_require(display.is_atomic);
-
 	}
 
 	for (j = 0; j < sizeof(formats) / sizeof (formats[0]); j++) {
-		for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
-			igt_describe("Bla bla bla");
-			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
-				colorop_plane_test(&display,
-						   formats[j].fourcc_in,
-						   formats[j].fourcc_out,
-						   tests[i].colorops);
+		igt_output_t *output;
+		igt_plane_t *plane;
+		igt_fb_t input_fb, output_fb;
+		unsigned int fb_id;
+		drmModeModeInfo mode;
+
+		igt_subtest_group {
+			igt_fixture {
+				output = kms_writeback_get_output(&display,
+								  formats[j].fourcc_in,
+								  formats[j].fourcc_out);
+				igt_require(output);
+
+				if (output->use_override_mode)
+					memcpy(&mode, &output->override_mode, sizeof(mode));
+				else
+					memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+				/* create input fb */
+				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+				igt_assert(plane);
+				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+				fb_id = igt_create_color_pattern_fb(display.drm_fd,
+								mode.hdisplay, mode.vdisplay,
+								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
+								0.2, 0.2, 0.2, &input_fb);
+				igt_assert(fb_id >= 0);
+				igt_plane_set_fb(plane, &input_fb);
+#if DUMP_FBS
+				igt_dump_fb(&display, &input_fb, ".", "input");
+#endif
+
+				/* create output fb */
+				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+							formats[j].fourcc_in,
+							igt_fb_mod_to_tiling(0),
+							&output_fb);
+				igt_require(fb_id > 0);
+			}
+
+			for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+				igt_describe("Bla bla bla");
+				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
+					colorop_plane_test(&display,
+							output,
+							plane,
+							&input_fb,
+							&output_fb,
+							formats[j].fourcc_in,
+							formats[j].fourcc_out,
+							tests[i].colorops);
+			}
+
+			igt_fixture {
+				detach_crtc(&display, output);
+				igt_remove_fb(display.drm_fd, &input_fb);
+				igt_remove_fb(display.drm_fd, &output_fb);
+
+			}
 		}
 	}
 	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
@@ -584,8 +601,8 @@ igt_main
 	}
 #endif
 	igt_fixture {
-
 		igt_display_fini(&display);
+		drm_close_driver(display.drm_fd);
 	}
 }
 
-- 
2.46.0

