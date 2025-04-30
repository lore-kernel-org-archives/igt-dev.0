Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F6AC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5DC10E6B4;
	Wed, 30 Apr 2025 01:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YB6APnAQ";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFE310E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbS1ETHwUFr2YXlQK56MOkoHWRHPheb9qWDLb7IY4PVsIxsSExU9SSUXEfs2FbPUqj2MtfMKGIS50yCil8gVqY46YYGRWiuVBi88p6HnqKg/Pn3KrGZKmMWV7o77opA/KOWnE7rXSFqkxph8so3C2uhu8HL5gVRuA8s8UGg3vv5Bfc84ykRhyMu2BtqYHuhWAovfigUlo0n0kwGJAruXCZdT9zwV7HeiNGAsxizFyVnp+KHTQbgmTMi6G5Urp5DHTVPJt2lFb1RM3YdjM1G0QkgOFB/7ytx/Tbtccr9g+q1mrntF1ZCiANkphv5QYAwJTJw8yw+QTVwjfVzhwFqjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSUc1mQZvuzIgAzmtJTMt/2TzAh3GPtcNDephCV9wMw=;
 b=YUvA5utAdkPU7ZZv/5rmcKHU6U9fopAF24LWVqnb9HBg+nRpcU0alr1vQ/UsAnDRDZFjdI+mtl4//23Gex6I6FAKw4KWfwa4A8Jwj/UmGk0Fv14BaHfd4Ozl3rp2TY4weW8X21hkte6kONT4odvlv5v2MWly9jzxTqIg/bgPKL6qegFKPySo4lFelL9wtGu11R3l3JXNPFZ9pKVaEJ8ctCdiRlTymvR75ULKyTyUB6daYMoezhmgVSBg+si+ol9xaqwNxDrOP1qbBclnHDj3aoAaS/ZyAsmZMTjzZ1n3CW8TzQ3HEiPvVYW0QFLBzpT6Uno2XbFQXF5cQdWPLOvKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSUc1mQZvuzIgAzmtJTMt/2TzAh3GPtcNDephCV9wMw=;
 b=YB6APnAQAXh5xVB6TD5LP1NdCz/+mCbJTtL0iA6kd916jVN12ynlWaOP+fVFCyhtQRUgRgRmg7RJU2ybRqNBXoVAjWaNoZvUBhQP+Fq1MlRDbtZj4kS8Vi2PoE1yA8uk5tAU9ptz5DLHhnUDrko5ZEJdpe1SG7sMtSckjznRxpg=
Received: from BY5PR16CA0001.namprd16.prod.outlook.com (2603:10b6:a03:1a0::14)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:35:59 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::1f) by BY5PR16CA0001.outlook.office365.com
 (2603:10b6:a03:1a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:35:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:35:59 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:35:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 03/36] lib/igt_kms: Move get_writeback_formats_blob to lib
Date: Tue, 29 Apr 2025 19:34:21 -0600
Message-ID: <20250430013454.226910-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a340dd-e124-48a0-dab6-08dd87875c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?knG2OOu81Dn/FBndRL+y5GK1YwtsnEpW+vcDeJubnUNfczJojhhwXLLCycNR?=
 =?us-ascii?Q?cG71vudQQqM6tV/tMtYrLyt8K0lAYKExTy9mwXveomnXugcIpRuxhYHLOKvo?=
 =?us-ascii?Q?UOdFW+4EQCxjnZYuzUJHQWEdHte8guAEF9non7fHORSG1Ps5oJkIAauj/pMP?=
 =?us-ascii?Q?gfu2TtzttAnoS4q6vtWv7x43VZsgZjsMSoqbfZieBsxGZujuhERdtHPYLNLA?=
 =?us-ascii?Q?g0Ww/aS+09Mc3os27yWHfoHZmKDcQVn6/ZZjfpOYGo1YIJJcjVtg4Q3G6NOi?=
 =?us-ascii?Q?mHcrXDisM9E7vBSGytdTVIBVgyVCYI27Nq66E6sNz5mdHvVovtRdPpGRG3vl?=
 =?us-ascii?Q?WfrT9aRy1RWwuWLVvuYKAKKZDTj2+XnydnQDbBW2pD3a3wOjzPnPYwvbYYPp?=
 =?us-ascii?Q?knPJF3VZXITrSWWKZkPS7t3Vw85dIqDJHyILDvsOmoziEwcy/yddM/dYqT7Z?=
 =?us-ascii?Q?4Bv5XO3nX90Qaj/PppWa7u0ByAtEEBMUmVk85EJpC/6JfbEDviMEIqqdPqyQ?=
 =?us-ascii?Q?hwIFmlFITSrfG9Vk7ai9YYJPLQVvPVys9oMw08j5iYaTcCeF0D/8EU8HbFib?=
 =?us-ascii?Q?ElLtajai9s2F8L+lXadIuTLYRu7ZjOhn1CnkWpmWDmMOLlVf+PhVp05pQFzd?=
 =?us-ascii?Q?vskR8aULKFIXT6HZK/Dv91rnQQ42wlqo+XvsRo2GnCdAaSRXn4b35MUGIqzz?=
 =?us-ascii?Q?AMBDbqIqvbr7IzVc5Y8sOb8n40c399e/SPsiG6cXMD0tyMd/+EWf5eACics0?=
 =?us-ascii?Q?AWfH3VZBlbRJoK+dj5axibJ5wmFP6d5SzHuwBiAJzOjHQOcsjzaVFuSRhVPN?=
 =?us-ascii?Q?PCwV2ygkk+DXkAouvsYMQOyxHU4KatKqIxWc0RuMrc/k/f8S/0UKOdMg1IPv?=
 =?us-ascii?Q?LXtxg1UnLh7t9WGOih7oYyyHoc9hOPIk4xRn1TwF3opuxPQ6XPaUJN+kERlK?=
 =?us-ascii?Q?chBQt5dQnTh3V+32GSmFp2PnFKM4ATg0GR5yqZx8hvRElAXAYh2vpvrspreK?=
 =?us-ascii?Q?gLSdoRrlYrl0z+rkk7BEeuFvLxrVyIeNiBqiqBjk0dtJNrmJo6yaW84jHorX?=
 =?us-ascii?Q?WVu+6pJuDWWbUnS46RpzPE1Kp3hb93ki+n07jwxo1BU9EcHl+2amB/KBNv+1?=
 =?us-ascii?Q?0XLYqKJG8tCe15VgmloutVZ1+CqZhvJ0ZYMjrtW/xBa1g0BwHJNW3W59HVe8?=
 =?us-ascii?Q?loqbkA5Y6Y45ENCjOYMIRW62jmh+OxtpY49UmItoutAPZBuHwY7LdcV2FMfE?=
 =?us-ascii?Q?mt0k+F6QskDD+4dxWAskbD3aludhq0fk5NsIkNhjoloWM4cXfJJVhPmIgKjP?=
 =?us-ascii?Q?5Ngv06aN+mM5CsUMQeWe+MiiECB+TopFW/l69HIrPPZq8WyTRX6FfbZURE4m?=
 =?us-ascii?Q?Dp+1BxwVgR5WeZagC3l9BK8J7jKIK0k4YPGuSun9UlmqNzq9uRwVgTM/cw19?=
 =?us-ascii?Q?IK+0HumbTVVQ3WuzOLGZ2DLfh3UA8jUE1nZLOVywZgSoV8JmWjS8N+T9Waup?=
 =?us-ascii?Q?vXIt4gOkXLIx7w1MH949DxounlgaYy/F1Qb9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:35:59.2291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a340dd-e124-48a0-dab6-08dd87875c33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274
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
index f3bc481f2..9b817c98f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7442,3 +7442,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
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
index 0381c82ad..9b5a940f7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1280,4 +1280,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
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

