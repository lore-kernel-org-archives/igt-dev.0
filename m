Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F24A1061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077BF10E6D2;
	Mon, 30 Mar 2026 15:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4VDNJMOT";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCBF10E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrkoK2BjiW4yYhUM07AFZzkGY10OT8uTpYUGcqpZgiNj+rxGn991Ik3aTnA6Zpl73b9SpSbUUvdYzgMNZe0ErGgkKFkSiQq/23ExMtpx8ojOQJhe/ICP/GkiJ5Q5h0U936oGr+KOkGyo66WbgF0eBgi4aw/4l+Cv873rB/4EoXQJXIcylF4Ky0ui1tconQxFZ8j4d3Pg5qzcw07y8zc5/ivVbXXp/fzX2YBAQOUsrKOd1fgQcg+PvDYAo0Wzm3X7cSGivylDgyfJZb1gyYJ9TrYRBu3uVjXRpwVfdmHmKtyG7a2StFcezJDb4m3/e3GQ0KBrDdJwObMjBUZ8ETxmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYiUBbgCE7ezW0n0CqKsIVSjtzW3gEfAcKQAmIcmDCs=;
 b=GFh67Xu2pJ7itBnbjnjUMiJJtt/vya8wiVYngIZcPhKc94ZHPolRLw8O6i6F+9A0SO8mZRHbUJPYO8+HnXP11X5iTT61z75Euh/00FQMb9X7qXZ2wHj0RyY8BLdS9uLpE/ylIVsINIh+8w784eAHjyYE/677tJ70zVC+h516kLeZI1hl2/L+pRYx1Gwjj8C2qb2nMUFZd2h2RIZrjX8xmhfJLxhQlIkhjOvPOv5U/+nTG2kaYwtAufiB6nv8lSR308lmQhFwKVp04aCMkZeuOgEwm0a1OyIXeVoDH5mmh3uJp1uTUDdOi3JFPcFjJnT8hXsk7iaMEaua8anAAPxBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYiUBbgCE7ezW0n0CqKsIVSjtzW3gEfAcKQAmIcmDCs=;
 b=4VDNJMOTuOtmDEeW5FEs+qceLScfXBRnZNRWIiVKULuPY+UZuhVpWJH2mPH7XEGe141hNWcmPL5GcUPTwIhcpiZTXrfYk5OuHwJYXHr7ZjMD9hv6dqSN1uPMg8tC53NGYCT7lxsaYRkUqq9oBbxb3EyAPfr46jhLuADUCa0oOl0=
Received: from SJ0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:a03:33e::27)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:28 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::38) by SJ0PR03CA0052.outlook.office365.com
 (2603:10b6:a03:33e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 10:35:23 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 04/11] lib/igt_fb: Add YUV color pattern framebuffer
 support
Date: Mon, 30 Mar 2026 11:35:11 -0400
Message-ID: <20260330153518.99898-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb06e69-ba98-449a-9df1-08de8e71f848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: oBSnerCxtW3/ye8tHWwWJM2pQGyH+inEY9lIjsxWuUHzDrqqhNZUwXDUo/9JUXDob3xY8wOpurpKYckDjOJ2AhtOGpZagEEYDoqEo8UrfkAX22yTKkGTdYqUVnT5nVkXsNl7rhJSVDuNyv0aUh9qTqzrlk5ygxZR8cF9lqX/B7k5rwCoQ7R5e7fLiyUiVr8VkEEnwNI4F2gRnTMDj4whq7XnINZw/qMRyyErkib4xH7Is/1hXLg20XrYM/apJVPhPN2PCGh2OEj4s1LwTqq8MAFRYapbRvPWZ9iGi6/KyWMA2ONWnbl+VE4sLLQZI4Zk9OwNrtejRNRufAEgm7k45jlwlfAyPiQCnJb6To38hLHqqOWwZU+NeKAY0gw2tfgwTplEntIBecT7PaNmD/XWY+w88i5NB5ftiWdWQw5jPm816lFwYovyGBl1bQ5jNuvGCcjIdO7dCtzLkE9yUG/6j+bcX9N/8yDVN/cqYinxjeOJXmczk1GxvnoZ8BdP3DkfFdAaOANEWEpvKFBNTg6JeIuqNNUAgkvmh1Es2QaAxtZWPkQUxWv6HrGG4nRblOZ1tly1fdV/NMY/YEnBN4dsStPqQwSXxiHC/ajZHklN1Hs+gXqg1itrWtFxA8ISNR+7Bmgt2v6dFfU6JCKw9lMl7moMaerE3A9m5zxlsAAYEYGgebHNrPWQPja3z4XbTAR/CADp3ewEtlgt2h8ANxUtjYU38lzs9pU2crWLC02J2EuJU67u93GDQoPmqPfXnXze24+YVAq+vkKUnVSOH+HPxA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QjdSR0PuUhPHzt59FET/8eDK73mp7Z8wgdmiSq2aKjUTwg4zt3L707axDXUrHjMYtaxiQBI0NqVZq/h+zn12UmW2wCEaDkdZmx6qImzw4uTHQA9wFDJNp2pZCtma9gKgpING+N+ROCtbVFjJ+DefV3rYDPdViFhXDHXZUFYOGLpj1zXgoq5zF7/+Grx4D5RU+dm63TcZ6Df0sBmYYEMDckcjwvEdhgJfSvsKEVEWAgIfiuOam6avqCUE0waPDxQEtnuaJ4JuofNzRVMAsVddDYmP1ZoSh6je4Z5HcijBAI/mDM/4RI+Lh9XJxeOb05EHA3qVOySMpX+s9cWJKBPtpn4QgDYeq1c5YYWS/RbVX1X28U5eV2EpPhs2PnnOSTwLCbvb06MOvxxsShskTAH+bYs8rfXuRxs8B7FDG+KiA6YE6K998+STdDeLbGns8RH1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:27.9706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb06e69-ba98-449a-9df1-08de8e71f848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407
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
index d59fe133b320..b7d94bf192ef 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2367,6 +2367,47 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
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
2.53.0

