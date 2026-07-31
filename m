Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9322EC5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4134210F382;
	Fri, 31 Jul 2026 18:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="go4K0CqX";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BB910F382
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhwyFKhnbU6vUHCuH5kMkZtiBw8FhLEx90W3+2cX1tUUeW6NLLUjrKgoJsG1WzydN8qOWGFdbhEhaKIV6yFErWXjrDOkoJQVv3BKDl1DY5UW9g2xDTd1ExA2vJh5PBG6IoYJvpVWe+L2glEz/5WfqmIpxhh5O8FV2zvAkpJ47AVBTNWcPocSXbJqlL5P4UFAcuMUw6JWWHyt03AMSwAeI3E3MY++KLbaKtYIuETI3peiodcS4+aa9RsLFgjqER4ugCxdQmtDpMOM+P9kATrKOZBL83cb1fT4UQaOGgzqA97npesWhsG5R9GXTFWmULg20GKYuC6iWcz7Si+3mfGcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4yeG4eI8G0a7Vx2F6nkE3e6HttaxiQ2PuhcBFC994M=;
 b=Y2zwalxhl1/BQv0EDGG1K3XZeDH1QPq0nrwL2X1C1dfx12goeNnaQA+2a1pXFq1L3OCcNBRVApgl7wcJZuJ7kihFQ52bad89/ziyqu4rfntp1nIOC/rpem2ZBSVjSMKJWxc37TqYtqxMgEL3h4VW8ZROsPlM08BQpaRY1LL+AgKvwTlccI0FI8fX0/S8Kgvmbwg3dyE7v/aUQtY0c9OU2eYCULE8I14VYWQzP42iZYH5/XuxEYhpJb+RyvApSNdhofAhyaGv5C3CgULleMxB4HiZ7oCNKox20MuuixrFljbPA9eNpLB3P5lPjexSrAIB48fgoHanKjJLykimC+Xbew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4yeG4eI8G0a7Vx2F6nkE3e6HttaxiQ2PuhcBFC994M=;
 b=go4K0CqXlQXLemRoqthqpx/NUs3dJzC4NNsBmZ430auCfb2K33M3gds3vJyCpitTVLii9emi5+aX2yhbB1d+RD8U3vmoas7CS4YEhk0ZmDMrXvYKu1dB9PBvgqvHalmC3FY4YnhcPt/hmx2e9qjAQkIGtn+fmsdo831716huQmM=
Received: from BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::15)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:12 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::93) by BY1P220CA0019.outlook.office365.com
 (2603:10b6:a03:5c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 18:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:10 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:10 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 04/10] lib/igt_fb: Add YUV color pattern framebuffer support
Date: Fri, 31 Jul 2026 14:01:54 -0400
Message-ID: <20260731180200.668795-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c89a29-6ee5-471a-0585-08deef2dd83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fZedxlZZQAHWIgBPa23QjmKUWymyYJ0XxSEwVwmKIGpDT8bDEeVQQWUEFIQ46l/jFZh2yPBXMVcpPFAHwZdbj10sV379pk0TW23Qdj+Fur09Y1Nr3IlQIHKXU3sJqFXAXtV/gg0bPMFrRqHr5ghlawLrRKFQzX/w9FFQZFHclTMBYjklFce9+w4YKhSSuqEyNGLt33WcOTnAY/mDC1symHpbkNUu0gk6qukeh/7Z8jQYqy7A2wZSaC0A3vdMunulz4I7OtxJP22JVoe8aIAhh/6gZbVXLdquYK5IYjZ0wqDT2H/GsTp/LA6zyf0jjrZdPTzYx/lk6HqKVSsCF2OnUJBdCpb+O7ryaXYxSYwloYYkjDleAZ8QIj+n9Vptlf/+Gop9BJNX18nno+GoHHxT9II0rpJ+LVntoIbdWMgPw1NwNC7DwmSQf+nvcWWQYDk5nDbZfMFelVg7rLcBVP8WzqQhshnZZZagaEQp0T7vIYkSO6Wy9+f7NgaxwcwcPznyJDfA8Ey3+oUqmBGnPhb5pW6ztVJckr83oswG8gE2oR4RDdPMjjiwEDWQQuC2PyIFVun1OvEJDnoYSkXrQO1rXIVm4xuirLz0AEyo99Zg7ZnaHEXa10eiPd7U50i1r8pYgCPv1Y7Hdhm84XRoZ+MH0O77WjoaAZg8CL4Esmy6gRn97avFZK34PTE1hoqRZojb1AI5P8peZ3h0hPLu9nDN1w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pBKOIwfYRD1JBbAitnWI7si3kBtpazrvpQW3qT5KlxHDRKeMe/Ggf4fepiSVdK/OsI46AfmZOLNAPwu98S0h9bGR51ZpnxunA9TKMeuiS2ynFIiJ5HYCtBfBKrGUXeUVG+XtM1cpFHB6gY79XYKqryuUpnlofd14Q8Eee4EenDe52PhuszykeNrfSWQ4DviWdm5bhAVb4zXjmsuMZsmjEPZIotnLI9qOy0OmhDmnNsxDanwCqaB2+/1+UFZ1IP0zsnq4ifJslc1W5tZ3Cja/0WTHT1tltcqUy4zbAt9B1MLWbyuNW0BK+oJDidsOtCdsTH7/uimrmdQvD+3LBmw9rto76jP63HkheBjMfYXeCjgY9MtjIAnGaaxMQU0LDTCR/mSEYdCPeWEv67KhGN1/JW+xcpYi0IzkDHpbdC2nCjRrqP0cH+5KZOjwPAYVTkvB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:11.2338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c89a29-6ee5-471a-0585-08deef2dd83a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
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
Reviewed-by: Alex Hung <alex.hung@amd.com>
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
2.55.0

