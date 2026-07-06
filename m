Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D361AC43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 23:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A4B10E28C;
	Mon,  6 Jul 2026 23:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O+cg7Ciq";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7510E3E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 23:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMc2RT4fTLtMWw9OjmfOZpwpJjP7BhTcI0XccEAsznsKnqvl3JLBnbv0Ccv1RmYHEeVCtBDjYL+7R083mTg+ygwmtl4zUUbZa93GWNy2di7xSJXzirzwuwGHSbhantsURKhxCWWEJAgcUQDJnFC9mh9dQRGXQDwD2oTS3LZ/rGTgqDsN+qkvSsGZsebANmCReK+Nn3VGv+Smysby/205msq5t9+F5/4/Kd13vC9WxPDeLFxCv2ULyUpQyEWHla1guM+MttSv+B99sgJ30jTiWpt5DrL1VLNLX01lKToSOEEmWjgwHOKZKjlY5OcwpNmXmUgvZofNkSDqThNDbJRqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JoG00GWQEl+LaT1mOkdNoZP/lX1hqYcd460Kpd8+cs=;
 b=SfFpeMDWLyDWDkUnqcFr86c4f3yUbx2f8gHNyzeH/p0fWYhUUDkrrID+MHBVGkL7cf3/8t1SQHG6Q2fxG2n+3Y8VedEQKiXwWWTs1eufsUVa3zjjJsXLntp6QTSRZxfmQ5axSrAeGWPD/tXCfbISwnppqTFCOoVkeJYZYCVsEzj0pnvq8aWVT6l/D5v0h8B7DzzhNWsfEfMokFpbOARV1qGhSu7L7toTNWb3Nt1mqyujcuieFPK8q8pEnDfMpS5zSZSxCN0Qr8iyvqzZF43QZouWDFVcLr6jbn/otcpM2ME3ANyZQnCkBX9q2gxglFK65HPHlvn8ieML6T/jD7zYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JoG00GWQEl+LaT1mOkdNoZP/lX1hqYcd460Kpd8+cs=;
 b=O+cg7Ciqmr4fUx1+wpiOvK2oNgw+InLPUIsNow6KkGJsnLyYqJIWN1qPQ3cXhqTq/BW1in4veJTSDbbRnH0CBYCMjKhyIx+7hweag8ftTKeMyofmpS8C+JVuSlhUc5PeZT+m9FpPplsjzQOjPvozDvce6zSER3ZanOKcgI57PKI=
Received: from BL1PR13CA0217.namprd13.prod.outlook.com (2603:10b6:208:2bf::12)
 by SN7PR12MB8145.namprd12.prod.outlook.com (2603:10b6:806:350::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 23:51:36 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::aa) by BL1PR13CA0217.outlook.office365.com
 (2603:10b6:208:2bf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Mon, 6
 Jul 2026 23:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 23:51:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:35 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:35 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 6 Jul 2026 18:51:35 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 4/6] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Mon, 6 Jul 2026 19:50:16 -0400
Message-ID: <20260706235130.157557-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SN7PR12MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 12321280-6475-4870-cbd1-08dedbb983eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zFq+Yv1cQcxHi2taI3+jTiFdMMnh2pollWIlzq6oVpRnAjOl43wh54k47Stprie30bnn+M+6GO9FInrcQ8KAr5VYOYoN1GrgXKjiYr5RGYPL5VWAQfDqPrg8u3B2gYzn+AGu5uoab2vyhJwtIwGJuMPoI5JauMYSYObJs687zFO+dmFMyNFnh8imMpAarmypwYIzh6bpqrCyOLDKC6OotQb+k1IHWPgBceYcv2EjVMabvne92Cct7sgUCpt3cwaNoqHhoHgY2nqrvml3R5kD4qpg3FR4VHr6CJhuNzqjV/e6S1jYoaf9bfp1ZplzBOP43ZxNaYAinSkDihkWSEgBQDLKqQUOMzs/lKe01zg27cSCxaCxSNEKKgf1ik1MuV+vNQUX5G+MUX66kp4+GyV3pr5atwASy1mSvHgRqQFtY3pwLLNz8NU0bNHAJgY5JY6H7he+Jqwxy+tRMl3DTV9Q8SSnITGLWH0bWlf3hTDyfbtvU8O72Ix9b98ABJUoiFz4My1TnXVWVQPCvrQyeTJ7epSad4HoTnlzIL0Pv65KpV6k4ZDKUR7gplp3V4vzwejkybjgVS5hzuXYjn780Nh0TM+i2XfuCKjcmTDhaGEE5u3j5FiyIsjvDwy0ofZOB4XVOtd3wX7K6awjLOr0zTRAbeb3w6/dl5se2UdzLmViw75zoQYwzVHxOXjGoa49HR0gVh5e1MKKvCHZQzj5xXkj1A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C4mnPzAGdRwuz+xkD/DI3+c4WUsd5xDEHaeGgtu5wLAe0kzBaTcJDYn9WpF8aWqQQ5OhRbaZFem2Lm2YDyH87Lv5eaAnmzLcmMPQgXKwGArr0dXU0yti1wqlDONcSam2q+H+tWP+eEsxoZr4e6cLog/wn/ZGQ2f/RmJ2cYC92N49mKnv+5bH1Hf4eSSuqTzeJf/i9va1uG36MmywmggbeJRqoqPhFVEJ7M4OjDkk/GBhvqkLmYVqlv7OXXXY2W9HQ36vhd6b/aKlR37OukO0Mwymu5oia0wC+u1z7OoGiOUEidHdCTRwR6KTTtdzdaLJlKxseXG5ua2Tm+mSjSGhFFz6SQc4TN/ZkEdQbYR8JSSRc6kncN95zY+USiyAtLTB9hrOM11onwQwQ1ZKSzdFT7HmKT1fd/IdcS1+MFCVwB2YvJyT20md+kYE2jKkYRtw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:51:36.1461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12321280-6475-4870-cbd1-08dedbb983eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8145
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
Change-Id: I2a3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t
---
 lib/igt_core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..d2a6d79f5 100644
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
@@ -1580,6 +1581,23 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		return false;
 	}
 
+
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

