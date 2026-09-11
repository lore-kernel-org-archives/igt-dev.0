Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6B6C88E58
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 14:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D710E002;
	Fri, 11 Sep 2026 14:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d0jhVJrH";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013002.outbound.protection.outlook.com
 [40.107.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460FF10E002
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 14:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOyBEWoeqfmS50sWNAApR+LYoc8JaBM1Hrdzf1/NflUoa/feiLvJ8bV48Q+Iu6H8xH8dFQfTS64Qw1B7lPypDwKs8sXe8LsR4nZUx2as3JiTHlP1OLy5aqpHzx9LCV1Nq0Z98/hq6pxsIlPGFgjnuC1tVIoydMu4sEEK452nlidKZ2j08ntjuJCT6JLf515H0gIibVwxgh+8VjBSWdQpy/zABCriVbTLXOZ/VvARgs6A4d5HQwGc9+r26FsG74KxyIjeTg89ZfWf7EHDZYl9qer1zlxy2KwZ1wZ2bc/Y1RdGOv7H7lZUPh6s0ZOkkBvgZf2nECCBsx+/b9QTnGqi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=795ExWacEaN2fsA8LOaDx62Bhjh0gNBhRU5iRlIyKcg=;
 b=Edt+TM5oV4JGUsConiVlYT74OYAVByD1PV6/9WePz8Owyo7Nx0E650kumIFyUaDlEI5TvLFBCMcebQqigIn2Z1pix2dxXUc3xCWfchT/541m4H3m6UmtPYckhTpHO6XFVmPLtpQuHY2ebE7/8mj98fNpwungv524Ifm8G90gMB4XTRBDiOXTnkjmdc/cxNdJcky8WSJOJQaA5J1U1+nlC3QyRD3fxphXw8LXI36fvsl74NgSXT+KGPxnWj8PGqLzfgrKDAbhN1IF5e4zl1CXMEeEDNVgGLEJ/jLTgH3jyd/0dczl+Ud/Dp/f3LFCzv17bGtakStP7yFNjL+bXsOnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=795ExWacEaN2fsA8LOaDx62Bhjh0gNBhRU5iRlIyKcg=;
 b=d0jhVJrHww3PgyHSbFN784Mr2XeYtFaWJekous40OdyPHQBo+92KeySqcMzNWBo5qv9W7z/fH9FHQz9bWAGnBa/NCkJkpuc7DI+dJRzoxEkG/x2NpCLYrghykt+cjVK7MCfdhVFzVjHFe4r1rkk92Tlam68xtGGZKHSUOB8tJ1A=
Received: from BN0PR08CA0023.namprd08.prod.outlook.com (2603:10b6:408:142::17)
 by DS8PR12MB701141.namprd12.prod.outlook.com (2603:10b6:8:447::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:34:52 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::6b) by BN0PR08CA0023.outlook.office365.com
 (2603:10b6:408:142::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 14:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 14:34:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 09:34:51 -0500
Received: from tony-dev2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 11 Sep 2026 09:34:51 -0500
From: <Haoming.Qi@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Alex.Hung@amd.com>, <sunpeng.li@amd.com>, <IVAN.LIPSKI@amd.com>, Tony Qi
 <Haoming.Qi@amd.com>
Subject: [PATCH] tests/amdgpu/amd_cursor_overlay: skip scaling subtests
 unsupported by hardware
Date: Fri, 11 Sep 2026 10:34:06 -0400
Message-ID: <20260911143406.14452-1-Haoming.Qi@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|DS8PR12MB701141:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ee8be8-1143-4f0e-bbee-08df1011d74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|3023799007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: P4JTDf0FJShJVv//4BnzE9AHOZPCTVK1vumuBUHt+XyeW+cX7inURczdIVv9CAOehT9Jq7K6GX3pOtCpOiKivQDJ1OEHXxMEi14fqMAggXS0vCilf06RNsSw+bRJYsYiLHDE8CNZWYvFY/Y7/Ak8I2a275IzUY1ZifwEpQsxhcrg8gG1PFH3eDAoMpFTMCvoPpB4c780Y0EtiTr6FsnEY3yO1EQUHFaDYEuayDkwTXv1xCwiwzw0jkThH9PqY+9SuIulrc8qpTUuEney3et1iPGic3DIVqRfuXMTyv/P1zuf0KC7DdOd5nCEdqsbUNjsmW4kdNYyF0b9Ak+MqcUTO+kDCOkvHREOo97U8gHTbamwHISXBExaSxVdpJlcSuTdjdVwHjnI56O7Z3Coft8dNoQwvqvPT6QUDcyvnoU9TItJqnnV2ckySs0hdms5WuwviW6oda8XREfwrOScgVrb61SgRAEgJazzeqvx7e+LOO2RlmnziXHvd8O/cp1EdEYUSElpbhY4wHAMoYkyRRu+yajhKaHQnoIh1G5x6iOWCRPyiAN9WZ4lQlLIjB2JnSB8796fAMztFmh59JCrmh5S6aMaDtz4vkydRXJ+C97UhfzHVff79aGkKdNa7uEiw03/M1Hm0n0ns2vIeMHqvg37eYtNemSG4Iry3DcTS897rwMQiRrFzmK2nsFAA+QffjGzzkHbjoHgPWO6mhoE31muLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gbl3WZaAfgUQauCzozEqZRk3pskF9got70jz0pzl67Ia+dGHtBzVYG36EjDI2wSZ6GUJ7V+Okne6CLV3jjt+j7ciRQFtJSWZnzWy1Rfumlvvwqpl5oQ/L7674vPVhMKsYgNB4jvoapg2ZpMv9C2PndX/Q1M6P4NDVKeMNIZAMuqCZTYiSLWVogmT1I/qLp5GDkUkWxCDcQA4J9PhssYagEKo1NrVb4mKoMQaIjempb5MmvQIoNBnoZvO50RdaJ2zbvVdUCCm7g3HKwpIQuG1rw9NmsyNaf2QU7MiluEKtfK1s+duEu2a0/ePlwyCK0cU67ToyICtceXv/oyPAtNM6l6m7uBOYskTclCLo3Uu8RZ/VL3SkF2XYMg8oFkwAzY9JHwUAaj8l4pVpzFdM5I8QTh6n/GYme+ej9zRha+SIAmZQxJSJHMWIQsb6UlDpSxk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:34:52.2265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ee8be8-1143-4f0e-bbee-08df1011d74f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB701141
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

[Why]
test_cursor() creates a downscaled source FB for the TEST_SCALING
subtests (scaling-175, scaling-200, ...) and unconditionally proceeds to
exercise it. Some ASICs impose a source viewport width limit on
downscaling, and whether a given panel trips that limit depends on its
native resolution. When the scaled source width exceeds that limit the
atomic commit is rejected and the subtest FAILs, even though it is
exercising a genuine hardware restriction rather than a defect. The
correct result in that case is SKIP.

[How]
Read the ASIC's downscale source-width limit from the connector's
max_downscale_src_width debugfs file and skip the subtest when the
scaled source width exceeds it. The skip is precise: it triggers only
when the source genuinely exceeds the reported limit, so a real scaling
regression (which fails within the limit) still fails rather than being
masked. When the debugfs file is absent (older kernel) or reports 0, the
limit is treated as unknown/unlimited and the test runs as before.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Tony Qi <Haoming.Qi@amd.com>
---
 tests/amdgpu/amd_cursor_overlay.c | 46 +++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index b130da4ff..166f9b928 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -340,6 +340,30 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 		test_cursor_pos(data, pos[i].x, pos[i].y, flags);
 }
 
+/*
+ * Returns this ASIC's maximum downscale source width (in pixels), as reported
+ * by the connector's max_downscale_src_width debugfs file. Returns 0 when the
+ * limit is unknown (older kernel without the file) or unlimited, in which case
+ * the caller should not skip on it.
+ */
+static int get_max_downscale_src_width(data_t *data)
+{
+	char buf[64];
+	int fd, res, width = 0;
+
+	fd = igt_debugfs_connector_dir(data->drm_fd, data->output->name, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	res = igt_debugfs_simple_read(fd, "max_downscale_src_width", buf, sizeof(buf));
+	close(fd);
+
+	if (res <= 0 || sscanf(buf, "%d", &width) != 1 || width < 0)
+		return 0;
+
+	return width;
+}
+
 static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int scaling_factor)
 {
 	int sw, sh;
@@ -372,9 +396,25 @@ static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int
 					DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &data->quarter_fb);
 
 	/* Create a FB for scaling. */
-	if (flags & TEST_SCALING)
-		igt_create_color_fb(data->drm_fd, (sw * scaling_factor) / 100, (sh * scaling_factor) / 100, DRM_FORMAT_XRGB8888,
-					DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &data->scale_fb);
+	if (flags & TEST_SCALING) {
+		int src_w = (sw * scaling_factor) / 100;
+		int src_h = (sh * scaling_factor) / 100;
+		int max_src_w = get_max_downscale_src_width(data);
+
+		/*
+		 * Skip (don't fail) when this ASIC can't downscale from this
+		 * source width. Only downscaling (source wider than the
+		 * display) is subject to the limit, so the upscaling subtests
+		 * still run and can still catch a real regression.
+		 */
+		igt_skip_on_f(max_src_w && src_w > sw && src_w > max_src_w,
+			      "Source width %d exceeds ASIC downscale limit %d\n",
+			      src_w, max_src_w);
+
+		igt_create_color_fb(data->drm_fd, src_w, src_h, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0,
+				    &data->scale_fb);
+	}
 
 	/*
 	 * Create RGB FB for overlay planes for MAX_PLANES and
-- 
2.53.0

