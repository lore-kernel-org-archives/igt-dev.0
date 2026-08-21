Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE59C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBFF10E36F;
	Mon, 24 Aug 2026 08:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rzvK4wn3";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013036.outbound.protection.outlook.com
 [40.107.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4961E10F3C7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 20:12:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfnKVU3AriezoAtiJC+FaoO90MzVYdioLKvEcnbNewXEdDIjGZVybZ7376cUNQ5ONUu+zB0iJ10KELZKiJFy6+JGRS8RfDYztci66khwCjGNnD7Cg9Em+0p9zdcd1wWne296wixcIAU/TwGnu4fdIaInGlQPVMp34PkOcF1o4MvN3ntiFul5QsoUwdzs43evkCS2Khywuq14PNwwXewxY1GHqjmlUcfzSD1oiN/BJ5gVbK/wDd1tq2/alfCbV9ZhWuK63MRHdz7LCBu50YFg/7EsJAdX7u6qe9M1OcDgNFS1yd0l6HvoPZOSxslk2DU7NzWjDYvIGehjISXZVL8ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n28WbdH2ee2bLcrGr6+VjsCbh5iRT8sbCV3YfHm9sgE=;
 b=czO2TahJnWJV9QdEt3QrQKV0eITYrWuk0xURgSDzhM18sodI5vbX6BOKBBtWMTWjBBPOGx8gyNrKeJmqfanii713AhxD+i0+svkPGwMX22SJtsR9ob7O+ar/8to+zIoxRIL4B1mi1wUQtryMyqmOB6JtMTMzB5N8+rR2ShGpV5YLNPbW3Sw3dD6f/Huz1Z1i5Vene17xtjhtycfkd9etsnyY3SexxchNGbks4wjKq2q9nUDYWM0elUiVtS7nQY7G/FNsPu6elbAdlMQ/iWo4FkwSRtSSnv22YyAXXAw+zkGgzKWdjj5Bn5JlwXXKGOq69WAzRFyidOQ9TqXh/nMiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n28WbdH2ee2bLcrGr6+VjsCbh5iRT8sbCV3YfHm9sgE=;
 b=rzvK4wn37CeYR+tFlBPVfFEqMYSoWTMcgyNOOGR5WClJon/6+AH+pvFA8eOD8Nsh3rD5zafg5Qns8PU8OSfFcDO4lz6M+pcUMLFEEadXQ4OCpct7UJlIQaBLZD8a12of8a27H2RWd6qntmIIPwKUEhxzrrwJwI/ELabyTrEDycA=
Received: from SA0PR11CA0145.namprd11.prod.outlook.com (2603:10b6:806:131::30)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 20:12:35 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::22) by SA0PR11CA0145.outlook.office365.com
 (2603:10b6:806:131::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 20:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 20:12:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 15:12:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 15:12:14 -0500
Received: from tony-dev.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 15:12:14 -0500
From: <Haoming.Qi@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Alex.Hung@amd.com>, <PingLei.Lin@amd.com>, <sunpeng.li@amd.com>, Tony Qi
 <Haoming.Qi@amd.com>
Subject: [PATCH] tests/amdgpu: scale MPO bandwidth-skip tolerance to the panel
Date: Fri, 21 Aug 2026 15:30:21 -0400
Message-ID: <20260821193021.2156148-1-Haoming.Qi@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 025da81c-2f14-4269-8d82-08deffc08a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: AmnHE1w+Yh+MTaCOw4H8lEUdCk1fHaYyX6sEfbJaceLzf9ENqpkIsUzKQbsscW9CPNUSIbOU3Jzot6QInJtnMpwy+HzZSZ40pITt1JDZdzDQl6us1rerNZRJM4IkukD52U3lspLPDaXAVLPGVSlmbPsflH9ivqWsjNPv75vabWRoqVoE45Fa/5ggrLFAxwepoL+vYCQeOVDeK7VMG9ACb2qKe3qbcIBr2GL2DbhCj0PgOd+e/B/uBLbo5LUqMFPv64p236Q0kON+85RTw3nReXwU3aSs5vj1hbSjl9zJaq+HJiP+HYSRSNcKKNuiyGZuRsAbhRZo7VrnCcYiLiku7Hq9Lacyp9IHXA1wFjFMoegd/ViFGD2nyIfqiwv0jgym/L0afZki/MBCQVqPSyxk+b2NvC9RC6AWM3TFDLiPd9FIXb2NDebZXxzydUoU/i6wKr6vHg+21TGQVHIQf/7TjcFjoRNJIQYWd4P5P3GlkuY/okLRDb2GQ47050P4NF3O5tKTbmmDXYMBFWHFrTNXE1Gkm3dsVFXBS3PzqSYcMu/G9VydEONaVn8+rX8K0mWYTl+F5pf2IXmaz9jcFBzIeu5sZlCILqhy/oUuut9xdhXpSQGuEhxzSEDfxjK82DBOcetsjoyuvnGMGsYl/kw75IstbbMhEqdHWHtq9Bn9qpsjkxD6OM9QAlyfqek20bA6A4sDE09CP+/qf6ew2VLa/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IMEfA31P6HeQNLibgeRxLRfad6/i8AUeSsWOkroFoj4/AxDzkfM/Oab8MmKtfE66zti3Ormuk24t4aGz+hn+05UT87I+ne5ZSLdPalFd7t0y9HGT2ILAVxGm6aJtvho/Tc8yFVXmHnLa8+xLw+yPrfdnWD2gjhalcoojSR2GnqEXlE0IegGfqM0FIOqwvmBOxvkwJRL+i7vCHj1yhYyMhZ6DGeBdc/8NIZ65plgHfw0zJ+ILX1BA847b0VAhzzyEMoQRl1htDScWeb2GCfZYaB0IEMtJVoco2BTepoUCKYXza/hLZRnoeN3OEkkX1ncg0OhrE5Fhd2YIunbFZBJt07HN1urMoUPDYFZVXRQg/nPjgOn8zGGBPI9s3XI3h5lSCIInrRbhRy5jXfDYyzPYYFzG+im2sO4lPC2u0XQY89qIPGU9lnLSTR9QfZ1WyQib
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 20:12:34.4919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 025da81c-2f14-4269-8d82-08deffc08a31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455
X-Mailman-Approved-At: Mon, 24 Aug 2026 08:18:13 +0000
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

From: Tony Qi <Haoming.Qi@amd.com>

mpo-scale-* bounded the driver's legitimate bandwidth rejections with a
hardcoded MPO_MAX_BW_SKIPS = 4, but the number of downscales that
genuinely hit the display-bandwidth limit varies with panel resolution,
refresh and display count, so a fixed count fails on some configurations
despite no regression. Replace the constant with a percentage of the
combinations actually attempted (counted up front once the mode is
resolved), making the tolerance dynamic and scaled to each run

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Tony Qi <Haoming.Qi@amd.com>
---
 tests/amdgpu/amd_plane.c | 98 ++++++++++++++++++++++++++++++----------
 1 file changed, 74 insertions(+), 24 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 0e849b9b4..dce8a5aa3 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -30,12 +30,14 @@ IGT_TEST_DESCRIPTION("Tests for Multi Plane Overlay for single and dual displays
 #define MAX_PIPES 6
 
 /*
- * Upper bound on how many scale/source combinations may be skipped because
- * the driver legitimately rejects them on display-bandwidth grounds
- * (DC_FAIL_BANDWIDTH_VALIDATE). Empirically only the heaviest downscales of
- * the largest sources hit this; many more than that means a real regression.
+ * Max fraction (percent) of the scale/source combinations that may be skipped
+ * because the driver legitimately rejects them on display-bandwidth grounds
+ * (DC_FAIL_BANDWIDTH_VALIDATE). The absolute budget is derived per run from this
+ * percentage and the number of combinations actually attempted (which depends on
+ * the panel mode and display count), so the tolerance scales across ASICs and
+ * panels instead of a fixed count. Exceeding it means a real regression.
  */
-#define MPO_MAX_BW_SKIPS 4
+#define MPO_MAX_BW_SKIP_PCT 30
 #define DISPLAYS_TO_TEST 2
 
 /* (De)gamma LUT. */
@@ -59,6 +61,7 @@ typedef struct data {
         int h[MAX_PIPES];
         int fd;
         int bw_skips;
+        int max_bw_skips;
 } data_t;
 
 static const drmModeModeInfo test_mode_1 = {
@@ -443,12 +446,12 @@ static void test_plane(data_t *data, int n, int x, int y, double dw, double dh,
 			     fbc[n].test_primary.height, pw, ph);
 
 		data->bw_skips++;
-		igt_assert_f(data->bw_skips <= MPO_MAX_BW_SKIPS,
+		igt_assert_f(data->bw_skips <= data->max_bw_skips,
 			     "too many MPO scale combinations skipped (%d > %d); likely a real regression, not isolated bandwidth limits\n",
-			     data->bw_skips, MPO_MAX_BW_SKIPS);
+			     data->bw_skips, data->max_bw_skips);
 
 		igt_info("Skipping unsupported scale (likely display bandwidth limit): n=%d dw=%.0f dh=%.0f pw=%d ph=%d (skip %d/%d)\n",
-			 n, dw, dh, pw, ph, data->bw_skips, MPO_MAX_BW_SKIPS);
+			 n, dw, dh, pw, ph, data->bw_skips, data->max_bw_skips);
 		igt_plane_set_fb(data->overlay[n], NULL);
 		igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
 		igt_plane_set_position(data->primary[n], 0, 0);
@@ -517,26 +520,55 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 
 }
 
- /* MPO_SCALE: This test scales a window of size (w,h) from x1/4->x16.
-  */
-static void test_scaling_planes(data_t *data, int display_count, int w, int h, struct fbc *fb)
+/* Scale limit is x1/4 -> x16
+ * some combinations of mode/window sizes fail for x0.25 so start from 0.30 -> 16
+ * At file scope so mpo_scale_total_combos() counts the same combinations the test runs.
+ */
+static const double scale[]= {
+	0.30,
+	0.50,
+	0.75,
+	1.50,
+	3.00,
+	6.00,
+	12.00,
+	16.00
+
+};
+
+/* Count the scale/source combinations test_scaling_planes() will attempt for the current
+ * mode(s) - mirrors its loop (same break + fullscreen) - so the bandwidth-skip budget can
+ * be a percentage of the real total. No commits; pure arithmetic.
+ */
+static int mpo_scale_total_combos(data_t *data, int display_count,
+				  int (*videos)[2], int n_videos)
 {
+	int total = 0;
 
-	/* Scale limit is x1/4 -> x16
-	 * some combinations of mode/window sizes fail for x0.25 so start from 0.30 -> 16
-	 */
-	double scale[]= {
-		0.30,
-		0.50,
-		0.75,
-		1.50,
-		3.00,
-		6.00,
-		12.00,
-		16.00
+	for (int n = 0; n < display_count; n++) {
+		int pw = data->w[n];
+		int ph = data->h[n];
 
-	};
+		for (int v = 0; v < n_videos; v++) {
+			int w = videos[v][0];
+			int h = videos[v][1];
+
+			for (int i = 0; i < ARRAY_SIZE(scale); i++) {
+				if (pw <= w*scale[i] && ph <= h*scale[i])
+					break;
+				total++;
+			}
+			total++; /* fullscreen pass */
+		}
+	}
+
+	return total;
+}
 
+ /* MPO_SCALE: This test scales a window of size (w,h) from x1/4->x16.
+  */
+static void test_scaling_planes(data_t *data, int display_count, int w, int h, struct fbc *fb)
+{
 	for (int n = 0; n < display_count; n++) {
 		int pw = data->w[n];
 		int ph = data->h[n];
@@ -668,6 +700,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 	test_init(data);
 
 	data->bw_skips = 0;
+	data->max_bw_skips = 0;
 
 	/* Skip test if we don't have 2 overlay planes */
 	if (test == MPO_MULTI_OVERLAY)
@@ -717,6 +750,23 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 
 	igt_kmsg(KMSG_WARNING "MPOSCALE setup done (ref crc collected), entering scaling loop\n");
 
+	/*
+	 * Derive the bandwidth-skip budget from the number of combinations this
+	 * panel will actually attempt; modes are finalised by now. Always tolerate
+	 * at least one isolated skip.
+	 */
+	if (test == MPO_SCALE) {
+		int total = mpo_scale_total_combos(data, display_count,
+						   videos, ARRAY_SIZE(videos));
+
+		data->max_bw_skips = (total * MPO_MAX_BW_SKIP_PCT) / 100;
+		if (data->max_bw_skips < 1)
+			data->max_bw_skips = 1;
+
+		igt_debug("mpo-scale: %d combinations, tolerating up to %d bandwidth skip(s) (%d%%)\n",
+			  total, data->max_bw_skips, MPO_MAX_BW_SKIP_PCT);
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(videos); ++i) {
 
 		/* Video(mpo) should be in the middle when it transitions between displays. This
-- 
2.43.0

