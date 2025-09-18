Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEC9CAC5A8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 08:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A152510E6B2;
	Thu, 18 Sep 2025 08:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uq9efFlR";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9F610E6D1
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 08:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQgXPUbWXAmSJMYErMC4kKNn6x9fTokFVpNxgTIXVJeuHmT9e6x3b6121G1uZqpksCWqIHXMq8HOmo9YQnwk8CljLfnmvTsYXg3AjbsZhne+toQP/7xXcYFGxwWErI0/tI9gFsMr/XU/7tOLmhfEGEGDG2MRQF/Sdf8BIipFEJGDmqML+yBpPU70owiEGNHDYeIEU3y/mlCw559SaSxpMKMa+x9cVdHBUYcKznMywnmSMKOnL76l6sACErSPZlKmLEVbBfxNoDarupY6DbB5KK6/359Z2kj4RF74M2Prmt2E5Bf/tRGjjrXhuURqwmvTCkA3EZLu4TGltMhMhI0eRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gp88RP0lPpJPdIpltwH2OIZ7Fn1Kb8uKhT+i4XoElw=;
 b=CGqcPU2C6MH8TAjNCLn/PL8JXZZ6EI+GLVP11K9sDE8vjamcml3s4lhxD6zd2X/+B7AeMv7RL3R5Toh9qCW2A3V7kwpPP9PKwxj8I+JGo67fY5u3b5QVOU4NzYz500DT/zRm1r35nMkf5leCEZZXKaQAKKuXwEicapo15539ZT0bi6oBnbkKHHRGoKn3hIfsKY4CaxA4PoK5Ca85bwE/+USgecHrfijWTz9eXzh4AkNrtZZV6noIg4WgKPhN0JYnA6ooAuHOItAreLq7UYYeWV6d4s/XCTO4y8LMkmV5neBiq1/7e+cJVJoeKkVUVLFmvSVM/9NQDCOUBRZdQiiyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gp88RP0lPpJPdIpltwH2OIZ7Fn1Kb8uKhT+i4XoElw=;
 b=Uq9efFlR1PJBahvKs6KEa4QCMzix6ut3ZPvv4raZ05eyfq3DQxOT599fijZiERvrryWH3tGyFVYBxz1teBNF4G1nDkBfi2lYVsvY4i0BTVH3BvjLj+hctTvTfPRjjyOpHqzG1fRSIWh9WLB9D5qtDaa8kJ+LcXjhAKbvwSkm6/4=
Received: from MW4PR04CA0351.namprd04.prod.outlook.com (2603:10b6:303:8a::26)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:47:14 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::aa) by MW4PR04CA0351.outlook.office365.com
 (2603:10b6:303:8a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 08:47:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 08:47:13 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 01:47:11 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH 1/2] tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close
 subtest
Date: Thu, 18 Sep 2025 14:16:54 +0530
Message-ID: <20250918084655.2192395-2-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
References: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 20649012-d1dd-4035-ba95-08ddf68ff6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3Ivc1VRS1ZEQ1dQMFFZNmxRL3pyblM0MElFVTI3U1R1K2dpbTJOdTFJNXRO?=
 =?utf-8?B?by9ZdGxUTk9wSEJSWWRzbDQvR3kyQ1hXckNhVUlxT1ZqSVN1OHhYQnpDbnRP?=
 =?utf-8?B?RWtjUW9ENURacDVuVzVFTGdKbEYweGhlQVBzckJibXBTbFo2Mk5tSXFjS2h6?=
 =?utf-8?B?MFhPQ1VDbkV5aXBCTTFPZ1djbkJZMDFRK3dNTGNhSjhYQVdFRVdpY3c1MERJ?=
 =?utf-8?B?enVaaWgvOENuRlYxdXBUZDNvdzFkWTd0azhkbFNxSHNVWEpyS0JISnloZzFK?=
 =?utf-8?B?TXNiYkxHSzVMOTA3WG85ZmpucXp5RGNtb2hxQW1tck9XQ0tRWmcwNjg2NVRS?=
 =?utf-8?B?dlJES0lVTGNSNWppQUJCUlhwckt5VHBlNVZFUVVDaEE1RjAxWGtqS3lPMFFw?=
 =?utf-8?B?R2x0QzBQb2hiVjlqQURzYVlLbGRXMTNHNWhENE9ITWNqRUtXMTUvcE0zVU9T?=
 =?utf-8?B?QlRwbE8xT0luZHJZTHA3akdFekdsS2huSm94YmZuT0pKU0lYNmdOMlRFWUto?=
 =?utf-8?B?YlZsQ1RxbzlrWmtHYjVPMDg2RnFTOFJMUFBJUUNlYjFWVUY5L3oyL0pobjg5?=
 =?utf-8?B?OUp2NlVnNXhCNmQvL0ZxOTdnOTlNT2QzVHc3dlZxam1rTzA4amdnSm5ocEZo?=
 =?utf-8?B?NEJLc3EzSmRHdDQ3WTcxRWFkSWhDeStFNXg3a01NTzhLdGdEdU5mQS95UkxQ?=
 =?utf-8?B?anJDTkxPaitsSjB6WFRVODhsOWROalVQQjFKN3RFWTEzRy9CSi8wNit0Z1BR?=
 =?utf-8?B?NERTellyV0J6Q2tBMlJyU3RTbEtCVFFZTUdrT2hNN2ZmSjFMZytPTGRrUUZZ?=
 =?utf-8?B?SWtOWUcxeFBveU5QcGJuSngwVlExRHI3RE0yMGp1cVYzL2h4K29lSmlEZGhj?=
 =?utf-8?B?TXZ6bFcrOUE2QTRWVStzZG5kUEZkOWs1U3ZRWU1FbGEzRTZvVUs5T3lpbVhq?=
 =?utf-8?B?bjFIZmJ4cmFSdTU4ZFhiT3EwS1pTbGZycWJnZjR3UWxCcEZnU1JjbmJIeXBP?=
 =?utf-8?B?aGR6NmFxSFNsQnhNOUthMjIzbXR3MVpUaG9laXJuT2lMTEJrYlNZQ1VEY0tT?=
 =?utf-8?B?amJVL0NpMDM0L0pwZFdvWFdxSGhYSjBGa29RSVc1NjBLcWxOY1EvQ1QrbENI?=
 =?utf-8?B?Y1UzendIaW1MTDVVN055dFBtMENhNFJYeTZRcGpadmxQWDJ6YlI0OXR6Zkc2?=
 =?utf-8?B?MUtYRVlScDB2Zjl5eUNXdHY4TGtXTHh3YWpzNW82d1RqZ2Y3WkduRllhS0ZO?=
 =?utf-8?B?N0hPS3hIbHRWempsWWtGcDRVTDM2Vk5Ib25nYWwzMk91clZKQm5USWpVbmRQ?=
 =?utf-8?B?NkR6M1hGSlBZcHVIcHQ1Q2lBY0FLYzR3bjUwOTRxeXJmTHhyNzFKUzR6MERm?=
 =?utf-8?B?SkhPTktiYUxuTFgvWVBFeElVZlUwbm5uR0dJNk16T01qTUgyVkZnSG9ENVZw?=
 =?utf-8?B?N2pIdXNQWHhXV1JESUhlbEZXUCtkSVFVV1VuTEt6YzV2cjBhNmZhZlRTNi9J?=
 =?utf-8?B?NmZEZ01IY1JYdm9OTElEOHdhU0VScGtVc2xRejFjeFFQZ3RCdW9KKzZTYXBB?=
 =?utf-8?B?T3VHcHFWeWZJZ2I1aWtRTTMrVHdZL1F1NkNTNFRxUDVVcGhqQnhTRHRhcUR4?=
 =?utf-8?B?QjY0Q0VLOTdVcVhqVGdKT2FMRk1mNDZQOUYzN1UxdE93dVovc2dnQ2l1Nlgv?=
 =?utf-8?B?NStkbmkzV0YrSGFzSTNyWTRFQU9QUEJ1Wi9qc2JyODBtdjVjaHlPeGprY0g1?=
 =?utf-8?B?b2VSdzFxVGZoUkxBdnF6Q1o0ajZ0S3FZZHVhdlAzdTVQSVF3Ty8yTUtRWVJP?=
 =?utf-8?B?M1VXbFlPTEpiVFdXRmpHWkovN3BPckkvQ3RBOStGL2R6VEUzdGdha1YrS2pr?=
 =?utf-8?B?WkZHZ1JhbWlHbkJ5SDQwTjRySXFjczVqRG5nMGZsZU1MUlFqNEtkQVo0eDcy?=
 =?utf-8?B?Yndkd054M2I0eWN2SDdHSG81bXEyTlFBK1VxSTE4OXF3QTdJNXA1QS9pZTQz?=
 =?utf-8?B?WmRBamRZTDhBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:47:13.8016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20649012-d1dd-4035-ba95-08ddf68ff6e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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

Add a subtest that allocates a 4 KiB, page-aligned BO in
AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips gracefully
when the domain is not supported (-EOPNOTSUPP/-ENODEV/-EINVAL) or when
system PAGE_SIZE > 4K.

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_bo.c | 78 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index 93e04f046..ef9fe72b9 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -10,6 +10,16 @@
 #include "igt.h"
 #include "lib/amdgpu/amd_memory.h"
 
+#include <unistd.h>   /* sysconf() */
+#include <string.h>
+#include <errno.h>
+
+#ifndef AMDGPU_GEM_DOMAIN_MMIO_REMAP
+#define AMDGPU_GEM_DOMAIN_MMIO_REMAP 0x80u
+#endif
+#ifndef AMDGPU_PAGE_SIZE
+#define AMDGPU_PAGE_SIZE 4096u
+#endif
 
 #define BUFFER_SIZE (4*1024)
 #define BUFFER_ALIGN (4*1024)
@@ -248,6 +258,71 @@ amdgpu_bo_find_by_cpu_mapping(amdgpu_device_handle device_handle)
 				     bo_mc_address, 4096);
 }
 
+static bool page_size_ok_4k(void)
+{
+	long ps;
+
+	ps = sysconf(_SC_PAGESIZE);
+	igt_info("[mmio_remap] sysconf(_SC_PAGESIZE)=%ld\n", ps);
+	if (ps <= 0) {
+		igt_info("[mmio_remap] page size invalid -> skip\n");
+		return false;
+	}
+	if ((unsigned long)ps > AMDGPU_PAGE_SIZE) {
+		igt_info("[mmio_remap] PAGE_SIZE=%lu > %u -> no 4K remap page, skip\n",
+			 (unsigned long)ps, AMDGPU_PAGE_SIZE);
+		return false;
+	}
+	igt_info("[mmio_remap] PAGE_SIZE OK (<= %u)\n", AMDGPU_PAGE_SIZE);
+	return true;
+}
+
+static const char *amdgpu_errname(int r)
+{
+	if (r >= 0)
+		return "OK";
+	return strerror(-r);
+}
+
+static void
+amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
+{
+	struct amdgpu_bo_alloc_request req;
+	amdgpu_bo_handle bo;
+	int r;
+
+	igt_info("[mmio_remap] ENTER %s(device=%p)\n", __func__, (void *)device);
+
+	if (!page_size_ok_4k())
+		igt_skip("[mmio_remap] PAGE_SIZE > 4K, no MMIO_REMAP remap page\n");
+
+	memset(&req, 0, sizeof(req));
+	req.alloc_size     = AMDGPU_PAGE_SIZE;
+	req.phys_alignment = AMDGPU_PAGE_SIZE;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+
+	igt_info("[mmio_remap] alloc request: size=%u align=%u domain=0x%x flags=0x%llx\n",
+		 AMDGPU_PAGE_SIZE, AMDGPU_PAGE_SIZE,
+		 AMDGPU_GEM_DOMAIN_MMIO_REMAP,
+		 (unsigned long long)req.flags);
+
+	bo = NULL;
+	r = amdgpu_bo_alloc(device, &req, &bo);
+	igt_info("[mmio_remap] amdgpu_bo_alloc(MMIO_REMAP) -> r=%d (%s), bo=%p\n",
+		 r, amdgpu_errname(r), (void *)bo);
+
+	if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL)
+		igt_skip("[mmio_remap] MMIO_REMAP not available on this platform (%s)\n",
+			 amdgpu_errname(r));
+
+	igt_assert_f(!r, "[mmio_remap] alloc failed: %s\n", amdgpu_errname(r));
+	igt_assert(bo);
+
+	r = amdgpu_bo_free(bo);
+	igt_info("[mmio_remap] amdgpu_bo_free -> r=%d (%s)\n", r, amdgpu_errname(r));
+	igt_assert_eq(r, 0);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -285,6 +360,9 @@ igt_main
 	igt_subtest("amdgpu_bo_find_by_cpu_mapping")
 	amdgpu_bo_find_by_cpu_mapping(device);
 
+	igt_subtest("mmio_remap_gem_create_close")
+	amdgpu_mmio_remap_gem_create_close(device);
+
 	igt_fixture {
 		amdgpu_bo_clean(device, &bo);
 		amdgpu_device_deinitialize(device);
-- 
2.34.1

