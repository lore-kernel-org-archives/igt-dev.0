Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEBBC61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 18:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FB310E09F;
	Thu, 27 Aug 2026 18:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VSVSwSOc";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DD610E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 17:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoqXnWPm6xbKoXdTqW8eSj4GhRL6uTg2GHg1r+qCXbBPjo3tOE5d8n4JxB34FHrb1gRmk7ytLWyO8INpwBoGVw7NwdMpMWViqeq/AFl/6Jw8q+vjobTJ/D2CMk+sdNwh1xgPbOLWB3F3PSQyqhmJ9aN05YAuWLRvoxvtOwycHev68gHzxH/cERuG4wMlcD2FrAshyaK3M8Emus2I19TiARgFYiG/xpvFxJuXgStWqq2zjV90JOgFggx9c/OyyZB1vZxW6n1STCWvtbN2GRXsniuFi+BYceb4XHpmwGeXweWE2O5nSbqJrrBNkgo6Q2dPkthArsoRMQMxCVJKssTg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAXcPHc9yBCq98NiID9oc8U0+ZA0Ig6W8an5cSmDGqc=;
 b=Ow0p9r4g1/T+6UeBuWDeiv2PrQ6I4BNzSl2F3/99F9Nt0JpbZBL6EOvmrai98x7Qh1DkojWYZfHBJVmVoKxhgDSXCBc4blFdF1EDpt0cKX+NIwrMhU8t52Ym5ptgvfwXFb4czya5+BOYXIMMr4bXpud6Ntu1XVrhno2ZqO/Vfk0MD2vK0w/uPVs/oj5Hf1jqfdneKFwEW/2isUOYoX9dXQSZ64dVvoOj1bro3F0Wv0prAJv+sZ5TsBOGViNXZQfcKoh3/ajKnfpapzgHU1LYrpDfjuWNYmEvI+u9frQz67KkLgRxCMlth2yWJUQGnXlvXGXPsTI2wBQR7LNw3TLNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAXcPHc9yBCq98NiID9oc8U0+ZA0Ig6W8an5cSmDGqc=;
 b=VSVSwSOcE5kGH8b6KJVSDo+EFvJLq1vDsExEHfHs5i54tUG6PQakzaqOmVPPoiKjhTBGYkpiHD5NxbRrQubCXe2kATMIpuXn4dVnA34ufLAmw02ogu1KP5jRG9/F7F+dw4zY6o6Cloj8RXo+iQ5sNwpQgqHpcW4y9WWmM3zrbUg=
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 17:58:01 +0000
Received: from BN2PEPF0000A895.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::41) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 17:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A895.mail.protection.outlook.com (10.167.248.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 17:58:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 12:58:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 12:58:00 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 12:58:00 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Michael Strawbridge <michael.strawbridge@amd.com>
Subject: [PATCH v1 1/2] tests/amdgpu: initialize platform filtering for
 amd_basic
Date: Thu, 27 Aug 2026 13:57:21 -0400
Message-ID: <4d147ef0cf3d8b5337654212cb568b8fba81cd99.1787853061.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787853061.git.vitaly.prosyak@amd.com>
References: <cover.1787853061.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A895:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae155e1-5e60-4d04-8ca1-08df0464bc7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aE+OYT4WvgzdIGoyncVF0j/F0tS1l/Lpq/zh38MYCpkHiEJhmRDyXsZnTpYpS2Dh4zePGdmBUJrutbfLKB133bVGatGeQmgPSKsfCKDtolwowx0cZzyl3z4hD26JrHYo0XQ9+YKV+w3c7v4phIqOjFjDAmNg2infGHIgJWLZXqni9phtESUvZMeqmEFxbM/b1e+isbhwertCKAIb+6G+r2GCbnRa954svX4ylWOW1cJCvR2kDsgyqiWV8GSK6Z7wCKIvJEplmJZKuPvySJCPha2n+qLJAXz+ij/FqdRYKRZjINY5FjXhOhvElt3eSsd9hqCSjesAxlLfrPCipzRghORz2Cy3sutXmGtO00Q/sbiiNzmcLh0a86cF3mYbK2sr9q7xrNIo3/mz9R2PWZxyt/cSk2SLhrukao+OgH7NeRvP0Mncjrgaw4qLbJkH6342dRTprw9dzPNwGjPzw8F2Xit8HFdgGrs2KeyRH+X5V0rB4Ldd4H8qGqWCdwKIfk60uTr6iGHRhAtX6MiyRE3DwlJ1XF2WYg5fm6ncEDKjOGcMLfjCVHk12cXxpTRfd3cLeY52K1Grjb7IlDhyvpbAipIbMyHp4NxJeKQd/zMTLeXEqZ2GOSPvGdPJQgy3gxN8eM6v3iBdCpyXKpZF9XHhQ1KYbndDmcW+oe9QvwOHM+GKHwmkgfTz2+N7w0o2YJS4bQGvBxwOg7y5um5c4eVhUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: baK3xEFgxQvvFERekJlQ3fvZbg8FzxxqZoGy9imFKufkm5dMyLPV+1R7PEnYpIYj2aHFqjU0itgAXIRikKAJU2BYfOUBT6mVafkbGdqEl7U9QcjornheeQ9e3cGR2uctEFLyokK8uKYO7d45+nUBm5iwMlY/YCp/q2Y2B4uW8E1wv7RI11Z1pk+NM7De9OHe8lwx0dHg2aqdpKIJD2zEwmZAjs+ZVHoGhH+SW56USdL3RXfKu3hzA3dwxCDLSdcSmWrlXXznwK30Y2j3mNa3ULJHS0Dlaw2q06dblnQ1+xVs8kT0uqmFSMz0UaQjKHN/PB5QBnbucbbI6NpsT/P8UIOwJjVfH4sq/yhRZiQXbR8hiYfE8uInopFfmj/1kjVh52/8g+UHIJJWWEgRS1fu6eu99SdqQm7gcYWmf+mmzbeRCK8idFi+3DiKZcuJtZpU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:58:01.5019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae155e1-5e60-4d04-8ca1-08df0464bc7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A895.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108
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

The tests for user queues are always enable and not depend of
env AMDGPU_ENABLE_USERQTEST=1

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 84a6d8618..59ec3880f 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -19,6 +19,7 @@
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "lib/amdgpu/amd_utils.h"
+#include "lib//amdgpu/amd_platform.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
@@ -858,9 +859,8 @@ int igt_main()
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
 #ifdef AMDGPU_USERQ_ENABLED
-	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
 
-	enable_test = env && atoi(env);
+	enable_test = true;
 #endif
 
 	igt_fixture() {
@@ -884,6 +884,7 @@ int igt_main()
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		amd_platform_filter_init(&gpu_info);
 	}
 	igt_describe("Check-alloc-free-VRAM-visible-non-visible-GART-write-combined-cached");
 	igt_subtest("memory-alloc")
-- 
2.54.0

