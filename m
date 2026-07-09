Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B20C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 22:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8923610E0E9;
	Thu,  9 Jul 2026 22:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RLZCowOg";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834CB10E0DC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 22:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaHdgfa/Fg/KHLx6be7eCzJMDA53trZ+3IanzsncVk99WHXv8z/EodiVKuNDZF80v6LrqfOfFNmOKpGczjVi4AYT7ENb1EWiBclgea0E5dMuMWKCJqjINy2o43qI2xUsMhKNFGgpqYl7hlSU59QX5fS3Vmu5GXVG3cxoJ+9N2pSYWvoKpeXqGGtANTJ1Ls1JQiAlFAN3Ipz2TjwiAO1G4jK3ghz9a+4ppGCbeUQJWf4X1UUaiBLZknP49XUSWjKTg8/LRf/6BGYI/D3Jtd0Q/HU9SwaSk5FtUBXReAe7ExpMWSPEnp0bylOdAwu8rHnDIbDBi9iaPd2dLeWl3f2bYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=ybzHnbBkSdkObseIveW84sOOZPctMxHEWsbJofYVRt0CO7kTeF3A4puCcqAfJIu7ytcqdmpYCbkuMjw4zCMzBgLL4D5VySDKUxkiGVDRM14O4OUdt3bzDoV/oRaymAs53FeZjAXFuItd898D2HdcT/60tQu37QuLqEueMzAV6hATSjBZWg6W63/96sql7WNx4uZQqQWQlGbwDqPaobQA24+tW5+z4SVKnM77fxlu64TM2+fgCL2OqMPvqnmKF0l9K6yCYds6EwkSm6TD7D5IU5ty9xoWJtSytfC2h8FzYqxJsjTDZAcKvMe3O7pNikKd1B9lQOPxas+3v/OtM6gkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6icIlmgQVWUPvlbkioiNAy5PxcgXJsh+7HJQ71rzRHk=;
 b=RLZCowOgVTq0/0sEFRC0Vxvk47qxVinfY9MGj1uqsOCABt7x674dfauiH2RRT4Z3acFHuYLVeSGH0cAvf2m0KTVHZ3JcxLV0DHeF7y8urBn/nmOfxQE598E5COIFg5aDEN/juTNsGIQjI2A4ROMVM/nvcQdq8rp7EBA/H989s30=
Received: from SA1P222CA0197.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::6)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:02:47 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::6e) by SA1P222CA0197.outlook.office365.com
 (2603:10b6:806:3c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Thu, 9
 Jul 2026 22:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 22:02:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:44 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 17:02:43 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 3/6] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Thu, 9 Jul 2026 18:02:14 -0400
Message-ID: <20260709220240.132893-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709220240.132893-1-vitaly.prosyak@amd.com>
References: <20260709220240.132893-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e105ae-ae9e-4391-d727-08dede05cf68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: QYwpMmcowNjCI8jVXI82LsOD4JJD1BVKMRa6GWfGs/D+C3gYBl8kOnaVz1UL60rmLT7mh9WpckefpkGsKat12L4B7tuWDe/RW97POm5+Qe4+L8yqFZk8JB7HZsgHWP04f5EKOF8+M1U8xWib5ljRBw4FBUAFgDWa7iW1pfF51Sf2tjNs+16PIcURNIOdx9joDqashHNU7WwM8S2MtEBCOBinsPK+EU1Q4ebP5pMFCzQWlYC6NKimbaJX56RJU0C/vGzrdr2RsxmCZFhet8a4ui/3wgJZ2w1kiVsRF8ET9qt4kHAd1iSuCp0vzmBNKaac/T+8ElYOUWPALLWnQFU0pEf9yTnaPwGgbWayXAOkOIKrjODAgTEs78uINa+O4IAuyA2WaqWZjDGbU5YCcec6x7vw6Zno5qQuH/u/PnBd6+Iz6yV/F13qZ01jEp1uACW8rLQ+SN3Wl/rGYGjv+0yENDZWeG9v7ooEvccV6YefT2D8rresVm6Hc3zM/BiI61YwvNwiyTFeojX4xwZebpNFGB8XGN4dCqCYmijDC2yT7fwE8Pk5foUQFgzTEXUmVT73IDR7XkQLNpB5eNNIcCq+Qzx1ketdb8GwhmO+5b8WFdilIWXHnzQDRA2n7NvzulHC3A2WC+EALvFpF26xg6MIbZpzXPBZnRX8oL05zX8ev2y6fBWoFzecbMHxPR4vXjce9vCtZ/iBXa6dMR6ZOhwsYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m9xHWyGEAtnwobBkgzooyTpw7FI7HoR4XAGR5EG2bW+ZGWlbobodAXIpqnDuSns+k6YRR//IEyBFxaMM+T0Om77XyYPCHp8gxa82geKXjh6AOk3TRsGDgakwMKuCxtLU+TtQHnAtyMn1S2PlANDT34T13XMZayQPlasDu+4njQ0PSDp/JtJ2Cg2lM5b5jdYth4tlGkcYwzfoQ1P/1cUYDVBFak8S+6smf2VaS02oZXlQx8tAV0napxBzb7ERuh5L4GmuYJ0v6PX+1Zw9B2TJtOE1ta+yvD2GZN//7h7Fkrkl/4MV1bYCwgfqB4t3RxmqUIBPXjT8sS3yH4r/L7O4WgluovMjPn4hq2mGmvYGovnyKw3BbtTWLHG1t8vArX5OQy1FZ/cJd2Mb4ht2OM3H6ERsKE0pQNGqU4PgjMa3lzd2uOFi6I6m+tNJ67AnDTjg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:02:46.8828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e105ae-ae9e-4391-d727-08dede05cf68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464
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

