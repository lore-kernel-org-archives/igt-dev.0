Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435D7C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAD710E7A0;
	Wed, 26 Mar 2025 23:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sQHHqgWs";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FA310E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRMOiWKMkui3b5pehBs0WmQajm9IGPb8rornkwxbs+TZhbDemCnJnZpkWGhOAmV8nCYy4HIpKEnpARXRl6hLgVqHqd1elzbQN83G8G1hdkCT/7oE2nm0xioN6Jm8xZ/4WjGz2wvTqVsg4CT4yjUTinEu5TSDf/02oa4D1SNm7WZIUWVutPLU1znDd9nN24xtm0qtC2H9t1U5HU3CyIgfW7R25clAA3cdC/yi7zHXLdacMuRpCKOczVI8j7RUVn5CzbE+E3dGmBPZ1rYSWm/fp7RkGwtzqFUZk9UHSjiAau/QknhKmKm44b3EurFkBI/Brg4HeBa1LwWatnif9VhAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbCOJyHsYStejdmJprdAwRi4Mx5yEg58KSsydDT2B+4=;
 b=bkTvIZ3wByW6F7yTVy3+dz2DtokmWzAdxoKxrj+UZA6NvmLYEcnuFhRFSEL9nVStNLTZiySS9D9ITo749hUesxQEntx2VmhaFG6MABLezdAG+MxA5D/8bHAZPXd/AueBPtfbJ1ZRCxPbwg5P+Ukq2LhN/pXJIGC/oCt4UZWZGsZeesROobkid5+p60VRH+ur1qPRjvZ/F/JlC+mvuuAWhf3RA9kfOf5Z2kuT4k0XY1yWJBzn4asuKVTqLSmXc+IVZZ+MQXzIrjrf1uOy01guZKkY2yJTYINZNLRSTyIeAaGFGMh2iwigEAkSpzatm0WIKnXU11ILxd5x1M6cXReI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbCOJyHsYStejdmJprdAwRi4Mx5yEg58KSsydDT2B+4=;
 b=sQHHqgWskTULznsASifJJdhFW3nzcgnRziN/2yG7cdAoSQvuFzNkLb6h/x2EqALOjM87a1C9QHwB0IWOPp8cGQy0hBUfJoh6IOtzXItrnzg2hKDEkhpFrJ8yzx5mxbPf9gGBrOz1klexM5BAoiXjmYnVaycQYm420Ck9tWGogeI=
Received: from BN0PR08CA0030.namprd08.prod.outlook.com (2603:10b6:408:142::9)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.38; Wed, 26 Mar
 2025 23:45:32 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:142:cafe::14) by BN0PR08CA0030.outlook.office365.com
 (2603:10b6:408:142::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:45:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:45:32 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:45:31 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 30/37] lib/igt_color: Add 1D LUT color transformation
 support
Date: Wed, 26 Mar 2025 17:36:02 -0600
Message-ID: <20250326233609.2980110-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbffef6-ae94-4611-5e73-08dd6cc04c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HkQAbh6l0gVxKVePc2I65rcMXE4eM1kODFMFB2XrcQGZix/PCc0Y84hfe7cy?=
 =?us-ascii?Q?Q0JbVhXWFYwfhGrfT4/xIa571d4wivICIAyNKtBFFt5LIpxpN4esgiCzn+GF?=
 =?us-ascii?Q?rXtSxuw94TQg1/eSN1WAvJ4I1JCEDu+QtoyqbxWjbVQTsjKzOxxVoIRjlONF?=
 =?us-ascii?Q?vo+WFMfUHywI46nvxc6+WliJZpW4xeR5rELfxPWhIuRSSbzto9mUmDMcRiiB?=
 =?us-ascii?Q?O9GGObrb+MVim1lUME0HxyYARRk6oZKY5z1NQsftOLg54MJ/efKOsuw9qbtk?=
 =?us-ascii?Q?IGFK7u4ziyJPT3vUM36WQrG9GcsNW3yAZ/fa1tfWpYYnbDfe/FjSgILJ0y+O?=
 =?us-ascii?Q?D31bsCxUiT539QFOCXdBlR0N3NJ4tReH+UoPLWzmxqPO40tID6Rkk5uNv73i?=
 =?us-ascii?Q?VYacKTxtfI7VPDUjfLzCobDXXqQGY/25WUUs/qmMkIrbPRu2tFeZBLj4cOCX?=
 =?us-ascii?Q?qvzODGMW/abNDPGrrledJqa5fMsX15D9iq5Qa4a8JkBDBflIJf9ua79Bob8k?=
 =?us-ascii?Q?NHCbbK1zgZNUlnjn0YA6E+M6x1nOV/yb1duvtRRPTgQPM+kj9+fzKeJBc/tt?=
 =?us-ascii?Q?31PLagYF3h5HHLbg0l0zsdxNf1wkrLW77QVKYfnqkseTL9+LhsgyBxvhi2Ut?=
 =?us-ascii?Q?XqEoKDywaZLzrEA134lWqzn3Y9wrWYS5elkO45ek3eQ3FRaqww4kTqEYzPLc?=
 =?us-ascii?Q?XYkPXtDerZLulGLL8Y+VqvafzhWpUtT4ysxgkKDv81gsEN4n5ePbv6+Vu/jL?=
 =?us-ascii?Q?fwNeNGoVoFPFSbHuYvge84ng2ZZri+v1SpGlFNR2zCt6wo17uzFlwND0hMzu?=
 =?us-ascii?Q?fwFk1A3zRoGg6WCRr22lsnrQQaeDK6bUFwgdUV5OfYHX7FPRx9oKgjmj28f4?=
 =?us-ascii?Q?bDJvVXV+hVKlqQJvaeOPaD/iuOtRvcOu7iUpSfWBTit/Qka4VoEk54iDxb3U?=
 =?us-ascii?Q?idRNScMj7aCB4YMgXo1YJ/0Qc/seNRD0rD89MO5KDfp9E9QnWCwDRf4bcj5R?=
 =?us-ascii?Q?c6K69B/uIo/QED8QXL5ja89B3snDtvdllvZBSQoKd/JGMUjr8dU+W2X3Bo6D?=
 =?us-ascii?Q?kVnmJ0h9PYtDpVl88G4TlCP1S8LXKrg1aNtUrWPKP5/pLhWtyu+9a6BL3eEp?=
 =?us-ascii?Q?2cLS+OLoJ6beoeyz1UZu8d2I7TAyiTqUC9SwXJQ6hef0VEozzmfDaBL/JKHS?=
 =?us-ascii?Q?iEwiFIs68y+39zEX6YuMiate2KiWQzb8cgKFBzBSLIIEGNXsLDbcXeo+JQM7?=
 =?us-ascii?Q?wXY85yfbamapFntS/K/ktC/+MjVWfWhomQyJ1XDb9tGRwoQe6t6O6ZPAnhU5?=
 =?us-ascii?Q?5SE73OcmnHZbGMiFS0DWmgxKWsOeM3JrNgqXZbEjFGkIDp5r1PvgoGQhrAqm?=
 =?us-ascii?Q?BnFfNIm6ZSZpezKZBa2aEl1/btWp+YfkQ1kR1Pn5/q7nYFSfe/sgCDRxeyNt?=
 =?us-ascii?Q?jETb6uD6vhUPVA8TZLoZqpsk5dSVBF/LJoDuXI3HmI8qjPaskUt9lMlQvzvZ?=
 =?us-ascii?Q?QBXglwKqAqu3Dd7fv9A/eLDOk/GD65EfGsBr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:45:32.7136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbffef6-ae94-4611-5e73-08dd6cc04c61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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

Add definitions and functions for setting 1D LUT on a
drm_colorop.

Add support for the SIZE prop of a colorop, as that's
required for understanding the size of the LUT to
construct.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c |  8 ++++++++
 lib/igt_color.h | 20 ++++++++++++++++++++
 lib/igt_kms.c   |  1 +
 lib/igt_kms.h   |  1 +
 4 files changed, 30 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index ec8b27d1e..cc5ee3b0b 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -440,3 +440,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 	/* set blob property */
 	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
 }
+
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size)
+{
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut1d, lut_size);
+}
\ No newline at end of file
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 813bd19ba..4a9f9b7a3 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -15,6 +15,8 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+#define MAX_COLOR_LUT_ENTRIES 4096
+
 struct igt_color_tf {
     float g, a,b,c,d,e,f;
 };
@@ -35,6 +37,17 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_1dlut {
+	struct drm_color_lut lut[MAX_COLOR_LUT_ENTRIES];
+} igt_1dlut_t;
+
+igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
+} };
+
+
+igt_1dlut_t igt_1dlut_srgb_eotf = { {
+} };
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
@@ -107,11 +120,18 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
 
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_srgb_inv_eotf_custom_lut(igt_pixel_t *pixel);
+
 void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_eotf(igt_pixel_t *pixel);
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b20cb9cda..5e0d710c7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -709,6 +709,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 580f21141..33bc8854c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -373,6 +373,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.43.0

