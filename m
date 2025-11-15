Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9BECEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CD310EC0B;
	Sat, 15 Nov 2025 00:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XQ4MJw7y";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012063.outbound.protection.outlook.com
 [40.93.195.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736BC10EC0B
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkum/tlYXaMLsl8L2Wqq0D4XA01Io+QBzvjqGfBYamImbZe2uWqtlVlUtHsw5XQInxBqrDqENTHWZNrCfKiaItELNi1mczbXC6TsX0xE2grGYIyor9LNl54+uxWMSvbWDWBDPl/t7XZn0p0ByGaK4hHU3saO1Nvyva5Mw7rWmYMVSv01iyhiAIzTJpNl3dcAmcwWZQZIUSrAbilf1bJFAolLisYj6UuxoY+nnd6v1qTUVdtcCaf+5dnFMd4a8/Vhlt5GcDJ/zOBr2shYY7Q1QZqqtFD4+RbpumubVGrNsRWpoNSF47hry18fSA632+kPUQwV4uQpBq2YdwtLVdUSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1JBkLOkD66f8PT80Bavr8g5j0EBogV+/TtMxhWAdhs=;
 b=iQ98qz5ztc2mvJJ2uTLRYD8O6hwJ97uzxI9hrQ9qx3eLqBM8G8QvBLkD85lYTl0pcrEbq5J6OjZ1MGBu5+0IfOJiCy/f+pxVzxV7+y6Y0qp/Ry1JgJgISk00AvJ3sqUvQiuWhnDbqtWia6ee0rR7f0l4EPtykHPDBKLLqN0D6v46xvUdcv4orqNFogmKit6rJnRwaY04sTtFgjB43RBq/uYO1XTg5RpX46uC1tuiWlh4nY4F74USe+ulqmuqEa1aXmrl4xcNmR71RYS0p/IV7Q+nOcNsGgmZ1jHBLX/MoAfvpHr+s3K9BKElWkJ+yA6bap3fKCcR+n8AyOwi3AO9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1JBkLOkD66f8PT80Bavr8g5j0EBogV+/TtMxhWAdhs=;
 b=XQ4MJw7yJEbA/Qoy4GKg0BSACjKd6A4faL7AqrOTxen7Y02Z5MFSaxadGlD5NruGaP67FQP5eFXjUd0uJkX0BY8f3UeBX6zfvZGLKDkDlRMX40EK3vkSj04Gw9cAQY/Nl5e7VEI5Pk/SyyOrtArpL1RUkkrde4DTKNlWS2k+6UI=
Received: from DM6PR13CA0020.namprd13.prod.outlook.com (2603:10b6:5:bc::33) by
 PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:25:06 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::5d) by DM6PR13CA0020.outlook.office365.com
 (2603:10b6:5:bc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.8 via Frontend Transport; Sat,
 15 Nov 2025 00:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:25:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:24:52 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 30/32] tests/kms_colorop: Add a colorop uniqueness subtest
Date: Fri, 14 Nov 2025 17:18:39 -0700
Message-ID: <20251115001841.3563993-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8fd0d4-5e9a-4a50-7cb0-08de23dd6d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3TeVT34L49Hbonc+UDGF1qbqq7MeMYNaTaZ4hmWD5vWYmiOb8Oj2mPy55dS+?=
 =?us-ascii?Q?HgO4sYdcfque5mtfdpDmc/LWU6n3ve1QYASbPylLxyVJ5zCDNNOHtlyoX23x?=
 =?us-ascii?Q?pr9RZ2ybGZNQOHMoBcnNTSsQhuGQNN+OebgmbwaPvlXKZMicaliJ5Pd5bDJY?=
 =?us-ascii?Q?AjybDioH61tkaBV3tEzArsP3veRePUtfzcMb3oS6XOZlNkeq8gCfP46HsQ7d?=
 =?us-ascii?Q?JHQ4ropZcrNjnp7/M5emza5YygJdZscK3zSD01C1ah5+OHEKRzOW1Y7z2T6z?=
 =?us-ascii?Q?iHzsvJ8rDbnl9YTWakD/hwtc0pXrejHSRTOBDStjlt/+2V5uN6DwxtS+SV31?=
 =?us-ascii?Q?xn9FyqT1Bb9lfm81WQa8pAPOSRi7tb6iwBGzK/dkz56LGWdogeFX/9xevU/C?=
 =?us-ascii?Q?ROC6jXTKyxUu5dC3PvNVDqJLYEiuEzQv9SktLofeMkG03o2OuS1UBUxXa43O?=
 =?us-ascii?Q?IyoF0EAM21Vqgb9r8Qzrp21NdrQeCAF1nP5wPkfYEltsqK5uxiFXlOk6NxLg?=
 =?us-ascii?Q?0GMAMBSwcLCW1ty+jk5xJ2OGkZMpPCsaPVoY21yRvJW4dFgtNHGuAFgLys0B?=
 =?us-ascii?Q?towhidObal7ca/jWOgUTRV0EOuyKKjs2DOp1r+NuJ6SCrdNwua1J7tG1mgaF?=
 =?us-ascii?Q?2eJd+BpT7Pv/3ce4mZHem+DuXIgmsi7XAfRgcUCWLhiVnBkwbxcEen2syuu/?=
 =?us-ascii?Q?TceLw5LiaZ0OISa3j4/yea7TlIbjrnUtIr9jlOxfWjRIL1s0O5kA/qG5FLGS?=
 =?us-ascii?Q?8RqlTvi8afIkoTOfbXmYDnACjKRSlEoUnkQdG+sKwiJnbgwgqnUGUdZUopAR?=
 =?us-ascii?Q?DOAWRfXCKXINTwoEP1aw7baVD28ZeZTBkq73LLxQAAcVMGQNhu0i273nPpCU?=
 =?us-ascii?Q?MkNXcnu8Hzbk/sXiOqwQO1tW89SwhHzsJjKToO8xHJaLZaAuXDe0kcDhL6Rm?=
 =?us-ascii?Q?RcDEH495kgYQP+hBAOm6fNFWrImIYE23jzm80sqSAkgg9SBM0ztSDoqChbym?=
 =?us-ascii?Q?bNaeat+3bd0lIaa/p4iK+xojVQarpAuic8DDC66fDGdVHSyU6fT1RCrUKfHl?=
 =?us-ascii?Q?RsMFx92MabKEwpUNOpB38PwKkQdfsOyVXbmQ4TnHG06gaefgx5Q54O5Wcjho?=
 =?us-ascii?Q?etEeJrp1wacy5rXYOoIs7prjQyyFxtQpz8goxQ0HnmM7hl5DIztLvJm0nHtx?=
 =?us-ascii?Q?nViu74QlgKtV/3qbq5W5BBmcRXy2y40ThIGDF2405rnq8ZE9kT0bnw6IcW5t?=
 =?us-ascii?Q?Vf9TQVObd/TJ9+u6zMifukPkVACys+1aMox8XGw3+CDCfh6PcWKKG7oes4J7?=
 =?us-ascii?Q?oB5tBWU2DX/ftnWkkd0B2mmBoU2o+xmdt3JFuP2z2ihWoz6VxpvPP+YJGxOu?=
 =?us-ascii?Q?DBoQVvwvg7w3hbVVD8LgZqsxefj2EgUIjkiRExxCw5QYNKickxej2uoOVA+n?=
 =?us-ascii?Q?rDY51jbJIl9GOqCEnx5gROmlLfNnKCQNVxgEpyoOyFRQlOei3INFxApTX/Dr?=
 =?us-ascii?Q?0ChC3eto1OpdcWF14B9WFulgYSm6mWhd7Giic0H8yj5bj4XVULGxoApXCfPI?=
 =?us-ascii?Q?C2zt/FBrnOml+pPZ6BA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:25:05.7003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8fd0d4-5e9a-4a50-7cb0-08de23dd6d11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959
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

A colorop should have unique ID.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_colorop.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index a0c016d10..da4710b07 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -8,11 +8,16 @@
 #include "sw_sync.h"
 #include "kms_colorop.h"
 
+#include <glib.h>
+
 /**
  * TEST: kms colorop
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
+ * SUBTEST: check_plane_colorop_ids
+ * Description: Verify that all igt_colorop_t IDs are unique across planes
+ *
  * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
@@ -486,6 +491,47 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
 }
 
+static void check_plane_colorop_ids(igt_display_t *display)
+{
+	igt_plane_t *plane;
+	int colorop_idx;
+	igt_colorop_t *next;
+	int prop_val = 0, pipe = 0;
+
+	/* Use hash tables to track drm_planes and unique IDs */
+	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
+	GHashTable *id_set = g_hash_table_new(g_direct_hash, g_direct_equal);
+
+	for_each_pipe(display, pipe) {
+		for_each_plane_on_pipe(display, pipe, plane) {
+			/* Skip when a drm_plane is already scanned */
+			if (g_hash_table_contains(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id)))
+				continue;
+
+			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
+
+			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
+				next = plane->color_pipelines[colorop_idx];
+				while (next) {
+					/* Check if the ID already exists in the set */
+					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
+						igt_fail_on_f(true, "Duplicate colorop ID %u found on plane %d\n",
+						next->id, plane->drm_plane->plane_id);
+					}
+
+					g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
+					prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
+					next = igt_find_colorop(display, prop_val);
+				}
+			}
+		}
+	}
+
+	g_hash_table_destroy(id_set);
+	g_hash_table_destroy(plane_set);
+	igt_info("All igt_colorop_t IDs are unique across planes\n");
+}
+
 static int opt_handler(int option, int option_index, void *_data)
 {
 	switch (option) {
@@ -577,6 +623,10 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_require(display.is_atomic);
 	}
 
+	igt_subtest_f("check_plane_colorop_ids") {
+		check_plane_colorop_ids(&display);
+	}
+
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
-- 
2.43.0

