Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7B2FED9E7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EE010E6E8;
	Tue, 17 Mar 2026 16:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mrjilRvI";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1156710E6DB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rq+ryMXG+SnaWy0STIligNMNfB20Fe2Yp50rZRYQEsc6qlkKNNinvnNx1mih1zZo+lt+qpXQxoaF90qpLsCSzNxE8mXDVbaOZc6uCSiG1uvMEC+3ZdKr2yOv5+sACGgY5KQbuimIpYTWLMjd3R/ZD0p2iGD1vlYL7nQWcMQ9C+I3ud8IyrDaQ8MWppeAGKLK7iTDbgPKXqfeZ3nOX8dw7WVm2T8FUAS/B3X2JG2S6kxxpRVV/jzNIgSUZgDfUhjKInJsc4rikfWo+9S3vldGO/wreBcakyyizuPqywL7Xrc7JA3mHe7tF7+H2g9dHeZJYXMOgOFtsMsTmLOWFhnsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRefzgy/iuFb7tXVbyW3NkxJ62ywcBVmPmhatZgA71g=;
 b=OGsWsEHaFgWkZ0W5FnoeyAVRV4yAxxXrZUwhOir3LcRL4cDoGmGYs9ady/4ZF6SAsWoOzGSrpmjRDj3NPNYC3K9wO5aTjqwfC66PkFl+ZC9QZGsugD21jLDsBqr3evrMbL7WNuBq4OFAD0U3xph4U2afCz7w1Fwpuy8BTKXv9ndn8QX5QbBQHO+rpnzPPEBLZt/gEj10/+ySbzSwCCFcYb40m+cFSmsywMqkec1tbW9zJgYaIuOk075ObLpDJ2PjlySJntK73vyDYA70BmUqHteAqNiAQ6kkMaEAzjE6FJXFWQURUrPjg2apRaSqkFvectvyrvwiHPG/2FnSNEDOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRefzgy/iuFb7tXVbyW3NkxJ62ywcBVmPmhatZgA71g=;
 b=mrjilRvIyns/l8dpGqEn8dz88jVCzji4OJ+Hn8xX3ofIM0tqOvQsL2/d+OEf0VHdEngu4jcmAnOEyJi/7zxqhkA4Jcu+lXtYacpEHTw/4C+ZZtu8a3X6ImSFsQtMwjc0Ny+DOg2uls7ba3W2qJCGPS7S2fUP66bdFzNP35X8T6M=
Received: from SJ0PR05CA0111.namprd05.prod.outlook.com (2603:10b6:a03:334::26)
 by PH7PR12MB6394.namprd12.prod.outlook.com (2603:10b6:510:1fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 16:04:56 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::b6) by SJ0PR05CA0111.outlook.office365.com
 (2603:10b6:a03:334::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 16:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:48 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 03/10] lib/igt_fb: Add YUV color pattern framebuffer
 support
Date: Tue, 17 Mar 2026 12:04:29 -0400
Message-ID: <20260317160443.229812-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|PH7PR12MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8f4c87-cc0d-4689-e2bc-08de843eeef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: a72Ru2WFGE9jTYd8hIR4h3FyNqA+vZRk5E6w9b3Qs0rdNdOi63Uuj6MdJGuB1a3t06FCOwUkkA7898YfgryoeyN+kk7RxGWEvnRV3H5DqKMB4FWNJKgQHL7yuDuFS/A0hSm7MeYO9ZPc7XSKc4U5P42mDFWCi/F/+oNPAj1+qnIGGSYOiU3gq55GC861FG+TEe382tV4wBPpnL5pEM2PcK+1Ev7FF+9NsdyGEuwZa+EZ4zMOobrVl7/M4pyxFm4PTLFsxSvqK0inyk5IHCgo1tYUZDnYJlTcDzXzlE8Uz0XMxmEpCgybjVvtX35UjCVhlc84fOIRakvUtsoUGtd4AvqXL9HPLIncPkrvlZo+DNDmBfwu0sXAAvHOkHFUP5dvebCl0U4eI88fCPpDCBl6LNRLpVKFwywemazra1zFs5YWlms2+MxGRT1hi52iHGazj0yxYhUoUDqPBgT+5PY0DVIN+Z6QvxB5oHYp7pDx5KEN5EUeXjHUEw/mSL++E9oI+D+GiBXqqPRlzaTZWf8TJkFDFnfpqHs0gEwqN1lUjGBGEpv8KZnuS5fBA6T2szv7z7RX/0rckZP5fgnZgqFukTWXU+9vou1vDSfe5pKx62wu6LtsFletvUPcVijJi73Q9xuuY2RZ9TmRTJ2LWWQu1eWWH/0cXzzOPN/ZEw+2d5A2cGbOxwPeuabn6L/92kpYxi4/XT9AQ0lB/FFTDGMFqpyjBVPJ8fwqVZ4A0NYURimVXSRT1KxkYBwTVMOeBYgGXmFx1n6QsgUQksVVjxSwcg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8P3iBk6+g145BFlQ6MmV4pIKGf6RE5Zti9kBhctssy4N/g6knuAV/gfPx8dRgZvdoLuK14TypBwGRBIdcW6+V3BTo+iEzbcv+gTud5/BNzBbTVKMsf5zk1pjzKRzBXmslxAuuxjPTLZDY0O5GvsXdQ9O8vKRYAVmEP3eY33FuaqGDM8+nZFWsazeQgbIHa8PM37xjKMnomu4CTXAWqdeqtKnSoCzzr/c2tYa9nXkaTMUoucJx1z1mcDFlBlfJcpGctpYixBL3BmI60fBmNQcqidnrY6AjfcN5fH2drcgjgSL9n0dcDV9Fdq7xPk9/dcIx0B1QOgCVufHAtIwWjiHisq6V8PHWE2F/DOYNY0trUt/8QANYDoFcVKV9qYcWWPVfaJfAz+JSQFUCQ2GNgMAW4F9035uI0tB8Fr4rqzL0tvWsGrU5alflffd/JUBgrpP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:56.3992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8f4c87-cc0d-4689-e2bc-08de843eeef5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6394
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

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  6 ++++++
 2 files changed, 50 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d59fe133b320..0f711af33950 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2367,6 +2367,50 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
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
+ * Compared to igt_create_color_pattern_fb(), this function supports explicit
+ * control of color encoding and range for YUV formats.
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
2.53.0

