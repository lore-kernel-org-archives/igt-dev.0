Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F81C88E64
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 07:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7390310EB9F;
	Mon, 14 Sep 2026 07:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Be1k3C7V";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576A10EB9F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 07:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYP1x2pJb7pnhJUsf8S9MrKfgifNRdNATHZgAG8rflQxrgh3VNFxlLZgNELPSBhWRiyT6NE4boRgoAqL9hO5EJP0UQFS0/yg7uVCr+vmNUW0tjw/2T+WImOk5y2QAa+7smY0M9Dp4tHd409h2yuxucGWF0znPEMSK8C3Z12F2lU15LRM9+KtWE0RKWAhblLlveZwKKnCMjGH0ir7doGEz18SXOT75dPUkgKtY6aa8O0oA1g0bRfpy1ecpuMgqp1lH3kwr6eFjq8mjnGFyojAwWUMVMdOzMdemVDzxiBfQ9lAJNyOcCEbBIdMZaRAHHbiHN0SNGdN9Zbh6/WwAWz4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVhRO5eLrEFCUnUtHv+HrEpMk8MXl0UIaaTlwp51wBg=;
 b=OtfRWZZGGme5zp4FpOO+GPjw+04yVcJ352pL4IzIn4j3OK3ol+eIvhwArFjsz39ZGw6OU4Z6sX+8XoeTGM1fNfIBaaXCyEWELf4992XTx0qW61aKbKWRenLQyoWrMxaEtEcDQ6+Zdc70JkNq9mEWT3ZDDqMFtL7lPATbv6jHz6gXFZfLmhBe2Vn9uGFj5AEMM8Fi2eR3jgU2D+Vw3kNYLAmnYI5cUji7yO1W3ecyJGNCBRZmtpShyuUKTVhDG4h2fT7Gs4b8DgeKO8PEmsxb9Plewna9dhSi3JmKTuVMPFWbfMrJE71DYb3LpHdk5gGVnL3ERMu98QpZT2dxlSPDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVhRO5eLrEFCUnUtHv+HrEpMk8MXl0UIaaTlwp51wBg=;
 b=Be1k3C7VtH+tOhE3+I1czEfidg+qVnpSb2ReFz7IK9y4DIgeOq01efpKyBDnqTM/RSeCpoYEYPWJUxlWKkU+tFZ2dNV8wl1NrH701rLYvaH98+KW9DYrj1VrAz6VubMs5GMdLqaiVdGTExxn5CN8sMQDikudklgOQgXpbMvbcIk=
Received: from BN0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:e7::6)
 by DM4PR12MB5796.namprd12.prod.outlook.com (2603:10b6:8:63::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 14 Sep
 2026 07:32:14 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::8a) by BN0PR03CA0031.outlook.office365.com
 (2603:10b6:408:e7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:32:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 02:32:13 -0500
Received: from james-Birman-PHX.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 14 Sep 2026 02:32:06 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] Revert "tests/kms_plane_alpha_blend: Skip 7efc
 alpha-swap CRC check on AMD at >8bpc/DSC"
Date: Sun, 13 Sep 2026 21:13:45 +0800
Message-ID: <20260913131359.2314079-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|DM4PR12MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c5b247-7c8e-46f5-8890-08df12324bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|3023799007|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: QPWd24JLczG0E4WalNWqob0kaMkda7lyHH2DiDoEAVQsQNRi1vhkdAxI31oG+Bnb3zCq89dEHbMGbdGr0YF4r3nR5eNA3BWqzCsNOxlO7s0/i37DD4zs9wFKKvxpmTmMl17sEIjTHvavXqYH55UMcWTf1OhK+HObsHOThQgZeBTw4ut2mTFY4JjSMHoJeEliikK861o4vdbfgrpfNKbkSvpwhEpW1Go6B7NFebPanS2s5awh2U9cvKNkApX0lI6ZZj32xzM2bnBFPCywmwp1SEk7YXazhWhHO7TacB06mlLdXepPOJs987jpkCWHKHuigU0dPXpk1fwsGdtC66Qo5r8wG4cX6cfxenlx8LVP64h40t3P5nqNBu8YMsWTxiq54xdmwE5lpd89RayJdpVDEBkR5VeCCVI3RQWbgnB76wSgrhBCSN/WrsK24ZteA4d7Pe4QotGeNR9X9xtP9ofhTthA8ReY+J1hWT2VSq4tTbO8Pypztb7DiiMoVZ2CWwBtCe8gAXCF2S1GnjwiqtH5RuMhjgJqlQhNNauMGTkozn0DQV4SebQxEHUMNYk1W9DsqR2QJcYMueX/LErXJN1I4y9fgipVw+sIzyfq3UodtyCWcw3htBy6/mEkc2Ngl7EBGcZdFgQ7/YdkdDsHDbLP8XFSq4XNflU+j+ZwXFZKYV4D/LUMd9YVka2g1X3re0llgluMhroud29pcjzSlg6vfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jk8m/8dD2usU4KmGPfrzUTlYdfCza/6RvXP5OcrH+Pw7+YdoEwZbDVFLzR6FonDf+cvvhivpiqcZhrf9nWdB4TtAlD8Vr7RvQJY64uU9Z7cwBHjYTzq3Fy8BwR7zFm1alV4kAoD4B97g4kJPCRFlBp9gsN/ohl4e+OBFY6Ob0qoyCDMuQVCy/NKcwHTICycmkJ4oYzZfXachDofDHmqX+FDNiMojGRmY79n6iDgXMcxhN0tme+v8pkGNEJ99mXhhiryXBYvqZrb/yeUdSa/I1qJyI6IQvEcaV87xlirrae00EYteaJQP67uBTGq5IyXucdT5OXuuIfq3ZcUMaySye4xpijnCZlcBqJ8QBKl0GNPLOioSU3txf8efP941DQNSxLuMTL1nfNkANn0WE8poQZ0gvUk5kaEIaE51B5ZPIn+SKFdyPS4vD5ALHSCNjSlA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:32:14.1328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c5b247-7c8e-46f5-8890-08df12324bf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5796
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

[Why & how]
Causes some gfx subtests that previously passed to become SKIP.
Root cause needs further investigation.

This reverts commit 4a6a59f314f61e1e4156bb13a65efabee31a76fc.

Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/kms_plane_alpha_blend.c | 44 -----------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index e040d5bec..3a2649833 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -33,7 +33,6 @@
  */
 
 #include "igt.h"
-#include "igt_amd.h"
 
 /**
  * SUBTEST: alpha-%s
@@ -78,7 +77,6 @@ typedef struct {
 	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
-	igt_output_t *output;
 } data_t;
 
 static bool in_simulation;
@@ -444,49 +442,11 @@ static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_fb(plane, NULL);
 }
 
-/*
- * The 7e/fc subtests (alpha-7efc, coverage-7efc) assert that swapping the
- * plane global alpha with the per-pixel fb alpha (0x7e <-> 0xfc) yields a
- * bit-identical pipe CRC. That identity only holds when the whole blend
- * datapath collapses to exact 8-bit arithmetic.
- *
- * On AMD DCN the alpha/gain values are 8-bit, but the blend itself is carried
- * at higher internal precision and only quantized down to the output bpc at
- * the very end, so the swap can leave a sub-LSB residue. At 8 bpc the output
- * quantization discards it and the two CRCs match; at >8 bpc, or when the
- * stream is DSC-compressed (carried at its native >8 bpc), the residue is
- * retained and the CRCs differ. This matches observation: the same test
- * PASSes on an 8 bpc eDP link without DSC and FAILs on an eDP link brought
- * up with DSC.
- *
- * So keep the strict bit-exact check everywhere except AMD at >8 bpc or with
- * DSC active, where the swap is legitimately not bit-exact.
- */
-static void skip_if_alpha_swap_not_exact(data_t *data, igt_crtc_t *crtc)
-{
-	unsigned int bpc;
-	bool dsc;
-
-	if (!is_amdgpu_device(data->gfx_fd))
-		return;
-
-	bpc = igt_get_crtc_current_bpc(crtc);
-	dsc = data->output &&
-	      is_dp_dsc_supported(data->gfx_fd, data->output->name) &&
-	      igt_amd_read_dsc_clock_status(data->gfx_fd, data->output->name) > 0;
-
-	igt_skip_on_f(bpc > 8 || dsc,
-		      "plane-alpha/fb-alpha swap is not bit-exact on AMD DCN "
-		      "at >8bpc/DSC (bpc=%u, dsc=%d)\n", bpc, dsc);
-}
-
 static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
 
-	skip_if_alpha_swap_not_exact(data, crtc);
-
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
@@ -515,8 +475,6 @@ static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
 
-	skip_if_alpha_swap_not_exact(data, crtc);
-
 	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_start(data->pipe_crc);
@@ -581,8 +539,6 @@ static void run_test_on_crtc_planes(data_t *data, igt_crtc_t *crtc,
 	int first_plane = -1;
 	int last_plane = -1;
 
-	data->output = output;
-
 	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
-- 
2.43.0

