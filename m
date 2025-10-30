Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED768CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6AD10E244;
	Thu, 30 Oct 2025 04:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fs7lbdWQ";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012016.outbound.protection.outlook.com
 [40.93.195.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFAD10E23E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:28:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lo77egFBxWNy2r+I7SdT7Lnafgz7Gec4yP5tiPCE2MomPuJuHDBR7YrBOZb3PTLQqGvrKnVgzOPlk8q1YE1t90LNI0E5ARuY+8xfaXkQTpgq8PVditLQ5kIa9RnZumdCNZfbNUFJOafuQiOfTndHpo3oFNQk3SriAVV3DH/9tAU1g7BcfhnYRm/s05VrD/n/dtOboeIo4XV2uyVon//dSDIVhL2imAn1BZE9TO/sL0q5ZVLGwnodOz3o2XFuPxwM8kPle4RxDMHCIRet1DFqIkkwhSgK4MopRk+azINYl6Xnzzz4jZlA6OXrdoU4lKh7aoA0baRgxDCTuYF9DxgVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGBDDdLWtQ2PDlcLsATNs7XzyiBmrwMjC6xdh1DHQR8=;
 b=thQt3uCyna24NhduA5F0faPlj/iwM23LSW7HyUrudRqEJkyPpIN+QRmOCLG7lUGhUSOgDh8+HL8Z3LAEyIIFWc81s51AFs6FHK1LdA+zW12MzOvvrpTY11eftkJOBW5oH+Gi+pHq5fJ4Nle38wvNgWcddcH8L2HOFtnZwnYDBWdUWX94nY+5qt/2OCPpmwZ4ei8Loz9l2UnFEnqlGRVlj2zidJOy8rd3ceVX9P1hP46RHxZIO+L/LqORRxUKo+5s+2KSUo7C7tJS7hIcJJIlZHb7iPLzqILZaFnlHcyTKf7PL5tspr7+DDVPaxBXumqPlbJ1i5cNP+E8nx1FzfGROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGBDDdLWtQ2PDlcLsATNs7XzyiBmrwMjC6xdh1DHQR8=;
 b=fs7lbdWQf6CjXGQwiiGebjleIZREvSoufu/wrrg7VtHuD/AKXrvH55+1DeJQbNDn+4kFTlpEonoMM3JavPm5empBthXdnaLFaLGP1TVg77QE/da0ecSk/S3z9YmipZx/UU2X0VD8OvyUx3vLeXtoaJBvBWCtbe19mrKz9UHAG6c=
Received: from BN9PR03CA0359.namprd03.prod.outlook.com (2603:10b6:408:f6::34)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 04:28:30 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::bb) by BN9PR03CA0359.outlook.office365.com
 (2603:10b6:408:f6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 04:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:28:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:28:29 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 01/32] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Wed, 29 Oct 2025 22:27:30 -0600
Message-ID: <20251030042801.2315866-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f329db2-a067-4cac-81f7-08de176cc786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sc6hX1A0FMVDGqITswjkypc45aj+0pjGOCQ0tfbAZEKFMM3Q4ZqRaev+iiMx?=
 =?us-ascii?Q?kQ3jCF2W0OqVLHafog6W5esfYNi7NbUmLGR/ec6Gdx6RWDQzo0M8oBxVP+vS?=
 =?us-ascii?Q?20AscmhT4wcOiXHBdZFYCBNYQFU/x4uzSSISMPiVJNUtWgXqfgWHmErgbWrl?=
 =?us-ascii?Q?dHLeuadPGcIAYJgHh84SEV7p34/UlVVHuCf2dGsaMScUeqDa/c3eDK7Dr79f?=
 =?us-ascii?Q?9rxFG3xnP7LAjxR84A1mqqurTnoXHEwfx19678Jf9ic7sQYeDFtjrqpPhQ53?=
 =?us-ascii?Q?YlDYIb4+s+3h7a/yZEybhLqIEb4uOBJ3kKGctHA7r8QTBaHprlJa0Tpv+sO1?=
 =?us-ascii?Q?UGuuaBGcmvx4/alwzNVhpkUU5jea7R7lAPttYpPkwj94ezEIjbSCXxWD61uh?=
 =?us-ascii?Q?8YhYgnyXAq6IDR7IGZnn7FWUNSgWIFpxkqB4vNY17e+EqdN9E4ZoefKcz/h9?=
 =?us-ascii?Q?tCNXlnm20jFkwU7zMIZqTknyvC75urKxyaOHXu8itg2y/uJjQ0/9ZjZMdZRM?=
 =?us-ascii?Q?o7BTxy2VA4qeIRAIWCbHTVgBAdy7Ahvun1pBuELWp+8reuleUC0grc95x7TQ?=
 =?us-ascii?Q?YjjngM+0tqXPKWg2X070AZbvKI3aJflhMUIRG7Pg9TmP4ApESe2NVD7mnzNH?=
 =?us-ascii?Q?9AV1jiF05Y2UBEOzq/6wJWV7DA70XREMpTbArDoYhkMmnXAWB44gJkliBCWt?=
 =?us-ascii?Q?t4EmbwWcyfNNmlLBs+GsGJEj6k4lrRodLadjtYVSDScgaQVle8xl+/tdQQuS?=
 =?us-ascii?Q?TNi0Ktz2ED6pT/lOYQz3XJSeBU5S7X2KfGDcCq8KYZ4PBV8z2i4x9n/bw78Q?=
 =?us-ascii?Q?r40x722jDnHOb4qS+gXf8tiVHXVLsR9K7tDRrok3KCiYbHTMtSRLr2mbA16H?=
 =?us-ascii?Q?hfMuaQYdpT6SHWwj7EfOsgSvRGsC2YLHu193cEgmqJ4leXQOPjonexed7sTi?=
 =?us-ascii?Q?LFaFN24VRLQYOL8CqZ3q741gqrsTAMf3jHXN+8c9HrYrwrn03zUsXipTWklC?=
 =?us-ascii?Q?v/J6C0xrQOkMaPvmROA7i+aEazuDNTyxntmLXducoepevNYRDeTwnRvYr1zf?=
 =?us-ascii?Q?DRhFbaOc2xh87ICyMnSt1fWUM4Ls9ag8lpVUDf00P4N+XDon8xB74KqQyLvH?=
 =?us-ascii?Q?Cwhb2dEbicGxupk6l9JPX+WMU+YOZvjfGPkawRmBrri1JGqvslv7MB1H5mpr?=
 =?us-ascii?Q?u0DH+Wlhnhp0lqijipwwkByeRWBcqRARJ+TMxrQt5m/k73HdmdezekiLWM3S?=
 =?us-ascii?Q?1UnAAi0bgw/v9IqIlbrk+sh0ap396W7+JkHVL8QoZd/5jVQb14Ln39K6dxw6?=
 =?us-ascii?Q?dkdEcCSjvS1AqrEimWH1Ganfe5pEvNYk/AEF1yV1S19yjzZUuWlMfpysXLhW?=
 =?us-ascii?Q?ODYVG0D8cg6mmYMzm849QT6lia50Abl8RPt17UMll4yKjZum/mRpkhR8RUu1?=
 =?us-ascii?Q?wsmrgD7UNQ5PvFUQJCvjm3cYm62wGYund8lUvGH4XjBRCPbImXrBQozQ8F6A?=
 =?us-ascii?Q?1VnW3f7nEluY1LmbT6PZOQ9EVqmSashki2AjI18LssuRWA+ubzp3VFDbYzkY?=
 =?us-ascii?Q?EEz7JolCqmCUhaeqQCY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:28:30.4148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f329db2-a067-4cac-81f7-08de176cc786
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882
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

