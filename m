Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A757C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 20:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FFD11264F;
	Tue,  7 May 2024 20:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eRjNpIUB";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226E11264F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 20:42:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUp+XZC2QzWwXStLR1qFC4Bx2/f1nzpY8S8SxvQ/7UImsI/QNEh+NPesNeQiGwnsqcsc/T1gOOM6ggAF8jr7DCrv6S8KksHbkpJIWnvwdaxvYq/Z9Aq2ok3KfDJfOH2uK5FnQNT7toXRv8xtKBqrxYHIbIuj0rAHVqqFjwOTj2bPkdHgs2GxgdatjN5/PPrALb+yfgkYT37QiIP7Mx3HsraW+PAZZwz+Sboq+xX5m6XFtu8YKSZsf0tm6+5fmsTZW3WFKUo9Znw6hoHCF316MYLdQnWPO6O/xrvZdPAstqX0aOmLTcd4ORvp7r5J5DjkAI6c0LC2wUEwlmZeP8nByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJpnLU9n5Cau2moe7mYOAbXHAautOGQ/bIlk7zY8ggs=;
 b=f2XdJrIgkXZRK8AgJa7SOGTCEq/inq9VVLST3gl4ninYJqX5toeZyPWAHvD8wbVVWhzNq3eJ5/+nnUUCfbqymQ223lCwkywknu5VeVRe0SqiqEc5ZT5sfioD/6iy8UwOm+f+rb00TT+aYkPHBAB79EQgBN5pP8dIP4nKYjXKfgaP3pK7+GVdWYpXm7F/4rbcgEQsJAj/MFcsWOdNYgd/vhZuQ/DEXq7WzW800nASbzKexwXiKElIrmgMks0gzp+bElk7EbHvpHHRgIag9bsEXKYYOV/sqRtz6wdPZ/4BoCsu8LBLqaonoLR/deOj/cBphZXkmutj0Lllm+TsTHqS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJpnLU9n5Cau2moe7mYOAbXHAautOGQ/bIlk7zY8ggs=;
 b=eRjNpIUBSX8A1h9WQc5jnKWLIqPXkCrRtvpo5+4mjuYz0rhmBMEV00dfvMIFGz/lOiQbuFYGTMYAzFHak/FfKiTbQ+xx0+S2xYro/n0be42dl8WfQPI7S8HTcY927HYkj3BgqQhV3bxd368Nv/+uTA4j4mynVuH93Tyva2YZ3SE=
Received: from SJ0PR03CA0370.namprd03.prod.outlook.com (2603:10b6:a03:3a1::15)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 20:42:08 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::e8) by SJ0PR03CA0370.outlook.office365.com
 (2603:10b6:a03:3a1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 20:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 20:42:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 15:42:07 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 15:42:06 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Leo Liu <leo.liu@amd.com>,
 "Boyuan Zhang" <boyuan.zhang@amd.com>, Ruijing Dong <ruijing.dong@amd.com>,
 "Michael Strawbridge" <michael.strawbridge@amd.com>
Subject: [PATCH 1/2] tests/amdgpu/vce_enc: rename file
Date: Tue, 7 May 2024 16:42:04 -0400
Message-ID: <20240507204205.217882-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9cd030-10b4-4482-85be-08dc6ed62988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6+wqA82BZJWc8+RiajlcPjo4lInvb4tFHpo3oWdjwP852ZmUFxpp/Vs7OnA1?=
 =?us-ascii?Q?0td0wLtbX2X0c1LerMuiH2C+wO2AXNHZyp8LJHDMBhs1u0oG7Ty88mqGdV8C?=
 =?us-ascii?Q?9iznyY3wGnRVXFMGo33NjU/0lvECbhIMuoIEFz0dLFo62atgu0E8RySXKqNC?=
 =?us-ascii?Q?1VNI5T5KrNtXTH8dOV0ATDN9Uahx4Rz2dPZOEE108v8mEnhvUr1LsuvOIvyK?=
 =?us-ascii?Q?kDnuzr993qh1OByJYsTaJzK9TdG0f1bM0gE/fhxEbfoa/X62vqzkWPteNqte?=
 =?us-ascii?Q?rMbTHy9znTzZshGGSIuS3RFECNyaSUXmSBmRu5jNezap1IX6DV0FdekHl0x2?=
 =?us-ascii?Q?daRWRj089lXWHisoNNfP9nZjXOvOuiO6/BRi/ASkliXBKp2Tf0BiwA+lx347?=
 =?us-ascii?Q?BWnaR8jYniUrUBOdcVAbXLGYL7TVP9DW1xf9O/P2C1ol6Dkub00v88hByZKt?=
 =?us-ascii?Q?1DF4SUFsWSSwJP+L/qGbOSak9v2qvP77xL0SB/ErZuP9H5BnA00pr/uVum7q?=
 =?us-ascii?Q?CPsQz+QuElAbCljYW/TVb2qtXi1XnBko8fKSt68Oc+Xuz3Bjue4ac493wnKy?=
 =?us-ascii?Q?+gFnzqYVxwJiE3UOS71W0VLN+kIbs29GJaBx6Nve4+OdTmEj3mSAEQ46xDs8?=
 =?us-ascii?Q?bIOjJZDr0TAGMDqcKKOC3gGfp7OlLB8K8Kmf3fhvBa4niwPYer20UzoPowZi?=
 =?us-ascii?Q?RLsha/IYItkDb3xThQem1gtFozRTkj3TQ1Nftjpv/jDpkSGwOflMC2MZRyll?=
 =?us-ascii?Q?sJR9GFemArpNW1+BU+eeACLUbsXooJYy2xhEf0sQU6DMSj1HCe5kZprCT18t?=
 =?us-ascii?Q?M5OhQX2vIoYcPRaWYQbaPkyyN9BqmIADtNFwq+z5pnb1LelVbom499lnysme?=
 =?us-ascii?Q?I/tkD6UeeNieVvdNp2WfgvPtPtYI5hg6BMqJfGo+CxDMjgc7Va6WR3AuICsZ?=
 =?us-ascii?Q?XBf/ZX+i1n8uNPqqI/xChc7ced+siFevVzwwPJC4hBAkrZyLEDxUIv8nECnr?=
 =?us-ascii?Q?2yJS58Gw8TQWal8GbgXn3nvKe9YIIN17LwJzEzmluS+G+cPyBC69xc2o6u3n?=
 =?us-ascii?Q?xVFrOH61EDJgXXW3HnRrwdkJT5u1SH5XEdH+IOstOlFgNfj80xDfIOV0FTp+?=
 =?us-ascii?Q?GnI7muu15cv9SL8+pEZLgKA8YTQ8lbT3Q3Wbtt6HyCSrtW2rwr0PneYroh3I?=
 =?us-ascii?Q?W+Ct++2kwd3knqFcfg3jj8zuFgOaE4KT7HuOyRK4P5ChpuLpeT+FUCEjsOrw?=
 =?us-ascii?Q?0nfVAfORTWGX5fAx6kGkj8kRBKcxyBaM/riMgIXb9+zpP0jBREG/+JOBoYxx?=
 =?us-ascii?Q?J4Sbwb1JIju78Piud2wr944xZpYHdi9biqxaznnIbQ8pAS4Zak0PtO08jPfM?=
 =?us-ascii?Q?5YV6PVy+xXIm95zRmOATHmlKsicJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 20:42:07.7856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9cd030-10b4-4482-85be-08dc6ed62988
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
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

It was a typo , now rename amd_vce_dec.c to
amd_vce_enc.c

Cc: Leo Liu <leo.liu@amd.com>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>
Cc: Ruijing Dong <ruijing.dong@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/{amd_vce_dec.c => amd_vce_enc.c} | 0
 tests/amdgpu/meson.build                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/amdgpu/{amd_vce_dec.c => amd_vce_enc.c} (100%)

diff --git a/tests/amdgpu/amd_vce_dec.c b/tests/amdgpu/amd_vce_enc.c
similarity index 100%
rename from tests/amdgpu/amd_vce_dec.c
rename to tests/amdgpu/amd_vce_enc.c
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d7152a356..3982a665f 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -33,7 +33,7 @@ if libdrm_amdgpu.found()
 			  'amd_security',
 			  'amd_uvd_dec',
 			  'amd_uvd_enc',
-			  'amd_vce_dec',
+			  'amd_vce_enc',
 			  'amd_vcn',
 			  'amd_vm',
 			  'amd_vrr_range',
-- 
2.25.1

