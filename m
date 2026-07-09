Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CA3C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 22:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A2210E0DC;
	Thu,  9 Jul 2026 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LbmntQnO";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ABF10E0DC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 22:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUNX+ZouIh/tTVpmmnjffQyZi+Tw4hoslo7Wg+8bV6JwFgI6CStMj1AyvqK8/k13N9QhtabV5jVo3w+3GkRQWkZslLbsjBd9lqiaDC9tSDLMtNZwsgs1SECcRAGEsX6e4cOmEbXxc3ijxYPy1Vm7VLg8ESmDlPQkHddWCIfjxQqVeU1ZTNtQLYLIKPbAJJvKZ3ZdeNi8KD4owiqbUGWe1JBuhF1SWHktIWQ7EftzCaluqsOwm29UjocIRWaQzfdTgkyFHJDR1AcxMyBfA0WwqBKqRiG+vy4Mv55HZaU5i8qGKs71dWOQzVJ11Md37tnZaSMPoFIynp5XUR8rk/AEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=sQe5n1YDvU95PAAqvPvXK3UtLKvoBM5OUcYohz7ZoBCnhUjLJ9xS1FcnHOrlr2LRre/fxCW+JcPLW+95vL799vVcr5rCKxN6tJN+ioIp8j647rYbI0pfyHe34MG1tCTskY0s0YkUEV78N802EaawK0A+iRvmuoXNMXf8arqLBw7jedq43ko+3pWvdxL7ulVVQ+BRlhKvdnHIH5KgprGE9B8tFfX1bLhbBCjG1CIZWbnkNI2chSybNGJHEFASV+a2Hg7rmKuniV3TUQ1q7x6Xdfq/k82jYGWA4PAkP8g+qTrS6wx+q2vVVparSZBOA0UJrGDMUIu4oEfIHr3uEQn+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=LbmntQnOuogs3drnNcK3xr+jOodGwIoqPeZ/rf22BAfJVg7lh9Y9pWjAK9MfF6hmO5W4OodZdEoiySEO81Q9xX+m4jfN0XmeJLRx4wQ5LGpw9ZD3Zl7Z7vk2wTfMhvBciaWqmLvbuyYKE10trox44csPlJ7jC4BSAfRDlkDc+qk=
Received: from SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 22:02:49 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::95) by SA0PR11CA0154.outlook.office365.com
 (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 22:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 22:02:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 15:02:45 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 17:02:45 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/6] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Thu, 9 Jul 2026 18:02:16 -0400
Message-ID: <20260709220240.132893-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709220240.132893-1-vitaly.prosyak@amd.com>
References: <20260709220240.132893-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: b686e4b9-0c36-44e2-dca5-08dede05d0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: NibyORLxL2Aq5x0luU3d+3VqyIeSq71dTiQ5os9ENlJveq+TnyRujYL5oCmSBzW7JbNDULDdTol0GCjvRPZnOaiG9tO/FRT0m8T4QT0zw6lT36wmRcK7/AGuI1V5xxx+YmpMWGy1NabbUerabDLj5yK6+foUpmwdaaw0cviwvKnrxzLPBXJvtnncxewdVldkw03ExDueFVcp4YGYtBf38zoeCcN75NYiRJNVObn8fTYj69TfJ+V59ScLZbWQv8zOFR23hl39S6BQX0sVkvSlrNuqfb41YwpknTWBJBV8rXnzDVe3wr+7Fy5vRhdA1l6G8yg3dyZVZXanKlb2z21E6rDdSJq9RuW6Wsg7dyj9cSdmjpM4pL4d0qgWj20lrYtHaQ3gWFhuXgIbvlhSr5XifWBlclPurAfZp4i/ZznR/LiyJtnzLtCwlit0WYX1AZKeT4LHuLbmHN+FI02TQfkNNnp5oKltXQuuTPibc9FBC1zCsyTfwiUR4GXVbf1oAUaN/NxqeGdin4fXjzoWWd3K739UaN5MxQ8371xwTQOyegJEIdHDL3vbRws3eV+W7BjxKlYIY+YyS0BvaLPZjPYpqFe6sFQZgHn4fIII9BdE5WBusLuX3aURaEIE3ItR6hYagkjSRIgffp5difZvH+cMSVokXrO8/ku65ql17xKIHreBaAvkgZg8qkXBDkYY0TompvkaHGLL1VHZWjdJJer6LQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Oy+oy5tkQVHbfmEjjG12hTsm3eUcTjYAr8cfFupPb0yK/z3NtF2pJ05+QiYhNzptjtPa8AbV+o+26zpVfiaBdsStrozWfIyWZ6hDvN9/1vVeHEGsOTqS5lycp3/0e8F/MzyPA4xCTqkVTGHnsj5nx/xAno6GA1POBmQ4j/M7AGdbySxhpdJmEox1PFHoOOtZNwrZWXiOLQH0QbjC7FpbsO3e6TQ/X5r66vVE7257QpXZbbj+z7bC4AZCA+FOp5h9c5Lgjr3B/qqyqRlICFf9u8xN3Jf2KgwLRpKskp4MS8GMu0EqX6EjKhuRHwJEpOVRr8hqIOOV/V3JbVm7klj9SIYT8Woxp32VSvKBPWeIgnw3iF2fchVdHoRzWUATqKP5dJTKSw1gD2ALHwqZd5iHmkGPANqp8bRWQ9WZa0qcl9rINT8BpvWNuHOPVmr9SNoT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:02:49.1553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b686e4b9-0c36-44e2-dca5-08dede05d0c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005
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

Demonstrate platform filtering integration in amd_basic test by calling
amd_platform_filter_init() in the test fixture.

This single call enables automatic filtering for all subtests - no
manual igt_platform_require() calls are needed in individual subtests.

The framework automatically checks each subtest against platform rules
before execution via the __igt_run_subtest() hook.

Usage example from this patch:
  igt_fixture {
      amd_platform_filter_init(&gpu_info);
  }

  igt_subtest(memory-alloc) {
      // Automatic skip if platform rules match!
      test_memory_alloc();
  }

v3 changes:
 - This is now patch 6/6 (was 7/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t2u3v
---
 tests/amdgpu/amd_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 3ad023472..ef83a53d6 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,6 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib/amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -883,6 +884,9 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+
+		/* Initialize platform filtering for automatic subtest filtering */
+		amd_platform_filter_init(&gpu_info);
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
-- 
2.54.0

