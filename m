Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CEC7EE31
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 06:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623010E1F8;
	Tue, 24 Jun 2025 06:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RwT86Fet";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A16810E1F8
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 06:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU7VXIHeBYQ6GGJly0M2Z/NZ5CTBdCZL/vpB3RuqaijMbzFk55Ca4JBS73k9bqAaYgIf4Iggk6gc+9ze4HwzjF4l/vc+W8nDvA5IuOfEx2qeBExelBDYuqtK/rOtSWrMjynSzsXFBY/WRLfGYpA3PnKcKPRX7pCTGlC8+i+3+cppqVEbr5vAYSZ9lo+oiCth5WWnYHT7VoHoQUzbELBlzir5Ej0YIcDV39xKlzezb/b9lk99Uq1M9WVemxd8tOJP09VB6Djz/Rh7SPmnRVipXdz3mGwUQOrf0QgnOAGMGTvbHm7g46in2aaOxT5KzM2mWyIuZXRqCF/uuPISsUTKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vIjBr33Nj3KhKxP2XGhQmo+n7LMgSM7g7NHOJdFsXU=;
 b=DrtXgCPcOFIu+PGLNJVFD6/DLmM44BwcnbLlh3cktysoMc3XV2n6o5bv3ZuV3Mwcu8q9knO+w0FELWa1ciGq07/5covEX1l0Xyvp+/Elzxki/txcFCXzZdCZmsFSnbY/d+0ypl2Xt4bLcg+KKh2+UI7BTwDH+YaFmfP7A6GtMXiYk8eM1UTkR6aOHDZmA6MOmow0nOa+1Jd5S5Y6WNr/skOiLTqqTbDSRqs1SY0hD0oRYNl+ftV8EID5dW/e8n4nqEZiVA7tcv+nVeaQK3tmrc8D6G1cju6UfvAvwH8tA9E0dtGQq18vPIg1kar0+vXmAejS3dv5UjURTcf1bcANIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vIjBr33Nj3KhKxP2XGhQmo+n7LMgSM7g7NHOJdFsXU=;
 b=RwT86FetrxmNNk2VVA7tKaKnu03j56hU2/jpTYNQCdJ7bR7UUStDZgaT8crLRQ8TYOsoxd6V1J1Wv/211ENVBUvI7Y1aOf4KD2cUcNSGWJpWqd8XI6BKWu7FBouZD8S3jnoulGRHyhDsXulFD2JL7HfkgZQCVPOCFlt1rEi3mFM=
Received: from BYAPR07CA0027.namprd07.prod.outlook.com (2603:10b6:a02:bc::40)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 24 Jun
 2025 06:34:22 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a02:bc:cafe::d4) by BYAPR07CA0027.outlook.office365.com
 (2603:10b6:a02:bc::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 06:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 06:34:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 01:34:21 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 24 Jun 2025 01:34:19 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Add SDMA with UMQ test case to amd_basic
Date: Tue, 24 Jun 2025 14:33:29 +0800
Message-ID: <20250624063418.3544357-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: afec5568-1e08-452a-0a15-08ddb2e9280d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ioWawW2Zs82aXdR49ly2mroBQ3TEIJYdO766Sjuf4dViPJfH0lEnUdggmAlE?=
 =?us-ascii?Q?mY6ZE5XNBcGvfQWefE2S8QzIz3Yo1U2fbERW9I4D6Xn32ZFWdBbwOpGZWil/?=
 =?us-ascii?Q?p3ZZ6nuxEbby5DQ1onLKkCYcbfIRLU9y8ISOAogSEBctlhPv4znpRlUKRQjH?=
 =?us-ascii?Q?uyNAMdcyLN56XEQvYRhjkUMHbFGHefifpheduAp1gjoHRGjAlu751YHF3xY3?=
 =?us-ascii?Q?oIvKrVT+60r069PzTO/n3KmxnWXH24m77jBpuxb+FRQo5iyCVEpLVaEzpGpt?=
 =?us-ascii?Q?die/ZAd5D87vpSQQRy66I24doscSA9QsBkOyTrlkvxUslHHBAlouoezvjnZU?=
 =?us-ascii?Q?Dx3kDEVvTWUUI+xY3247/iE8jNi2fDaUBxHeJteWmrumnBhWpviDMuydzo7g?=
 =?us-ascii?Q?Ayzw+1Z3m5xP6s/emoNocMdCdT+dgsXJtrLtthz9E79+82OnuNHJC8QTMmZ1?=
 =?us-ascii?Q?kNzNp0VBQZxZptN3+39dJNhzTivfzLRZcLnCJ6bVoAm51QKFV7dkjC6pZ2Cy?=
 =?us-ascii?Q?uOepUTUDPulE0iHXC4XP3QRp+1a5lWY28LZ54rer2NP8e6oVnK7DPW5Vp2ze?=
 =?us-ascii?Q?0bFNziOAHty7E2+5m6GgjBdqukb4CHSFAHYwnqm17aw6Rky2Yquf5G74IEIb?=
 =?us-ascii?Q?yeYksAAHENN1s6ih9rHeSwjdxixzmNA8In1041o9Twj4j2yyJaxjjtYG4i7D?=
 =?us-ascii?Q?84rsSxB1qS6nAIEFzYGiK++sy9JVxF8huAsFu3rBuaD0Yz63NRuf/IFXfbas?=
 =?us-ascii?Q?TfDRQOJz4T3mNtIle/BHTaySBXB2LUYE7dRlGj30T5Unw6opR0vVwLY0/qAG?=
 =?us-ascii?Q?gGWwOaOXZPAckojPIvAsrNdJ8AxiCG96O+tXhgyZfdNaqdOxfOorLMC7ZJoB?=
 =?us-ascii?Q?/5JB01LkD9g38NAf84U0HjYay2ebumfNDa3sCT81RYYVfIh978wBN4aGpu2F?=
 =?us-ascii?Q?iLJWn2i5Bg82AfDwPIP1yRawmA4IgTBvBBInk68DASolv3rSoDCf24M4vyG/?=
 =?us-ascii?Q?iWUcuKJf+8ovMASyFEOiwkdXMHCO6C9a6zr+mkV+iLr99H7Spp5VlrT9/JgQ?=
 =?us-ascii?Q?ALjP3A0f8m6IcoQNuIHVzaKk0qsuwa32CBSumCqPSrTc/oh6RZnCfBAzsnhR?=
 =?us-ascii?Q?pwP37CtPIsUpQK0R7Jx8pd1lN4i84rTNzl6OeHyW3VNDE+Kj8mJqg4VVGcjm?=
 =?us-ascii?Q?JH+xe6YZtRDqPePzbZBSrcCqGyAs6DuyNGqA11dZ/z8QCVVb5XqZjTwRZf6w?=
 =?us-ascii?Q?uqIkUQ7sy6BiPEj3hjF4p4RcDT6reCOYm9eDx1Q37g1SwpO/6XOTYZ1YlCoH?=
 =?us-ascii?Q?S2pia5BuNdowKl09uT0payqZZp+gMb8spkDy1T4FlpiWO0f9RwgEBs6/TPsr?=
 =?us-ascii?Q?Ia4/9ueZdZQwYdoy1uNj1tx9Pfc7uddeqQqcHLzqZy+49oyoN48vgN3/wNEx?=
 =?us-ascii?Q?IuJHFFhr5zDWcxuY7bqbnP4LEYKSQcVTzXsEjP5+dlwkVtXcHaM/1f2Cza/q?=
 =?us-ascii?Q?JTWKtnAsn2yt2sORajL3BD0m8gHQ7FYAiGjk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:34:22.4247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afec5568-1e08-452a-0a15-08ddb2e9280d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
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

Add a new subtest "cs-sdma-with-IP-DMA-UMQ" to verify DMA command
submission works correctly with UMQ (User Mode Queue) for write,
constant fill, and copy operations.

The test checks SDMA functionality when using UMQ by calling
amdgpu_command_submission_sdma() with the UMQ flag set to true.
The test will only run if the user queue capability is available
for the DMA IP block.

Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 97a08a9a3..f1ffb4183 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -815,6 +815,14 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
+
+	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
+	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
+		if (userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("cs-sdma-with-umq")
+			amdgpu_command_submission_sdma(device, true);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.49.0

