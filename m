Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E67CCA471
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 04:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0387810E910;
	Thu,  9 Oct 2025 04:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oLdMG3IM";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013026.outbound.protection.outlook.com
 [40.93.196.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D952C10E910
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 04:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFJmfVQzjxSZHyttQMYRf9/VBPd3lPIREb2m0Yclyh8aQAeUg2PSBSgGj0kko/UzpJI/JpAwvEOoOEhVL5ATSXANhaKu4TgwGuVa7tqaWfqRxvRO0aTQyZE+1S0sy8TMMknIDqPShZez+C2dyfoW2hCBu/ZfUA8D+fL8ymKYSql1QhiPMYzhjTMJFGSMG4D0zyVPUpaiDetT/EzZ2hDa2eqTapAJbXwQ8SKSW/xPzzCOEaNMnOs5wQyrnqmNNTfcb577QgjbVORvy1zNAOfGMLBW25RGgLBTRWEQqseBbb4reUUJzT2VOQH0CrA0MMQrNN+R/zfv69RZHQCaOnCv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8IwDcZu+i78bop3bnaalkKPXUnDj703tBk262W6Ow8=;
 b=ethnEPAtAOHb1VPSoKAM6q81e+uAdwDgyPJ4ShqGPoqCJ4bBo2EvGE5qklY1VeMKd3LEEE90HSGFZg9lybo48JsBzJYnygVrAX4mvWBrArtBEZVF2+rDYC5RxSunY4f5McYfH5e1tQ/gMpRVEBCzcYA2tDTVsQwxENZpg0q98Ya/IZ2AHP5PSeOxPRQb7fnQzbDmdY3sfEtMmiOI64UGsSZus9DARmi7qZBUcWhNmI3i5lIymFK93okNE+HPQTyGw+i5bYLrVkgVlAEqSxhlhiTJJemMW7fDSV5YPcjyj8mHZHT4dhDOsJ/uPAsOc3xTrlBi5lIv4uPECJo/Lpklzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8IwDcZu+i78bop3bnaalkKPXUnDj703tBk262W6Ow8=;
 b=oLdMG3IMkkcBbZr77fRnsG4qaVOLX908yafiTh9XAq9tBF7C4chIEkIf5hsNYsJwkNODXWurzmKLDySVBceObYZ9URJvzZkitF7elAkROomUe4hW/BiTPk2Dj1ZYFaLCItzmMWZ2VTdNhP8FH4bMZmBMmrZX2Fs0TCTj+UgoiPI=
Received: from CH2PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:20::41)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 04:20:48 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::16) by CH2PR07CA0028.outlook.office365.com
 (2603:10b6:610:20::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 04:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 04:20:47 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 8 Oct 2025 21:20:45 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH v2 1/2] tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close
 subtest v2
Date: Thu, 9 Oct 2025 09:50:26 +0530
Message-ID: <20251009042027.63945-2-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: 315724b3-623f-4d8f-fb20-08de06eb392d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1U1TGEyc0NTNGhRNFh0ZkhFZWZIdFFCZDRUcTVFZW1DNCtBSjBmSkFTNXA4?=
 =?utf-8?B?YWc4cFJuUzUzQTRDSGhKSENYT1VxYWNqRXdaKzJ6YU1GdEtqUWxuTUF0L0Vh?=
 =?utf-8?B?WUtDZVJ0V2wyd25GZUoyVmtqSno4Sm1WVzhaN2NuTDhoWDhsYm9XeUZIcEMv?=
 =?utf-8?B?d2dwL2ZVQmVNQXM4emJPWE1ydzc5M0FMM2tZQmNiZXZ0aUtBTnRFM3VjNjA4?=
 =?utf-8?B?M0JmbXp6aWd1cHU1RDNPb0xlR2F2b2pEVFZDTkJLcWVPamhTTFRRQU1BWjlx?=
 =?utf-8?B?ZFN0YTF0dFZna0JkK0Z4MDZGTVl0Zm9QK0dGbEM5SzBQVm4xbGlpR1FDbkVM?=
 =?utf-8?B?emVaMEtvSEt6elJOY0xhbndqMDZ0VEYwSDlSZjUvS2Njb085Wk9CZkZINFNl?=
 =?utf-8?B?NmpuNW5zNGtLQkZoR1pVWEwyTmZpbWxPWFVPWXMzWlhCNiticEN1UEo5VFlT?=
 =?utf-8?B?YjlZVmxrN1Q1SUY1VUdrUktjUjZqWW1CNFVzOFlNeVRKZWJWOUp3YzlESTJ5?=
 =?utf-8?B?YUswV2NjaVFuSWJCSzcxVy8reHY4M0w2bGp5eXhTWjdONDZXZDExYWo5UDdU?=
 =?utf-8?B?VlVjemk1eHlZM3NtZDdxbllBUFhxUnlhVWwwdUJISDB3TTNYTnBDb1FRcVhZ?=
 =?utf-8?B?blZpclhCajRVM2w5RkdsRVRSa3Z5ZHhsRjYrYWt5MS9za0NSb252STFoY3di?=
 =?utf-8?B?ZlllS2g5UkRpYXB1L3lWTzZmNnVvSWxWaVZlY3BzekNxaXM0RG0xckRjb2Nz?=
 =?utf-8?B?QUpudDc5c29SQmdTTjRCRXgrdzJuUjZZRUx4ME8zcitPeVE1UVVpY1IyNkUw?=
 =?utf-8?B?b29VSnVWdkJVYytLMmZSOTFWNnBkb3p5VWhXMWZ0ZnRDWHZFWUc2eTZGbmR6?=
 =?utf-8?B?TDN0ZkkyeWlzQ0N3aEZqa0NHYUdNM1gyc0NLRVJOT2l4alVpY0lSOWxzbFFO?=
 =?utf-8?B?S3Nqd1Jtc2xZeTV2TlFKRUtZT05CWlc5MExmL3FMQllPRHFRdUFKWHI3VmNh?=
 =?utf-8?B?SFFnRFNXdkdxY0VSaHd1S0tYSFdzMDBiMEV1VW1kbGh2NXo3OGxFSHgzK0ZN?=
 =?utf-8?B?bzZXRzd4SWltMjdiTXZVOVNXYUVNenJGS0lJWHA1NkxndUNDVllPZUkzUDZW?=
 =?utf-8?B?bUtKZUh3b2JqTFgvR0llVE04SWhGMGxmR3pIbjRpM0ZQU0JscXNMTlpXNk1n?=
 =?utf-8?B?Q2RyVHc1UW5hWVExYXozM1ErZHVjajNud1BrYXBHQXBnVnQ1VEZUSmpJNWJH?=
 =?utf-8?B?RGFZRzNaQXd2NGRjOUlKNzJ3UW91aWZwM290bi83anRrMVJYWVptbXR3RlV6?=
 =?utf-8?B?YjQzUWhhZ1JOTlVCbzBMWjJkTytUZmZNcU1kdG9MSG50YmhpbElwWW5qZStC?=
 =?utf-8?B?YnAwQS90djFOZW9WcHhlaDFUc0p5WWw2M0VEdlh4dEF3ak8xZjFHY0VkcGRW?=
 =?utf-8?B?U0lzQkwxanlWZ0h5citTN3FlN0VCZHQrL3k5d0JjRGZSN0liQmw5NnFldTRz?=
 =?utf-8?B?OFBFS3FFY1gvMzBjZ2djeU4rVEFvSE42Uzd6MmZuRzBHOUlSQi9mSG5xQ2Q1?=
 =?utf-8?B?dTJQZzJFMk5TaG5MSkg1cUJWVm80TGxtZ0Q4S1cxZFdIV0VZN1BlbGJQOGpI?=
 =?utf-8?B?Zi9FTm9IcUFDNUxERkFWbzgxYksxV2FjRFkxbEVJVTV1R0V0b2w1ME96eFE2?=
 =?utf-8?B?akxDNndqcyt1SmJWU3FneE5TeXpraWdYSGorSFZ3MHBFNmZzWXBMeW03U0VE?=
 =?utf-8?B?MkJNR0NXU2YwcW8rallHVG4zNjcrKzhrd0pPZ3d0am1TM0hpMkw3WTFBRnRT?=
 =?utf-8?B?YkUrd1E1dCtsd01EQ3RQbVFXTlJRa2R3cFpETXIzak5EMzh2WS9nYnZaOEIy?=
 =?utf-8?B?Q09lQlN6Y0FDTzAzYXJTNklDcHNEV05EWUE2ajdaanptd3puR1lGbFljeUJW?=
 =?utf-8?B?amtWbGgrbzc2RmRiUVdBZ2NPWU43TW9oOUdvZmZZd1NZc2J5WFFUeWRHcGN1?=
 =?utf-8?Q?D2Mm9z4wLiwNZqPl7BgtJELBmaEUzM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 04:20:47.9048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315724b3-623f-4d8f-fb20-08de06eb392d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

v2: Removed excess debug logs (Vitaly)

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
index 93e04f046..ae03d65c3 100644
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
+#ifndef AMDGPU_GPU_PAGE_SIZE
+#define AMDGPU_GPU_PAGE_SIZE 4096u
+#endif
 
 #define BUFFER_SIZE (4*1024)
 #define BUFFER_ALIGN (4*1024)
@@ -248,6 +258,55 @@ amdgpu_bo_find_by_cpu_mapping(amdgpu_device_handle device_handle)
 				     bo_mc_address, 4096);
 }
 
+static bool page_size_ok_4k(void)
+{
+	long ps;
+
+	ps = sysconf(_SC_PAGESIZE);
+	if (ps <= 0)
+		return false;
+	if ((unsigned long)ps > AMDGPU_GPU_PAGE_SIZE)
+		return false;
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
+	if (!page_size_ok_4k())
+		igt_skip("[mmio_remap] PAGE_SIZE > 4K, no MMIO_REMAP remap page\n");
+
+	memset(&req, 0, sizeof(req));
+	req.alloc_size     = AMDGPU_GPU_PAGE_SIZE;
+	req.phys_alignment = AMDGPU_GPU_PAGE_SIZE;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+
+	bo = NULL;
+	r = amdgpu_bo_alloc(device, &req, &bo);
+	if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL) {
+		if (bo)
+			(void)amdgpu_bo_free(bo);
+		igt_skip("[mmio_remap] MMIO_REMAP not available on this platform (%s)\n",
+			 amdgpu_errname(r));
+	}
+	igt_assert_f(!r, "[mmio_remap] alloc failed: %s\n", amdgpu_errname(r));
+	igt_assert(bo);
+
+	r = amdgpu_bo_free(bo);
+	igt_assert_eq(r, 0);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -285,6 +344,9 @@ igt_main
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

