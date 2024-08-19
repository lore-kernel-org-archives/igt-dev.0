Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E924C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E54F10E413;
	Mon, 19 Aug 2024 20:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IxWeB53B";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5110E413
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqdxg+koBVluS+38xnbpqI4caDyn1enoG0HSNx9KVLzNoQJMp4F+YztjglF86cogt8/1yM6DumLlPpbLSwA4juiRRKVzWuLcDi+OxOsLamF0pXGV8kNtf590tFQ8y/76T1TxDhAipeH7yDnixXVerQAqOADyxKg3DS1QjcmJFYx2lK10UIeXY9ceVhrp+MQWvZs/VNCGy4HK7JMkHapSW/eKmyvvmDvCImh6GPRZx7mMUXRgae6NrIN6wYZuFW/AqE6ncQJEYjYnfeKm0koD3TSvISwb+KDqEKc635t9qI2sjGT49NmAm3w1osxoouEhJ3BfNvRlV1gbkdTtXQu4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eC+xCJyZPMZiJIvdu3oNl9EqEWiFjHAfbDsEHosgXUw=;
 b=uJt1cbrEIvT68mWGIbOjFe4ylobyVxUnzvwkwC25cCY/9FP7DG10bWZewZbJFbxQI4CDDJqBOchOS737wK9DORUTQ59e/ZmSyeQJCrtOkwt6DkVDgopHvhmYM7IlDkEXlDJhDwIHX8fgZ4/PLo/dXE4+gx8ewVOQiaoHDxo/GDGfo1D76W2EfJ0mTuhjEJtvK+foyJtnLc2SFddMSouzfQ9xXsIjB9mTEVVSI5A43z1KHy43bpp5L4R9u/vR92k/xAe0rHoQJwx3FRdIHov71R9M5DVDWZz5NxxsEU83xkS/UqRXE8hotgm2T/RIZBgO2qYBe8HWDTHRn37UVzopmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eC+xCJyZPMZiJIvdu3oNl9EqEWiFjHAfbDsEHosgXUw=;
 b=IxWeB53B372B1X+W7DG+BWYr+IKTdAAPo4tb2kuJt1KqFHq3qvEZep5FvZziT81IKTu3WZAS6iaUB/yYeL8IjSyPoKSv+Qthx8Kbl30DNW9tR3ZHHgNaQewuct7Q2ZG1sfkHEPmRCOiMuC+adB4vWCas0X7BH4u0UXyzhhB8eZI=
Received: from CH0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:610:b1::9)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:30 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::9a) by CH0PR13CA0004.outlook.office365.com
 (2603:10b6:610:b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 02/37] tests/kms_writeback: Fix kms_writeback for VKMS
Date: Mon, 19 Aug 2024 16:57:48 -0400
Message-ID: <20240819205823.316656-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: d75582ed-945c-4e08-e639-08dcc091ad9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?am7xWymD0CKzNqYDbdWZ97nxl6IO0H0cwcG3Q+a3gdoQezSgyi6m1GuJjMMm?=
 =?us-ascii?Q?TGMubJ/TVy8P7bR0MIhOXTnf5yWIiMQfjqzBGINRk8jYp0+143XaZxHrpTIk?=
 =?us-ascii?Q?mXqpTdgejaUH8F+GHNCnKYoZitG/Uyz4wSrqAOaVQ8VvYR9E9BjTa9DYJ8xB?=
 =?us-ascii?Q?RyxQVUo6o+sy8kryDV6qfq817Q5Ma5pAcz/Xkw4MT6A6YQm2Io2CRNGufPfi?=
 =?us-ascii?Q?HlbeETw02UVdcRNvuhR2SwKcReoZD+WlGW48CbabEZuVOKBscbrOybJjXmAn?=
 =?us-ascii?Q?YJPiWB8NSElbEoi9By1gNOn8gdo5+n8eg5n3W0DitbErfaf4lHgPGg+Uh9q4?=
 =?us-ascii?Q?pY4e1RWX+U4PK+30+eUMyYbnrwl1fmgPjN0wzsSYKeJVbgPzJ3Yt13Xte3Jf?=
 =?us-ascii?Q?DrblyAIASU5UR2dmXKrcg3Fz3LVpOqbFeYnGHxeERT0ZTHtO1mw4OPndztAA?=
 =?us-ascii?Q?eOyRQSiWKJF+KkgQGxP/ksFsSUuabh8Fa/wmD0+73fO36qpCj7a89b43HXsA?=
 =?us-ascii?Q?kV1lABGWTBznmNsAOWHF9Of4VEKlaD4/aPCykb/JtBkHs0zrt1SO+zdbLAXM?=
 =?us-ascii?Q?b4MQDMgfJ/SwrU2LnyYoodApvr0mdpQEh/41moAIkdD/gUaebSt3DIyAFlN/?=
 =?us-ascii?Q?a1oERBdmLYXPX5ZLg2TwERxgcym7Kz7+QPjURYjkkH++MBVBDtuNen2VC5jD?=
 =?us-ascii?Q?2X6J7v6Up7JFnTbIwJlnVPdFlBckokvfDX25JuOOkf5z+eheRnCpqjr1CC7N?=
 =?us-ascii?Q?+iL6z8WUUwcpQf1bcVql5YTuRLOsYpMizJx45zT8g/qY88nN1GrYc6MmfPBm?=
 =?us-ascii?Q?XVdCv9IW+NtD5/rwycCegqxNuW74VOfKuVnoZmPieBBLhGmNkTB41UK92MG9?=
 =?us-ascii?Q?RE3+I8/lOTfu2Pk8cK93h8r3pRcoF2zM+PkHcIX6FAb78cTlrBaMS4ws60ak?=
 =?us-ascii?Q?3MrUWIgM/1InDvKdVMGaRqstEg38UVCf/YkMS7uKMjZi0vWvOvbVj1/VBoNn?=
 =?us-ascii?Q?0QBJQ7AjZx75/CGPER2TB7fqAY46HR+fN9VCG8IWiYKCOIrkCw0vOQNZQIWa?=
 =?us-ascii?Q?P0BgzG0QV/MecpYNsPcIdMHXHddM8PO7pQRZJLxSmbkmOVZgt5XzEY/0OqH6?=
 =?us-ascii?Q?OHVfx0RyYwbIQW7JzuwjTm/J0mG43J/fpI2K/bWlkn4Dc7Jm/uz51OoICExx?=
 =?us-ascii?Q?imHHYf/VzRzvdsi9eyP8yXzLQcGFY08xi+bGeqMM20UMr9BSBIhWWWi8IYX0?=
 =?us-ascii?Q?lsbOdJ5162UaOk/n2xYcGtE+UJDfW4RUb09LqyVJXtT4ngOKlPH9dC62lu8/?=
 =?us-ascii?Q?YpguttQAz+szZrMyMBLW+BHWQJAlEzrLExg9kPbxUZZPRb0RabOwybxtLoru?=
 =?us-ascii?Q?gdPtZI1MkgPmGGiioUtxabKkTf5fyWMEw/qvGRcy1HZQ5x9APtAXeJ/vnUd/?=
 =?us-ascii?Q?dILGHvGpzJg4NVOY8slzHximnp4LZc/d?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:29.4715 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d75582ed-945c-4e08-e639-08dcc091ad9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
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

VKMS doesn't like us to add buffers with unknown fourcc
type. Other drivers might behave similarly. Make sure
we avoid creating 10bpc buffers if they are not supported.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index e1d31bb93723..bce0d593f1d7 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -133,6 +133,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
@@ -142,7 +146,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
 		igt_output_set_writeback_fb(output, &output_fb);
 
@@ -596,12 +599,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
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
2.46.0

