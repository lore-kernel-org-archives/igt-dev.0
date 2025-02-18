Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6A9C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 11:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD3710E034;
	Tue, 18 Feb 2025 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kx9IMbbD";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A4910E034
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 11:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNtrsm84+VprMQfZasMMg6MuKTD0LtAdO2DF8NvsHZGV2oWNohAji5ofcjiv7cEEZwxtAg+k5wx16yCaBgg/MVSo32qLnMa8WqsxD0OtPDw9tllB8UOD57FkTnTgDbG6ERmfx8qPp1gflc/rbnM/xe4394yasXP1B9iw7E5J7tXLT0fhaQmot8DeGSjEedPBEr4r0xduiUZmDedu4My18l721/yxBkpp50flTApNzpJFLuhOdzEWgOda8SyQqX/AYAUJeQu9yTAyoNBjcifOZn50PKjG0eeZF1Hks/L9E9fOgkbjq1SCVCCrPk2WpZh8osNP2uc2OHujoUyaiJD3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuitt4lOBzzoWDFAcHhy2Afo9CKjque1RbdLzPxeoVU=;
 b=PdqIU6cKWa1L2aq/Yoc+eF8jSqTxHok6xL9qixORvUcpY1P5Otu6ha4RGZ3StT654iTljni7lJd8ikXcyQPtBj7dH64UZvkdsSTHw1pcmMQrRX6wG1Klnkme/jKdHztWlOoUmO7TVifaAeyleUNoEt775cpKbwB2fKLFo/pRBrWUeuxcqfEVS9mnPANf+RlHzpRO9UmIHxKQ8FJvnwjNH/dopywexecajY5fz8WpXxhHQdF6v1vC2lk2ApGQJecV7n0pIW0QF6ZuO2m7LFHoUI7xwoWXkFK0lkIDAOWbPzIItWvBdMX5OMYK3laVdGtp6nnSkK+H8LZHmvtFCRG43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuitt4lOBzzoWDFAcHhy2Afo9CKjque1RbdLzPxeoVU=;
 b=Kx9IMbbDrWKM3cL9J8u0k8OFeV09W2boBZfiR2U8iDe6GY4Y4lGaXai7dOODgy0nxcK3yEOhBaZjStfi3/vdHXawCQAca8zfoMknRrNOk6/VicRxq/A6wVJO6kpL2eRCW4y0lknCPwGUCwJR79dzLRQarmBWGY6yoRQDEglrhO8=
Received: from MW3PR06CA0008.namprd06.prod.outlook.com (2603:10b6:303:2a::13)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 11:05:12 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::45) by MW3PR06CA0008.outlook.office365.com
 (2603:10b6:303:2a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 11:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 11:05:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 05:05:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 05:05:08 -0600
Received: from tom-maple-halo.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 05:05:07 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t,v3] tests/amdgpu/amd_abm: Disable the ABM after test
Date: Tue, 18 Feb 2025 19:04:32 +0800
Message-ID: <20250218110514.8856-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c1011c-2846-4de0-1c4c-08dd500c1cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mlZJ4u+wBu4CdItoam0q7AiaAid7iJTgN+jC/w5RjLFOD7+/dvYO0UsVmIHX?=
 =?us-ascii?Q?zWSAJ/r3uZjDmy22qt0SWZHve/Oo/vk/5kYgH9TIi2a7zpnTgOGWuHGKn6F2?=
 =?us-ascii?Q?yaa9iSW3kye2CiAaT9rpMNl7G6x122W3gRBvMPq25EmwL+uBidmp9VC/gusS?=
 =?us-ascii?Q?WehnOegKSa6z9kIzUPkRkGu5c+7kpDhvP6Km+Xq0MRB9hPyGhTfdX2+IMXM9?=
 =?us-ascii?Q?blgsEpndGwx3qq0+MRDjuR1LL+DiMgfegXshty9lnfqECF0SM1VXLWiNEtpT?=
 =?us-ascii?Q?E5Cc6N48y9XFAUq3i5XYypVecDIq5pqNsucYOmyyob/tJkp+UX0Z21IZaDuw?=
 =?us-ascii?Q?p1UapFkTe9rYy0/a/7xRmyVutpQkq+DeEL7efW95BqUlg5qXOvhJIPLIAfZ2?=
 =?us-ascii?Q?FABo+Z+SaQHPPWJo++v8+bXep3Q//NRAmfcuasgzx+zg1o6q640jD+s4mccQ?=
 =?us-ascii?Q?wHYuKOM3dfeD8wWQxIACDzj18yvjNVa/sFHU9e7rw5Uoil3BgdIep1Okac7T?=
 =?us-ascii?Q?ibSJmFZkHpMGY77quBou2D11H3NB/ov+nuNIczD0qlpB/DVcSVQHPnvcTdNf?=
 =?us-ascii?Q?WJg0mXXM2LmmLry0+AVMowGdTg9KyqWLETy7psbU2honiEPUeCgrR1GLcLyn?=
 =?us-ascii?Q?SvFNIiJRt+PHZHguRxpU9y2fzo+ztwtUfHa1N09MoUr0wcvZ5nMwPWmvJAUu?=
 =?us-ascii?Q?5Wg+qL4fZZo1jRSiNuFB9VUgpq2owNK+nWmmNu3pXeD/ukqnqMAnjtBpzt3n?=
 =?us-ascii?Q?JYGAGo64IYdRieNHdp6Jkmn5YtMySpI1tMkYBazyzRv+A4FOxUzZbj8zK7Px?=
 =?us-ascii?Q?v/UPY1lKPcYzTJ4Ua/CWmT4fd9kneEU1NGpd47FO3enUEOi9O9CemhL2LiJL?=
 =?us-ascii?Q?8odbuszC+7ZkCdH/Lo7p2TV1JekZjbo+Vc+Plzy2T8QItY2W1btuOnqEjy0S?=
 =?us-ascii?Q?N1+tAqIeIBurtfYQqDWV3fUhu+326UaLYcHLfalpB2oX5DfLAQMfCpw5Vfji?=
 =?us-ascii?Q?uPX6xtkv/3PHaX4vVasaCDgAGALj7SpW7hZNrANXTRtaTuDXW+kLO6YmAZW1?=
 =?us-ascii?Q?vNBFRm8a+xbH8Fprue4GM7W2jvs+6ckhZuCcfwc26m9DRyJAjMs9YGxT1UzU?=
 =?us-ascii?Q?IQA0Utm00BBPpnfPGacQLkPIUikLa0p5Z4gCW2Z00Pbz2v5ZcVNboNQ7dVKm?=
 =?us-ascii?Q?ok57hzqSk6f3/J7bjRNtEPgzax1zEgmkAk82NeOQQfGT8sQ3Au0EVfjKa5xC?=
 =?us-ascii?Q?eW1SWqX5SVYhokMo1PuYrGNXmcVN7wr1xhqou9l9tDQodi91eDNZwzXRdPVz?=
 =?us-ascii?Q?k4408lCIm6m5hDx5lA6wGCrbCiFUYwH+z5BeJ/x4grPL5VQ/u6Die2VZlttE?=
 =?us-ascii?Q?iizIcEWGFWUfupp7US1K/7It0BJt/yRRpxT1njnQCAdw6qTqHa089LDwowQ0?=
 =?us-ascii?Q?uCACFynXS3xMdk9KwYnDDZmBxxpctpu89t3XTwvDtxIAGSyZs5TfNZaecwgR?=
 =?us-ascii?Q?xOQXLm4eVTCpFG0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 11:05:11.0712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c1011c-2846-4de0-1c4c-08dd500c1cf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
v3: Fix the conflict

 tests/amdgpu/amd_abm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index e196b6ebc..8f7f489ad 100644
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
+			continue;
+		set_abm_level(data, output, 0);
+	}
 
 	igt_display_reset(display);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
-- 
2.43.0

