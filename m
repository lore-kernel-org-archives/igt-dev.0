Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0388C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979E910E41A;
	Mon, 19 Aug 2024 20:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="By6dxOqK";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E630210E416
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5rQ6Jpd8Sp8qCEEm+v0z0pOUbu0kKxWH8cxY3GJyW9VpUTV2daNFAIFR18IWDdpAe1h2Ilxhy9gEgunGHAMlMAK0nhVIbLbvgOmcHEsF6crEDSZR2Ab/cMZBXYENFE25zpzyrovFpOiR3IiFc95RB9Hb2ayLNTBof8wDnpI9QgstJsfFnSQKt3SZcyr8bC5xrCReKI+QCUwiIexVlvhjRxfS0FwJ8Q4NrfnRDBaZ3fc+c6XFNhhlc4wJlTGSO26WChIA4gfWQ6b4Rppg4Zp9/ewuxaPVCjxQzd+3iMzg+sVR+uGYESbTSXYvyOaaTDuuM7rOsaehhR3Pwms/Ntm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txaslHptlqycr5DEIp9uyHYD7cV9gObd6NO67eVtRBA=;
 b=MLpmnZ6JKMCFRQA57U2wXKoun7sAjcL//AhLSZ/TX8UHsaSjiITqEIC0EtSuOfDXrpKkiijCqRo7Idn09P0tk9rkRpVaYTDDuvRW9J0VxPxbckHy7xQ3p6yY0fvNnhAdBkFru09LOme+lA8qQ1q0lbEJFOjbYeQZeYZy3fR2BbgR5Bbed4T0lQGjI4EsNCJdSMntA41nNIJyQ6s+zw8raJWE4Qq1bTUujx1b9M6S8cGsSSxIe7K65l1KfGseMD8qI/T6wbEVmeRC/p2WQ/nNcg6/qfO55PmtevjLfA5cd9GygdbYYEd/wVQsCkC0psfKKB4J1lyzd9+JcG2arlKzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txaslHptlqycr5DEIp9uyHYD7cV9gObd6NO67eVtRBA=;
 b=By6dxOqKaw1RsZhczauqb3MTriWLGe0z2EkL/Bl2I+GCIONiNNWsn0oLgsP/doIetLO4tTINn67Wki6BjKZ9ogt0hspA2q/NSyKlZ26+1GJJZfkUC4dr8eV+yEMShdSVbbRvrV22n+DkiYq8IKG+PhIQglkmgHZ+rcj6qUnyUXI=
Received: from CH0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:610:b1::32)
 by MN0PR12MB5884.namprd12.prod.outlook.com (2603:10b6:208:37c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:31 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::67) by CH0PR13CA0027.outlook.office365.com
 (2603:10b6:610:b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:27 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:27 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 03/37] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Mon, 19 Aug 2024 16:57:49 -0400
Message-ID: <20240819205823.316656-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN0PR12MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 281c3409-3c9a-4653-dc7a-08dcc091ae78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?baD9UFjnIa0MCLRahuLN1/7l2sYfQ+IZCMLiOHfX7Bqu7coCiSQdJlDDp86m?=
 =?us-ascii?Q?HkglF+xDQXhIdGMJZUfarcyMRQNTKUDlxrww+2aN6HXWNPpmV0RUpy/qTcFC?=
 =?us-ascii?Q?ymxSNxaaqKAcVCnH/vmJMArYh57gW2xgrLC/kSNAhFvDg9qWzjdrAIrARJay?=
 =?us-ascii?Q?Zf/NHLDQH/ORmP9O7yF/4SoHhv5i9vMHcW6obupj0rkRzrH1axhoryPk1F7e?=
 =?us-ascii?Q?/JiTWeH/sQ8JXjw2DwEFdoicWPPqGkJuAstTubzPGR2g/5Mmmc79v2hiRwtd?=
 =?us-ascii?Q?BbAygFG+03VH/lD6Rjr4vWScoGbi/x8DVVrdQThu0qroneCVwVO8ibTvmRTO?=
 =?us-ascii?Q?XkdglW11oLn0gyZDKl1RecTrLHyZ468zC5XbnWnYEMDTGzVB8cfuxwOrTjf9?=
 =?us-ascii?Q?7jWIMTmBGSPqKDU2bVX7TB5fPKhIFSSqcHJC2A6yDoADg9LXzgoOfOOp0iBj?=
 =?us-ascii?Q?nxyOBqx7EBui2ysbTh7He349hh2mLQWNbWUyCglEV3VB5KRjOvBF/P5p1rl8?=
 =?us-ascii?Q?DuZUx7w/rQeZu3Sq0cKcMIe0223bw4DlcguPXMYGCsAyVwq2e7rmGL6j6+bN?=
 =?us-ascii?Q?9n7RL4/BPwchbIc43MpXCUh0ezczhf3DxKc+6EaDCoY5O+clTa5cLFXtgZ7k?=
 =?us-ascii?Q?LGTc2JG8BSSFl1p3fUgirhOuixwysDpIkrMx9u4pAYK++vCk/syUH/JoYobA?=
 =?us-ascii?Q?0aILIr1rtacjl8ZH9KybkUxw4OzSy/StmFmGeg+lWokc/Hh4lKR64iP21If7?=
 =?us-ascii?Q?gORd9S+jcv1oF+77PJY5afADeAl9k/ftTeanPTqtW1jz5w8ElsXO2yoMBrmv?=
 =?us-ascii?Q?ftCh5AG361MMXF2ZabZljTOpKOOPgzrdEYEgZy0gTZ8o/2+F5MBv0hrtDfx7?=
 =?us-ascii?Q?RrMaRYqOi3ZAj8QpI/gcSNr6kcbcZOEqM+gIZWhbC9mjiiavdWIzrtPrl9Sn?=
 =?us-ascii?Q?wCp9xBBXr4h/23dIFWoOSuxuHa/W18b3TQVlLdQ3zb56ir70F9DDXW+Yj3fP?=
 =?us-ascii?Q?x0/GJAr5k8BjDPyzx8XGIhF5yR/W7yQMB+gez8Tw1nQgQDh7hzYlugaK5SgM?=
 =?us-ascii?Q?ILyJzUHCYoP9MirHgJEHqY3QoFvdEOYgVYGwUPbJ7Qdy2bxf+6YFFMWLgCmm?=
 =?us-ascii?Q?I3Xxhlvfe5L0errtni2lQ7HjmDFYZv7KjbZjkQZNnaGr1imE+rewtRY0jT1+?=
 =?us-ascii?Q?UBBrCfxrYxNZLCieE5yPfS9qE4Dq+xMQCj2v5mX/arkZnQhH3sZTE0ky5EV+?=
 =?us-ascii?Q?3YL+sdUvS0HusFTGjDKmAeHNeMjrFsAAuXne9Ofp98CoYcUGPVXbEzyDGJWF?=
 =?us-ascii?Q?cvdAGGg3DgU7Vrxd2d0AEY7q6OSCwg+LyILvn/6UtYqCdi1LKIEEJ6J+sLeU?=
 =?us-ascii?Q?xEs3PidZRXahFgMqs2QcJXeayO2fQwEB//bPAYuiqKA7+IHYFYjKBKIqPwQl?=
 =?us-ascii?Q?JF8Jzq1WcmBtnNb6q7tENJ9vySuklUwT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:30.8777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281c3409-3c9a-4653-dc7a-08dcc091ae78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5884
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
index e030b35a6051..1a1bf942c600 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6685,3 +6685,22 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
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
index e8582a45b53e..3921bb7a5f58 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1225,4 +1225,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 
+drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
+
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index bce0d593f1d7..97c47739ed4b 100644
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
2.46.0

