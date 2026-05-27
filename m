Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05127CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 12:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0A810E7A4;
	Wed, 27 May 2026 12:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iMb9/o6/";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A934B10E7AC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 12:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/kCANNiq7m1USeaJf7tAM0qMY9DhgC/3lIjfv9I/dYgpTnu87KhHCDsxvJYctJ2fkQmeNrBCfQ/6yq2iY12XbvrrN5ZKLHOPmz+2GTPiVVhUDnuwmVw2/JiDomJx7iNx++A/YhDQwkSnqblgrRhOfRlwaSYndap2pcKjVL15rSZL2ThX1DM4XiMwW0RHn51Aot7hzdjCREnKmT9TPv8PARNtqDw1JTsgt1CjqTL4rpwbm4AkHaYffbw6KZ7oVOY2bGiU/kpUg6CRLLnVl45V+4WFem84H1YBX2ENHrZ/B0siqbJoAHdvV6pQ+G5Vt7v0liTAAtVKLz0zJnK01oO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haSr5TvoGJRa2/XEWT9uyZLs/9ye/d6MgimwHjNCNqI=;
 b=r1HUnaxlsPIImxj2nCwXEnMTQ3QY/6ItjeY3r5o1caE67ZFMGk4gaFPQchnQA5YujvRuzAU/ieACtk2xc5DG4Ydl/i1N3Chdle+PinVz29UyZhwmiSrW79APHWWr/sppq4IUyFIDcxhycMw5Yj5Sc9WLg8k41TLLJvFW1AIhDVg6fwg3rQG3ON0KCM/GS/wRHxACH45OHeO6vNDWJ5mvnArRGzr/0pKj3EXQldoiT+yZzQietnF7zvwogB0gvaFnOZ5EEY9JKhTD4aMtg+oYFLyyb0+oyDhvZjL9hGMat5A4IVsY9zJUD5U/eGVAGFM+qqauXCbB1Yb3LYFENOHZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haSr5TvoGJRa2/XEWT9uyZLs/9ye/d6MgimwHjNCNqI=;
 b=iMb9/o6/jHHI/wlMezWWgODPoJWdOmPX4bcxJtTw2W3h1FqIaYK+XISLi5LB4P6+tIfBIg048W6M4OjMwnQCiBlrB2M0XiRd84JMF66uHfhaKUrRsVhI9CJZsX0LAHkFda0c3S5TkIY5JRGnqhD24mil5xANKilDmMcg84Ws1jk=
Received: from BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::15)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:16:21 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ae) by BL1P223CA0010.outlook.office365.com
 (2603:10b6:208:2c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 12:16:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 12:16:20 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:16:17 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>, Jani Nikula <jani.nikula@intel.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t V3 0/3] Update VPE blit test
Date: Wed, 27 May 2026 20:07:59 +0800
Message-ID: <20260527120802.617332-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f786756-be7f-415e-a09e-08debbe9c2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: mmM9OVLXImd4Ifh0D+WenGhpwycS+OzfPDPNfZjLlhECAJ3pamrK/QsL6sragi/jGPjaGW08kb886LfCUX7u18WDuXzpHutRd2WuZkLL73HmGcDkuzJwaEM5WabKd/h9seliA64jBIpHrKf7Ngi9H0YVVj6GJDeqbAprAijQqnXROVg9iclctzG9xK0DfWgm7Md7YORwBCNiDl6XMwFnizrHsMNhY7lV0kejbnv0Bs+lpbSPZ7UN+9FXNjGopGkXKeNfZlkgpjgrcegxcY01m737QJC1yxfoK0YHP1QfjqszLFTSnJpAscjLmOhdlys5rw7ikzX4CxiF7XUW5FDy7H2kE8JWAPbgfg7/KuZnbVoMdCe3Zr6uFfOm4cQJsm+3r4IyVSTUTU/zunqbdfCxDqi9JnKEUiWeHYyjj9uOBA0OLUAzK82NCfTh6sHFpEJQ6/8Wqr3srjHTO/3jpaLIni9BmkM/3A0aeFXl2LEe1n9zkZAN+xsXW55y3twTwqc93blNHF/TKsRpSAGraajjkaMJviU2iy98ZbQe5LtbSnvImv4rOIxwebR+v1MgrRJpu2VgDYLpRbN3ojVGi4NgpfVt+yLlVidpKwslsO2z+FTaRz3Ry1UKOkaGe8+cKwbQ9DgzGNorzPqxLbVaM9l9rWc6eE7jMQUsrS5yI1NZU8wD/Fw79aqU+0+lq00A1esQ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UmaRept8j9oXD4z/8EEIgRDeVbkgpvpTylExDS5r7VjTKGRVMoLExPx+BaEzaieN4UFjDFF16XOxhusbKLkrkpuFp9hmzGRcZqRrtMmDkEeDvy8gdtINfhcDcvyjCinsrEJ/yE3RubwGRQp7q4sbH7IOps228Sx8deiSYzkeIiNixIMIZhXv7HFnKzSuEaoZhjMtWlHQP3eJOl6Uc7wcVzBUws459Ov/Oyi4yOegLwCAs/H0yYJoj/Bb4zCNvXtzFwsxwOF0Qlmc53gv3RIwQgN7vFyImZqjbqDFDmUuUJeI+oKczqHNaJ3Z9MhJuDiObDy/cPu9mBfiVvl/lrxbfm/QLQ4jRqIxgkaEalLOczQlozvOyNCs3uN4NBrW1g+vZP5AdUDtshMOtPlLPocOsFQBqHZfHOn4RuwBHfn8OEKIY+w0/mm3xnzgJVYYHCvw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:16:20.1723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f786756-be7f-415e-a09e-08debbe9c2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
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

For new VPE2 IP, commands for old blit test are incompatible for VPE2
HW. A new test case is added for VPE2 in the first patch. A new header
file is added for placing macros and a new source file is added for 
static arrays for vpe commands, so amd_vpe.c won't be flooded.

To retain compatibility for vpe blit test to work on either IP version,
a switch case is added in second patch to call testing functions
corresponding to the under testing IP.

Blit test for VPE1 is refactored in the third patch to align with coding
style and VPE2 blit test.

V3:
Put VPE command array into a new source file instead of in a common
header file, to avoid having multiple copies of commands.

V2:
Solved unused function compiler warning (new vpe2 blit test added in
first patch but only got used in second patch)

link to patchwork for V1 and V2:
https://patchwork.freedesktop.org/series/166844/



Caden Chien (3):
  tests/amdgpu/vpe: add VPE2 blit test
  tests/amdgpu/vpe: set blit test based on IP version
  tests/amdgpu/vpe: refactor VPE1 blit test

 tests/amdgpu/amd_vpe.c     | 239 +++++++++++++++++++++++---------
 tests/amdgpu/amd_vpe.h     |  42 ++++++
 tests/amdgpu/amd_vpe_cmd.c | 271 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |  10 +-
 4 files changed, 499 insertions(+), 63 deletions(-)
 create mode 100644 tests/amdgpu/amd_vpe.h
 create mode 100644 tests/amdgpu/amd_vpe_cmd.c

-- 
2.54.0

