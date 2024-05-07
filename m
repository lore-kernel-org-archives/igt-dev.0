Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE160C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 19:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52578112605;
	Tue,  7 May 2024 19:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iuWuiZSm";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76F1125FF
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 19:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJmMViwVCoD7F3EWN8TPnlcvEbFjNlc1iFz4tB0C0gb7eFoEcCe3ipZL5xqtXzH6q0eqtc/yIBvALhda5iOaLGV4wa2yDrHV22jSqWXDVjRIdO7rNZgm/jlskLDX7FHETXlZF7sehmDzgPfXtAZlY4Cx6sllxt6DSqEAyylbt3ZoE2hfh53e+EQs/5uS3U07J7N5NFRhPqFOJQA38Xx8fe/05B9/T76MnEJlSM+sQJ4Nozn3U+a6NLiK9NAKOe9ADBwlglh36R/0AMVN5+oNzqc74edTM9HziPXYDAHMtwtoecxL2cO5ImXDtpxtmCTTbXPWae6VJto63rsFUs86+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad8TjaB1+w3uSWrPje1drGVG3RRdDYly9/42D5q/NQs=;
 b=LVpXoaw9wTUEbrMT91FIKGLlf9CaZ7PN8WDzHSjNmnJjSICT7IgdLIsgZDGlXfImm9uqXfXLEjZhS/0fFzSLNlrDEsOkZpsRNzwbi2eEgNVEPw//GMIdFZgL70kE24hAaDv7ehW+M0QcxwMOjafjAnenobOQIDUzPkZXRuwq3S8Xr7m40njM41G+HHNH1iyiZAUxIOsiADVXPZD8YZEN4rqCXFbIVXn46erCDBCvfVd6eVVsUqInPY0GRJrxPZkk0swXi2ZZMBtHi6Mddjm0EcZHwvJeIW5clfNXi5QEvhkLvRH6aoPgyE1fx5+IySdNz2/UWSsFUvWlsXGkN9Aq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad8TjaB1+w3uSWrPje1drGVG3RRdDYly9/42D5q/NQs=;
 b=iuWuiZSmXjnvcLNJikQgra5JKea0n/95uu0GRoFpnCNRCMG3EHiU74e66GdEf+qtse2IGEc5jfKNIr7Rev2ebHnuIvmmjOdIyg9Z78O+52mgAeHUTt7as4pslwbrMDm0Fr2lox9OHMb0l3zZt0V6y0MjH57a5l3t2yEEGtnH0Zo=
Received: from MN2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:208:134::19)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 19:56:13 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:134:cafe::cb) by MN2PR16CA0006.outlook.office365.com
 (2603:10b6:208:134::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Tue, 7 May 2024 19:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 19:56:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 14:56:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 14:56:10 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 14:56:09 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Leo Liu <leo.liu@amd.com>,
 Ruijing Dong <ruijing.dong@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH 1/2] tests/amdgpu/vce_enc: rename file
Date: Tue, 7 May 2024 15:56:06 -0400
Message-ID: <20240507195607.197552-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd6ef4e-5eef-4f62-a811-08dc6ecfbe41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h+HDmZMoqtKhocyGmv/u6I1oKA2KdKi+FsK06W3IzbMieMkOpCjsOf5EES1t?=
 =?us-ascii?Q?dKeu6vMJ/OLikvWPytnvoQ8Y2S+IJ+TC/qoIwH4izK8DN2eqyGVKMp3+QjFR?=
 =?us-ascii?Q?0nYjWI7MFichJUTtXkJIdw09aKSNi4Et1vbPI65IQxVQYF/T8ao+dxvLqJH4?=
 =?us-ascii?Q?SZmyFqK7WMlTo891/KchdPg6Xmmp7girktc2rQB2XPHprML4LOssOzZhsQk0?=
 =?us-ascii?Q?SqNIQwWN9zLQD1rmUL9sTkxMLzU7ctn1LVBypbroD+B3LE0g7RbG7UOO+09P?=
 =?us-ascii?Q?Wj4JcdFpf0USQBVBPeKYU03D9ogeeGE0h9B2y10CMpLg/Dq9DXBuXSpr2XGS?=
 =?us-ascii?Q?lahCh59kUx+Rqi46YkBV0xMXjaerZgiKDVTbY5cpypGmh9djh12kBU0tHADW?=
 =?us-ascii?Q?TzvFCOMpeQl3MRvfzn1xgPYwWZqIhsNmpH5puw4a39uyaTvZW7bQ33MleJY+?=
 =?us-ascii?Q?6lFr8BIr4Riy+6VaTqfN4XW/fk6TWUdFYDpkw52bXro5d9M/Zgjn0jQlraWj?=
 =?us-ascii?Q?G9iFZ16WG5sSbRjIxE6DH6MWu5R44K2w9qE6LKVSI4xz/7OvspNCDfe3a4KZ?=
 =?us-ascii?Q?eILXk0gP6NcvP8VJHrNwSkY/d3P6pi6CRH+hVGjSYwPuxmmb+zlhzmvxRXYo?=
 =?us-ascii?Q?UPN1XEivdBccg+4//t52sfjtlUOP4FYT+tG8O40pNS5/GxyDAPk/DDKLPOW6?=
 =?us-ascii?Q?YR5Y3khYzboAFE9MRcdup0GHbGFKpw2/dnJ+cp4bHk7P63JHqPhERT2IgdlW?=
 =?us-ascii?Q?yP4MIAyLiqpwLd02fz0sy2xiQtVeZP2CtiUJs4HfZSG2PQgsoNlN2BU2iPzy?=
 =?us-ascii?Q?l3mAZ4FsfhbKCjeUMw7yXGsj88LVVVTADfcb01Z1kdXzNdbxhmiHUiGyqXiP?=
 =?us-ascii?Q?nBdmYgVhbQR+SLqsWJ95uOMg/WV8mWSsEgs/000IRV6M2E3qZsriZpjnwVmf?=
 =?us-ascii?Q?tEcTLkQFeo1f+cGzxrZvxvx7IOgJYCINZMqOSz9dp2BmDX7VyE2uEWjBOGL3?=
 =?us-ascii?Q?klgheCZZlGLuDwciM+MT+Z5NJf6oQd5Xh6k7ceYprZFhk5QG0q5C/cb87UzS?=
 =?us-ascii?Q?d+0A/vMJmN9iJXXMYb6Uf9ScwTwWuEuLoELiXHKtppCDn4bs0DOTx6Q1jWYe?=
 =?us-ascii?Q?rJTPsdq9Y7ZPyEG/Xq999UnOEMJl2vCgSOthlfZ7130czvX2yROusY2lAVH4?=
 =?us-ascii?Q?M1NaGf5/jqVRL+KCnS45XhWcPl/W2aqJYnWFF7Tt8HsJzZeRO2Fn1fKk1k4a?=
 =?us-ascii?Q?QOmgc9SlHQQmn5XXHCBkIahQWt0h37hg/G6lw05fIwq560gmOliQy8yKGShI?=
 =?us-ascii?Q?GSlnWJCSl21F+HAmZW/puWzSdFDGEUmI3U3Tjh4111cvXrUhAA8xtrepUpjC?=
 =?us-ascii?Q?jkNzePTMuGwR+I1uqlN+nmmOOHVy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 19:56:10.8558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd6ef4e-5eef-4f62-a811-08dc6ecfbe41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066
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

