Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66D1CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC410E963;
	Fri, 15 Aug 2025 04:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nLL6oEAl";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868FB10E963
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsnUjdGNF/BO8/jcf/M5DTw8Xh+zcVpm1qWpQYU3TFBltqiIfzsmibBCaj7H6AsAQDNYG9DugIbvIIiDfP4IfR6tGPd7quo07GA+atBQP2QzdhvJBEsJoCAhECLu60lvzorWIdeHSBbS4Umc1HphqmD4YO/E0p4GAqGaJkJK0axWj4NheNb+VqxF63O0weN/qq1cN1ayTMFbB0v7M+GpNI1zVxjP7Mc1+RNBzGVzDM/t7okgv3jeICY7zrtCPG2BPHR13LA+FeoVFBY4VUQ7nOE8X8hHbE+inHqYA2rBMGYaQV0ENJ7iYuvO+ceWqLkN07io8nLrThLrtPEkYSFezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqqt4HZJuiu+vaqZcQDs2RQYQPrOnB+fvucaNj+UC9c=;
 b=dBxhLY/AP0k94YDYxyyrj9R4BOI/q+xT1QHDpa3HoepeYlsABA/F8fBsHowyvfwDtOwYkO9pcgAxwGcuTjhhlF12JgajMpZwcYk4sy436DmEopwT7vsqxAn8lq3b++px+SPyxn3hwt7ouSWJ6XKT29AQG+AAs22I+4RuKPgHy0JU9HQj+S14E1+xr4HYz82hpI8kJxYD2KuxTUHz+uV48C5MHM9XvZJ6q2bNtIadZyfl3KJYZUVhEUMr+Nzkrng7NQqNrtXoDZvTF0LuAcv5dNuHTp4JNJ7KzxEwFzLFwOowFbWdEI5AY7q0TFtgbnrlKZeEIsmGm5lPAhHU/LClWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqqt4HZJuiu+vaqZcQDs2RQYQPrOnB+fvucaNj+UC9c=;
 b=nLL6oEAl4kIZgSDSVcCjM+ALjvbo4W9YjLu/10qW/e/LIQDxhJn9o1rpMMkw2qNYDpqVVNtd+zHl09Vuy+PkB9C8zzZSTN7s7mbtlN87JozgH0Q9978dwXXkHdAAbMMbMo6F5bEbtKE8mzH5niVxdn6m8t7e7ZH9x6RdE7EancA=
Received: from BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19) by
 MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.15; Fri, 15 Aug 2025 04:07:28 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::63) by BYAPR01CA0042.outlook.office365.com
 (2603:10b6:a03:94::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 04:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:07:27 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:07:25 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 01/30] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Thu, 14 Aug 2025 22:06:30 -0600
Message-ID: <20250815040659.3321102-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b53bee-484a-4792-bb0f-08dddbb13f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Auce8CPMOiLHOxu+gvY8DVxLAAA6HHGMP4g8kFRQH9RH/crLxxLPVQcTHqs2?=
 =?us-ascii?Q?Rf8uTNREVAut0sySlbm+B0Se/1FwoMbytK7uhmjfOyvWD14mOAE8dn9VtTP/?=
 =?us-ascii?Q?I17kCGN4z21J+uOR07eQ0vjA0cqP37Loju1pfKet2jtDaTGuA9DDIxaxhBJ8?=
 =?us-ascii?Q?kwqyA2gA9u7Gy6/pgdpoFjkS/b9HjOCPJeftzWy79V7Smngeq2lK06I5VsHE?=
 =?us-ascii?Q?fSforUn7QY89087Lbln9GmH7dW/M2T6LMz+AsMrlH6nmTh3WomfNz7UsSgvZ?=
 =?us-ascii?Q?PX1MOQwKAoiQWdP4f2ydT0yH3f+R3uZr5zB0yHcGCBrqE/ezMv+DY5dCfV1m?=
 =?us-ascii?Q?FxfU9wvfE9GUjzpbN1CgVjE6CsG+mELfUY2FxMAleVvVpz5adUW1BbWXvOto?=
 =?us-ascii?Q?T4lCIbuF9LmMcpOdjDCiTJXDYyyw/WtdhRZExgbGOcBFEX6VJh6z/ciVFJi3?=
 =?us-ascii?Q?wvFXz2SeN5wsSkAa4jV32MhzOaSTk314R54E6EBg6paI9go04K/skuT9V+X6?=
 =?us-ascii?Q?zWEpWekYyIUIHE3r585jf/7m1/BE9J2UljpAQaoPZg5yUHS8HyYbjkyIq+ZS?=
 =?us-ascii?Q?WqWkC89zCEE1OMfXLvId6R51uBjinenRqnyOJQfftMtUg0ftIF9zvAD5o247?=
 =?us-ascii?Q?h+wenU8hyKln3mMg47BxYYd3OQYggv4qQoL0dpWBVHbyg/yq7qPPMMc7C4Dg?=
 =?us-ascii?Q?G7xTLFI46nhhvJcjTxXFIMw2RuNbhmaXTUHEETeMtz9KdqJ8MkILrz4zsoQN?=
 =?us-ascii?Q?qNphOekl/GREl8suH6OxmWW6Cjp1T2ZIAMh3kn9krz0XWSblEcE3LCUkQWKT?=
 =?us-ascii?Q?HWU2u4Lb2nMXV/FZbZ0fICVQ4WaRiMaExFvp7S0CSB+d3usKedg3teJajt2e?=
 =?us-ascii?Q?oFG6vfP4KxJ2fdearZzHvzCQxLMkAwcQf3JC9CW56buxeMUcueOa1/9yhCHR?=
 =?us-ascii?Q?ptjdKSsL34kAeuK93ypD3PVWl8sSIlbK/NYiA1WZqlauOeryVe5TThf0Wsn9?=
 =?us-ascii?Q?egSUxXitpy9pShPngLFhM+Sb+I5p3/LKzQThS2c5a6LFG/80LlqXaDISDBBX?=
 =?us-ascii?Q?X3EHBKvVNoN62r9WiD6T8Ov16bG1pmrknthmrqYksBkeQIQHVnU9BSWfDuwv?=
 =?us-ascii?Q?66aOK2Lwqz3LPXZa6EcLbxrr5YoD2u2XMTLhN6OrN4lsY5mPsn4T9mjYNAlw?=
 =?us-ascii?Q?Q6xu6Wa9vj06REkSaT4+wIPzsJtl7FoG6EujbiKBmviO4tWhkhqIe9iq2oGg?=
 =?us-ascii?Q?zqAoPoqI6HbVqHZOy+cE/ae50r3bPW5iy9ih6rToQJeg58gf83O4LFcq7IoA?=
 =?us-ascii?Q?gMh8abgSYc9Je9fYdrj2XvvfiZocal8OxOUZiKWydjQ+5dTWJ4Oj2OrustYK?=
 =?us-ascii?Q?JhG7ip/5SDa992lDXgnnfsIa+6law80L+HntrrHtBhD20xJTU/Lyy7OvhQWs?=
 =?us-ascii?Q?hKTXGjlHcmR9hcZBNNQ/IH4Bd2SGwbPhNMgB1M3OH5tXKgSqqE9+ZW7YZgJm?=
 =?us-ascii?Q?iW3f0I0izMLhdhb6M/3Hmom0pheHZqk1p16O?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:07:27.4848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b53bee-484a-4792-bb0f-08dddbb13f6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422
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

VKMS doesn't like us to add buffers with unknown fourcc
type. Other drivers might behave similarly. Make sure
we avoid creating 10bpc buffers if they are not supported.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1b81088d7..511d2630b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -112,6 +112,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -121,7 +125,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -571,12 +574,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
+		if (data.supported_colors & XRGB2101010) {
+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					      mode.vdisplay,
+					      DRM_FORMAT_XRGB2101010,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &input_fb_10bit);
+			igt_assert(fb_id >= 0);
+		}
 
 		igt_plane_set_fb(plane, &input_fb);
 
-- 
2.43.0

