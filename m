Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2998CC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 23:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AFF10E3AB;
	Thu,  3 Sep 2026 23:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m0pJSEKt";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE42610EC21
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 23:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dn3Qya/GHwyO3qzqMetDFvM/Ngglifh5ppJ1t1yDACZ6QJPA22//5Ogc+SK6UApFBQDesRyKKRJxxBD7DmAnHqR4AnVamVnnFnZvA4xHkvUDZ1eN6XInYZFJpj53XPgfw2UK5ZrDAu9kSmu60uxQjvYMqr/HvTcf3ayeMLer2GOUd0HVX+/ZMyRqK8J290srcmamy3kV77R3+B4dTBn05NePOPULPn3U2kONfxwjv7slbAWC59+rwQy0eTrfr7RBkJhvl1J1rZVETCsb+QUtHKjOdARjp5fEk4QaUJQgG6QBwXwtvBURcaoiI1vUKYEq6Z0rD3DCbBgpbuVbVuCeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AahbPnOvrgcI/UeMBh7jlUAOW8skRfjRW2EyxGfX5cM=;
 b=Mpma1F8e7S7VkTNkNpVSPWJ5v0dDHqzoewgb1hWGKOo5jUEc8lWpxSucBDuxKLQs6AMFRJ/B2E8coE6tt7hpYw8ydrB96fgtO/v2yQC4XrEZygyPDkLswCSKrGzxhhEIRw3vbWXqtBWQi0oNcxdu16DLNwG4XsxZg1VJZ46Ufe/61fdBDh5wS/kNh32Nmz15VWm2a7nTdudnnzb8WNhcIAfOd7NgcrwfmokmNShZpR/q1L96FSjflFaq83K0/UAHI7MV9Iu7Fif/nwF8l1UDmknOUMfeBLsZBCf7xELkHC+rdIAg7kY76IJnKND8kBlvSNVB3k7AABcLDRC8LYV6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AahbPnOvrgcI/UeMBh7jlUAOW8skRfjRW2EyxGfX5cM=;
 b=m0pJSEKtsBAES3m4NusOpIeC01ELhn/Hqfq/LGBKqAJLxbQ3FykCr1L36jfF3Y/V+adbLPeTqPsOBJZ/fTEQjt9IeW56RtDWiqFB2I/wqaxQErj6fl4T8hcqhQ7HZ/s5b3WRJyA+eQASkrUAlZtHfeY8CyxeIQIdf7CQAH+Ardk=
Received: from CY5PR20CA0001.namprd20.prod.outlook.com (2603:10b6:930:3::10)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 3 Sep 2026
 23:04:48 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:3:cafe::77) by CY5PR20CA0001.outlook.office365.com
 (2603:10b6:930:3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 23:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 23:04:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 18:04:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 18:04:47 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 3 Sep 2026 18:04:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Michael
 Strawbridge" <michael.strawbridge@amd.com>
Subject: [PATCH] lib/amdgpu: use asic_id for GFX11 platform matching
Date: Thu, 3 Sep 2026 19:04:11 -0400
Message-ID: <20260903230439.189583-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e30257d-db63-46b5-e745-08df0a0fc06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 58hbm0H4a3imO2N1cIx1wFPWaFfO3VfDK3EJJTcfFQz4tmykDFvD2NwkaWzNW9eXCfmudtw4tjvIRswJtXZoGBf3VC5y1Wg1iXvyeitMWtu82wnFtVEPX5rDxWP/5ea8wah1Ev0jNBnr0kpuOBUm39Nfabzha4fIQ5DjoUCO7xj4xzJ/ndiTuzxqz2X/E1+iM0E77L7NVgAIeHZVTg7s7ZeKsNWdrB/wvLn3b7EwFiMyTMyG++rnS28r4/5YhTMN4qeh6jKCqe4S+6S2p9ao5SVqJujwvDFpRIpErZwCuitiqSY26eAE4yW70a4jgAWpAgTubGLUzhheoC3+MMz79DSHGL/0rt7MWXZX2hhXlnnfgf9SoE9LybD3KsHrE02GTg4PDMGzxaDrtguoW/Z3TOMWPGoFtb3FkVEMIEZXz1sQoNZj27cF/Vni8MzduCfxHghW6Ywi8mmeXzafCX3Ss5mGdhAqgpShIjhC1wOP9Ppaky8a7w4y3T1EegV1BMo7zjUaYiGK7PKef4LVE/oS7uU02Zf4+Ab53TK4lhEs0xG6JmpcG9X0Ow3caEjFIA5zK4765hICBx/u/uy2V7WwAuw2buJvwcgnDR5zc4l2cwF8DYqGEUWDjHGcPFB4bt0VyEf92EUxDfUEldQXZOuMoG0UwJVtPzpCihsd9JotsfgjOMOakV19U6oKd2gDw0quoeXBtuQ+H7FmtQ2PWt2FRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(11063799006)(6133799003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yL2fwxk9Q33TzN5KzpwaXOT2fQCJAyWWZK0p9VF70cmEMUZcSg9/uJliOjrQDkmU+H6ZOX5X7XBjtQvmnavy8tOAWuqBHThdzWT1tzJAgP7DmHOoGAdf57rXZLkVd6suMnKA1nxQ4+tPpcemcrRvjb1AhZ2UWDQ5RiD7GJrwUZXR9hDm/Sn5AepmCLmJHBeFF7tsApZvZ00kyc5hegLGzfp04wkwgKySzbU5PaqYS3kfmTdKRQVB2X2bkMj38zHoFur6UbpB0481WI1nB46J3aQdVCdmjRvJqzYKjlEwYnWLbVx3WiVbz3PKQhPyTKXS7lrEGag/Cv9bDlfybyMtnovs2B7cOcrf3SSsdxSLT3xvJqhYFoYgiuzSUMpoyaiqeix2w83thh/nEUexRmCtnZI8636/0YLP9T0zmHCVA4GvpVbJ7nhyEb5xLzHapzHp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 23:04:47.8543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e30257d-db63-46b5-e745-08df0a0fc06e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The GFX11 platform filter path needs more than revision-range matching.
Several GFX11 parts share FAMILY_GFX1100, and matching only on
chip_rev/chip_external_rev can misidentify gfx1100, gfx1101, and gfx1102
platforms.

Map known GFX11 asic_id values to gfx1100/gfx1101/gfx1102 first, then
fall back to the existing range-based matching for unknown IDs. Keep the
range-based path using chip_external_rev when available, with chip_rev as
a fallback.

This preserves forward compatibility for new ASIC IDs while fixing the
current platform matching used by IGT skip and filter logic on GFX11
systems.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_platform.c | 90 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 11 deletions(-)

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
index c3461366f..ea4a37b37 100644
--- a/lib/amdgpu/amd_platform.c
+++ b/lib/amdgpu/amd_platform.c
@@ -75,9 +75,6 @@ static const struct asic_info asic_table[] = {
 	{ "gfx1102", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
 	{ "gfx1103_r1", FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
 	{ "gfx1103_r2", FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
-	{ "navi31", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
-	{ "navi32", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
-	{ "navi33", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
 
 	/* GFX10.3 */
 	{ "sienna_cichlid", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
@@ -136,20 +133,64 @@ static const struct asic_info *get_asic_info(const char *name)
 	return NULL;
 }
 
+/* Helper: choose chip id */
+static int get_chip_id(int chip_rev, int chip_external_rev)
+{
+	int chip_id = chip_external_rev > 0 ?  chip_external_rev : chip_rev;
+
+	return chip_id;
+}
+
 /* Helper: Get ASIC name by family/chip */
-static const char *get_asic_name(int family_id, int chip_rev)
+static const char *get_asic_name(int family_id, int chip_rev,
+				 int chip_external_rev)
 {
 	const struct asic_info *info;
 
+	int chip_id = get_chip_id(chip_rev, chip_external_rev);
+
 	for (info = asic_table; info->name; info++) {
 		if (info->family_id == family_id &&
-		    chip_rev >= info->chip_id_min &&
-		    chip_rev < info->chip_id_max)
+		    chip_id >= info->chip_id_min &&
+				chip_id < info->chip_id_max)
 			return info->name;
 	}
 	return "unknown";
 }
 
+static const char *map_device_id_to_gfx11_name(int asic_id)
+{
+	switch (asic_id) {
+	case 0x744c:
+	case 0x7450:
+	case 0x745e:
+		return "gfx1100";
+	case 0x7470:
+	case 0x7471:
+	case 0x7472:
+	case 0x7473:
+	case 0x747e:
+		return "gfx1101";
+	case 0x7480:
+	case 0x7481:
+	case 0x7483:
+	case 0x7485:
+	case 0x7487:
+	case 0x7488:
+	case 0x7489:
+	case 0x748a:
+	case 0x748b:
+	case 0x748c:
+	case 0x748d:
+	case 0x748e:
+	case 0x748f:
+	case 0x7490:
+		return "gfx1102";
+	default:
+		return NULL;
+	}
+}
+
 /* ================================================================
  * AMD PLATFORM FILTER OPS IMPLEMENTATION
  * ================================================================
@@ -162,14 +203,18 @@ static const char *amd_get_platform_name(const void *platform_info)
 	if (!gpu_info)
 		return "unknown";
 
-	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev);
+	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev,
+			gpu_info->chip_external_rev);
 }
 
 static bool amd_match_platform(const void *platform_info, const void *platform_data)
 {
 	const struct amdgpu_gpu_info *gpu_info = platform_info;
 	const struct amd_platform_data *amd_data = platform_data;
-	int i;
+
+	int i, chip_rev;
+	const char *gfx11_name;
+	const struct asic_info *navi_info;
 
 	if (!gpu_info || !amd_data)
 		return false;
@@ -181,7 +226,30 @@ static bool amd_match_platform(const void *platform_info, const void *platform_d
 	/* Check if GPU matches any of the ASIC ranges */
 	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
 		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
-			int chip_rev = gpu_info->chip_rev;
+			/*
+			 * w/a for FAMILY_GFX1100
+			 */
+			if (gpu_info->family_id == FAMILY_GFX1100) {
+				gfx11_name = map_device_id_to_gfx11_name(gpu_info->asic_id);
+				if (gfx11_name) {
+					for (navi_info = asic_table; navi_info->name; navi_info++) {
+						if (!strcmp(navi_info->name, gfx11_name) &&
+						    amd_data->ranges[i].chip_id_min ==
+						    navi_info->chip_id_min &&
+						    amd_data->ranges[i].chip_id_max ==
+						    navi_info->chip_id_max)
+							return true;
+					}
+					continue;
+				}
+			}
+
+			/*
+			 * Use external revision for ASIC-range matching when available.
+			 * Fallback to chip_rev for older kernels/devices.
+			 */
+			 chip_rev = get_chip_id(gpu_info->chip_rev,
+						gpu_info->chip_external_rev);
 
 			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
 			    chip_rev < amd_data->ranges[i].chip_id_max) {
@@ -231,8 +299,8 @@ static void amd_dump_platform_data(const void *platform_data)
 	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
 		if (i > 0)
 			printf(", ");
-		printf("{0x%02X, 0x%02X-0x%02X}",
-		       amd_data->ranges[i].family_id,
+		igt_info("{0x%02X, 0x%02X-0x%02X}",
+			 amd_data->ranges[i].family_id,
 		       amd_data->ranges[i].chip_id_min,
 		       amd_data->ranges[i].chip_id_max);
 	}
-- 
2.54.0

