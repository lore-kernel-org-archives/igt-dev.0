Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C523CCA471
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 04:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028DD10E1E0;
	Thu,  9 Oct 2025 04:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZiTp/kTu";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B610E1E0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 04:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8Y4rElUfCJZJUvm0EqOmi1HDKuaj/JwSUXsl+R5yY2amW8axTOcDZnZn3htRY/pABu+HxQOS0KQXNuhtd6rjDeBiA/cjL8mS9GKFDdXnadl6gSV8zhp+0j0yqLuIXEfhLtN2bErnSHijRZye2Aij4nJHjzGWhuFHGXo7EISLGV+vC0h+h80VT3a7w+udPxs9eRPrz49Ke2EXEfjwNnR/HNHaG+f4tYXj+sRTCwW6CJlM3eZPqVrciHWGQuMhW43NnLMB79ajXbFI5VEDZGV1lunbdsxMmGDa3Akgq3CqJS7TuBp3XvNXgLBNbuGu/OsfHuOxa8dzeerJHVSl81dPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2a/Zs4rL/zbadsIy78Mo8+u3kT/YZrgfBMZxUCLzg7g=;
 b=JhTcAkd19IlBMZORViVNW1PjAmXEwiX5NCzKAAGtJkawuKpa8mmFGPROacsgFWKoMMRr3k2TLulF/+SFP8hmUGuB+PVi5HjMU/GSbyTVKksgE+1uTtx54hIq8kKfFV9h3bPzyGTxP9TosXc8UsHm8q3S5UY7+E1D2vqoyL6wgx6SlSnwM2Xog4qq9bu9Q9wPQeAl/orki/67ZhP8uWkxKtgPxtObl74I9ZqNjaQDV/1cPQlyKf2fkw3JprKces1q0XD13OWuAYs9581tvVNFXs7coHSZavxQ7IiQJ/cgXaxToFNJcMPN/NlVUBGH0IUkMEspDXWywPLaSwKSLVQ85Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2a/Zs4rL/zbadsIy78Mo8+u3kT/YZrgfBMZxUCLzg7g=;
 b=ZiTp/kTuWLFHdcWAxzZiTxV1lMCqoX11rbAAMnFns10rdj0ju0ICGKCk2Xf/BWvvvYvq/LR53eXCW/mXfIwboqJu0RiFbM50CpHHimWN/UlLbaml3Y4t51/9M0JNoxzek6WtiB4lVnqjAiRcewRiBIKfsOiYTp8RTl570liG7Gk=
Received: from CH2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:20::24)
 by CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 04:20:50 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::b7) by CH2PR07CA0011.outlook.office365.com
 (2603:10b6:610:20::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 04:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 04:20:50 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Oct 2025 21:20:47 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH v2 2/2] tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP
 flush) subtest v2
Date: Thu, 9 Oct 2025 09:50:27 +0530
Message-ID: <20251009042027.63945-3-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009042027.63945-1-srinivasan.shanmugam@amd.com>
References: <20251009042027.63945-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CY8PR12MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbdad3f-d7f8-4762-d185-08de06eb3a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVE1L3dwNjUxMTl2RWxTWWNZVWplYnphZFlQczI0dmM2MTFaWUN6RXhyOHZt?=
 =?utf-8?B?UkFHRS9TUjhkR05kdHdyK1J1L0Y5am15RmxvOFFnKzBTWjFURGI4UTR2MkV0?=
 =?utf-8?B?dHhHMzJzbDkvSjBTMGRxc2wyck03RytwK2ZUc2pHekZkeStINmFiNFdVKy9H?=
 =?utf-8?B?SW9RZXN4QnBSdXY1a0ZrdHI0NXgycEpIS3p2UzRDSUtEU0xpaWlHTXN6N25h?=
 =?utf-8?B?ZWlqc01EZXJsQmRHR2hmRHgvemN1NVNBM3ZTSURHbk12NWxQbWF4RlNodHgw?=
 =?utf-8?B?T04yVmxrT1pyQ211UDFBbGxlNGE4RkpySmNrbDBLZGdZdXlOcnAvZXFuemMx?=
 =?utf-8?B?WWgvNnFwSFFQSitzY0JJSlBpSXpJeXZZY05nWkV2Yk51Uk9RV2s2czBWNmtL?=
 =?utf-8?B?ZUpJS25Ga29oM29jRUd3SkZwQ3RuNHFHQ2xvVEJrRFVIZEtoZTkyWGxka0Zx?=
 =?utf-8?B?V2JTRUNLclM0Z1pGQUtiVWR4ZjhwNmFDaElUdUZpeisvZDJvZ0xwQW9kT2x3?=
 =?utf-8?B?TERxYWtpOWloZHA3M1hTWllHeGNLbGtkWlZ1SXBUY0IraGxLcVVtajZwV0Vp?=
 =?utf-8?B?MldPb2VwZnlqSVFXaGwzQkZadW9VaVZROFpOc3pHdENWZ2FxalVTMit5SFN2?=
 =?utf-8?B?NmFscTB4K2dObmxXQ0FJV1hSOGhTakJ2Z2c4QVpJQ0FwVThkaERXamo4RGQw?=
 =?utf-8?B?cXMydS9NdFhWWlZZakloNkJKNE9Ra0g0V2Jwa2JPN3F3Y2Z1VjZlc2VRdC85?=
 =?utf-8?B?UHRTSjhPdUFSQmdKN2pnWUZZeWx0RVJtYTd1bWM1S3RadTBRbEFVSDVtUG5T?=
 =?utf-8?B?ZFpYa2FpMSs1K25GbzUwYjV1eTlhV0xGbXF0dUVqcjF2bmxsWjhBU05XYVJO?=
 =?utf-8?B?dTN0ai9aOHlNSHdFeEpYUUpsb3RrbEsrQ0ErbEg2TlFEMXJVSlVuQWRQKy81?=
 =?utf-8?B?K2tuN3VXeGRmdkZsTXpYOUw5b21EMWxoUjllM0k5UjNTMjBXTnMxL2pIcnlI?=
 =?utf-8?B?TEI5aVVKa1E0VHZCMVVvM3k3RFBSNSt4cHV5QVoyL2h0VGNTK3IyaW5mTlhz?=
 =?utf-8?B?dUJPMGIzRU9oSWlvaVBWcEl2YzV3bUpSTGM3N2txdXJSWlpadjFUTlJScW91?=
 =?utf-8?B?aHJYTFN6REtvTFlOMmZVbW5oM1BtblczZXNYV0dqeXdpUTV5RkU3S28vRW1T?=
 =?utf-8?B?T0QvUFhORFZBMmgycU9BTTlCSnNQckpDUmRsRWpvOGNrd1BBYldEczhkSmRu?=
 =?utf-8?B?THRRZTZ5TTRJK1dDRG1pT1hKQVpGNk13YnBDNk5wREtxWTVDVS9BaG5CT0tO?=
 =?utf-8?B?UWk4aHFDY0Z1cVFaSWRlc0wrblpWYkJpKzZ1NGgwNUVhNGFFSU9CSWdzKzhU?=
 =?utf-8?B?c1M5YXJFaEl3OUpwUVFUL2tFM0ZNNG5lalFQWmdnTkNLMDRmV2U4TzFXdnJj?=
 =?utf-8?B?Rjh5VDZvNStQSGM2WU4xdEVrZGszVjlTdTJqUjJsZm9jU2NHMVdDcjQrc2dt?=
 =?utf-8?B?SFRVeVc0aEVmdmI1TjF3cG53MTNxdlUwem1jS0xkY0JGN1pRSjJxdkZSQUtx?=
 =?utf-8?B?TktrQWQva29SOVE4bFpUOEdmQjA3TjlkSWZxRXJmcUtjajI0U1p5QmRmekU0?=
 =?utf-8?B?L1Q5TDNxandPYkd4TktPSzAvUk9MVWNvVVltM0lVK0YzMFlpY3VTV0VVQjVv?=
 =?utf-8?B?NG9aYm5KWVh1VHlUMGE5clJHL0EyM3dwc0tmMjFDeXptdnp6SVZFZi81SEkx?=
 =?utf-8?B?dXlYTXQ2ekFCbThPRHJzbTVNWjZNcGF2cEpDS24remFqSDUwMS9sUnVYVWF4?=
 =?utf-8?B?bVhpQXJhNU9QYm96UjZ6bUlLV1JYTHVLa1pxMkNUOG9ROUI5Zmc3MkEvMU1T?=
 =?utf-8?B?MXdRdXhtZEp1OXVwVUc4U0xMMXBlZHhvbFRBUzhab21JMVUwK0xIZFNZL29n?=
 =?utf-8?B?TFRlVFNLYnpMcENIT2VEbWs4RGZNS1NZTTN0NFpaOTByOVFHdGFLcUVIc1h2?=
 =?utf-8?Q?+pk2oKaBLwvY4TKocFhh8tqGomRFoA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 04:20:50.0857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbdad3f-d7f8-4762-d185-08de06eb3a7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7170
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

Add a subtest that allocates and CPU-maps the MMIO_REMAP remap page,
performs a write-1 to HDP_MEM_FLUSH_CNTL (offset 0), then issues a dummy
read to post the writes. Unmaps and frees on exit. Skips on unsupported
platforms or PAGE_SIZE > 4K.

v2: Drop non-essential igt_info logs, add MMIO write posting barrier ,
and move skip-eligible checks before allocations (free any temp handles
before igt_skip) to avoid leaks. (Vitaly)

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_bo.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index ae03d65c3..2243eea04 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -20,6 +20,9 @@
 #ifndef AMDGPU_GPU_PAGE_SIZE
 #define AMDGPU_GPU_PAGE_SIZE 4096u
 #endif
+#ifndef MMIO_REMAP_HDP_MEM_FLUSH_CNTL
+#define MMIO_REMAP_HDP_MEM_FLUSH_CNTL 0x0000u /* offset 0 on remap page */
+#endif
 
 #define BUFFER_SIZE (4*1024)
 #define BUFFER_ALIGN (4*1024)
@@ -277,6 +280,62 @@ static const char *amdgpu_errname(int r)
 	return strerror(-r);
 }
 
+static void
+amdgpu_mmio_remap_hdp_flush_poke(amdgpu_device_handle dev)
+{
+	struct amdgpu_bo_alloc_request req;
+	amdgpu_bo_handle remap_bo;
+	void *remap_cpu;
+	volatile uint32_t *mmio;
+	int r;
+	const uint32_t flush_idx = MMIO_REMAP_HDP_MEM_FLUSH_CNTL / 4;
+
+	if (!page_size_ok_4k())
+		igt_skip("[mmio_remap] PAGE_SIZE > 4K, no remap page available\n");
+
+	memset(&req, 0, sizeof(req));
+	req.alloc_size     = AMDGPU_GPU_PAGE_SIZE;
+	req.phys_alignment = AMDGPU_GPU_PAGE_SIZE;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+	req.flags          = 0;
+
+	remap_bo  = NULL;
+	remap_cpu = NULL;
+
+	r = amdgpu_bo_alloc(dev, &req, &remap_bo);
+
+	/* Feature not present -> skip, not fail */
+	if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL) {
+		if (remap_bo)
+			(void)amdgpu_bo_free(remap_bo);
+		igt_skip("[mmio_remap] MMIO_REMAP not available on this platform (%s)\n",
+			 amdgpu_errname(r));
+	}
+	igt_assert_f(!r, "[mmio_remap] alloc failed: %s\n", amdgpu_errname(r));
+	igt_assert(remap_bo);
+
+	r = amdgpu_bo_cpu_map(remap_bo, &remap_cpu);
+	igt_info("[mmio_remap] amdgpu_bo_cpu_map -> r=%d (%s), cpu=%p\n",
+		 r, amdgpu_errname(r), remap_cpu);
+	igt_assert_f(!r && remap_cpu, "[mmio_remap] map failed: %s\n", amdgpu_errname(r));
+
+	mmio = (volatile uint32_t *)remap_cpu;
+
+	/* Ensure MMIO write posting on weakly-ordered platforms:
+	 *   write -> barrier -> readback
+	 */
+	mmio[flush_idx] = 0x1;
+	__sync_synchronize();  /* ensure the write is visible/posted */
+	(void)mmio[flush_idx]; /* post the write to HW */
+
+	/* Cleanup */
+	r = amdgpu_bo_cpu_unmap(remap_bo);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(remap_bo);
+	igt_assert_eq(r, 0);
+}
+
 static void
 amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
 {
@@ -347,6 +406,9 @@ igt_main
 	igt_subtest("mmio_remap_gem_create_close")
 	amdgpu_mmio_remap_gem_create_close(device);
 
+	igt_subtest("mmio_remap_map_and_poke")
+	amdgpu_mmio_remap_hdp_flush_poke(device);
+
 	igt_fixture {
 		amdgpu_bo_clean(device, &bo);
 		amdgpu_device_deinitialize(device);
-- 
2.34.1

