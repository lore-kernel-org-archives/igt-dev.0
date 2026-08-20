Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E10C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 01:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095410E10F;
	Thu, 20 Aug 2026 01:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Di5qP03+";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013019.outbound.protection.outlook.com
 [40.93.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220C10E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 01:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKYIYcYWC9BgBpYAqOIQAUseE0Q94d+gBT9Rc764mFacHyp3oFcJybylOny7SpaD4oPNJHT8TNhiPpfxZ1QGxU/TbHDj9rFdK8pfmROeLr/MbqvKzfIfcKNTii67AB1ITy4Z6T61gE16ayBAV/braZspfxRMfdgl/MKgQHkCc/a/YuVMD7S6Tymx7xLcKzKis/o860+HURw5vIJF7Bq6SiPCZep+ojcgtmhCOlooL4FzKb1QVVDKOYRoJiN6b0qs7Gpjv59ZV9NwLSM6HkQs38C3V0vjlPdGNmnC2Ec6TtIz9hhRe3CGBhqmCU00bcCCEBZ/yEJIl070ez/hAK+KfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhtgspeZX+1wHc6plofntNbYs6rlA/JqE5xQ6rtfjC0=;
 b=uj00ydepQrVfgkP8150godxHvrW69thWZ4PQ94tXJ0Y6ynD1xFJfCqGP3blqCPtmN0aRXQQnmZokQfZLtiohUq13ipiFoCdNQZSyRGmIp7rEfVnJtvVbfapOh7icjZ7vTf/WlxB563am0OZKcvZMIc/1Djdnuurh1PiibDe+Bo75+G1mx6QzmkhzfktHKDP30+rEHYLszhSbpituCXUieZ5PLoigIoU/fkTHJ1W2VYwlyK8nTLRKDn5xAG6gQk2oAlSE1Hrx/ToPsmPCk2GW25lygUWI8v/7EE7YjO9Xll6SCLj3MYhJfFkJbOn60ws67YuxZaKdiS5yGErkaZpvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhtgspeZX+1wHc6plofntNbYs6rlA/JqE5xQ6rtfjC0=;
 b=Di5qP03+s6/kjXD1D5ObYW0EvUERhuCjyQwrC4rWsZJ9lhl5Tz70rabMtwwHT8uCnnO7JgZG9XtNJ1mcLywZEyd0DOYl2ZNUKZDKWF/hfrKsKFR8PKRfIWxoAfX9EbHApmILZ0t69YXe+a51JxMOOqw5NwdBMNUYjpkkQcOcUmQ=
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by PHXPR12MB999233.namprd12.prod.outlook.com (2603:10b6:510:3cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 01:28:29 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::ac) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 01:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Thu, 20 Aug 2026 01:28:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 20:28:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 20:28:27 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.kozlowski@canonical.com>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v6 3/4] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Wed, 19 Aug 2026 21:27:18 -0400
Message-ID: <20260820012820.129589-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820012820.129589-1-vitaly.prosyak@amd.com>
References: <20260820012820.129589-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|PHXPR12MB999233:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e849b51-eb0f-4b9c-2587-08defe5a5696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|3023799007|56012099006|10067099003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TKPh7+Ta4JLd1CxAweZWoPdFmhBOZX8LYkMgxHXDD0k7NTcLANvDBUCkRA/UH4GJlWMQzOEvMHuotO8nAJgNx/mufpZBn3ylmOC0TVlf056no2G+Ac2RItmP0MQRGKGdgR3U5JuZV3EUYaQuk1vUPafaOLQCWU1zwaH2v1vr3wyk7HaWCy/zBhJO10GeiZUb2t92O68l9344seFfkRmGPc9Wx0fKGkifmnViQRVmGQodXFVKogj3qVh9tYyeHt+3f1eThjFZkMKTHgGTjLaRoLkYa00px1CTKxmLqWlV+VnpRn1jy21bcTIoHzp2A0hOslB1Ery+CmObaoyNVu3N/ZrgTj3mRbGbni9GAAXekuHkbrmLPsK36YXjtzGg5ebj5AFjlYAtguyB74SXmxH5FBDavunNmeKAW0XWB/jThBMhpYZ7/6Q28rS4nxuaHBVURiHYjNK+pgPwvxU05dJ/gS4WkbZFXpT5x0g0+O+D7o5RTIvkwLmitD7TgCETEWOUTBsfp+dLsgUuOnkIToFY2pDzodUSoMNBeocFeHYyPZXOlz2qn8dZ8mSRTCRVKptSJsabGXA3Bf2RigsZPqvrXpqS7GL6Bv2q5QQ9gXHCJ2Vq4tT22wntgbCfP0/9l0YUikGyEqYkhXWMUIlpGIK2Htpof0dF3oOwupBLIO72/qTE8XjDHC8vIciUkqEC+ugM9WZQUIYSuE+YqW71oac1lw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(3023799007)(56012099006)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h4Ub5pDsMV/bTXJeM6CnOkx703rL7j4a3k4rIKXfJ2F6AHUvCfwGfVibqcNitzN/YwJQbBkrO+PxENyzGEDp3DSKxN0ezbSRvQQeyZWy7hf4k9CfYLOJid/Mx5C+2K8cJEE17A7eFwQRNI0EpVWtD9hj8kkCbcwJT+NIFvQBebqU7IW1yvTBRATWfQ6hoTdWgEY0u4VpNuildtPRkOcAbnnOriRQ0ik+9DAGppGdqq3fpLT8CYauSlBKapr3GtF1cuebmBxCQldWcTv6BoWBL4KEF+3HFa4Mzf0+xW3Cr3J+6qqoE9zvg9bk7gEvEIJA4dxXEin7FXPNXPSw1rQZocIugo8WpCM18iZcJop+ShxK73ueIIgK8lGf32Qc7cgkhDOSqVM+csTU4vQ3WST4eGpAdWtUkisyk4FNCDA86t+7qYneAvC0DdvxP8JCA8KD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 01:28:28.5952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e849b51-eb0f-4b9c-2587-08defe5a5696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999233
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

Hook igt_platform_should_skip() into __igt_run_subtest() so tests
initialized with igt_platform_filter_init() automatically skip
filtered subtests without any manual calls in test code.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_core.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2f737b01a..0ec7b4861 100644
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
@@ -1525,7 +1526,6 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		return false;
 	}
 
-
 	if (skip_subtests_henceforth) {
 		_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
 					skip_subtests_henceforth == SKIP ? "SKIP" : "FAIL",
@@ -1533,6 +1533,22 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
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

