Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF08C2BBCA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 02:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF3910E913;
	Fri, 21 Jun 2024 02:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="THO8flOI";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8410E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 02:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMgmfiggIZ7+JwUQVeukQSAaDw2yRCRW5VSPCPtn9Bcs3HoaDtw5oB4zu4eX1nzHlys/ZlODA6t0cWElXAU+GzN+gltAYRrta5z2UMkg0c+ka6cdvd5op0XKVVd8ROUULXzSqzAym91HoPCsPRzHBOayrRm5TfiImVSA7UmqOZEI2tQ7ORDYM80Nj+b+IJBNn7aEMwnnqH3jrXF8RjTPNRvNqKtAGq/msFG/H8ya3umJLBLpqwpKJZcV67dbfoBCgWz2VN2Zt20BsrL/QVBwdW0Fgd3In4FIOxpg6uelsvSy+AndQruUxPpXwJqC0/0zyWWWgI+MRygYIhLIGDsVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHaF38A4FuC6rSDgRQdLALaRFcdNvoJiUEdiYYITjWE=;
 b=eYJR3bPC40+j1qrwlsoyfRT7uMGW++gZIPX9LpPWEpN+MwITZB+ra2wERQJm/6kEg9MxfhQqQBVGJr00Mk9FuhnNbaQ+RvIbKC6+VcuBfMe0CcQ1SinkGex1mw9GmDWyAyd6RBjzBdyCoT4Sfp56SnfbNcLucLZSnB6mpg8rnf83tUBh85T/klRtQZ0XU5Yxi53p8aVFL/DrwroxwRpKO3Z+iWVBwwVKLGuRz16XrQwKBJdIgDZ4kub25d4oYAuJR93ePkJAG4Ru3XsZazXT3jPmRzCrHfM/BdFks2jYetEmvxt5WjGd8Lbn1ams4sBsiZmDprcQ293EQ/ddbF2n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHaF38A4FuC6rSDgRQdLALaRFcdNvoJiUEdiYYITjWE=;
 b=THO8flOISqUGldftb9d+qsPTbRMtopXA37wEoL9G+EPf1bmVhPeQs19nIwz4gRBCtKvtUZ3olqx7aCxMDAWf1O6ApaWxvlNo+/Gp1KwbDL1HBQdh+diHvxspuxM7y9RnEIPTpP67V/Wn29ahcHg0wPzKLAsIFwvrGKt9EwC65qI=
Received: from CH5P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::14)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 21 Jun
 2024 02:50:30 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::f0) by CH5P222CA0013.outlook.office365.com
 (2603:10b6:610:1ee::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Fri, 21 Jun 2024 02:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 02:50:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:28 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 21:50:21 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/3] lib/amdgpu: add gfx12 to amd_dispatch test
Date: Fri, 21 Jun 2024 10:50:21 +0800
Message-ID: <20240621025021.2294000-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: d95c8286-e4b9-45bc-76dc-08dc919ce999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|82310400023|36860700010|376011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MoctRrDUz1EIwi4pGs8eNs1Ld+cNHkko/5lpV/PqDGGUFX61idS9Hkfkz3Z8?=
 =?us-ascii?Q?dqREH9xpQkXq39B35pCf6Gtnoj2v2bun1mTYOc8tQJwrcSZ57qXkwZ7PnTl2?=
 =?us-ascii?Q?3gziqL5/sq2GBUzcn3noUVZFb4Ilz4yhPvlulDFBSlbTZJqharF+1s8iS9eM?=
 =?us-ascii?Q?2y3Z94QGuH0FHaUB4/IBlbaeJ1hx7dJzO05AVo4nxztmAmmF2419rXvTjjbt?=
 =?us-ascii?Q?dMjg6zSbnRvWLhR6o9NNTYNf9ejI2Tx+2vAHLuhlKY4kavLkEJk4cpYTOdlC?=
 =?us-ascii?Q?CVEVflBE7EYFXQuCp5IjKR/Hbm+nLpf+/6ZWqmErCZmRm4z02FXlHyspgAJ+?=
 =?us-ascii?Q?7yvxyWYohcNu3YUXk6787ayFNAiMsAhR3pYBIs0VLKuan2zEx460xsjvLkbT?=
 =?us-ascii?Q?sKahWjarnXFgg8d6gTRPVDkuf9ucT+TaJhP4LVjDPF2m4H3oUkadt8bNHvhi?=
 =?us-ascii?Q?kGds8Ce+dV0QDD2eFNdvn8jTr47/n1fkcx+6Z7o5bm/tJQUy3x9l/L0vX7kP?=
 =?us-ascii?Q?HzhygO7whZNRJpjRDw4B/wrxcuutsU0kbSQO16/Joa3w6hHVLa/VjxRlLiSf?=
 =?us-ascii?Q?qr2SvzD9QPqgM+SGjCu2s3ZdbmOh8Ln5xbYEBSZ3fbZ+1ZlSOk6D7vHUjNqv?=
 =?us-ascii?Q?3CeBjS8rin2uUe76IgtDbQVUkkIRlvrmj+43mPcFxQywaw7hA2EOW++1MaFx?=
 =?us-ascii?Q?JXGhB7YD0IwS/LFrb3+RLt+B4YBRHiWDb/MKYbeIeq4jIeIxkKpTGS6ajmot?=
 =?us-ascii?Q?sgU1SM6CirgLDsPcru1herUBBCZKWxl6xiZBorUxVU9f3wHxzQdyQ7LeU4y2?=
 =?us-ascii?Q?3+hsLLvFof4N1Odt4B81Qzap/PdRCIrzNn3FcvNPyL1c8e1Md4XD/oHlEIVX?=
 =?us-ascii?Q?t9ihjtlXb2tAMv+Y2ba8Ug6winuLG1CDqrHVpeZ7ibIQbZHuEXCg6n3Ws31h?=
 =?us-ascii?Q?L5tvMCrT0DUDCHCG1Onh+GsPeyX6rh3LTxmATnUXq8FkDKjkZ9GR8IupJCBE?=
 =?us-ascii?Q?eKJGsyhdwnAqlQO4eZLCyprt3qpYsNoo4nAyc3cWYsMKJlZMJ1KHc8F7S5aJ?=
 =?us-ascii?Q?PbomU2NP5zlNinUKzPPiVm8cm9XWk1NoPnGRZdC5bJSqe68uWioXhPXDju6j?=
 =?us-ascii?Q?/zqp821B/JS0QgOVVfgMtfxXyQycpkqevqcnfb5ESkdOgHVNlQYafb4rP/WF?=
 =?us-ascii?Q?W15/KNV9wBsxD3bECqq3E+gQNRU/hhG2W1He2XzA4518YuXyTs6LfyETc5wL?=
 =?us-ascii?Q?zUjTJ/PhMQn1m88aJRVYWqF9za1yhGQM834TrWvBuByL4xCNaIhmzw26v9RQ?=
 =?us-ascii?Q?noWav306gbctu5QU387Bgb/OD30k9qTzx+0GTKZgNo2GYlvG3qa343LRINOP?=
 =?us-ascii?Q?00Z5EOumG8x6MKd5qgrbXMHvHbrPzrOVdLdOwXt+Fmta2ERw6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:50:29.8904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d95c8286-e4b9-45bc-76dc-08dc919ce999
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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

Enable gfx12 amd_dispatch test

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c         | 16 ++++++++--
 lib/amdgpu/amd_dispatch_helpers.c |  2 +-
 lib/amdgpu/amd_shaders.c          | 52 +++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 040381a11..b739ce64d 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -87,6 +87,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* Sets a range of pixel shader constants */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -239,6 +241,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -252,6 +256,8 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 	/* clear mmCOMPUTE_RESOURCE_LIMITS */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
@@ -410,6 +416,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
 		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 
 	/* Writes the UAV constant data to the SGPRs. */
@@ -422,6 +430,10 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd, 0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd, 0x1003dfac);
+	else if (version == 12)
+		base_cmd->emit(base_cmd, 0x1203dfac);
 
 
 	/* clear mmCOMPUTE_RESOURCE_LIMITS */
@@ -509,7 +521,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10 && version != 11) {
+	if (version != 9 && version != 10 && version != 11 && version != 12) {
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
@@ -536,7 +548,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		igt_info("SKIP ... as there's no graphics ring\n");
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10 && version != 11) {
+	if (version != 9 && version != 10 && version != 11 && version != 12) {
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 11ce8284a..1c7413922 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -138,7 +138,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 	base->emit(base, shader_addr >> 8);
 	base->emit(base, shader_addr >> 40);
 	/* write sh regs */
-	if (version == 11) {
+	if ((version == 11) || (version == 12)) {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 			/* - Gfx11ShRegBase */
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index cbea12827..fad6dbced 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -314,6 +314,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 		0xBF9F0000, 0xBF9F0000, 0xBF9F0000
 	};
 
+	static const uint32_t bufferclear_cs_shader_gfx12[] =
+	{
+		0xB0802009, 0xBF930006, 0x360000FF, 0x000003FF,
+		0x7E020205, 0x7E040206, 0x7E060207, 0xBF870004,
+		0xD6460004, 0x04010C75, 0x7E000204, 0xC401C07C,
+		0x80000000, 0x00000004, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
 	/**
 	 * shader main
 	 * asic(GFX11)
@@ -352,6 +375,29 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
 		0xBF9F0000, 0xBF9F0000
 	};
+	static const uint32_t buffercopy_cs_shader_gfx12[] =
+	{
+		0xB0802009, 0xBF930011, 0x360000FF, 0x000003FF,
+		0xBF870001, 0xD6460002, 0x04010C75, 0xC400C07C,
+		0x80000003, 0x00000002, 0xBFC00000, 0xC401C07C,
+		0x80000803, 0x00000002, 0xBFB60003, 0xBFB00000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000,
+		0xBF9F0000, 0xBF9F0000, 0xBF9F0000, 0xBF9F0000
+	};
 
 	uint32_t shader_size;
 	const uint32_t *shader;
@@ -367,6 +413,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 11) {
 				shader = bufferclear_cs_shader_gfx11;
 				shader_size = sizeof(bufferclear_cs_shader_gfx11);
+			} else if (version == 12) {
+				shader = bufferclear_cs_shader_gfx12;
+				shader_size = sizeof(bufferclear_cs_shader_gfx12);
 			}
 			break;
 		case CS_BUFFERCOPY:
@@ -379,6 +428,9 @@ int  amdgpu_dispatch_load_cs_shader(uint8_t *ptr, int cs_type, uint32_t version)
 			} else if (version == 11) {
 				shader = buffercopy_cs_shader_gfx11;
 				shader_size = sizeof(buffercopy_cs_shader_gfx11);
+			} else if (version == 12) {
+				shader = buffercopy_cs_shader_gfx12;
+				shader_size = sizeof(buffercopy_cs_shader_gfx12);
 			}
 			break;
 		case CS_HANG:
-- 
2.25.1

