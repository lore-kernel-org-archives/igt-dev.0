Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD320C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92510E47B;
	Mon, 19 Aug 2024 20:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lUwKWMea";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0853010E46C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHQPmCQgDquYcFDBrMHRLBJXwfhkHN75FcufBsJaOvwJ1FVbpSTiDE6919PtsdeCBPSQW+01ClfQMo/tAfI1xTYu7wNceQtkrrybat0bZ7Ke70h3Oz6MnCTwEYc5bdRYEMuNiW3XpuMcWkcV33XWdG6CIO3mFHGpv6tspLq3byl7z8AbApV+RfhvpGuIsFCxlcSpyhKVd72YoBZ3xoDHuzx/X+oqpOlYGpXmQK/0ZIR26jSNHRWeRi5R+Qu2PDtFHcr8OiApy4dlI/UQvJLaLPvGwIo0NkKxdjD5Dpqv+WS1KB61AwjvZXXoF1UmtaM6TUMcP8EDXBJc5IWkRFhUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTdgm2sfzqQPnxMBSJpFY9c13wuFIX7dMOW/Zrk277c=;
 b=aYUlbywxBnFNa8iQT26/LXDbSErkdgpN7yltSJNGtlECi6Kuhb9LIIOzYIeuNzz2gL9UgbpPxePng/ueRM7P9hFApCeR3PxbF8gl+whpRi3itIxfqB4onj7s+9uNqlxmbPHNef5kTpfpSiy1iaGN6QE91QExMluWHlw3LCVWgvxYlZ7r2vjhNMJZvfyHlzY2jIs5vQ2WngdbmA0OiOGF89NCogKfR7shCkZfXrjn3SnQJrxZOntRkob6dpgs+9OYDGVPDISh6yeKtz7y667vvNTGZxZ9eaFGnDA/DjkjSoOw9rYoQpWeLRvW0o8euZ/SmvplKzYWXSk/oAn8GcaSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTdgm2sfzqQPnxMBSJpFY9c13wuFIX7dMOW/Zrk277c=;
 b=lUwKWMeaSUceaoybptOivMQ6KyKH38RittdKZgccQPpAMdHgEVgHas3DipJUsjVNNSTogtYMSgsUKb/R+laFQpR3UDx/xnlQFqUTGNb0FNa9Tn9YPzIsiez39EIuXueZm2dNZJnD2zahdS+8EDeslWqKEsTi9veR6t2vJY9qOTw=
Received: from BN0PR02CA0049.namprd02.prod.outlook.com (2603:10b6:408:e5::24)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:45 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::4a) by BN0PR02CA0049.outlook.office365.com
 (2603:10b6:408:e5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:44 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 36/37] drm-uapi: Update kernel doc for drm_colorop_type
Date: Mon, 19 Aug 2024 16:58:22 -0400
Message-ID: <20240819205823.316656-37-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d90d5a0-f08e-4b3c-2610-08dcc091b73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IJQ31KmtLENhz7kWHIGWhX7DbxUYpDe/O3OV21TICbt/AhPrKNI97qdOQOFD?=
 =?us-ascii?Q?IkG/NR0JjZo6TWhFh6pcNS3BrPnDxLEdypU5ETsscO7fzLwhRFgD6P621/Oq?=
 =?us-ascii?Q?tqaGU+ZN8dLHntr0bpRj7lRdQqSh1Vg2k9PvSuIgh0PytGvMnNMh87/OyBkM?=
 =?us-ascii?Q?5vIcg0ZFWB3o6SE0HyscIUNT+amxzv0gFBiGomB0WNrAlKTMZ/oraBwKFTlz?=
 =?us-ascii?Q?lbLOqoopYeTEhjZimOmgEWx6CCeiqW6NwQHAxwQFJW9MxSisOKTM3JcLbkAN?=
 =?us-ascii?Q?yrjpMe9P7oNSM7jNhJeQ8jEADXLa/qzM/yx++liL3PY/+FNvoOavCXzOUjpn?=
 =?us-ascii?Q?zbxK3dQHHAoepFMOZLeBnk2Hdv2T6qoOeN6sk7+Vax5cpIjjPgAHnBcpWDmQ?=
 =?us-ascii?Q?1559eG8E2FT197noqAwaOQrKcjpP0XjOXZOqIciQ7vhhIWQXf2eJp2C+Vujs?=
 =?us-ascii?Q?+68jcqj0ZPLB4s+yaxg4tEIaMcfM5O/1dpPazZWW4cmoAPgPydEdcSuTkYyd?=
 =?us-ascii?Q?jZk2KanFIqCkbvX8nBQp13WpsyXGblf/Yy1YmybIWCmRei2Hx6Qnr+HHIOaf?=
 =?us-ascii?Q?a9fSJaQUpVBfLg4qMnnDFyfDUHSMRlQm/hB6Ow5yzxD5BabiSIN0NaAIA5tz?=
 =?us-ascii?Q?QppJOnLlNINlQ/bnKrwtspgC49pmb2cQVzmvVAXb5wIVBvrFQXLHuicYPMpJ?=
 =?us-ascii?Q?6jIO3wtWI0WiJGZDl2CNYKh6+tjEv0Fw+YqVhqOdNa5W/oP7X441moFbZe05?=
 =?us-ascii?Q?Uz+J5iLaXrHlEyUheOZwpLAEgWUWMv8nCezYWxQYeA+XvpM7Ezs8/gq6HRvX?=
 =?us-ascii?Q?sdeKMxEpLNALhIiU3vLygDzYq/SMUCOXb7J2FITFeYjLiNSLMlG7njkCayiY?=
 =?us-ascii?Q?Itw5XixaAzr6565aKscSll/nt2NrvtD5FN92B8BU6hLRj04mGuJpGuz/7FjX?=
 =?us-ascii?Q?eA/1K4F8AL8Bojw7fqy4bIkqWtXiJQDlgaqIwy1iEDgny6XVw7e0gwJI5ufe?=
 =?us-ascii?Q?/jl/NbxEmOgLdQgUp/3SMi8cnDoHMmt9EF9hUlH8qaB0bKK7Fh+1arTWx/ey?=
 =?us-ascii?Q?rWbpnuKby9t1vQNnL+vBBLPFMVx6xPYawSFxBKWzmm4RDsHXtS3lC5M6EKMF?=
 =?us-ascii?Q?CRJaS8LZ+tpSmlQAv+BLUqnVMD5rEd4Ox9+uajFa8JrYBgYyEQgOnlF9c635?=
 =?us-ascii?Q?H5k/QQgArZcOUz1CM5U/9MjPeOzdREmrxKeaD+77VqUBGMgeenatKcdZT7og?=
 =?us-ascii?Q?bfEj/QOT3uWGXjsmpldJu/ETJbDgSLKnS/JE6Q+tUVTedHnao9465hiGmNIe?=
 =?us-ascii?Q?AngjVbcHMS0yFyztlz06p/sLpwxTcioxO6pSMSWBDgMqMyLgVaMfKZTB+SjI?=
 =?us-ascii?Q?urp5fcmC9cWNnqimvwYjY61EpfPAs45qmlENnXR9SSP+R6GsAYa2w3blY4FY?=
 =?us-ascii?Q?AY7r/yb06eaKDGGkcLwe/PQRy8EK+a5T?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:45.6146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d90d5a0-f08e-4b3c-2610-08dcc091b73f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337
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

From: Alex Hung <alex.hung@amd.com>

Sync up with kernel documents.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 26d59cf3185a..db4a0848b0b4 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -874,11 +874,55 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
 enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 */
 	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_1D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
 	DRM_COLOROP_MULTIPLIER,
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_3D_LUT,
 };
 
-- 
2.46.0

