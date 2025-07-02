Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D92C83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41510E642;
	Wed,  2 Jul 2025 05:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="usoLPrzA";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543710E642
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:47:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdruarg0T4BGwZX3GCqTkHX/Ovv9FjmQy5mfORnrmaEWi0980FGhAGyeQBcnjvyAnOTxZZrhI6eNoQc4FdHfGbzFq8gEtgzIrYJuP7GXlqkmfWHPILGRP/k+Bp7mZOS+fn/EAbjoDvsxHPhU+TUSYK9bSX/bPbOwTDwZ3zGONk8aLzGnto88jqV4nbhWs2N5fL0GV4/5VSxTKCzm16xMX2t/Vw2o+nXKB+wVaZxMfTYkP9LTqCU3fpCB9vFRUaGZbVq0YtpASd/vk6QIUav7MQc4y3SzMqNf3n9J/y+xOIxlo8Bv0o4l7aAMWOTR+pOnjM9HW5IgHG3YrmJ+f1vYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcWKbmMCwL5HehD1KBCbT9JVzTqkkmAu/LKsSbxsmR4=;
 b=j/CAxPBFfXlthwRQ6nyaBz1Z40oAHoE4pWEMGmbF5N1cikS3dZXrdM2XccGsc5Ddfzy93JW6hniKwn65aiw5T48U2As8MDvVm5YkwWCoEyT+mQvXKNSarRYpet1zjwdGGCcYx4NbY7GoiTPaL1DXVBBIt790yvDc8WnNZUhUBqabCEIgAsu66+v0RPG89QwLnY8VixiP91eN05gwgRibtThMsUhCTvOvG7SOoqSAuawSwqO6sI/rMtadH8j4DKIR4+nnZDO4Bz8vYROAh19CxI5L3YkbKsMOrbJl75wtc4JCtcpbasRIzu5pM3rS+Ns7wE3/FFcOuuO+FmXNYBXRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcWKbmMCwL5HehD1KBCbT9JVzTqkkmAu/LKsSbxsmR4=;
 b=usoLPrzA3slNasGBDwTWt6SZ0PMcguSEwGbnJOhboWmgEgGoKD1vzMHddvjNIeaqAzu5P42cnbAFbmnBZ0boWReLau6hdS0eisUtsYrpODH+XSUBnrhQhZ+ueD/zqoN/7bS7pDvmysonRhoCxxo45H36jFwPN1aGg73RSaK0574=
Received: from PH7PR17CA0042.namprd17.prod.outlook.com (2603:10b6:510:323::21)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 2 Jul
 2025 05:47:41 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::f3) by PH7PR17CA0042.outlook.office365.com
 (2603:10b6:510:323::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 05:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 05:47:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:39 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Jul 2025 00:47:37 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 4/5] tests/amdgpu: Standardize user queue test
 enablement with AMDGPU_ENABLE_USERQTEST
Date: Wed, 2 Jul 2025 13:47:12 +0800
Message-ID: <20250702054730.366888-4-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702054730.366888-1-Jesse.Zhang@amd.com>
References: <20250702054730.366888-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: c5216d2b-dda7-429a-ec76-08ddb92bf540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1nLzrr+cbrRL74vThLBgNapbxkTGo2JYiEwZWVS5QzNj3i39sSxr3Q0Mg0OA?=
 =?us-ascii?Q?Qjs4PPkMfGE5yUHc9hGOY7p74vLU/hYRnTNXk2INAS2KRDd8A02nP7yiAHRV?=
 =?us-ascii?Q?H9JpuQ2hJb4GwMnls1YVzqR6tLIVy7i4GkHFP7tQhzO/zp9q5WkULLqzPfsp?=
 =?us-ascii?Q?vATXjb/Jp7zFOVnR/vlLCO8idwzz7uB2md+jANJCGk5B2r81oqgkhkpTJfLI?=
 =?us-ascii?Q?WWCH50vMVwk0r4mjvd2g3+9g09//bYMEH3FCDkrNzNXXyQ5e25IkUdl0yRJC?=
 =?us-ascii?Q?hbfPwb5m/J9UbR/f64dFftuuz8XbdReDRrhPi3oPnJb1WU0tEBJCq0HZktkg?=
 =?us-ascii?Q?ruEwcJ7u7o1nsk8/fhulPodA3kf+cdjXjMIyei+hHEYrY5cEs5sjjLeu241C?=
 =?us-ascii?Q?SIG2/awOOcZQtjqjqdQwUwhL24UbojxTHrA1rA6YftAG4LrqO4n2BGaV5F68?=
 =?us-ascii?Q?Ak72PVsmpNgpUDsYutVYLW7ZTAZknhLg9SVaSXX7CXNxPFL7Ygi28RfM2bmE?=
 =?us-ascii?Q?FsDGduz+Sjsd25Hqf9BIvVLqkgCyy0/br1FtT6TWkXVUWso0YQkvd5oASs/x?=
 =?us-ascii?Q?aRBUKuj9uY1aGUXJOW8TGZ+12e7fMp9O94laZXPgyeZYkrsMn1J/SYTB/p6W?=
 =?us-ascii?Q?Fet5H2rpvK8jhnGDhEFBch0IxbwYfl3EogG3LLzV6NWTdFH1zhR3ZBtucVbl?=
 =?us-ascii?Q?sD9bCOazdajuAqUFBa5QACd3HFmFV2cZYpwSuHSrCrQ/JdHfSxY54nbQsQNF?=
 =?us-ascii?Q?QuxpfTBHr8GC545uySnKnezIDlEvQ7IuBko9viCdwv7+3HAtld8r2035zKn5?=
 =?us-ascii?Q?xMhuwum1ELmZ1isYssMyB0NtN+792CSjosnrI3kZebAwI51xkTW9G/o693Uw?=
 =?us-ascii?Q?GKLo2BUDb4hloNNpj7MmAty7F71W48GeRbdHqJ3sI6RPQUfNF7qf+xwoLHEd?=
 =?us-ascii?Q?d0A3qv3e88KWFBQDrDDbf4yirMmhYWYmDXVYdmIK0ufrFmybOoLHP+WpU4MX?=
 =?us-ascii?Q?hK8jVd2Df6YLA9mamB1oWy5pLTQxLzBH7PdbgAKmyBHZ0jB/RVFa9zs6vvoR?=
 =?us-ascii?Q?WuNipMOMvHfrSKDSz002zjXrdVGpY875MWBguY923cZHbhLDaooMegJ9pPtu?=
 =?us-ascii?Q?uKKW8OMvPVfKLSxgyP5HbVjvVvbFTUi2JvhFd9tyJAdj9Tg6Kjxi5FxE+A+0?=
 =?us-ascii?Q?0Z1+lJBFfInNjXoJi4rgOikgZD0xu04aS19KJwDwl2nOjP685ts2NqiWdBFy?=
 =?us-ascii?Q?6ImbMpCrLQYYz8wxuTAlAESQ/w0IS79CEfZeujxN+r+856NLS6i05sqXlpHv?=
 =?us-ascii?Q?mYZtVRPvCrHQVESNS09e4RZGFoA9EMRbNulIUxkwYs9KGEZnWwugNEVRCEyA?=
 =?us-ascii?Q?MrsrZbbQuTak2ynum53LkBc6eG6yuu8dNvVCD7rMmjdsHoWcjLuZc5ziv33p?=
 =?us-ascii?Q?gjdBK3tvKR1kPXwiFfe6AnA2PAK/8K1cS1RNWNnHL7NIy2IvW837yxgk8+oE?=
 =?us-ascii?Q?tHEBYyfXWWCPVwcWOC1OLgcSLKOGKjTKHOSK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:47:40.5004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5216d2b-dda7-429a-ec76-08ddb92bf540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
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

