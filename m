Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECA6C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 23:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1B10E104;
	Thu,  9 Jul 2026 23:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mJj3K1nj";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010055.outbound.protection.outlook.com
 [40.93.198.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB710E0A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 23:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6snnuy5Idi/pL+l6HW4BzVOwncWESECHB9vsm0lDDWf9M8IHsmy6oQpNi+CqLpu2DoV1M+0PqLgEVcHVL8LnWaSaVFYrW2wjbXtkvZ+3ngdkJFlD0gXqTKCs5zGp96LhtgGO1MdgKQrlGZm1BKF+nfEnOEEXoXCWnSDl8nXR+zQCInKNqRZpiKUmMHp7PHiClOwDUyVP6H6/OQliBHcIndNi/ftXillgkq4HWEnG2O5qf/zCKarOCWIm8SDTOPWMx7HcBxvMUZJZGYM1Hjak7duv138FJHJMZZBy3Juz0aTnfWdhW5lXVu5A/8o9mymARtX6K6r0Q/qjwAdC7KRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=PReItTXlEvXhqn1qHTItoBIlnbWrEadnPQUTZLsj6+UUI6kfg5BoFvhwlnXnABUiobzRHt7Dm09iH7YcljfcnyyQqtuos1gNAZqeAXjvhixda/BOQXaHffRb2rKOlKwL5e0VPreEsMk/UU0SaXDnN4/L1rRLwbcgvcP6IwOOEp449LRdTylyOvNUnQpEPiK9YDddY19/PdCE0r44sEHHfCcA7P8Nl6cTflEoPDcWrnqDBRXgLfjWB+D7+qyravEveotJOjGSMLw7EpiZQYt0No/cXWuCtnV402rZOs1gncJWZr2I8Je0KiZiuflwNFZb8TeGNXVSWCWtTf7oOEmrWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VF818HtTSBqB82ofqjqMAdBI6q8JEPvDWGv8zE1KIk=;
 b=mJj3K1njytHp3DVLJp+QDyNZw4Z7RuHamLOSq8ZfRfFCmCBGbq1Tx2wmSbByHg/ik+tthKu0On7yO3wPPtPDvGdhH0QfenufsTrZZd9xw8eJF3K2Y1EwKcoTtkDTv1rfa9NW8Uh5IaOyiw00YGxBeNRt74+RPohTP8T/YoCpE+k=
Received: from CYZPR05CA0028.namprd05.prod.outlook.com (2603:10b6:930:a3::12)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 23:39:52 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:a3:cafe::2a) by CYZPR05CA0028.outlook.office365.com
 (2603:10b6:930:a3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.5 via Frontend Transport; Thu, 9
 Jul 2026 23:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 23:39:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 18:39:47 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 18:39:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/6] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Thu, 9 Jul 2026 19:39:14 -0400
Message-ID: <20260709233940.160424-6-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709233940.160424-1-vitaly.prosyak@amd.com>
References: <20260709233940.160424-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e78c14-c2fa-4706-d9e4-08dede135e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Pi842pf3zjqS4KUFoEQkqXipOUyfAEFKjddkEXQiIGnLtpdzbpS8drkkLO9jKV4tPPqGnsPLexen11ThOVdAkQM8JYn/K/f0aGalNlb+68pypDMyABhB2DxHqnKcCxDv0C1AlN+igGB5OFggVZ/opXhT9tY4DFX6OcUr1i3Q3g15doZ4CxKsKYuen0GKZ0l85bONKfFpHVLr3X7tnZvSx1BZAAX3S7lPNiJCzqgvB7VIttegoI5OucXPNrNvEoPA+jgCmX7ILsfpJDVlJ9p/1HgqlDzj43p5gs7WEVMGmyFrlYkCLDJEqKg6qFZL0jiaB9xr1KLs4HfX25PZbxowDdlnKAGQuuBMY7yAfzKE81yShAORDst3B470oExpkskrR1mjf0FPoCUVKBjhD+Djfq2Oa/ZJxufD22zeIGzEzCKR95z3kFcjDTbunGwfHUUx22Zdgw3znmXTCsdqD1SVrvxHIqrIk3RaBl36WNlcPmT0ml1e8SYndOdSMS67WPXp3GHMkYQlGV5iA/GjUkE8JTrWfcLXnuWTx8AB+fDk91HuPwHdANhoQaLHOwIGhuiVodneVkbvj3cW/HeB0pgSxgtg+xvgfmZiJ0N9o/ocqORfqKQXXuCWeIgkFT8BzQCc+80CCuvSjPG4bX9tFcxGK27M5qGVKtjWIaPiF9sV6pzDDtGmilRTzp8B1PdRzmL2rAU4mqv8DOwruZDt2tp9MA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NU+eX6YUcEuzTFj4UwdUVvCrnZEqlJWFaoiyZETlvpUwvkhx69xtqrtQO9tT431bwmyqNCRg2VoRv/dTvnMptf1wtkEn9Pa4ISIv5MlFmTfCu389QHSF0UaCaL5z74BIIo7Nx9SOykGYq0dYStQPKlswomdG/6z2umg+m5uUq4MSSpwPi3NzzE7L15KMT9Rd1vJlD2Ox8UJxOy0AVA/GxWfg+c5KFI7tID/O+/9mVWzaCj1l4u7QVnJvt/a7Zla4bwi3hiBxWzJa4KBr5JGkXuyxgE647649XoTEJbbtcujpx1BfVsc1yW5xFvvxsLCcB7+vFK4erUhvksjEAf9HBVp/mtPFRRJBOxZ/EZvtaoeBIcobGc28LcMxCumBS2oOXF+Nud9uNl8i7KUr083nFjNffCD6IZcV+6GdRmoR/dH5NbLdNs1s7KRrkrZG68TL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 23:39:49.6649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e78c14-c2fa-4706-d9e4-08dede135e13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
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

