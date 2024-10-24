Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC7CD10380
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDE10E3B6;
	Thu, 24 Oct 2024 21:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m/UTEKvH";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054CE10E3B6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 21:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRMhUYWReqeTEQRQ5TP0yVF8IRqE2YSlbWqyob87BIrCJi15KlOjVqyXPxEPwrnhEc6pMEna2Qc3gZsvE0vGy+NjTtDi8BYFX/5yoYSoB0yOhCquQDRlbpBPflA8x20Y0uF5nMTgGI5LAKyvBC1Ir2KRVjWzrbrI5bzhilwDOFxzLiFzIWibc5O9uluQoC1AKUPrP+nOMD+zrCeGaH5SmkmuAKyPDZks8juT/GDbkgw3KxwUBhf75DQKaGYtIQlFO+epSx5fFZ6dMZ+kTILMrpclfXGkTuj80FBr+9xqpqChyZrRiZqQTReUrAifHtUKm+0gfwZ1QiSYnGTYUUvbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG1sQmKW+r9WwpqLnbgy78QfcbK2XjYwze4JR4sCW1s=;
 b=MlXDCTz0PMcoOGcE1IqCGODa8F/VPYZztuXx0BYNADwwTINsP47erLLUm2ElJtvRzN3MotN9ERtiLfv3G7kX1EyDSnry1mFlWPWoZu0fxrUoLTwWlqzFnHJv64DLbEfpzppDMao5H/b1FVtqHJVgrXDOuUMLMvEiV16YBw2fXwPtT8ztcGz3fgJN/OnHtHrnneurWOCQqU7A1SrZdcVZRiAigMuIR8oI3r4HdBqsOIVdc41HFysjp7AEuy9+oYU3YU7SUIudg572FCP1sgTfj0wGH0IGGmsL2otwqi0LDd77+Q3zTs/xbb3EylAy2bsy79bESF4FLQwHubYzElmYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG1sQmKW+r9WwpqLnbgy78QfcbK2XjYwze4JR4sCW1s=;
 b=m/UTEKvHrkeHYze2ADJ3ikAJH72pa4OkXDWxKGZZIsQYxe4g2810XdE8Tf3vKoJYuvlzlFhchv64iWrfS3Ofa7ZDFKjil0aOgY2GeaB6d8mN0n+a3UQcLhgJ1kbY5p61i68MyGj3wVMGTYX04OoLuQ1IqLjWxMd8e5+cAkHpdTY=
Received: from SJ0PR03CA0172.namprd03.prod.outlook.com (2603:10b6:a03:338::27)
 by DM4PR12MB5746.namprd12.prod.outlook.com (2603:10b6:8:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 21:07:00 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::ae) by SJ0PR03CA0172.outlook.office365.com
 (2603:10b6:a03:338::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 21:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 21:07:00 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 16:06:58 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH 2/5] tools/amd_hdmi_compliance: Fix atomic commit failure
Date: Thu, 24 Oct 2024 15:03:42 -0600
Message-ID: <20241024210345.511501-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024210345.511501-1-alex.hung@amd.com>
References: <20241024210345.511501-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM4PR12MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3f8bf4-f408-44cb-2c57-08dcf46fcd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z3/XTh+oM+IHwciQlXHXBSR0q8M6DSnwxzOZzW4kxGmPOT7CNZB01u8YZMpx?=
 =?us-ascii?Q?Xz3sQqqIFOXaM3Tec50T9YseiHnTRzWlnXtcvJHJEbm/LfOzh61UNtAZ2NMt?=
 =?us-ascii?Q?s4YNrEl2gzxoYcyG7R0e4PGWywnFaIlSmGzG2jWp46Ae199puvIw4ktAuAxc?=
 =?us-ascii?Q?7V9viHpwQtBpYPw3TQvNGC15+CyPo7SfWvSsqPBxwbu7LDPNH1647KJOqAHZ?=
 =?us-ascii?Q?h7mpyuTaFD7/rOOd0UoJvf+D3+YUx4CC7CHVllf+UcfepvVe8e1hTw1lBoLm?=
 =?us-ascii?Q?Wks7TNYg6BEOnuZ+eQvvXZ4qmhjemECvpva0DKmuJDD+OZeGPpDPhfMlCDT1?=
 =?us-ascii?Q?iFrsAUl7GNlkFOIbL+iYtDe2o3G57vkOiuKQOPd6gdlxElJjnfafsIQJUJ8M?=
 =?us-ascii?Q?NrVha/DXZTy1sVglsNfDQi1EIhEcvK3Nyo6vjAL3gnvH5zvZsYcEZMB1q7vV?=
 =?us-ascii?Q?LBNFw0/W3EX65XbMcHGvCIfu7vdpZxeppKijzRuYjYXvnOVs+D8I2IH0jI4L?=
 =?us-ascii?Q?6ycaz0yRzfc0OlvvqKAuMSbxMmu/I6/HCdVPVx9JO4kZpdNKlMbmcVrdVCzw?=
 =?us-ascii?Q?roCA9W32We8MFXarfVRCDRaP0M1TefcgiJN+f0zQceXTj9EcC+7eFJkkm3f5?=
 =?us-ascii?Q?MXTPxht3OgaTVJuXyzDc9+/aWuFNqk9nmKIN/C5baOvc32efUh4Gg2tl5h3j?=
 =?us-ascii?Q?7MciOoqBkZmXc7kd6y0cDgC16k5STtZc0XwBmPzVlAvMon1E4HuqsA7ncL5o?=
 =?us-ascii?Q?27S3jjevKg5T3/iNT9RuVdxGFyFqfsXgdkTbB+Y6poqrLdgAzxNrZBCAOrGf?=
 =?us-ascii?Q?W04lpAiCh2nqG+ZJ1Oq+2I0BxpXlDKl4bV+S3Ypo0bQQx+mthtrCMV/zqSDi?=
 =?us-ascii?Q?8JdbyR+ohge4nAZIsYagLawhy+Ms11TW7TjyIsATajlJxkkglTpQG3Iv/N+u?=
 =?us-ascii?Q?U4mqRb4BO4aJAFWGoMAphoR1xqkRLjqpAQz2NNBMjBW98VE7E6R31Foc5H71?=
 =?us-ascii?Q?8JQXb36zT46wDrVSkZzMQ07w7epPlbCqpptDGb7IaO0A5JAkGXbcgP1Wj9Yl?=
 =?us-ascii?Q?HiuOaRTvZ5T1sbPDAD/CBG55iG5/pBPpsgI9Nbe/sSXduXzdEThCkOxsJ9mm?=
 =?us-ascii?Q?XbKCzEz2FJ3QMcjtpOY485lbYri1RMMCUHUuZPggeDpJp5Jv3iHHyrRijxlQ?=
 =?us-ascii?Q?hoF+2/v9w+7eUgqbf5ndHabNKCEWhfeRyjfbrpJyEPATZS1zDc7RzEE9YiPa?=
 =?us-ascii?Q?G0dmGtb6IrHZRMUjewlcxejfTwpbmsEv5mMokguJzhduOy68ig16Wq1aR7wT?=
 =?us-ascii?Q?Zj3cF9Bq7UubNcqrxNMER5orQb9fNaTMZQ/fWiH1jXYviDskb4+bY+43EWZc?=
 =?us-ascii?Q?a3NYa/Cy2cBrzplcwYl9DZ6I3VxIlAIXq5cuYAOhlvw8X9MaBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:07:00.1704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3f8bf4-f408-44cb-2c57-08dcf46fcd58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5746
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

From: Stylon Wang <stylon.wang@amd.com>

[WHY]
Atomic commits without active planes are now invalid commits.

[HOW]
Activate primary plane while setting 'max bpc' property.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 633d980bc..c0a324eb9 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -428,11 +428,14 @@ static void set_force_yuv420(data_t *data, int force, int conn_id)
 static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
 {
 	igt_display_t *display = &data->display;
+	igt_fb_t afb;
 
 	test_init(data, conn_id);
 
 	igt_info("Setting max bpc to %d on connector id %d\n",
 		 max_bpc, data->output->config.connector->connector_id);
+	igt_create_fb(data->fd, 128, 128, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-- 
2.43.0

