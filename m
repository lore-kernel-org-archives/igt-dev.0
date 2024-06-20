Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF653C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 06:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DAD10E2D7;
	Thu, 20 Jun 2024 06:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EvgHq9Sz";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9C210E2D7
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 06:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ42LqpGuhdXjOKagpDFhf2AghucIV6tPLXRkQfuKMNFjL22ACKV8KlaRlZNG4fYSi5i3ZqugdKId19EqKCmuAX8Ajog0Odtd1e5zLzeSqZ1labfaCkkhqygT9FJhp2zLajf9P8yiWWS3bvSO36nwfUc1gD+42BIY08XPpaibHj9qUFvojdCLCd/AhAuasppp5oZdLWzxjQ4crONIyBCPaG1PxXStWMjghwEL4/90xj1prcOTzOlD4A8HjCKBl0LXGLoCr+zqs+SHo4EYVLq+gEIiss1Bvr/k6/5iPLMk831IvK+vPFrCYoQFn6S51Y9eJ1SfbUZHPfXz6jG2BJbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alQ5nK22FoRxRcg7sTiJRClilaeJOJywRbDsZoC8pMM=;
 b=D3BYXOsM3TPeS6TpBxtudq+hD+z3gSKr/36NS9K8WRwT91tYDoXs67ubfke7TDFQqPHqLF6Jc8Utf4+9grJjF2lB7DO0lPp/kvI4nUfmQpvZ5JQeouRXH9rJk4u68B84y3ay518cYM2EQLDmDPPbWonmF6ESilau247H3Zu+RCVDwRn13fRPQT+8GP9LKDR5Iys8td8gedEytIWepwZrecWwruqsXvK1Rw9ne937cTH5Dc6evz8AJyfI0lxWQiQt6+6Utl4t+yxOfmpHtQHzCwNcU6bVNLNVE6HebAUjaTk3CbEKZuLfj9DgiP823a6D3SxRamVj8FMsxx0q5LtI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alQ5nK22FoRxRcg7sTiJRClilaeJOJywRbDsZoC8pMM=;
 b=EvgHq9SzoZE/hh/xgPm1IZwowGlq0NViQWWCZpjGDBpyXlexuIhoqQiaG9ZeoDjy4v2ZDbpXJ2ypQLJ/h9FpyO4H82SJvADJ0uecJOY50pvJCt8s1uhoAaHn5EdgFsVjFv1NRk5aywFd+KeWcLVy5MhShN/AkYKNgRjNaIj+ehk=
Received: from SJ0PR05CA0081.namprd05.prod.outlook.com (2603:10b6:a03:332::26)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 06:14:50 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::76) by SJ0PR05CA0081.outlook.office365.com
 (2603:10b6:a03:332::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31 via Frontend
 Transport; Thu, 20 Jun 2024 06:14:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 06:14:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 01:14:46 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 01:14:39 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH 1/3] lib/amdgpu: add new asic support
Date: Thu, 20 Jun 2024 14:14:38 +0800
Message-ID: <20240620061438.2218484-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f29e14-9141-4b16-af57-08dc90f04a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|82310400023|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h7yjmNhn3LVt718AAMqFGF2J/ftumc+aNKIpwa40/40LTiIZVX9/b/XC+RFI?=
 =?us-ascii?Q?3Gy4ndro04BffYKWNDqzwK+G6R0tJ0bYrScQnm2r7y+z8YHsj78BuORpSVQz?=
 =?us-ascii?Q?Mt/orlnEy5AfvN5HnmIrHyuQlXWjMQWH4qqu3hVeHtI1dV/qTmlQn9B+ojqj?=
 =?us-ascii?Q?CBH0Nm/Yu3gstM3rxJ1WZ3LWG5n2GqFA1USAmCxC5MeWF4pIqEKh2QtwmAif?=
 =?us-ascii?Q?w39GfAFev6sGdbux2++vZFGTlyMdfMueDVPuwu7/6JuTwW9KMrqHfixDKBBo?=
 =?us-ascii?Q?JifM1CUB06KZylIZ9gpaBLRP/7dffTTI6u5CacQD0WEEvdmDoDImJui5Ypib?=
 =?us-ascii?Q?EmnZpYd4uxtORhSdBMpxHE3JLZWFdMCG5wvExVJcCax2XEz3BjAZNXxtkr/L?=
 =?us-ascii?Q?ZsFsLPsljQ0PjnfCwL6GXPY7kKQDuTwi/duJUa2LXa/YBkGwjf3DVeE3GC4u?=
 =?us-ascii?Q?fZP9J6fSGTFPYPjIELBC7z5GMKK9rVSNW1+otO7o1mvhbFz9G4j+3QFLomos?=
 =?us-ascii?Q?M+tx2rWi4MwOUzVa/8kqU4ft4Abap4KSNw/3YmAaLbe7eikVI+DFG9GypGkN?=
 =?us-ascii?Q?MxUu70VmiobfGXGCWJJFPj+6CFReLnD8IiKwV5i5mcAsMA1Z2h/egxUd1l6E?=
 =?us-ascii?Q?EA2GNgUZ+WK0mxTv5K0LakOnx2NKD/mH1qykO/vnhqdJcwBD+tHGP7qEJqeR?=
 =?us-ascii?Q?fa5LO2KBo3bgLGUuzg8lYGsIIPxLRHitlzw4IZO9IPLs1Ule45UvT8yDyk57?=
 =?us-ascii?Q?ctM/YinnfwQP69ojtcHXnztEwvsVmr9FENS1hMoRwLUzkFQG1S8uefmopLfj?=
 =?us-ascii?Q?Vl9EXfj11PilG65JQIFuTSi93C3Wm/sTnqrBTkwezopMMML17MuS3ofSZ+iS?=
 =?us-ascii?Q?GEjYxhZfT5t9O+D7SHc5hRn37N4S5WUyx9VVHow9YVKjpETuDcNiir9NaNxm?=
 =?us-ascii?Q?gbb/KW7NEaCMQVhbZXXlzvUPWiYMz8IHQ7MuBp2dSgetFIrCdh68A23cefii?=
 =?us-ascii?Q?NJ3LGCAU3XPQpPhYxXh3/7Tr+XIiK8pjz62hyX/xkXEbNm/5f1aGIaPSwZlJ?=
 =?us-ascii?Q?GQPpBGRzAp/+llKCmh8ztFBRtWLXKnNTiGuLcLbi56rWobpzXbQsszEzda8s?=
 =?us-ascii?Q?kOfmRfnEhYRRy4cxQaKHGljUcKYV/WPee5YQFquoVgwNdCH3r4W2a7EIbiM4?=
 =?us-ascii?Q?wxMR2DY4+7ZC7fbnAteK+/0mT6geAdBnaXgMJyGv1pxkQOzPbljASUJco2nu?=
 =?us-ascii?Q?X/lLhG79hr0tiadCAr45EjK439LCopiSd3UT0EHoloqVjUyfkyNfz6J9/gCa?=
 =?us-ascii?Q?TGtWyVSo2+EZDYolqAqaUBWmDV/BbHrYLO5RpTV+PMnc6VblTsZlfzLLkXTv?=
 =?us-ascii?Q?y/D28zIBETeQpT/Y1ajAVlhffNqRzIEPnzU2kfYEYt/vivywlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:14:48.9092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f29e14-9141-4b16-af57-08dc90f04a28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
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

Add gfx12 family id

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 3 +++
 lib/amdgpu/amdgpu_asic_addr.h | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index bce2c6c2e..4a5731dbf 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -106,6 +106,7 @@ enum radeon_family {
 	CHIP_GFX1103_R2,
 	CHIP_GFX1150,
 	CHIP_GFX1151,
+	CHIP_GFX1200,
 	CHIP_LAST,
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2ee94105c..ff7e55525 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -695,6 +695,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		identify_chip(GFX1150);
 		identify_chip(GFX1151);
 		break;
+	case FAMILY_GFX1200:
+		identify_chip(GFX1200);
+		break;
 	}
 	if (!info->name) {
 		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index cbe02871e..0ecb0b803 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -31,6 +31,7 @@
 #define FAMILY_GFX1036 0x95
 #define FAMILY_GFX1150 0x96
 #define FAMILY_GFX1037 0x97
+#define FAMILY_GFX1200 0x98
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -108,6 +109,7 @@
 #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
 #define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
 #define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
+#define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
@@ -173,5 +175,6 @@
 #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
 #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
+#define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.25.1

