Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7742C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81C10E0B5;
	Wed, 26 Mar 2025 23:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SwOyGSkg";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE4A10E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKzKALa5VwwBjqeQKYcxngYJv1oisr/D55lHbbXDZ4Bilo9CTO9CHKui3+hoe7USL3gGxDIJoxoKlZs/JhjBpxi/fSd8lFZXi4e4bl2Df0ZZiFzdDnD6sNACaKDvVnWLhm/1sDz7qKc/V0Gl2WK1o38Iv49g23ZlXJ59CIOXAoDN5cMhF5cVn2dCMeiZ8mvIZA4kgSmJy5kEnXM/Db4yPAm1k4E2d6jDOaWqACcl8G2ciTo3VknlgSVuLz6TvdBrpTqvrfarK+tntbaGITcbBTtAKAIRr3BAnfTMKnvL+LmARC9Z+7zsO8HilQg9Ws2mvdkowr0jKmal1s1TcQeoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STKcvIfX12qXC4GfM0R5W/COs6MP+KvNNHkYPMKRNaw=;
 b=eUzlRR3UlnNk3iPKS/O3Eqj0W9v1N5Iu81BnNm4ns6/LGGJ5hWfbV13Llk57eQuAzCjjr+4hSyLYI/hO7xAKnPhDbhVANIuXw8vg4I2qZK5wtb8w7WB3FoToepSGZDiTVKHf7RU7SEiI2oGMCjXJqjE3hC6J2bqNjwdaYhhX4fEDgeWqj7HLQEbxDVL5O2PNeqO0UJiMSwyfKSzNekMKb5vC8VB5aBI+tzyxhgh/Mr6fMsXKMKYYrIz6VjiYGPAaU/HC0TfRJPn4HZumJW/XOhwvsqnLeLqRxD0ao1jh9OlFFLWad0mwCfEeWgZFC947hYY3Gw/ck3XCHGJKI+Ddfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STKcvIfX12qXC4GfM0R5W/COs6MP+KvNNHkYPMKRNaw=;
 b=SwOyGSkgiXxHYefItRt2n2L+WPJeJVO2PNYpos9cn7brv+uemrS0IVY1+29ijigSSbcvqw1mIqZu33+kyJmLXmWla2Pj4ly8m6Pi+2QWpqWPS6VAePEz6SdDBzD4ag5Rb+4XiC6qlYxOFYtHyTK4U7fJxS0LxPQwz8qRHq4iP8E=
Received: from SJ0PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:33f::10)
 by SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:39:57 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::e1) by SJ0PR05CA0035.outlook.office365.com
 (2603:10b6:a03:33f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:39:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:39:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 02/37] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Wed, 26 Mar 2025 17:35:34 -0600
Message-ID: <20250326233609.2980110-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SA0PR12MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: f129e6bc-ae7e-4ed5-870a-08dd6cbf8479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KW+fPNRddnczbs2GH3iBABrfXwiAoJm+eX66VPkk/DMnm5b3HRU75pL9s5wR?=
 =?us-ascii?Q?DWROrDXVk7aJbgwEjMLKTSeCSnVc63f00p4l0db4+6owFN4Q5TM9y3vrxfO/?=
 =?us-ascii?Q?rU+i1t+NYsP654V9/cqNU6/sj5QsNnKhtnXpWbzpOGvciZNTjuZM7tYbJe9w?=
 =?us-ascii?Q?37QUiBV/c+25Y7Mm10mPtLTBIfXnPes0gC1E6lyFOWM3R2GbPazRRxu2gK9L?=
 =?us-ascii?Q?DiWwW4y0NTW+tpMl2thHDo8z+VG0JCCtjRZ4Do5JXTbtmCNkokSROZVPqWYq?=
 =?us-ascii?Q?THBkFNwlpmm8OJP7z6lQBRcm5B5POSrSGj++6RoWllkZgcBXJLqiD6+0BDo5?=
 =?us-ascii?Q?G/KXFJxfRE5aUPyHLZzimKo4IQO7bOXfuQ9p6Fm26EMtZkBiokAP4f9UZb/m?=
 =?us-ascii?Q?sG8y8haYZD01hGIYLaiFgAFlC65sqDbyJQwVhkkM66kXHrv0jcF/yVeZMLbk?=
 =?us-ascii?Q?bua8JFNV/bGBb+/XG55Ma3pe2HZtDdMpWsj2Y6SxfMxiGs2iybjM3iqepW54?=
 =?us-ascii?Q?LrrSAzPirexO6jtr9Vt264RkqOWHBsWxMSw2XZ8MN2N9LvMOgt1H3JCQ7NMI?=
 =?us-ascii?Q?LPVn81nXnruKChSbuIH1Cl9Xgcs2HCrZkcDIpDgwI+gKqFRDC66KFdZ0av59?=
 =?us-ascii?Q?P8yasqZVTMSNJ3eRVJQX/+CBlpdBRExluaWIqJSsIXmV/+2+PXduYaDf2g9i?=
 =?us-ascii?Q?NpJvXTUPUkA+DWoXKeL6kfxsiwyhcGlr8K5U4U1Jt+ZWjy0xX4jj5Esj77k4?=
 =?us-ascii?Q?hpVXX3vq6eA2/1wDiNRSxPSHS/GhG23hIRtcOuBj0XHx+BajB7HwzrJEFDhf?=
 =?us-ascii?Q?em1nOu4LQzz1gMs1HGd2OnQpyv3ZEUkBYR/vu32FeJoq6UQPOylTKhJkWmm/?=
 =?us-ascii?Q?HCZORqrrf67RDI448X5DLzruK2pqHaMh/TXfpEZhDWhi5Lwv+NSl9kwYSuto?=
 =?us-ascii?Q?hEuJo3Y0fGWkyEEHag7Wd3TkrNi+uPmQQ9CTADph0ckB8C7Of/Tha2jy9lYb?=
 =?us-ascii?Q?b7NlBLTpyyHtNrVvG0eMtg/rK5bBtyUrsD+q0pKwo9YMoTUeQR64feP4huPb?=
 =?us-ascii?Q?oNPJ9b+3tG5wnYORwEGmm6A61Gc2ZV/+vELf7aIaCERv8Qrg90Cx2CgVWpii?=
 =?us-ascii?Q?IhlaiXawnQoPY17Jqbbvm7IX4cM3huXECO2MmyUzYZYU524I+IncEet2Azup?=
 =?us-ascii?Q?5Yzq6lwx6J6L1EaAZA+xFFWOLtiPyjJ4tdqewkj82ja+kFprBKftGk0bB55f?=
 =?us-ascii?Q?LCQW+0uVwkdMPzAhkgp2GJn4bPAKsCMiCwNEiUue8WyFT+hkSyQnS8XFxDn9?=
 =?us-ascii?Q?UhCk+1NNPPSlNSW6qTlvQeaGX1EVOWmKlrq2OXR56na88wde0KI2h/7SsoRA?=
 =?us-ascii?Q?4aaNAy9hK4sZtRGoatX5ohj9e7lchGHZTOooMJfnXNc8bT/tiseb2HU7eBTw?=
 =?us-ascii?Q?WHjX9PqCTb08dgaVFLAoHZhzLien3GWfNl2C3DMXAsRm6iq6g07LCiXglE5P?=
 =?us-ascii?Q?G5odNMclmSQaorg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:39:57.2182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f129e6bc-ae7e-4ed5-870a-08dd6cbf8479
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7003
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 05680837e..e3671c59b 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -131,6 +131,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -140,7 +144,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -590,12 +593,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &input_fb);
 		igt_assert(fb_id >= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &input_fb_10bit);
-		igt_assert(fb_id >= 0);
+		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					mode.vdisplay,
+					DRM_FORMAT_XRGB2101010,
+					DRM_FORMAT_MOD_LINEAR,
+					&input_fb_10bit);
+			igt_assert(fb_id >= 0);
+		}
 
 		igt_plane_set_fb(plane, &input_fb);
 
-- 
2.43.0

