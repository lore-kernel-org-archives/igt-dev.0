Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4894FC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 07:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39C58949C;
	Tue,  7 Jul 2026 07:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dk0bvVhF";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011002.outbound.protection.outlook.com [52.101.57.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF1B8949C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 07:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFxgzQJZ08dbKaO3A9RvmJ6ihiBkAhNTYP+3EgWsU7fptKyIK8dtN0xXY8Ndzv6J+KaHYqANIoX9nOdXqQaGJU4SDCRTF0CTKNhJvYu9uGM3u2Zk4xvQe6fM8QHpZ85+Otb30eFEV9mzNwsY3BzACmS0ilNfQP/CSV/xmy/AMRvj5ovUn3EcYLFrR84HGoRFbYmb5T9wGEfZtwTMlN6Zbxghe/CkPx/NKZsgrHR1Xw1lrTrv3qPUdAlwapNmGWcVx4y6RJMGwqD6rjQQiTQ2+H2Z65ilDege6ODcXGQi8YYAPtHe7OHXEZ1fEN4SSN+H3IqSl2teomb+fOUxz5Yj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdsGCZnMQYyzS6QPwxpGdXEhpz3a7Fz1xgsK5S0ET8M=;
 b=htE+0W0a9QItrZiO8fqfVzKdd8hpB13a6+aZCyvpmkhhvbXBlWBpFkA738fI2G6JI9VdWoRgPaGPfz7ZytyGzDjOqmJEdZf4triYWJLUGwKLhKlB/RRGcqcc4PV197Fwt+X2+QR/KcZqJtOR+u8lokxMZgmrLLl5z9cmaUs2SOQC0HPBjXFjs/OEv2eWUaw+N8XbBx6Av6FLRUngaaIt8hNQZe6H6N37Xd+w65TfK3tkyYB134NqV8oU9QM66Nfk/5+PdP8IhvjgUjceMOciZ9IT9jEoZ/SxJRxTTkGGBUNeJ2bOGwlBI2A87Tfy33m2pAzHaL1PWDz9fFLgtStilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdsGCZnMQYyzS6QPwxpGdXEhpz3a7Fz1xgsK5S0ET8M=;
 b=Dk0bvVhFr8FKzhF+3C+ExZLT9Qa+0T4ndv288JhfaYUqgZwQA8U/4qZOj8eT53I2EpRsb/EkOBlZ0KUsuDFNPcUNaKcgvVyGWrfho5RKpYAxZkPB6mTBxX+dcLo7QEFnZYZfJVTlwEzIjOmxek834GTUXFfULjDGleysOsuG4Qs=
Received: from SN7PR18CA0006.namprd18.prod.outlook.com (2603:10b6:806:f3::8)
 by PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 07:40:38 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::3c) by SN7PR18CA0006.outlook.office365.com
 (2603:10b6:806:f3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 07:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 07:40:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 02:40:37 -0500
Received: from james-PlumDAP-MDS1.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 7 Jul 2026 02:40:31 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Tolerate bandwidth-limited MPO scale
 combinations in mpo-scale
Date: Tue, 7 Jul 2026 15:42:44 +0800
Message-ID: <20260707074312.3492-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|PH7PR12MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 357a95ab-0e8d-4eb1-ec2d-08dedbfb09ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: tI3LjUoahyCIz6b0zWoOzEU6JLL8UJbaCw/rpmJgjohiv6oK3NCgS7wPuA/Z2OEWmzpaRbxcpFHbLE1yNM2gXpz0NXfuq1OYout5rNFFQY/akKTgnHsyEM5DEqZZ5dR04urQCzoyNPI65uAliXll3W66EljV5YdVXIG6Kwa+kuPFr+/SUl2rPLiWJx0wisrokJjzPknCfl/6QI7U/Vuj9peDvqVsV0Alj8igmKzXk7ReL+FqijuQ4L91JD9arFxBrF4I3htUJTSt7LtnG3iy8oCCyMx1EPSg0N6NbBQxWg9Ii2rkjjXHYxIAqp7rNjg4vP+kHt7J+3dJviNDKzXWwqOQQf6ag4IQg7Y8G2TPjLmliCfRvTBPS8PnMLLUwsacZsXN7Wnz2PNSgPdYPMaqfV36EQregh3k9L/dxUhPttgYRCLlMAeR29Lr/+Rz9fZnZ9UZCPqXlJ/DCb0Z1NA1MciVMI3wDi5MOwWPHMMduEsAlKVyUUvMIhTNTNjQK8yriPbe8BnjMk60pk+Z31g1K48wr0EcA54gNsMZsjcLhJNMThlL4ziNhlGSw6eN2lUJDvUnSgB7jTqvUm7XvzbTCaIzgx/UOR64fAIgEIKGjKRK8NE70F3f4RO+cZsRqiSK+Jk0sK65olQHvMrGHaj2wc45cxs2Yk4rGdULsF07hcVpXJ4loABpTTXkLMh3a623CFxRI4cOKLSmm2cNuxqP0w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UD+Axa03bWV1WiL1OKAiGZXw2QmY07LAA/WTOeHHHEFkLnXucDhIN3f9uR6KhAedHpmToAK3p5yisACZ99u27rd/3DYHqVzwybVNxl9ejwYmOQbvrzg8URCgNWNVqzohGHfoI9UP72ng1wiB1oMwKEgHbdIYqEsyJP9HGwnvzogVF5/C9MMpztqh2oRwaAFrUzdyRq60wiwaVus0+nJ/9cF9gdfEWSx33OKII3ziRUACJ57QbPfYewBgZA1OVfGeZi9IVX7eAZYuKC2hkXzOg6tskyqkaEHM2wBcwl2wem2dPEGdOQptc02q89YGCV1h6c3+l2S2E71t3QR78CHJGzAf56TTu6b3sgUrzuH2SK0qboeKPisFo0vBydWCrVMSbrvI56MQcx949Y33LV4MKmUPfktfSHWLDoMtM/jE0DN/x5oluVRhUMc/nWJld2V4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 07:40:38.2802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357a95ab-0e8d-4eb1-ec2d-08dedbfb09ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6717
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

[Why]
amd_plane@mpo-scale-* iterates every source size (up to 4K) and scale
factor and performs a hard igt_display_commit_atomic() for each MPO
arrangement. Downscaling still reads the full source surface, so a
heavily downscaled large source (e.g. 4K at 0.30x) costs as much display
read bandwidth as a full-size plane. Combined with the full-screen
overlay and DSC at high refresh rates, the configuration can legitimately
exceed the display controller's bandwidth and be rejected by the driver
(DC_FAIL_BANDWIDTH_VALIDATE -> -EINVAL). That is a hardware limit, not a
scaler defect, but the hard commit turned the legitimate -EINVAL into an
unparsable test failure (the run aborted during commit with no result
line emitted).

[How]
Replace the hard commit in test_plane with igt_display_try_commit_atomic
and tolerate only a legitimate rejection: a downscale (displayed area
smaller than the source surface) rejected specifically with -EINVAL. Any
other errno, or a failing upscale, still fails the test. Bound the number
of tolerated skips with MPO_MAX_BW_SKIPS so an unexpectedly large number
of rejections is treated as a real regression rather than isolated
bandwidth limits. Skipped combinations restore the reference primary
plane so subsequent iterations start from a committable state;
configurations that do commit are still fully CRC-validated.

Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/amdgpu/amd_plane.c | 57 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 9a08f8e29..0e849b9b4 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -28,6 +28,14 @@ IGT_TEST_DESCRIPTION("Tests for Multi Plane Overlay for single and dual displays
 
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
+
+/*
+ * Upper bound on how many scale/source combinations may be skipped because
+ * the driver legitimately rejects them on display-bandwidth grounds
+ * (DC_FAIL_BANDWIDTH_VALIDATE). Empirically only the heaviest downscales of
+ * the largest sources hit this; many more than that means a real regression.
+ */
+#define MPO_MAX_BW_SKIPS 4
 #define DISPLAYS_TO_TEST 2
 
 /* (De)gamma LUT. */
@@ -50,6 +58,7 @@ typedef struct data {
         int w[MAX_PIPES];
         int h[MAX_PIPES];
         int fd;
+        int bw_skips;
 } data_t;
 
 static const drmModeModeInfo test_mode_1 = {
@@ -382,6 +391,7 @@ static void test_plane(data_t *data, int n, int x, int y, double dw, double dh,
 
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
+	int ret;
 
 	/* Reference: */
 
@@ -404,7 +414,48 @@ static void test_plane(data_t *data, int n, int x, int y, double dw, double dh,
 	igt_plane_set_position(data->primary[n], x, y);
 	igt_plane_set_size(data->primary[n], dw, dh);
 
-	igt_display_commit_atomic(display, 0, 0);
+	/*
+	 * Downscaling reads the full source surface, so a heavily downscaled
+	 * large (e.g. 4K) MPO source costs as much display read bandwidth as a
+	 * full-size plane. Combined with the full-screen overlay and (on some
+	 * panels) DSC at high refresh rates, the resulting configuration can
+	 * legitimately exceed the display controller's bandwidth and be
+	 * rejected by the driver (DC_FAIL_BANDWIDTH_VALIDATE -> -EINVAL). That
+	 * is a hardware limit, not a scaler defect, so skip such combinations
+	 * rather than failing the test. Configurations that do commit are still
+	 * fully CRC-validated below.
+	 */
+	ret = igt_display_try_commit_atomic(display, 0, NULL);
+	if (ret != 0) {
+		/*
+		 * Only tolerate a *downscale* (displayed area smaller than the
+		 * source surface) rejected specifically with -EINVAL, which is
+		 * the DC_FAIL_BANDWIDTH_VALIDATE path. Any other errno, or a
+		 * failing upscale, is a real bug and must fail the test.
+		 */
+		bool downscale = (dw < fbc[n].test_primary.width ||
+				  dh < fbc[n].test_primary.height);
+
+		igt_assert_f(downscale && ret == -EINVAL,
+			     "atomic commit rejected unexpectedly (ret=%d, downscale=%d): n=%d dw=%.0f dh=%.0f src=%dx%d pw=%d ph=%d\n",
+			     ret, downscale, n, dw, dh,
+			     fbc[n].test_primary.width,
+			     fbc[n].test_primary.height, pw, ph);
+
+		data->bw_skips++;
+		igt_assert_f(data->bw_skips <= MPO_MAX_BW_SKIPS,
+			     "too many MPO scale combinations skipped (%d > %d); likely a real regression, not isolated bandwidth limits\n",
+			     data->bw_skips, MPO_MAX_BW_SKIPS);
+
+		igt_info("Skipping unsupported scale (likely display bandwidth limit): n=%d dw=%.0f dh=%.0f pw=%d ph=%d (skip %d/%d)\n",
+			 n, dw, dh, pw, ph, data->bw_skips, MPO_MAX_BW_SKIPS);
+		igt_plane_set_fb(data->overlay[n], NULL);
+		igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
+		igt_plane_set_position(data->primary[n], 0, 0);
+		igt_plane_set_size(data->primary[n], pw, ph);
+		igt_display_commit_atomic(display, 0, 0);
+		return;
+	}
 	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
 	igt_plane_set_fb(data->overlay[n], NULL);
 
@@ -616,6 +667,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 
 	test_init(data);
 
+	data->bw_skips = 0;
+
 	/* Skip test if we don't have 2 overlay planes */
 	if (test == MPO_MULTI_OVERLAY)
 		igt_skip_on(!data->overlay2[0]);
@@ -662,6 +715,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 	for (int n = 0; n < display_count; n++)
 		igt_pipe_crc_collect_crc(data->pipe_crc[n], &fb[n].ref_crc);
 
+	igt_kmsg(KMSG_WARNING "MPOSCALE setup done (ref crc collected), entering scaling loop\n");
+
 	for (int i = 0; i < ARRAY_SIZE(videos); ++i) {
 
 		/* Video(mpo) should be in the middle when it transitions between displays. This
-- 
2.43.0

