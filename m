Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E243C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5741710E793;
	Wed, 26 Mar 2025 23:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U0IMhYk4";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4873310E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ve+RNrCSI4WsEc4zBtFXecT1nsKSwWAaLASUbLA9zGdtuXmOC7TNIJb+TXw0KcEBqECTG3e1xN5IyTUAO60AT+UZ9/0vi+VgwXA7bdJ5CslKy/uX5oFDG8ijJuUOBM3HhJ3DyN+CDEs8ODxzmdu3Qi99DdgzbH8YH8qVRfuOVfqR4NheqFb0n+K035BNrx0kOLVEOzdK0Wwkv20xvhKJIb1plm4AzotOLo8YV1Z4wrHym4eJcRbeK811S3cxwjIRuaLJJhZxeLJxRzrOLlp9bCH1xmgJ6L60qRhMJXijcK5PbvK5NRy1asBQfmsiMoeFxxZOKOC+FoxB6Qx089QRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=U3hSjOgmkK5occ/y4CthV5GZUdmDVr949xI/Z8DMB8Y/9+hbfSAqG+wBw8PZjGbBN/fNbr7QNhzkt9Lh8bV/YSr9RUFVUdOn/DuYNeUxWpDxhDCnj2RtdvnNoFcgpIndG6e0DyySuJrS+yK/rsZmv73THQUyxaWOUBYDQm2zmoKmefrwxFWuPssTT/EEWo5kaTalUcwa1d4clY2bGAh5nIsL7mUljrE0YM/Z4OKMv2ZIefyicU2/ONtJQ9OCQVXoQW8K8bd3aK0XaCtwaWOR7MeUkENx/et5jgGthG6TC4VdIIrthVRqTCGpFJV0GTmMLM5mA/AFel5RE6lpvyz3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=U0IMhYk4DJlsy2qj7HOMcwDNv+Cd0/8bGWnDlHb/XT407oTb1msjzSVyXc7cBUDi3Ow0ISrMaYaDTJCHD4j1DP+nYhAVdbqbogdMILV6lQVhsoH7SKTSUx/fjwDXTx3umE1N6Gqbkaq7/56COdbfClDELaNdyM5eAnV4hSerqzw=
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:45:10 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::3d) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:45:09 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:45:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 28/37] lib/igt_color: add BT2020/BT709 transfer functions
Date: Wed, 26 Mar 2025 17:36:00 -0600
Message-ID: <20250326233609.2980110-29-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 639c4525-35fc-47f8-2cf6-08dd6cc03ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eexR2oDG5FjGjkqYVj7C70QA567KaWCvCDga0IEceWpGmCsiniblLegdERuR?=
 =?us-ascii?Q?Ic1IBtD2PEehD3h3ARtp0VOnPUTcUVwfgrPFKWIto4oVOxLW2tVZTlvhqm58?=
 =?us-ascii?Q?i70TIknx5zMewN/UMSrxni2CZczQLVu0G5uU3VJ3kzY3Ue8VakkvzMQ6gLBu?=
 =?us-ascii?Q?rS/X16S0Hl/LEmE8e3iJcSqB4WZNSgzWRwx7CvGCmgOyjByKygX0Hwhx8rGl?=
 =?us-ascii?Q?SeZUJDJY30RjmzndrFw2OCny1WON6WMZxbfB4NNQD8ACyGqkTQpmfHxiWQNQ?=
 =?us-ascii?Q?PgPXzSiiuVlqfgtZHjtj4uKMt+EiHSq8azwuYZPddo5dXx3F/RHBkAcvjvQk?=
 =?us-ascii?Q?1kIZ3w7epZVLKDc5W9B7fHlTvsNDWjNp0rEnXKBsGW+C1ia/wJXb8yGqyesA?=
 =?us-ascii?Q?zwi0+Hs+Q2z/GK7UEWd4LG6fjlcpNS3DZ4UKpraJ6t8kI3DJplU7RyIKPU7w?=
 =?us-ascii?Q?h9rB2AnXRIie4z3/+Ja1Axe/1Sn6dALm78Vs4y5O9QHULOif6qIRndWUxil/?=
 =?us-ascii?Q?C6J0syEFjjhpK7oq0XMNZ9h7w2nBYcteTTc1LwZ2lclq0CAMVksZuZIAaNS4?=
 =?us-ascii?Q?uf4X4Q2yjh9G3cIj6LEg1xW8ISTx+P9gnjQZ7U6Py4Eo0feBBY7LMah+VShn?=
 =?us-ascii?Q?5S0SQf0x6Nt5iOFpe2LNWk0GWvoy/mTERJlvCOhaNJsVQEgy01c3PiR88BTj?=
 =?us-ascii?Q?D6jdN+dnnf37WckuHSXSobnYq+ensFAShIAeAenEHlyOqGyAwg4WqipwRYBc?=
 =?us-ascii?Q?FsjXEQn5mWRw/RQbmg4XySpkEQY1tch56rUDJ6xCka0nk0IHsrUxYHzwejiJ?=
 =?us-ascii?Q?aA3LKhQLBCA8pYclcsK8x8M7EH0mDWZepkeXD6y8E186NEaSZL3xzFBVnfmz?=
 =?us-ascii?Q?wXpgs2k0mGJVxHhPNJMVIXchl7cySM3Zj0GIwJfuZntXUnOmSvca0TfIabXY?=
 =?us-ascii?Q?OD0tkHSDxqkifYF3E4tenmdCOMwdrQKqIqlBsLZ1xdeQ7uVfYIGuNq4Lp69L?=
 =?us-ascii?Q?RzWQ4QH6NcaQrW58AtkO2G0Tat/TH1yhUYYDQF39Au9VBrTsEmiHqCAuj5bm?=
 =?us-ascii?Q?/oDXWBU9kkGG+yHOyDwDq2o4O5pEDa+M4NmVDhmqmKS1wyAACbCQYjwakbh5?=
 =?us-ascii?Q?7YwGSsRoJ5nwXvG/4E2i8JwhvWP5RhB08bOsLR1PASRWaZbd5rx3p3ALfAty?=
 =?us-ascii?Q?JoR1gv6AYCK7qyKsJeKoKgsCxVVsCfS4x+ku4l0zVsn0Ajaoh1LQ3tuJN7OU?=
 =?us-ascii?Q?BXm/U+w7ibWT3aKDS9OqR15NU4KO6K0qsx5JDMzL2EPNQMJ+hC2oBjtKOcXo?=
 =?us-ascii?Q?YIMvgqUUhcJnNltKv1NRiXRhbSWDJhutP+eis1MtYd2MCllgRJBctQvFIls+?=
 =?us-ascii?Q?hgkOHEv3Ai6QFkoDN+lHjzU4CNXaFqHsReKoFjLmH7WpOdecA8X71eJwhFot?=
 =?us-ascii?Q?zQdq8kcynBeC9eL44pE01uSPnk/49f3uNBb2+AIwYkvUxF+42tWt2jAVjUBq?=
 =?us-ascii?Q?ARcYkmHc3O2DnmE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:45:09.7505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 639c4525-35fc-47f8-2cf6-08dd6cc03ec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 0926385f4..ec8b27d1e 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -107,6 +107,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
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
index a97383fab..813bd19ba 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -25,6 +25,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -117,6 +118,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
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

