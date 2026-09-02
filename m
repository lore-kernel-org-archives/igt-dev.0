Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C50C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 15:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827989C28;
	Wed,  2 Sep 2026 15:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cuCaq5+G";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011058.outbound.protection.outlook.com
 [40.93.194.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786F10E032
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 15:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh6Ya2mof5s794iD76dgI4zqBEnqKTCqpFmmchnJCSEjVmQsZ04bdI/mW4Su76kLlguD8flJNM0mluAuBsu+XLaJkX/5kjoCd+caa2lEp2DZPtH6dkaXGWOdaRzxGgR6bA3hzEU4+s1DdRP/7CImnONUjKiVilh1BoPHdgiUEtKcB3vSFsnDBBBnyVETRv94sBin7/U9A79Oxi7SefcX8U/ysAk9Tj+FKVeMs8LYq6MyXAGT3Lv2xROYBOETSY/79fmInr6APp6tiuq8q8+UtOYELBirf2aarwEPzkTrtYxTxr9A4nVT802A6kJa/Y+JSI162E+b/NUCiHqjng7gjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QshYfoKZbISupaHdWqtMOH4iQVgNboKtaGBClbrZNg=;
 b=UwncLxYuJgEwfXkGJXd7lLW9o7OaL7cKp7IckJ6o9qm7CiXrt2dh3SZFxntHc0TGF+yG6pN2Q4p/T9svad0wLvMkSXc3I55/tYV5QX7SI/WU6ABxZ8/iLuBxpEnpJCUJZ7AKFh1l0w1sLDRM4bztlF9R4/2P2T5V8ju2butQ6WR4v+e+9fe4JULhTOHJcivSu+waFdstMEqoMDZEgq6WTjpslEOcn0h9Y0C+EXFgo5JB5AX6UG+hFQxt/r0ou3Zm6fP55WZBkrU/DccG7u+5CDGBA/wAw6D3/jW9KfQ1WnhhgqR5w5rB2gMKRViCqrsDflRVpsOMzVecxZ+ng3aWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QshYfoKZbISupaHdWqtMOH4iQVgNboKtaGBClbrZNg=;
 b=cuCaq5+G89Q7iYfu+SEShKUtpU007lau6IwS4U0BjDD7NLYoCxg/Uqm23MWoWZm/aNRNYxvWtJrAg6iz/ob4yraxl0qe4qaFnWvQlFhkriSeZOhX1C5gcFBDBOcnjge7hFa+t+er+Vv72MFTXK2MZX6NOB8FGyRPmnVbrWctNbs=
Received: from PH7PR17CA0002.namprd17.prod.outlook.com (2603:10b6:510:324::22)
 by CY0PR12MB388677.namprd12.prod.outlook.com (2603:10b6:930:132::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:57:43 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::77) by PH7PR17CA0002.outlook.office365.com
 (2603:10b6:510:324::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 15:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 15:57:42 +0000
Received: from georzhanmkm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 10:57:41 -0500
From: George Zhang <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, "Alex
 Hung" <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>, "George
 Zhang" <george.zhang@amd.com>
Subject: [i-g-t 1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high bw
 panels
Date: Wed, 2 Sep 2026 11:57:13 -0400
Message-ID: <20260902155742.990457-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CY0PR12MB388677:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee05fb9-356e-475e-d630-08df090aec09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: jTAcYisU4FxgZaLOz3d0ueATxEU6+v94YEYtRz8g7UvOX/0BhCmYf8sgPYtzGlBmzfy40OmJocLMi1k5u0p940l5D1BGDqb/En5q6n7Y8XmT1C/ZMP8mn8Rv31Opan2sEfRduDaTnGfUo94BZ2NUgp+xq9fEAFgEDj62c03utZRrN4DFB2EDSMorDP/1FHi/KD2dD3ThjluJN7SN6P7kyIKHVGxFt3CccW0i+ZsekKfpZyOGMl25paOjL0y6AHqxvzsemD+B0rlLnG2KMzhcXzKBPsBd6OOr0sQevBiLU1F/LAavlI9G7LdMbjyJTUlp6Ccje1QwnoHYV+tgTyU8zCVHVhCHi4A8C49tWrdv6sSbL5Kup+uscZsCuqOe6CnP+ddkSaSZN0oppdh6y5GBd4N+O4djodYEnsb+FgsEaT7hOlYm5KXR3rFwgqm7kOFubJggWKVTEehLI9OsTSBuwaZRuaQm5xufzKcH2GrGHqbOJ77dEz2ujVeBdZohx6TvRFD8gZE3lqtLQzZHZeVKpdsGz5b8yiYS6N5+yrVJe8sS/lH47GqxmZDAqksB76t5GUbSG8XYbh1j1ioGE3Zx/Te88Eal0ItVqPQK2rW3788v/PLS5grkP4yXbXEnLJZZnDQR2Yg/Xad/NjS9X81/+DaQ2x0c0VKlEp6YLnSZuD/0q1ub+vcvxfOsK4TCWujE/Q4jyoeYaSwkmGVsClP5nQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qoASm98JS4XRcknOiq1DNtV6gYnUMFxH7X0Fj/8EMmIp70Dj4QZrc7lI2CJSS/Dva9Elh0bkHV6aJTnwAQT2D4/zsGg2oNRYhjqAQ33etKmc4t0ac0ZsLeOKeKVlN1J894gdzdeXH+46vp4ISi2fYUObCEQB9aeRtSQZyCU2HvuQAOZR1oh3CSKjn1n68QVaJpWBYXjB7Q5zKEjUhrZweMVQ/IpbHqWiOrwJj5v1W8dtscGhjYFZz3+8+V3ZM99jlrHlmz5Td7PARZCwAjnNL50pUtfEobjZ8Yc7QLnuQtVXGQ4L8d5U/CBdYDLyqP4qsNoKECVk63OdEyVhad8Y8p6Q1664dsLXy1bKM8NVTXOAHEez9p513hPNMy+h30NHQg4n45eBatqQ2rLpao9YoUN9yyeBSATc4h5gh7QdGHDRcouY6Es7rClnoz1NVwo3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:57:42.3931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee05fb9-356e-475e-d630-08df090aec09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB388677
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

The test previously attempted to disable DSC even on high bandwidth
panels. This would erroneously fail the dsc_enable test even though DSC
is on.

Fix this by checking what mode the panel defaults to when set to
automatic. If DSC is on, then do not attempt to force it off later.

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index dc71e903e..ccaf64c66 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -137,6 +137,9 @@ static void test_dsc_enable(data_t *data)
 		igt_output_set_crtc(output,
 				    crtc);
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
+
+		/* Make sure we are in automatic mode before we start*/
+		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);

 		test_conn_cnt++;
@@ -154,7 +157,9 @@ static void test_dsc_enable(data_t *data)
 		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;

 		/* Revert DSC to automatic state */
-		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
+		if (!dsc_before)
+			/* We can only force off if the panel allows it. If DSC was on in automatic mode, we cannot force it off. */
+			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);

 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -286,6 +291,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		igt_output_set_crtc(output,
 				    crtc);
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
+		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);

 		test_conn_cnt++;
@@ -317,7 +323,8 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		}

 		/* Force disable DSC */
-		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
+		if (!dsc_before)
+			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);

 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
--
2.55.0

