Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D8AC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 10:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D22010F70C;
	Wed, 20 Mar 2024 10:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UZXW1gF9";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F37110F06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 12:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOZNTBEUirMp7fhOFA3q4Si8A/0mRCBd9FUDZA+F1zRFpkB9nL7860nxx2yWUdlZiqo1SRZu9xdE5CbV/TwRfKEPJLQ2epzeL2EDPVyxVG5Q+aXVNxLsZHm2NJxRYxcaCLwHqWW7fA5WQKl/pbh6Swxsc2R04y0lBw4yoSmV2MElK8Z+mWyeOe3hTxlgqlRbivwMQNSwx67ksjfJWZTmHNWaLIMyfecYQFYPay92B0urFoLwg/Dy5zkcsOggSl5dzxHgLJQhoXqkraf7VK2OBDedLXR2HbewpO3g6sT1eGLGv9DpOHS1zSRlgSZfcu76MkOy41VmXRmVK6AO8hGOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CB7GeB5B9l3UFIGCk17+TNlt5spbX8rutCV75bOn9Q=;
 b=oBHfnLvswtmnEm1gd7HraQlXuIZJzMrE1f8FgY3Wc2ERTXc/q4fiBVIWmaPQBIcjlFnUAqDcP+JVMXrd01g6evw/R8jLHrZF6TtHFOI8967InR//0l13YKBHwJVSh5Ew0jplJ9qUdJwGrfQ18oN924wX8TYP5woKEGYh6+sh1Z+CzB13TSkaqVNAEpoAZmNjqPYbsy5vvChZBS4NI80uFqvRGAVxbEAcHuqs5SK1VXWtMBYRmb5a2eicgcSMUDTBJJ6KX2mWG4k5tLGd2Th6R9LdCsPEmPwi/51CaNBkj/N7S9fay9kHzeGspxhVlqXh5elZeRXkk3Kyxs7RKjdfbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CB7GeB5B9l3UFIGCk17+TNlt5spbX8rutCV75bOn9Q=;
 b=UZXW1gF96cY3Qxz32GRERVXm2K/PYhcmcDBAesg2NXjSwDqWZm3K5FENKi/M4wmCA1wYwK/s1WN1KvMkakbe/Bi8/Ov0xZyZg6lPTy2jJ3x5OiMMLPmxDW2yHo27GkZtIr+YBFs/nxFl5oSGG5Z0Hm+2asp10SW2UDtiFRTNPQc=
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Tue, 19 Mar
 2024 12:59:35 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::d1) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 19 Mar 2024 12:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 12:59:34 +0000
Received: from rtg-BIRMANPLUS-STX.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 07:59:31 -0500
From: Himanshu Nayak <himanshu.nayak@amd.com>
To: <igt-dev@lists.freedesktop.org>, <sjamadar@amd.com>, <Leo.Liu@amd.com>,
 <Boyuan.Zhang@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Ruijing.Dong@amd.com>, <Sathishkumar.Sundararaju@amd.com>
CC: <himanshu.nayak@amd.com>
Subject: [PATCH 2/2] new files are added in meson.build file
Date: Tue, 19 Mar 2024 18:29:15 +0530
Message-ID: <20240319125915.1122577-2-himanshu.nayak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319125915.1122577-1-himanshu.nayak@amd.com>
References: <20240319125915.1122577-1-himanshu.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: ff98e261-51ee-4af1-31f7-08dc48146d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AOpnoTzRyuq8Iw/Ntp1ex7xOvYJcktvJUMHBTHZpthRTdchlwqCokjUr6TL3HVIwWUP2gIfA0HSZdMq8PphBx5BZg3QDoe+lY8Rx4oPQpUMx0BUMFkUBAq++r2TWOgIvQWr4WOCYspcTZXq+H/944Iu1OXjJ5V68BWvgpBDrlIcMJeq0Ce4OUzwXtdY8swdm2O2084wy9AP5da02MirW6hK/wYs79G6Qw27JSYuo1dkbIvwMc7bYpBsrZ9Pj7DLH6YB4D0XG3ZTZkRq/RnTpNUsy03PbnBsyKw4u8xeiFWGS7oDZTrslH3AF3/2QdOypEee38dPZdYVXXF3wWsFCXlex0BJpeWv8Yv2j4gX0JRZgY1VK7jaC6g9A/uf26sM6CavT19DXpkAP4q9uMwRtkgatrqW6+zc5JGL2wiDZgWS/3mXQUIwJfaOhYdDGyo/PeHYbb5iKN2K/j4dtNU2QE26u3MTK5cOwqN5dYR+YFBvIC465lXCGPr4wZLdXzT2KdMzJqlLXyeqvYeDGnXIl6ao1F57Xlnvii5rZuLbNfUuaBvI4Ge4Hrib60P2piKlBIIyocuM7hM3ck+6xH9oD0791xXDYiWtoyPhUlQsoa+K6Z8g+oYczCHCGjXEKWfkgAzLJyMVVUSR4chSojKxJd3Bz/5UMbnfyOLlgLSo2/B6mM3RZ+Xofn/3AkxoRY9fgSocMzRF9Z2uxvj5RNf4FyDDcGXC1jjXNZWvUel/6MHTtcV9/7rusQdN/pQXVN5/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 12:59:34.7931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff98e261-51ee-4af1-31f7-08dc48146d38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481
X-Mailman-Approved-At: Wed, 20 Mar 2024 10:46:58 +0000
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

---
 tests/amdgpu/meson.build | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index a58d18ad3..0f5eb197f 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -60,10 +60,19 @@ if libdrm_amdgpu.found()
 endif
 
 foreach prog : amdgpu_progs
-	test_executables += executable(prog, prog + '.c',
+        if prog == 'amd_vcn'
+              test_executables += executable(prog, prog + '.c', 'amd_vcn_common.c', 'amd_vcn_hevc.c',
 				       dependencies : amdgpu_deps,
 				       install_dir : amdgpudir,
 				       install_rpath : amdgpudir_rpathdir,
 				       install : true)
+
+        else
+            test_executables += executable(prog, prog + '.c',
+				       dependencies : amdgpu_deps,
+				       install_dir : amdgpudir,
+				       install_rpath : amdgpudir_rpathdir,
+				       install : true)
+        endif
 	test_list += join_paths('amdgpu', prog)
 endforeach
-- 
2.34.1

