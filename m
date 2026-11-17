Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4FE606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KVYaCJfX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC0610F600;
	Tue, 17 Nov 2026 11:14:58 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFCD10F600
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 11:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpIIdX+51JzEzfo5d6btHekjFmtS77KYFWhCQmDhZkUrimXcftbaKbdZjzN/ylTgWLQHXE0SKwwWFDsJDduVdEMDYOm3iyyQodgp0Reh3+MnVP8nk+XXDAqdqugBm4l3wYBVmW0KqYjB9GTvuxhlmnKDyFA1PEaR6mawV64GGIKdlbrjHGd9JwT4LjPu8wv5mbG/3zy75pd7M/7UpxbVOhOnqMSmAxJXwNyx0WQ1Xj4iEO4Wv2Txkc/RSPZ/3IOvkF0ExqOU9u/iqTnzXRKKvi80JN2Zi9vxCluF3pVBkw7b0ZcNZq9dJnBHlE0bZOxZJMYT44Afi0NfkMK5xvaF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhaJKF/9a4DTYIOpjrQxpVXDAGpQqg52UryyAn7q2M4=;
 b=ZnqXccIiLkGQH/O06INAGA5jZcdJbPCBR0sZpZ5ifhbmSKXQEti8ff5GY2XZ9pe4hIQZXevL+r3wej3xG2Oy4AqSPdiaFXF/zLw0fM47VPwDe4r7D0+itS8cWlmDkgMd4meKUCyLNL9WZCpQLPnn0kRDCAxLkKGG2Nx/abYYCNnvBrEcE+9whyaJmcuQTTnGJQGXDc+INFQVOz0uqfVjLzn38JIv4OtZ0JYjuwXDaioz4QETh0VQ/F5y/ugrDIfcRCmiSREBZOIIv0I2dhvLpGiIwlxDP2BdRkslepjK1NAHrtT57+F50M28NrmM+TZ0ow13QiEj6C9N9OsGWvXLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhaJKF/9a4DTYIOpjrQxpVXDAGpQqg52UryyAn7q2M4=;
 b=KVYaCJfXpr23zUVMnOolacT0ubMETFf3tTQwpoj3Qlr1TQmisf2s9q4r3KR0DmARVdjHl/Fc59L28hqHjI4HmkabbCIX8w1f/zfmIZxxV0TDhThQ3MjPIDos58Ilf+Fzl3mxvirqNB4WyMsvaSKNYClH8r8Gwn4tT4X8hv+GT5Y=
Received: from PH7PR17CA0009.namprd17.prod.outlook.com (2603:10b6:510:324::17)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:13:51 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:324:cafe::69) by PH7PR17CA0009.outlook.office365.com
 (2603:10b6:510:324::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 11:13:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 11:13:50 +0000
Received: from vpe-at2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 05:13:48 -0600
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Solomon.Chiu@amd.com>, Alex Hung
 <alex.hung@amd.com>
CC: Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t v2 0/3] tests/amdgpu: add new tests for VPE3
Date: Tue, 17 Nov 2026 19:13:33 +0800
Message-ID: <20261117111336.8130-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7d3f2a-a930-41b5-f742-08df449bdb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|261009223027099003|3023799007|13003099007|261021123027099003|261021121427099003|261022075727099003|261102123227099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: UcidVLxsOj/xOzXCrmAssGYWSqbl/hUb3XQz1ih3mEEtcu7hGM0kOU7rmLVKlSwVquZn4dGjeMOtC5FvuB7Q2Yj0KWP9pede3ItapMMeGBcFJ7+9ntcCvkK7QZO3GMy5uf2kaDy/dKwIURdPOM8goQH2DdD7tav+0O7gHGuOss6ZS9mmjHjsMDN35/mkG0XxdP1hGqv1gufotTWsI0lfs2uIUFgidNuPZ3bqvjFHInxJZQVJFcq/CfHu7Sf0LWD1OGE6lGhNh9CfhhP65fScya4M1vL27iQI6q4RQsgcBnTQ0fkZ0iNM3Z1/KkoOFBg9CNoHUsDiZo2eyJ2OD5+HZB7sQptM6mNvj1UbRPTmS7XZjPIA/+9CGX5vNar7sdmX8mVKtFa3qxRknnbHVQbk02r67KA+SMwENhxBu+ztl6dvO3fHZ/kd5gAV/5jl3Y8pGaxVNbgWttbsr6piIUf+IPWdOnlzBz93vJQQqCg75mTzLPeXLJarXFcysRT8YDsY/GBea/zMlwtzfd0zOsBfmFeRYjXqdjLkqQ2lFN8c2pf7bqidAfGElsAxvfqQ898EhVAGV879qhD3GlHzHbIxB1FTCCauVNgpFNLvAcUNX5vMuN/zft6OSS66ImARTz017hhyo4rmuKUlnlorWXsGZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(261009223027099003)(3023799007)(13003099007)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fw1v8N3CA4VkJujndiXTpl9YflcYWS06Nsk1n1DDlD4sW0ymzDLbsaGh/40XFeLq+++01ae0b4sNWQ/zm/w4Rpd4DCPuSceL3UAW5z8BVGO4VOD9nXeaY6GC7eG2QdFrQFAqAifVn5HU5E84nA6NE8gkp0gSFqM8UYsY2WAL1LFymLp9Ol3SoDSrKnRjeZjEK2kCzhC7b1+Voy2g9HF6SYz1Yl2PLnvKKuLSIYX2Od197zOFXRD0pHQvPzN09UZ9RsRbn8mWO9VAtkv5E15NgpitYn+8+qhBV2F1lfhqwc8wRP7oiZMP/Ba9Dk6NCj3LSpDW90hiju9yfcU5EvFR9EUtkrmUsRI6D3IHS1SCwLcl+Pj5oUf4ebJw0GSd0UF5c03zt4hi36hhVGp0rSBoOb4W/ElXteTF7mMfnqVHTUAy0TuDS2rQg6ZQwJN8fBDT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:13:50.3727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7d3f2a-a930-41b5-f742-08df449bdb98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The first commit renames some command objects. It's for the second commit
to add new test commands without conflicts.

Following previous test case addition convention, command objects are
added into amd_vpe_cmd.c, then exposed via a getter function. A new
function is also added to run the new VPE blit test commands.

As blit test fuctions across VPE1~3 are pretty similar, a large part of
the code are duplicated. The third commit makes the VPE job setup code
shared.


V2:
- add a new commit to make blit test cases share the same VPE job setup
  runner function.
- it is to make new test case addition and review easier in the future.

V1:
- rename command objects and add new test case for VPE3 blit test.
- it's the same as first two commands in V2.
link: https://patchwork.freedesktop.org/series/178695/


Caden Chien (3):
  tests/amdgpu: add VPE version identification to command objects
  tests/amdgpu: add blit test for VPE3
  tests/amdgpu: refactor job setup of VPE blit tests

 tests/amdgpu/amd_vpe.c     | 257 +++++++++++---------
 tests/amdgpu/amd_vpe.h     |  33 ++-
 tests/amdgpu/amd_vpe_cmd.c | 483 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 633 insertions(+), 140 deletions(-)

-- 
2.56.0

