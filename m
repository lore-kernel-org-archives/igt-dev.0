Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D993C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7FF10E15B;
	Tue, 30 Jun 2026 03:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wMTI1MnF";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F210E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfkJjojObOWSybguigGDV0L96dQEO0iVTZMNSm6gGVAJnmp7lVTR2vcU3s04uWeul3zuopwqSXyYCV466QciXFwXiKKUsbdydfHXaGmgDmkvOREpJUTheRvQ9aNnTAK8wXAdzaXgEDly4Tz60mX8dk4T6VUGLNy9Wg1YbU64ZHUGyRPjVthk7/DqhiYQWhqlouAvc+hCtMPhG3MAef5i8LrmuCDMWGSuvd3VKz6+hGx7V+1JRYrCleibIqESBuNuaEnTeIvrPlT3dcNC8DpXCg+t38rlPX8rldxH6AcUjQvYC5IiNNcENBuyxllO6SyXAjgYcnwWE+qNrQiyElZhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2ZtgUeybwJF98G9PQ52Rda5iybxBM4jwlgrfVDq+98=;
 b=wxdJIcK2l9F3/R38BE8ee1t0vUPEfzPeESF4xIr0dU8OnKpFtUPgdyATSFsfUHVuwwNHWwQ96vJcGD7q5SEwxBC4Y1S/lHw9/LOtsDHuW60II9Xtr5ocB/sWfflU4QPgAuxHxESwLhs3yvTNDTlG7ySe7omMrajAgyjIgCI/pNjDaUqd8lhSm7kJTt040EpWl27XhchtAQkimKhOJux2gilNUvraSJxAZJLkax7ENtkyxPE0+JLm/EIc2w0TTIMa2kjlzDmd70QyII4EvkOborHCtt9EswI5dmdfmwJccMZobPeo6sVV2wE7L0QmPVM2amxaxf1cs97nPKrLs/8W0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2ZtgUeybwJF98G9PQ52Rda5iybxBM4jwlgrfVDq+98=;
 b=wMTI1MnFOqcqxl2EZXvxIA5qyl3ANoa9+yVhR9X8JuEiIedoO7zwrsSzAfVg1zAuvGoDWa6ircLzWQ5hSV9EV+pgxGDTUYPM19B+3Tqc0m5Q5LZdFsoSlusqwNLjWKx187MeRVkuDxbNStE5je46BZYQpUIRxTweVkwFVBsLh/Q=
Received: from BN9PR03CA0745.namprd03.prod.outlook.com (2603:10b6:408:110::30)
 by DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:48 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::98) by BN9PR03CA0745.outlook.office365.com
 (2603:10b6:408:110::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Tue,
 30 Jun 2026 03:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:47 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:47 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 5/7] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Mon, 29 Jun 2026 23:23:24 -0400
Message-ID: <20260630032442.200729-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 06680d64-1a47-4014-9b05-08ded65723a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: EO/aPZ3YD/jTi96z58dOsjfvkjoF3wHzrlDG8akmB9R8Pv8dJDrzLQWH+oIQooMbVwLY2wqKzpAAqJ9E5+UntFhNZ9vQFzNZCxF9KRjG2KmYcgffsCHFI564ganPRrg2RNrlGb6ExpSatGJPCk5LEryCzOZ0vb2NCOk1Jsek00dis63MV1LIF6iIaWYV5rYLkIZdhhfypgWLE+54ZwNGnT9xmC3cUtMZ4DZO0ucG5vgbELAONNPOGAIGkPHYtsulEDKa9jF+JcJHDwIJZabKoLzBHmDKFh28FIQYVd9pSWsGY+TnJFGLLiTOSEN6ioQAbdbm/O+twX0C9McLMwEr7ME9jC/HYy+m0he7h0nV3l1u2cTU2a7n9NKO54JBWhvZ9JtvfWFYv0mKbBqc4dqCNt3O3Yl6w9aMtPwbyMyKgg/FInZQFSqVpc5fdWT1EBdTKXEJUZHCBZoDdifNhlxQ3nFyOO0OtJLePAKdBCSaCC/zY1fxz7VcxS/Xtr9AIhMDk4tbQ0qKIOMUMWduialNbJrgzjX8DgTZbI2hDJMihVeahT50/zZGDeKIAUwuxCVR4g/k3XDcwyNzE84Uyn2AiSgUHZ1o4flYf1DcGrip2XRkbynHG48EyPBmn2XKkZl1bTDmnMXY2yvSCKCLwCbmupVl2M56X32pjUqCNohFuqPm7A/YCFH8bh7ffOE2+jkVwRXoIlBuMInmB0hqNiasYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6vwkQcACqHS1QmdLXdyOLvjWGx2BNyQCEMoUtKPONRhR6XFWWVVw9/+g232RLACGyL/HjEcxhf7atjOlg1lC3kThdm1izQCrP0jkw5W8jp8Ky+uF+UoxaHht2HvHEbjDEjm7GN+ggejnJfQGhv3H29Y+dYlLHXxt1EKBtTKR/HmEn3Yk+v6tP/y0YT4M17101k8/m3N1RwODeMlCY8WUNuy4sN4svkOoQSP59NRnBqY6SPyFugZtPpvUzWv/5sNboKVgXi7APzXjNZSnH3O6GhUb+EEVnjGZtIwJQcQUn2jx5gQbLHojeGDx4+u1WB6Aexd7ETb1hDOpOCLcnIGbLxKP29+tJwutoDuegVED0Fc92KdcM6rXpvXsSzuRiwLLc99FHJjfMVFRo1uUtPUXYLRau7lgwn8ky1jpWgBhKpd79cwhf/crHnY207Jx9rtY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:48.1417 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06680d64-1a47-4014-9b05-08ded65723a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794
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

Integrate platform filtering into the IGT framework by adding automatic
checks in __igt_run_subtest() before each subtest executes.

How automatic filtering works:
- If platform filtering initialized (via vendor platform_filter_init),
  automatically check each subtest before execution
- If subtest matches skip rule, print SKIP with reason and source
- If not initialized, behave as before (backward compatible)

This eliminates the need for manual igt_platform_require() calls in
every subtest. Tests only need to call platform_filter_init() once
in igt_fixture() to enable automatic filtering for all subtests.

Skip messages show the filtering source for debugging:
  Platform filtering (config): SWDEV-12345 - Known issue

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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

