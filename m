Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DB6F8E497
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 00:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840E10E253;
	Fri, 17 Apr 2026 00:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gjtaA4O7";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3610E253
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 00:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDjAZ8kgHC/+xfBfna9KKYH3cMjZS8XF6wVZqsONoAeXVPCs5KmBCV0hOA8oVu83qvCqwuI2ymfHs5aIY1poLaTqdUJ+7Hmf9WHhKhxpaThSsNpNBlqEPwp2OVYSwB9MjM403+vHCzubdB2IuRBvOxvDzRfvZUqWMoFWcenY8sGV5ZRc0RsJ0q+nOlyY/q+eudDTrhRC9LUY8eVxgGtVNUW14LWQomb4znYaiwk5HFctTG/TcYigqsqS8t7m+ZJuS7bfxmU0uea38JlqsnGG9yvQzx8FF9cJ7cdOQeRpkQ8YiRRelKCz4h9Az0Zm1wnfunfRXg1J4gjRnp/LaOuECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g71ovWIm3n0g4gnbIvPZa+htDkrOR8a3cJYjyV/07gs=;
 b=kDpmw8J9PKr2oiKenGHJuvT/qDvfblliWVWnqlOglyWAMkVuT5waMyBVhJoWNVnywKx0IwvTptKBPAh57U94RzjnzbxYEARhsl1nmHeKwI6enXjKCzenS6aFphaVg4sVQ4r423d4sUu99XyhKCKY/oN4iNP1Mqfgk0reeFvd5SMsv3Jz2rKksLdRr9Lga6M6t9uKSj/QnCtgdCarog5jSYJQhfPowwNN+XIUbZSvTHgFsNlUH3fK2Ektu8OTa4KJq3j5HM3EtUv9+ErkdWm2xHOvwBDK8oDEmcD2fl/YKuzmCk+H6JfLgJ/p3pAyg7fxab9QnBvax3xxjFAzHgJolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g71ovWIm3n0g4gnbIvPZa+htDkrOR8a3cJYjyV/07gs=;
 b=gjtaA4O7r55JRubO/Xvrb2Ac4TPHyoaxtqxBdhs3TfxTLzz8CCL5D7/W6NyGZa88eeHHGQHXwExWE70BMsPwclWuy4HRW82YLeg4LrZ3algAJJo+gvqkBtLGUcz9YAdgY/wxTc43GWJ0gzqVeW3oClx1bnyTA5SiVe+A2qBs3I0=
Received: from PH7P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::25)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 00:21:33 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::6) by PH7P220CA0042.outlook.office365.com
 (2603:10b6:510:32b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 00:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 00:21:32 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 19:21:31 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 1/2] tests/amdgpu: Fix typos and grammar in test files
Date: Thu, 16 Apr 2026 18:21:15 -0600
Message-ID: <20260417002116.94208-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9733ce-0ab9-44ed-a01f-08de9c174715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ot42ihfeJr2wnpi+kirHcox8M6luhfawtX8SSqqdoFZLOxEcsY0A0lVypbNbCozoEOtfby5qq4seIvBIdiASR0EYSSvXlStPP+TpvKkzxIEjk3vmLP1gfd0GqFyhN//VbHxn3VJlyAj7yw0vw1nFbeRvhpaNCi96ut2MxCZA7l4HBX2pSuJJmADzg92q4+79xpEZWUkCApvKEy8AyG7Opm2I5hjMUdlHSLvKp1Z0zKThcj4unboA0AlIIV2fKQtG4VYMr2HMQ1YRgKthtJrWcfaBykRLth7SzTf3zlKFgA67aojMSe1LanpLCfPbYZT6wlX2O7TMuaaV506aBhmZg5ooJchFss0m1kX8EIk7gmsJq3NfEAJgmmcWmRCBUnb4Wxd9jcT4LFAGlU6Leq3zb2Dd6kUxpdbE3HZn5NFSWOfXyloQWPc6K7y6AhPbsIWggiAzm5MIk7g8TVSuSBaywcfKwaQzt84m8amVWrjcpz+uhVPS8MoLFpZCBJnlyB3jSL4O4D84/sTWdjwP+VBcONsiz+aG4Z4xrlhBZmRe1wx9B7CTlFjmxKm/rarkmRxOKKI2eIVcgCG+blY4BToY/vyO44lNIbU8QPEn0tFSLag4DHUFVLXvON56xx4F9WJhbLXO3TpCWaSdbfceAd9BM6NC8hgmlJmoA8pfFXfAmS3Me+HLUffGKhBYF3bs5yuPRb9okJObwQrfuctOLxRIaC2j5G1n/gTBbyjCjZUsm2YjvU9MEz/noohcXZkII+NumYnVT+sTDAlbT7HTCtHpwA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3FfkHxAGgiytcMqc29m6mMiaxgScJcNLYlBR95bnCuo+0MflkW7Wte3HghJrOlIZp4qBBmvbvF3tBA2GB/zahlCEKFPV7hrRHyEQqqT87dUkdwKSOcDUEXH+NbZKSF9MKDWvjPfV0Hk7tDvpUAjFpiqFz3zdndtkdaJq62yv5R83Uuj5zFgy1HG6uzavIMDyOuG9ltYRhQnZSNjLbh8XgeDN8ocaT7bseFRol4+TAcztSjrOFH7/1+3oQdrjrsmz4PrLD901nDv2UxpxvNn2SVZFJ656Y62DgloI7XQ93M1Zrp68ns3y8lPjkkqlqQIDOk9m1dCEgNdg85tOwYFTIvW2U3hrlC3md2e1U5bdLdebruoHwN28Q7nchXyP213Es/0htAstw8xNPBaEe3MCYqlTpg4Euw1g6RDtmM0LSKt8potwg3/ZpSjF1pnJmzqK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:21:32.3086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9733ce-0ab9-44ed-a01f-08de9c174715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
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

Fix various typos and grammar errors across multiple AMDGPU
test files:
- amd_abm: "amdpgu" -> "amdgpu", fix grammar in comment
- amd_assr: add missing article, remove trailing spaces
- amd_color: "amdpgu" -> "amdgpu", "liner" -> "linear",
  fix incorrect "degamma" comment in regamma function
- amd_plane: "backgroud" -> "background",
  "overley" -> "overlay", "beacause" -> "because",
  fix wrong size notation and misleading comment
- amd_vrr_range: "gange" -> "range" in function name

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_abm.c       |  4 ++--
 tests/amdgpu/amd_assr.c      |  6 +++---
 tests/amdgpu/amd_color.c     |  6 +++---
 tests/amdgpu/amd_plane.c     | 14 +++++++-------
 tests/amdgpu/amd_vrr_range.c |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index d36044aab..207d075b0 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -128,7 +128,7 @@ static void test_init(data_t *data)
 	if (!has_edp)
 		igt_skip("No eDP connector found\n");
 
-	/* It doesn't matter which pipe we choose on amdpgu. */
+	/* It doesn't matter which pipe we choose on amdgpu. */
 	data->crtc = igt_first_crtc(&data->display);
 
 	igt_display_reset(display);
@@ -169,7 +169,7 @@ static void test_fini(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 
-	/* Disable ABM before exit test */
+	/* Disable ABM before exiting the test */
 	for_each_valid_output_on_crtc(&data->display,
 				      data->crtc,
 				      output) {
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index b07f3fb15..71209e79f 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -29,7 +29,7 @@
 #include <sys/stat.h>
 
 IGT_TEST_DESCRIPTION("Check if ASSR is enabled on eDP links that support "
-		     "the display authentication by changing scrambling sequence. "
+		     "the display authentication by changing the scrambling sequence. "
 		     "The test also covers embedded and non-removable "
 		     "displays that appear as DP.");
 
@@ -285,10 +285,10 @@ int igt_main()
 	igt_describe("Test ASSR on connected DP/eDP links");
 	igt_subtest("assr-links")
 		test_assr_links(&data, TEST_NONE);
-	igt_describe("Test ASSR with DPMS ");
+	igt_describe("Test ASSR with DPMS");
 	igt_subtest("assr-links-dpms")
 		test_assr_links(&data, TEST_DPMS);
-	igt_describe("Test ASSR with suspend ");
+	igt_describe("Test ASSR with suspend");
 	igt_subtest("assr-links-suspend")
 		test_assr_links(&data, TEST_SUSPEND);
 
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 68f541d64..eb1eb581a 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -177,7 +177,7 @@ static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
 
-	/* It doesn't matter which pipe we choose on amdpgu. */
+	/* It doesn't matter which pipe we choose on amdgpu. */
 	data->crtc = igt_first_crtc(&data->display);
 
 	igt_display_reset(display);
@@ -262,7 +262,7 @@ static void test_crtc_linear_degamma(data_t *data)
  * sRGB regamma matrix with incorrect calculations or rounding errors.
  * If we put the pipe into bypass or use the hardware defined sRGB regamma
  * on the plane then we can and should get the correct CRTC when passing a
- * liner regamma matrix to DRM.
+ * linear regamma matrix to DRM.
  */
 static void test_crtc_linear_regamma(data_t *data)
 {
@@ -291,7 +291,7 @@ static void test_crtc_linear_regamma(data_t *data)
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
-	/* Apply a linear degamma. The result should remain the same. */
+	/* Apply a linear regamma. The result should remain the same. */
 	set_regamma_lut(data, &lut_linear);
 	igt_display_commit_atomic(display, 0, NULL);
 
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 412a220b2..e63d4dc2f 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -366,14 +366,14 @@ static void test_multi_overlay(data_t *data, int display_count, int w, int h, st
 }
 
 /*
- * Compares the result of white backgroud with white window with and without MPO
+ * Compares the result of white background with white window with and without MPO
  *
  * Reference crc:
  * Draws a White background of size (pw,ph).
  *
  * Test crc:
- * Draws a White Overlay of size (pw,ph) then creates a cutout of size (p,w) at location (x,y)
- * Draws a White Primary plane of size (p,w) at location (x,y) (under the overlay)
+ * Draws a White Overlay of size (pw,ph) then creates a cutout of size (dw,dh) at location (x,y)
+ * Draws a White Primary plane of size (dw,dh) at location (x,y) (under the overlay)
  *
  * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
  * a ref crc per flip)
@@ -400,7 +400,7 @@ static void test_plane(data_t *data, int n, int x, int y, double w, double h, do
 	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
 	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
 
-	/* Move the overlay to cover the cutout */
+	/* Move the primary to cover the cutout */
 	igt_plane_set_position(data->primary[n], x, y);
 	igt_plane_set_size(data->primary[n], dw, dh);
 
@@ -451,7 +451,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 				int x = dx*j*dir[i][0];
 				int y = dy*j*dir[i][1];
 
-				/* No need to pan a overley that is bigger than the display */
+				/* No need to pan an overlay that is bigger than the display */
 				if (pw <= w && ph <= h)
 					break;
 
@@ -491,7 +491,7 @@ static void test_scaling_planes(data_t *data, int display_count, int w, int h, s
 		int ph = data->h[n];
 
 		for (int i=0;i<ARRAY_SIZE(scale);i++) {
-			/* No need to scale a overley that is bigger than the display */
+			/* No need to scale an overlay that is bigger than the display */
 			if (pw <= w*scale[i] && ph <= h*scale[i])
 				break;
 			test_plane(data, n, 0, 0, w, h, w*scale[i], h*scale[i], pw, ph, fb);
@@ -523,7 +523,7 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
 	int it = 3; /* # of times to swap */
 
 	/* Set y to 0 if window is bigger than one of the displays
-	 * beacause y will be negative in that case
+	 * because y will be negative in that case
 	 */
 	if (h >= smallest_h)
 		y[0] = y[1] = y[2] = 0;
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 4397f3c15..0312e22c2 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -260,7 +260,7 @@ static bool has_vrr(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
 }
 
-static void parse_vrr_gange_from_edid(data_t *data, uint8_t *edid, int index)
+static void parse_vrr_range_from_edid(data_t *data, uint8_t *edid, int index)
 {
 	bool max_rate_offset = false;
 	bool min_rate_offset = false;
@@ -314,7 +314,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
 				break;
 			else if (i == range_head_size-1) {
 				/* Found Display Range Limits Descriptor block */
-				parse_vrr_gange_from_edid(data, sink_edid, index);
+				parse_vrr_range_from_edid(data, sink_edid, index);
 				return true;
 			}
 		}
-- 
2.43.0

