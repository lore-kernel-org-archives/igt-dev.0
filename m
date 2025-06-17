Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9463CC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521BB10E567;
	Tue, 17 Jun 2025 04:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qW1H+LFD";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A60710E567
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgqxNkZHZyDfZI2X07lFCGt66193E4Pi12Y9/MyQbyrveNbqR6w61zWESMxTiM9v0FJsdfzRtNf5Q80Fq/CJfvX0RWIoflag6HKgUgEKGEJPcQpQ4kQEMfceZkuIiHxyhV5I4LUyyk+SCrAUC0tNzDnWk87bcPozDBPfoBH5z1gCnoU9kpNi9UkNesXhk7Pcnh3szkXvBdyA89vIXeoDOjo42T+ZUgHNfESG7e6GWPZdOmGAjCdN9hAFnoPk4eVBVhVMtrI/AYG5J74hv5HEzEfVVM5/OXiMWKKjMAXX4vUzU6JMtXB3QyS76Seqlv8s0J+pWRH+dSoGWsZvXosTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJw4RvOHA0GAFkvsdNYsOD+EijHI40r6FOcbGGJ8tk8=;
 b=AJot5kXnJix5PkIhN0Gx5YxWu93UNte155PC8gcf+11zmvPqpQhFjjnyfgkG61crUdF/D+/Fjh0F7mEBj8SJDvZblZlio75Oy+w4axXltItte+B95mlTGNYpaHPY2znywpklviYrmsh32Nq64mdi8L0/I+y6kMaEXHkE8jeZVc6N/jMBxjzbC/DKuLtT2rdFvjJhIfG3rZPkCOSb2miPYlcMntaL2aL576eUxjsZpKdvdQ8A7vvFG6OIDOM7bOVJh243rVorwyWtwxaJL2UZVZCZNpwhikjzl3jHqLYaUzXIAiNyBZT1iT2novp51gx/o9ROOjP0QZq+RW2LIADYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJw4RvOHA0GAFkvsdNYsOD+EijHI40r6FOcbGGJ8tk8=;
 b=qW1H+LFDanSyvE/nDvICVR0x6TXJJpEOM1AdjtgWaJuXmpRtvB7i5QHgsD/lz5vIxrlWYefIcfG1OrLPjixu95xyMWIj7bSPE/pYp6XwYOZmdhAxC1wBwnN7N8i+FdwLjOV5C62+O8h9k0FNENJosQ0WOpaRrpSwo6ihaywlgkY=
Received: from SJ0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:a03:2ef::34)
 by SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:37:22 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::6f) by SJ0PR03CA0209.outlook.office365.com
 (2603:10b6:a03:2ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Tue,
 17 Jun 2025 04:37:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:37:22 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:37:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 03/36] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Mon, 16 Jun 2025 22:35:58 -0600
Message-ID: <20250617043631.2920587-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SN7PR12MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1dc400-7ce2-4487-d256-08ddad58a6d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kf7WEZbFDR7zAbeT2OmUSCzgiTr8+t7M6qE0G6/4j0gVNyMJ1AzWlrYiJoJO?=
 =?us-ascii?Q?RxjpjvOdkHnr9XSwoVdim1V/G3Jl2leUZ+Sl8Byy2Zl+HHC4yVoMs7/tMvbI?=
 =?us-ascii?Q?I2cHaYHCUjx4Tl8sabLlXZ6S8PIqCbXqps/KZyXURj3w0pAWe0b+uT2UGmER?=
 =?us-ascii?Q?3ui0dCyAhCQl8QeXfK6l3MZIljkU2YpAs7teygPTvLej0sAZFfh1UGSCdbVC?=
 =?us-ascii?Q?9ieFt9TjpVVmI4MM4viRSqb5ZmiqngBJ4hDSBxwTJueoD7OAw0H7b4wrCOIg?=
 =?us-ascii?Q?Jn0qKr6phkwot0XeEcU/rHqEZs1NtvrxYDIBBWm3eTSvCDWJAEimjXbJUGzB?=
 =?us-ascii?Q?yaasNo9sRTk08AF8qptyuYiam41l8T1OjOhwpX1GIMZIde3zfQKBJCJ4vWKT?=
 =?us-ascii?Q?db/SfpOzNMLW2SUPJ4C9i4uxNHQuJaFkLqzg864unMg2jh67JGHEY1x33WE2?=
 =?us-ascii?Q?rNnnLK1O/4rnDZkUM8udQgWahknbUXo8TogUTe2TjhS8StiJYAsFEgKm6jsr?=
 =?us-ascii?Q?wPSvJN8pytrAxsg88rdaE81gIlo08Aaapb+o9NVs3vxQ39Q4ORg8p4rZDBmx?=
 =?us-ascii?Q?PWA5p+JDH1Jpca3ABu33BR5bhSkACXRZq643rEUXnCWiH/81LjoUfSvZpH2u?=
 =?us-ascii?Q?K8SQcU/aBwaUube65fv9qasIwZN0txpTxtlGFcINn+LKgYCYHuJZ3esmHrcH?=
 =?us-ascii?Q?rnw28ZhtihKaO492Tdicjn6ISURc7sMVH0DBih+aU1mtwj5KUfPFzRaW7hwo?=
 =?us-ascii?Q?skJr4tWukCxByCZtGlr3kASW3y7PJa0ayYVtrFnV+BMWD5+348K7RPSKJyqq?=
 =?us-ascii?Q?xDYGtvepCSRh4/HOorCqDPpgywObK7N9hh8KpjquRtw5REEamPtXfaV9W+pN?=
 =?us-ascii?Q?bwXYPQwL2p+zO1D5+mVy8dADXHGaiMzHQHszkKRQAQytTNNor0BrxL1JyoT7?=
 =?us-ascii?Q?9fI8DOlJMDI+jf9fuOwLC1efHfk2uWXhH+Cy6TljkvZTEjijCBpkbJBDI3C9?=
 =?us-ascii?Q?OqjuJO/C0dT8JZItmHAdj5Fgk1yzz+Qw/7c757GnVCnJ+wJ0vA5Un4J88W6L?=
 =?us-ascii?Q?EbAAoVj1H49nMZuzB3r9VwO4ZuX/n0Pr8ARBU99EHPU9ZAvKvoyFficOn9NF?=
 =?us-ascii?Q?qGpwX0gtnxEmvQekR3+bgBPl82d2Q6bPStwv0t9vn5LBdvgF4rbStFpaMBVX?=
 =?us-ascii?Q?J6s9MtyFY1UIITNJjKIP76WNfuw9jrnTOFLnu/VnbpxFj9bAd1z/2h39zcXZ?=
 =?us-ascii?Q?KfE8gVoKIcVA5Sght4lLCu+63ThQUZkDnEgpLKZZijmqbRhZwGlVxGnhdmEN?=
 =?us-ascii?Q?KDMD7PuXOWKGrv/vRG2qLKM6RRUMR+YA2SWt5Sq/0SlewZYMxJcHSWp4sKV9?=
 =?us-ascii?Q?ncbj+ZALmnqxSViLBiZMW0G/mR/yRsAsDjRrsSpheLuQHFVjK9CRzmDDnhpR?=
 =?us-ascii?Q?XqD1/+Cn/SOj0CiTW8awg814KUPN4OSr2+TsznSAG0JtiTnqWYTTCvWB8f4j?=
 =?us-ascii?Q?UrMsysiufdqxlsmBQ10WFL/IGZyK3ej1j6Oe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:37:22.3362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1dc400-7ce2-4487-d256-08ddad58a6d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7226
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

We'll need it in other tests

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
index 8765fda34..20c3a32c2 100644
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

