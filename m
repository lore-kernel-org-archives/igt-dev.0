Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B93C54E59
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9A210F298;
	Mon, 26 Feb 2024 21:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZYvdY9VT";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9910F294
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg+OImGGECXww4OqWuGqcHvGj9ZtwsF10CuqnNuSr1WKIl+fAXD5KgKmQtJD9KFzM/E6xllfNrDDlEed+KXLaWKCJNDbqjsxNbW20T1CSZu4Z0puV4DWDBHvAJ1lU7UyxjJMW0qv9lGBnU9nenypg1zNwXfQIMjYIJjYKNeVIScFsGi39x9orym5y822GXZaaUBtxOTzNKzs7193M6iTiNY1fNHa357pw7keffe6Obsmek6xggIsgdx91brQ6BRYO8diFMYfSSVrnCoLWWHpUuSY0ZPmxIUF0axUub8OuPYjliPU2GXYFJWrTWswgXwovOtbNDXpYH4pqij7JAiiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/JxppD6SwZ56E/UuQ8VNH4fN6myxsyiSJjBEfe7lQs=;
 b=A5ko0STLBxiMBEs2zGRyy7sg1kxQ3+Bt37XeWnnBLBCRsMnCACNt6LoTZO7Ie6sL8WAsu4L4JIjOsP8eiYQGb9qu/BERhoIYzINPaglqdzmDtKCAYfmXXIPVLeDVUPDf6N8HyobH26QA0l9lLp6xOrWnVUHw7i6uM7PyofpQwMQbfGdzKs4PH5uU+zza/xA0CG0/zzIgHoIFcBPSim9ZD8i4UPRDhZ5UBOS7b9goaqfkxsmNlbnUMn8h+A5pX5s8eYgSjPQE7bYrp1gGGn+g+Hx5TLobv2C1JPAxtdkFgcXCsS00VsoQ67m9RQcBsuUKJyeeYU3Wn1BDwFx3CYZYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/JxppD6SwZ56E/UuQ8VNH4fN6myxsyiSJjBEfe7lQs=;
 b=ZYvdY9VTHh9c4zI9pgrNPY22E/DSqDZoKunyRUdaWWN8TnV6OIgnlZVbEAk1/FIov/QC53EZUCu1CjNkTi8veZ31nEf5SLyemcldaYmxJBhHfpxgiuECxoMKV6T4JDN8/8V4l5HrM5DOuoarv4W1AjF/zk+lOURfN3znqkzkMAg=
Received: from MN2PR15CA0024.namprd15.prod.outlook.com (2603:10b6:208:1b4::37)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:37 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::6f) by MN2PR15CA0024.outlook.office365.com
 (2603:10b6:208:1b4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:35 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:35 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 13/32] lib/igt_kms: Add support for DATA colorop
 property
Date: Mon, 26 Feb 2024 16:13:57 -0500
Message-ID: <20240226211416.100660-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b298128-d1a2-44dc-6071-08dc370ff047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpx8eZQkR/EqpIHWb5KcwFlw41QZLQk49WCx4ef+xuULVQqpiMum/kNNrOX6z1x5AnpAVOB/aE19BswKIuEp0KQWpmZdVkspfnH7Cn3JvH/2tkatbGG5CPYyM4uqal777TJss6sjKuefsE8IbpcDJsuTw4Jmt4uDQpYXi7nVlrD0LYDXQiQqIdksYKMF9CbjsaT96ow1Ysjiy5LocLjrAiRkFHfCwKI6zqPBfEUbpNdIthbDrwciRVtMGxAlhV0brhB4ZQvRFH/nbiATvn5q79eiA25wjM0YUQaRoDW2phDcCunURM7TyH5XeFSB0ll3yPOvGWkxXvVEnYj1Kq2VnRuPHd9beeDqDU6IlncKqw3wzLvrw13zf9RHEdQN5BjvLDccoQzWA87uS7qQJaLrrRABdCQ9j0ErOK/ID3rgP3i50Sqg6uJYw6DwzyZp4uYk27hFhh9yPEmLH/zZ+OLSzN3E7gAsvYErDocZJjULbH1tClXZiQiHfLqd1pynvZGXiO5DeOSSBptD0yM/1a2iWUWeDiv7SFpQhp30c4LZaKzKo6lEA+n4znHBicLmfbuOoZDc0fmqpXAV+p8x69H5eAknkKSjzhQ43+tHI4wxfJgxLUB+2I8MgJSle5EarGBE/sqiwT2Rd7HZz6bMwaaUxnFjvHdd/m/WO689nRVITbaZC0/8Jw1KGBs/Qp6fZBKrP3+YmhjSJGZC6kHgvjWL/PCjOHJgCfF2PsKb5zSRxiHoQFR0ZPnCbJNTqZKswqee
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:37.4545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b298128-d1a2-44dc-6071-08dc370ff047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ae4ac3d32f2b..7af126f54c26 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -689,6 +689,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4242,6 +4243,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 	igt_plane_set_prop_changed(plane, prop);
 }
 
+/**
+ * igt_colorop_replace_prop_blob:
+ * @plane: colorop to set property on.
+ * @prop: property for which the blob will be replaced.
+ * @ptr: Pointer to contents for the property.
+ * @length: Length of contents.
+ *
+ * This function will destroy the old property blob for the given property,
+ * and will create a new property blob with the values passed to this function.
+ *
+ * The new property blob will be committed when you call igt_display_commit(),
+ * igt_display_commit2() or igt_display_commit_atomic().
+ */
+void
+igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop, const void *ptr, size_t length)
+{
+	igt_display_t *display = colorop->plane->pipe->display;
+	uint64_t *blob = &colorop->values[prop];
+	uint32_t blob_id = 0;
+
+	if (*blob != 0)
+		igt_assert(drmModeDestroyPropertyBlob(display->drm_fd,
+						      *blob) == 0);
+
+	if (length > 0)
+		igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+						     ptr, length, &blob_id) == 0);
+
+	*blob = blob_id;
+	igt_colorop_set_prop_changed(colorop, prop);
+}
+
 /**
  * igt_colorop_try_prop_enum:
  * @colorop: Target colorop.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4d5359c1c197..d392ecfad852 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -352,6 +352,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -849,12 +850,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
 
-
+extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
+					enum igt_atomic_plane_properties prop,
+					const void *ptr, size_t length);
 
 extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
 
+
 /**
  * igt_colorop_has_prop:
  * @colorop: colorop to check.
@@ -896,9 +900,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
 				      enum igt_atomic_colorop_properties prop,
 				      const char *val);
 
-extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
-					enum igt_atomic_plane_properties prop,
-					const void *ptr, size_t length);
+extern void igt_colorop_replace_prop_blob(igt_colorop_t *colorop,
+					  enum igt_atomic_colorop_properties prop,
+					  const void *ptr, size_t length);
 
 extern bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
 					    enum igt_atomic_plane_properties igt_prop);
-- 
2.44.0

