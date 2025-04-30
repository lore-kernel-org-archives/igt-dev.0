Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7AEC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A9110E682;
	Wed, 30 Apr 2025 01:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dvs0wDRz";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE5D10E682
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5/SMNBew56BEqXa40E/No9iSvCp5a08gHGPB1we+vmCmRfjk6qFZ1rjczIg/+njWIeGVDVgqCRg4GWfFcsTIyfZTirEJyv1FHJbPBb31Cpeuq34i4jAiqGjOEKoWVDnJ7vt4NelgTJqbTx3L10v5SygB+1wzUdYUwBK6sDn0Cm82yldkp5jQLHI9mowXgAoIVcPSodqmUga3T9u9yWD4vT7craui6aFBa9n/EDN+iXBtFEfSsNI6lWLlPio2jel1CoyhtYOk1FtOIhSHGrU+e8s51KTJ3wDM+Z4T4tVzjtr52LMg9bHOUsGi+7NZtb6o/TmQ2TJNgpuIP7yJLVRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoJXF3T677QBkOW0MzMcKCm779VgvOqX5dpjs++MT2E=;
 b=onZh4X760bDB4AHRaaCx/JQjbJNlG4vDVR1oMFB9x3cUxQ6JCnmrnJ817pVoWw44QI9QjV2h2As7G7Tao2NzhPV17mJBBPq1JJUsrdhOP4yQL41p01KCHtQTznCE9cqHh+JPTi6jZ3jypSpQ7LKU4fV1BQ+9yiOOZCwXH+1/EkKDDP0FQ7q69VcjWmsAs4c6JQlnImJ/JtlTw0lqR8UDacWsLtU/DovU6UqKB5yQ4t4McT/UilTK8Db2ICDbl6/FdtyUtpHA3Qa1DNSjZCTJWnC4dNj/JH6mVAkP2WjJ6EZd5//jBYi8qpayfGXKCvdLbuZi7YA9RKhg9J3dkx2goA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoJXF3T677QBkOW0MzMcKCm779VgvOqX5dpjs++MT2E=;
 b=Dvs0wDRzAXWMM7uNzXDKPG+EJMC2VCUzB39NIcqH6j+DxLCTWXBGFC4ZgoSLIH2fiKXhWkYbaoD3Z1OBPEIm4DQWCBywvDuGrnqaaYujA/ea4rkqeKYE1Q7DAahgC53h7oYesnH2ve3fIoEsEBv4AFepBON27U7GIbe9l0QqJvc=
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:38:13 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::af) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.16 via Frontend Transport; Wed,
 30 Apr 2025 01:38:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:38:12 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:38:11 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 14/36] lib/igt_kms: Add support for DATA colorop property
Date: Tue, 29 Apr 2025 19:34:32 -0600
Message-ID: <20250430013454.226910-15-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2e24b1-aeaa-416a-7af1-08dd8787abec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mu/0TlmO+74f56TfKUozYiNOgFRI16lWy2Oiomi273hlh1TVk2D+RptpZTgU?=
 =?us-ascii?Q?KNRKiWeYXHIDNlxHOccaYo+DuY0HarCgpyEUkSwSBfjNmPHIzX2Kcsq35JeH?=
 =?us-ascii?Q?t9VR6CwtoSLlK37/1YCku7I4SDs6iE2UYjTxa3gKW4dOnBX8ePJ5qlJWOm12?=
 =?us-ascii?Q?7T65J4LSSwomAhiMyN+PioS5PXVLNqjNz6iWCEDGDXkJdKTQwlUYwj0KcYro?=
 =?us-ascii?Q?8ym5SDbDSbdsNK2yNhX3sHE3STg8NUME+KkDsTaTxrzLKmvDo25ZQSdtucwJ?=
 =?us-ascii?Q?iiqPnMDH5n+hoze2kVa3ROr55yL2jRC/E+7Y6tsq3hQ63wCjRqD7KBv9z4Um?=
 =?us-ascii?Q?ineP2iftvy07duDpvIVQo9D2RLvE4e0ucPT1lF/6n2MTd5CkuJQLc60UEntw?=
 =?us-ascii?Q?yEGYpg1uMM7/adwOejTE2F4+IWsCi368CmtbyLzFILCh+TZQDOMw4JleTE9O?=
 =?us-ascii?Q?LaxGr6W1Sk0ONtnPzxB6tpNtd47ye7bl+7n+EcdU25R+MXlc61h/v32SLZs6?=
 =?us-ascii?Q?EwtR30g1YWU6hmYJdbN4+1xUWna2soOU7QgXAnc2gb3heRjnR2MSCNsPynOu?=
 =?us-ascii?Q?usJdbziIpxoCcZWM87f8i0sbZlEGF+7dHjG2Lgtrzl4/OX2sSFxHZycEf3GK?=
 =?us-ascii?Q?DGRCOUzM9tiPFBbjHA0wTCVuHsDEOefCUQqYVHALGGs2wGqUxWBi8w0ettqF?=
 =?us-ascii?Q?q48OphgVg/fF+msnYNkoOO0XF778YKtaHhvq9mjLyXBR8Ln45Mr8KRZ8FuGP?=
 =?us-ascii?Q?0Jt1i+AS6pGsEi1Qjtx5y947FTXkMc5PnkAm+WFC5FBgmNPbVBKTRTosD0iD?=
 =?us-ascii?Q?CIweAjvb8mgwxJ6GxuUQVGADSNW6GwBhLHFWtFId9s+FJj6419XQWQ5xXqLy?=
 =?us-ascii?Q?WANB9/zHIMvZteXEdyrX7MyVHx838KQQBf1QA7fD3K9UMmhjOxrgz780Od03?=
 =?us-ascii?Q?dFNxQp/a1bFqzlvI/cLe+/bVkIVWfbJy8xBlUwyzuYkvZx4sCWmwZxhXCLmK?=
 =?us-ascii?Q?R/WvJwlwaZVntu6XowVTm4gF/UOw1tZPlMbpFi6gXvbhHqLdikXjivpsZSVj?=
 =?us-ascii?Q?RVZ8/biueqnGLaTut8l7PftDuQPSZKFjG6VLa1B+2CSmUDABDluIZrr86PZc?=
 =?us-ascii?Q?MtBVXr788iA09NdLDu6KSmAvaJsVDJIa8iq9ExWEs9ju4nJn5bY7cHXvGC73?=
 =?us-ascii?Q?aLGaq0CFvHBRvJ15fxn7tXIM+eUOj+r3QyUJ8AnxB2LjEG669nJNotshpx2L?=
 =?us-ascii?Q?FWvp6x1cEBoE4PMFMOq3D3j00jBckYo1J2lkB0jHC0eUEkXN3Po/Ps92uuhq?=
 =?us-ascii?Q?21PUwU2tfMHnQHOwF4uXsk0svTNvvQUVtXwH6EEukBvqv8fOPWscoQsRoLC4?=
 =?us-ascii?Q?6Dv7+ueJfPLf+H1Hr+iJUPC3kHoZGwWYH6wfw9ZhtmQqxtH98SQrzzJMRn8t?=
 =?us-ascii?Q?M9SPHQNe/+vbyLsiozviqWEgE7zIvI6gkybOtfKHX1nLfEm9+kVJoALPsbxB?=
 =?us-ascii?Q?rO0k9Byo8MYH7uOjsyP7QLH8ljZEfVVkVgRO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:38:12.9805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2e24b1-aeaa-416a-7af1-08dd8787abec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0df892d28..55069c6b5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -709,6 +709,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4458,6 +4459,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index 04a96f47a..580f21141 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -373,6 +373,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -881,12 +882,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
@@ -928,9 +932,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
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
2.43.0

