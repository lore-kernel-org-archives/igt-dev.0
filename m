Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E186CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A5C10EBC2;
	Sat, 15 Nov 2025 00:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tffa+98q";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484D10EBA9
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmZi57o3Ewm8l38pAjd8OQvpBPcDkKEu6AuRGnZgfRkFB0DY7B+OuV86vCgohTRuxGuyRWSPGKHDS3vN+IRlKrQ4SRgFAaG8chhgqXdzTYrrAQHL4i+mFJqJXyu983k4/ML4zdSdJBN+AYSsXRoH8S3Q7bB/QZmdKYxrwsSaoMUT3veHmV0F1MfeupSeWzfUvbUBfh9r1QTj67cMiNgcdAC4IFkTcw4ETGZ3cOQiMuDIqS4QSbtMQ9ic3xqcaHlqAJnLdB0aKeg6pe0uqvtgECv/xEkVp9PK8RiGvmT/4IsKllC/k4rKHgqHo/gBBMCEVtgE2DFClkr1AeaxbwANkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAIg0Bxb3FBwdc5bXvS3ssyt0/wC2YtM1IH7xBhfI28=;
 b=WxY8Pn0GCvexeYBPnOCh2eqiTQd7OdySrw9Q63lO0O8D+xlISUjIA0pCo4XhzciL8jfk9C4YKkPYXv2Xqr7c8xNEwmg52vKwH6oUi+W8FzIWljdV6yz+APiKLDwgHii+MjjwVY48TgN0yEC8ZlP97FObd3qL7FThFydh/4QJbH6S8YTCG4XASPVcXkAxrRyByftAQrVDo9W4X79LjywYrRKLCcmPA5PHcX7KAPzL4GOTsBwr5WGwGH1Rhr3lwp0QxNB+oaJdUnVJMJyVv6G8KoKGsYGi9DcmyxCMDxfQL+FgLlqn3k7BgptKT2Ees1PNJK+2Vadu+I2BK9+uHQpATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAIg0Bxb3FBwdc5bXvS3ssyt0/wC2YtM1IH7xBhfI28=;
 b=tffa+98q/wWR6P8JAWxWIzbBIEBb8aEpDJiI4smmkjF53WGLN+grld9Px0jP38G/jj4EteS/TR3JhbwaayXoJDhYO/sR43UAkOggO5jKuuiw0QEN9Y05FCxVy6/1Kvse6PkEd68YNhIxfHk7E3E2+GQEPCUqGQQbf5AIZknuAQ0=
Received: from MN2PR18CA0017.namprd18.prod.outlook.com (2603:10b6:208:23c::22)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:23:29 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::f7) by MN2PR18CA0017.outlook.office365.com
 (2603:10b6:208:23c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:23:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:23:27 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 23/32] lib/igt_color: add BT2020/BT709 transfer functions
Date: Fri, 14 Nov 2025 17:18:32 -0700
Message-ID: <20251115001841.3563993-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|BY5PR12MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2ad8ea-4f1a-4119-6a0f-08de23dd335e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+JXKeQWVlIQGNqB8/k+L4ZxEouUga/wQiObGzkR9niY1mB2gUeoMurELaxkg?=
 =?us-ascii?Q?S6sZ/+IWzw8WnmeSvTymfjb7Je0FGpqBgHtcFys4vXCliB2Er1FwuxlnfAwY?=
 =?us-ascii?Q?kAG/Fa5AK9/VZVKY17GpwKM+Zfl233jM2MdRUNnR7OnGp4miY86EX6tlOIum?=
 =?us-ascii?Q?2B6640pryyyNr2SDXx5cqsjf3X272IUceRj+kqDPyuDJGNTIBs/GwQIpENWi?=
 =?us-ascii?Q?9BhliscYEVRenEwlTJTEPLV3vEglq3WIJj8nCVVFkVHCXPnULXzrIHeiYQMg?=
 =?us-ascii?Q?quWKX91w9D4PVlwxgcj+CmDvZL7Dlmkik80j6IFxn4iexvua8YnIu7NYDDHa?=
 =?us-ascii?Q?zkYS48Q+hckReNytiNbn9m0IDGu5JSLhtG8Xhls7kqyb8h4cmI/xFXSEcWxt?=
 =?us-ascii?Q?cKcOAoI2X6RYvD+7FwesUSoPZN0LuSnGatQXNM2d61vUXhCALn7JNm4NXVhz?=
 =?us-ascii?Q?q1gnWrz7QQFZ/2xZ4GqijZ4JhykNMx99L8z+VexlhfLbeFopHHkSsmL58Szs?=
 =?us-ascii?Q?XxgDC9eBACSmOloTbJ6CVlSe4zGNH7YkIWpthlijtbzw+4ye/zz/LDDWpIeL?=
 =?us-ascii?Q?WvS1+fQtUxG3Te7qWYDETUJ8oeP2EDxh5bgDdtPVODGXU2KWcG4G9fGXEkEi?=
 =?us-ascii?Q?CzbzF8qlRxsP/T8fgqO1UhFU7VxtbeTrHKn6/i7stQ7ArAocDuq0BdKNeYKf?=
 =?us-ascii?Q?fMx0rA4ZmYx1cxcYyQTGugGOv+yB7antfKXHcpvm9jPL0J/Og7fcGWNpvw66?=
 =?us-ascii?Q?5URuPgTEGurpFb32IrgDQyFw58WQhflxt0bXvtFcjANKBstYSrf2k2qTdzBQ?=
 =?us-ascii?Q?tS8jQFAUiUFubXvHit1rIz4xYCJkWBhW39lq7vqJsB9ocpLmrM+/pkDBcBLc?=
 =?us-ascii?Q?2IKDVdiEYp11lQzEkESAINHMaU6/lIYhLtBShSeb/gwvRuQuq3iI9ue7yji7?=
 =?us-ascii?Q?z+Qv1PJeL/wQam/7Nfl2gm0fJWqwW/72vSZfxk1dcUrZcgutWun2amlEY7+F?=
 =?us-ascii?Q?jp+o4WkI9237c4DC1p28NhS7khYba34tmKkmpIIT967YgXqkMrl3mCCRh2Zm?=
 =?us-ascii?Q?CDZbTocdlOwWmTKleGxyGgeaeE4mEdC8kZvB7Sw7dvp6kbvuhQWihBGCvdtl?=
 =?us-ascii?Q?FDTiITRLg69KJf1gR0Z/wuCB3+qIAlNnIyeN9iTFaVCoy+Ac1sn+2FeIKD2L?=
 =?us-ascii?Q?Ro6ICWDLROx8R2t7mSOIBg1I4IswMt89joVrY1DJE38ilwwDFNF1iGM/AkLd?=
 =?us-ascii?Q?QpVMNJipcxJR7Aw4d3IeVdmZ1dN1vurGVsIDoC8VWdHfwu9wTiaHlGUee5FK?=
 =?us-ascii?Q?/WLIcYlqNg+PksckgMNhg6e8FiO/YOyGvzSIuhWK2MjZ3GLMNFe5pyaG5l+S?=
 =?us-ascii?Q?tAVeJGjJKbmzV8cxRYevlOCDVhuG50eg7uthi82kNAv1BlR4t72GaTWPodEZ?=
 =?us-ascii?Q?LPYt8xm1C11vsWRrSno0d/TnUXglUjYm/s34UkI5ifGibeJ1oBW9GM+zAw4L?=
 =?us-ascii?Q?tJartJjYSB84jQzfT7MPUR09iWhukEKKOHj8/64RQ1YNlh30GZvyGh+0t8x/?=
 =?us-ascii?Q?3RtFcP+oiUx9i1HffaY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:23:28.9320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2ad8ea-4f1a-4119-6a0f-08de23dd335e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
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

BT.709 and BT.2020 transfer functions are identical, the
only difference beind that BT.2020 is defined with a higher
precision for 10 and 12 bpc encodings.

These transfer functions are defined as OETFs, not EOTFs,
so we create functions for them as OETF and its inverse.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index e0b285162..d3c030199 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -113,6 +113,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &bt2020_inv_oetf);
+}
+
+void igt_color_bt2020_oetf(igt_pixel_t *pixel)
+{
+	igt_color_inv_tf(pixel, &bt2020_inv_oetf);
+}
+
 void igt_color_pq_eotf(igt_pixel_t *pixel)
 {
 	tf_pq(pixel, &pq_eotf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 96bc9db5a..0fd9ba691 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -27,6 +27,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -103,6 +104,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
+void igt_color_bt2020_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.43.0

