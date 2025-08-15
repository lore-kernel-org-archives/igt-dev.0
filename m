Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2C3CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B538B10E9A5;
	Fri, 15 Aug 2025 04:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P59KKgBI";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CAF10E9A5
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:08:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCaucqn7kE8Q+5UXwUvQAoCUkw2ZnywlsZYc9DjUThIy22f3+oOuPeVXuxilRxRZbgZR69JcwRD4sJ+Cqmwp7yPvEYmqBvD6fTxV9sI/hFqa7irBuQaYm7sAyqzci8dG/uA2nNOqWzj5s1FGSvB8xAuBVlk6/IIx00juYWbbdUspxbIcMFJQJvYP7vqMS72H5NLRTYFr51Ux8ka9u0R2EY1Cv1DmUp++WqKE6kSyMDTnI5ppMeOCFTFrtNXqWIuB1AcRfdIzwlSM1YT3Kn/00SZI5eM+v0pQ02v3pfUYeGrDYNGb4W0Oip0nrw3uyMJ+EKObBTynBnskO6hg/0OZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no5EzjVkC1YZuWsxCMjwBgca2EuJtbnKUkF3uyw5fUY=;
 b=CqjfFj5JzGxvsN9WDCnbhv3UN6Ohpsw1FEfy/tx0KaiQ2NoBIVqkYp+u3FfelSCsBagHnk/IvkQwtLllSvZJvwBYV/cDrnO+BtXBXiTc2nE06fKrj8AMwDQeA9PLe8/zvoPI7jdVPR9pryIEkkJTMt7g/odUZhZn7GuiStmiL14Wpij/QNx+muxLi7vZPPSp+Zq/b4X/rVja6m0xW8KOqEHkt86jF6oADzmiQzQNHLe8ezrB+zKpI1QYGzp94FJPc5xg8OmMossMKBf8grPAomNBEuyQ8O6BdP2D0DfXh1APMMkla14dsoAJc/GLs2yV5wxSdChD0C3lJB48JKpISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no5EzjVkC1YZuWsxCMjwBgca2EuJtbnKUkF3uyw5fUY=;
 b=P59KKgBIfOEyXw1vZDANXeWpmN4nauUr1dVwhDyS1obgWGn/ppKzYy6FZC0BVP0P9wMmAfjGRGsLBlthhD60XBFSWSMQIK/SOB6jguUunXurWGJEjEbFyDeuR1B6HP02OxSIawBnwtO8EjCyO4QZOrAsEVo/6h9FuwKJ61Vhax4=
Received: from SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:08:39 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::4d) by SJ0PR03CA0080.outlook.office365.com
 (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 04:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:08:39 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:08:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 07/30] lib/igt_fb: Add igt_copy_fb function
Date: Thu, 14 Aug 2025 22:06:36 -0600
Message-ID: <20250815040659.3321102-8-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e4bbaf-0cf6-40e0-25a0-08dddbb16a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oWVUMaC1eChvpA6k8XuXfs1tQ1ADNRwBU898kNVg66Nm2mJLPGVEag1wnoRz?=
 =?us-ascii?Q?unklwy4UvddVLZHIfmlctraLah24p/RIstiitxBRASrhUL7LVoViaQiHi6Le?=
 =?us-ascii?Q?MJpgObdXeswoJUGAhdDRp52Fairb1BhC97sW4FWQhv+e7seZRrne5XIcAm/P?=
 =?us-ascii?Q?dXJqQ5FMb5vZcnc1vJY4EbcaWIO2Xz02IQVVTX6GLOv0mWZiYTIZLWmmoppP?=
 =?us-ascii?Q?EcbGhBYjAKPLGoLdcuRsOGeDezG/Xm+QBS8TZZeOHMZEHlovJl9heAoYQ1r1?=
 =?us-ascii?Q?heKBH5mIKGzhT7rU0ZzUPse0Oj84BAJfcWK5QKuOqvEv4uEtgWKdFeVNN3gM?=
 =?us-ascii?Q?ywVYJ5jgzaqLyVwYiM3swlsKQtlk8aFIDlY84yQLPX4KfjE91wIBBlj5fJi4?=
 =?us-ascii?Q?2bszJJJgq9UehlfgNfiZxbyQ55ksTRpUa/XQUBKM6yfW8jheF5Ukb6SJQQSW?=
 =?us-ascii?Q?7L+4R8bLt/CDxdXSpzvxwoq+mAbCi24fb+/N0/PXSncq5PUjmUWPk76AI24d?=
 =?us-ascii?Q?hUy4hUTFG4V5SNng3sB78IWQZn/AnVAnzqiZH78rMadPxLAGuP88LCRkvLCv?=
 =?us-ascii?Q?/s7gTymw2rHMEtrTOq7h7xktXDoY0fY4gNrHgssre8uC4oYVQ/6e/YtzCOzR?=
 =?us-ascii?Q?8UTlgKjR6G3zDS7fi1//F6e6F0PtSzaMADTvqxDXJyyrRaAvBwb9KZ4wKd2A?=
 =?us-ascii?Q?OLkIi9+NTQi76WMSId6JC823nfYZivho1g35jqhNIVm58emkojPcaYyR64lY?=
 =?us-ascii?Q?1vdp8kLgmfJD/XcWFfGFpQ+F8c2gW8MmmThLCbtFbj4S2Htrc4iOHu7301VB?=
 =?us-ascii?Q?WKmIf7mETsGYmspMD+uAfTUxz+lyFaJqEXl4epxOIZJSYKp0o4PGWVI9ewFI?=
 =?us-ascii?Q?1BEJbWXRNvrgUnaRgscvSv5J59BA71aPrZ6iZzI6NNXOpIblb2K2dBSP0BJP?=
 =?us-ascii?Q?HKJQ9WqWwt8T/jUUph2vrDQLbPyZjpzvrNJ7qAi+tubdUgqesEF+kKfLlPkk?=
 =?us-ascii?Q?8aeJkcsSv+BQr6yiAEarYrDvzMeWpEYZh3xHMMu5Q6Z9KxzAv0ccmxjq8HQJ?=
 =?us-ascii?Q?pOd8kBlZ0ZBYpV2C5Zmse3fcAlpHyt8sJkKNbwkiOYCeylxRgnRG3RtOzeW2?=
 =?us-ascii?Q?sDvFXyyxx4LQIwJU01itQNVRmaBME8Kk/jhx77Rf0Uj4aDd1fcaShLTrqRMY?=
 =?us-ascii?Q?Dq/6Hl92xUfLjaIH7GwM2zNFhU3+BlWCNOCWmYOE62JJA2xm23xpBs7wur0f?=
 =?us-ascii?Q?hEKqPeaCvtvqir8MPN4TTX4bnV9mXhS0ZO3jV5KBurFh+naen1xz5uBiucs1?=
 =?us-ascii?Q?MLgIZwYJWu7vrxsOmOCLiZaWPaIHflryOYsh5leK/gP4AuAFo9XYd90f4u6r?=
 =?us-ascii?Q?QHBCFRMzjsXC3eoMntSEcB/llTZjjLIUexPXhBoqQVuNk3XHY59lscJIXLzu?=
 =?us-ascii?Q?TOGh2Uh3QVY+hmkj0f22m3XA4/zMVgqJsSOyvoUN0ceRBmiBfmCiU01QsA0K?=
 =?us-ascii?Q?PswIwjvx7VGEdvUUfJXZlzEJu3SIm8RTjGgk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:08:39.3430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e4bbaf-0cf6-40e0-25a0-08dddbb16a41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622
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

Add a function to copy fb of DRM_FORMAT_XRGB8888.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 45692b170..8c8436e94 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2170,6 +2170,39 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
+	int fb_id = 0;
+
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
+			      src->modifier, fb);
+
+	/* copy buffer contents */
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

