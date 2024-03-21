Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F6C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 02:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D3A10F637;
	Thu, 21 Mar 2024 02:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SH9r31qc";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F8010F637
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 02:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zim/Ghk3mHgJVWlGF3EVHefIglIoozZa06I5vhfclo+p8rXyXcSEcbzhVXN1Q64uTm2VYtSBajaKb7FT2KTcS+9ymFW1BCWEAo5VoMbxMEBehLQAoCeYPtT/KGmxq8RE3GDYzg3CosYPJAxy+Oe5IElTQPUGDpWGDasZa9D3zlVUEpnkX35asttG1dxNFkYkHlJeUX0FHJgq9sYl3pHzOfbx54FEHwqfKO+Gjs/WIg96DpCZ201eCGHVDgAUpKxLtlzSVU4OTlcq7DdtAFRi1hMvBUARklmpREn8UCuh3kWy6aYIhQJHqMoHvcteTZIbIv/wEI9lXlH5M/JIfdIsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qSDAgqWvPbngkkf/MJQ6XZ95hg6Y2fFqI6XQfLCHAA=;
 b=RAwwRkllXFHW6UQlHKJnFcQagiw3xzsHlW4giuOnYYKmKF2O5ZkMZR2NBWrvh958g7Oz8QmAiFiOUw/JzmNZjRSkSAGa2xxE9kcmg7LFv/HM5JMLXR4bz84a5rcg4ijms/am+6Mo9SLpzkJ2du8iJHs+WH+w1v7BAOchmC9a9jJZzX/BbS8EMn2XLipBSF/2PV8Sbly9upzxPb+a3ChQHUxzdaceirDw+6lEFkUeWR/nHylG2Gn8wtrB9vbFDQW3a02GLDA/T9xX4dCW49FaNm4HsL4VjfwM7wTwG34ZkvSzL0yhcj9BaUSSlPxoAM0HF3djceFtc4jfwJMGvmFu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qSDAgqWvPbngkkf/MJQ6XZ95hg6Y2fFqI6XQfLCHAA=;
 b=SH9r31qcswFS4viwleMmDfVps8+UOBrt81HtKhlWo8InkMTAEpc7pCYLKt+ivHe0IvUAmACTCiDfYoC13aIQmWqD+jUcP2rQ+Cmj4Yi87K0vA0VhUSVH+13/z+LZVpw7l5tyjbMgazEHCdiylkuI+3d6RtAdakti7tA9xnbqNAU=
Received: from DM6PR07CA0055.namprd07.prod.outlook.com (2603:10b6:5:74::32) by
 SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.31; Thu, 21 Mar 2024 02:06:58 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::9) by DM6PR07CA0055.outlook.office365.com
 (2603:10b6:5:74::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Thu, 21 Mar 2024 02:06:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:06:57 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 21:06:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms: Skip amdgpu's writeback connectors on panning tests
Date: Wed, 20 Mar 2024 20:06:46 -0600
Message-ID: <20240321020646.844372-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1cafbd-c696-4f9d-048c-08dc494b96b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQoGGTSv9OK+OFnadhnbul/bj/0XWTRoXh+uPXc1Eo/bcg5XX6WpsnxJMWml8KUAO8KQux434xKLJ8Yd5GHp4Dq0BFR5scCDzCqipSaT7YKwUO2aLo2dROY+7Fss0lLM8/GKS4ThBTzyLwHN1mTnWnfugaeO5WNa4zym06o7qk9WvNkdLvNDEsK03v3/WfRaiUrFxQOGzQuUt9rbkZ+2mKrhX4jUbiz/nEPmlRuT5Ma/LF6i4kAwRiPe3c2n/B8XrT4r8fcxvUUeKA4LZ5NgtM/Nk4lqWppbNW1OALwufDw4larZP6HV37exvNLlmwnx5kkKvmOIR7RcWZaRBF4cDefC6nbW/hkUHmm/cJdgiwg5beYZ8ximYeodkmHwgoq3fp08/pQ464HDn1Hd95o5FLMTAKDGH3+/F0ekBrelE6YJLU2tsUeCP5sZQQW1z3Af8nOqXbghFUAvrXrs+hLx3217vkEHRiqgnSrIZpACZbFpugjJ8SQhtWOFrLMO5D5WGEHGfNishRBDy9odU3t21HObG8ApXvHQK+IsU6oaXOeDhh0cVGO2/FOoQd+2/XRNg+Q5r/drwXSQov+V7IPqDDXDV6lqEJ0ebEYJ3JOyBuhMToxZg9Ce1arHn8ovQJ8VfNsEG5OYbPExRbC9fuS9OkdJ9TWLflwKnTu5B9rlR/6mgp7Y9+sFRba6BClfnwoxbQdHHCtm2GAcdP6Al0xiikZAinpcKxKD3+GVJ4IiT8ShKJH1IvrBJ0vVPkIw3DEm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:06:57.8716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1cafbd-c696-4f9d-048c-08dc494b96b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089
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

With commit ff1d9a601 writeback connector will be enabled. The
AMDGPU writeback connector is to be skipped.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..d76b3a8f5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -482,6 +482,12 @@ test_plane_panning(data_t *data, enum pipe pipe)
 		drmModeModeInfo *m = &output->config.connector->modes[j__];
 		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
 
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK &&
+		   is_amdgpu_device(data->drm_fd)) {
+			igt_debug("Skipping Writeback connector\n");
+			continue;
+		}
+
 		/* test allocates 2 double-dim fbs, add one more, to be safe */
 		if (mem_size && 3 * 4 * fb_size > mem_size) {
 			igt_debug("Skipping mode %s due to low memory\n", m->name);
-- 
2.34.1

