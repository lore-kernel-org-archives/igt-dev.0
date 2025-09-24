Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D332CAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 19:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1A310E22D;
	Wed, 24 Sep 2025 19:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eyHIgD5v";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012038.outbound.protection.outlook.com
 [40.107.200.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE34910E22D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 19:03:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ5LlqBMAffNkWTczqHxJiKfzyiF4KnxlKErmlzzqOyVi0FoFrBrwQVkffxkYSr1C5yQTJlnxSbSviO3USAGB0cITyMhAS3m8IPntkPxvy7e+khfG/bY4ekECfcljzu7CpQswspl1Zua42lI+lDb6l35ZGSb2tL1WtF6jfWi30X3feUa6sB0SyfISUturFiuLaeB10BEOXb+5YLAaFyR1ZERSgli2li9LQZObXqgOrECD+jH73BxcHZ06uulA36Vyu2z58AyVaa9Nq4Cn2x9TQJrGzffP5olfCR/ibHz1TlZ1KKWDFm2TDAvvgO1HvcPe4pVKIWw2KPHQWeU0UY/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QU3khL9zlpx5LAFMPVEu9ovmhGCucaF/9WhxhwqHuA=;
 b=mtjOWc2v7aFHq/SnZI/oZrmd3YxkwKkzB1LyNlRdb0WoD2Ly7Pv43Ia9wFMO+wXJn5jBM9vFU1+pkRbQK9TlNi/v3o3VR/EDOZu9MYW9V4qKH2MPvbWJu+Wi1nC71YmwN+1h6ycdIKDMV6ijbpUcIa0BcYGUKpf4GKEa+lGbzEGhQRUPze4wZB2wvptqnSrqOe+1f301nQNG4GEhnhYqRzWNgMYT7dd2rgZg2WXhMrSl5G9eNPueLIpqbJAsGCWSZGL3Dlz+wIL5MgD4WI7Q0bWcP/gYaD0dj9wN1k9/fUJCYa6EfwXv0vv8omeAjk6KO69UG41Np0l6CYqFo7+O4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QU3khL9zlpx5LAFMPVEu9ovmhGCucaF/9WhxhwqHuA=;
 b=eyHIgD5v+2mzcY99Q1uH8/KLJ9eCK83jiY7xftPbotP9e3svI5RoUiuPvq4mQHmWlnB7ykiStzrYpa5DKJ8pQoYh4iSXuIa/8hKYENJ+9dwYnEbki6oHS1fUA5aBJMI3dLiYFU7+Ed8tn4sJ1/f5rmT2AOliaQvoJkbbbr0uYpQ=
Received: from BL1PR13CA0435.namprd13.prod.outlook.com (2603:10b6:208:2c3::20)
 by LV5PR12MB9802.namprd12.prod.outlook.com (2603:10b6:408:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 19:03:21 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:2c3:cafe::49) by BL1PR13CA0435.outlook.office365.com
 (2603:10b6:208:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Wed,
 24 Sep 2025 19:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Wed, 24 Sep 2025 19:03:21 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Sep
 2025 12:03:20 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: increase IB_SIZE
Date: Wed, 24 Sep 2025 15:01:57 -0400
Message-ID: <20250924190211.359135-1-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|LV5PR12MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: e65e30b8-26f5-4870-1fe1-08ddfb9d0792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3V1M+684lGPOcmYx6SVfXBHyzdswXJds4qWPyuimm4ppdMaQkLn/bLYuqjRX?=
 =?us-ascii?Q?UQb+QC5YlG0BJeXZT0IBnfVc6OVfGaPhwga40gU4mQtROEmybsUp++HHwOcr?=
 =?us-ascii?Q?CW6YHAun/N/APUc4yqDRTRwSuR14BD5qx3hSolOx7xpxDjuAHPLRlVZKXDTv?=
 =?us-ascii?Q?ChhDfKyk8zAMpxwN1HG8wZGL72XnuZaZrdXv7H/XNDCfcJASoc/T012aetMo?=
 =?us-ascii?Q?/Xgt0QGBsaPpsUgqalUu0CCg0fwfKCBW/hDb3sVInf26l5XPxaFgSAvZSTyq?=
 =?us-ascii?Q?8/DVMNawtFVEnkIKmM4SFhnPWQgyu/jE8BtbMUIJ/IZ0EF0e6h0+NLmA31jg?=
 =?us-ascii?Q?el3mjHkxCO49qIe9kHcVF6g0xyc+x2DzgGruJUSaoJKzQBa07ipJxSpmT4Sz?=
 =?us-ascii?Q?dsY1eAZJgGO8ebztZc+u7ru+47pLksGcWYlA9sq2/A9MWv6s37wtfzfYr5zk?=
 =?us-ascii?Q?SdV/Mz+KOrUHkRVyeZ7eLhREc0w/cT/aV1BDGfSBHvk+RcNCOlap3Go1eUEc?=
 =?us-ascii?Q?1VUYUjcfBaTT64Bzhc02mbRRUk/M0Bp6mIVXDLd/tLIHT4UmZAsi/XB8m3pf?=
 =?us-ascii?Q?Zs9/kTgSqhk61B+ZF739TpFhvsCzyXqtmATaim1j7IEG/vHkT1yzsf0uapRs?=
 =?us-ascii?Q?GxwHf3QmOqLxuLTT1XCDHcfICTNPC02TERE9myvMGI1c7FA/8vKabFZOVvja?=
 =?us-ascii?Q?6f2Em2c6SiKvyIplGmrkLmfcLeZfR5+s6Yirb7uK2vfga1h40sd83Thx+IRn?=
 =?us-ascii?Q?sESJMZOQQ9HdNl+W7DScjox9RhgWFnjqi0xcYbiID1W2vUXhbZhayEc1KAtc?=
 =?us-ascii?Q?hA2iNpEJB4RITWkj83aUhVEzX/07/336L+o61K3RYj9VmyiryLRvuyV5yjMi?=
 =?us-ascii?Q?aeNhyQLWIsikfDLwt/mvSI87jVYqWZNar7p7EydGBOQ7IoPvPiSOG5Rrukxb?=
 =?us-ascii?Q?6/RgAuPHXaMkwZ34sq1UXvAqr8l7m9Pdb66fXio8+zGxmf2e0QO+a/E9RndU?=
 =?us-ascii?Q?WDMzqm1A8PeZd3A+BfbsbX3EZu1XeCMRKeTlgej+u3bJIawnXXN5CIFIVuam?=
 =?us-ascii?Q?L4MzfQ8FutLZl1wxHgMsNVd+Y//FRkFkR3sfOpqtSDDACXINJuj4N6b5nwIE?=
 =?us-ascii?Q?DJHw2T4WWjR+k3fo7RnUS++KBuRSTLyQ5aIj69ASLvaHe4Ic6abLCGa1W3C1?=
 =?us-ascii?Q?BqW/ynxx5FAloiQjWbl4Le5ljv6Y1Ermdz5pKNQRSmu87c/GjNTxMWH5suoI?=
 =?us-ascii?Q?InJEAebp/Qelh2IPejbGpJBKVSDjHh6HWv9PPi9mx5p/Xo4bw6GN8YJH83Hf?=
 =?us-ascii?Q?y5U/rZB3f+5HbOWgsTMWSyPwdcxkipV1DVkne/qjLFwWSjkIy+JYVGxEBtUz?=
 =?us-ascii?Q?JSyXB5q2IwRHk9lvB7ivYzepb5Z0gfwZom58Gx9P2PKmsSx4NOFRSVGn0VGD?=
 =?us-ascii?Q?KnJqbKsbDkbPEylVfY0dylRYfJjjFVbfpJStn4POSt2SNBbnlRkJHA5y7n2o?=
 =?us-ascii?Q?yeGbXv2dDQb+ymflW35YK7xfayw2HCfPPhUI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:03:21.1512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65e30b8-26f5-4870-1fe1-08ddfb9d0792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9802
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

Double the IB_SIZE to fit the new IB size required for VCN5
Also remove IB_SIZE defined twice after having included amd_mmd_shared.h

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
---
 lib/amdgpu/amd_jpeg_shared.h | 1 -
 lib/amdgpu/amd_mmd_shared.h  | 2 +-
 tests/amdgpu/amd_vpe.c       | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_jpeg_shared.h b/lib/amdgpu/amd_jpeg_shared.h
index 09e76b005..abc13009f 100644
--- a/lib/amdgpu/amd_jpeg_shared.h
+++ b/lib/amdgpu/amd_jpeg_shared.h
@@ -122,7 +122,6 @@ uint32_t jpeg_chroma_base0_0;
 #define JPEG_DEC_LUMA_OFFSET    0
 #define JPEG_DEC_CHROMA_OFFSET  0x4000
 #define JPEG_DEC_SUM            262144
-#define IB_SIZE                 4096
 #define MAX_RESOURCES           16

 bool
diff --git a/lib/amdgpu/amd_mmd_shared.h b/lib/amdgpu/amd_mmd_shared.h
index 65857d16a..b494afcd5 100644
--- a/lib/amdgpu/amd_mmd_shared.h
+++ b/lib/amdgpu/amd_mmd_shared.h
@@ -25,7 +25,7 @@
 #define VEGA_20_GPCOM_VCPU_DATA1 0x81C5
 #define VEGA_20_UVD_ENGINE_CNTL 0x81C6

-#define IB_SIZE		4096
+#define IB_SIZE		8192
 #define MAX_RESOURCES	16

 enum decoder_error_type {
diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 5c58c0dd8..e79ea1331 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -12,7 +12,6 @@

 IGT_TEST_DESCRIPTION("Test VPE functionality");

-#define IB_SIZE			4096
 #define MAX_RESOURCES		16

 #define PLANE_WIDTH		1024
--
2.43.0

