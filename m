Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F6C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 16:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2466410EAF0;
	Wed, 27 Mar 2024 16:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fb/ZOGCG";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C510EAF0
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 16:27:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsPLYocin9DWH0n6AZna2WeOzWEe9IllZTKT8N2wbBs6Byy0Wrmo5GE1EOWEjTpSqYUg/qPegvn3pQP1NV3Xc0hb5rd1CwvMqEf09NsX7pP0loIlVUD2VAec9moiZZ/d2t7i8PmjCqGlNYVrVCVmdzTmj+iJwVUhsAONr1Gcf4ZAffq3t2qD3pZg4tLJ2Bqbbd4oI3CU5hIc3FFl+DX6g6yW2qUdkOzbmS1TL8EUvPuWSdJ7sWnxRQYQ6i4FZ+bMk21whd1HeOyZM4/EPykZyMv9rL1HYHr6IbVA60bEU1j5Id5ocHPzJhOQ+RO6njFVw06x40Hm1Fp2mzrB+PmorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WmuJNtPO0+NMEoOifiIR1u6WI9C7hxBjNJRUMw6ZcU=;
 b=TM3eXcAgxr4Sb1sKdY5yqfiVfriFmcv90aNPNtCBWPGWsH6Cc+lfAp107G2HIHBwYOLuX3TLKnneyCdC3KrtJqb+cUtBpK1nfqLGVdH0PGN7gBToWdGMt25ygUY2Igz/SG2lXnoMa1iOgPkMCv8Nl/nDyCtmsy9qMMpFrVHuNiQXcR6ttr5vYRHToKV/4cayMhMxZTXHvRjVDdB8EpS8aMIYc+lL0zLHgeWaQ7KIgHhN5g3AbKvzZ+ke3zt2IrUIVYXjsIbNlDeL4SlNje9hF1eHNpFX0rlhvol5Yh8HMVxwf2JM3kusXs/aJ5l1x0UVZXJ7Vsj5hAgcy83J7EjyIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WmuJNtPO0+NMEoOifiIR1u6WI9C7hxBjNJRUMw6ZcU=;
 b=fb/ZOGCGOTcP+KYTrth350TWYyc2KcbcxzDlvQBAMmSjBiCJi6cU3QxvCDjVA7FMXKntOxe1Si9oA9aFoT3ukKV7L7GWi5yM4x0nQoYQB/68uCMnO5BegUQRfHuqfBF9pcK6UkQvvyW4QNHizeUSoac6v0agP/d+RHaFrgQhhug=
Received: from CY5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:930:1a::34)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 16:27:46 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::61) by CY5PR19CA0050.outlook.office365.com
 (2603:10b6:930:1a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 16:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 16:27:46 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 11:27:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>, Hersen Wu
 <Hersenxs.Wu@amd.com>
Subject: [PATCH 1/3][V2] tests/amdgpu/amd_dp_dsc: Correct code style problems
Date: Wed, 27 Mar 2024 10:27:35 -0600
Message-ID: <20240327162737.1082932-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: dbed6d2b-759d-4026-dfac-08dc4e7ad621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppmiV8kdSMxtAP+qgn9E0g91dKmNY/6mgTrkdqOHRGJg8GBPwWabaJQsKzLc3cY3/hFdJe36UOHuHYokVOskGtPhRYyX7pgReNdsSJyxfcGOJKHAHBm3tv3eMEpMTYLRgijj7UUoQ83OHirD44j3NV7mMjTCkEno4GRSFx2bGXB8MuSVqbgPQudasuR/wbxnQxOPvG+dhh/Rt5XmFJoby6AoB2bZA5JbYBTDWb22RdI0KYSOPLmI98MTwf9kmlAyOM/ptF4euwbX59EHOdPOQ+8JwlFOmnzj7HRMcpgyPJ+Z+GaiJrCyZN0YsAsJVc3AX0RazcCr7F30i43Vc40+1Af49wfPQO9CNNODMYJPcOeD0ORjIxBHH3lN++lPtMmGqzEpdpQBY/j5N9B+gvMi+Cw0igHwmpwnf7HfKBlkey/yiyJrBOjovVW0uBE+pZGnNSl536fkw78hZDiParYlTSBO9X+H6frR+ZMxu6upRnenZtLkBwa8Xzg/EtHbIQ08FIR2hjwcwnNSCERI3bks23eC3XoSDaZDZhiXL4BqmS1v9nUoE4HJB6Ms6lMUhukdmegrsF0EFOz6aMc3UTBeSO5FMnr/UnOpfHOS4BAan/i6+vrz5rPiX1HfJSh/S8tl8PpW5MO44SvnyOOJTndcrarphK8z0mT00/QHXJKOKJ22Un+kJJJLxwgtYoUGTayq9SGta3Ds39VenVlsCf7foJo3CjDzT5cBxdIPTGUgh+KoJeA6aaq2N6ej8dO2kjg7
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:27:46.4351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbed6d2b-759d-4026-dfac-08dc4e7ad621
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
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

Use "indent -linux" to fix code styles such as idententation and spaces.
Some manual fixes were also applied for consistency.

There are no funtional changes.

Reviewed-by: Hersen Wu <Hersenxs.Wu@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V2:
- Change "igt_output_t * output" to "igt_output_t *output"
- Limit lines to 100

 tests/amdgpu/amd_dp_dsc.c | 170 ++++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 82 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index e782ce84a..900182443 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -79,19 +79,19 @@ static void test_init(data_t *data)
 
 		/* Only allow physically connected displays for the tests. */
 		if (!igt_output_is_connected(output))
-				continue;
+			continue;
 
-		/* Ensure that outpus are DP, DSC & FEC capable*/
+		/* Ensure that outpus are DP, DSC & FEC capable */
 		if (!(is_dp_fec_supported(data->fd, output->name) &&
-			is_dp_dsc_supported(data->fd, output->name)))
+		      is_dp_dsc_supported(data->fd, output->name)))
 			continue;
 
-		if (output->config.connector->connector_type !=
-			DRM_MODE_CONNECTOR_DisplayPort)
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
 			continue;
 
-		igt_assert(kmstest_get_connector_default_mode(
-				data->fd, output->config.connector, &data->mode[n]));
+		igt_assert(kmstest_get_connector_default_mode(data->fd,
+							      output->config.connector,
+							      &data->mode[n]));
 
 		n += 1;
 	}
@@ -117,11 +117,11 @@ static void test_dsc_enable(data_t *data)
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-					data->mode[i].hdisplay,
-					data->mode[i].vdisplay,
-					DRM_FORMAT_XRGB8888,
-					0,
-					&ref_fb);
+				      data->mode[i].hdisplay,
+				      data->mode[i].vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      0,
+				      &ref_fb);
 		igt_output_set_pipe(output, data->pipe_id[i]);
 		igt_plane_set_fb(data->primary[i], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
@@ -144,11 +144,11 @@ static void test_dsc_enable(data_t *data)
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
 		igt_plane_set_fb(data->primary[i], &ref_fb);
-		igt_display_commit_atomic(display,DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
-		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
+		/* Revert DSC back to automatic mechanism by disabling state overwrites */
 		igt_plane_set_fb(data->primary[i], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
@@ -166,13 +166,17 @@ static void test_dsc_enable(data_t *data)
 	igt_skip_on(test_conn_cnt == 0);
 }
 
-static bool update_slice_height(data_t *data, int v_addressable,
-					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
+static bool update_slice_height(data_t *data,
+				int v_addressable,
+				int *num_slices,
+				igt_output_t *output,
+				int conn_idx,
+				igt_fb_t ref_fb)
 {
 	int i;
 	bool pass = true;
 
-	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
+	for (i = 0; i < NUM_SLICE_SLOTS; i++) {
 		int act_slice_height;
 		int slice_height = v_addressable / num_slices[i] + (v_addressable % num_slices[i]);
 
@@ -200,13 +204,17 @@ static bool update_slice_height(data_t *data, int v_addressable,
 	return pass;
 }
 
-static bool update_slice_width(data_t *data, int h_addressable,
-					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
+static bool update_slice_width(data_t *data,
+			       int h_addressable,
+			       int *num_slices,
+			       igt_output_t *output,
+			       int conn_idx,
+			       igt_fb_t ref_fb)
 {
 	int i;
 	bool pass = true;
 
-	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
+	for (i = 0; i < NUM_SLICE_SLOTS; i++) {
 		int act_slice_width;
 		int slice_width = h_addressable / num_slices[i] + (h_addressable % num_slices[i]);
 
@@ -240,9 +248,9 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 	igt_fb_t ref_fb;
-	int num_slices [] = { 1, 2, 4, 8 };
+	int num_slices[] = { 1, 2, 4, 8 };
 	int h_addressable, v_addressable;
-	bool ret_slice_height= false, ret_slice_width = false;
+	bool ret_slice_height = false, ret_slice_width = false;
 	int i, test_conn_cnt = 0;
 
 	test_init(data);
@@ -255,11 +263,11 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 			continue;
 
 		igt_create_pattern_fb(data->fd,
-					data->mode[i].hdisplay,
-					data->mode[i].vdisplay,
-					DRM_FORMAT_XRGB8888,
-					0,
-					&ref_fb);
+				      data->mode[i].hdisplay,
+				      data->mode[i].vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      0,
+				      &ref_fb);
 		igt_output_set_pipe(output, data->pipe_id[i]);
 		igt_plane_set_fb(data->primary[i], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
@@ -296,7 +304,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 
 		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
 
-		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
+		/* Revert DSC back to automatic mechanism by disabling state overwrites */
 		igt_plane_set_fb(data->primary[i], &ref_fb);
 
 		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
@@ -321,43 +329,41 @@ static void test_dsc_link_settings(data_t *data)
 	igt_output_t *output;
 	igt_fb_t ref_fb[MAX_PIPES];
 	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
-    int lane_count[4], link_rate[4], link_spread[4];
+	int lane_count[4], link_rate[4], link_spread[4];
 	igt_display_t *display = &data->display;
 	int i, lc, lr;
-    bool dsc_on;
-	const enum dc_lane_count lane_count_vals[] =
-	{
+	bool dsc_on;
+	const enum dc_lane_count lane_count_vals[] = {
 		LANE_COUNT_TWO,
 		LANE_COUNT_FOUR
 	};
-	const enum dc_link_rate link_rate_vals[] =
-	{
+	const enum dc_link_rate link_rate_vals[] = {
 		LINK_RATE_LOW,
 		LINK_RATE_HIGH,
 		LINK_RATE_HIGH2,
 		LINK_RATE_HIGH3
 	};
 
-    test_init(data);
+	test_init(data);
 
-    /* Setup all outputs */
+	/* Setup all outputs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
-        igt_create_pattern_fb(data->fd,
-                    data->mode[i].hdisplay,
-                    data->mode[i].vdisplay,
-                    DRM_FORMAT_XRGB8888,
-                    0,
-                    &ref_fb[i]);
+		igt_create_pattern_fb(data->fd,
+				      data->mode[i].hdisplay,
+				      data->mode[i].vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      0,
+				      &ref_fb[i]);
 		igt_output_set_pipe(output, data->pipe_id[i]);
 		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
 	}
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
-    /* Collect reference CRCs */
+	/* Collect reference CRCs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
@@ -376,11 +382,11 @@ static void test_dsc_link_settings(data_t *data)
 
 				/* Write lower link settings */
 				igt_info("Applying lane count: %d, link rate 0x%02x, on default training\n",
-						lane_count_vals[lc], link_rate_vals[lr]);
+					 lane_count_vals[lc], link_rate_vals[lr]);
 				igt_amd_write_link_settings(data->fd, output->name,
-							lane_count_vals[lc],
-							link_rate_vals[lr],
-							LINK_TRAINING_DEFAULT);
+							    lane_count_vals[lc],
+							    link_rate_vals[lr],
+							    LINK_TRAINING_DEFAULT);
 				usleep(500 * MSEC_PER_SEC);
 			}
 
@@ -393,10 +399,11 @@ static void test_dsc_link_settings(data_t *data)
 					continue;
 
 				/* Verify lower link settings */
-				igt_amd_read_link_settings(data->fd, output->name,
-							lane_count,
-							link_rate,
-							link_spread);
+				igt_amd_read_link_settings(data->fd,
+							   output->name,
+							   lane_count,
+							   link_rate,
+							   link_spread);
 
 				igt_assert_f(lane_count[0] == lane_count_vals[lc], "Lowering lane count settings failed\n");
 				igt_assert_f(link_rate[0] == link_rate_vals[lr], "Lowering link rate settings failed\n");
@@ -404,10 +411,10 @@ static void test_dsc_link_settings(data_t *data)
 				/* Log current mode and DSC status */
 				dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 				igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-							data->mode[i].hdisplay,
-							data->mode[i].vdisplay,
-							data->mode[i].vrefresh,
-							dsc_on ? "ON" : "OFF");
+					 data->mode[i].hdisplay,
+					 data->mode[i].vdisplay,
+					 data->mode[i].vrefresh,
+					 dsc_on ? "ON" : "OFF");
 
 				igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
 				igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
@@ -423,7 +430,7 @@ static void test_dsc_link_settings(data_t *data)
 		igt_remove_fb(data->fd, &ref_fb[i]);
 	}
 
-    test_fini(data);
+	test_fini(data);
 }
 
 static void test_dsc_bpc(data_t *data)
@@ -433,10 +440,10 @@ static void test_dsc_bpc(data_t *data)
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
 	int i, bpc, max_supported_bpc[MAX_PIPES];
-    bool dsc_on;
-	const int bpc_vals[] = {12, 10, 8};
+	bool dsc_on;
+	const int bpc_vals[] = { 12, 10, 8 };
 
-    test_init(data);
+	test_init(data);
 
 	/* Find max supported bpc */
 	for_each_pipe(&data->display, i) {
@@ -447,7 +454,7 @@ static void test_dsc_bpc(data_t *data)
 		max_supported_bpc[i] = igt_get_output_max_bpc(data->fd, output->name);
 	}
 
-    /* Setup all outputs */
+	/* Setup all outputs */
 	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
 		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
 
@@ -463,11 +470,11 @@ static void test_dsc_bpc(data_t *data)
 			igt_info("Setting bpc = %d\n", bpc_vals[bpc]);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc_vals[bpc]);
 			igt_create_pattern_fb(data->fd,
-						data->mode[i].hdisplay,
-						data->mode[i].vdisplay,
-						DRM_FORMAT_XRGB8888,
-						0,
-						&ref_fb[i]);
+					      data->mode[i].hdisplay,
+					      data->mode[i].vdisplay,
+					      DRM_FORMAT_XRGB8888,
+					      0,
+					      &ref_fb[i]);
 			igt_output_set_pipe(output, data->pipe_id[i]);
 			igt_plane_set_fb(data->primary[i], &ref_fb[i]);
 		}
@@ -488,16 +495,18 @@ static void test_dsc_bpc(data_t *data)
 
 			/* Check current bpc */
 			igt_info("Verifying display %s has correct bpc\n", output->name);
-			igt_assert_output_bpc_equal(data->fd, data->pipe_id[i],
-						    output->name, bpc_vals[bpc]);
+			igt_assert_output_bpc_equal(data->fd,
+						    data->pipe_id[i],
+						    output->name,
+						    bpc_vals[bpc]);
 
 			/* Log current mode and DSC status */
 			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 			igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
-						data->mode[i].hdisplay,
-						data->mode[i].vdisplay,
-						data->mode[i].vrefresh,
-						dsc_on ? "ON" : "OFF");
+				 data->mode[i].hdisplay,
+				 data->mode[i].vdisplay,
+				 data->mode[i].vrefresh,
+				 dsc_on ? "ON" : "OFF");
 		}
 
 		/* Cleanup all fbs */
@@ -513,17 +522,15 @@ static void test_dsc_bpc(data_t *data)
 		}
 	}
 
-    test_fini(data);
+	test_fini(data);
 }
 
-igt_main
-{
+igt_main {
 	data_t data = { 0 };
 
 	igt_skip_on_simulation();
 
-	igt_fixture
-	{
+	igt_fixture {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.fd);
@@ -536,22 +543,21 @@ igt_main
 
 	igt_describe("Forces DSC on/off & ensures it is reset properly");
 	igt_subtest("dsc-enable-basic")
-		    test_dsc_enable(&data);
+	    test_dsc_enable(&data);
 
 	igt_describe("Tests various DSC slice dimensions");
 	igt_subtest("dsc-slice-dimensions-change")
-		    test_dsc_slice_dimensions_change(&data);
+	    test_dsc_slice_dimensions_change(&data);
 
 	igt_describe("Tests various combinations of link_rate + lane_count and logs if DSC enabled/disabled");
 	igt_subtest("dsc-link-settings")
-		    test_dsc_link_settings(&data);
+	    test_dsc_link_settings(&data);
 
 	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
 	igt_subtest("dsc-bpc")
-			test_dsc_bpc(&data);
+	    test_dsc_bpc(&data);
 
-	igt_fixture
-	{
+	igt_fixture {
 		igt_reset_connectors();
 		igt_display_fini(&data.display);
 	}
-- 
2.34.1

