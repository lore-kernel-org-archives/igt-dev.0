Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93668C88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 20:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4B810E09F;
	Fri, 11 Sep 2026 20:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F8GgC5WE";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D1E10E09F
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzYkyDf6M81RO3Spgrsb9hXEIXArBXNsj1c3lC7SME/r1fR0Vi+lC5NSgLp9oZiYU1S2vkitv7LTZUQ/djLVIYU17B72lgSElEK/ALxKalyixFTzMTl7JTJk0L2Fu/K5qpbDQi6fXvca36jpufPLqS8FyWzJwhML2Id5UzZkbsCH4kBLf3z+oOyA+BK0K2K12l8KnhXVDSdBd/y7U7OntUnSL8ezimrcL4YEcSqf85Ztrt1bXa659JI0tK42AWdXlRvrwhzhEUyD8lLldLyAb28/jFvLBQJw9b1VOoKH/g+/Do5atcbyKW5X8/NiFa+aaSRceE/MTsEc0EAm/1t1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp9azH5ewR2QSXYW4OD9tLzpcAK4ni4MyD5j8lnA4+U=;
 b=AECRGwxnkL2PQqkzn89tPdJASDMsvrE9avGMQwsIrr9bXCpov7DzMJHTY9333+JVxtulJsNkUeffKQWDRwlwoikti/Slvf+HKltKbXdhxgKknSRrORwPKgWSa9HbrRru/ZKhvR54BQarlMJWdsG9/1FNe/B7ZtBceumee/ITSnIjed9OiOZB1qyN1HUOLFFXHFEL3Dkb5vZ5x39ClOPBG5xS4bowwlx6pjWSgynX4z30/79TLDeuwUAjnaCDm9JDdk6DvppLadhlnwOdfMGi0c4RKiOAgXSFjJlbMqa5GLqJLBF26eJ9MfEzI9l8wPiqmHh4P4gClS58U2Wn68+eOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp9azH5ewR2QSXYW4OD9tLzpcAK4ni4MyD5j8lnA4+U=;
 b=F8GgC5WEQ736O0lt+YcM3JaawEpVylb73gYxYw+hSa9q0hL/Xzsg1sTQT/Blf878vZvUK6a7x+fSM0UuT6yi7WRodkVBYpLFXzVuA5y8nZE4Irc+WdWYEY/dorHVF+8rpgOqV8tCJjczw+WY/90d6/X5svj2XYd+EijmUhxeXHg=
Received: from MW4PR03CA0222.namprd03.prod.outlook.com (2603:10b6:303:b9::17)
 by DS2PR12MB413088.namprd12.prod.outlook.com (2603:10b6:8:400::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 20:20:41 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::93) by MW4PR03CA0222.outlook.office365.com
 (2603:10b6:303:b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 20:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 20:20:40 +0000
Received: from granthali.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 15:20:38 -0500
From: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>,
 "Vitaly Prosyak" <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v3] lib/amdgpu: skip command_ce_write_fence when CE CS
 is blocked
Date: Sat, 12 Sep 2026 01:50:23 +0530
Message-ID: <20260911202023.1872466-1-Granthali.VinodkumarDhandar@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|DS2PR12MB413088:EE_
X-MS-Office365-Filtering-Correlation-Id: bd079d99-528a-4469-c27f-08df1042268d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /8V81pO9ZUd7x4skzdUTO4fg5McbrWBAG/rapbLoWJj8AK4bGoz0hUKtzNhnOtX3F5SNqO9bhu6wxn5doUWgHd6ziCAdDuaRDUitybcF8HoQ+Ois15zLZxfAoGQmpkroCFqO+nUBoapQpnDaO2fPno8qAlUxLNEukxb/K5YLRn64K8Fer1fajRSNwow3fWcF7K+1o0phw5mj1boAWy6fLdh59TuVNPGAMKBjekr5Dp5gdOP1LFKpt5g91JnaEbnUsjKdO1jiDDUd0GBtgGUMeQdpAJRlt/0j6NnaxY7h4LomsXFHsTF6BEWccAXxCOE1m2hDYuq2ZEVle5C2Ri7IDOKtQWaxaMWSVvdMNSGoIq3gsz3QVY4APg+59nfRVUmbWQ4KNXJTUKp2HCJxvAz58pF8YcVPn+xmnSlzOoXk/Pt2uorb43Bs/oBJNZWIDK7AGcuiO5F1KdABIcsAnJDiERwmgK7J96WTuT67PDXHaa//cp37eXhJY2ekxzwyqcF3hwgYUJc6VxG4SFZnQXcl5hpJYVkBftNw7vCCgE35G4avqNkSSBGuwWmHQUGi61NqkgqmKltrBTMxDoFYaOcddb9z365n4Q5CEKds9UYGq6iIbiRLA0vj00uErP57XliT/85GhPWnouhcmm7Ar0+dA4HVM/pLZP40ojVU0kHwHFnpEO6/JE3MRzU65HKGuUux3523sZh1vUkCQ8jyxV0p8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(10067099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gLwqJJsprWuqD0KB0c1JhffQjPGDZ5H6FIh7bzys7UxYARW5Bx0RvOpl650mdWEu4Shk9ZJu/h56h6HLY3c1ZP3f56bH5rIasmurGgLzf0bViqo6JHGaUD/nnCuZWXA6vr205IexRCL/HcgPE3yjRREHJ4dNZkLD4HnmFRvpEd8ZwdV8DYdjY37KbsFCgg4FSzV5H4MwHy+utyfaKII2LvVciBTo0LiAxrf09S++DjXFw41S3lVGl/C4Qfjh3+3++sovhRxmxwzvLJH0bsCPe4YNTAN8ZIGFuSFjTymjkyB/+I6MCUTRRi64SG3Yf02eYrL4j5+NcMjjOwKjkdArFtn1PIWTgEenOEJpG50gphynF2ApgY2AuoPiFD0xhTk0+iTPqAxpLvdJ7r2mqFFZObtM10qdSJXQTsXmCw0lU1cz57WG04gJxeHMcYZwm5DF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:20:40.9268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd079d99-528a-4469-c27f-08df1042268d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB413088
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

From: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>

amdgpu_command_ce_write_fence() submits an IB with AMDGPU_IB_FLAG_CE.
The kernel rejects that unless amdgpu debug_mask bit 0x400 is set at
module load, so amd_basic_ex@command_ce_write_fence hits -EINVAL
instead of skipping.

commit b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel
blocks CE CS") added amdgpu_ce_cs_enabled() for the CE IB helpers in
amd_gfx.c. Export it from lib/amdgpu/amd_gfx.h and use it in
amdgpu_command_ce_write_fence() so all three CE CS entry points share
the same check.

Fixes: b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS")
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 4 ++++
 lib/amdgpu/amd_gfx.c                | 2 +-
 lib/amdgpu/amd_gfx.h                | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 7210cffb9..c7b36970e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 
 #include "ioctl_wrappers.h"
@@ -805,6 +806,9 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	const struct amdgpu_ip_block_version *ip_block =
 		get_ip_block(dev, AMD_IP_GFX);
 
+	igt_require_f(amdgpu_ce_cs_enabled(),
+		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
+
 	/* destination buffer */
 	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
 				    AMDGPU_GEM_DOMAIN_GTT, 0,
diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
index 10bc74b5c..ff9f869a8 100644
--- a/lib/amdgpu/amd_gfx.c
+++ b/lib/amdgpu/amd_gfx.c
@@ -29,7 +29,7 @@
 #define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
 
 /* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
-static bool amdgpu_ce_cs_enabled(void)
+bool amdgpu_ce_cs_enabled(void)
 {
 	FILE *f;
 	unsigned int mask = 0;
diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
index 90addf5bc..8bf108365 100644
--- a/lib/amdgpu/amd_gfx.h
+++ b/lib/amdgpu/amd_gfx.h
@@ -32,4 +32,7 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
 
 void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
 
+/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
+bool amdgpu_ce_cs_enabled(void);
+
 #endif
-- 
2.43.0

