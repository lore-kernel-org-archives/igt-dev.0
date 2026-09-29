Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C651BC9832A
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECEE10E1AD;
	Tue, 29 Sep 2026 15:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NcgDCzVz";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35D10EF7C
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqcBD01Zah2j+r9gbOIcEUSXXtkeVMfxmouTBjLKkyeD4qLo633zELtAR40pNl+o3Kffc/4xA6MGOXu+k9HgDyqnRCp8x9Ywag9CzZkSX7FMzej3Glt0Rk1j1uO3vhS4Tu0Qw14itP41WHq4D59RiCQK+EWJeP8Sbl/6sd5FBtSCzosNLNYnhKrQPkZs5k35XzxWlOmrcGFj4g4jBy7VYygu4tz65+a/S5RVVX0vTUkD4XT6l576hDhAdamKWleIh8k9nbFfk8Zx0OEpGHWkfuKb+F9OSfYSNrZh9UUMZkQN88pmBGrlINz6xDkPbSh4V2P1cpp8ccPj4qY1NPrrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz0XKdvWoyVOhm0bvfDuGdHonVim4bmWOg4L8ZOzSuA=;
 b=OoXIPzVkJtQbVGINACxQMBggjgIOeoYO9AQ9eXKMIqc0K/cDBvS4NodLFZo6BkABOrEcKzgK1eTlX47oIEE62LKIOxndAhuG2csjbAQrzalTSmLXzaGmBOMM5eqSs7vC6OtyUGP+yyJjfjtGVqscbkRpSfpG3XbN4CpDGNnq4/Y1o+GecqMXPRKY9KpNnk2QAUj7r0yZw9V27SXIz5T+++NapV0eaP5Y248EzCBS38iTwpPKaWGd62AejfnSYRuiZHCglo8JqCVTgeuUs4P6JhK3XJiNdS/bWuSXz3O7N6Ci/MBoMyO2ciYs0n9yb0OcrZ6Ek7Yv3incJZG3fD6M9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz0XKdvWoyVOhm0bvfDuGdHonVim4bmWOg4L8ZOzSuA=;
 b=NcgDCzVzoXFKvSX2hS2ks9TVIrv2k8f9SMLQmmc24ynDZr9xdh5d3zZF4GcEAWaRWX0aIZ/Fnt+lKBP/P+1pYkuM+T0Ri55TKhO6xcZbGB/Ti6FOVTWXJj7If6YLF8u+LabjqvxLZHCVWRLt3Ua9gNaJij69cAcOOEL49HTdpUQ=
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 15:50:31 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::6d) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 15:50:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:50:31 +0000
Received: from rocky (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:50:29 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v2 2/5] tools/intel_reg_spec: Preserve const qualifiers
Date: Tue, 29 Sep 2026 11:49:47 -0400
Message-ID: <20260929154950.838280-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929154950.838280-1-alex.hung@amd.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 370b81aa-8c5f-4a3e-32c5-08df1e416411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|18002099003|22082099003|6133799003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ac24Lt9nDR/igTtcREWKfj864jEyXHQJ4giD2Tm26C+l5HWbH2afBsGkY/w+cSUIGYdRvZfx9palirqNnqc2eboviAH557M8hGLaWQasLPM51QsoNzgiNjpw9stxKjiXc6EWISsHFQbC7W2ed1pfSr1lmJ1Hdj3rSzGKE1WiIi9Zwc6h54QrkjXAMBivtlk/LYqH7Ik1PWHhpxVKiS11+auVpOfM/hgnZ9Z8PhIlWoOrcmnLFQjlgbPZj7N45hpc7jANlt8leZ7P3fMZvrWdALeh48IOVxyevnlblCvcgf4taMU/axi1CwxxX+MSikRNRSrMFMRoVEXRvpL5m2/hd7nkJz0cn8IkGjiMhd9Y1OVAWUtLk+IYo+TJ1yZrRDMRHn2uW11qLKFnqen/aVaMGvJHBdG15OUVFifwP/aezNfMFzJ5rCjhLorR5X43L4bdmJV4AwYGbBjUuBy8nvU+kjXszVOWUzn/iSHigOHhzzz6Diz3BChenX9tlW+/3DHszlgeqJvsk0kC3Hrzh1HJbfY//QKEY9GthdJ/wP2TYA8Al3jqJoBUHy/fgq0DQCkJPB/iCMUN0/iwhEzONGPTfrQhySDAsH9PfjwZZyZGoIdT9a5GlzuLbhdR5h0vQkwt8kLjj6jG55vpSUlpbKd2Q4m4lX/2Mjsa5e08JP3y/iy7ErkQIXEkqh3IiN6/sPILxzf/yHH0m0rJL/n+ZF3zXg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NuSOuSN6pqntHccgWlM1tifTXjuN/xOvxgha3V16qyTcgoA5FUEnLcuNTW1VNlcfsMtziX1Udg51AUi8fQVzha8q4/9kS47hSNqSeLgTudikpmNKpkA0Q6mImEQn9R9HmHbNXG1tuLRm7sjw+JwRZXpBTn6NjdQ23E/lM2E9SjnW3Lz6iqvUr1Zu7upkXYWQQOkGpbjIvn4Kf5YG4F5AZfH60qznjXbQzL2CtLaLFxaX9RyAUWl/PtrHAVdTt9lLhboaokEqC45tROvUNIjiM0xAQjb6ak1RH7eQHc88cIpQOMxhTHTuQ6a//SH7h0qGBmUtRxuh86cCTL8JmObqw5xKTtLfHnK/QZMMh1TGNx88qLTHM4S/3elBWOPxH1Y4YdskaqGQMlPE7DgL8kspP4DIvwuUlprjHneF9vH8uyAC/0phkk7eJxBfQrnVRROb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:50:31.0022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370b81aa-8c5f-4a3e-32c5-08df1e416411
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
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

With glibc 2.43, strrchr() on const input returns a const pointer.
Assigning that result to char * in include_file() discards const
and causes a compiler warning.

The following warning is observed on Ubuntu 26.04 (wrapped):

  ../tools/intel_reg_spec.c: In function 'include_file':
  ../tools/intel_reg_spec.c:242:4: warning:
    assignment discards 'const' qualifier from pointer target type
    [-Wdiscarded-qualifiers]

Use a separate const char * for the source directory separator.
Keep the writable pointer for removing the newline from the
allocated filename.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tools/intel_reg_spec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 632db6b9f..e51c90ec9 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -228,6 +228,7 @@ static bool ignore_line(const char *line)
 
 static char *include_file(const char *line, const char *source)
 {
+	const char *source_dir;
 	char *filename, *p;
 
 	line = skip_space(line);
@@ -239,9 +240,9 @@ static char *include_file(const char *line, const char *source)
 	if (!filename)
 		return NULL;
 
-	p = strrchr(source, '/');
-	if (p && *line != '/') {
-		int len = p - source + 1;
+	source_dir = strrchr(source, '/');
+	if (source_dir && *line != '/') {
+		int len = source_dir - source + 1;
 
 		memcpy(filename, source, len);
 		strcpy(filename + len, line);
-- 
2.53.0

