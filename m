Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65286C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9A110E47A;
	Mon, 19 Aug 2024 20:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="crKRdd5P";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A010E478
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjqrzBmcgRTGdalM+X1fpJ36p5zej4N54jT7wvmy7PlI2l7vTL8erWGouslPs1BCRQLjqIRmNHwGo+7AFyu7L6rHwL2aa2+GfuU9EQ6M8xmYQi1YjVPu9eIFGekN0XhM/Jy/WtFXsZbF7Mx915wiD8b2D1GVNwqjWCvgdpTCqBZE0t97DZPR6uVAo3MAnsbJNXnyrU5h9siqfhAxzm9LCt+9OatEPU0I11tqShCMoZ0rZV2uW8Y5s7HP/ihuMljZyeHbc9n8CmiV+BfizXIzykJe77PNmM93V2GclXsBSxo6WYDL9+9rlkNIMPKG5iZSNa2hqjlfYF3nPJwNHtHVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o9GAfDYLIJXMI9dxlZjio1pSRUrV5WRZrw1L4VO/Fk=;
 b=rZX5CqxfG3RbgAVRYqmEXK6QFgqIGzcu8Se5l/Fs8oIIiyqTqKQ5Mi4kG3ui3Yb302wZomW1v3NWTVgRXQdt4UEe0hjrKnOu/B6C5bk59WVeT6ZB+bJg2u/op8v8QW4uae9kGUufk6Mo5JKgFNRYEYYYDPMhtWKJLD7cd2Lm3XW0+HH5bs0FjW6n2Cb6VzaiOrHS5NYfzO1S47HS0V8lynla58H0Pe9nQbmv7nCxs25CoWlZITB8ndniqSVxKaQqDFWEoQ4gYgsk/vat5xsmxQjDts59ONmxBRSBb81P0Jpmmzjs7fo4k4+Oi4415H2FoU1J52KaTGYEHxk4hdDrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o9GAfDYLIJXMI9dxlZjio1pSRUrV5WRZrw1L4VO/Fk=;
 b=crKRdd5PhGoHlPpbAljiWWQJNmISV2DkPl8ZyEP8N6Ms6kavWeExzeuKPFOWYTue9EAs6Yqiq0JGy+XyO4VEgvW+uOT1Nly4xjIcukLFmf60SFzyls93RSSMNsSojs6W05imAza796fWGW/8HZfkFyIlh1632aHQDyjLiZjAWIk=
Received: from CH2PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:59::29)
 by DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:39 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::e9) by CH2PR03CA0019.outlook.office365.com
 (2603:10b6:610:59::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:34 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 18/37] tests/kms_colorop: Add 10bpc test and skip if format
 not supported
Date: Mon, 19 Aug 2024 16:58:04 -0400
Message-ID: <20240819205823.316656-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 9895b7b3-7eaf-43b5-6637-08dcc091b336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xNLYFmKKZZWZca9gXwXkNpl6EY2tZ94qxU8sSePvGOmlQ9yFhiAqOKwbtR2P?=
 =?us-ascii?Q?C4WBIEPZR7M1LCo8zRmMkq++fgfSboy8GRoZRWw58BBSNQasTyuK9jqkRQXP?=
 =?us-ascii?Q?dcVc2VDjgM3qsm3teU3qx0u9CFWP7MdrDNFqbtJNX8bDMfDMLHfvh+NfE96s?=
 =?us-ascii?Q?vlSfrhquQfsFKm4FbvGkXkCR8OeGShcLXouKSECOxwFCCJuRSb1TOfpspSCd?=
 =?us-ascii?Q?6Zgme/4j1/tWFEAF31FEaO10Xf2MCuMhGqvj3NiTWXrwT9WrsSFm3LGvFsHy?=
 =?us-ascii?Q?o5bvsFbPdjZePBr3T3vrzmlMti7fyU1TwaHenV7d9qLod04PFB768piNgV0p?=
 =?us-ascii?Q?HmB5UFmi1cV3e5oe7wWEvb8HXOAlVblgSElH/DaUzZXLdNfwHwFxowql+idi?=
 =?us-ascii?Q?8zrqnV9tHJ88xnX1RJy8DIjgl5jfmcNYFnFJIaE0eQ1lBtPEBbhkmnhK6ktq?=
 =?us-ascii?Q?XawGF0Iknf6yPqnmdyk4KH/PNzzFRtEM3qNmaqjaNzBQZd3IpIbHYP/Hzslp?=
 =?us-ascii?Q?aSinvNuYanTmObf1/7DiKB5QsnKy0RvIeEbXXcZMmKs2qmgwNeZPt/zEtZI2?=
 =?us-ascii?Q?zxTdP1VMrc8zX0ypf7bmNvR69FcCh3ZwpOTIeMUjxX0Lfww0N8YG3/t8AQ6Y?=
 =?us-ascii?Q?C4IEr7tt+5/z1ETcwpcWsw/cgTkiso+c/GW1qElDpaMNL0fS1VS5ZXyUV+01?=
 =?us-ascii?Q?9RHZqNHtG86GwVfD2imtoGtIoNyXYUk/0QC/5K1WcJ7wemXzOtvAFZx51R3/?=
 =?us-ascii?Q?EgTEUlcScHUK86zIKZHaYzzRc4qHfrumKHpmVKvdHGTkBY71c/pt1puJ3x08?=
 =?us-ascii?Q?nfNDSCNT9m4e43b6DLKNLW5mFFw3E5e8N2DY+mrQ4BNLruDLU/rGQ9aK7agx?=
 =?us-ascii?Q?hb5vicjaTNX/z0RIcfjkvohu67EW13InUnzH3Zi4INulpgIQa2Vi8RjSIawV?=
 =?us-ascii?Q?DfLnlaLw5yxdDH1fK0LfFXT6JVnizq0hnuDoI+FcP8zvFNd4YTJgrrAexK4g?=
 =?us-ascii?Q?tk286bTbSuwyko7K4j22vD8Kbbltu1A0SN1/M8mq1LJhQqkzNEZPE3Ad+alv?=
 =?us-ascii?Q?kvWhoxtQrRaVU78A3RkmE0KVHGV0nEQmsFOoJmtlnUgHFeF705bu2Ipx0oYH?=
 =?us-ascii?Q?NtvrwzuG9RmYm0gwygqIGpRIzJfU6aZySbWQh/Mg6O/6+Nq6PxLdHQdAvKjG?=
 =?us-ascii?Q?LupTGk3tOQJZthGg9bC5GZEKhbjkFOpae7SnJMeJyD8ZlUBsBik69O9l7lor?=
 =?us-ascii?Q?UTdBl8eBdyrEZ3CJAADOJbXm7WQpyPhMaJD3ipmDueR5qk+tWbiEaVKx/89R?=
 =?us-ascii?Q?mV0b69YCSEDyPqxKdYSvTL5mJy4h7siwRfTkMe3qyW3HPMm47tV98TMeXvjV?=
 =?us-ascii?Q?/UgswS1oolSQf3KZ8FkEsuYSN2I7IRx3K+5kfx9lM5ZAI5v91Nr6JzFCDkuS?=
 =?us-ascii?Q?xXy/u+9hJmH6x8hbHRTjM4NvVLP9k96K?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:38.8308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9895b7b3-7eaf-43b5-6637-08dcc091b336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 3a12b84d26c9..56c232ef33d1 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -41,6 +41,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -74,6 +75,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -82,7 +87,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -519,6 +523,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.46.0

