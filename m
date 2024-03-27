Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECECAC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 16:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CC510FE08;
	Wed, 27 Mar 2024 16:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ij5rTS2p";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C109910FE06
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 16:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zs7/mh0WnfcNbgFxNKtn8UjFSfNPiAEJVaFFuwkNBQMMLOizpN8JxitkJ2g+o/rSE4VzTm+m6GdEn9Ilt1Cy2jLDvgnViTsNXjz4zVgNvFvLTiAuWmJkgXup9dGOVE0/oSVsIUTOG2ze6m227kIcz8JhA2PX+qGt1U67Bak3wpPbhezK2SDiCv2OpRijapMzok4twhHCJhwd6lXfWFy2+5/sE6l7M9Pje8MhKDd+9BOrZdQPnWIkJsXoK7eTgrWWZrEGdJMpMyEX4TkMX5ydMc9om/YleGBCYOksoScJBM6l3HCdp390fm5sysX0J73jM4+M+otujeXV1F/wdhWvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxHD3VY6VHw7NG8NHLkj4p0P2Sa3M4OsWm9RJRsakg8=;
 b=QVtnbF1MP2gWk0Z6z6jEEGwaymRhF7O4mu2hTY82re/uq1Amuq5keFFlhYgLyFMg6Zik9p2ec0+kxpqnbW76cIaFabRJKJc0jk2E6OuQth4A0hyuqKjBK4pEvlJiPc65VRrNb1/sYyfbyfDEuj6q3mfEX4MeMKypZDzLnohZYuO4wP76z888vdMnUDta8181zMMqGimRy/sJPlRtX6hb3gyDqf69pziMb911kYriKXmu5VdTuTuJgEid15RD2i24gSkfo6wNta0DPABMxbKBVQs1C/nD4sxIxmik10/6oE2eNcBhDHfHeBRjkH4uklwBVh+JxTST9kFx9c9l9QK01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxHD3VY6VHw7NG8NHLkj4p0P2Sa3M4OsWm9RJRsakg8=;
 b=ij5rTS2pkbkqp/h4v1l4ubdYmTt2g00dSOzKQRTQ/Gq5XRA4jB90cYfy9QlTK8eaE3sOiqJmVfhEv8zbMsQFnNRRibDLEuarFTSGotx5/Usrdt1QfZu02+uW6RvDp/9Ds2nTsUqPyb2fnSLjzrCLCo6tues0mR5ZK9pBhVdc+6E=
Received: from CY5PR19CA0038.namprd19.prod.outlook.com (2603:10b6:930:1a::16)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 16:28:13 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::ac) by CY5PR19CA0038.outlook.office365.com
 (2603:10b6:930:1a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 16:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 16:28:12 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 11:28:10 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>, Hersen Wu
 <Hersenxs.Wu@amd.com>
Subject: [PATCH 3/3][V2] tests/amdgpu/amd_dp_dsc: Check connector's dsc
 capability
Date: Wed, 27 Mar 2024 10:27:37 -0600
Message-ID: <20240327162737.1082932-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327162737.1082932-1-alex.hung@amd.com>
References: <20240327162737.1082932-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: cf765bf3-9fb2-471f-b298-08dc4e7ae5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apfI7NmQ3M8vsa0Ubh0a1ee7v3nDh+SclLegxzqYRK6OncK1jeS0vIWpBrLUVEVhCRHn2tdtpN4JxmvNFbfuaoUKd41AnlYAsILEp6JpqFvO340D1V3J7A8fVX+ldYeXoo8m2sjHJ/tDBpL2V1OaV5KPnEzJBatu/orAwSZw7Cdmhxs0QoIOUqc+7VZsK/JCpFZJtyFzl8ABQjENtobsJWKSCsp286RPxOnW3POPwEcbWTZhuPtQqVF5yO4tK13f8Mswa70uRu4bsKF3ozHjKM5Lt7e6khxf4Nx7VThUMEbl+JJOJB2o5cxA4svmFoHn/BX21fZB5r59axHJ7Y3KEylpd/nZCfkT7p8h5xkZyjaX9sDWK89gDoAFrmtiZrGgY4gVFtKScocru565+0ljz9bLC0bHOLLT2nnaU87akCSwW05tZynqr3hkloCk0JtaAn6fnOcasZv3SG7UZC2a5j+qfPPUW0d28LeEeCpDR+pNUFMhFwaJNYOlUtLj8TENlvKKR1yMtYbd+Qibod8ARuOEr3q7J0qlzkfp/qG/ybJv/pILsmrCrjRFUuwjkM/3zjV3Eztgs126YnJ23wVczIP5Fp7P7A5Op5wnPIpx0lcQBZCLtaWxf8Crc4uevlOZAs7flT5UhWXEJtZoUv32gIYhJOLdnv4sF7W5AFOuL3/QoY+y2/AFmdtAxpdxwegbJtSsZwQZFqgwFbdfKOJcQ9XaQK9K7MBMwDayPmnGbLHbc9luiqGjFP6quNSjjb+W
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:28:12.7007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf765bf3-9fb2-471f-b298-08dc4e7ae5c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606
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

Reviewed-by: Hersen Wu <Hersenxs.Wu@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V2: Limit lines to 100

 tests/amdgpu/amd_dp_dsc.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 900182443..13c4452da 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -99,6 +99,15 @@ static void test_init(data_t *data)
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
@@ -113,7 +122,7 @@ static void test_dsc_enable(data_t *data)
 	for_each_pipe(&data->display, i) {
 		/* Setup the output */
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -259,7 +268,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	for_each_pipe(&data->display, i) {
 		/* Setup the output */
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -349,7 +358,7 @@ static void test_dsc_link_settings(data_t *data)
 	/* Setup all outputs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_create_pattern_fb(data->fd,
@@ -366,7 +375,7 @@ static void test_dsc_link_settings(data_t *data)
 	/* Collect reference CRCs */
 	for_each_pipe(&data->display, i) {
 		output = data->output[i];
-		if (!output || !igt_output_is_connected(output))
+		if (!output || !igt_output_is_connected(output) || !is_dsc_capable(&data->mode[i]))
 			continue;
 
 		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
@@ -377,7 +386,8 @@ static void test_dsc_link_settings(data_t *data)
 			/* Write new link_settings */
 			for_each_pipe(&data->display, i) {
 				output = data->output[i];
-				if (!output || !igt_output_is_connected(output))
+				if (!output || !igt_output_is_connected(output) ||
+				    !is_dsc_capable(&data->mode[i]))
 					continue;
 
 				/* Write lower link settings */
@@ -395,7 +405,8 @@ static void test_dsc_link_settings(data_t *data)
 
 			for_each_pipe(&data->display, i) {
 				output = data->output[i];
-				if (!output || !igt_output_is_connected(output))
+				if (!output || !igt_output_is_connected(output) ||
+				    !is_dsc_capable(&data->mode[i]))
 					continue;
 
 				/* Verify lower link settings */
@@ -425,8 +436,9 @@ static void test_dsc_link_settings(data_t *data)
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

