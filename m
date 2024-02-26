Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78D7C54E51
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1358210F296;
	Mon, 26 Feb 2024 21:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bU5l54q8";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C76610F28D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csQTXTJVbxCYmxaVIXh+lzVsttLUxRr9OAVQLARE3fs5pI3peHWIsMUbBob/2TwSvU4yhYBqJXzU4f3QQXB0WTw6e/pmNpqYXWJ/IfkmMs0WwVb1aeRKriK+XK9hbK37GF/LwB/TXtIiNMVIxmY44LYFFjEnABGewHtHQ+VO+9RHKkazGXDIrhLs3J33VnjkDssGVi/wt/exQSzy73L82BAQx1jcNEYH32AdlRA7NkvKySbAJRbbbrOP8YUOl/P30EKXag+RaO49PaXs73CWtueq8uRqWB5zBLhaq8dI3t/32HzqfsQZ7DCvAik6JStqYe2Kj3NIQc1yK2kx3KnaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S8RjwH/XyqB0K9IAyuGI0GI0uNrpqDmfwdgnW9DLNw=;
 b=SezP559+RGgAvF9d2RpkG3/69DdZHgqORWbSmK92d98Z7MtLqZ/K5Ns31lDS8GEb7QHs2LUFHt2ad/gTkbxWqiWHvgXimbTMy5qcRjMZRvlIbfLE/dnFeyV5KyirrfpBcDSMo/H9V54BeSaAmcdxyZHKU/eNc4DuM3dj6UM0vhvgfvXCOWxsFfDpWh3Z1/a20d6ElNYfyBh5GVTQpSXJhELMqEehXIB03TO494+ia0LGXg3PivEDf5/U1ARVHZZPOGDYzM/fyPnYNBAmtkgLM8nELwmi8uACcbHRgRrwKaaVGXMtXV62DMln4gp6+oD4rhQ0LEH4xU1OwEm5uoSuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8RjwH/XyqB0K9IAyuGI0GI0uNrpqDmfwdgnW9DLNw=;
 b=bU5l54q82AcdMC9plr5qcESSYtdZlspa43fwy+IxFfm+5qHRaCljb/QWWYTbpttNa7GEOD9KBYKFaey/XeQ+zur617z+oIRUuwoBxeRxlcfI6c6JwvrjLV6zc7osYCelrpFZIQ4Lau5cEh8ZorPbYqTRLXHqv00+Mn5ZXLHo7ek=
Received: from MN2PR15CA0032.namprd15.prod.outlook.com (2603:10b6:208:1b4::45)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:36 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::3f) by MN2PR15CA0032.outlook.office365.com
 (2603:10b6:208:1b4::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:34 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:34 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 11/32] lib/igt_fb: Add copy_fb function
Date: Mon, 26 Feb 2024 16:13:55 -0500
Message-ID: <20240226211416.100660-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: a7621a08-abc0-489a-69a6-08dc370fef6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QuCnSspJxc0Q1CbdlF1c2eUW3eQV5OG/ssRqjsNV/XGMQxVFaxl8uC1d494yG6VmiAuXu0u5y1/gIvrGT4VfD+YoaDmCErBStGgE8go+vSsUejv4on/44BjGkGpyr9UwMlpm3TW9/FMNbhDaGTzK6NYmuZwuEjXx4FkZ2aw8kxRlFlusH8MjmmX7gWT6duXn6bTPdF6me421qNJ2bPjQBbYfvs8bqiDpANiMiS1kODto5g5VtgErLEEol4QpAVm+O/N3mVMTjgeVuZqdoWJcm1LZ6hnbooPsodzLpORwLOBJPHWS1/ZDds8lOsGF+0ito58Wg3br2exHYt7D+aaA6xXRauNsV4lASkSgGF0DOOXpLzrQSEZ8O66nwWgiNrEjqlW91p2jPnJUVtBfS3Z91RgWOjtOTUxU3vwceS9jXFhDxIKITz0e2BhvwRx4ZbJjORJxMpsFKimhFy1on3BIgAEOMAP6KTbyTn39RKSdZN+YiClEV/0y6u1pH84YzOF1EZ860hupxWXcda5TtdBUXrkgUgl8jyfndvhcissAECho1kodaLR0pudEB5p3xSZk9/Mlm16DN85FeIxszDJpZsz8oHKQ8BnKna6+3QsQStIuqIxVzkgt7765HSnJT5YHupdblrDb9+fm+Lgfa/LyJNUZKXJZTxvuPD0TAbFw9smYq52Lza9fV7kzXJf+7u538F/SccuTLnAVAo7km3EaPVFZEqUtTEbXKwIkGDFkh6YSyItpHn4NNl9jfq2Rgel3
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:36.0326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7621a08-abc0-489a-69a6-08dc370fef6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ee9cd1f353cb..13e9c29b1f3f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2154,6 +2154,40 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
+
+	int fb_id = 0;
+	igt_assert(src);
+
+	/* TODO allow multiple planes */
+	if (src->num_planes != 1)
+		return -EINVAL;
+
+	/* TODO expand for other formats */
+	if (src->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
+	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
+			    src->modifier, fb);
+
+	/* copy buffer contents */
+	/* TODO simplify :D */
+	in_ptr = igt_fb_map_buffer(fb->fd, src);
+	igt_assert(in_ptr);
+	out_ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(out_ptr);
+
+	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);
+
+	igt_fb_unmap_buffer(fb, out_ptr);
+	igt_fb_unmap_buffer(src, in_ptr);
+
+	return fb_id;
+}
+
 /**
  * igt_create_color_fb:
  * @fd: open drm file descriptor
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d2751c0bb772..258a7669e434 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -142,6 +142,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.44.0

