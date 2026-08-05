Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8C5C55ABF
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 20:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7272410E25C;
	Wed,  5 Aug 2026 20:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rktCSzYJ";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BCA10E25C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 20:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blSxTEf9rUaKbcdy2KCFqumaqTiAWZV8GRupOyNI3coRPdrQWmER9U7oTNh0y6yS2G/nTbEi//GE3h1sLFcRBG92JkrsqbdK+67OOXH/Usd5SN4PHg8vYqFS/nf7bJYGTd+3FcEZjalootOhnPDNiEcs4O6jI45AEjkMi5fIpaGVMsvRX75s9MxHx3vABYRju4DMHLSoLi55cpIukHhui2pC3YSAJUP3tC9+W3qdgsgrXrWvtUJa1y7KrHwS3PBaCaxMN5BcXHShmpX9xFSwTtQkAqMPRz3oo3Lpf8hNUyGgADNb0vbYk8PkHZJtwp1qmFu33/QeYmvP1fqR+5KUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOByflKgR0ovrbBXulc9o2y422aHMnRxgRAWMCJMYLg=;
 b=siLryRBUjQleYqZuXxOXTY6NvRV75mbASYRfUFo2y17TKmrKRnX+GYW12QCD9GWUJstHuS0UmGt754Q51fCgmlbrSUUekC8tIX4vADqjrFyJD6gcdsnuakrgJ5PKqSiqVmCiGrheJVXF6ENhSNdAHfcxD9lrXJ42V4/aNiA0uszhOJXvsWWmvOQXJJTC9HRF2sDOSXEDOG0gskySbNAiyMopwwlkx86ijztYANYgL/Rc89EUOM+HUSouHTRQY/oqJm+HjtPNiTznb18SuySSyL8n5tw1R5P1Vz4SN+SQM4E2QHLEavC7xX6qZCHvBzjh0c2tzobIrwHCG4plJs2WMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOByflKgR0ovrbBXulc9o2y422aHMnRxgRAWMCJMYLg=;
 b=rktCSzYJzoR1cOnR3KRRgX6foxbIWWVSNGxlJ0kHbH7/D2ze7eWEIIsZM8OGZ1QEvHOIKE9PnqZ1nKkQlQ1I4qmuhbwczz+cLtPEXdNbg1KdFCrjKkFfe8uDZtI2OEV1lv7XRP9EzfEzDzc57nNIKJliENZIXyYl878zOBCKLWY=
Received: from BN0PR04CA0082.namprd04.prod.outlook.com (2603:10b6:408:ea::27)
 by DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 20:29:12 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::61) by BN0PR04CA0082.outlook.office365.com
 (2603:10b6:408:ea::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 20:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 20:29:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:29:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:29:11 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 15:29:11 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <pawel.sikora@intel.com>,
 <jani.nikula@linux.intel.com>, <jesse.zhang@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v5 3/4] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Wed, 5 Aug 2026 16:28:47 -0400
Message-ID: <20260805202856.147163-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805202856.147163-1-vitaly.prosyak@amd.com>
References: <20260805202856.147163-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 099dd64e-62d1-4a6f-4152-08def3303627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UiUyHLPJxcJCUGqUdr2pgJNQ4QJboEfJyu0dAwxCu0kq3vJxNBMrUt/xDoUKdSuBMPz4JmKgL1teNfVaSKj9+KLF5uxVAlwPImv6dgkc5JRLCoLyMsXP1g4L8o2Ob/micdqS8CtxaS8cjJ/MECmweNZK4JeUTz/ZWpD5jWYg5ZQFzsYospihEjcReh/Wv0N/cKZtnuUOmJDSoS+dMDrckLpoYotFhcR4UHDD2qw04hqnakon61cMl8BTKChkwxUGgnUD3hsPp7eYSxcoeQy45ix6iYRPyDo7tOlXmsT3/bEbTKYXV6EfVeURi7ddrqiWhA02GOdEDEV1X0b1biNJ+WnCrCB8lmYuuQzRhuvdNwaIWNhenkjJwKUE3XUYYMxpI0mms/Ks6gr8Fj0u8CHltEOJb/gYLvcgFnOAWo088VsNBZU533pBqMT5FD8WgAZ9B+TgygVrdD0JJmdoAQUm1gKXC1GMmdMV7RWx7I61g//Iaud+p+S0cba6NwqIbwn1ZHBFgl0kPj+5SMI15trm9KlXjTqLonf8/FSFII6GyD6rRjkw/br7I4cp6oWUW1qgOmipLrk2m3CSwLUTAm+w+WQQe4GMDw4j+uHISSD9PcSj7Blu9xoJrYZ1MtfOCBiDN6uxFDIbzz3hIx+YRucnP47bTW+XrZCgnjvTpKkZoBdE9ds+dwC7+/g3vQ8GMeBgoC+ekY9I14ESvh6IqI2iqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iSwbEy6pqsOxuYx3Gwcah1oqvjiRbrxANFtUjob49M6LSYZnkfX3t3Jbe3LbGmTSjLPo5gAdGBxqMhwqi8r59Ax16ksZsRYhZec4Y/swYcJ6nItekMsNzfbvRaeIgLQdi/+cPpvvnzVURKGG/g/liGAhWzBuPDb26SQofDGGnn+Wx+AceC0TOUhTAjbOB5kn1fZGE9SXNIp0MIhGx7VYqO+oi4F0RU2o20Z7t4kweDNBhyVhSap1fkhlskQ4Hl4LmfosNjiXe1dj0fgpOhF+IStlBOlcY6inwLDByRR9GFXGoypt58LfXDULrCWV8wna7yrRWR7A1nTpzetftmDXvulMWF26p6pvs0Oo3Ubmm3coNtb2DJDec2nr79xj3VbFYHQ4L2WbmLgX/9o7hqjsZ7NhgSlnaxL5ZHa1CwYa2rngJJVsIODlJVRZKLYncys3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:29:12.5269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099dd64e-62d1-4a6f-4152-08def3303627
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
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
2.43.0

