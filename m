Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C50DC54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08410E35B;
	Mon, 26 Feb 2024 21:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DfyuhCQy";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B714F10E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkecdiKC9itJjSbrp9rodWiKPxLLwvbfipYh9Sec8PRHDoY8wN4CfBoZ8kyPlJAw+iYYXNJbzwGZ21N/55Lav/JEf8GMZ1UdkNVW9dqjPDdp7qOCk7jGLSHA9zioKoHNzUU1+KIghFNJk/b0d+boZISner/rix+2cvrqt/+Y8KAOlMJgFzk95JEYETb0KvxU2UMZgOk6h91DyQiNA279kAumgKnkBZHoG76krNCB45gQOve7Q9KWX1KY1RlHVhDxdlhPZKJ+ZvJFPAnawRhXs4amkTAcdscM1uPvUFoD3OcRHbaVC7YCqQsMr24ZP7cJqzU/ERqC8D5xlkhOcJAc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUp5SYLiq4Hcffxs0t3dDU9HEvAYLBMTMstLZ0icW6Y=;
 b=EGXgQl5jEywrnaY66vX8XAAWeDhEjCQBUkpx1SdCSeQhexz878Dh8JcJ33oDjcwrq2dxXfytN+JJQuG8v2LbkURsLY/PWmhldbF6amJ/wD+ZlGJS+vuUOnqIN2HI2o4OGa39pJ/XNjXjqP9uX9JurHBaDeoNiKRBZMXIXHz/BGg+J9CZjYpkdVe7LvjUwbcwI6bUa0bFXku4W9YWX+5W15/Qnow1Y14fPowB8pNVxYBTVE3qeu3TFKsD/Wzs5PV8zSJqFL+Vdv7+pU9F9sGkgx2wgzpYJVqUFLBwbJZlEQ4SZGc2SpZvEQflHOhhRIjxSEFLHROrIL8JBj1+F4iDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUp5SYLiq4Hcffxs0t3dDU9HEvAYLBMTMstLZ0icW6Y=;
 b=DfyuhCQyx/J4m3MYbQcj0yJRi1DfWazLEpakz5MM0JMcN6IwbRd4ckTjIBiwt6eF8SsNMm1NmCptrZCaaTbNJS+cM+Nau61T4v3TPY3mvF3hmmmLOBBoXmTUge7xuvI+srFy5rb7ys+cz1VhfD5/7ZlTpCe36FkHxGlT//tJmT0=
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by BY5PR12MB4065.namprd12.prod.outlook.com (2603:10b6:a03:202::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:31 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::57) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:30 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:30 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 03/32] lib/igt_kms: Move get_writeback_formats_blob to
 lib
Date: Mon, 26 Feb 2024 16:13:47 -0500
Message-ID: <20240226211416.100660-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|BY5PR12MB4065:EE_
X-MS-Office365-Filtering-Correlation-Id: 3392f303-f86b-4283-7a79-08dc370feca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qrbPeMdua/6s+CK1C3yQe19z/WTnEcZfm8QS3z+IiEbtCYjB3Y2OOw0QPPeAckNQsePYBHg3wlcIMOJQSHQETy5oqC+ioC1rkfGaSHwUJ7XTr7xFeV0pSDSE89NjrZC1T60v6clQPKUfaPzZx0FaDBuozvI4Vs7+tHuCp7za5zhuxPJJ4T50FxvMR4mvmgL4cIIFGQjWfBMTpzdTREuXrnzYaAjeMYUK0iHdC4yWj88Dd31/Pp0/NqpIGFc8nP/WxnMXxNO5WVgrtOez1kmpNRKT7CoJElGlAU4wSXs3Vd6YdN0UuUrymaQ54onrZ/gsC7XHgC1YnzA4C/VqStxGHpNPfaQoiTrKKrdIZSBghb/VVZjw1NZDC8mH2kahTdiJZcjnVOxLel5fI91U6RhVeq8dgew/tHF1IjNVDbJEdZeTvHgApKZw+v0AsOedggML+FQJi9K1LQLFwHt2xiz4FebsaYBrr+mfx56kjMMJyGmFfvp33W/pca3LDg3Nch1K4HtvY8RSLZMGkD8c4+2PcGyYGNPOiH+FQgM0PIURNVwFJyOe+OgU1Jdkt+ucrijkbNTNbTk+QmszHjyzTVj1aMrMSsb3XGTFzgN5fumm8DTZY2k77y6qfZPbnBZcK1RCgZ50iEVSoFdHxKKdePGXJgKH2NJnh5ayK2p3ZRHPpUiCvswlze2A1MpO73Ust5460sMF8s1BPHCHCAFkVX0YAEM1NO+poQRbaYVSBgfLMLJchQJFKUuHF9RTkttTlwAp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:31.3669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3392f303-f86b-4283-7a79-08dc370feca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4065
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

We'll need it in other tests

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c         | 19 +++++++++++++++++++
 lib/igt_kms.h         |  2 ++
 tests/kms_writeback.c | 19 -------------------
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d7612a2..0cccf56aefd3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6368,3 +6368,22 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
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
index b3882808b42f..6591f6e227b9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1219,4 +1219,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 8d9f502f88f1..86a83bf6fc67 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -94,25 +94,6 @@ enum {
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
2.44.0

