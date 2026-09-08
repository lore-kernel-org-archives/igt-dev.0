Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA160C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 01:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6610E072;
	Tue,  8 Sep 2026 01:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xk2ieoV5";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013018.outbound.protection.outlook.com
 [40.107.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F2210E072
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 01:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3pCHMmM8kRx5g2lSueL1H/snpbCQwSf1fM1B7bxPMYL8ppMaPPabZgyYkOMJelvq35yuQHCWbdWC2i9e3OiqnaSUsXvun+fRhPcMpPq6n0f3mZYBa53TpgBgniJ8F+RvWQfdDHZZfeRfLqQowAKR2DnvbftknJ9gl12yb+YSFZI6wgRjercvhB/9oW0VqD0UQcEuxaV4fE/6TfDvlJxKY1+5/94O3Gboxy3pLUvv4z8LwN8bOCXvugMEDdHkninGsZEZ5vvWlFTVz951W6y6ZsG102LFlAxlDCpvUA/9krSKT3rj3dRDsvPJfp7QiKYyBKBCcT/9FlMxcJXDRu0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r9CpGJI+wy1sVAebgKgjzRBforvpDexyJ964XM3a+8=;
 b=Is7+d77GAQQ1eFpfaFPae6KFiHolU9ej8vpnZ9x7GbqwULK56iC5TtZajM2aOwk57xkEVw+d/KJsHZTTFoJxHUoST7eVClvmFUSXDGvbYGhauT2Gcz/TsrWDdDW0lbtgWZ9rfUIir12L2+2pT40Gzt4/OGxiPpIFbYL+N0Efq2cC50wZLAK+tNo41QfX+3kKmKK2ev8tho0vtXq0zAGqVvDoksZbCO1MnIqRhzZANEHXWi5bQz/FDzJKHUaqdiCX1QJ5Yu2mfshp1pMPCtuxLkdE2GQcebMGjtMfkFc7Zya5wnVDMoyiLJjNiFhf8jbSNUe5yfKEdiVzhDG+el1F8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r9CpGJI+wy1sVAebgKgjzRBforvpDexyJ964XM3a+8=;
 b=xk2ieoV5o1JWH3auv9UdUIiDn4j09VkAx4BjhiZao8f412H4nL3LNnxjf2HGxQtYyk1Sg1VPE+uzOONLm7CM6alRHLzhYUIdceMkJzWxyMiXegxF2cAL+R6glG7P+cSeKSNepJP1n48CdDi92AaGDCLKGNfxwF1CsDeG5AIBUC8=
Received: from DS1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:8:44f::9) by
 CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Tue, 8 Sep 2026 01:36:25 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:8:44f:cafe::94) by DS1PR04CA0005.outlook.office365.com
 (2603:10b6:8:44f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 01:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 01:36:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 20:36:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 7 Sep
 2026 20:36:23 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 7 Sep 2026 20:36:22 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: sync uq fw-area info type with libdrm
 metadata API
Date: Tue, 8 Sep 2026 09:36:14 +0800
Message-ID: <20260908013616.2933758-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cce05ff-9a14-4e25-b1a0-08df0d499836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MkxekHeYCLZemisHm6e9Mwr00UHxJqX/xYnSCIjiEOxq8tMIGo6FMziq9N45ZvUjjShX7Mn/FhKB0RFs+X524jBXHw/rnKAxwZ4FCIPw7xhUGsONlyXM3KDOQRWqQkLpQNSnlaQ2CYS3y6LG4cUmdk8pgS7LnaZezRfzRKC2CxzW5dEICynpM3xrg2BFROGUCHcyP8Iz/Lu6xH7iFowW6q1w2G+AMO8WbZK2EPtJueUM/oo7XfWUCYtRgwaeOIuKj5Arpvygw22MfXDsNtdGNZR7W7Dq6S3ZslqZMmWHShNCR5FUw5/zwp1dhrXghPiSwY0/jF5QnCzk6a1n32T5lPXYETGNICmLzVInbUJeVQ8/eBPF8IntziTL7WoTlhlxcvKB1u3hw9S0vKK100CfZ/630PKemmQ0t1Zm8wDDkum47VexsOMLHGzBRSQp5pRj7butIqlUXSTaUW9lvqGonPoZsZNKLW61x3lbJVGhFrrWZeMHbiJEgdQ8F+7hh1xQe5qNnBqgx1R4UmuIEWK8/wu6s9katEuB3jUe9JU3QE26D7sampO3iXnjv0Y94UFqLYPmOS4LOyZ4c4XqkjshpdAUj5JU1ZoiiiJBD7F1jbmv7mtDyuL+eTZS2W25RgCYFRMt6sxOXKL5zLq4D9EmhPbAUbaaeX4S8ec+jxzPJQywgw8DCpZh1VGCrfpsNbk7XfOZXZhE3Czd+XksqZNKow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dFByBfmKM5E2SMAHM7rdSLH+xf07tE96Qv4ufntRRpiiTD9luvaS+KTRIt/Irsqlf0jMYBtwljzhUxxYcSDAGXbItr1O8ZP/T5UFF4Q0Q6oyeToEg9mpPSTAPgMzYzldT4xPY50HCTzYMV0pmiTCQQPXyR3NhOGHMPC8xpyDCAtxq4SPBjzidbQzu4NO8h2k9JYyezzQ68m53MDicmllr00LtWcwaPbuLWSTPgeDQKSBSZu+Om4PehO+kM1I7KaL+Y0PBtYHKCvK3/cronsB3r8MEwB+HbNwbbvZ5a7chfxwbWR+cn73uOaGm4N1YWriW0Zx/+Aj89b8/PUvzl/RvO5my3TLXzLlxVC9oQ9nOuIsMwAPenjWl3HcrVtuB0o0B21TUg8KJOf5bKdqcwvWYCtK58qLh4hySa8pL2gdhKE9RwQkGI+jGXl0OAG27eqi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 01:36:24.6620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cce05ff-9a14-4e25-b1a0-08df0d499836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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

libdrm renamed the amdgpu_query_uq_fw_area_info() parameter type from
struct drm_amdgpu_info_uq_fw_areas to struct drm_amdgpu_info_uq_metadata
(the metadata union carries the same fw_areas_gfx member). Match it in
amdgpu_ring_context::info so the call type-checks. Older toolchains only
warned on the mismatch; gcc-14 (Ubuntu 26.04) treats
-Wincompatible-pointer-types as an error and fails the build.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 40a9735be..c4050137b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -346,7 +346,7 @@ struct amdgpu_ring_context {
 	uint32_t max_num_fences_fwm;
 	struct amdgpu_userq_params *userq_params;
 
-	struct drm_amdgpu_info_uq_fw_areas info;
+	struct drm_amdgpu_info_uq_metadata info;
 };
 
 struct amdgpu_cmd_base;
-- 
2.49.0

