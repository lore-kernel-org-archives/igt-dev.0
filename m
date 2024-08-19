Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7868C54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD010E473;
	Mon, 19 Aug 2024 20:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QX2CNrVR";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4410E46A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yggZMbywaA8CzmstqKxfGwmvWM2n4GylRq9gQ6DyJWARA4eKMr6smuIN6jYdte1gIEJHM8aBxfo8Ve00+tjTh/atA5sFdMUc67HpkuyOi5X7b4bCZKZmrcZ+RqOdrZsUVZp3ACrY7nKiblpdkYN4H/A43/E4BWE9qwxyI44sEAPoa8dZKXa0dIpI6nI4dWkzwymRMCqwS5I0EnUZa9SaOXuWEVbqwUtoAsgL9T0i1XMDmJGKtESEtCU0vqjdEwFyG2/EHDUtRk0F6Yk0aW7Lb1UPpCo3fiGue2AMJ5/+XyRfMMs6e8BIua2j1xLzLosMosn57DGLaPz3NDI/vA4hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3JfwbEpP+XUKjOAc15aXDdXYkCWjy6TLabIR42ErAE=;
 b=xD/zV5zSe855j3xM5+8E2Y1BYyX90dIoeKfY7rBGs4xI2w5iKyW/SWz4pSBpFwBs4eKLZ0DER3CiNZ7oPHZlWnaNNykRtovDWtAlm7c90wUhoqpVXMc69M1LG9ORbPIDZ83JMKtbY5LJKiM3gY2fvFvZKUwjmAWjMXQJrVsHCusb0OcD1D4IcjPNMPDKLTCL6qevdB5yG/L7IrOV8XSt41DLHSHDIybshLI7HYmmc2t973ielatDCCag1EnnCnGkS/BkyxjEkf5erAhz7aVj18wJ3hRgFnyYRX2s9iTZ99Z5KISLJt+xeoqnHp8Khm93d5bO8iyUNK/MgrZ0WuTFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3JfwbEpP+XUKjOAc15aXDdXYkCWjy6TLabIR42ErAE=;
 b=QX2CNrVRKUHx+91OsuC8FBcwAFntsITfAxEVnqZoFBw2UFdVINgAGMwDoY9KlWK4bR/HhnniOAVVuRtBixc3ft/lr9PnThe7/HU0dlG+1pItLxpRTQ1xGyRRtH8xznr2VxVt3V1hNyb+/vCao3msrxatPZRGO2UtEcNbSYO1eBI=
Received: from BN1PR12CA0014.namprd12.prod.outlook.com (2603:10b6:408:e1::19)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 20:58:36 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::cf) by BN1PR12CA0014.outlook.office365.com
 (2603:10b6:408:e1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 19/37] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Mon, 19 Aug 2024 16:58:05 -0400
Message-ID: <20240819205823.316656-20-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: b6324a86-bad1-459e-1162-08dcc091b194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?at0D7FoJTitMHcWpCFMyv/672urgnWHDaF57EYX5oXkpyFg2NjbuALrb6DoJ?=
 =?us-ascii?Q?mh+TDm1ajBT4pzSM3nqnMQiwwW0BAG5KIBW9VcFio9JU+rz2lJzlN3iN7E5Y?=
 =?us-ascii?Q?rWy6MQ8hOcmipdX2rWovCpKdXM/dKr9TkGdNESGoriluZ7N/lFAWydpoTh+F?=
 =?us-ascii?Q?QsHSvCe5R/VoPUy57ohJWAEGwqMf9cHmLfvgayMNYqc+/eY9zKI7w/TAoVst?=
 =?us-ascii?Q?bmPZ9XU178s5qmhqvzIOEzpbJnayAoKV73A4pWBwkftp7R0y/nQlpT1CaJK+?=
 =?us-ascii?Q?aivA780lSAJMq682H0bjadahomw11aN+sGQCchrCiUcOtHnfc51SXEzX282r?=
 =?us-ascii?Q?yViZI2z4mMxpM2jc6XSj4qmkDwkCXRiXEcc1EpQfJBI2NFqf70FQXt1YdTMg?=
 =?us-ascii?Q?LUJvtKbJAUzlqErhuTOCDW2/SYcgvZpG5ZAz4zhM5NSL/TfK8CPPPZJJ2Afw?=
 =?us-ascii?Q?0hITQDIFPtmNFuWr/H7JR8V94IuZG7+MntvNytMQ0sprYW3UqnEwEBL1kdsH?=
 =?us-ascii?Q?jFJexDbACY6OCiWUIasYTpoXj56Nu07nPVc6mPiAf2V1RL4AYlI3qJXY1QbX?=
 =?us-ascii?Q?4I91o5yTR+9i/aZItT+IEwFG+od3eejhrtItF5hJHI46x/qlnne/w5Beqx8d?=
 =?us-ascii?Q?febWqfy3Doj42h1S9QxsV7Lu1rKpro1XFiXnwLW2uOy4bp4z3h3h4O4quYG+?=
 =?us-ascii?Q?pJKtwRMaH2/EXK+YRA+wQMDIH4kn5vJ8Cb163VyXcprQsLWoc1OdMPWOrm0T?=
 =?us-ascii?Q?vzSvkvA0ZwOixGwWWMXrQ6CWMpI2OeqmSuBdNksRwsZZy6INPyBeFSRiFy9c?=
 =?us-ascii?Q?1cmPGS2angaUHCcaZEkdFkhZ/UzoDVeYKwdG5WiAxedUPI4T7zvrNlYp4WSq?=
 =?us-ascii?Q?SGvxF8zEaoaaGbl042wiGO4cen+Pt+y7Razo5KsNlHn9JDIrMIiQO7FmzPYj?=
 =?us-ascii?Q?k9kGzL7x4bFnxaDQAZwGBgqUbephDRWCXtT96t2lB6gb8aQLzjHLATqnqFyg?=
 =?us-ascii?Q?y/NboF6BbzQExK9OySAM5zMyawhG4aZKPsPpjjM6N2V2L7SnW3Gr4BXEgbno?=
 =?us-ascii?Q?ou2bvMU4oa+mKT+IFvXBRP2eEfFcooiDjUvniNCchlVarceZpM0kjd1QM4pz?=
 =?us-ascii?Q?H31H/wHDeZNkN6/x7q8ztHJrNaz/wts87PzVzqr5WKyLy4Szy+AsPr1k2atj?=
 =?us-ascii?Q?rTdZaAxGZHoeGr0SH+kQk8Uo1VSlzqRiMClIZFKy7Pbbjxz8EaftCrwOejPG?=
 =?us-ascii?Q?9TH+26ovOeLSSSsu3R6a1T+hji7iOxbTLGdad2sFT0I2DVPJQUaJ0uvP8dKg?=
 =?us-ascii?Q?7ghB9TTpTLzt7fX1Ya4iIgdi1LPqvHAwjjcPPRxoQ/9ux0k3MSbiOOBz+Wj4?=
 =?us-ascii?Q?f6Tzaq5xm/Fb22WoCatCQadvxKlSg7ZEbejfJ+sGZqm8pLsD5HyKJGC/VRIA?=
 =?us-ascii?Q?uUUE2ZHLIc62zojL2nONeSHabqiq+Tmc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:36.1048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6324a86-bad1-459e-1162-08dcc091b194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 56c232ef33d1..4c1751c3be1c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -83,6 +87,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.46.0

