Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53251C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 23:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C7210E28C;
	Mon,  6 Jul 2026 23:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rDjXRjT8";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013004.outbound.protection.outlook.com
 [40.93.196.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5110E28C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 23:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXlmLBVF42JSJfUwaS0q8TWAMiW0DvCH2WsSu8Kky1BbKsJAmnAfZKdhI73an7GOojH5OsXW6fdZ91Tp9xNURY80d1umv+IDDmwHBjK3rOeg+yxRRAiHgthOHha6w43fsQuw8I9QdporCkbXN2wqBL97Ge8wRkaqsNHUWFn7Jbb5CgnCXRhAZlGd7mh2Era6qMX0Km6TNcpowEp/Tjk4iKi88w7M6SgSUZaFpcySfDB9fFbp9ANLpyWOt0/e71XrreDKgtTFPEmiq5dvny+/1KrEUBvHLNCkpfv+tZd6w7OttSj45YdeD20Lnw22dsUkb+BAnlivHTovqfxqaRSpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=ZsWRbssMgIM8LaSi2IcOqGG4av+7CkC9dp1Tfw4Oc7qPCjfY+ULDcckDxqlDBATnP7DwRvlBog7e7Smkz90TxI7c25odDA6I+aJ3b2AP2cqYvOU98k6Mt5cnmzTozNchO1+DnBPqmHXG/ntl1dbC9uCKpSjcZb0VGBfflRa3EBsyuXnEhGaFJCiTuFtg4BdJ7uIYT2t14sxV+Z92LSWMd/7HIeh/c2aJf08o+482dXWoDg6pKwHnzSM9Q1/jBIRRBo/AwMDg7MixFg9Wl5CY0DckbQ3l5pNqSfAGTvcGyDDR0iyywjuZ2JLevMLhk4Zl4VXyYXkHcg4NlkX5Z8a6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=rDjXRjT8VSBCiL8ntSiSoqvAhML7ileC3Og2+RntON4CP4qsk5At6GngQTQWyOdnqwlR9UUv9+qLxnaHN1zla4LPFa2xl3VFa7ep0YPuWZ0i0W7U2rN1P57RKzqa7YywNmm/K0Obw/z6mCh0DEFW7nlDcmhJ0eS1bg46rvnfGsg=
Received: from BL1PR13CA0368.namprd13.prod.outlook.com (2603:10b6:208:2c0::13)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 23:51:39 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::77) by BL1PR13CA0368.outlook.office365.com
 (2603:10b6:208:2c0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 6
 Jul 2026 23:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 23:51:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:37 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 6 Jul 2026 18:51:36 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/6] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Mon, 6 Jul 2026 19:50:18 -0400
Message-ID: <20260706235130.157557-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: a192007c-e6bc-48a1-8fb7-08dedbb984ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 2YzDBP8KVop3j6YCKzTPjdYPCA9FwhuZm/YUDdXUuW22JRo6e5TlSWIMN0AJ9Kly9Mmba6o5QSPKjiBCn2XB7XzUf0vxtt0IRRh5D1glZf+KT3dGgfbkAuZ8wPQFV7d5jG93s7mEG1g+X5lImGSooIezYiUCjFk+PX+sHTU+eMEdBE7IBF/lAL+rztERdWPjs3L8AdkYxIK13/eodkfuHVYrnnqlgn65apTcJOJxx7D6oTzNmR2b1xR8/v0GpTV1Pr7TpjjHCGr9cHgLl8MzfoOPjzKCfMSVsk/yxXhyJWnFqaMC5n5YFE9oHyaAvBiXWLZr4EBznElNvzbPMidRz6gAe+6OsslOmUt+hsFQX5k27xgWPTiWRROVPx4+WrfAxTBou53F9OEOSOI6PeHoT3fdtY+U7bAAMCE6yjE15m5hda+uIfIj3DtZf4I3j8v/75nrvD+pIf6TUXF5qVNM9oT4n9uzVK1KwId0AWf0mEXHnGs9rVpEuOk1MNM1PCkLu+Lepz4BE7BA5/bnpF7v6u8yGyhXCmzKHee1iZ6SE7UzYaoe2N9qFM0AJ/QYBdBs+DFRkRisBjSh+GM86lAfq4z6bZYSPXl8lPnU5A6rG2GO1YVK/MUWq3EsG9aZfMurbosQXMRIY0Vuj9EKKEYEeSMkBEBJVQwz8+vfaFTQ8H/lsGCX+OON95CJV92rspDTq7yvw6CaTKVRgmwjCYXvow==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jodSk4GH5irLEFLE8Zb4E9Nelx7wd7NbOYiulpKKSFAHPky2JTh3s+um+L8RpkXQET/ehi68SlH26V3ARYQqju2+/VTns/69PlFm8YRv2GbSxzI8fU2YmWDY+RjNUkB4etiF9N5um3pok1Yauo35H2wBNuX507ObAhKMBcCZ1imeipVV1Ji6aMn7IVbaDxks7mCJA0RD0plPXRHlOVd9pz84oOD7X84XZsdkg4oQsCSWnpVY8BFrqlQ2nIhzvE3NywfhZhM7Evw04SHxHXoCtsTdr16dYfDLxgx3adlneiamlC3bJH68R9NN3WjAg2Wbyee2rH+4sLqn4uh7lp0jqTa/vQdtcpOuhy6PxV7068VQMqYvMF1PWwZDumAC+0+URrGpXnXwuYEE2kbGxgQB+qdYbfhuKA1PckyOsQiXoaoaqFM0PWGtXMGecZ21wC54
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:51:37.9585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a192007c-e6bc-48a1-8fb7-08dedbb984ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
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

