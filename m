Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB31C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 10:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E310E33F;
	Tue, 18 Feb 2025 10:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tmzcQ+/K";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F8710E656
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 10:07:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bx95mmTSveIgfaR9NfjCVsxGDEG3Ga8YwENWH2G9PvkBj5jRmsLkSRrcUXuNeBTNJca3Lsl+sX6/fuTXBESXi1CZIaEwlvDM3ui2shrtCh24DPXDRhZY0pPGyj4JZnJc4wfix/P15tRIQgugoUO1km4NePFFYcj+k0xeWNAuqBXDPJ/XiCQ3Tfw4Zrp8+Aq0eqOUaypsVdqWS5vLe67khYAI9pBzT8dfFcWmsEU4Cc2/s3oAGG7eEIuGTUENjB6aaxmkaKWs9emzTd719fw8TzYBCxr0r0oKxWo7HmYcsVR3wWJLwmjr/gOmTwZkGo10v31/YmVADazvlq1+E6IcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McM0qQpcIg95vN/f0kDzKns9Hwce7+j6uTW0DJKrV8E=;
 b=MQigOCd+PMc6YQqxaJf7KSYRQpaa3YmMAKI05Fh5iiVDyn7t/oaLOHcRRgEQKKhXBxeQstb0u1ZJeLDiZVh6g3O6GWJs2o/bGhrwOM1ybuk0FAY7qN0cldmFDlL9NSZvwhx09yP9bFPo7f+CHdzUeLU+sxFPh5Ttaqdww+VKPMgnCRAxumH7B7YE15/GNuaVPQ5C6kRGrH8bPJ1l2I1PsfCl5uZamLfg3Xy3TqfggWKPkBxsh4XnP83l98F8lixIBC3UiYNZtI/C/hAozZF6/ooVUlBg3zcRweHR7fNTEDDztWieZnREgiOdaAw7d87evwZ9Hb79b+peiSBKdgD97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McM0qQpcIg95vN/f0kDzKns9Hwce7+j6uTW0DJKrV8E=;
 b=tmzcQ+/K9NRIt83XQySco5mmi7fww6h1kMNnb6AtKjGWel/9sfIe/p2w8V3FDogfsfEJNcyzaZb3c04zPqzCElctQ28urtk4fCK6FIZdal01H50v2EgM01pRDTs0VwRrnkpnO5dVN1y9ZAGTwJrQP+ynIbkzebN2/oMe0/t/Or8=
Received: from MW4PR04CA0107.namprd04.prod.outlook.com (2603:10b6:303:83::22)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 10:07:45 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::9f) by MW4PR04CA0107.outlook.office365.com
 (2603:10b6:303:83::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Tue,
 18 Feb 2025 10:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 10:07:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 04:07:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 04:07:43 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 04:07:42 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,v2] tests/amdgpu/amd_abm: Disable the ABM after test
Date: Tue, 18 Feb 2025 18:07:37 +0800
Message-ID: <20250218100749.5567-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 755a2b06-3fa0-4908-adbf-08dd500416be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2z+iUzeamT/wlfDTHEcfxhBMjWXqotqNbSnqxgje/WvZ5ZpHvzowwlU+iJnf?=
 =?us-ascii?Q?rgnzkZzwwFBJ+zOcqseT5XQEiHoMjCrW328CAjHbP7MZCjJR9oAgnT0weYPR?=
 =?us-ascii?Q?snksiqBCODqjcS2z/iOpLe8cz1QfX5zl9xGVW3EbO0l7K6HDAiDqwfrlezJT?=
 =?us-ascii?Q?/yGPOy/Q6PwQqsPa3a+X4L7nNRB84jad1XbUBMeg+C/4p+zdF9wjqJpEB/pR?=
 =?us-ascii?Q?5SYyll6s/HGggqittL4UxBjIACGpnOHtxU78PBAIWC0xYHFNrl/oE6GpMX4d?=
 =?us-ascii?Q?bp6HYcmJL/ne8BznCU/4+KboUVSCHK2fes1ZAuXHkDPzOw0QP0D7mfXi12Mg?=
 =?us-ascii?Q?RJRCnU/bmAwXh9SnbzZPJHwfc+9KOHOQx9tKWp5q0FjMpl5EG9xqXgfr3t4G?=
 =?us-ascii?Q?qpM4ybNNyWZpOK/y8FFpXkjZPPP4CN8Jc40kI6ktfSDp6VcSv5Ep12u0JQIx?=
 =?us-ascii?Q?7a7KPhabozSV84cFlv9KtRolMlmGb3r2YRkIt0e7QsFwLKvMoOdBKynWuBj5?=
 =?us-ascii?Q?19Sw/6qk1prB7em9aQNpRUAhU8ccFwiEdxI+RzIccW/yG/IMr4LYvMmzQpcN?=
 =?us-ascii?Q?Vzi/QfuPCRrHWLFrPqN0ggwwwAnU46rmDQfxZ4BbcQA4x6Q+cy3sZwsoKmw5?=
 =?us-ascii?Q?T92v45oYUCEaInlCtUvS8uC+YS8yEwhT0hpQGNrrxGJYvMPRcRk5iHPrqxlL?=
 =?us-ascii?Q?wNP7ZMAmun4FQZPL9t+NwcfJQrm5Cm94ZOGKI6ENjxa2k7sapgOvKs8Zc1oG?=
 =?us-ascii?Q?lJXi3+85I3BmwjegGH6RBuBj3bk5OfZMBzFOKEI1TfNikqfxnoUZPNWnvzWB?=
 =?us-ascii?Q?K8YNFrhqWB5tH+dLcZ4vT17z/arnFt0s/DG0VyS7zBHPUkyCyyBXHLmHaDOL?=
 =?us-ascii?Q?cW0ySWERRveDLKIUBBCa2g4G/yzGrZfi/6h/QD2DPMTVuF4FJvt1U8X+qXed?=
 =?us-ascii?Q?E3rcEAkgR8ql7K24tUlwkoQXMVzl3ubEzTxtmB3VddY0erjVTJw467XvWcm7?=
 =?us-ascii?Q?sRW/h2p1rDkYO8FUYVOOZmFjHmBXvj/XOiRZXh7xkyguC+Jc28maoRCafcgT?=
 =?us-ascii?Q?I/19OjQ+K/D/+zRN5NP0ZNYcisCiMSvq9YTHPsMfvltmfeZzXsiOGoibObXz?=
 =?us-ascii?Q?v8V6zf7/dLCzqVOO2rEvo4NaBhcojbTwRr3H/cQSuoV/EN1wXyueNQYcfHNH?=
 =?us-ascii?Q?xlnm5z4R8C46xgruk4SVcUjUfjo3D3ZrgHI+TztIPN2im0kT44gNz6Ll/8VX?=
 =?us-ascii?Q?op8Get40/Qdl/2L5a/TxsuO2CFA7s5Jw0Rxmll37CfbeXhTclmGfI1v+vo1N?=
 =?us-ascii?Q?4OIbc0wZxgh3Q0xXrxRsIgLgeTBGKOo/t5HPsSr0fQWBaufVdhpjb9eoJvG+?=
 =?us-ascii?Q?urKF6h/PEJFDBkw+pnj/nHTUajuNdUXseDDXL5htgcBL/7lHOZ7X4tjEl4kc?=
 =?us-ascii?Q?fIk5vz4dY363OTPw4XcrL3jm9QYdd5ofyXlIF3USTz30D0GrBodPP9dmmkhz?=
 =?us-ascii?Q?p8p/r/MO/2TDrO8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:07:44.6602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 755a2b06-3fa0-4908-adbf-08dd500416be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
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

[Why]
After running the ABM IGT test, It may cause some other IGT test
failed because of the ABM is still enabled.

[How]
Disable the ABM after running the test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_abm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e196b6ebc..f7568c088 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -49,6 +49,8 @@ typedef struct data {
 	igt_fb_t ref_fb;
 } data_t;
 
+static void set_abm_level(data_t *data, igt_output_t *output, int level);
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
@@ -101,6 +103,15 @@ static void test_init(data_t *data)
 static void test_fini(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* Disable ABM before exit test */
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		continue;
+		set_abm_level(data, output, 0);
+	}
 
 	igt_display_reset(display);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
-- 
2.43.0

