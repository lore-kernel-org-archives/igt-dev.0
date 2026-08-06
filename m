Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94EFC55ABA
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 02:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF410E264;
	Thu,  6 Aug 2026 02:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZzUgFgSb";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6387310F094
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 02:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgM9YzMFqDuU2wplcmwWz2SV4FYIWrHFRosG9fy4nPlYsHHFCJqvVBcCZU8EU7HQwB13hy9Kw86556uvwN4bMjJMlLOHdBhdvu006XwMCrdKPOWu4KIkqmoTHB2+PXMKy86Qswtn3IfpEkRnqlrG9WBMaD+3H/ujvOvJCOBGI1Wo3/9apoCaNdRZejG2pcMa6XiuvD45a92IBnuZDowwWX4EKYbbpYT5zH0ovmEytvbeAwHvXaQM7toEs8ybRTVb4MRNyjedixxhKxioVGlomEHx/2xPjVbjsc3MeirfCngEC8BlE8LFOVqa30TV9JiDfLGnpKWWJ1cnU8jPl8iwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJH3SvW/CACZfl1eDmep7YwpAU6zwpGMOrdZgqhg5Ng=;
 b=yDjVqulFResDK8Srub9juYmqf/xu/8+w5E8mKfZMd31gTSU1s7EbqIC9wjX/mbTGxFeGs7m7Tq/42tvrZSpFXR+lOvoX92P37lJiolt6gntPxLJ2iHeQopo0WeGUTbO6imspFeUZBn3+aWIFtjeKnBucVcHjPwj/0Ns0BWn4Yeb/44Grtbjr9N6obbFoqmZoaGHrxmwdhifzhzAojgg6zE45/dOX1Io8kxtYLY2jFr1n8auRU1GQs3CWXfNg4pTvQK1ALkBnBoAYM0Ety+mUKNggw6UaftDuPtGqstW/8ipBh5mO4MiisOFS3mSRX5sP+xcpT5MmreKQ5sdXcTopsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJH3SvW/CACZfl1eDmep7YwpAU6zwpGMOrdZgqhg5Ng=;
 b=ZzUgFgSbFDPJFDN/bJ2iwsXkOmw9mvHVi6Upzdd9qgI9nfbkSBoKJqFUVxSSca7Wj3j6pkTLS1xIDszLmboCmgbbGLbpyFcE1Qr3LsGXFIRV+cfFiiI0FIapAuxLL3l66hpT3gRfnCexK4srvrDhmN4zgeer57bZnYJxyja4RVY=
Received: from MN2PR18CA0025.namprd18.prod.outlook.com (2603:10b6:208:23c::30)
 by SA1PR12MB999084.namprd12.prod.outlook.com (2603:10b6:806:4a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:37:34 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::63) by MN2PR18CA0025.outlook.office365.com
 (2603:10b6:208:23c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:37:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:37:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:37:28 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.kozlowski@canonical.com>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v5 3/4] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Wed, 5 Aug 2026 22:36:12 -0400
Message-ID: <20260806023718.204279-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806023718.204279-1-vitaly.prosyak@amd.com>
References: <20260806023718.204279-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SA1PR12MB999084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6adeebf0-22c0-40e5-4ba6-08def363abd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|56012099006|3023799007|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 6t5iNb3/BrbO8rzlG7EXRlPkcrkzFXlGC7jSTkkI4nx+AvBKXTyG1txv61+9Ty9O8M5yKCsnJe2NP5Lq47borPzsppJocUnduOayabR9Zuj9Te8X6g7YlSize6TJ2ls8oRFJV3i+evUgj8x3n8oyTkFTHFFWO5MP0nRqbBnFCfR2Gt/3eQLGxQViUV64x8EQJhMqKAw3LAgbMiHz2OE0YTp06D69YywM0rox91JDZdhjuNKQ2bDZxbcVJ9stmbzCDRH3fh3vWK0x96HupGoVMGXK8UwSqT4F0qqePTaK005eZBFyvV4zRbsBhR4uGt09b0MgbYTX8nZXm3r5iNzdGCEt9w9IElaH2+YXn2kI9pcMBXYPO+NO2FkZqJcZFyS5Wa5VkXiGyc8vnMoJQup98TCs8x2HS9RgIWP2UNM5oAueBHvex5zP/xg40vsl1ymou9ejmxWzBgCruD9CcNKWUwL7fp5JyOfumJCjS/ZW+NSL/nmhXNBsQaDWRTRwz7OGa9cjq2p/HwO1VYdb7pjbupWVWZ+Qs6u2+Pw3tKQxQSBRsiaSoippyqdHckl55W/i3nsLd5c9LtEIKjlMxXCuB9y3Us7bZPtPGnhcH6LLRd4VlrVO5WW6ZbhuHEPhK4mO9Bg9HsxhSApbqXkpgDrGF6NBhxms0WgNj6DQnw18nsqrFjYNRqFoO8m+GFFHIfUp/7F3zUmijalE5E/Q6zJkEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K3ifKsvePpkpIWEMNV6eFekIFMj/qh0Z6nTEna+XLv0pr2FuVvumdHeJSzjhfsBultSY6yJJdjnBfu1ZKlP+8oKrfMLnOtf0Dea06HgkIIzyo7/J6cBU7i+UHn/v4D2t1aStm9ON/UdtwIYQSQmIazIzHCO91BMfw8Z0ZM5gMWbY+cb4HgccqE5nqTdpHKirIbOeLdu0DqLVVs/YDgekzNCXFs6AhS9EMsKcoWNaEyN4/BcOy5+ztSyK0GQy2XiCqGPNigaugoxjHksyibkYBZF0ljzBYMD+lpyWufG/RlrfnqkCiABIq7iyAjaZp9CHmAbYgmuZV1wtsvMrAP/7h7HPSw2/YywwbB0/Eok2a2V3S6UuhmP6Vc38frpuF+unHd0sT9hes4/H6Qesj9Vkt4rwN2+G+VDd44XF3ACUZloV49p/mxfUOuDPkqTD5gFY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:37:34.3147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6adeebf0-22c0-40e5-4ba6-08def363abd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999084
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

  igt_subtest("my-test") {
      // Automatic skip if platform rules match - no manual call needed!
      test_code();
  }

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
v3 changes:
 - This is now patch 3/4 (was 5/7 in v2) due to squashing of patches
   per Kamil Konieczny's review feedback
 - No code changes from v2


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

