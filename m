Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078E4CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A7510EC3A;
	Tue, 23 Jun 2026 18:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5TF1fIKF";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8610EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWev9F15lVY2fpfQQ092zEWAMs/SkgW2Dw9Orp1dSDnpzETHPaRv6qAWq5KbEBw+mxgERrMnjDY0TUWnXQkhQHiT233NuQ4znkq1EOkwsu5QWOYQbmTMDvL6yHRDHnrquLq5wPPqSY13M4EaQUCOj4wGbt2P9GYzuM1eZWVLLYIwkd+gu0TYGuLVparsJ3SUfM8ENU56ZeLo56cpOzvjphQkga8ZcEuXNYg4dUIu5zE1bWrqc2BHx8uLyplak500bJwlf0wXSMH4godCSYAmSi+TJ2UBBI7r/O9dIRveuZL/E293TEPx/JIRdS0sNtp4HRMRR3msvocVMvUFSyofJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHRFnUm/4sWsJwazjifQkbkcND1KpJuftbVdOo9Fjpg=;
 b=lcpZjm86fhjXoxq+jHCusLS/BmNru7q7rPQ80+iPdW4jI3bKm/SRVhRrEtXgRDuUu4ZdXcbLoFA4QI2YzXL+gKe+hLFSvDXMoiu/Fy31vcLzxQg4iOIRAysmzJ6knRRx3hoLTYhSMXjsdf6c8yeUx7bdKwl8Hb1Ysvm71FKSSQKtJI73IshAEvHjeDEK1XQjPA6yw27v0kH3d4qXoI1l+Jd1UuZYBPNFh9jcS3H2PKt3vJRqTiUPtvJVn0Ld6c8Et+ZkV8XBsT7S7v8DGXV+UuP60TtuU9K5ZCVgzjizQcPthAArcP0vOqL676RGA17etgXjydAd82ZFPaNZ9mwQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHRFnUm/4sWsJwazjifQkbkcND1KpJuftbVdOo9Fjpg=;
 b=5TF1fIKFnWVR0ic9Qun7NpfE7XBqJj+dumJuRwcPuj8JcRPmcpz2vWkwV40SPReC1PhMgQSeFmLG9Q0882F+nm0jTbZV6Brd/Ij/NjAOtn+AjRfNNGxgNJ4dzwrLb6pgeodBnam8WezYaP/62fv912APymJXPRUQ38ZRkVE2B9k=
Received: from PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::7)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 17:57:55 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::80) by PH8P221CA0031.outlook.office365.com
 (2603:10b6:510:346::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:48 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 05/12] lib/igt_fb: Add YUV color pattern framebuffer support
Date: Tue, 23 Jun 2026 13:57:30 -0400
Message-ID: <20260623175737.171142-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: befa2eb6-b9c1-461f-8e0d-08ded150f40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8/OAaVt1eFOeyj1r08kk0L5c/vjrXlJobQ5r40OspWdRlowmzoSDdVmab3KPcirerpAY0W4htjlx3Gf2gJHDKrM7oNMctsG0a0DDdykHShMMZuBbzZapCUmwNqB/irLdahHI0J1I8/iBq6x2G+AjpNo2VlNVSBpZmcSxF3+/KN7uGvBQdc1Uh4BeolMMxi5IOn11sEqBkuXOqGIe5eLt5FlNRZiEQ1EVGNlxII5EMRto6Kyp+uQdo1ybRKmaycLB3Tjv/wPyhbpzQ5p6JV+Bdc15n4YpD8bTt3/5D53gKgDKpaGpeoNt58Tqd6APAn2b4g1bPBFJ2eya80reu6Xi4Xe5MzpX5zIsDt1GTwAPv7fi2PxkmkZDi8ge5sIgx10c9DCLWuuRQRh3AOUu+KQiq7u5ffim3fgpg8GKX+tJ84zg7INhi3PZf6rzhXp9RX8oVqAVcPa6vyJmxn8Z6lIdNaT5IlcX4M9kKtredgxpR/iYdbAcc0RrzeqP7l2y5+1cyGWhwY9Ty0pRuhctMY8zw6PhMi42zP+8PY3EMRkQfZoUWrC8Mn9GyNz5k7ruqoeHmGyImh5K8jpNIRj3uf/cOCR7RXnq1hq6xWpHR0wDYzqFu/Q+kZPOLxBWNCuhoo2mURJPIB85le5W9tV5Aex3FcoZ/uUjM9YkaTfKsMKWk4eYzqjwpofzEzREFYfxUMmFup4s524UdQNM/nsHJRI/bg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tr0s3WMyFC+51ip7rOML4ZtoDZgUdspNh+EcjSZXNWbDwtZZ46kR6c5/7pu6wu9kfSXD5pqV5oOsAMqqTqW5FY9gPHi1ZWw2N+BgNI9LXUFDSyJZ8z/xy2oNnZ5evU9oESxl0UW9z7ILVmL8Hzne3IxrVo4zL9ejKWDUf3WGvbZhWaXyPuVgrd6a5MA+eUI4ZMG+ovZaYbc8CepNvyxvRfBgbKUNLulQaMp0R+UzINZB+a2Q/HWI67YlmWKi+xW31eeOeQfDQnEYNt5u4/5LR22XQvXUrlQZjefkZGXJY8c6Y2J3S+6n8i2hweisbGbXglJCre31eLnOkbt3Gtn+wLSZHWc8U64W7pVSVhykDl2nFoaW+jYDi4Nd0PzoVsAYQjYMyCsG6di7DtY2/G2w1ex6txy/34yFSPyHFdAkg6vgeIioM7uijNlZj2pyzTmw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:55.4495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: befa2eb6-b9c1-461f-8e0d-08ded150f40e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700
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

Add igt_create_color_pattern_fb_yuv() function to create test pattern
framebuffers in YUV formats. This extends the existing color pattern
functionality to support YUV testing, handling proper conversion from
RGB test patterns to YUV color spaces with correct encoding and range.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  6 ++++++
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e623b2f64d7c..6c3b9b0b9208 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2403,6 +2403,47 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
 	return fb_id;
 }
 
+/**
+ * igt_create_color_pattern_fb_yuv:
+ * @fd: open drm file descriptor
+ * @width: width of the framebuffer in pixel
+ * @height: height of the framebuffer in pixel
+ * @format: drm fourcc pixel format code
+ * @modifier: tiling layout of the framebuffer
+ * @color_encoding: color encoding for YUV formats (e.g., BT.601, BT.709, BT.2020)
+ * @color_range: color range for YUV formats (limited or full range)
+ * @r: red value to use as background, 0.0 for black, 1.0 for red
+ * @g: green value to use as background, 0.0 for black, 1.0 for green
+ * @b: blue value to use as background, 0.0 for black, 1.0 for blue
+ * @fb: pointer to an #igt_fb structure
+ *
+ * This creates a framebuffer for YUV formats with the specified color encoding
+ * and range. Cairo is used to draw the background color and test pattern, with
+ * automatic RGB to YUV conversion based on the specified encoding and range.
+ *
+ * Returns:
+ * The kms id of the created framebuffer on success or a negative error code on
+ * failure.
+ */
+unsigned int igt_create_color_pattern_fb_yuv(int fd, int width, int height,
+					     uint32_t format, uint64_t modifier,
+					     enum igt_color_encoding color_encoding,
+					     enum igt_color_range color_range,
+					     double r, double g, double b,
+					     struct igt_fb *fb /* out */)
+{
+	unsigned int fb_id;
+
+	fb_id = igt_create_fb_with_bo_size(fd, width, height, format, modifier,
+					   color_encoding, color_range,
+					   fb, 0, 0);
+	igt_assert(fb_id);
+
+	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
+
+	return fb_id;
+}
+
 /**
  * igt_create_image_fb:
  * @drm_fd: open drm file descriptor
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 8e5907dabed4..213e2d77795d 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -153,6 +153,12 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
 					 uint32_t format, uint64_t modifier,
 					 double r, double g, double b,
 					 struct igt_fb *fb /* out */);
+unsigned int igt_create_color_pattern_fb_yuv(int fd, int width, int height,
+					     uint32_t format, uint64_t modifier,
+					     enum igt_color_encoding color_encoding,
+					     enum igt_color_range color_range,
+					     double r, double g, double b,
+					     struct igt_fb *fb /* out */);
 unsigned int igt_create_image_fb(int drm_fd,  int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 const char *filename,
-- 
2.54.0

