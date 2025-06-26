Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C714AC77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 06:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDB610E26F;
	Thu, 26 Jun 2025 06:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zvcnkUH1";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAF210E26F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 06:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFqhECFd6LKMJdQwS6MCUG6WUuT2P6igHyhxrU7hs5nf4PChwCzS4W+4o+Il1c9QO+G4REPklnxKMDv6OEHlUIQCgWZoHmipfhELtltrzcAEdJwaIHwSfjg1LDVZcmyZFDuV8Y1OxnTiFC4BEtUpM3sYohEPCNHoEMTThSnkjb1Mo26Hr9CGEspg0q3nq66YxRzqSgt8nbcrh6lI9QkwceiVfUXQNG65SjiEZgC2HEqaYjIGwMMnX89TBkhhU+S/E6hOqp2yN/baVRlhMhGEODSpepshEFkrJGG9sCraEl/gQD2JlTqVWY2sE7cRk+kpsSlEg6SSr2FhxBAW8yD2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ot9B6SAIzTWVJ8OC4tmL7D+nps1htqf9FPmiI8WwXs=;
 b=hSW9KfOx9g4ZuR8FESGgYNXHhwJ7QaOBefJbDcwaW7nivj5PlJu0YVZ3/pt538IttIAP5yH8IoyJEohduxEDW2oWqcom8nqoBZ0t5SliZDXCmnKceoKIClf9p22JA30K7NRm1Y1Ft6y+b0ku37c8VM9OswcAM44GAHkE1Mi4fWlyyeRVvdRm+0nS/nneS1lIYsEryZEYNUxkLy9rCC7/pc3TNVLuAIo1tWzoUkdhVIRLqhIMt+bEKzSCx0VoNfjET4tUlPUIX5xDMUeDfgFxxJHE3bejLmi5yhL6xK/ilVgPAr979gLlUn2bG/VXOdGqvmfAe6EthPKR5pBgwvgyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ot9B6SAIzTWVJ8OC4tmL7D+nps1htqf9FPmiI8WwXs=;
 b=zvcnkUH1KfevVkSqWRdxN0ACqEkzhKjwuqpRYgtKi4QGMEn+gkc5hmOrjYxENTvyKAPiA1ue7iuu4w49ulWd4iZxuVFULe8VlwJx7pIA3aQuj58WiSwO+41AQjOoC5RIC3wI5sX+Zmdy5Rk5qHs7zFwC2eQN30KhmeVPrtT6KFA=
Received: from BY5PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:1e0::37)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 26 Jun
 2025 06:01:22 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::6a) by BY5PR03CA0027.outlook.office365.com
 (2603:10b6:a03:1e0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Thu,
 26 Jun 2025 06:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 06:01:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 01:01:20 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Jun 2025 01:01:19 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Add user queue test control via
 environment variable
Date: Thu, 26 Jun 2025 14:01:13 +0800
Message-ID: <20250626060118.3641808-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e4bd58-948d-4545-a6fe-08ddb476e047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lE7rqu2tiLFHJKnR87TvGxN59UCr7ut/3jcs+gr4rtfynndagx69QDi0zykU?=
 =?us-ascii?Q?Pg/zDEuGb79laCt8ILMx/GfqP14uLfS1ldnOYg5uJ1Monsq+cJPTq2VqP4iO?=
 =?us-ascii?Q?AQL0YsiaUygrPyKg5zDJ8yaYMTZN+EqU8k8VO3Hy20A+e+3SUN87LAF/BBX7?=
 =?us-ascii?Q?2rSrCPvHhgr6G5xXF1o0XQCzC1S8c3eY60PxeNHF2pSPHpxaOVhM0O3tZS+L?=
 =?us-ascii?Q?dZE83hZDM+yIigfIfCIrA28RMWkAdGg/UmMDJ320QXZ/beR55EtODU+7B8jy?=
 =?us-ascii?Q?ppiZPrFnM7AtHs1yOLnPnDZ4Ul5dRf+PD4N3Q2kxhVpbHRE9tJv1BtfD4/z6?=
 =?us-ascii?Q?VN63wmYDGvJb2+cjUyTAWhvAj5DB3senQzKKV7icJ68jl5MKxdb9N2oSo8qk?=
 =?us-ascii?Q?W5yaHuY4aCYmYnaqSjeGcIX5XghAkdF2jkHpc/b7VBVmpQB6zK4QJpEMiWm9?=
 =?us-ascii?Q?cO0y/DIE1KjHjzdPn4DXH5dZbJNoXxMDcJBV9EDxv7cBOiZDqCvKlCuFK6bK?=
 =?us-ascii?Q?CFUW+jIQadSHHyPVgntd1v22QpLKUshy6YiSkTD7D+flho0Q8gGttdj+UMcQ?=
 =?us-ascii?Q?4KQlrI2yheUs1vBNeetrMkzcBtJxWdxbSAFYwb5FsxlshHHdNcxTm55/7C5e?=
 =?us-ascii?Q?/h4uMyPYIGIsWdQ2EHXdV0ismYkX7iOY5RrZls6iK8vPsefjGZmlx8Te1Omk?=
 =?us-ascii?Q?Ypz8KqSyRPMun42QEbVu6Sq/0doid6NaMYg1oNO6KJ0Of+OW72tsblwTb7v6?=
 =?us-ascii?Q?OasE8ygYefBxWBRgEenNAJ/tuwAKXk+LpxvacFLtY08sDnnyrE3cWm9AlYQ8?=
 =?us-ascii?Q?LcXrkTVpznXVYlTJ0vThW0kW58MQXUK8PDsLbb9FJLBtR5A9bvHrRT+asIgN?=
 =?us-ascii?Q?kgp8er/bP8AxlzKpyVkgm7Z3By0wCxPY3yN6EuLJBdDB448PWEMtLmzzRTar?=
 =?us-ascii?Q?bFX2tQuy0mZjvyWpzZNNnK0UdcZTPbGgBnjXoypehkMwxwvseAK8Pb+ueP0i?=
 =?us-ascii?Q?AY6kw5KZPc/zw2LPUHu7s/t6YVA8cUxPSi/VFgESEHLKwjCx6tsriwebTFta?=
 =?us-ascii?Q?aQlBX8OLNfVsj0rJq9b4P9OH1d19cU943H4+o8iUKpaN5GZiZVGkkUAfCMB7?=
 =?us-ascii?Q?YbYBDgLemEZEFa5JSLCHrRBweurYGg05CpCBBTXp3l0w9BPbK2VEHaUtQguL?=
 =?us-ascii?Q?8MKDgD4zWOQJ755+MXrnBI0kuMvOzX5qMHgz73yg6cL/RYckQ6BbkhjmhM4H?=
 =?us-ascii?Q?f0ZagnqmVz8V9FvslrXrvOWfq7bfjSs4ov/mNXQUMXn5CyClAZIopI61KU83?=
 =?us-ascii?Q?fZ9d+OXsZrRECbgkNnBNf4harjk51oPfqm0sAZi24mwiaYSaJGqz30A9HDdp?=
 =?us-ascii?Q?89isHCBnj+lIGi1R8yUzJUKK2x9hyOJ80EQfipckRGTJsIUa/K8VK4+3r9sP?=
 =?us-ascii?Q?K1z9yHRswey1s3X7zFUIK6z+Mao5IVb8dkR2yY9CXWHn/zUZuA775tyM+H5U?=
 =?us-ascii?Q?TCCuwQgENJqcoZ6spkL9Lh0jxQnxxsfiuQp6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:01:21.6828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e4bd58-948d-4545-a6fe-08ddb476e047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892
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

- Add environment variable check 'AMDGPU_DISABLE_USERQTEST' to control
  user queue test execution
- Only run SDMA with UMQ test when both enabled via the flag and
  hardware supports it (userq_arr_cap[AMD_IP_DMA])
- Helps disable user queue tests when needed while keeping other tests
  active

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 39690419c..9eb5c7599 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -700,6 +700,12 @@ igt_main
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+#ifdef AMDGPU_USERQ_ENABLED
+	bool enable_test;
+	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
+
+	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -820,7 +826,7 @@ igt_main
 
 	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
 	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
-		if (userq_arr_cap[AMD_IP_DMA]) {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f("cs-sdma-with-umq")
 			amdgpu_command_submission_sdma(device, true);
 		}
-- 
2.49.0

