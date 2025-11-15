Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B251CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129210EBCE;
	Sat, 15 Nov 2025 00:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hecMH8eh";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDA110EBCE
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+0v5ags3NMIV1RHD4PJKU3V0rqYsqeNyZK4Q7uFleRYSHhEls8Zt+bly+ure/ZST0Paa19IMlq7SKddjTPKuEHdrJOEO1WYQgjH2VflIcW975IXGbcCLeCTQ/RUZcviSizaI0iaV34Z8i0pcA82uSWgJzedQNCeMaKq72icnLSKQshtLj7FI/ssLSspDZgJAORRmBsOSgy+spRGVyh23MRoxWNPrldBu8q0tnHP4yPpsHdBTOhuIP/3rrmZLUQCD87eN/IKaOkzrLWcgbgjn5yMEgJqHkqwXNKPA4MyIjXV7KHI4zykbLMZehz0jiRXbM2vmaMEdlmTx3B8luAELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSH4coo6jf8KUZxFw1QqkWuqMDG8jy/FP9WNSzSsWVA=;
 b=O68K24CDejR45j8qgE4xFPp+b3q5tbI3IdKOR5u11rR+iuF8cawXwIody3puQIfcMZJBFG+nAhclL4L4vNm2TGOuD9hgCEfmbl8tH7yrCe9m2sNKvX/Vn4g4n+9U+sV9c5L0zEsLkdXlUMICdv0GOkxxBNUig1VLy5YxxI5cmv2rvI5wT/1Yjsd7A39BomD/K7yJHw7k5AXY1vs57J/CkjLOHQBAEwia0P9Og0vZfkCov+p+L5W0Hk1pAFeMZlmDc4OkVvLCVYVAjRQOAXXDT7YfeWBxJ5kWgLqLXDZcA9Yr3O0c0fC7Vox+xwdge3unIi4L0tKr0lSjPo5U8oqQWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSH4coo6jf8KUZxFw1QqkWuqMDG8jy/FP9WNSzSsWVA=;
 b=hecMH8ehGCkpFDTQXsKRHzE360QZ+2SKAApa2ohB1tTb4EhfxBVWvUZK8NzJA8ErLHPHpJw47JxFFVc1onMyuLC56SFzDapDx5J/6KTjYD4q/zWT3NmrhPBhxpS0MAFskQfoOVc7Nq+od31tnpv9WeimLKOfDzEOFc7y/mhktoU=
Received: from BN1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:408:e2::15)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:19:07 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::1b) by BN1PR13CA0010.outlook.office365.com
 (2603:10b6:408:e2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:19:06 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:19:04 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 01/32] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Fri, 14 Nov 2025 17:18:10 -0700
Message-ID: <20251115001841.3563993-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 20203e04-7d32-407b-ab72-08de23dc9712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y6KJwXP/qkhP173sxC7i+Z0+RmYVYo10eKIj30PXzimbcIwbVN61V2nG3klC?=
 =?us-ascii?Q?qE7exPXSdRvWBxPg2RV4V5yf5ua9oPIDDciV+ebqtFDrkWhSCf84ngg2IwvJ?=
 =?us-ascii?Q?NK3dakosrbGixf95AHG635SI6c/PhKDui7pY8w20grN4H4za6MImgVnp9x8X?=
 =?us-ascii?Q?BjEbgZYTLRcPfCqDR7/mTG1wIui2KOorsBfqUKevzl6QZiQiVqDhWdL5n+pe?=
 =?us-ascii?Q?4aHIlibLf4bbY0LqRyw/wtPXr9Hwj2wTwUlw4kon6m2RwZ7P2+Yi1NBMB2fG?=
 =?us-ascii?Q?pX0GiU7vsb/16Hg+pD4Lx6slJUKtZU+FaFYyhwkNdAfLC+/vpng9XZhg/+Nl?=
 =?us-ascii?Q?3Ol5RtFi8loj+Xg7bqy6znTyHNNcOusvByRzKXUFQnRYF7uwVhb9U5gboOTM?=
 =?us-ascii?Q?+yhP4LTNixiPYFhufSAbf3wp48Lghzw2wAG7wgWuVuBITxFKHDJ3SCpyZ4Pw?=
 =?us-ascii?Q?6awPvn8h1x3vdoUs5bhI01856x80nD8tm0x+UwMWtrJF0PQHv5eQSRW9nzRG?=
 =?us-ascii?Q?hXQ+cF9HwXyB3/q0dXzAIopdxeCuSjtYqgSOrojKRQRYwRjJ0NJ125B9XX9s?=
 =?us-ascii?Q?2fYq/EmTHq0U9kRdMaPT3wmbdudA2J+ajUdI2Ct8DEzqylIW5/hO3ZVSnGcx?=
 =?us-ascii?Q?GhYW+J0UuH1qk2yvcy98AwQUwQMBZDhrFpTju0RiNARgT4MK6IE9zxR/9Z2v?=
 =?us-ascii?Q?xR5/W5RP754xbtzfHNQXh1FcNso7crxIbGBN0C1fFj9gOPelYM2/EsBSndPU?=
 =?us-ascii?Q?5Uvx4kgGdulKcYFIm7bOwIpEdYEV9QhNuu/xstezhX7NfzWQMx7UnL1xHw2L?=
 =?us-ascii?Q?pLBpTAkH4VI4r9P0THJzPscweCKg7TZ7ch1DSlrQeF0bzoUcGVDWxAABTIy2?=
 =?us-ascii?Q?PWzOg9Sri6bpXOBRoMYCD+sy6XD84mR4r7sjAvELFZ2U0ekCDi8YPlT+woD7?=
 =?us-ascii?Q?D/jT069hrQLRSMEDzGOIzD0FATVrZbZM1vBISFRpwr8EgtzIS+JlDpatgCEu?=
 =?us-ascii?Q?dnm/3RdZ5oy18AhE1pldKS1gAcmaQHLb2gPv+Z0S1W8S1bp2Ydwq70EcPb+F?=
 =?us-ascii?Q?TiKeGuo/UDkEf28bshUfa0UEtAhAdc5Fd9+6tFHsGcfTPCCfyn2yNI/lJkAA?=
 =?us-ascii?Q?jPv929zezJhejt8h21CtXPqQwJJQCFmBn6s8EAJwPKWJ50PEhIq8VV8p4m6d?=
 =?us-ascii?Q?tkmV9r8OQ4XuTeK+LSp7YHGnS834b06FAkYwQymCDKqwLK5/CFOwumsqPUXb?=
 =?us-ascii?Q?ZNVSF/QMz4lPjXi589aU7n2a2PSsiibm09qs98jY4hcM+CS6uAKTvXEkREVE?=
 =?us-ascii?Q?/KBqlSQTVoixBlFtnDZ0b8wE0F/47B5VGI2gcA09kLZNQp70f9h7+i/BHn/A?=
 =?us-ascii?Q?1TTTOfdIK2thfUsNKVJiLPyREx6Pf1giGomhO9mVrPpRSz+wUW8gFo/EDrKK?=
 =?us-ascii?Q?MUYkUY411u5fas6yghZ5sRhqeLTGJNOnFb31nu8wYjFzKgcIXOLTJ7lVgJvM?=
 =?us-ascii?Q?MCrU5R+wmQEhPYuJyfxgIJHa444Dp43AqKB0z1w+k0K0goXeYS4KoX981aDv?=
 =?us-ascii?Q?0FAITN/N5h5hvN7nWgI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:19:06.7113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20203e04-7d32-407b-ab72-08de23dc9712
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
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

VKMS doesn't like us to add buffers with unknown fourcc
type. Other drivers might behave similarly. Make sure
we avoid creating 10bpc buffers if they are not supported.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_writeback.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1b81088d7..2fdb5bc16 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -112,6 +112,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -121,7 +125,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -571,12 +574,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
+		if (data.supported_colors & XRGB2101010) {
+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					      mode.vdisplay,
+					      DRM_FORMAT_XRGB2101010,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &input_fb_10bit);
+			igt_assert(fb_id >= 0);
+		}
 
 		igt_plane_set_fb(plane, &input_fb);
 
@@ -704,7 +709,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_fixture {
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
-		igt_remove_fb(display.drm_fd, &input_fb_10bit);
+
+		if (data.supported_colors & XRGB2101010)
+			igt_remove_fb(display.drm_fd, &input_fb_10bit);
+
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);
 	}
-- 
2.43.0

