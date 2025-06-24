Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D588FC77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 22:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4DB10E62C;
	Tue, 24 Jun 2025 22:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BLtv9rHJ";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319D10E62C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 22:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB4vq5CA1AiMK+jVbP/SP079vwNaYJCeyWyYMe/aOeJwSEtdUJoS2+RnqmaQmb+dQyFkFoSd8VJJbZYXD25SsieSoB2yGAe6JwFEIxY+029hTYBf8NfkVyFTxNXGDd0B+gBud3m+GC9oGHlEkyzQ955282CcV5yz9Hx2VX6DAG+wejIFGKpAVpaX1dmHvbnsOSCowpvhf09HudyS/Xt6vE3McXI8g3crayHkJClUSBHbUhVqJPVelP2wAKAW3gha8rO3wyswjNbwHNqDG2q/L2fqnJT6kNFMMIE5U8XUU1M0mTcJOmaCllEsIR57XeMPGIkW6sIO203havS5uRIruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGt1ZK/xksotvcoPgP927M/oi0CS3V/JWjyKeqxl7r4=;
 b=ak4XUeiK0m9Sm4/9XyXAbhofSbMzV1SzIxDYZtsatOGi95GauapKymMj9thfQ6osYRXHg+4tuZHR33IKsTop1OL1Oks7PC6uBY9YTRJv/KuevlZ9ROpuJd+yLWSynCZrHSdDp0qwxxlk8JEuffLs9Xfz//R443xoeAw44DIZeW1PxGXyL9jPpRXdxsLx3zv7/Vpw1AZWtne+IRpwXD5ADggUBjflU+LZrCGd8BNeKPGXaGIQGsC7MAlwN0P8wjwLJPGMMHB2qx/aT/krVg3Y6ShKLPHqWPwWCg/qPhWb06RfRjFzpsJxLz3LELMdOmdtiUvN0NGs/Y3DWCddE4V8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGt1ZK/xksotvcoPgP927M/oi0CS3V/JWjyKeqxl7r4=;
 b=BLtv9rHJO/GYgB2aRCe6taFzSleA9i+wqXsvtIEg9u3wv32oX1nUpAzr9LjmRykQYr30yF15WeGesbixZzaF2T07+Z8+OPbOCz2tIIsY+9pR8c1BpM/CtjpydVnJef9lNbf/AYkUEKgloWFaI9MvRds6DJWMHGXFUcGg6iVJmtc=
Received: from SA0PR11CA0004.namprd11.prod.outlook.com (2603:10b6:806:d3::9)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Tue, 24 Jun
 2025 22:17:39 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::e1) by SA0PR11CA0004.outlook.office365.com
 (2603:10b6:806:d3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 22:17:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 22:17:38 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 17:17:37 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <harry.wentland@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH][V3] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Tue, 24 Jun 2025 16:17:12 -0600
Message-ID: <20250624221712.1786983-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c51c6f8-07dd-43bb-b26b-08ddb36cee10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jt3QYiKsANHbvqYDqR9JlpjvQkPHJroyJdRhZrHlhtw/iKiOStVPfN+HN6/O?=
 =?us-ascii?Q?IagpOxikeYkSll9SJ1iZtTstaA4a5XuebMVvq9yR12gmeP8yjQKzS0wgyTns?=
 =?us-ascii?Q?Of6gEUBqYOYkAlz5vZiroPG59tuffxzDVadjM89sJT96Ns1znokaiQZZQYmF?=
 =?us-ascii?Q?SOQDe5FRrnSIUZusH5XiQXv1wT3ZFK6u8qxA8PWiArsTOyGX7RREHEbydn3K?=
 =?us-ascii?Q?/G3/EjiNOyXw/GS/jv26RoC43bUN2FeHEHKgcaugr2BWy+OgULj/QXhyI42V?=
 =?us-ascii?Q?i+F1GVWe5LBCA4OMg4US90ZVpguPeuLWFfltcqBgI3x3KcfEUG/bPNxIsh3g?=
 =?us-ascii?Q?7LsM5uge0hHdgMoHzuaxABWKWYJRyrJwQbJuIeGNq73lSmT6ie94b0967+il?=
 =?us-ascii?Q?ymvM6kXyKczWSGMLwuk7aYGUIMbrQpmX5uWFzlHHJPl41IXPU+B6jDRi3hyL?=
 =?us-ascii?Q?XB4vgAmJlfr0TmHK75uDx+xA8eiLC3ANei2QWKI5Cz7W1/gHngzmKm035+lb?=
 =?us-ascii?Q?N/vh44owh6TpWou+R1Ih2/rQW6pa7eWGKCd8MRzp46Jzb40lNhB88W6PlYvn?=
 =?us-ascii?Q?WGiocctX/iK7Oge1yyAmE5tO9QkpGgPC/GZDYRmFtKshAPIy/750wsgIYpyi?=
 =?us-ascii?Q?OeaW5QttOoIuEIUbND+3+xQPWRfkl+rLzcM1m8tNWFkoCfAresNsBckDJVQV?=
 =?us-ascii?Q?G+ZpPojSIdC84AJ1+HV7LFE3DVkOEd3evYX6hNGo9RcTjxvKGCUd0EMvz7bo?=
 =?us-ascii?Q?WQnVhSm7TFlcKzKoG+8MgQN9vtSo+dpXDPV4TlDGtGT5Cz+QtZwPq3ctqYy4?=
 =?us-ascii?Q?yPkG82l/+dKPwQLvjvOS4PpKRRWTN6pIDSCdJGowghrLYGKunuKFE6C2VCFH?=
 =?us-ascii?Q?FrzFP60/1v1FW8ZSf1QUPq7f1Zvy0IzmJVXxLnHEhVFddkdEa5RPuaob4q6R?=
 =?us-ascii?Q?5+AmvVOlNANgyT5agRWGftwT/bfkxwlIrHwyyBHn9XqN1fvGtHuvndDvoOxB?=
 =?us-ascii?Q?4nHaFYnNBNX+Nipb0N+T2mjsMvmlJvSoXpihtm2SPzo6x1XEeOE8u4gDOPCs?=
 =?us-ascii?Q?21clvUCu3Ukihvye6yo+5WjL5o/XLDtDHlJdUuAGJSKr4PdP6kY8oWRdcd6Q?=
 =?us-ascii?Q?d9cTa2jCO6YDNcTwq1s/jtRsixe9ogChXZYxmj2GnGMOXzLbJDqzpD1celqO?=
 =?us-ascii?Q?FH9n0I3GDWd/ojBlnMu8r4YwNh2MLlEzFyIZ5YbvKrtw2G9mU6bZC8TKtdaN?=
 =?us-ascii?Q?0/l37IfNnLRxm2c+M6/BSY/M6EJBtSVBe9yNPTPPLvgMY0oeAIe6zUPzibyM?=
 =?us-ascii?Q?Tx22kC7sMV52iZExsWm9BtRbrOT0LwRg6XL5Msaqhuf5mGjIiQilszmbFMNh?=
 =?us-ascii?Q?vJ3mxdB8+OwK8l8OfOpP3PDhE6wQXqYLhYAxy90pwAbhV+MUMFfxxltrFT32?=
 =?us-ascii?Q?RBGbLeae/GW2FXb0HcIebwhasFBzUR6wsYC7FWS3/OGEEB0h7GPQDNnH5Br9?=
 =?us-ascii?Q?KlL6NHZC4B1xO6+ZBVYLcrJImUWH/qxK/+Lf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 22:17:38.7743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c51c6f8-07dd-43bb-b26b-08ddb36cee10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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

This function can be used by other tests that need writeback. A prefix
"igt_" is also added to the function name.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c         | 25 +++++++++++++++++++++++++
 lib/igt_kms.h         |  2 ++
 tests/kms_writeback.c | 21 +--------------------
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870..d71076f24 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_get_writeback_formats_blob:
+ * @output: Target output
+ *
+ * get supported formats from the writeback connector
+ *
+ * Returns: pointer to the writeback formats blob or NULL if not available
+ */
+drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
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
+	return blob;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a85fee515..09d7d4414 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 8765fda34..86afed509 100644
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
@@ -621,7 +602,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		const char *valid_chars;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		formats_blob = get_writeback_formats_blob(output);
+		formats_blob = igt_get_writeback_formats_blob(output);
 		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
-- 
2.43.0

