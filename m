Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2576BC7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 23:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7BA10E00C;
	Fri, 27 Jun 2025 23:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tA/ZPIPy";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F9310E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 23:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSVnIKzgStmsdhOWPbDJUG7NVX2O2OCZRIYAg9rUG5BmY3eUnHVC43N5EddmO7TsWtQinFjMzm7Y3LpBxAPiW3x0Q79Te8fm5UWpUjQtFONgXGiI11UEierm1I/nX0SR9YgQXMVVNhy+/O3UDPKJTBc8Z8YKR77R+BbcoV0neefv4OD0+LEmVjfRK1jpuVNVaUclmE9V5KQIhUkBESh7KGCSdBV9OvdRj37zwlq5vSoQ+XiG6zG3MwFuWM+0XdcjphCpeVLhQayrSf66L+ZmHyo31s25A79ViF8zZFpumoOMHeekPFyBFNKMRzoUSPl6t0fAaUOAhzRl72WDF9CVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py9PLrUpyaXvsALV8sbOv6jAekL+wJzK8ym6eSjD+r4=;
 b=G0Y/YZNEZl9CF2fCvbI58Jepk+fdVE6s/0bC5S0RqqC+JoqhYk+Ia1C0/5a5YALMfDBxYBAH/pM93UE+6nuZwDC4rsUoy1WMCeTPgLKkS1nREzt7fhil33A1yhiSQIntmtMRpGdfbu+ZpvJKD368sRJ6gcUYV4MbQ5NqFWGGdB4eC5IgtTtdUbOToK3mTjpV97tKHUI14jX1hvxNnCk3OHefMeQn7gPfDE9mbYahT3ELmBFXnbsIin3+zbzWOuUI025QQS3DG1jUxq+vzG4P6JbX5pxzwQLrtAjlphbi+L9n51E22Ovd2mEHhWhiJHXpQpcVad8VDg6HTFq1Aop0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py9PLrUpyaXvsALV8sbOv6jAekL+wJzK8ym6eSjD+r4=;
 b=tA/ZPIPypIFi7aY7e4JyWYS1zTv1XnQ45pFLWu9vPi3zafycKWjltkv/PAd5mtIGvvwWudF90ed4javXezkA4Z8wOlEDUcIpM2cn7fyjgSkBu9DlIenWSogFfaz+4tQ6iWk7yLKoq6Utpi+tHHZ1jY/8viO07vCeoag8Zi4kKXY=
Received: from BN9PR03CA0310.namprd03.prod.outlook.com (2603:10b6:408:112::15)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 23:44:43 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::a7) by BN9PR03CA0310.outlook.office365.com
 (2603:10b6:408:112::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 23:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 23:44:42 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 18:44:39 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kamil.konieczny@linux.intel.com>,
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH][V5] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Fri, 27 Jun 2025 17:44:09 -0600
Message-ID: <20250627234409.702251-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: f74ae0a8-766e-4a14-cea3-08ddb5d496dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/ZCmcNF2JL6YaVBQUnhFRFL9i8GTHzZ/mZmdYcGVwokQfdPmZ9Gp2fRiWxsE?=
 =?us-ascii?Q?Jieu28i9XXuPY6fxRUHCTypFlm67gNQNtvjewp6uupKOz6kTBM7Dz1B/a8J7?=
 =?us-ascii?Q?3aEsPYzuWXB50naukF3N+n3KaPuz9o7auCKZ1kcD3rOV+LoiUXBMZUu4aFyy?=
 =?us-ascii?Q?rN6rwfbxaQtpZ9qqUa2a/cG0oomWbAWdrlTgOe8zrRzRQKYjQW6tohlJiatn?=
 =?us-ascii?Q?9Q748crF55RLvTIcFS3AM35wtt7UhW0MIq9ZAgZf54g8Kvt9bP8/yjniD7Mc?=
 =?us-ascii?Q?/2jDJEVAK7C/t5m2d7ac3fzg/frNifagjSvtymgGuEK2Oe21/87GKcQ25M9f?=
 =?us-ascii?Q?BPpej96KY46LFJEp7IR2WeBalxT9m7j8O0k6ZQ1W6qQI3IhIVmHo46SjRg85?=
 =?us-ascii?Q?3br4i9cN3WYanuiQ+MlScMXlkH2Y1UX+yVy6iRMdP0xdvYut1TqJTKDr4d7g?=
 =?us-ascii?Q?EStv+rXKTY34dDZLZtzPx5Ja0LofjiOrJbBQFx9LB/XQTmW+Yqrfb3uOIzaX?=
 =?us-ascii?Q?VivBDgsOYBGYVCqpKuN2lyz+UUn/qa/pFP+jMK4PJ5rUt6Z9rFak7Ax5p/UF?=
 =?us-ascii?Q?CIcSsT2jAFa107GCzUWf15O3vC4LfkD62YUB37bfBFRfBk20B7vDTllZf+ZM?=
 =?us-ascii?Q?4g0rmXHtkq1C02wdkgrAZuCDBXrdXvJvUcb9LbRlGraHOYZ/BFMvCc0rWdNj?=
 =?us-ascii?Q?Ezvgf3becH2m7FHvGe8yy+odfpacGbUjn+B5Bks3JnsR5JAoiciCatx0/Zl6?=
 =?us-ascii?Q?6tUURizZjtTKbMXnD0/THQn9sroFYpPANk86z6y9x7tjA+jrmxw9ic+fGdct?=
 =?us-ascii?Q?qcRe2lGJxpxM5uYSrp4ZftrAlQPCghETt5WJzhpQ93Bhb/dLUlVA7oxt+esV?=
 =?us-ascii?Q?nHYHTP8fyoFrBqrwv38pK0mjw4hCxrmHciDz0KQ2Dio1OF/1jLjSPdTwTIdb?=
 =?us-ascii?Q?ndfnbFHPGhsrbaPiV0wixpNDlSZEGKx8SGBf789BDRPL36YDRy4bScciNa/i?=
 =?us-ascii?Q?dc5ELytzwCZN51vABjNu1YcRCq9SiIr5v9K71wNfY9bZxyop1zutnhidAcy1?=
 =?us-ascii?Q?lQu5hVgz4soFvfBpIRD46TePuCV+aCrZJLD13VnH0zbRulXB4qeL7dGqX5pP?=
 =?us-ascii?Q?KZQJzbUL4WWPZ+aBR85L6b3mrkr57wj7d9lnmCR28hDmTkAO8lN98VDVKRtz?=
 =?us-ascii?Q?2UxeqKlmR6hLanx+9FrM7H9bmxYMIETrrVuXXJ4ayem46dVKAp7v00XXQ3Oc?=
 =?us-ascii?Q?BxnXisVt3/CuaGhpqJftW2aUpJ+BSLPYH0+1RCu26+sy3N9RWfC5ZwzBe3MP?=
 =?us-ascii?Q?Cb8JWiult0G+3nxRIlsBHxSFk/Kjf+ggqS151QjcEyYMDZ0i3b+dCYjYbqsk?=
 =?us-ascii?Q?Y5/nm72x3jC2Rfj5xeKkVfkYMmzf/JwpsFb/BbpoWSLF+XHS6pzAIjK7GC9p?=
 =?us-ascii?Q?iC0dqhqOTJDMqjCKYHG8oDlNx7IK8u60J9+LFowwUfbPsAVGYVvjLgZn/cuQ?=
 =?us-ascii?Q?Yo9UZrf2UftPtItRM8mUnZMvxfQ/Vj5QrTPY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 23:44:42.4872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f74ae0a8-766e-4a14-cea3-08ddb5d496dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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
index 05680837e..1b81088d7 100644
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
@@ -616,7 +597,8 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		const char *valid_chars;
 
 		igt_skip_on(data.dump_check || data.list_modes);
-		formats_blob = get_writeback_formats_blob(output);
+		formats_blob = igt_get_writeback_formats_blob(output);
+		igt_assert_f(formats_blob, "No writeback pixel formats\n");
 		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
-- 
2.43.0

