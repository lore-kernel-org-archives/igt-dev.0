Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDC0C7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 23:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9092610E96B;
	Wed, 18 Jun 2025 23:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xyclob/G";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5510E96B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 23:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgTd76opdP5jt3x5wwGBUeYHDW9t8syhqOQjbNPGnaDgA50BA5BcmYao4AyNh/LLmHGIDLmhZVzfXPO8xvDaYw8U1kkcEQbWY0pR2DJ13hXTh71dE57FjvgV8Ebm0Q/9rXewBoUkHSzEedJRInQTSiPrIlCUUcKKanmuAJQtQ4QR7jwNkQCYdpQT0SnP8F4Xtp5+54PlLzVr9ji3HrDTtHTw4zID82C2n1XeHbRef7Zt0zdNgTaN5zSuusdjY+6kWr3n78WcmzhIqsO0RqyblliiAVpxPELVoj6Tb+ct2VnwwEpPmVgiVnRdAgoHsl/UE8Sj79+TznSmuvXOpnocNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSeNoXgxYjVACY/MQycvnhGBg+GefZGd9Z+T1PA289I=;
 b=vTFX1FT6TdftlHqT7k0Nwdt0gyTqimoQoj2xf0O9vA8ReYDM5VOmkFDf+2tsyjnedDxBDckVXFIXvaPOft2dL3b3KMs2QitVaCBQzpXo5AfuMm8MX5caoleJidGwE83pKImr01SYCt8bVriFHyi0PFanPU4bJw1pfksmGS3xgNJNUl0WHU+OmQaMywaYDj+m+UGL/budh4yuM9ntUAf9zfSaySBxiXNkPBD+a4MZ0smrxhLE9pXBIyJSWWkZWjaN4a1RatY9ouUi4pUfyboxSn8/Jd4ILPtQZJbyqTf4FI54rIGskUspkQ+wm1RiICJB/Rn1MffucZYqSvSHCckhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSeNoXgxYjVACY/MQycvnhGBg+GefZGd9Z+T1PA289I=;
 b=xyclob/GR+h6G8PuHoYugut48ByaDtD8hO8geHsUP06ko01DT/EM3eiwjGmMb9Xnf2sViq9yBvp8XpwEFjukoDaSJ9/26d+mhR9YmWf9UTQXxejddT3eh+s+mdHN+ys3DPI0vARzySL6ity0S9zUDQgAke+B9rG9nLCWDSCYcVc=
Received: from BLAPR05CA0028.namprd05.prod.outlook.com (2603:10b6:208:335::9)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 23:02:15 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::a1) by BLAPR05CA0028.outlook.office365.com
 (2603:10b6:208:335::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.8 via Frontend Transport; Wed,
 18 Jun 2025 23:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 23:02:14 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 18:01:16 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Wed, 18 Jun 2025 17:01:05 -0600
Message-ID: <20250618230105.1721658-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 697ebafa-9f16-4e29-ad74-08ddaebc2a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?59b5joom5ppH8P3ub4NTsmrz2j9LD4OW6RbuFy5QOgMfSPNqXLse2Tl1N1eq?=
 =?us-ascii?Q?ssglfwfgR7gKIqR72vuEZFKgKm/6v5P71SxueZzn1HFeyP4RrL8FEZAryAhO?=
 =?us-ascii?Q?kLQmDuD9xsNTNZ+UbAP+ukVbeh9KtWwwY19dXltkEulPQcSSdTCRUX4CE7KU?=
 =?us-ascii?Q?vBn+2Em2N72ZUPZrPGujgzfen13z2RdA4Q8tRLNW5OwjHtAchZ9hBEOiXISv?=
 =?us-ascii?Q?yLLlqtkae3SUF8PC1AacSnoWQr6d23aFJKI7yKTbBxpuyj4J6VxS3i89owdw?=
 =?us-ascii?Q?30Yue0MIPVDUzK/lhIaO0amyAb6hq+zptFe1twlEfIx4PppZGcDYW4B7Oh7o?=
 =?us-ascii?Q?Qv/Q3tOEWsyvBwKHS9DXdiE9hoX+70ki5nBYNYehPJrGZWm0PC17ooCT3Dyf?=
 =?us-ascii?Q?twA6Seh9qEAtIefrdEk1yS8esJi2mo1JP7M0HxbVZ2treTTv7dH1xURQhcu+?=
 =?us-ascii?Q?iW/7cV4oCxeCXdBFpwcaUQXjHleV21YjevlnEi+VPvbdFxsP4oFA9av/hhem?=
 =?us-ascii?Q?ccaj/RvQlMN/t2dWAZDR9ftjfQ+4DhvzZENO1YiyYjpmEITd1mnkXIjU5oh7?=
 =?us-ascii?Q?gtFZoJUuhmNiMU4nBWMMfr6u58ktcUaQe9x78hdItoO9DfiihxHQ3yg867pR?=
 =?us-ascii?Q?Mqk7Btu1vwCiQKZgUbaLttbbVifLYsbwCCf7raSPZ5wf7nKA03Od/a2mz6VZ?=
 =?us-ascii?Q?n3yW9gN9M0w1EuTMZGWtsd8vB5X0gZ39cyDiycR08gNifLOURzc6rF4WDgV3?=
 =?us-ascii?Q?JjQzPky9pS0+CcIYthseHNqBMyNMQ8vfFEmp8L8jIAVmUEDbKH+eNxMO2r71?=
 =?us-ascii?Q?gs5+93kFosgHhnNgtso4ftGVKBmt5iMhNysn/KU5vQYQE3Z01kNXA+0QkTyZ?=
 =?us-ascii?Q?+fCqDicsnvCw1R1M+30NilpDGi5rs4FXSjOsYC8+t4yAEpgIVPP5RQ3Vr185?=
 =?us-ascii?Q?ysxRRGL6A8Ok531bQCcYl5u7japKcr9UxdDJ2/T3yT2hdrYcThRXshacJpGH?=
 =?us-ascii?Q?XFaQBRMZ3tvRAkgvZ6st3MV3LAHwXyg/etEhxkRUqsi1aCXX1MIqgKtOYB5U?=
 =?us-ascii?Q?Oz6axGMd16t9xfx+fwzl8QJAp7ZTTfW4fkUyofz3h8TM054NN4vNqb5WmHFH?=
 =?us-ascii?Q?BIGxVvJe+A0qI3OfDESgdDsrtoYfRnj10NW5hErEY+WYGtgGcUuIAQbSYqOM?=
 =?us-ascii?Q?pLZ7E1IyDgrELwjhXVA2Zmz0rZPzUyND+Ew3ewNYDBnpPuKJSMIgt7wwNqoV?=
 =?us-ascii?Q?WnEJA/7p3+qYLidibFOG6CSvK858S5xT4ibnlzlf+JnzM/48R4VKPSmVX06I?=
 =?us-ascii?Q?8GnKB13x7Y2KsrmQDR7IKM/zQMqUYYt/GKevRUJ/YzsT2+v/Q0guaCZ4/kvk?=
 =?us-ascii?Q?ibIL8kfPsUgIUMAhZkcZ11d/yXXBQBPSvWatTD2+Kcf8yDWm+IIfHckclZ5u?=
 =?us-ascii?Q?cdhR3ItLnbfMryqF7aVLBW9RTbB2HdQIIYgILYHGImhdwFMLTlFL0RQGzg7O?=
 =?us-ascii?Q?PlrYkr8Ix1lKesUYE22HVITQpKeazVkhCmXf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 23:02:14.0580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697ebafa-9f16-4e29-ad74-08ddaebc2a2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481
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
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d075cc5b6..20c3a32c2 100644
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

