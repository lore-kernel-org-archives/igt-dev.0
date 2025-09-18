Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F416DCAC59F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 08:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B6510E320;
	Thu, 18 Sep 2025 08:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r3NAbI9G";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011026.outbound.protection.outlook.com
 [40.93.194.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABA310E6C9
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 08:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/PokZdqD09+lA3eY5t4JKh2hvt7voLaoc0/WS8KKqGF+DI4Om8ZXaJEtBaF7JtK9fMehFe+rNmNVM7AD/l60z9Af9aFHBbZOrr73n55AuBj9vBTG5KTU8YJYugfWEHFi+KY33COeVVFKn/oKujbErDcyWbgrwm2Z+Rw88tx62PjCk8E10XCarofg0NpiXXtn+z3wjMJ7nvhOn+dIWedkF880Kmr91341ziG9HmqZtK9QENl90yRHEVKOhA6ri0r6Q3CdJx1ulqWu7AyXESwY+1zbei9lJnovmolWNzthluXhDbeqIwwjbCrQP47TOpXmJxMRjruS86yQjrJPaW46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY9QszxHcv4V7gzahs96IYF2TFI83r+QUbO8ZE65X2g=;
 b=HpG6JD/J4fJ/ZEz3j0RyINYUMAWYK6FwhrhwSXxAWPbnEyCSbiVPHKH/xTn9ZdDaldANb1x8NotgS29W4C0bjwPLF6pss3qlRHZ2fps8Wfbm32XCndS9rZdltsvWDu6hTLyVIQ4+/HEOoPzSJkpDL39CzUsJ05n+huTp4Y3SSDARSeSGWfRGEeUNN9J70w3RvP1xeNmIGxezj6NxHxhngOa8IzQ/JAOlFeIDfH1NYKJfilbQUzEkKcvkYSOmjQAXHjvmQsZ3zuMwMIjAegCM5cKyrXHIg3lyvrnjvSrVkkYDNQee9gXa4H8htT7HUJBeFEDLQIxgv1hQoPT0ZbVzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY9QszxHcv4V7gzahs96IYF2TFI83r+QUbO8ZE65X2g=;
 b=r3NAbI9G04QMixlm7Ul85OG32Oax9zjexmySXRnpliFZMahTzDLGGojcnQCW/KdFCwMyMTjdrmz37jwtQkTBGlzMk8kTlQrW0xs3xjzhoMFTbuwrvnhejVLUtydTPMYCOlPtYhZG4EC7Fg4SgF1pBf2TElyaZD7T7v7R0vdaPA8=
Received: from MW4PR04CA0340.namprd04.prod.outlook.com (2603:10b6:303:8a::15)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Thu, 18 Sep
 2025 08:47:17 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::c5) by MW4PR04CA0340.outlook.office365.com
 (2603:10b6:303:8a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Thu,
 18 Sep 2025 08:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 08:47:17 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 01:47:13 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP
 flush) subtest
Date: Thu, 18 Sep 2025 14:16:55 +0530
Message-ID: <20250918084655.2192395-3-srinivasan.shanmugam@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c6e4e5-a31f-462e-58d2-08ddf68ff8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJCdGd1R0l1TDFrMDVROW9pOGZUK2RSeURTMjQ3UEVSM2hzRWcyN20rNk43?=
 =?utf-8?B?RUVSUWExdW1ZK3hDRTZmNklUR1FSclhxQUdvbVE2b2ZYQVE2LzlWNG9nZzNi?=
 =?utf-8?B?SXl4Q243UXllUjFSWGdOcU12Mm05OEo0OFR5V1p4TGpNZk15b2x0bTE3QjNh?=
 =?utf-8?B?NitYVit4WXN6RkpSQUh0NGRHQU9lcmZ0KzBuczkvMW5FQnRvNDJMUDV3QXl5?=
 =?utf-8?B?alVLQVpINkpwempKUUZ2Z3BFT2loQi9PWU1PYVY2b2cyMW9sNnd3SGFNNXNo?=
 =?utf-8?B?eVRIcGhQYWlDTVVTVjdlUWQxZGQwR1NWNEFubjh1M3o1OGduKzB5V3ZQTkND?=
 =?utf-8?B?ZUNETDlBaVlJVmlnVFZCZTdpUXlhWDBVU3RyWmkyQ3IzK1JMRmlTS2FWb01p?=
 =?utf-8?B?RVBYT1ZidzVQRkwzQXVjTXloYVBrRlVRRzhob0t5aktERno2ZmtUalMyeTVM?=
 =?utf-8?B?ZStKbExXWmFKdlFtWFcrMXpsV2s5VFlwTXFiV3FTbEZZclN5SGxLZ211QjZu?=
 =?utf-8?B?NGdQV2tHM0lTaDlhdHpkN0ZPWmRibG1tRjlvYlN4ZU9KbnJEMmFNdjR0N24x?=
 =?utf-8?B?UEh1RjVmeFFDSldlcHNYY1JCRG00anl1RVJmaXhwY3RkdWRyOUliWlVIRXZO?=
 =?utf-8?B?SEdTdWFHOExGYkkxMWNaVDRVcnExTlUrSzJpSkJwSlBWYUVnT1lwMFJEZ2Ji?=
 =?utf-8?B?Wk1vd0dWOWJiakhYblU1Vlo3bUZOajdqeVdyK0NuVjcvM1NWdjU2QUxwUUwy?=
 =?utf-8?B?ZlhOaEpzK2IrRWcyUWlDc09rN3c0ZERUL3JYT0o4eXhrUkVHTXU0OEtiU2R4?=
 =?utf-8?B?emlrWGs4WC9MZFd0V3BTbFVNeUNwdWI1TkdQUTZ3K3FOYW9zcVRONm9XVHR6?=
 =?utf-8?B?cyttZ3MzWDVSR2tXQzFlQkZkUUdqVDhBOWtuVTQ5UzFqUG1sY0ROamZKZXds?=
 =?utf-8?B?QzE2OHNrS0J0TmpFU2VaWktrYWdGMWlqRGR5ZzltVGtOQkt1L1FJaDVxK2J1?=
 =?utf-8?B?d1lSODZXZjRIV3F4bU1jazhzcHdNdjZCd09wZnVnS0lrRFV4QnRkRFhPK3V1?=
 =?utf-8?B?TjhBdWd5VFlRY3lONDB6QkVkRGUrdnVuTVJhMFZKa0NUT1l6RXhWT0lxVnly?=
 =?utf-8?B?ajFrVkVCOEt2VG54Y1E4ODNvMjhjakhmU0U5bFUyclhlWnMwbVBjaUpMT0hI?=
 =?utf-8?B?OUc5T2JYMnAvTnNWbEJTSGl2MFJVd3JDOVRyUVpKNkI5N3c0RGlCNC9BQmVm?=
 =?utf-8?B?ODBkQ0l3U0wvYUdTNG9sS0pBV0NQSGYwU1hTTGhHVTdwMGFzRXZjUmJpcHlU?=
 =?utf-8?B?eEdWVURzaEtCTzBRT203dkU3bUl0NW1UQnljR3dvb0gzUlV2b1dMZ2hSVG1m?=
 =?utf-8?B?Ri9ucjlaOE9hWkpqeGhpL1pmdTJCZFpiRFFkTU9adUVYVGltTG9mQzl4aG5s?=
 =?utf-8?B?SCtoVklzeExaa1F5M2Q2dCt6UUtCMmpDUzdkRmFVS2syazlYMTRtZXluL1JY?=
 =?utf-8?B?N01Cdm5lUkdFM2lGeEp6d01ZTUN3ZXpTU1JLdCs1M0VNa0pRZTdmN0lvc1dK?=
 =?utf-8?B?dDdMNXd4Y0tBeUM2cnptYjBaenNGV3F3U3VmWWtCU0dhWlluMmQzbFYzR21F?=
 =?utf-8?B?NTlMcmNYNklrRmNEb0YvZHluaWVjYUpaSm1lTmlnbFpUUmt3YkxESjR2OUN1?=
 =?utf-8?B?Q0ozRXRXekZsdnQvcGtWTkN1UlYwbWUwNjM0RkVRVW9tSDdONHBQSVNrVFYv?=
 =?utf-8?B?UkVvVmtMY0xjOThCejlnOWp2TGN2MkNEMmFhRVo5OVFpY1NqVDF0bEVmS0kw?=
 =?utf-8?B?alBaZkhvNk12NTRYOXphWVIwaU5xSCsvNjlWZHdObTd2Q1lkYldidDVmcHdJ?=
 =?utf-8?B?Q1ZKNzRNWDR5YUVJQXV2elYyWjhZQ24yQ1JNbkNSK045dzlyVHc4a1c0dzV2?=
 =?utf-8?B?MFlnc3VRcUVwdHUwOHo2elJ3MjJVdlBmOE9tcW5oTjJNMHZkUmRqZEhHMCsw?=
 =?utf-8?B?NlIxTzZ5cnBnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:47:17.0235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c6e4e5-a31f-462e-58d2-08ddf68ff8cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 tests/amdgpu/amd_bo.c | 66 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/amdgpu/amd_bo.c b/tests/amdgpu/amd_bo.c
index ef9fe72b9..165faae3b 100644
--- a/tests/amdgpu/amd_bo.c
+++ b/tests/amdgpu/amd_bo.c
@@ -20,6 +20,9 @@
 #ifndef AMDGPU_PAGE_SIZE
 #define AMDGPU_PAGE_SIZE 4096u
 #endif
+#ifndef MMIO_REMAP_HDP_MEM_FLUSH_CNTL
+#define MMIO_REMAP_HDP_MEM_FLUSH_CNTL 0x0000u /* offset 0 on remap page */
+#endif
 
 #define BUFFER_SIZE (4*1024)
 #define BUFFER_ALIGN (4*1024)
@@ -284,6 +287,66 @@ static const char *amdgpu_errname(int r)
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
+	igt_info("[mmio_remap] ENTER %s(dev=%p)\n", __func__, (void *)dev);
+
+	if (!page_size_ok_4k())
+		igt_skip("[mmio_remap] PAGE_SIZE > 4K, no remap page available\n");
+
+	memset(&req, 0, sizeof(req));
+	req.alloc_size     = AMDGPU_PAGE_SIZE;
+	req.phys_alignment = AMDGPU_PAGE_SIZE;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_MMIO_REMAP;
+	req.flags          = 0;
+
+	remap_bo  = NULL;
+	remap_cpu = NULL;
+
+	r = amdgpu_bo_alloc(dev, &req, &remap_bo);
+	igt_info("[mmio_remap] amdgpu_bo_alloc(MMIO_REMAP) -> r=%d (%s), bo=%p\n",
+		 r, amdgpu_errname(r), (void *)remap_bo);
+
+	/* Feature not present -> skip, not fail */
+	if (r == -EOPNOTSUPP || r == -ENODEV || r == -EINVAL)
+		igt_skip("[mmio_remap] MMIO_REMAP not available on this platform (%s)\n",
+			 amdgpu_errname(r));
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
+	/* Write-1-to-flush; a second write is harmless. */
+	igt_info("[mmio_remap] Poking HDP_MEM_FLUSH_CNTL (idx=%u)\n", flush_idx);
+	mmio[flush_idx] = 0x1;
+	mmio[flush_idx] = 0x1;
+	(void)mmio[flush_idx]; /* post the write to HW */
+
+	/* Cleanup */
+	r = amdgpu_bo_cpu_unmap(remap_bo);
+	igt_info("[mmio_remap] amdgpu_bo_cpu_unmap -> r=%d (%s)\n", r, amdgpu_errname(r));
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_free(remap_bo);
+	igt_info("[mmio_remap] amdgpu_bo_free -> r=%d (%s)\n", r, amdgpu_errname(r));
+	igt_assert_eq(r, 0);
+
+	igt_info("[mmio_remap] EXIT %s()\n", __func__);
+}
+
 static void
 amdgpu_mmio_remap_gem_create_close(amdgpu_device_handle device)
 {
@@ -363,6 +426,9 @@ igt_main
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

