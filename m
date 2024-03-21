Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626EEC6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 22:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187E81120CB;
	Thu, 21 Mar 2024 22:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cV8TuNrg";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A781120CB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 22:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsovjOw9a3/2N1tw2OgyZMGfWj+ewE8fm+A8hFIEFg8c4HY4fIISRXnLMx4e+VcLBzU8M+vijN0vbbjJ7Jhjj+U8n78o6o3DzNuOrigm66jL/zVAv9KcLosk+hcVw4lvEqDJWqMIY6yQ79BK8GhcUGQ2aY1PoiXherzyURy6DQN6p3rX4ZcgHbNUo7fPX2fMEST351gBvlyd4iQKGu2BSox1tH36kfOb78n0dkCZxPcnLR0AoPwAWt9n1S6kh5D9NWyitPm4fCctz6y328vswHr1T60q3FQsl5bhn9jXXds5RODZfIXyTcnFIiXcMKY3SQesxiANlFAEgsksw54YAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meu0kv12lntIb6k3e4hknkL3MmBjpms2wTXLtyfP5iM=;
 b=kPI+kx5kicon+DeOUEupaNTVWx33CSl/blJxk+MxLZ2HEegtI5fUkOlkAacT9dUvPzP2eLULhMF2lpIzpS7K/J7gmf8n0cSPGKbZkMSz7d9EUsVXciBp2SK6SsQQSLSeOV2Ao3tv/tIeJVLkuM5dEesdsXko5wn1SOsAuX+1kDCgkwmXxvjTVqnToJi3rXtjcOs7iImN1OlaEe4ehITu3/gItTX7sIapgcFiM+6PVy7M89KvgH5alsrPA5pdwnwUlkesjufMthH6y4q7mM/MBINzGN09AIbVuFvwYkcVlX0v2sC+zCELKJblR92v49gYS06w0VVVWzeIS80M0ZiZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meu0kv12lntIb6k3e4hknkL3MmBjpms2wTXLtyfP5iM=;
 b=cV8TuNrgOpZpcteCIqLhHc47mN/qigmDXrZPxoczbZaE8HZMLESOQB/ciGcxOPPJeto3Ahm9B8JPx1l2OfGyEz3ZzZdhKjzpDDXykPxyqmqZUqmCi1Ah0Q6My0pGwrKDYlU2S9CdCZF2da/iTnMVIMznoevMk/sFlUm/wPTvUdI=
Received: from BN0PR08CA0004.namprd08.prod.outlook.com (2603:10b6:408:142::22)
 by SA1PR12MB7367.namprd12.prod.outlook.com (2603:10b6:806:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 22:48:40 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::7c) by BN0PR08CA0004.outlook.office365.com
 (2603:10b6:408:142::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Thu, 21 Mar 2024 22:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 22:48:40 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 21 Mar
 2024 17:48:38 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 3/3] tests/amdgpu/amd_dp_dsc: Check connector's dsc capability
Date: Thu, 21 Mar 2024 16:47:58 -0600
Message-ID: <20240321224758.1531610-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321224758.1531610-1-alex.hung@amd.com>
References: <20240321224758.1531610-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SA1PR12MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: e8afc48e-dd1b-4304-073a-08dc49f90d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsJBsQNJ9BY04Ci2U24eiUY7q1HtNHj+cTPfFA6P0ZL80jKbNYPwYdJzECNfMWTB7YUMNjt8/tXNoDSwPVQ8qJVT6UlSGu8nSrxhmEsjvZ0Py6iX3xEWHkpkBEbJlxR9sniwS2EN4ICkmYIgpFRGTHnfKHYLpKla9sINYUfb2WZc7Woyjem0HiLYdkrPzjPurcg/0fnwQlsjOwh755SKYFV62vn8QSno/9DVx8+0tes5R+Tz8GH3gt+tvwzB12HU5TTGR2fZ7nyc2Qi/HwYADRZACixEdJePygY7l2N2dVvr73noEvmChKu2Nto2cK0tDqMNWlnUAaZnjvqHJ9HUEi7n47pov1r8l/HlOJmTd4zluFjonZ5vPMXCegI6iJ2xgHpdu02Y/FKkgDB8mJKa2c4ZiACGDBVk4NJkPJIDxM9j2G0WYWEXMN25BdW1zVmGOP/b2BvnlpNzrkdhApYdOA5is0t0H5GchS0mlQ+e0DACjc5Pmalt/3Hiwvc7mZXD46Qmmtg30GTOyhrmyu9Wku9wtoiu+L1kDH/XaK4iwiseWlteZ1LfYLKKX/0BIitFa+GpsrrbCZbo3vp/lrfX1tE5SI/y0zhhFDQPE29Tlsd5a7UWwhjtOKhFLPv8eOurZdffSdmVPTjQ9OqR8A89JCAG1UE0xWgZ70cIpxrAQx5y5VMEtCojGHa64RVQ42jOs3uwiN29kpPJXwC/pmvvcyaSXoorDFtFAt23BLCnajHoIhDYEAU0IRoeXu2uhws0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 22:48:40.1488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8afc48e-dd1b-4304-073a-08dc49f90d98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7367
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

test_init() only sets data->mode when an output is DSC capable. As a
result, it is necessary to check it before running each subtest.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index f2da98259..64f1565f4 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -93,6 +93,15 @@ static void test_init(data_t *data)
 	igt_display_reset(display);
 }
 
+static bool is_dsc_capable(drmModeModeInfo *mode)
+{
+	/* mode is not set in test_init() if it is dsc capable */
+	if (mode->hdisplay == 0 || mode->vdisplay == 0)
+		return false;
+
+	return true;
+}
+
 static void test_dsc_enable(data_t *data)
 {
 	bool dsc_on, dsc_after, dsc_before;
@@ -107,7 +116,7 @@ static void test_dsc_enable(data_t *data)
 	for_each_pipe(&data->display, i) {
 		/* Setup the output */
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -245,7 +254,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	for_each_pipe(&data->display, i) {
 		/* Setup the output */
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -335,7 +344,7 @@ static void test_dsc_link_settings(data_t *data)
 	/* Setup all outputs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -352,7 +361,7 @@ static void test_dsc_link_settings(data_t *data)
 	/* Collect reference CRCs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
@@ -363,7 +372,7 @@ static void test_dsc_link_settings(data_t *data)
 			/* Write new link_settings */
 			for_each_pipe(&data->display, i) {
 				output = data->output[i];
-				if (!output || !igt_output_is_connected(output))
+				if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 					continue;
 
 				/* Write lower link settings */
@@ -380,7 +389,7 @@ static void test_dsc_link_settings(data_t *data)
 
 			for_each_pipe(&data->display, i) {
 				output = data->output[i];
-				if (!output || !igt_output_is_connected(output))
+				if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 					continue;
 
 				/* Verify lower link settings */
@@ -404,8 +413,9 @@ static void test_dsc_link_settings(data_t *data)
 	/* Cleanup all fbs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
+
 		igt_remove_fb(data->fd, &ref_fb[i]);
 	}
 
-- 
2.34.1

