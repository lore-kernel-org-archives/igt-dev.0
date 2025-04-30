Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB544C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629D610E6AC;
	Wed, 30 Apr 2025 01:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yq/Qdybm";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FFC10E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:35:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzxRLgb2eJTMypqUZLNA/T/XyoqdvNGqgwOapIsHB7JVoobadEUgfqxI5ZujtbuNkaqadzftbHPPMYoiIdHZM0w1Rl4H/Dh6r/gwp+YvRWOQBHgYzebS0fKmk1eYxx1ajyiRJ8TsIw0ChZI+xGdRgy9Qo43844v0UDLY7/92Blsxb97PHlHD50EXYAuIwXJvWSsqhgr0AUhkgj8uql/Cb15QqZd6hF8M/0srMl6TCw8hfZoYODKsHjnhBwDDC6rOTXZwqe7SLkn/dI0xr0AzBvJNuLOCx/51DHAYKOBi+ihazhaadEvyJAkopiIX83qObuNBOg+uD28e/e1uYIm93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96xfPjtXeyq0hZIxH9SLhznjSm3JsYhYUAeJTDpMaNA=;
 b=tr3i8EwYOPTOeZVuBe5BpHBrt4N0wHalbE0b47MVbKx2N4XijRcX432mTa0DQ5nY4VrAwGTqo36RGsV5eiSMM9wXARLNdXEfP+wQgi9Mab+HlpzBZ1QVvRRrKS/gUFctb9kWEK7wDkza2sWQWW+AgmdxzMxFwhswN8X6SCqS6HA4j5OLjNP+fwBjGNHSoQ0D8swNNhSQ69ff1L6o/QCt8VnSl4Leyrkg+bu8ORVR44nC0bDNGq9/8SFiQhPmz72HaqDUjkXX8QnBlWMCnkw8rfGVA4E0Vvqxro3YX/236yGilpZ51SjIa9OY7oxxVFyXCJdxOzPFz6xe5z9l5fJTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96xfPjtXeyq0hZIxH9SLhznjSm3JsYhYUAeJTDpMaNA=;
 b=yq/Qdybmyvc/zD0c6SzzEBsf4r20CmclnwOj68sP9M5+Iic9bTYyOZSQQUSlLel3bAOe38ONP1y3JJgOOzH/f7bgjzWg+maAoEqccNIb+nJtOmY4W3GW4jtS8sgyfsXXCjUwx2MiMzaQ5Wu/81Uuj6mTXRB6IXEvLYZu5gjP9yw=
Received: from BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46)
 by SJ2PR12MB7895.namprd12.prod.outlook.com (2603:10b6:a03:4c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 01:35:46 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::74) by BY5PR16CA0033.outlook.office365.com
 (2603:10b6:a03:1a0::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:35:46 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:35:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 02/36] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Tue, 29 Apr 2025 19:34:20 -0600
Message-ID: <20250430013454.226910-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SJ2PR12MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: d6098bdb-38e7-4c5b-43a5-08dd878754c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mu2yO751Dad2kpZQgk6au6DqxG3q7FzoERWvd/Pd9U2Vk7RcEzfuk+TLGPqh?=
 =?us-ascii?Q?XzF62XLznXaLMwb5CxH7UzaBgORlWZk2ORRfwLewtaNTv8HVY2PHfq4AQp8n?=
 =?us-ascii?Q?H9SssqnzMTerjQIotSPPiCvsWxEOA3AArwLSeBSUGS8cI1MyEwzVaOyB4ciV?=
 =?us-ascii?Q?BblB1JRkNTpomS1PNMxg0+a3yg+rUFbGJHo+crm9kJQbO+BBiZ3l0JJxS/Nb?=
 =?us-ascii?Q?9QrZwd/qardr4r4IZV/YbAbnDgjLIb/2MooLzxsBpn4vSlhT9f1BQjA0Xjoa?=
 =?us-ascii?Q?ddq3JZ2sQCoBbIW2NCIA2A+45epSn/cP4ZgjwwI+gs/Kxi9cLR8NByX4gMaJ?=
 =?us-ascii?Q?/yg4g913Dw4ioJT/oMs19l6ctCyJkwD0a3REoT+b34Ou+lxm/c92XDAyQZr8?=
 =?us-ascii?Q?7NuptXvlG+kcWxM07DiRVHlLr2VQeVLm2OdR0cE2D3J6oPs8gwMHcxIarry/?=
 =?us-ascii?Q?J0h1IaNFl0OLKP6L9edwmfOZyHh48uMHpsQmuJ0v7rwz2MkYDK3UbQj5qtHA?=
 =?us-ascii?Q?wx04TmGFiwDcRtLSwGas500Osber6yBcURI/U/WcCO48VN+pdP8YWcYDfxEm?=
 =?us-ascii?Q?+OMknIZFR8vEI4ccmRAu0VqUO42yct3RM8lDyD/wzPxQRBUAIkdKuXgiKzuC?=
 =?us-ascii?Q?bJS7s7lFJJ2cMxTSSKFRTPczJxORIRN8aaCAjwBk5+y2eZWv8+tbB7XxtHc6?=
 =?us-ascii?Q?xahvjSsZliVaBegL85afOypbrC8OwqRpG42I6JMO7HBmDwwjDWJccK4voOIk?=
 =?us-ascii?Q?tNFGbaQotzFrTS5io9caBwQNsDDZIQVbkQz+9a1siqdz2UpO18WjWQZQ0c98?=
 =?us-ascii?Q?aX9e9+EVPZVsVPBjgI/mSofimcimUoH8MgJYda6kp5xWyDX1PEZfRY4QCrKa?=
 =?us-ascii?Q?URiKBc8AOnu2g4c5G6KqoOE+GndoVFXCC2ASAeqimvefYVvKUp05IrIr0j7Y?=
 =?us-ascii?Q?HECquyAuk0NgfHPEuN+q43iaNHnYwSxhJo7UsQjtRV/JkZqm/Ya6m9hzTxDf?=
 =?us-ascii?Q?OaMuvGQXaB5u7Q4uX9h7fNt87u4Om27TiIOu+AL809u5zaNS24O/m0Qqogc2?=
 =?us-ascii?Q?ZXyaVDib/0bKTezmfzQ00/OcQ+d5WYlcF8jTA51id7g9IIbs3XvgthocheI4?=
 =?us-ascii?Q?FuoABavT9D77Ga7bocqYS+4Q0fA+Pc/gD8YBaqZyouMoJinKMRJ0pjXEA0Xh?=
 =?us-ascii?Q?9+jvHWSPqRzmKzs8Q5EUP444fZughFxLozZy+KH6uHGxd2MumDxz2OkJszht?=
 =?us-ascii?Q?iZMwJEtVPDeG5fLBl68m7L4oip5Lz3JQPqPSkJGOnL1vdrNYa68sxsDitjtR?=
 =?us-ascii?Q?XtLURI8sI9f/etR/m6QMJhK9NBkQTejjRsNdMzqvEmZhTEHiR6Jrkyylu1UI?=
 =?us-ascii?Q?4AiGpgQ4vbaAKIra8Zfgvrqo5+EYqy/JO6wPuVyPLoZGJF9n+J04nzqk43re?=
 =?us-ascii?Q?FmUFqOJDMqagUaPAMFhNsTLST5clc6f5uE7R80GgtdWhNHi0sNJ+thH5dLBT?=
 =?us-ascii?Q?0Dqqp0L5Q++Y8jnxlaH+IYhk5cIAgyqM0QUY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:35:46.7748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6098bdb-38e7-4c5b-43a5-08dd878754c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7895
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 05680837e..8765fda34 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -131,6 +131,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -140,7 +144,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -590,12 +593,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
+		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					      mode.vdisplay,
+					      DRM_FORMAT_XRGB2101010,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &input_fb_10bit);
+			igt_assert(fb_id >= 0);
+		}
 
 		igt_plane_set_fb(plane, &input_fb);
 
-- 
2.43.0

