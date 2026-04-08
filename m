Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C87210FC454
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 23:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34FF10E134;
	Wed,  8 Apr 2026 23:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MdUKull6";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490D10E134
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 23:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdqRd1n7h7XyPJ2126wmbviijqUiNNksm6fq9g5VpQi054XCspEiBxPVaQNdjehHcQfe2Gw+aQdUAF8w9ekMWwXvO3oacq2YuUr/HPTnnJ9WILByIaYDjExH0BL5xNefOQgXc/Sgx3P5ytlg78r5ZgeS10r6n9yoa15UeBFD2HH+bHh7atdavanVXvyTDltiOnoliUbWTWKEdd+xOy4CQXOrQSbTruVM3jNIa51WshxRHcmnhdFyZRWKwPqm1lJgVWDDtcj00K4tXYtOLq+aIJDOpdvDPfhtGHueIJ4nVmvHSpTcMHbw1birvaj5v8MkG5Npuq89E0fivyUolP9AuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjnIWqoCXZCNvRGdnFMZsvOyYfiLRyU/RyNpoc3EehQ=;
 b=oLLFSc3hdsva+nc7UdjNkNqr7Zn69iSDdoh2SId3Gkiwn2mKzi1yGvYP3A3uKUNTE/VFp19PLLjIv2yGBsUaoVPc6slsCqCEtVeTFW9YrNCvmYHCD2wYyXxK+omqM4F2dnVLlAA9rIBQ0uZyX18eaVzoSxLfTYIDGbUOZrlNdQrbotsz4iVdqccUO9bI5DAflO6g1KQO6G1WmbEGylR6oL/9lNC1Fba6Tvyw7oG+wqhKnk1uNuiKbFU30vj4TiLQA2IwzfekI/W/4eYVb97L8n+eOpWYfDbcLijVUxJahaKpI8MUBIojRNzAivg1qLDN+8GGhJUILW2K/FI4S3w5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjnIWqoCXZCNvRGdnFMZsvOyYfiLRyU/RyNpoc3EehQ=;
 b=MdUKull6q7CFQPuZBAH/rhWopnFLLUPwyCORHzRa6/OtgBdC9Wkm7yD7pagy3At1xe12OAT+WxjXWdhqjyqd59kR4eLRzX1MQRQRCqUu1Iv/k98oiQ56wzalscb64cqrpTUBsmg8eX9abmbr51J9z3P6xySffbt7/g4PKEXP8qw=
Received: from SA1PR02CA0003.namprd02.prod.outlook.com (2603:10b6:806:2cf::9)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 23:03:08 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::9d) by SA1PR02CA0003.outlook.office365.com
 (2603:10b6:806:2cf::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 23:03:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 23:03:08 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 18:03:07 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <alex.hung@amd.com>, <aurabindo.pillai@amd.com>
Subject: [PATCH] tests/kms_writeback: fix coding style issues
Date: Wed, 8 Apr 2026 17:02:45 -0600
Message-ID: <20260408230245.442843-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cd86bf-e068-41ae-6432-08de95c2ffd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: LwcBUnkM2jkGPa1CqLBTlV2zRe/JFG2V7BmAvCGAjkLchN6GmEZmHUmE7EGoDDud3Ww1uz+PegNtYNiGKpcmdbNEIu30uDG5Wdn67/J+goAsocScxlIwqWPPUFUMvX7wnPvV7XEEEMBK783A/dLYf4iPeW2eUng1/Q31MAGHP3jyV47oduPDd5OWZqxFCLGzh9FQjlXwbwui6Z/Vn1tygMiGLLi4P1CVyQ4jhRWNy/4NfyhDVHOQZ7JmhYCMftAbFBYseNkPNv7BH6hhhkfdp8khZ+ZB6FQNGM9M/JPwHy/SWnB0AC68slQLwK61DXHd8HshLInbVYw3LtQnoaqfTOozOuuNFjx/G5xBvm1+LfLZGUDoqJXVsV7jM9ahqkK7StqEpc+CZP2xLYeEv+MwtjppTnGgdyagHRjYD1ECVPy5cGDo8oR0X2PVYQFLTzDvN1wWzrAov9hwj79B2T8sJlDiQplkamXrUn6PqEZ8TphnH01XG7v4KC2SKwCECx/GQAEKMOtBTZbc0TxHj9fSVUA0VpOBTXXW0Dwy7TIdF5A7oNcVJQ+6Prpw3L7yxHIoDiSHp686L3827dqVj1AUkvn+P9gGuQV0uL5VV5byndiTEPjlFj3VCsyP1Beq2HxQ4tfZGeDi/Ixj9x3b1NaU2vpXAJMtM7XBOmXXDVgX/d/ZLo0HhCgrtATG//XnnT5gILsYUwyJVZVpcbUQIyE/aXdosRjddtPLf/Vfa+Zk+sw1KmlcF5R0FZ7O37MRbj04fDQV4sQIcipWOcivakOBDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ugbIXwe+7oOdQHCze/fcD0k9M/o77/KZ55MqJGm83NOC4uSn6vER6T8m0uuvFKs1Q+GylaxAJnHs5dkMFumfchSsrD0DIHBSGLHCM48t3Y7LZkAj+9anPcfO7YJ5S4Absi8LARxDG9p3/FD8I8Pi+nVa5WFzcWrapGDwz0GBJ2S/HsaxxAxhYuA5xEjZZE7gGeg5H+sz5luD8Q1N5zr4YbdcUEwYw7uMpTCEIyBnnb5+4yG6tXBxD227hZCssChjilnlgGbUrJRya/pG/uYBWesjMxpwYdZj0D3AFeuCWNBbTCeffVpQmqojZ+Cw5/DgWBO/BO405I84QLjxpu1z6wfvA7De/71oUdYu2AsvkMx1c44/JmacEMfevmofQup3eaetrBC5C/4jgUUmlqumX5RW5ygjfBa8L6t91SXFcG5+5WKhX7qwn1/HvngFa85w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 23:03:08.0772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cd86bf-e068-41ae-6432-08de95c2ffd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
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

Fix missing spaces after comma in two igt_skip_on_f() calls and
in the writeback-invalid-parameters subtest description strings.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_writeback.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index f15abba96..5031fcb83 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -58,8 +58,8 @@
  * Description: Validate WRITEBACK_FB_ID with valid and invalid options
  *
  * SUBTEST: writeback-invalid-parameters
- * Description: Writeback has a couple of parameters linked together(output
- *              framebuffer and fence); this test goes throughthe combination
+ * Description: Writeback has a couple of parameters linked together (output
+ *              framebuffer and fence); this test goes through the combination
  *              of possible bad options
  *
  * SUBTEST: writeback-pixel-formats
@@ -620,8 +620,8 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		drmModeFreePropertyBlob(formats_blob);
 	}
 
-	igt_describe("Writeback has a couple of parameters linked together"
-		     "(output framebuffer and fence); this test goes through"
+	igt_describe("Writeback has a couple of parameters linked together "
+		     "(output framebuffer and fence); this test goes through "
 		     "the combination of possible bad options");
 	igt_subtest("writeback-invalid-parameters") {
 		igt_fb_t invalid_output_fb;
@@ -644,7 +644,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_fb_t output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
+		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
@@ -678,7 +678,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_fb_t output_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
+		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      igt_fb_mod_to_tiling(0),
-- 
2.43.0

