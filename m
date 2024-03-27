Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D44C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 16:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D652C10FE04;
	Wed, 27 Mar 2024 16:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zKt2QKLL";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFD710FE14
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 16:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5BjDAd+6wddvA2Mf76u0fSExpw2D3KEu15Wt/80gm6dTzL08yc09Osvfte/1WqjoPIx5tPMf2iiGQk/nP/UagPlfzr3GXKf26V2/1A5s48sqztDCEPHM9Yc2WknoDtJaPUOMFbXz4A0yJy8ko2ZKgTNoU4s4OTdLb5Vl+59CUsDLXpxu7OYiwnboSgg8lsGhG/0Jnh6HXmGCk8HgNQCi8DEB2OROptIa0Z+z3zsjyAka5h84610qwEmCFngAMxYuupN0uwlu2vUUjuJV5vhpY0rXL4M/BxHJLITkp0MoLvwN8rWihj4z+kgHXC1AJHKhtBLLgQz3nAD5Y4uzT0CMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxHD3VY6VHw7NG8NHLkj4p0P2Sa3M4OsWm9RJRsakg8=;
 b=chBrbGMc9++GGu04eGZEDm9CL7ESWf4RmPU4n+D24q663TjVZ30bnXAUEOpgfi4Y+FY+22bZfb8xC0+A+R0tRjsnosLOqFEwBMXTPyYYs/b4RKLjWHGV+QSzFuM+KLexJpbPhslNgJG7GB2LWEiaAADT4T28tvbELTFqiEvOYdjJruRyFM04D/+a5tDmEzTrZu1zlKMJKqhRPzxOgG5MkAHITQUDcISLlgc5iMuCtXVZE7u7m6QB+5PuqJolQXhsDv0U4/Zzd4IbDuo6zibNaV8d0s0OdzOC1XJhAzArWqOVPB4awoonwk7JsecIRiML2jvTCA0djYcN4cgEbG+9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxHD3VY6VHw7NG8NHLkj4p0P2Sa3M4OsWm9RJRsakg8=;
 b=zKt2QKLL8YINtm5CZLV/2rvuOUmmvmnlev0o9ko1hWdx4FcT9JXam0d9rEjtCoOJJa7bay4VT0+04RszB6YY9qxfFNAZiOZtxXi8m/uSDHfqVpbPmUzNMZY+3aivkYGbMRxPO7DqDh3c8N+EDeCpVgHnKskf816+22NvaPKY7UE=
Received: from CH2PR11CA0001.namprd11.prod.outlook.com (2603:10b6:610:54::11)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 16:25:06 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::e3) by CH2PR11CA0001.outlook.office365.com
 (2603:10b6:610:54::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25 via Frontend
 Transport; Wed, 27 Mar 2024 16:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 16:25:05 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 11:25:02 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>, Hersen Wu
 <Hersenxs.Wu@amd.com>
Subject: [PATCH 3/3] tests/amdgpu/amd_dp_dsc: Check connector's dsc capability
Date: Wed, 27 Mar 2024 10:23:22 -0600
Message-ID: <20240327162322.1068745-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327162322.1068745-1-alex.hung@amd.com>
References: <20240327162322.1068745-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SJ0PR12MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 426adb45-597b-44a8-d83d-08dc4e7a767b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dy1hue6ayWQriWn01GqzEPvkltOU1Xdux9PM3vMl/KU+Uw+t+Q6er4Ld663c2ogrPOTj6/EZq0gDz31NY6Mfhcsgi6auNBoEQ11dAzHwMkCW2zQJBKNa6sGEEf2oAjaoHb2g/TBdmedLAWOzx/+mVNfU5kTPKdC96Qr/oqFkKQ3vyt9gv7Irp/KnfY2tPaNJyxCRuQozYEJwucN6XWYTps8wA+VNHBVRnQ7uhKbRd7KywUkZumtdJ5tn/fuDx5qvmLwgYx8NmaLiCTkD7FHw6E9PPA4v0srV48fJ13ZQvzLbrfBWY+6x3pdE/tan0lcYCwf8rxL5sGBU+xqokKTwdRzK3mBEaTAlZiP5zMNJ6zQaUWlHNzfDz6i+2pvkX4Kb5oOJJTEpbqt2n2TTYAGywIqfXAyJShjLTdYg5AUA1cAFbo50MGBCyTqwYzQ/PbdWTzLVs5ln4D3B3ORob2txpK7QQJP3/Os7v3WmPTT0DVxtm4aG9VwcHXUw2wnAr+pp0tVSUG0ICzyTCjw67N08K83ZUw/CidqMQVQJzYrKNdm0JS1PRhy+ouOym/sflxH5Mps8s9cGnUyMI+5/Uy55kEtBv67z0JD7TNdc/BIQ8aBKqijscIrv3TRCOKprRPiNUCFy4SdfFj4dQ0tE6sTOyg2TfUY3dp44w2ttLhAZ/f/a16xgszxdUF0BkygR7lxKm42/PzxIsTLhvUwHLwbgsvJ62aUvtkvCYG8Al0aZm15eH81mq+aLCwXhJMeqAFuo
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 16:25:05.9634 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 426adb45-597b-44a8-d83d-08dc4e7a767b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757
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

