Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273AFC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C3C10E6AC;
	Wed, 30 Apr 2025 01:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KQO2v/wO";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716C10E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/6YU7bKLhSecP9ug6dlug4ysMzuedu4Fb47qmN2Yc2rdcH78rhulqUll4642VRGrgi2PkjP5ubIWTq1nstmwoDugMHZTBeMUZ0NZtMrCWJ3+yexh5VaKUCQ7V2sieLTAEns0YlB/ljITqXjH7RbSsAlGKsaVORiMzQUDqfQFAdFPnvbUer2obXbjGADsjNsG+lUOXPwn/LEcv8OIrKuRAX/eSgNZlECOB0k238yuHz2dd93/nRaMArOAWOnhdvkTdySmw2JVOdeOkGNXMPuO/wIJLnqmYCzvZ/BcYupyphxU7XbM+UlhMEr9j+N2npjkg8mwrJFxEn/at3I+xgTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQvnx+It+svnTZ6m/vkD32jOb9TeMuOfjdSsV851Ypg=;
 b=aG4/z5mb7U19+Temuqdb9xA4+fisL8Reyel5Gd/AiVEfrrSd0Op9iiVM0kPKk2MlMRX23WJKzrXWpo8tYmHqhW0N0svVgOWD2+VdC1L50FbSK7jSa93EnIoTth40AXebrcRV0ZjiC7ZzPmk/8ksvjYdjDkwcW6dDoaXRZXOMezo44U6En7SMY4Ddag9MIsUTdLy1TqcMkKL/ez0iT6FMd05AFfPocywZfqZ72G8Clrmq+bLFdYKB940qHKpW1NGqbSGzM1WdEpVQe2Bxc+Cm3Se3grBAIEBjupte2TdomaYNG+x82KJgBvqeagtZIqwwHnARYV9DWASP4t4MeX2zjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQvnx+It+svnTZ6m/vkD32jOb9TeMuOfjdSsV851Ypg=;
 b=KQO2v/wOnImHsGvds2tAIOEx6ckfyg2in1w+/QaMynv2TkcvlMfCJZcVWyEK5IlYopR2YgqcZx5nNAOaP0wUdktW0uRRo/smbAOY/sBhKbsVrNKeG+zQjYmdAzq3xc3Pp1mMPI+kya2Z95IfT7E7HlsAT88FKUAVS8qkg/Vp1XA=
Received: from MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::17)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:37:50 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::72) by MW4P220CA0012.outlook.office365.com
 (2603:10b6:303:115::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:37:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:37:47 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 12/36] lib/igt_fb: Add copy_fb function
Date: Tue, 29 Apr 2025 19:34:30 -0600
Message-ID: <20250430013454.226910-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6fa93e-383e-4860-cdee-08dd87879dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1zaHA5rKVlMtrNgmPMqGi/e+oo7jmIF3rfu7vKqxCnnCjf58fZamUy626xt+?=
 =?us-ascii?Q?OcGVbDPKay9oAFgQ3X27wiHkk8ySzX+nlqbhglWa0qmMuUxa0QoNNGhfctDA?=
 =?us-ascii?Q?LHNztFClcUorQnt3wG4UHtzkf99bEOq81CioIhErZrI0lXo4QDnraU9UTCh4?=
 =?us-ascii?Q?fYspyc61IQ6a8K2G8k9MIt+hys6fQvCPoQURnXYtVCADV8XOHV9R8yKBBrD9?=
 =?us-ascii?Q?GyjUhAKFwNAH0R9YSXc6AEMW0JW1ZY08XQhUOgO6qSbm8zaf2ivBorXurlfj?=
 =?us-ascii?Q?yI0i+D7YkAD/4tFwIoBvv0SlXMof960X8Xpkxt2rVSIa+AVqMvohJh0YRSFv?=
 =?us-ascii?Q?x4SZbtWuHEDVIr2Oqt3eqtc8r+pVz/5AvIyUBkli0jhybD8VR7X7Un3lyTEG?=
 =?us-ascii?Q?5XNItp6Kb5OP7Sk7DhibeSVA7F5GZrZxijJPQfOXl7fyuTSVznKiOvLGa/yi?=
 =?us-ascii?Q?SyhQDPunGiuCK846E93mm+dykedTWg4wJqECf+hPOjeBo1+DMswZ5N9HaEON?=
 =?us-ascii?Q?AYr75Au0UnWga5WPNmTbC3uyNP33nn233vmJYw2fYSX25W4JGtXIVGUT1arS?=
 =?us-ascii?Q?MGfU5hbZLr70lMJfmIWJiilBleVGouBb0oygPzOy2WOgAMvzC1b/GWadtCus?=
 =?us-ascii?Q?FxURdM3p8lxq4tIUWQRsa6gjR++na7peBBiK2ev95qwgUIa7krPjtLOc+Axr?=
 =?us-ascii?Q?bMdbM2UvTguluc+xrQo9pUXVl2jT6w7yuHwptrsZIPY2QQ+Ntjh2fdKCwCRV?=
 =?us-ascii?Q?L2ZBizcKaFDJUeai/cbZJCb1mB28joK2xEcJVEA6m/756wzAno90YC+ZoKoV?=
 =?us-ascii?Q?3fww1sm+GepPfe2ee4p+zl1yK6z4DDbIGZENgVtZo+cJ1OtPjJQPBOhQU4Re?=
 =?us-ascii?Q?6CL+IO9PcDuWxy7pQCt5UfBFi7sA/WtJgWbFv6VK7A6tv4GTMYvdqHQquBb8?=
 =?us-ascii?Q?s+WFGE3k4i5xbsgBhvQQzdGAmOuYS28FFqazfqY39sU6uVaVPqoZRtcjoZdB?=
 =?us-ascii?Q?OZMCKAIKOe9PMMM34GOD6XmHnDDRtKyhOSx/LMNagQzESglaKmoOp/+/hIGf?=
 =?us-ascii?Q?SCuipgN3jdV/WwDDC4lUAOOQB/DnBastfS+lNqzj1DpBWEcGJbN3kiJNySre?=
 =?us-ascii?Q?4bexlSQs3aFnKeLAo3eAwPpYXgTG72yuhUOvJCno/BMa4Bpue9leFszXWLaR?=
 =?us-ascii?Q?C+jolA5C3J4e/HyP7ik4y4vfcYE1WlFVEAqvciqZwBYiPNiOwbs7mpHhVvxC?=
 =?us-ascii?Q?b4ZW6hZ9yh+Fgx63UWiBB3pUMZg5CQWmZ7RajM2a8kj65E0eCi+ADnmjl/Bd?=
 =?us-ascii?Q?NZSHoqw9C0Dhzu22I0e3MvnAG3FgNO7w4Z7WRaEsQNWp5S86Oh/HSIwAWBAL?=
 =?us-ascii?Q?q32QhPuEF13qDeSdfKXBtgzxlOM5coG+lCKismDt0wehhOkrQlTTa9swcjwy?=
 =?us-ascii?Q?nSg/lLGhk3ZfNbkhSGZ+Q+BP8+fFymXaoQxxVnencgehZ7NTwuKa2aF87sn3?=
 =?us-ascii?Q?dcZtA7B0AO/EwGmdBsZI0pjem+taZyTlOjmh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:37:49.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6fa93e-383e-4860-cdee-08dd87879dc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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
index 45692b170..f2c09de50 100644
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

