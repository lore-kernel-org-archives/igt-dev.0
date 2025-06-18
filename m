Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39720C7115A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 23:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC2310E973;
	Wed, 18 Jun 2025 23:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EunBNSUg";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BEC10E972
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 23:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNOVdypk+oHhj+8xmbc6Nl8X6VhHd5v0Xs65tP4eynclAnh5wpctnC0IkqAhJxYRRa5e7ImtjrcIgtAB0XnMp724RsHyOcvt/6ooJLd6vMLqoHvHzhKNiRYeOjmmf6mT17ZGHZNOq/lS/Msffy6CwOZpzbmHDh2VqmhZeA2UqF+ySzVGfW/ymzLzXK+4p1SGJJxRUHL15d8xwyKf3KeKHwmumXfHARp/6tt/y1vGdfFp3mBDwVO8fiXnVDeAh1cwBMUTGqif4R/+dUDFCCKLnY8Xf5vVS0A41n14yYpZIegBIR9E3dDzpxOaV5nd4Cdrgjx8eMjHKb5F4zLHBF9mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMENIEP7MEs/p4d30QTNQHe/kO7EHyl3J6/XFzdAIjc=;
 b=zBJbpLQmS0w1RXBWnF0JAjzjhfzSJfnQufG7UIRfeexYUwBmwlksWpgTj68dejgSw0y2uFOysQBs4BR+r4ph5XIcwmkAUQj2Y4Dn9vRPSFMvXq6ZpWTThY8xjd6iYQWj+yMwpA55jzyLUVr0LqPYI5/7/QT6yJVYWljkyNCHt2bUOBqKgqWmju7pIPccl5sFpngseX/+a6oTywg/psxIb3GBkuVeEglL6v8CgTJnF13ckfJ4U2/oNS2FpJ8PR4ihHiPpQJIqyDMDMSdsKAQHxY+n2xlyScsKMFvDhspYmFXxRNXNf9vLyj9VF2S5+vHLtyeEhKl9VBcx9UXCkPqJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMENIEP7MEs/p4d30QTNQHe/kO7EHyl3J6/XFzdAIjc=;
 b=EunBNSUg03WCLMvC/aSLqJI98xWzmKqLQBD7yBb9St5QyR++FHAls8Tjlws/MU9s692ng1zR1xUga0Feo9xZieYxma8tIdMkvjZt8Sm1B2LOaNHi6hu8l2nahDBAOUmgaKZnACQUP77SsQrApCRo7dP0xhh+SuI5AiJk3kXm01k=
Received: from BN9PR03CA0865.namprd03.prod.outlook.com (2603:10b6:408:13d::30)
 by CY8PR12MB7754.namprd12.prod.outlook.com (2603:10b6:930:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 18 Jun
 2025 23:02:43 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::5e) by BN9PR03CA0865.outlook.office365.com
 (2603:10b6:408:13d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 18 Jun 2025 23:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 23:02:42 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 18:02:41 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Wed, 18 Jun 2025 17:02:34 -0600
Message-ID: <20250618230234.1721865-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|CY8PR12MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9a999f-3101-43bc-1095-08ddaebc3b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YzvebWH3vpOK3pph8P1wXTFl2I8vq0FT+7Bo6y3agtcqZ3JzS3Da56TiySZ4?=
 =?us-ascii?Q?QC9Wki/i/KivMgFB+ssBxP+KdiQFfxu226na568XOZaOZpPkeM9G1y+jWNgM?=
 =?us-ascii?Q?Vbjr/AarQzfOHquzXElQF3KLUIZPapKWkjcuE5NSFMft0m871b7mlYl4a/yb?=
 =?us-ascii?Q?hh25jvKGurX8wrj0xckT14dgE/f27TvcIs7SazM+D2Rduw+BjFxByNef6irp?=
 =?us-ascii?Q?2K4j4ZNINZ+TX8OvaG0FY5JWAFpzFeb+JgLa7wWgMoldnD5Kgj29VQY1OQrJ?=
 =?us-ascii?Q?PRZiwZJbl2SFoY7Vz08HbuPG78hmkYJN7sfjdlDfx8Csf92Xl2p8hEItC5ki?=
 =?us-ascii?Q?Hj4/LRIlyNuPMpWNtzdDO6JYfibaka/r11OORdcsVEQIsgP5oSuKh8+/N66U?=
 =?us-ascii?Q?ivH7dV7Q4RHj+RLLOVjzlFDJZb1IhtBCRRvDBHYPxGxAN9VQ8HWINqJYXH/X?=
 =?us-ascii?Q?xjxQyJBy9oaMKn4efS8GdHRWvcBpV12WnhSAxicIm/5Qu+2CJgHdJdVo5aro?=
 =?us-ascii?Q?Wd/OvtVU5WP5lS0YYwV7Ejlj1m+zzVu8+f0bUmMTyOjfZQJa00AWjM9VKrXI?=
 =?us-ascii?Q?7pGmrmbPSzKdYVHRizYZjzcK+mys/r/w9wIzkNBrvaBUHjEpuapNSU9/7tgM?=
 =?us-ascii?Q?lVAqwKZlruIa4R6okEzUl07k23aY2vYYhQDObCjBK8GOs0NHXQkUQ6WDOVvC?=
 =?us-ascii?Q?UgJHpOQTEuKMbPP1m23l6H6Cm41WbRGxoUGRayDWd5lLV2+5MgpJnBfYqPAk?=
 =?us-ascii?Q?MMo39O0IUtJHYmmBLffEywLqaPDEBkZ+nFLm8/ll/nSss8hI6SgziJntLt9p?=
 =?us-ascii?Q?cWVvUBp1mXiYnbRMqE9by+6NanP6LVsyr+jnD/mIlE0c6Z2P1j67l90Pxq9n?=
 =?us-ascii?Q?bv1/l5yAYsm2n/p1QAAvxL9sARdbuRoLvtyHUU71Zy/0IZdzE1I5LDsiRbwE?=
 =?us-ascii?Q?aEPBsrC7E8XHQ5Hl1mqehdlEzX5HXb4TTxEqCjOSaj7zIFlNBN1+0z1UGc4x?=
 =?us-ascii?Q?IVZ7HF6AdOTiGO6UqCUNv6Gjs9AefNjqd4i3YVhZKfeqsH2Uvc/0RQf0jkJ6?=
 =?us-ascii?Q?eAWH2mikd4bzOIo770a3C8oCvLU7lpPma53oSgcU8bt/rI/XeO7MBQRqEFSm?=
 =?us-ascii?Q?VpkFPvqI3Far805CCXFH1IriqTeiNpbShtGczyfvMcDmLgG8wbj9nPoksDPV?=
 =?us-ascii?Q?K6Qto7Vgz0u1HwhfY7a3TnJFhPNKopbAmm2VxmJgX/rYXPabPAEmpJ2u1g72?=
 =?us-ascii?Q?FRdJQnxUjVd0E3ABYTGd0dcctAfelfHsfYoK45eS82lvps1iIlKAEEAc5Ne9?=
 =?us-ascii?Q?7WhYsR4nTzK5hKsJfVgK9RB7hIgg1VKJH2ulGudKuK6RJH8Xi57WrYoZdV+S?=
 =?us-ascii?Q?Gmc3ADyJ27VK3WtVxALTWJQqV2Rcc8idqHZK1pKPr5ksIR4ORwc6kbKG0W2d?=
 =?us-ascii?Q?hNtq6MbliUkZlHTBvbi/NcIG7ZydGsqhOxaYv3EMLbB/WMXvy3rQWGkMvFGK?=
 =?us-ascii?Q?rwJgT/+bxQTkG+XPEL8khF6A0RzNRqfL1S/Z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 23:02:42.8166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9a999f-3101-43bc-1095-08ddaebc3b4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7754
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

This function can be used by other tests that need writeback.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c         | 25 +++++++++++++++++++++++++
 lib/igt_kms.h         |  2 ++
 tests/kms_writeback.c | 19 -------------------
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870..35c381e40 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * get_writeback_formats_blob:
+ * @output: Target output
+ *
+ * get supported formats from the writeback connector
+ */
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
+{
+	drmModePropertyBlobRes *blob = NULL;
+	uint64_t blob_id;
+	int ret;
+
+	ret = kmstest_get_property(output->display->drm_fd,
+				   output->config.connector->connector_id,
+				   DRM_MODE_OBJECT_CONNECTOR,
+				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
+				   NULL, &blob_id, NULL);
+	if (ret)
+		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
+
+	igt_assert(blob);
+
+	return blob;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a85fee515..6f96b482f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 05680837e..d075cc5b6 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -92,25 +92,6 @@ enum {
 	XRGB2101010 = 1 << 1,
 };
 
-static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
-{
-	drmModePropertyBlobRes *blob = NULL;
-	uint64_t blob_id;
-	int ret;
-
-	ret = kmstest_get_property(output->display->drm_fd,
-				   output->config.connector->connector_id,
-				   DRM_MODE_OBJECT_CONNECTOR,
-				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
-				   NULL, &blob_id, NULL);
-	if (ret)
-		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
-
-	igt_assert(blob);
-
-	return blob;
-}
-
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
 {
-- 
2.43.0

