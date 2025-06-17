Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703DBC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACC710E4F4;
	Tue, 17 Jun 2025 04:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3zuUxZmL";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315610E4F4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoG/okmIDdlBN5QqlfIX6OMjtGBtg7RydeAuU/prGqidHzIAQq3jklrHGfXtg5OrGy85gii92vpjLkxQBsg7m4lHKOFDoPhgLv69r9+hupmvjSFbbFC0FTKP7GBrrmS1WVNdkKEFftOe4lM9FhJN3l1XLzCvSmv3EI2KtJ/zTT55dBgrufxHLyp1vzcvJHfywD3Vf4VmkytB5KtQW1hloiAyiY0TXsugHqp01iUOu+ZT7pk4r7+6YloGAJUk24DIfjGjQedH1z8XDOr4+TCti7YIEtpMyYWG/tGtuUQD/VweIm2aFq1s6pa6eUU9U82Duc0wZddR+GkRRvQRxnLRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFFkX9Uf+INJtfoaPrtp9GifgLVe5uXtwjVu2XyNlLg=;
 b=fimJh9TEsb+9EqZQujg09f+1PeoVpdvA/QcIffr0mMzoOIq9yf3I0FrqTpz8TPP9VEUkM+yaQIkh943MltKkvnoDzdU1r8NmTKgXvDiT2woDw7+Pp6ucFEHXMYfGLBUBwQ8XNhTfl15r+91KeuFr/Sly97yS2z+N9/e3oZByS2KQFqEUe2eYZH6VmRNai9ogNDtqXOxprmd/UXPeNdI0PXZQRjfmdHbRxDdM6yOrGzn+KsXndD9iw8geVrPrDgwJbj3QpGYHNOV+Qnr84mWjybBfyShrkP3rub5TIrfJ0yYOO/sQ9XkGwr6IAR7guDLLPmoF0CAQ+1/XN9IAbTKzkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFFkX9Uf+INJtfoaPrtp9GifgLVe5uXtwjVu2XyNlLg=;
 b=3zuUxZmLXFCbaPu9i60yHHeiitke36M+iDQ6017bBuomK91YSkS9oa1GT/aELEXrWOElH1KjwZbgCN5bhE+BoU2m/iwzopFHLLSKFiwwxwS9A1CeAus7rIe8CbKQL2cXQJzrbtrb69VNGcwAUS37DzxeKwx1gNWYJOEG/aQSwSs=
Received: from SJ0PR03CA0190.namprd03.prod.outlook.com (2603:10b6:a03:2ef::15)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:40:22 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::39) by SJ0PR03CA0190.outlook.office365.com
 (2603:10b6:a03:2ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:40:22 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:40:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 18/36] tests/kms_colorop: Add 10bpc test and skip if format
 not supported
Date: Mon, 16 Jun 2025 22:36:13 -0600
Message-ID: <20250617043631.2920587-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0623e7ab-8f44-4a85-d827-08ddad59120f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mwgdyJIiKaDP/fGkfgFZx+OIxS3EaBbyzeWqS63qwhMo4OvNyzNbmnQf8lui?=
 =?us-ascii?Q?0n5uLAuv4CJZf30IZkBfSS5NZEat57BZHDKFmq7f7RvI8gfrOOztDHjI1bRL?=
 =?us-ascii?Q?DMvJDFL7LZpC7Y+GDX4jOd2f6TXrfdIetmN5NNWK40BRdbJHEhwk7X6tlj5x?=
 =?us-ascii?Q?I6pRmjVW/Bdr7N+qm7hrewrGrOpZz2GES0SwTTkbjV5dbB5WrhX8EwHVeXqG?=
 =?us-ascii?Q?8NwG1+QT1NEv63bqJiiklksAQbwY8r6M3JDt7aVeAorkwT2WrIimmc2Az2lH?=
 =?us-ascii?Q?LllDc8d5gKpGsSmLW9K9n9L2OzBYxbZc9FjQVt+NbONBYRvKoKVjAoNm9E/j?=
 =?us-ascii?Q?eWVPWeVVEYlVKDgZlRPJ9fJBtP1q4Iwe+QGuYNJ2LjdBklZwYPktrJO94v/A?=
 =?us-ascii?Q?k3rROnuWNfSeEr7rEkiKFyYwJGBGu3fFiJkVi70Vc9D0RFkJ/rkvJomxCRHE?=
 =?us-ascii?Q?0VSRKr6uEsJI54nenA7Y6itK1dTiktqjaN84lHfiEUSVc7qAyDANW0e2DVQH?=
 =?us-ascii?Q?PgcuxZpvxAJBL2QVssTr4a5RQpcjtOnZ1b7jw3/y1+UGltClKip+DpOcjr30?=
 =?us-ascii?Q?NjufC9LQ3ybSiT/nMrK5QdEqkXfuE1hJvfK81j8uwrCSipDPuiAVqSbZabWe?=
 =?us-ascii?Q?/BGtoz1i1DYRy7v8aIkHl2uJ/E/5FL4jC/jgQKBERomcKYwQBZ+vCBk+5o1Q?=
 =?us-ascii?Q?VqKlvBeBcE0GI/hup4/e/K3vc0fZDgzGu4JJ9c6/s2LBlqWru7GnGOD+Yt1B?=
 =?us-ascii?Q?zpxyflhQF/hl1kqYUQZcr6e1799FsSf68IqxXU9PR3kpizvLtld7e5RI+Hst?=
 =?us-ascii?Q?QdfVG55nYAEVFACilQ69OyDT4UcmOWckKHVVJ34dtLcXIc5cCYqlUGSWbKMQ?=
 =?us-ascii?Q?aQf4LOm6tuJ77jv7VDXh1BvofbLhppInjT8ZSpDB06SapErRNn112YY8ehsJ?=
 =?us-ascii?Q?rU3sI3tzrMr+v2iKg0nLkp5lGa4QFP+adlz25yNfVJV3d+VQR1poOfVOK3CR?=
 =?us-ascii?Q?W1pqTq9M/ev0fkg39Kt+0BrKp3SV1HbulFQ8NK1bEPYXdaPyni3dJ5s11Bq8?=
 =?us-ascii?Q?ZbDnoPsRhQ2XayZsztahJHZyJoKAc4vG8egYb7l2I1WuqAwHCBoHdPaffLFQ?=
 =?us-ascii?Q?G90A6IjHNFS0M2qCNP6vbWih+pOOFp6gHHgCH1Iqf2rrh/1h1CdeBrRZuJya?=
 =?us-ascii?Q?2P610xBbBzzj79im46asG3x+NV2SFuHy2u9mc+w7dZzDnuB0MzSG9XtixXlv?=
 =?us-ascii?Q?4f8oLk3ko2Abpu/O47WUL69pWFQPUQ9afwDc43FGyqG1QxzlnknOhTxowiny?=
 =?us-ascii?Q?zSbHKrrk+9EfZKdv9DTtK4cV51IwhTyeVmhHVInpKJtcpEpJkJOiHLI6ubBd?=
 =?us-ascii?Q?kU45LDBIADpt+SGVLr79Sogw8bX1dVsU+mHwVkcQdsgvgdTd0Hv7fZlgyT9g?=
 =?us-ascii?Q?WJ1p0iGWupTxJqxTf0SVMdGkTAFN2maz/nkbpCPqSvNyJQ8bVzbI4RHqh3nB?=
 =?us-ascii?Q?zEZ7mrtFrRxL3/ZUxm5kHm/fOn/RsFDQ/hy9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:40:22.2387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0623e7ab-8f44-4a85-d827-08ddad59120f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
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
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 83f121073..f99d0da7b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,6 +40,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -73,6 +74,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -81,7 +86,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -518,6 +522,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

