Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65D9C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FF110E4D0;
	Tue, 17 Jun 2025 04:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u3RYvtXD";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D11310E4D0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3K2Et+UKNq8AzZhkJn70xzLLFIqgNFTAXbV+0JqDTpXozeGbYl/9JSsrn/RYAG946MOIVHdRJO0hozSd2VyxtQvlSi7A0V9G+mOHxxlaZEeFm+Gxz5VZUJrkoyzCFjyObLUXwZzfpbSHQoo7hbh9v8yCwc5tGdrHHK9qTI2tljsd8UbA1hkoMEQ4G9J1xH2cKj2lwDi6kBipARR3KoJ0UPsk0ksX8Y/EB7D5zT6K3u3n4QZr6Bl/sDMOSYpmFgvshI+OGQFCmBU2TfoZxlai9qx1NPjYo3u5HxK7rLJzfDnXS4n/iMM5PFd4zNqnOXvAAnOO9+KQRqTgsfASUDj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=e6pd/1ujtqA4UaeItVCJ7208HvAooKtj8PMK0WsD2K40w0VZnVG5a/7XRrNy9MOWfpTxAgfVSdbZYpCMxSK/9ftUN4kslQyL6odvTLtMCMTWbqRhtLaHLXmDsiKVmz0ZT2/xCdl8iaN6vrZm4WcEWLz7rnIq/rgLpffLbaN95f12bXNQw9/X9ouIIX5Mig9ASN/HkkBE4poO7EkdpEtRfr6uDS307v9iHh9LRNTSR/i4b07w0UxrsB4QJwhYRXJavSDViBelm67qCY0ZxrquCShoDZpehQxhIqL0YpFtLTiS2ljGI/hlYzxPEYTi6IxAvtsbIqiUK46XlnwlAu5dgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=u3RYvtXDuqXeOvLaME/RD5q2t55xDyVO3hPY9Du6SC5QsOtpPCKoCpKlhr2cu7DL4tqmovYnVyiSieZcHGKfjTch68R4A4KuhB5WFxBRJSE483/e8C8jfVkjhFSGx6gsbidSqoVPjicBiEKhVN6bjGjVvdzcoH6T6ke0T9gSsxA=
Received: from DS7PR03CA0072.namprd03.prod.outlook.com (2603:10b6:5:3bb::17)
 by DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:37:47 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::25) by DS7PR03CA0072.outlook.office365.com
 (2603:10b6:5:3bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Tue,
 17 Jun 2025 04:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:37:46 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:37:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 05/36] include/drm-uapi: Add COLOROP object
Date: Mon, 16 Jun 2025 22:36:00 -0600
Message-ID: <20250617043631.2920587-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: dca21e64-abec-49bc-78c5-08ddad58b567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RgX4Ly049FF3FUOFhhAE6++4ND+VQlzYrjEzvsVECSGzGMiOIWHbJuPQc+TW?=
 =?us-ascii?Q?XP+12pnnGexIDdhU8xnXq3OsFYtDFIGDf1ILPok3FTZFaQz5f9wpBRuo7e9L?=
 =?us-ascii?Q?Trh6lJ3ZMDBJGSVxgiBpQjhIXfxYDvIzEjJcFTU5P/MAXk1IpB5xaVwiMTer?=
 =?us-ascii?Q?X5wrnQPKA6a9zhcVnKm5mcwf/1ctikdTn1WJqUm3iPg47SAT5I3/OFKXOaBN?=
 =?us-ascii?Q?fZbMRcRoVe2NfwmM5yP1iznyyhufXEwsATIFq8CGR6vr1k/Z3KAK8AZOAQz4?=
 =?us-ascii?Q?J/faTZFP1LMoGEj/RHHl3lk+8bf7qa62+S23dfmp8B9AO9lnBDy1iM8xct9t?=
 =?us-ascii?Q?CEibMdQpjERXjbQqWPJn2TfzjqMUd9oprKomnC2lE0hQCt/urWPgnJqfVVzH?=
 =?us-ascii?Q?Cz0+Ml88g5sHCdMD8YVaezP6Sye+1t18ZDSC7prMwCL/85MXOsf6DNQZHvg0?=
 =?us-ascii?Q?Hl9ahFRMjmBrznmCBDo68m8GbVp3EtV/BQPbtu5pEyMvMz+qLmCrzHislpjR?=
 =?us-ascii?Q?ebxsd80+NzsQaG5HMHCHFrVd8vH8po8mUt97iOJ4UMoD9s1fGdIIFWQsPrMy?=
 =?us-ascii?Q?JN4NPLsoqQHXiBgqaJ/byxUVOn8tHlgEL18kNty5k4ZA6B8HMYjJmUsC+IvB?=
 =?us-ascii?Q?ZRMYXumqsglfX4OVcxf9Z939HWEbNoBObAIbe7ZJF3sBYfqV3mOA6KOFuPob?=
 =?us-ascii?Q?1HhcLg58W4/KuM611jXMJofux3v1sR6J2BekahwuR4cTN0tW9FFiRJhAUwvb?=
 =?us-ascii?Q?9H0vS+W8xeJXelnrjkP3KkbOxdRZY8iesauE1WBA4YVwraI1RnEs1Ey0CV1b?=
 =?us-ascii?Q?amC20f5AjcI8NQwcTNokxI0o6nTOKrsPOHXBAvdpbmIWnKNlae1Hq+5FM+dC?=
 =?us-ascii?Q?AkqYiPNIqg3weRD5l04qfageX8K5Q/Uc8YyElnR+lJdBjZQvzLQ9IrqpnmKE?=
 =?us-ascii?Q?wkt3iqCNl5Jnp8FpHSpNgGWOpvcqslsaTDnRPq3wk6bOwhWW/86E4fsvDwn3?=
 =?us-ascii?Q?1N/G8uj5CvBZzgILVpqVBjdzplGLqdsKhZzPzarYWtNErUigbNRoZkfTxgv3?=
 =?us-ascii?Q?al3CyKZOKCQ/+X4gKyYThQk5unCffOmEKSPIFb/dP9LKJiFba0nQ/zKAitjn?=
 =?us-ascii?Q?tHUyplnSsQ+wXu14ffBqqqghfsPAJGLuwO+bOJLX7/HuBbJpLuL9zaRumcs3?=
 =?us-ascii?Q?L24hxl/yPL/nwxfCXvD4q66PwtglGhaum1gp0KmIfRrESdJPen+ZXElntQ0+?=
 =?us-ascii?Q?4vPy40i84SSlYz6qvLPzw5KKHXHMvCnqVGG2G/SWk1i6FaEi+JGv3/zoXRHJ?=
 =?us-ascii?Q?t4KWvP8NC/Ehwhmu0WBtuYDM3NL+OPWCP37f5IKRsoJ8beOo3Y6djrpk18km?=
 =?us-ascii?Q?6R6/i1W8or5YRUuLzRkCeihrJt5dB1FyZrXqSBRtTYtbSXoBQgcV5ev3FYNr?=
 =?us-ascii?Q?UN45fPyo/XwfX3V6GG7zU9h/uzAQO+JsO9GyWHs85BiUFirS2GjqoDYqzC+r?=
 =?us-ascii?Q?XgKcD40TBvfohvPY7pQohl5UOG3SqC97vTQN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:37:46.7850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca21e64-abec-49bc-78c5-08ddad58b567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3
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

DRM is introducing a new DRM core obejct, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi.

v3:
- move enum drm_colorop_type to drm_mode.h

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c082810c0..b31852a94 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -857,6 +858,10 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

