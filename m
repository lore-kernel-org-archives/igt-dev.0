Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5869AC4452B
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 02:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C879B10E3DC;
	Wed, 22 Jul 2026 02:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZeaWrRwL";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1594A10E3DE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 02:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XW5Kd1ipnL1l40RDAyUoy4A7ejoySXQo7cbjLjnTrMp0qgLegupu5CqufIyr4NHM2Vdi2kQE3m1nBB3i1aa6HryXIaQdsg94QHIih/6b7fTi2cNOpsi7U2VY2BaQuBVsrSzFyO3QUyTx9p7PeD0yKEDmzi3GThQuko9Ie7HQv96nGSct6Xc6L35MQjkIb+Ns7o6FZZYRbsIgpjBE6fgrgVyrqfmDjlQPjnbpwJirtP8+J+gkDk747GO0te/eKQmmSX3W4BQq0SKjWB5l//pkxlkIbN7/QvIFBtL48CGMW6RGzGGyjEdENsfVHAuU8sjpX5SvOcYlCqMveWdiZU8+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=WpcfCVk4/Mgw0Gze0OStMQ8RjvQU8q0jl2ripD9/M2353WunOzTe722FHyMm02VlGz8OJ9Rn8UNVFIv3E9qvz9A/IAJrFc35hPmHRDn0Nk4NBxrWZdFwfJsmFP3j5E35+U+H5SrlsppK4fWttHPuGQEc+Vv6ed8pVriXSunzmOw8AAdwaBL5ljLGwLcEwqH6LisO8C+f30X+mlqQ15eTPt+3w6/WQqEwcJQiw6XzDdjKOwz1dfHylMzzoEM8DOHp46Vrx/z3Wj+9ftc87zPT5IsQ6qZ2xjFJc70PkbDnf1Sk7OQifSHu42yD80b2B4382YqtTT+M7veTtvDWeywU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=ZeaWrRwL8p4hIueJdox8ecYLAtr99AOuZC79F/UCqy1va1R4vSjq4+nJYSrV4LaQ/eep8uoFRSzcU7qWx6y/IWSNNQMpkdw7tDC3tJSQpoBpmaajRymPuiFEpRaAQP7H0knEoirN60h/t16olmS8/HPfe+Cp9VJ2TKUeAZvzlu4=
Received: from CY5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:930:1a::34)
 by DS5PPF8B1E59479.namprd12.prod.outlook.com (2603:10b6:f:fc00::659)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 02:21:58 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::29) by CY5PR19CA0050.outlook.office365.com
 (2603:10b6:930:1a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 02:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 02:21:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 21:21:57 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 21:21:56 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v4 4/5] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Tue, 21 Jul 2026 22:21:37 -0400
Message-ID: <20260722022150.191615-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722022150.191615-1-vitaly.prosyak@amd.com>
References: <20260722022150.191615-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS5PPF8B1E59479:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b1abbf-f649-4a60-1bb1-08dee79801f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: jX7RQYCiEu2cRPP8vgmJK7uHFyYooooKDajMv7TdwmrAWETM126FMoIKXqtg2v4NyTfJkM7Xa8aBeOAW0pHLKNeXQJsKyGPagGFv2vT7X3sUi6vFkWdSGKYDXBNhOKMov9aPyZ50yS6xiMY/f6TLngUdrJP959IwdY4zb0do9iurw7wEQCRhtoy1zcHg+L9Bw+QC7Z9U3m8DWWn+e11BKbaMCwlowguHZ7ieMPSvqiswwOKiYdn8PqcqjL2GzCB7z6LFDPJCxRSE/N/QlkMzyzRugP6wEwP2Ls9WnPZuQqYONjBZDM0drcNbafRMdT4u6CDFlE612iSvKd8W43xbSJ4ISKrsLx+JyT0RK0f/aWBJnk1l6b5UF8fjJe4jdYkZAutxrjCW68uI9j4oa1/M2UKLbmnSAXc/IS+2guOZX2LlECKk3+FQqSle7CM8EjYaAAPijE16EUAG9NQGgPLQl5p+Y9QQyXKkEqRp2TF3c/9Lt0qaPURjSZzkJ7/2Iq1M/js+FvjbB3RNVTQladtHv8RUdi+Jxpuwgtcsvp0KkAM/YUEah8OAC6yJKlqDzT4L0VGoopvRgRojwyQVOULkQ22+c4E7NsMybyaiDxZDnzmWeFspgNVh28p0RHiC77Cr8wJ4iYmAPY7Uk36eR1B9R+DVKSvdGfYxNTtSfDTHirOupyderELlFvgySE0fo8viQb1JOKYCbyJpVVdA5km0DA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nn6E8/Xm/XhEU0SgyZ3QyTUCHfgvqd1IWD8v0y1G7EmI8fiDe6CkWAIK5AxiddtmQ/FTCGocLdZ3UuraqiemyAEgAghTIM3OXzT95y30HwQMVYbVg6SKfF9ry1SBDC9QYa3oqFgZzfvAhAnEgaDI48oLlNnQC/k10ifW/OV+9dLpX1c/LM+hvYbO45ESHvSIgn5SvWkfI0lv/dY6sz2B+gzWPxt7iFJR4DRwmbhBPBVP00QitkiHQ8DX3Mm/JTZ2f/KTjr2Q4LhtnO7p7Vygv6C0Es4Lgr6CaHssYSLprKlrrJZNL6OCIVvY57TpaQWQjkJ8ZRaSdmsOvoRrookwxZCMKzFz0ZhX6G7QKHAfd4JGwiR0LL9r8OfyQdLKkBjANElmr5RO9Oofqxn/9u7+kKGkwlv/R/AsAP6Wids3+xjN9y1sVC68415optDPxYod
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:21:58.6389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b1abbf-f649-4a60-1bb1-08dee79801f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8B1E59479
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

