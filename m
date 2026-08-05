Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148E6C55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 20:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA610EFF5;
	Wed,  5 Aug 2026 20:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eC6kT4Xn";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07AE10E25C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 20:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC6VM5FpC9s/zVhgVCzv09ADWA4RzxOd/SFNQfb90DVryWDWFrh18rS9tyskFqqelon3o/+Ow/dJlIAKljw6xCwGZpEfdtTGHK5keWlf+CJx5Xi+6/cdMfgyu9QiTQ+3sdK1WqrjcwikxYSB7AGf3LrHJV3GbI4tAgIbnnphzq4jw3eMN7BLH+/+pMMZtdmw+F82BdknSwhVmQLaqclQHg3uG0pCxsMLvC1os5TgNztkwrHmtHTEanVxgudrA+7rT3GfrUfVAUdmj/W1o6+ZrnOUgQb+kucrPkMIc7VHIA0uh3N9z4zohLIAHfj6UHo8js0vIgvQk1llv0ZoS4vWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjDs4yTecgcY02v93ZoAh6fMe0dO4x42BEkFdCT0/Bo=;
 b=zSEhhBXaKdQx42eFfCfYF8j/AqotpYzJaE8pbkjZyJtE21WRuF1jFfP4O1pcAO4Q/i3uhwyxD6ObPRTYZ+O4GcBkxaoUo8wjxd7c1UcoU4iACjC3Zo/ESelJqBkEYJqv33eDfTniZIyZkK9o6D2dqdgsDSvpbnzFUhTBWQ/y/rDf168Hkk5xsUVGstNlsFD2rLBCceojwp7flh9w+O90fd9CjHhM9rvudzN8edR5+PFkK9JopYFl1OmWwMPAErGMYoKu0QMg9SUtChvkciGo1yIwe32ESiSMdYaBtBWmlIKE1SdgG7paFCutrjS3eKuAiyTD9yjXj7YlE0tKMj2SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjDs4yTecgcY02v93ZoAh6fMe0dO4x42BEkFdCT0/Bo=;
 b=eC6kT4XneuBD/woZotWRffQQJvleW/mFa01414dpnJB64aXc/7m0pwOVu1zYZVkjqBRmjMgTjW7Zst1S+1yeiKxy/LNQeUiQs6UjbtEXfqf5jTr934qT9ACKzYFEnQFzyWNepVI+a3NzS5Q8O+OUeJdQ8rj9NQi1X8/N+IDnPRU=
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:36:22 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::4) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via Frontend Transport; Wed, 5
 Aug 2026 20:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 20:36:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:36:20 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 13:36:20 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 15:36:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <pawel.sikora@intel.com>,
 <jani.nikula@linux.intel.com>, <jesse.zhang@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v5 3/4] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Wed, 5 Aug 2026 16:35:28 -0400
Message-ID: <20260805203608.148375-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805203608.148375-1-vitaly.prosyak@amd.com>
References: <20260805203608.148375-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|LV3PR12MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 135eca95-cdb3-4cd8-336e-08def3313639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|3023799007|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: SCVlEFJxjd11VrOfmca8rpgH4vKOlM05xt2nS0YNwhacyj2y6BS8H3VtW6wjp6L8BVUYxDLLq68Ip9ubeDIIWRmcp68L/aX9OZfkspY2PGHyXgiVYBoDPMfm2J7TOP/iMpT7j1EsBqXI1GdxKiMb0Yqcby5gB8G5FwWrS98R4EbccBGnf0jkQW3l8osmQtKVDKFcguO85m+EwGZEmI5e2Gpytac2bXax0e1A5XnDsN+4JDuH5Guour2OQHdxYqcGRNPzw95uv+bVshE9y8cnmyqrK01leppUap4e/T7ubvU/9uIk4A5sdxM/3Tpn0niLPNprXQEenG42MzGVsYHsX3G6rLBjs+m4DcUx4PHDR6lbeh7yLp8xpLlVDvZuBpNY13jitp63Rnpz1HUJa4HvBtN6IoxFFPPG6Ss/bxox+MUvV3I6WEGbxmW4FTYKqY2xhKQMrWr+VBUM72Uqa86/8GO3uOsbfuK7Skr9AyJq9VbmbDgM+T4np7FXZKcr8mH0uL4tc8MiZoZPby0VSX1wbEjsn2kHa9AZ7+44jW304/5VI7kTzEehhXmZQMndwOo1JhbvhxXpGQSR8BcmzB9Aod/QpO0aymazFDc6UvnhilpKO22j6DnvU6geVxk3nnMfEHGviuW3Opeje2FvKQx66bDuF+iktWKzgM7zFtc9JPZRuIIYx7O2tqEdLpLJRbulJ2oIdNwp4ZxzEYl3XUfyeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fopikG51akip/8qk9Znlp61d7gQNIkTWLNYUJCQe9An2aRG0OrsLAqilLZRSFGpujxFFDba3o44dnL3JZeLSv8hUCKKWNo+X0VKNLTafHTIm+/wKDs4uwRbhUgoLlcT9n3qvHhKw6MK07H6W83UjwcLHfvEzMiQpkuLd0Oqx6/TJhPhd0qkun76s+vs8Rwbvz1wnBMceNU5nSaPXirFCG2vkZkitDxBRqELCA+sZloTXAbS9J9I9gwiYz4lFHnhZMg1HrU/VWgUbTnOUaebavcnFLl+oamA2kq6RTJ+RevY7vs0w+P5RhJKId6NXrWroUnfB5UEldDrGw1t+qHG6blMOe2/X31zC0/u1oWU65OVhljxSE/A7lW7/FQNISyu1Ak0+2ypu4qDXB6147JuZM7wRchRHu2jLAA5GBqE5hViuDc8fHag2YrIkybJz6jbd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:36:22.1535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135eca95-cdb3-4cd8-336e-08def3313639
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213
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
2.43.0

