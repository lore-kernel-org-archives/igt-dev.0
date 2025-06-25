Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34024C77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 17:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE22710E7A4;
	Wed, 25 Jun 2025 17:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bmEHeByC";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCF010E7C6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 17:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntXQRDv9JEFDyu+VGu2OGMCwzsBGN1af/FgWAoQncljEX9waP9ruQp7UFd/a0keMYoGStpfbdSdQdc+StTPhy8a/xbzOPCXIZMQRtRgJvOMa741m6FEXR0fLbrF3RocjtvU/++vgHyLeSxo+qUaaF2heAXt08iTnw7gSPzJZVauQK2xVpKeY8emqNwHdvw10bXs2Sqhg0JIOAkUfWyhBfmHLIjpM4dcAPJpwDlB77dtFJOYXYS+7k2ryh8/ENHjV34jfuQoPUvSxy6QQ/Qax/j46LuKG9xl9OI2QpEf+IDL1XvKWilpBjMWn6/syUmERxH57hYMEv1wjKZCCe+G63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDjyUj3HsRCSrdHmX3FFc412bd0YxD0flufFdk7QVGI=;
 b=bTEbHJVM180tsBvxEzwQ74+b1E71Fbw0X5vbxZCX3vXnFq4ZaY4p+9D1zPcKN4JgnH36A0SnTpG6X8a2/1+i8yemPb9N5nxVn3jD4TpIGRbGfLOiXDfNfdI6HsSLs9assCVZi5DB/6X/Fntmll1QSsl522742aT/chc4zKp4x0Xu6KFFx3xrI6ecaZHI4KKQ226TnnwKyjqIg2evo7WvB2T/PgNUfDY+sqAnz+0PddOn95FRhtEnW9/kGrmNjUyCL/4WBxmkV5fGUP8fbk+0TrFmchSbQ/8qrLYtog34h55/3AchlwCDmiJvEizqK+JEIxtgv1iXci5dHKBI1PpoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDjyUj3HsRCSrdHmX3FFc412bd0YxD0flufFdk7QVGI=;
 b=bmEHeByCaiQOuZn9E04EwQ1RRIhrvVb3nYfCu6G2R6t8D7M3TyX32qks/QJSd8zztSHmBkp9K34HAIa+oUkVnqlSES7xewObfS/GBWJ6TS0G8CWLa6AP7lknUIVKU99AHDCCjWyQNBJVJFx9jQbtzqG06AWDjwfJOISjWIE1CdU=
Received: from SJ0PR03CA0173.namprd03.prod.outlook.com (2603:10b6:a03:338::28)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 17:42:01 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::56) by SJ0PR03CA0173.outlook.office365.com
 (2603:10b6:a03:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 17:42:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 17:42:01 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 12:41:59 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <harry.wentland@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH][V4] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Wed, 25 Jun 2025 11:41:15 -0600
Message-ID: <20250625174115.2536661-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be028a5-793c-4a01-8a68-08ddb40f9743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qE4CuGKsQzD6omDISoLCyCHZ5fdmVr8NfkEEnnsPjBgUzybQerSmCRkE2d7V?=
 =?us-ascii?Q?c64dnHOrfVOjxSG0QpI3SBlf8lBzuaWDbUErEoIin5hA8AIOQSGrG/u84sag?=
 =?us-ascii?Q?rx6QJ8j1pijDDk9C3QLBF1znJxxvFSjxGZMqqI18NvNERtZ+ky2dIi6EJVnT?=
 =?us-ascii?Q?wiadOzQgMDgRY09nj9F4JIAQofXWdQUc37SX0PoC2WbR9y3CGBaNsN72OOuu?=
 =?us-ascii?Q?1kEhVF0jvUr7mmCuIp2S/x8GItH67PRbdygTR5axx7u7GNTpArb047AuqdHl?=
 =?us-ascii?Q?iDLnUlOi9h8J36gsqRM0kUGnFUiqqRaBtzDZzW2QmOEU7wmuhkM/L6ybjO/B?=
 =?us-ascii?Q?97cMK9ByuoHY8MoIYeY2BribJ2hbddwOwBgfJ/cwpsVc2XPipnYtR5SLlDVO?=
 =?us-ascii?Q?LtE/CciGoE1W/ETuqtk+/GvFa6rBMvCwriaQXbDEeNqaRWhAo7Y6NIgwBmW2?=
 =?us-ascii?Q?vtWouudg8U7D+Dx23hB6ijujdeipO/RloxLdnP5LSpVGd2gMCEKbYDNWd8mi?=
 =?us-ascii?Q?jvrxrJGdbBJBE+rx5dLMLoqGqyVhYjdboqvRQ1V9Sb8+HsxOqI4mBKZ5d4sV?=
 =?us-ascii?Q?/Wkxq5XsQrOLFsYFEiYuEhvNgk8mU+7ipqnB/WO22UtSMF2juQTeF4hcZIlo?=
 =?us-ascii?Q?czq52NQH8sSXbFallkOjKrrwJnubIj//VD23pUzM/DumyKdBaeP8GwgK1Pvi?=
 =?us-ascii?Q?+RzQ50THh194uQs5+V5J+H36WnUzUeyigZ/R64h3ggD5nRprG2UFPlPaVtrX?=
 =?us-ascii?Q?fvZ/u2OVQWJ20a+GA840ITZzaHtMOkjp6KOYRQXSz8Bt+3AyVA5tA9SBZkW3?=
 =?us-ascii?Q?lgXqo0GEiZZgAWXzHnUOgtpJ6gy1LCe0SjWLdXZZcs3DwF8AnH1RQ+FLrZLN?=
 =?us-ascii?Q?tmLbZy+K3BVrxXT/KrNPT+5vJOTOxSdZ6sg3/+NclttidYIHhEQf4VbGwOXP?=
 =?us-ascii?Q?VdWlWa5rB6wCEPMkRqmKFl8YdBquSHsxE/H4iBW31iHIuS4I+Q5SkOoq/tEI?=
 =?us-ascii?Q?YUApJ3ggjMh5rdEaXrqJ3NgK6uJo0ltBc8otT0ugIf/N51+yrw6uSSZOpFoB?=
 =?us-ascii?Q?FNUQ9l1375gcRDiNB/Wu1ZvX71k4Iv/6qc2pb19qtMDIfkfjtNl1r9F73UeU?=
 =?us-ascii?Q?j3zkj7w65xXLTRhZ2ESGP3apQBsKJ1wIhG/BRhQVK7aKxHKfxdzK7dPb7XRv?=
 =?us-ascii?Q?7njOjMki/Kzi9jSKGzHF7GosTnAKxFyP7281SCfk1+XJrC0k2xJFTsYqG4lv?=
 =?us-ascii?Q?3OFTnVCss/Be+WP8qpMECgBLBfb9OC83vgMNCM7NZKDJ77vLVoPMEtoMA1QZ?=
 =?us-ascii?Q?YTkFY0WM0jU5pTuFlwVZEMwt53MVJ2U2WxZc5SFYQM0XDpVKHisZGkPV1CUT?=
 =?us-ascii?Q?jk6SS6MW44O1Efa1sCmblav0sFKWcHWk/6392GxvZipS2QDep8so3gMS16C4?=
 =?us-ascii?Q?mBzmG4x2liKYZ9672mX9oeEVtV3uHweW+Z04+igx0qb9C8FbQrtLCk345Rn2?=
 =?us-ascii?Q?gpNi0zdMW7cGFuUrCp83NiiznfKefisq6DTa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:42:01.0426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be028a5-793c-4a01-8a68-08ddb40f9743
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355
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
 tests/kms_writeback.c | 22 ++--------------------
 3 files changed, 29 insertions(+), 20 deletions(-)

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
index 8765fda34..b4c3b1cd2 100644
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
@@ -621,7 +602,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		const char *valid_chars;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		formats_blob = get_writeback_formats_blob(output);
+		formats_blob = igt_get_writeback_formats_blob(output);
+		igt_require_f(formats_blob, "No writeback pixel formats\n");
 		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
-- 
2.43.0

