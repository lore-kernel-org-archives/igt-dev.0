Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AACFC2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 08:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5B10E4AF;
	Tue,  9 Jul 2024 08:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I41Xm4ZX";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B76C10E4AF
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 08:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agIRpFzuGTwHevu+IVMOk1eFzK/Oms4etfUl3Z1uSVDT2BgrjmhaiQ7WFEqO6tGGj0cn51u9hO9fEZWhzZXjhm1JLz5XjsaeB5b7+TvtxPWXE+6K82WDaPyoLjrz4IuHbkTWeEYrtTWK5REh6CX7HpJ3Q89U/T6PR6jbgKzgJl0ogzBW7CaQXdrzpwWuikYd5oDFawtdfzAWJChb1tIaDjVfUiUJO7F4LBwlybaklcfIlxvklvg5dkXzb3ShJ53+AcY5oIRi/6sx6aIGHJwk3vxUCkDjeDRmD3NONbVnoVO9FVNkGianJpSffx8iNQGEGr/j756U3WIpghmwUVqcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JuAmAIjHBJYAyCN5p0jEmH++iTKQCjl2gTOvbh/keM=;
 b=nmbA8+UG8+tnRGIk9PJa8+wFo2y5qPClgQlmjgyEZt7v2v50bdUjEKkGYoHrRgWKfxOXCMj+GHsUH+scNtHxzIZjHkcFSGO+YWVAwAnWb/N0yU8huAkK1Kvhom98zxnLjAoT+f2G2BrfCgMBoaFM6FP2YxcU8oN8Ip9PrmU76B3QMuVthbvhPoXP+Om34ULKhl+9I2NMPskPJMTSV9mqQgP1WdXqWggUaKNC1WQyBDlHY3ZWjWvgTPBzCDXy3nBGQYpSqJ9sboh/0iQaRqneaOkN4FIJDJfs/+olozWElHl6QX3NzRDSvN3OVHdn0kpF4gqVNA1dtzrTHbsGk9hhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JuAmAIjHBJYAyCN5p0jEmH++iTKQCjl2gTOvbh/keM=;
 b=I41Xm4ZXKH0llBnx2Favf6o5hRcTam8EEa5fzjUKuSzDPBB6FBZOMR14nd++9cF7fh4ggSdGpqNyDqQgd2Ph3T3s9uA99zY/7NgRLliyb5BbXp8FaCgx0q/KVkxjskQLcxXNM02B58Nno2sIIa2Uflzp1Vti36sCluMHV32Oilo=
Received: from MN2PR22CA0021.namprd22.prod.outlook.com (2603:10b6:208:238::26)
 by DS7PR12MB6141.namprd12.prod.outlook.com (2603:10b6:8:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 08:23:31 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::f4) by MN2PR22CA0021.outlook.office365.com
 (2603:10b6:208:238::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Tue, 9 Jul 2024 08:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 08:23:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 03:23:29 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 9 Jul 2024 03:23:22 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: fix amd dispatch  issue
Date: Tue, 9 Jul 2024 16:23:22 +0800
Message-ID: <20240709082322.1873739-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|DS7PR12MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: df3e79f7-6251-4f20-1734-08dc9ff06a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cdlvFdsNhlKQWsu42hpuIBrinesOVX9FXG1mvNCrV1bOB94YciwZqI1XLvMl?=
 =?us-ascii?Q?MAH7OyvcLBcXKnk7o6jwOnSqEh7CF7KcydUkogmwWojZD3TwwWMf1PoVY23p?=
 =?us-ascii?Q?lSYptrohg9+VorN2kzkXXFlmSWbGQXCm8XWK6eWZraJjI4cbHeN3J9bHn0Vw?=
 =?us-ascii?Q?F107D5AirAJs+t4IEldZfL6xv1AmY9IDFDGBIE4QKnCcT6MXHf9kr0qxARb2?=
 =?us-ascii?Q?xDOAoM/P2wx7C3bnCmlUft7ZxmRjQJ5liX5eeNgoA3cSoN8qKNJvIFCNg9R/?=
 =?us-ascii?Q?DBGyz2V12BK3qykgfCUsBzhRm3qygR0gcc7GXyqUSAqLugOvqbYafNeOGTLc?=
 =?us-ascii?Q?ZOwTa4jUZh5HTxWQBu9TvHvJfY7RlmRKrxfxdHlVQaQG+q0idQOOU/HvEJg4?=
 =?us-ascii?Q?vKMXnzCV2Y40g4oz4fpk0B88px5ZfI58OSAXgoAQUhP5Xcg6EJ2DJXZkLhZz?=
 =?us-ascii?Q?jKB0O0PNR2WQIyap6Hu7PrygsW8kMmOqhOUDh0J2d9f2/CJDRGjNWkZ6QWLI?=
 =?us-ascii?Q?+NRhLxz6qhc8/QsGdsw3xssl06hQBCUHnXtNwPXWzN4q4ZxqvyXwI7wU52uh?=
 =?us-ascii?Q?D0Jd4I44t4sTUNnY3mN1MRvCJMGcWtud3WOT2m6OFSgb+yaLOhmPsWMPwMIS?=
 =?us-ascii?Q?xvzD+UwhL4Xoc1NZSiDVu80kFzgcepGEN47R4uyWiOmSuQHMU9ZW3xjMp6yw?=
 =?us-ascii?Q?lXCNzz3C9jfYNTJg4xJbfU3SX7mvDjLwmh4gAvQRO6McFNNDlDQQZ+9znHse?=
 =?us-ascii?Q?ynQ+4CSKsLePsDQc+igOe5PhaGwVkodxJuly1ZraeKoGCsc8ZeIYoAa31UJ8?=
 =?us-ascii?Q?xrsyPvL9BBzX8QrW0TvzSXtf2Tp+EwD+jo7aGTtsw9TwzAZ/FK1Cy+eQ9UjT?=
 =?us-ascii?Q?5933x/yJlUjDHm38YxV6thdrsLmMvIaPwgdvC9yXLWn9ivWCJTtGdD50GiAm?=
 =?us-ascii?Q?g0zpY11+ATRrAmXjPsUkyaczRxUhDnCBdyndA9OCd75yMtjmBfIS5S2cKdue?=
 =?us-ascii?Q?WJXAFxMiKWCUgc8dzLBjUEOGb7iazzvGA9/hNEJR3U42opF8a1lIxYRqkeT+?=
 =?us-ascii?Q?pCB8fPEx+ZLv8wIQ2GP3z7NKejxLvcZdPFIx8wS4vEUGQWDy9grgK5umErcu?=
 =?us-ascii?Q?Rna7+Mvmv1AKz7Anv0ep1upUcaabQDcCdZqLo1efuJbvf4zCEAMQrCtrsR5H?=
 =?us-ascii?Q?UD98OVIX9P5vmg4U9W1+scxHsOE1ev2eEZwif0muztS6WduhfV5ldaxmOEoz?=
 =?us-ascii?Q?3kal0DPxaDVbX4N8sqQb7BwpBQ6ehtCDFDiqDwKZbMs0YR0RvQ7DSLqoWTBP?=
 =?us-ascii?Q?iMJHMEMZhK7pJ+FosBrpK5MF1MYUs+SrmqH9jiK4MR4d/nwGJUJzaSEnbxKb?=
 =?us-ascii?Q?sizl8JqRBQvs4GjJuWjXdfRzwzUPArxbSWeVDDuIp3GaiFe/w6zE/aBVs+x/?=
 =?us-ascii?Q?MaYT/T7YDXv13o6KT2+wZ27P26NPa/GT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:23:30.6416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3e79f7-6251-4f20-1734-08dc9ff06a93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6141
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

1. Fixed failure of querying ip info on gfx
   when only compute ring is enabled
2. Set different invalid addresses for multiple rings

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 12ef7874c..8b97ca269 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -233,7 +233,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x240);
 	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
-		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, mc_address_src + ring * 0x1000);
 		base_cmd->emit(base_cmd, 0);
 	} else {
 		base_cmd->emit(base_cmd, mc_address_src);
@@ -254,11 +254,11 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x244);
 	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
-		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, mc_address_dst + ring * 0x1000);
 		base_cmd->emit(base_cmd, 0);
 	} else {
-		base_cmd->emit(base_cmd, mc_address_src);
-		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+		base_cmd->emit(base_cmd, mc_address_dst);
+		base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
 	}
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
@@ -553,7 +553,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id, version;
 
-	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no graphics ring\n");
-- 
2.25.1

