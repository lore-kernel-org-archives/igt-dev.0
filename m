Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA84C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A679E10E793;
	Wed, 26 Mar 2025 23:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nzw+hdSc";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF98110E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRgkAcwy3f5mAwNu7SerIIwCDRSjdwC3S1x51MIs4Eacf4QVPIjubij9GkoNOk+zKLV3PENlc0ee5pGgMs+knbmuHLmcPh7aSIah/eeWMNFa84PSiNui9vJi9oX6D2lBOyUmrMzTZkl8FKGO4w1Gn8e+hLFdxJW2QvZtPwfJAfe+/R/ghMBZebVg14pbIfRhN+zLTTZWWeuchv6O7tAeLqcdKCfmC2egkr1I7H2GDot5nXY+yA7wkLk5XUrMlDCl7QRS4EjsclZ5n51aussYRrqOVrrbJHAvjaf+rrLYWyWzCEp3LNFsMG3Dg1n4OFXQSPlqjT1aWhvs/VWOC+C12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5EHwRQTWwuepuD1Vy19GLV73D4Cxbc+H/IC19ytepk=;
 b=vkKPQSSZiHAKzOa23voGoAaPaJqYQ8zZPus3Owt296PtMAWDVSi2FoIgQ5OOakDgOMkU+zG8UlTVzfGxw2uUWpwvKgUnv8eFZEXzteRrVfKG9LxutPxy8W6p1mMx8/GorNypH7zet9nCGvlHYqG81G5zcDiuX1BjTw/cLlSp5Zj7Udn4SdGhwEf6KOmykdCjfz0nFswXYzxhi3u8LjqMbG3Dp0+00ll9O8Vj0S9FtcFvU5ijImroSudFK8gLUhqNZt3Ahqb0fByZLxQ/LeBhRvrm8DT4y6CIN6/pXl/yIco5dz1KGfoo37O/SO6K43jp0wLPnaR5wT8qELdMnyutlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5EHwRQTWwuepuD1Vy19GLV73D4Cxbc+H/IC19ytepk=;
 b=nzw+hdScwqmOcDQG4MpHqglr/387fnCTZrD8gTlQMuIqpouXXieN9CMsMUyZqtyuMMomBvmmCvVxnMrHWvK3B7A8uYeKAwwcOgRgvNlQyQiGHkM8n3VwjhztkLIqlV9azAdmcA/2afxdlyLILY0QMhQff0L4mupOf+peOqfk9WY=
Received: from BL1P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::30)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:41:45 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::38) by BL1P222CA0025.outlook.office365.com
 (2603:10b6:208:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:41:44 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:41:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 11/37] lib/igt_fb: Add copy_fb function
Date: Wed, 26 Mar 2025 17:35:43 -0600
Message-ID: <20250326233609.2980110-12-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e414d8-41e1-4faa-4cf6-08dd6cbfc48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hwg8cv/ypayYb1rSUk8M4pAAMLn0PxRJrJgpQyAIaLxqem/3hsT0SR3ICcPK?=
 =?us-ascii?Q?8Ejvuhoxc3RbGE1p5tC1YdNjj38sJ7qxxTnDH9Y5v+REworU/KGteMvQHici?=
 =?us-ascii?Q?pw0jupDtmynQK6kD7qSgVO6RAGlBygSSBs+49Z3ubqWZ06f2HCvHyn1NZzqz?=
 =?us-ascii?Q?QxiIwsITkoGSShf/QHadPg8xtW3QRxxleYIzqddBuRh9Nt8prD2ozkl3VKwV?=
 =?us-ascii?Q?bR08e/yTGW6w5+j7uFRevtaYFplLSe6Uy3YaYg/zKU9X8RcUp98H12J3YE16?=
 =?us-ascii?Q?v6zBj7CXlOVuG2GcbKGn5YvKyVeyo3EOWcV0y33sQjCGFrLuj3Fl1n/lfa3r?=
 =?us-ascii?Q?4vA870nsTO4+l2B6e1dP1509AvX2Khls6oiPmXQqQ1RQzd38T/iVFy3jIUYV?=
 =?us-ascii?Q?fzbbQO61GqE2btsjUCCly7l9d/JlTGoc3Q0nva1uDSL8cYMcxFCWhUiZzS4n?=
 =?us-ascii?Q?BtpS8fPG8mxcPvQ/osY4NC503nINQolqg3ljHJ/I0czrIu5LkaWbFc3h2wru?=
 =?us-ascii?Q?hin3D6XDcUFtFR1ugIYBeqYdnZqdQNIK3v38TmA9F1+GfvN6aO11hKtKhi5W?=
 =?us-ascii?Q?iYCpJOZ+PgOiAOu85jbDbQu8cXiGDPbMBikRYwc1kTLjngRvnhsPX6EeXLI3?=
 =?us-ascii?Q?NSCjrCq95r5a71LkBSsLWf/Px8rcNw1fQ4WnHG+7qQGuebmOUsXI+/Gy52f7?=
 =?us-ascii?Q?1RHmbZGNa0qZjg7t4dpKd/m6WqbH16hoo9XvBAZ0BUAczwHOIiLMBGsrv6HD?=
 =?us-ascii?Q?bTN3FSCBiMa7yB2dBnEInl1+vkjCnUbxbdwYjs3ZbBg/ijH+Fbbbahg8SPti?=
 =?us-ascii?Q?h+FwljxTvIAJPCNFls0JSRlEYc1PFfGfRZ6QVn0r+8Ghk/UpQFxDpSmAhLVd?=
 =?us-ascii?Q?wc0kCYNhWsYRZWuSBxZCPgBa4AXtWrvCfrhRFpc+JtYeJu2aG6JLW/oqguUS?=
 =?us-ascii?Q?PN6gCy3kEndenixl9A3o5dmuQOEzStohykVkkmAwcPxQ22JNfQIOdI34EfqO?=
 =?us-ascii?Q?SlMl7MkGd8bf6U9olREr//mHaRxu2ze0hILQD//cz03a5jy6j4mYKdIFrfmh?=
 =?us-ascii?Q?Y+OXYObJEFzhJqzjPwGXzeuv1VIsjhUfP1JWqwP+4/lMXaD/APC9o8Iw5s4q?=
 =?us-ascii?Q?XzP1CZpm9sUruIT5AWMEgiHgeE7Fu/69AAd2aq59wG+jNYAh+GTbErgqLxat?=
 =?us-ascii?Q?JjzqvtkLDUeruAalfACCjXqTy5mKZ4p9QMhNb6/QLt9NRFe29KntJgGmkhe8?=
 =?us-ascii?Q?7h7Lz3pk4vxtOBChT/FjGM0sDzsRCJXGfvGyk9IYBiZnN0Nqj1YyAo/IOPnv?=
 =?us-ascii?Q?9RbXp0nEQUzfYAqaJQanOGkZzPmRHiaCG8DwKBirmHfXIOrdy8eLdmPE+fNH?=
 =?us-ascii?Q?AlWi/KtsuTxoSnAa9a07wxxxes5dGTsyCQnEEBoRO6YeUhw9HATIO9v2/yL8?=
 =?us-ascii?Q?ykYlfv9z2LrhFL4ezco8Ip1dPeqnQnY9N4YI0PA62n7JzpYA6i2+zQK9ck3G?=
 =?us-ascii?Q?vZa6rXDEaUN+GBA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:41:44.8248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e414d8-41e1-4faa-4cf6-08dd6cbfc48c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fa35a7793..17d3fa0a9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2170,6 +2170,40 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
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
index fe0bb580c..b2176558b 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.43.0

