Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C9606A32E
	for <igt-dev@archiver.kernel.org>; Sat, 14 Nov 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BO84UuTF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD810E4EF;
	Sat, 14 Nov 2026 02:11:05 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013008.outbound.protection.outlook.com
 [40.93.196.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54410E4EF
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 02:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsXux/PbfwgwxNIhpmi3S1M4YavNsJHgHCf+hoCLgoAQh4yv0IqIO4zPfWfVIvQ4hwZM+K+F25A3V46jl0IrnXHEJQbt9Rp76rJvDLvNOkZvBxBEXzUMI4gt3MlUsZ4d+1HMBZt02kcvRzhYeV5GOz3KR2kmd60v2jsvySaZ2OkMF74RQxCG68BO5VcWgXGvLVO3TyWGFqXPIRsY2bd0CkOdNcRFnA+f/7lXgb8B1vOebGotsX4FCu5AuSeD9uwNN6jiUXqlfDJs5dQbLSYC/wknl800VL3EeDvS2m/tuY/BeSiov8437l9+ipXjcYn+ioicS3O20jUY9XuaOr33CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1EQYhLBKWsIO3QRKuyq7e42IwnLFW42gfFjU1lFWyE=;
 b=iNHZ0jjksxyTNxwx591BRiAlHYpWMn/h4Jsi6EY6jkPPlRPUeiRNodWYj112nKxEVRQyfDfkqRSMyqitzut5q2PHXlOFzZpUGdR7LJ2y7fMvrhJ1HhOo9RftlnGNS8Mhh7NhAntPupU+RjRhuUOdlDkiKr/jOLQdpaoZ5y1YLOIoCgTLHVRPgbOTCDyhuJVixgTfR48lm8e5dvi3ZQdXp5d3OGPscS02rysGi07kE2RxZnCim/kqrMUQxi98NH5aCP6eNVHk48WFHhC+O4ZBPO33alnSt7M+N6scjfOfBAFZBi4f11jD56jw1Vjem3K24U+HpFXmnol5QtoKxL+mQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1EQYhLBKWsIO3QRKuyq7e42IwnLFW42gfFjU1lFWyE=;
 b=BO84UuTFkoVE6MFBG+0iyCwLSvGbMZf4dweabIaCkI9/2SdvETwyTr8Kz4WlQlz9qBlxOuqJiLM1Z9TUfv6maUQ8zHrNuH4p1vkpdgi6GP5Bi0jV8eGBTouBvRH3shGalIPIrqVm3NO3Y9Pn7LCHPwHqND8ydNMc01LGabg7oQE=
Received: from BLAPR03CA0143.namprd03.prod.outlook.com (2603:10b6:208:32e::28)
 by CH2PR12MB4168.namprd12.prod.outlook.com (2603:10b6:610:a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Sat, 14 Nov
 2026 02:07:31 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::4) by BLAPR03CA0143.outlook.office365.com
 (2603:10b6:208:32e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 02:07:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 02:07:30 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 20:07:30 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 3/3] tests/kms_colorop: check writeback formats first
Date: Fri, 13 Nov 2026 20:06:14 -0600
Message-ID: <20261114020614.830491-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114020614.830491-1-alex.hung@amd.com>
References: <20261114020614.830491-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|CH2PR12MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: d17dcd54-1a4e-4396-7d07-08df41f40a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261009223027099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: U3JmkT3pvRGuBIH5bAO4/tAV6hHTva0TZN/n7WX9ROLh1Ke0WtjEyaGhVhUibcpVsb/leu1rGdhwgx+PBND9fGGlL4XwTC2szLadcuW7TMwRtIfOXPnSpM1UBu6ucGLbEUcUL4CsAgMTvQIuzUPBj7i5YY5jO6h96U0PGUTBCXfk6Y8PjPJl/PW4ZWKsy9bYbYLJpBPImGCxH7JJunbR+pvWAP7eqNeEFG9GGusaXK4+cLbQG5J95+CYjtApCih5lfjHODFLTlRY1TgpShbc0bTC9tVCCD5UWMBi2i3ilhKuHMBaWErGt54QmC0HtqSQFuRS0t8V9eSmlzNxQZkja2Qek0AFXoFay4ofXmsC4HizyiuGiVkebpmeLwDw2xUtgfU36UmzlwHresegiRrIkyBN6IdMzXRHY5eGh87NDunoPJ03nPyeilyxPYUCzF+lJlBGHt1uQHbJnaEdsEzmtjjMaLtyiTjHgH3GA0Zne+oHwlB5bb0VQe1z2725aK1K1zni7fZPI8L+0RVvEnYzXpVYB7GXHi7kTDZqJN/9P1l3Nuntlm6UokoYPBL2L6H0ZEEZkaB9BkBkXxkGIqVu3L0M6F98+C3bIiuOdFrr1o/MO0ca7/b1W9rAmtBERxkJVhDi1cOeRbEfQgxIOie2ouvG0nL6J+o/iCpUQ8yE1iLjpYT3GlAZsEJDF6Z8J0q/bS5gcqdx0YsjyR1KXeXOzQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261009223027099003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O3piVE4/wbb1nEQmaQTqV5Y6w0DOIP8txVs+0SBWxcxb24iKN8+O+ZtQLI9zhUEP1L3EQkKLAxCDkIrvmIAeklTSmqbcRgCF758Lf3FY86T3jl45bzc9RcJ88KQ3FYMcdwmKdj/qP8UagDO8j0fO9xdMsPqRNbw7vD1Okvq93JDovVhX5hFpl80OG2F63R7zwhzGjfPiqbSFEwBUc9xJTURSyhTQgRkmq1uQT2Yxd50aI0ygK5ya2aF7jt39DvCprNCQS/dqNGJ07lXq6wfdXicm4EMzmgVuQnovdCht9DV78JwdYM9oSpxg0R4Dk3kETNfbHjSuRzHRfO91nGBDrQpibAs4Y4lg/9YVBjvAqXrWKD6pdM++UrAAevIwXaoExp7Q0/8qfbqrXSNXjXqkHO91W8/WSc06HgfnCUhvjDr6UUe4kLoRiCOK5JmnCPYu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:07:30.9527 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17dcd54-1a4e-4396-7d07-08df41f40a43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4168
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

check_writeback_config() creates an input framebuffer before checking
the writeback connector's format list, then creates an output fb for a
TEST_ONLY commit. kms_writeback_get_output() repeats this for every
CRTC, so an unsupported format still costs one fb per CRTC.

Check the per-connector format list before creating any fb, create the
probe fbs once per connector and reuse them for each CRTC, and move on
to the next CRTC when its primary plane lacks the input format instead
of skipping. Also free the leaked format blob.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 65 ++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 284e08b1c..538fdbb21 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -122,12 +122,13 @@
  *
  */
 
-static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+static igt_crtc_t *check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode, __u32 fourcc_in,
 				    __u32 fourcc_out)
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
+	igt_crtc_t *crtc, *found_crtc = NULL;
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
@@ -141,14 +142,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
-		      "plane doesn't support fourcc format %x\n", fourcc_in);
-
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    fourcc_in, modifier, &input_fb);
-	igt_assert(ret >= 0);
-
 	/* check writeback formats */
 	wb_formats_blob = igt_get_writeback_formats_blob(output);
 	format = wb_formats_blob->data;
@@ -157,23 +150,45 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 		if (fourcc_out == format[i])
 			found_format = true;
 
-	igt_skip_on_f(!found_format,
-		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+	drmModeFreePropertyBlob(wb_formats_blob);
+
+	if (!found_format) {
+		igt_debug("writeback doesn't support fourcc format %x\n", fourcc_out);
+		return NULL;
+	}
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    fourcc_in, modifier, &input_fb);
+	igt_assert(ret >= 0);
 
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+	for_each_crtc(display, crtc) {
+		igt_output_set_crtc(output, crtc);
+
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		if (!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_plane_set_fb(plane, &input_fb);
+		igt_output_set_writeback_fb(output, &output_fb);
+
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_plane_set_fb(plane, NULL);
+
+		if (!ret) {
+			found_crtc = crtc;
+			break;
+		}
+	}
 
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_plane_set_fb(plane, NULL);
 	igt_remove_fb(display->drm_fd, &input_fb);
 	igt_remove_fb(display->drm_fd, &output_fb);
 
-	return !ret;
+	return found_crtc;
 }
 
 typedef struct {
@@ -208,16 +223,12 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for_each_crtc(display, crtc) {
-			igt_output_set_crtc(output,
-					    crtc);
-
-			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
-				igt_debug("Using connector %u:%s on pipe %s\n",
-					  output->config.connector->connector_id,
-					  output->name, igt_crtc_name(crtc));
-				return output;
-			}
+		crtc = check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out);
+		if (crtc) {
+			igt_debug("Using connector %u:%s on pipe %s\n",
+				  output->config.connector->connector_id,
+				  output->name, igt_crtc_name(crtc));
+			return output;
 		}
 
 		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
-- 
2.53.0

