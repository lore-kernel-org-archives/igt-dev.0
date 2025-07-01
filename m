Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0BAC8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 07:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431010E517;
	Tue,  1 Jul 2025 07:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JiT+/oSk";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D510E517
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 07:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzkIABBzmN27A4OV862evh3oOOO1BQ31ISYUDB1d+Bnf7Ya8A7DzwFXlzLEFR5oQwxSURFt/TsmELtqL0aVIsJDAqzElKofZVtQshUygXqqsYSqrTvh0aODY0Qyzbgz8zccoeumrFWdveIbzKw6alZ7Jnii6UOtqb8F+gQWXyk2Q1Rnc9HJq7cEv5MaIUXzi4+x+jk+JAny5MVvUasaXwNTZnYrMxkiAxN98nAwahJ8DSudEX9uTLm8d5flwukXAdHaJBvI85QzMg7zyFsTrIUesQeSEYIWahmnrT3x+G41GRLwbIvuOJgOwSdF6ZvDFN5nYQgs52jK4D6dsHqgOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcWKbmMCwL5HehD1KBCbT9JVzTqkkmAu/LKsSbxsmR4=;
 b=ojoeLpJXOELf/AY0ePzdjk/WU+3QG4bSKA/mWLIt7nFGwpuZu13y63mCRAcv7CvzLvmJLz3QsPD/3hFolnJt2RjjZlAA0f0k53S3lJxvigjRrWt7ttcpFQGkFVUDP+AfmiMV6yfCpUzUJ4lnzVla2vMfhlPc72i/K5paNb3D2Rm3ZivmMgFkKCTB/zcZ7kTkb1w5K0O/Kjj1q0kPnOAtEX6TrDS9RwtVV2vm/dHCRXiq8ve8aNR+pJfX8DzD40qMG8E6Jv5caC9hTlw2p75NI0x/+5EkhkxdpWV2BmkY6+HdQqmA9M0J0d+gXNf7VO3TOSvcOVd186vhWgC//Eof2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcWKbmMCwL5HehD1KBCbT9JVzTqkkmAu/LKsSbxsmR4=;
 b=JiT+/oSkL3o3zeLXPez3jNowm7AWXtYkebs/6zIMWRXliwcxZzj5APqZlP26hvYAp1sn4Flx0p5dEHB65ENBnfZqUXCA/izOJn9SIucfFbP0Dlw/pid78bZdTGqd3zC+D6Tx82nFSGnHCe899lcZvUysOMnGzV9EzaknjMejaww=
Received: from BN9PR03CA0290.namprd03.prod.outlook.com (2603:10b6:408:f5::25)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 07:49:46 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::34) by BN9PR03CA0290.outlook.office365.com
 (2603:10b6:408:f5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Tue,
 1 Jul 2025 07:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 07:49:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 02:49:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 02:49:44 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 1 Jul 2025 02:49:43 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Standardize user queue test enablement
 with AMDGPU_ENABLE_USERQTEST
Date: Tue, 1 Jul 2025 15:49:36 +0800
Message-ID: <20250701074942.229300-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: f31c364c-716c-4d92-beef-08ddb873d91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qsXPhZS4BASbXy2Otaoh8kzHAPcBx9Pyxr133SASGIBMVrkFsahSzzdLpG+i?=
 =?us-ascii?Q?fNk8Rj9iW+0rYly/lX46DcBQzVO27uGIlhLaRKg63g7JU8kaFpfeSj4f1TCB?=
 =?us-ascii?Q?ufkdZLI+wGvEl3j7nTkHUIk9nczgpWWCnn4bsUA+a+jFRHb9qfHmmBF/QjIK?=
 =?us-ascii?Q?JPpcu9K/fwTrCCF5PjrwUOxq01s7vq6Vje5sPqvRvwnfLZYjlYzqAmm6dgy7?=
 =?us-ascii?Q?SlaGo0LAjNrsXLuozsYZ9aEbYJTReKv3AeiU/uTRAZU7m3ilCbtX2bdyueW+?=
 =?us-ascii?Q?1MMkBPduHphDd9VLq9v2VDfQ8C2BYb+wzLUnJBqJEOCe5+P+uy7tj7zME3qa?=
 =?us-ascii?Q?LiySi7pd0JhF5FcOMHMd5DTXxZ7Kzuu/b0iVkCakPE/+hHEJmRRGEoW0Rhvs?=
 =?us-ascii?Q?yqjlv0Q15Fzz6ADl1H+KVve4oqvltvIiXnCsKO8WeygNG11fXgz0n8zLiAEZ?=
 =?us-ascii?Q?ho2l/vL3WDseMTzdKXI9EDm9wToDuDXty1Bo2E/MxywLryhn/0mQlyWYYcWL?=
 =?us-ascii?Q?nkYuiWBgOxRXLnJA4nFCl2n0irdyK7ZypvWGjAk3Q7kBREHs9yOhSgX2+9XO?=
 =?us-ascii?Q?J+kwVGrXWJyh6+ZrLWcpWoCfKRxKc4PKK4josR6jpmou/GOu2FvgOUZ7wPDf?=
 =?us-ascii?Q?EE737bCP5ppk81hsaH7Mq4mAQwKC7ecHkOCLigyEEJsNhkr8BK+IHRdlHluD?=
 =?us-ascii?Q?yNygIR82nIVXFLpDeBhn0NC9SAyfCswE3v+03kJmwMg3q+bNnW3foyMNM+jS?=
 =?us-ascii?Q?EDcU3jQdFelui7nHnf4A7fWucc9gjc4ATRpWA2YNtqikYo0EQ6gLQcMGdVAz?=
 =?us-ascii?Q?L3ntEKdO2kA+mPSDOqYIiVftdNrKoCn53jQufJx4T5nTtKurjGwakGqz4Hpo?=
 =?us-ascii?Q?I9lybW0csqbepiWYufauF77zxov4Nl1rV9J5Jb6kkkb3JgpY6BtC3mCzLH9D?=
 =?us-ascii?Q?w4hGa9k2FAExOoJIqG/n9zhk87HIaXTBHMvIQjsWowzUPCxETVNxzbbcybNZ?=
 =?us-ascii?Q?uZDlne7XxqJ9M1WU2SZY4c2ptDzgvPKokXoGFcyrSYBq7bG+x89KpkdBWaF7?=
 =?us-ascii?Q?PRQ1NwdNnOgwwqXr+b09pxKnLdEqmbCz7lbH1tomINTkPypJGz5tOIlg2b8j?=
 =?us-ascii?Q?YZBYSwGuHCwgadcZkxeAYwX96igadfmiQ9tL4DrqOjGcxatzWcG4YWS4bbYW?=
 =?us-ascii?Q?lFxHs6Tx0oEA3n3OOL0OfbXxy6XWSwVkwOt2sKIRrU1emvHjJk3Irx0KaoOj?=
 =?us-ascii?Q?8dZrLXuB+rV3syi3S8ZphcxD/OKVWEGXnDvTMC3oIsXDjJLruzNwj3iJwi7c?=
 =?us-ascii?Q?wb3XEV64u37CfgsCYMqyP6RoJHOaEpB+ysm/qZxTP+1qZJ9p1NX3SqkgQeR/?=
 =?us-ascii?Q?KeiLiR3gfT/nejNbR6q8ZOfoWc/F5qQerZ+rnCXT0k0Eh10kW47si+dIwNpx?=
 =?us-ascii?Q?OXL4yaZVsXEozknxa8B33VnVI1hjCUfQIQIwjxAX0UYNl7NmpnTLSTV18cwQ?=
 =?us-ascii?Q?2P5JLzn7G7wclWxn7HxxZQTBvWTtWoLLvA21?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:49:45.9395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f31c364c-716c-4d92-beef-08ddb873d91d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406
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

Consolidate user queue test control by replacing AMDGPU_DISABLE_USERQTEST
with AMDGPU_ENABLE_USERQTEST. This change:

1. Replaces negative logic (disable) with positive enablement control
2. Affects four test files consistently:
   - tests/amdgpu/amd_basic.c
   - tests/amdgpu/amd_cs_nop.c
   - tests/amdgpu/amd_deadlock.c
   - tests/amdgpu/amd_security.c

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com
---
 tests/amdgpu/amd_basic.c    | 2 +-
 tests/amdgpu/amd_cs_nop.c   | 2 +-
 tests/amdgpu/amd_deadlock.c | 2 +-
 tests/amdgpu/amd_security.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 9eb5c7599..04e8d62e5 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -702,7 +702,7 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
 #endif
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 7b08bf99c..96a385413 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -173,7 +173,7 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
 #endif
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 7bc53ee12..19dff1dc0 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -46,7 +46,7 @@ igt_main
 
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
 #endif
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index c9a02ade2..ce448a806 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -319,7 +319,7 @@ igt_main
 
 #ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
-	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
 #endif
-- 
2.49.0

