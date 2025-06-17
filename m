Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61751C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1619B10E4C7;
	Tue, 17 Jun 2025 04:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2FnMFzmH";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A7610E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfOVK9UxQofdCvtZCGJQh0rUOfzTF2bTD1vxCKgGnTsToGYYbLe63j4Qfvy/gEJkTZOOrYf5vCSX38HjAmyRKYIZg6lw8wDZl8l6i90Qz4U3+Udh6v1uHUzF82QlmEfQWVpX7qd/PrGdStOBtHVaqXsDwCna1O85J0s6KXZy4FK3pPtJ0tuCSywWgbrmCjsREgRZ6uWuNalW1thcSw6O7wgTfrc0BfAr7EhAgET4e9dTHvxhLxigLUoCbRiWkQBu86Oe6EImywsWph51+N20UZLadOIWziCdIDnSSNz4U1+SRW8K10uKlR5Rr21WWso+IjKHgZGxstmZ1mNtSjHP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtRj01m2LoGE945WfEtSG6eVDOKMG7rQinB/TcweKN4=;
 b=VyiPnkDArFEEye0iIOYQpaNMdwECIbU8YWgVK8A5kVL/jNvifrioNrhHbjQHLTw/JyJSgO0vG9LVD4wmitlRXR4U27h8sA9WbdkIIki8Qxz3acUIZohrNYIIvD6AzbaPjAigHoFCoGqU4yPl378dzWQQWmcEhzYQtDddhTY6ij4ugGU3vliF2UZGY7VR8vWCWhIokAQcqgkN/M/kC0A2q5gJeIyjr9tcOISzvTpJJuAUhyoXKrEnla3ew9fMYkYPBNtC/KTQxVgL/s0DvPeZM0X20sHp1vEuejmYVm39eq/0V9X+peeefMyysvc3yqm33XTUxtzspIhxf5e7ML1ctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtRj01m2LoGE945WfEtSG6eVDOKMG7rQinB/TcweKN4=;
 b=2FnMFzmHufDyI+8ZK0zfxnNYNPD2lkcKRnFTJPm9y9blpKEUdXNXpvjv0kXLzTU6GaFt6C8JPwKCZ3WylLEGAl5fNMTWAqZgibBnCNaGedPuyd1fk5Tm9py72SPI7Qra3PxABgVDw4U9eDI+PAWkQqe767W9h6HD2A5dGgjp2p8=
Received: from DS7P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::11) by
 IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 04:39:34 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::40) by DS7P220CA0017.outlook.office365.com
 (2603:10b6:8:223::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:34 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:39:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 14/36] lib/igt_kms: Add support for DATA colorop property
Date: Mon, 16 Jun 2025 22:36:09 -0600
Message-ID: <20250617043631.2920587-15-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af6b101-d9dc-4cdd-dee4-08ddad58f584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TjZTqFsd2/d98+ywHIioIhJZX0vmUiRyuSoybo920EXph5OV3v4k7L5qlYP5?=
 =?us-ascii?Q?LyKDAFbCtIyGEZRuqYkxCYbhC9JYnDsoASbdiGdjX61WzCfV7GRW/AoVanqz?=
 =?us-ascii?Q?W0pKkfnbTJErfcbB7fPZvQ0/tK4X2HCgQTJ7AohBlkIXv/jQAsTEEk1jB4hQ?=
 =?us-ascii?Q?0JdOCmCzNk3AWlADb9kIq3AhC/G9xptmzDpPwoUPmOanuwC1FkNJrvxvM78e?=
 =?us-ascii?Q?L6kPgbY6FH/skwh425JPiQydu8dnvLc+zwor0xkPmqSKt3CK+j+RGpEIiHsS?=
 =?us-ascii?Q?I5FQDPGdBFuoqQHE9dvwcyK89vov2D2P4p18IZ1Z/3fO3KROeYobDRl5tGgB?=
 =?us-ascii?Q?5ugJLgpWT4HnbBsTk5/BVJEA/AWa1tU0EvQhY6+RsvGuOqWUpkit2uRSt8Oo?=
 =?us-ascii?Q?KGQWxkl2IWbVwEm6x1HuzQRvhVScdedtOaI8/XgIB/onNWDqCrJYNFlAxaf7?=
 =?us-ascii?Q?/rkrChvqsoVfNDdQX25ArJv4JBQV9vIpCZpPLjWKASVVWeE3tKV4NK8DaieN?=
 =?us-ascii?Q?5GY8rICbyUFWRj/sxKHL7qROwKqhPsFmzxNXy/Rd0DYX3b2i24YbYFKBiSZ3?=
 =?us-ascii?Q?wIKwfRlxOFT0nmjRxeOfxPE8KeOaaglTb74/3w6mzhrqnRDV8Wkih0G4YL6y?=
 =?us-ascii?Q?68IsmxIUaOSZXZrwFsKuvkcBStTvm4gUbqeuzcWaU3Kvw46QelFnAhhcIRDa?=
 =?us-ascii?Q?9Nck6lOC0vLJiU5kqrbG3pTXeNX+KC4LBZM6zjR8W8GuAcovXMt32AFZJxXC?=
 =?us-ascii?Q?3sA5aksrJyWhUc7vzoGcdZvKmwwxhd0FyFVXJzyztJUPhXuLcPV34wAUasdj?=
 =?us-ascii?Q?4J5QfqEJtPVqE+swEbt7HLDiVeAqDeNzFj6xm8dnnTKondyMUzl72CoWFH92?=
 =?us-ascii?Q?qmtJVW1bXH5Tl6uadZGGG63Ias/W0Xeo6cHsHjfkzKXKCpWDFA+/1QlRf/l0?=
 =?us-ascii?Q?zgBjHwNoy4/dHEqIwX2/f6BFZKDvwo7lTIBRQ9AITc5CJ9iuRuunaSoHQ29f?=
 =?us-ascii?Q?rNNA7kxV91mX1dsDUTZuk5CCrznten6D2jhDrHzOX+k9Zl7DyBsOeaVXPDu/?=
 =?us-ascii?Q?osS57zqqOggZk/mVbX0XKYGu7AiGLDx//ibQWmQ/DQd3ym2YofB0jDZiL/gE?=
 =?us-ascii?Q?SXy3eLOf1sfTl6R9L3Xkm9rTkiUeqcfgFSZD9hNZ60E/r3IcFXEXEYbd+U7R?=
 =?us-ascii?Q?faRGUrc12AqLndVM+z7vBanIcGHYlHgtfTqiOKi/7hxEi1e+x5FoQ55Zm94Z?=
 =?us-ascii?Q?ccHv+pxAg/W+EJCNIvzr4XN9C68Riwy30NF2K90ldxG3prdxUB2nm1mi6/wk?=
 =?us-ascii?Q?BQUFAK4drhG/pJwvskYFUgYxTkGwLWHZW9djoTIoMu11WwAovOyMaoA78doH?=
 =?us-ascii?Q?kSSGi/CJbHI3CSJDx6DVomx/7n8bkXCPpNXgFBmdo4nXyrwhtw5Rv+iRbuX+?=
 =?us-ascii?Q?ALQFPiEgiiM1Vhv2NC0M+A18xdIWgNI1PVgLtiSTNt0IFadA3tmPB4h/4xXC?=
 =?us-ascii?Q?iZhvThKAj+pn1jJTOsgVYY9HnvhH+eI3/hRc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:34.3576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af6b101-d9dc-4cdd-dee4-08ddad58f584
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226
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
index 35ad7ca95..3cacccbaa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -709,6 +709,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4462,6 +4463,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index 6f9eeb578..dc7875136 100644
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

