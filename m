Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DD9D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C76310E183;
	Tue, 20 Jan 2026 04:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aLwY/oAS";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012026.outbound.protection.outlook.com
 [40.107.200.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B46A10E183
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l09Orkr373pbDzwEmIXyazzE5hfbmxcoaFQkdOgMLi30BN4yva0bVaWhkQVnYmT+MMrcykBqjv4vqNq07/gK9TT7JhCrgJip9uG62YfdgOlArB+IzLau6qVs1nsdyzqPKIuPy1n/l38tQc+yFUvXfxu69X3T7VfYRZOg66qVs82X5MjJp9F/DlljG8On9li1uYZSwIHRkOevSei7jMxZuN/hGiCmGBbsvLvqgD2eq7phsISy/H8jv2zHRmCY3nVa1x67dcMhz5tw/j1xIuJQ8TVKQRvgS5S4VIEGCRcHgIK2Up6zw8GwWv5OL9v1+/lWjQ9OtjKTxUNynEsUXvbx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYl7kIIq2rypfmhooNnPHcWNqChSLt897PAAFMuyils=;
 b=EpnusycnN+Ox9sP3RzZIdGH/vwf3nq+FBCQgeo8+1s7eRHOYgs+WiZZlHGm+sPlQLtknAopX6EqpvwX2ka8plkNotIthEXoKl/rGiWCHrxlZImtVhbZpur71nYLw6/6uitixaK79tkykMqCi7ANYk1xBV7mSbXoUHiV46PwZa0CYQN9FL2yoYNqJ/xDfmeApsKIVu9A4dOKrxdgEfjufT+G8bO1mUf5Ni0RUR/yyLSTqfkUVZ7UcGd0LRFVyqLyblo8pqVIfy9uGlL9vi1AwvOkqxldanTUJJDf2GoadoanGmyuFkcN8OacnglcX4/s35sWf2bNLN4ktDfNUhfD2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYl7kIIq2rypfmhooNnPHcWNqChSLt897PAAFMuyils=;
 b=aLwY/oAS5q9V+S9XKbkk+z9CyClW0qX9icj2TjEG3FQoKF+JSlh4bfowQpo2e8rqO66nT/PRaGZXYhdC9ehIxyuha5b51WQXZ5CnQLgO+cf+kwtvBZ5WIOXiEImbuySn/BY0M1dGrUFQL3LH147x2hR4zHENN2cHX22RNsCbIEo=
Received: from MN2PR05CA0063.namprd05.prod.outlook.com (2603:10b6:208:236::32)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:47:17 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::9f) by MN2PR05CA0063.outlook.office365.com
 (2603:10b6:208:236::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 04:46:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 04:47:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 22:47:15 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>,
 <suraj.kandpal@intel.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/2][V2] lib/igt_color: Improve fb compare time
Date: Mon, 19 Jan 2026 21:46:46 -0700
Message-ID: <20260120044646.589301-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120044646.589301-1-alex.hung@amd.com>
References: <20260120044646.589301-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: c3527c91-a57d-4d2a-9dea-08de57defce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Kzni4cDWAx2nnRgHp8huH7ieI+2Ug1EVV8MY+TR0dagSZ/S9hz3dCSk1dJa?=
 =?us-ascii?Q?zkZYUsWFYFBVMh2ZqgzU4z97h4op2qVRRIipRn3ckdIHdL8Bg+KQTpCg5ysJ?=
 =?us-ascii?Q?o0FtwwJsm7apJzrXP/bizVbdB0q7v9piNRMcm6OWx+nb88B1JSnpJ9XFPVxT?=
 =?us-ascii?Q?AKO21BozrHQpjWkNmu4l41mNS6G2IbzkSJQzXBhoTCQnLxM/Id99smy5pze+?=
 =?us-ascii?Q?CO0vyH8CLh0LGLWDbLsYGf4ETlgn8BdQC6qczNVdLDBxyn+F41LVOI0BSQbA?=
 =?us-ascii?Q?supQDYeST8awy5D0nqsoiM6GbBA+dopS4fb3WN1Q6oYvmui/VDjpSrkEYfyO?=
 =?us-ascii?Q?YwNWSyzKsV4xkSzkJPDhgi8u6oTxeyofI61xzZNFwLgmLkOYJZC7lj9xGscn?=
 =?us-ascii?Q?Xmw85aVQ5gsHq4QI4njBiBbUXqykadyyozuEd0UTLsFUF0JUA07IT9ZeCLf7?=
 =?us-ascii?Q?KXfYtWxGEJ96g8Nslz/fOB4Sb4nBD60WNumUt85GpEXjpn2tVh3srWVkAbg3?=
 =?us-ascii?Q?pkMCPctUhkAm84AzL/zKLiVKahpElKAbfhTH++WDX6Yh3L5JDkg45vF9kPB3?=
 =?us-ascii?Q?S+sAx+/+87OX1kd+BLypvlYFjQuivykA1dB5qFutCDXsWY2D4T8I3C4Ta7/h?=
 =?us-ascii?Q?92gVTYlxST5HtQeeUoHFK344w43QwEwLA9Jjm9hoZq4jDiXp6vgmLKltiiBI?=
 =?us-ascii?Q?jryAoJ9+Ulnq0dajDVeWiHdiHiVfKsuS9Nq2cW76QoiP6q28qczo6tzDunNx?=
 =?us-ascii?Q?ZwMfz7bxGmdCvkZbxSGkJ1i0R5H4Z0c6KMUxRbBGMCCMKEeFV8fnFFWiYLUa?=
 =?us-ascii?Q?RMc06VuziAcV0CO+ui0A449ninKJOLPvBQALANNBNnonm9vXTkOnpbsxLEF8?=
 =?us-ascii?Q?Hdvw+EBq+e5r0JtvJ2MYcTgsbp3kL2QGSivNTQJRFlbqJJXrsz3XEObt2shF?=
 =?us-ascii?Q?02NDOFg1Ddqt6lM1qLiXH9UfL1gW1L3FKCdPpa+THq1mEfpV/xjFc4i9PJ63?=
 =?us-ascii?Q?t5qTTqO4EgEsAkal9k37oGa0w2bqWMgnOgyPfwrPOP9a5AjvSoucNRET7mG0?=
 =?us-ascii?Q?1enKuO/mNTdpwxnoEXhg9qLWHZ0mx2qiB4ag8b7vhcQCwZtUpGMGi5o5xklz?=
 =?us-ascii?Q?JU+oIqvBgtqX91X/0AZoa6Dtb/QCBGtnHPFPJGmyuGBCi601PJfSWO1fKAiW?=
 =?us-ascii?Q?WCzGJCtWszMFvrqy8HPNCi+6sCXdbYJ9rwdR3/75nU0jgioSGxCre5KSPtSp?=
 =?us-ascii?Q?MBIJLSnw9oZk9bnYlkOJDFG5gjbUOpxLOcgHNofmE67bKYdJOC67pMeLmPaJ?=
 =?us-ascii?Q?I+6xcZ8AO28bYl+cL+pQJuSwQ9f1xCNDOCVghdr5SXuLy/bHicy4bTZLFdUm?=
 =?us-ascii?Q?B7eC4n4rs1hJ8N0A80utwOaJXsOdlwaNIT2jZuVIQJeKeMeej2scPFuZMUDm?=
 =?us-ascii?Q?ceZgYeytFfQ/5lvVOiXnLZqnQfchwI/xWnc0GL/W2CkBt3ADmbcDCU+ocidL?=
 =?us-ascii?Q?FRvBMfM/HWTumI53pzKUbzw1bZHsWmwbQghIeVHNuV1PZdqAGY/8pRWntGQp?=
 =?us-ascii?Q?pPehqoFO7Qsw+zUg4iSmJYeikBvwiLlJFpIK4VmRuoxWapL2g3Dr4WKkE7xp?=
 =?us-ascii?Q?8cuIANyA3q+C+Nd+xeaXKI8+mV7XwMhz+67g8nDHYv9cGxVktxoOJ+v7caoA?=
 =?us-ascii?Q?UvYCeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:47:17.0267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3527c91-a57d-4d2a-9dea-08de57defce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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

Copy the memory to a cached buffer first to avoid slow memory accesses
on dGPU.

This cuts kms_colorop execution time on dGPU from 1 min to 17 seconds.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_color.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 4d94421ba..4a7b20b2b 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -575,15 +575,31 @@ bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t do
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 {
 	uint32_t *ptr1, *ptr2;
+	uint32_t *map1, *map2;
 	uint32_t pixel1, pixel2, i, j;
-	bool matched = true;
+	uint32_t *cached_p1 = NULL, *cached_p2 = NULL;
+	bool result = true;
 
-	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
-	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
+	map1 = ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
+	map2 = ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
 
 	igt_assert(fb1->drm_format == fb2->drm_format);
 	igt_assert(fb1->size == fb2->size);
 
+	/*
+	 * Copy WC memory to cached buffer for faster reads.
+	 * Reading from WC memory is extremely slow so this is important
+	 * on dGPUs where framebuffer mappings are typically Write-Combining.
+	 */
+	cached_p1 = malloc(fb1->size);
+	cached_p2 = malloc(fb2->size);
+	if (cached_p1 && cached_p2) {
+		memcpy(cached_p1, ptr1, fb1->size);
+		memcpy(cached_p2, ptr2, fb2->size);
+		ptr1 = cached_p1;
+		ptr2 = cached_p2;
+	}
+
 	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
 		uint16_t mask = 0xff;
 		uint16_t shift = 8;
@@ -614,15 +630,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
 				igt_info("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
 					 i, j, shift, mask, comp1, comp2, pixel1, pixel2);
-				return false;
+				result = false;
+				goto cleanup;
 			}
 		}
 	}
 
-	igt_fb_unmap_buffer(fb1, ptr1);
-	igt_fb_unmap_buffer(fb2, ptr2);
+	igt_fb_unmap_buffer(fb1, map1);
+	igt_fb_unmap_buffer(fb2, map2);
 
-	return matched;
+cleanup:
+	free(cached_p1);
+	free(cached_p2);
+	return result;
 }
 
 void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
-- 
2.43.0

