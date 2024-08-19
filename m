Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8A5C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0E10E442;
	Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRmVSjx5";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3410E3EE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ5xpV+yp0TNs29NQLr0+taJuzaqFa0P5aVnTm2OPWUcA81OWHbDh0eJrMd0aT6rtMsXXbCRSzgCyul7Z27VcHygUwPgTyqEDdwWJ7CvE3cPKFSQS5fs9PW9QykoXWL8r3OYsZ0MLlEYI59ZKYtsWqQVzm/1H8AZFgnXXRbmOzTSwkhgH1IfeUpF07c3/H/vrhvRu8+/ttRIau3fxh1J90k/MKHBB5EUr00xjT0OZRzT4WPpK1WW5f5AvZ7OMMBbT8JUze10ETnNeqc54YvMw3bzX1NFlcbmA12bKskQXbyqmqiI6tX+T3R0tm/e7/AFMFcMQLi13TqqkPwuj4r61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWiFpJ7BgWP9sXtFgaCWteXh+FGUWNiV3RC7hrgh/nI=;
 b=yDRXorcTcIbaOncm2a4UdbtBQOqumKU4DI5qakoxCQHEjy48jLJ9LcCZmT28NQZk+NxA4olgB3WCL8gnus2Xmfn7eZwJIsH3bNajx41mTjoLAXks+D5suwadiTSoc4R0xO9ci97gnNAZwhqP/a1P0RGoc2Iqh/S+tX0DuUkyDswaAKQSDzfnbKO2l2Yghg7Po7rum2LkbDDoXi+Vd+Z5NV6tqHatMz+ymdx0unMX3Nrll73F5Hus91QcjPropYUzEVvvIGcuL5iE68izauE/FrXG0I4CWb9wdbVB7+oaCmQheN/IZNIJOqpCJrre/RPzgaDkJG6XpnM+pV6p6G5uQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWiFpJ7BgWP9sXtFgaCWteXh+FGUWNiV3RC7hrgh/nI=;
 b=WRmVSjx5Ts8H4V+7eFGQ9HWHxeVkfaWcqViQwVt3yYj6H82jW3hTrUzDXRowpaL9+wEmxN7TWdGwTaATUTPiohnBoZHjPX+UE1iYEggYj5l89b406KgUClCq8V4ZxpMohH/RkfXnB7Dy5MSaoggdIUEVB2+Dwyj6diiyO1quSFY=
Received: from CH0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:610:b1::32)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:39 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::b4) by CH0PR13CA0027.outlook.office365.com
 (2603:10b6:610:b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 20/37] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Mon, 19 Aug 2024 16:58:06 -0400
Message-ID: <20240819205823.316656-21-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fdb054-83d6-45a5-2e86-08dcc091b35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWjbH2wH6M9zBqQNa6bFYyWPuCsSz2tUCuVhivSHS2I7sUjgBnx6jIP5SjYl?=
 =?us-ascii?Q?POawleBgnraL6LYXNV0qi8HaThgLZNQODk20j0/XtC7D8uBypp/IamvhOn5O?=
 =?us-ascii?Q?aXvSqyua15Kt1Py9y6GMsfIGS9m+Vc59gquvt3qAINu4hKKCI1S/yl7frnMf?=
 =?us-ascii?Q?BjwebfscW44xrsTchOl60dAZ6tPamhiRti1Saj7gdPDIgzzy0GHicu6j2LBR?=
 =?us-ascii?Q?Qb46285xeNj6e4FqjDeIvYtcOfitjE45sd3OSfav+qO1hcPAgtWkXCkvgIQn?=
 =?us-ascii?Q?kKXghLg9c4WmY7i/91pjYN3seEfxwRD66aPc9hg/dRrLs1+LRvjFYjgVs6O0?=
 =?us-ascii?Q?CtYWD22uXjzt6xAIpF7yDfrfKPqKclvQk5vLr+8/jUKdYXPpQRBKQJGP7KJ1?=
 =?us-ascii?Q?W0xvlfzJrEFCCksCSqWfzsSEvnSfqtJC04Ak/W2coxUbVOYUA8hf61qN8rtL?=
 =?us-ascii?Q?wz9jVKZam0K8tsmqQ7+hHpE2+vWN7V13KNChF/xr2Q7KfQBLbUlOcgaI2BeJ?=
 =?us-ascii?Q?8onGv2vMPLBQAAI9eYmMlbWkjmSl8UOUMZChnfj9XMbSju6WR2IZa++v5wb4?=
 =?us-ascii?Q?i+24I8WFCz/nORuZE6GCJt66KE9y0JroknxFH5H29kB/28i8z3J+9KMHsOsc?=
 =?us-ascii?Q?rGY2ueh3UArYazet2p88+Ah5ljPXenDAA77I2LcnnYc6HhM4SZMQOgRFcniI?=
 =?us-ascii?Q?QrTC80+8bm+bAo6E8XQfRvTaDMYTNIJPDgo5aODR/fv33UDlcNZ7q15OZyTM?=
 =?us-ascii?Q?dlkmWNKMYH+qIu8cB5BZ4+hzSmYT36Tzh4BUgotlhOVcsM63mdhY+4SSbRGx?=
 =?us-ascii?Q?sjiCur3tVlrFhQPkJQ5wQ96jtc9mpk/lQvobC/kc0slBTcvjUuKcjPbZ90Hf?=
 =?us-ascii?Q?ZGkvVSm91yFVEML/1v4DGE5eCC5croaczze5INoDWDHGDm0H+4X3mS4SIErj?=
 =?us-ascii?Q?Uea5RjnlWUptippMF/RFkfLqDfIeihFNoVXPAPDYG6sOQ3GMw7TxdcgcIHZE?=
 =?us-ascii?Q?Z3SLt8UJhZJ01P2WQ6D1QGsnsU/FvGEtapzGzFchgjSxaf/NMBdpk9zmK+jK?=
 =?us-ascii?Q?v/a7ojeBixcL/nFL7zWyemvgQIfDPiWgqDVV2ChDOvm5UQeBM6m+5r0vxHU1?=
 =?us-ascii?Q?iYDJ+26+IYhOxOLT6YkmV1zJSgMTIUgAtAjBrEgXTPSTDEdaOff64LsWDvgL?=
 =?us-ascii?Q?CjDjpiMAT3KIUyY1V1Ck5vfhgBlGKKnkwKz3zikqxDd/6fqB5bogxCVGjp0S?=
 =?us-ascii?Q?CWr0C4mx5xAqVaXtN+I73nIrED26LXD6IT4yU0kYypg4vjy9bdSlBRdQMHQw?=
 =?us-ascii?Q?2ATXWfVFx/Si5hzfCjfuCPqxVUpuWJzMSBuxicWOqoC3hw9O37HObTq/N1CA?=
 =?us-ascii?Q?3ZVUtXxanK1wPDUjBI65EawQcPyjZR+wXO1AEXsM2CPVAaxnDaACn2QQh1P3?=
 =?us-ascii?Q?yA80kG4mtfrzm36rlOwPwPx0SaqQ652v?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:39.0653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fdb054-83d6-45a5-2e86-08dcc091b35a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162
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

The function is able to handle any non-planar format. It's been
tested for XRGB8888 and XRGB2101010 so far but should work
for a wider range of formats.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1e0bad1b82a8..555642c9d9d4 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2166,10 +2166,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
 	if (src->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (src->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
 			    src->modifier, fb);
 
-- 
2.46.0

