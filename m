Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4123CCEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3AE10EBD2;
	Sat, 15 Nov 2025 00:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UNNdWHkt";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60BC10EBD9
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2LoJhNj/pN8bCEEAOvzSZH0nkKc598CoCPr5/XoUAPK6T8W4qVjn4DMGrF3hKyyMqxW4rMGs7RqoJCpAW7/f+J+KI/nabwovXUM2zdXtQHJrk17OfvzQ1rZ72w8zBT+fQiWWk8rGee333e7/hvAigIl8vta2CVa9rw1lqza9L3UgSgbbbvfVr9YK4OWdF4x/Ucmg0S7QPlaWVkLJe+Bpaiw51C9f9TbEZuWZBSX4EXnLgw7x5hC5+tYPQHyZ7Uv9POPJRp8s3wp/Wu43ZemZb3xpemDGSFi/Ddou6nwsnSMvPU6zvuLr8B/at57F1BmU9OXZgUdP8ynOFtvy1re6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjYPoEOR2sl82hKyqrIEYJlj7WOYPPevUpQQRCAEtPY=;
 b=CYxHerutQ4HGohRt6I6ayDySl3K25JX1oqr6AxhrpTV3ogk8JUz6Xa6gO1gjSCC/0yaajdnzb4Qf17zylQ+Iu1OuaLFI2w6zd2Ojtz5kV2vQwocosBHS9+yZeDWmM/Bp+Kuan96izw9q1P4feaj3zOFzOkzEGmwzkF8xJXfwXP2Ol28MQhQFQVfvLQ60kaClTR0meIzhgXVD59dy7e1NA2y/dxFno62x/Arye0tse00/kfbXk0YAyVcPAzN3UZXTd0ZjZ8ooGsbGsxuiNMGQOyP0+QdnZfWcwMw5EbExMwNkBOlIDSfzatJGJvSlU2LQ3bnnJjGzt/fzyVDRTIXrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjYPoEOR2sl82hKyqrIEYJlj7WOYPPevUpQQRCAEtPY=;
 b=UNNdWHktrWZTnOnHfplqwbqBieNDWn4ND4x5rLJonLma3DMFhDlzLQLgrlnBuZlP3Nk9cgWmTGD+4tuZsCXFb6LsMXaFl2zuh9o2wOko5bt19ld2EIG5qY1M1dZvruhQCFMVriJh7kWtXz9ruU1pS8vbIASS8uHzb9GVaFQDy2o=
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 DS0PR12MB7656.namprd12.prod.outlook.com (2603:10b6:8:11f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Sat, 15 Nov 2025 00:23:53 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::b9) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:23:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:23:51 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 25/32] lib/igt_color: Add 1D LUT color transformation
 support
Date: Fri, 14 Nov 2025 17:18:34 -0700
Message-ID: <20251115001841.3563993-26-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS0PR12MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: e00a87d2-5bd0-4d17-ec07-08de23dd41bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TXgfBjer7bqkY59jtTdaROEhRUsAYBxfVXXmDWc5qSQ1LIYEEyrBS9ZsiwqD?=
 =?us-ascii?Q?2VwtM5oENejsPjXMqvUsIFDc4DdHzjAY7KmjzaM7W8YJmk74Ph5QGneeWI3S?=
 =?us-ascii?Q?R3d4HoQ0xH+iy6m9LH9qxDrEt0it703+f+3sX70bsyS9EyK92x9nSXkN5vtA?=
 =?us-ascii?Q?gAL70WY6Druc9pI6C4zf3QvYfI8DpWwnPFKtTtq1VcBdvCBMHR1jWvswGMG4?=
 =?us-ascii?Q?MCYOQIL30TJGy8II1zUA7znmMu/V+QFWIpiBkgAcVq23ouKGyWu5wJJKGnUY?=
 =?us-ascii?Q?2SKLnOUJubQ5TOvytkjo1VS8u8zxr6Ik/IBldLCgu389zq7tIZ+43GMqG79r?=
 =?us-ascii?Q?+fyXiEROkhqIHSksk1ZiYsBgI7HGturAu3gf3T5p4uDP/OOgnO21mSL09CLR?=
 =?us-ascii?Q?tA685HmONEQu9PyiBRwYJ7PSWh2clSZtEqKMc4s2XvBz9HzB3fDHcTgOaUrC?=
 =?us-ascii?Q?VPOSvzC5p2rufncB+ycu4XTjVoSqFYxQ6iiAOKMcc6R45VxiYcV76DXcRGIo?=
 =?us-ascii?Q?VT8Ei3wOOfA67r1afCkXtMQOeKDKgaM4SKXrBzgONyBR1KiOZozpLFhFxUg0?=
 =?us-ascii?Q?BoSfANcSCjvr/IGjAxdYSFqJTf9Eoh6VJG6BL3wnVC3E5S5G0BWU8f6mNWsn?=
 =?us-ascii?Q?CMa+L51fQFi3Ffyy6BOoHuzRPyHuzzmNS3wTDkxqfe1m+fbzX9R6ugHTzcKy?=
 =?us-ascii?Q?hIhktw0bXyLoqpUaqTzJqz5gX6kUW46Th12S0F1ftjOZqDDh3G6fqldvmAne?=
 =?us-ascii?Q?x5+9gL2hj3Ibz5M2gT4RxGALG9oUfXY1hGhfkr3turcN06QYRFPjl9xJYxZC?=
 =?us-ascii?Q?cPBU4hfhIRGXmvPah10Y9YKU03SufXXbigXARby2KSaJsxMDiFIAG5YnjZKp?=
 =?us-ascii?Q?bUiTAsyWLnEJkzcZoQ3J77GWbBvVqEbSWRI8wjNnKxis0y/RYVXQnpzEhmON?=
 =?us-ascii?Q?Pnhymix79f2+iHOeBdBLTqY9+w6vRTwowxlS8qTDPV2Ij4u109SxxRIOWhj5?=
 =?us-ascii?Q?hfYm7k2m2Xqvbkg2yhUlqhR+kJ3aWEtSk+5MiZhKnpqzyRBj/74T7yYkPyDZ?=
 =?us-ascii?Q?YkrwbsUnVY+CU8U/vlvSfWt2mP1Rw8Yb5gzqfMDC3wf1fufzW8ujOT2HhGwW?=
 =?us-ascii?Q?o8Er3BYNj2zEt06TFVzPZ6cLKGkG4Hravzj2QwsShqsAiBMBIW9+4Bden8oC?=
 =?us-ascii?Q?pyNZmCBy0oTm2mc+1xLfDIJqPe1QQiydkhcNRHkOAn6Ma6Kt+0d9cvQaSHU6?=
 =?us-ascii?Q?T1RwKgEONDKuzaz8cJlglBI3pwLx0jJWp2G/Z7xzVXEqMBWIYJJHo1rVeDAz?=
 =?us-ascii?Q?zIiypBkzUsG2R3hkKFZm37ieq6XMrAOup3CUHgvIvKNOGsmHmyzrtUZQVrWL?=
 =?us-ascii?Q?dLcCQWKFsQ8pt73svbaTbiC2DoCZDEtL6si6ov4nbfrLG3Vzi5tmqFeC6eFp?=
 =?us-ascii?Q?kWWdh36O5ucRHAm56U0CXxMKJYvY1OUblTQwaWtV5AP4E3B1xO8eLqVs+FSW?=
 =?us-ascii?Q?UpWXA1kydXTDK0iZykegeOoLcj3/JRTm/Z/9jkDpvpj3ev6Vh3Q8nn7Lkqze?=
 =?us-ascii?Q?QEiNTP3mBsLXUL2mAws=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:23:53.0034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e00a87d2-5bd0-4d17-ec07-08de23dd41bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
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
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c |  8 ++++++++
 lib/igt_color.h | 18 ++++++++++++++++++
 lib/igt_kms.c   |  1 +
 lib/igt_kms.h   |  1 +
 4 files changed, 28 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index d3c030199..f6ce69d9f 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -428,3 +428,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
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
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 0fd9ba691..1a39ee734 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -17,6 +17,8 @@
 #include "igt_fb.h"
 #include "igt_kms.h"
 
+#define MAX_COLOR_LUT_ENTRIES 4096
+
 struct igt_color_tf {
 	float g, a, b, c, d, e, f;
 };
@@ -37,6 +39,17 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_1dlut {
+	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
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
@@ -93,6 +106,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const igt_matrix_3x4_t *matrix);
 
+void igt_colorop_set_custom_1dlut(igt_display_t *display,
+				  igt_colorop_t *colorop,
+				  const igt_1dlut_t *lut1d,
+				  const size_t lut_size);
+
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8f23c6e32..b31ecdf52 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_SIZE] = "SIZE",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7475c1e13..5cd32bdd5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -376,6 +376,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_SIZE,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
-- 
2.43.0

