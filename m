Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD10C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 23:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4558210E104;
	Thu,  9 Jul 2026 23:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PJZq8ufU";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D7210E0A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 23:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFGjhlFq+bkJPlUDsIwQN6Uc4VJyoXxiVNOAc3uHZgGlBmKPCGtSDGOvy/hVdMxdTy2wqov08AZhsdgYCTx+0YP3UhtRFujZlWEGzM8aIc/M2PehREMorriUYMP2V+dgqj2D3MleErdmjpc91uQyNev+Ha01c+Cau1mGjld6AfZubeYuzWG1vTbsWtYuVIHvpJFjjKq8SVS0U3LHR8tDWKF6peiuLON3XuIhAsWsg/pt/6aM4Xi4/70zLLvWLJNxNtgW3N+9qsz+2H6fxV0bsdz9vsWKUT3lIhM83ROzKo2+46LAVJErTrNxIa0fbVXeLZuIhzy4M0n0ClsM17xsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=Dc3PJ/R/ocHa4Q4TGNwuMmHv/GVqE3E7QV12mLYjm34zalNecWiehfnnx7kPArWVisqxLT3NmIP/cRDWj6VM8rreWEtBRASaaPGhB6dTNViBBfaP7Vfz/n6iTpb7XHe5HLgxpCe53j4bB+SwmqjmJR73zpBWU0kzrEb+loycsq746MViOAGsYNdYZg8t9xux3rL27h0JYIMINMrN+MDiL1NqGRMuD4E11uUn2bHWSLC6YqzIOoFfK3iSdRWYZo5KpgSxbMLrmej8nbjWjsLY9eXONsRQA8LkALQsiEeMd++6ysZleu9v1dppAWTgEqDMpNbPHQALoI1B01U2hJQA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=PJZq8ufUDq1ZRG0bM0eawxNmXb3ofEdzcFA9TICzO1akh/b6jYB4eb3GA8Qp441Q9uzfqPv8bFnwp8bNkIWLXCd7N1rfaRFXTYLzJxtXjx8Yu2ArBRVgjpPJhqmcZkuHzUiIT2bFYnziRoOSJHhwmhOX2iyI5IBww9i1B1O4e10=
Received: from SN7PR04CA0106.namprd04.prod.outlook.com (2603:10b6:806:122::21)
 by CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 23:39:46 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::1e) by SN7PR04CA0106.outlook.office365.com
 (2603:10b6:806:122::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 23:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 23:39:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 18:39:45 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 18:39:44 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 4/6] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Thu, 9 Jul 2026 19:39:12 -0400
Message-ID: <20260709233940.160424-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709233940.160424-1-vitaly.prosyak@amd.com>
References: <20260709233940.160424-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: e6271492-fb80-4fa9-9725-08dede135bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: iXZmmARf+0MpuYkqYFHa0PgBIoM+DydY5yVQraPJ0Gk/6DWXcVv6F0Mj3TS3QZXB32VQR73WzfSoQLNewz8WFE9IYkx5dlWuWy3grO89kpJYX1eLnrHvwtYGedWnn/v9rTkIqxx+FIX/d8dzfqd0XRMpfTMU4fR47qYI5e8V8rDlnP5m7+K9IMsnhhFvxCDAKgOfUcp1zuql1EtWv4avJ3zTT3z1PeC7d7dHnYSj/zTPLO2ab22JarDVbm+elYKtGasuGXhskEdVeVpvQF30UYknmEygP23wAbMvpDTY/xXVqWi4pcq5u+r4mqDpiL/uK7GgZqizVYk1ekp0lskJy/OaKJrBkg322cduWYU1kuWX/9gWj8Ctqx+Ljngwv6Z4EngfUDuKOO3/w+/3CUKTSvb68iI0avSlv4J47RvEOzmtzthXylcIcWxlwFfVrfBgdJdce//fpmNgl/eTHizDz0dH9BuhpQ+/FbgHkiZPvjz27DmtvZMcrOry0dNrFmIUcPWZ1mPt4/c8YvBGPBXxHjp2OcdiyT/gCCstfTi7Om1CPwgrIO6YvlsHU5AcuHcPkrFjSVTfDJ/rdiXs2fQwgxUhbK+xacvRBk6bOX+fqDEgDpWl0mUUleJLo0X6aoAYcFtR5LFoGensVhdldu9smIuERRF8ebc1sHFjUwXLaI4MquBe9akyCNH+jIbMeAHoy+ewWcXfIsVLYaY3foh52w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FGPDFuHa5w+E+SNMUUcf6hfS6LVVXHqoiMnGsk1rSCQsfwXwm7ZCxfsl15d1n/nG+eNqWhhwTd+xMzlFPhfYJzigIa92nPHhTfxE7qVPzFbXGCvxIMUVc43dbQFMnDwYSLHWYwF0vK5dwd56gFhcgNHPwNrVbVmYvBPFEfs0fdqPIN972vyjnOj+J6mc45sC4gUO7d8f0JG42I7UEJrOzk58/rc1th5OhkirjHeG/Pdvo6VI7RtVLx+oXajUrL75S/QJrQK6BI58nrZNXi90fkjUBmsNmoElrS3E4Dby5BOXONRiY4TUwMxZWmrm/OfN10Ojk4aUR06+a0biavNjyGJ6LKMTEOC68ZKq3Cmijn85OOGL0vBrua/RcwdPeY2chrWnxrWuybWK2rGYyHRGZ9jjLgmSK1YZedkzuO/xAYPc0kEqj/Z+W0+ijbcNbtnj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 23:39:45.8238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6271492-fb80-4fa9-9725-08dede135bc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
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

Hook platform filtering into __igt_run_subtest() so tests automatically
skip subtests based on platform rules without requiring manual
igt_platform_require() calls in each subtest.

This means tests only need to call platform_filter_init() once in their
igt_fixture, and all subtests are automatically checked against the
platform filtering rules before execution.

Example test code:
  igt_fixture {
      amd_platform_filter_init(&gpu_info);
  }

  igt_subtest(my-test) {
      // Automatic skip if platform rules match - no manual call needed!
      test_code();
  }

v3 changes:
 - This is now patch 4/6 (was 5/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Change-Id: I2a3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t
---
 lib/igt_core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..60a432888 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -80,6 +80,7 @@
 #include "igt_rc.h"
 #include "igt_list.h"
 #include "igt_map.h"
+#include "igt_platform_filter.h"
 #include "igt_device_scan.h"
 #include "igt_thread.h"
 #include "igt_vec.h"
@@ -1572,7 +1573,6 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		return false;
 	}
 
-
 	if (skip_subtests_henceforth) {
 		_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
 					skip_subtests_henceforth == SKIP ? "SKIP" : "FAIL",
@@ -1580,6 +1580,22 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		return false;
 	}
 
+	/* Automatic platform filtering - if initialized, check if subtest should be skipped */
+	if (igt_platform_filter_is_initialized()) {
+		enum skip_source source;
+		const char *reason;
+
+		if (igt_platform_should_skip(igt_test_name(), subtest_name,
+					      &source, &reason)) {
+			_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
+						"SKIP", 0.0);
+			igt_info("Platform filtering (%s): %s\n",
+				 source == SKIP_SOURCE_BUILTIN ? "built-in" :
+				 source == SKIP_SOURCE_CONFIG ? "config" : "env",
+				 reason);
+			return false;
+		}
+	}
 	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
 		 command_str, subtest_name);
 	igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
-- 
2.54.0

