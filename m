Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30913C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9A10F81E;
	Fri,  3 Jul 2026 14:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pdChbjzG";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013058.outbound.protection.outlook.com
 [40.93.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA2910F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7lbNSUt8SErad1Um8is4ugXHZYpbwiQrkqEqwJaagwSiqzAhv7E2fi8ajTEYTqrvVQzPcGmqhFlBakiIwkOxDEkXfEBUsTAYKTNNhdpl/O8b8rOXaGL8GL/TC7FUy2ZPAYG3NyqQQc7LLBKSHAfsqIml2C8IuSY+d3IxXWVFFzXPIQN5OrzbISxOSTsHh6T4encj52go0Z2NCr6ebrdZFCqpNQsO60wDg06SrGHRHAJBYW+3A1SK+3V0Y4vdZeI/8fYoDM+wzHBHKmKHo46Q1EIBlVfcqyT6VYz36Mhbj7fYkbgft97/nHYFALQmpKmECbzjhlwY9A9/mId5UNs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWTd6XxV5Kp6oxJoeR2FmH42TcaZ1QYmI0Fg/XBWu3I=;
 b=nZ7DgKmfhOO4Lvvu1jMFu146Lz9aIOMhXyDQtuquvHbgDqSgtKZv4a0DFPz1Vc2c8NWOU+6RfKScQ9jvQfFRkshu6tBDUZn6QyITwoBFi1UzytK0pR5SxPpvT5SUJSjwRllCnfw3zIdPdFVxwPsSvliYhoeJJ2WHQPtStdLERW3JGHciUThyQIstRwiV3PAZejrNUM17rk0/PXCAkaK0jSXY4zIdxuTStUWaMvhgSCjiB637diKumyHj/zdtkDq4K950g3eeli3vZrrxjBYTlhgPH/eW5Ci9HrXlTqeuivt7knCizNIb8hIiWzJzIOwN1hMEmFhhh6obd4ikM+INyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWTd6XxV5Kp6oxJoeR2FmH42TcaZ1QYmI0Fg/XBWu3I=;
 b=pdChbjzGTL0DdGb4v17mgbfH/1+mC6JMRhDekjqmLVIgnkZ+bM20ZUK1gB8Zul1gGGt2ci6dlJKE1mPh0TtnE9SSFv+I+jKrePqW5yjOd4SralUryxP3sWa7fsGAzLY6ldaksDdsN35jwNzP7zjb4kcGiwVbwTU8SVCt60wAWm8=
Received: from CH0PR04CA0036.namprd04.prod.outlook.com (2603:10b6:610:77::11)
 by CHXPR12MB999220.namprd12.prod.outlook.com (2603:10b6:610:2fd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 14:11:24 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::19) by CH0PR04CA0036.outlook.office365.com
 (2603:10b6:610:77::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 14:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:11:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 07:11:24 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:23 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 7/7] tests/amdgpu: Integrate platform filtering into amd_basic
Date: Fri, 3 Jul 2026 10:08:27 -0400
Message-ID: <20260703141115.69015-7-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703141115.69015-1-vitaly.prosyak@amd.com>
References: <20260703141115.69015-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CHXPR12MB999220:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3d632f-d4bf-4466-b6fb-08ded90cf77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: lUwCzliAW+gkGC5bCnnBuU1c6LttL1Kpi3YWHS+YCF2ip67fq1asMNmMZ45zG4w6QveQeyRwjFYGYDPkOLF/vzak3iYoAIBlcd1kVvnPSch9MK6fdyCHDBgopn+wzFSt1NdUDJFeyPjZvW2fLEcmnvB1kg5zZEAO+NWAZHgKqXv478UMyfTRPv1ff2oqUGJQ6H4+eW7+hSxpUDYl7BzSVLBEbW+WyvMcCND+y/r57sOJzrokKvvf/X/EbZN7DZp0l07ddGLmdEjRBtUlf7fKtNUzDSW1sWnENVfRX86XQqBvsgIMXti6yGARSg30/nXEyYC+5Ay1XEFH3x1smSYha03R5taXTJnS5zW+2YDIJMldZRTpUBJ1JNGcP2RhCBixf7eUXMBl88hvBkQwX/G7cXFgt23wVYtFzDBMrJ2kUOezw5K09LzpvuLpKpu2ctfDN7j09F9KDEBgaGCDpnLLLGBR+Pjx2Cl5bBRa0nXuB5z+njOVtCsoseilAS1YUWLi9C5vgq3ch/2jUWK6V1vmDXaSo8s461io8x/VhUvMsfJAfSOvNKeOHeozjhHUwLnQ1sk1E4BL4kYKQ4tBazJu11Hpqd+9xftirLPneGEsjO+AlBLs2v32S6AXEfOAXn0jYHqpAOGUJ1xDSbNOzq0lW1WeYtd7yJX0H1OEn7cbcSuWqFTsx/Q4tpYOh4JMfeGM34TMQwOosDFvCEW2I3FHLg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +lvEHzao7awOD09M4BvB6q/PWJ0O8WGmIt2ghA27Ne8oyi1sm+NyuUrjzmsn5/mDo/5Me9qM8e0sZtmGDsaZJ4GopY6AtgtMB7JOerEVekOIQkppsnRvqzFfkpXqqU56hMFq2O3tSAw+rOr/1eEJvcVVPg3LU2SQbDvuk4Bmrv6vxsYhlpFPlSTrKCgO4j7aSr9U0PmZixqTIhW4QArWWu6Issgso000v6HAN091AFgmAWjwt5yH4+2R8vC2/ZOdV38GEARTT0wWPxapjm424z2hXHE7mUVszaDK7gUUYKiN6FJMBUbcXWq5tymI2kEMXy4csB8zaWckfizbUca4nPmIWz93phPFwJ/d8LzvatjDGaaBLi/8D/YEKKO3BHLAAuJSigwPlfKZfQLjc+12iTtjf94aAxb1WmD16jF7ynYYxuOEVgRRMSTpyT/SwcZP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:24.7902 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3d632f-d4bf-4466-b6fb-08ded90cf77d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999220
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

Add platform filtering initialization to amd_basic test to enable
automatic subtest filtering on the navi48 platform.

Platform filtering is initialized once in igt_fixture after gpu_info
is queried. The IGT framework then automatically checks each subtest
before execution - no manual calls needed in subtests.

This demonstrates the automatic filtering functionality for validation.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ic80cdc86111976fe6da6513c50e76006c861489a
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

