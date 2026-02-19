Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9661E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CA710E130;
	Thu, 19 Feb 2026 05:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gf+pn8rB";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0410E130
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd/mfQAznQlZqShXn2HSXzvefrtGm13FPepdPLh7djy2E9fN5kFdRW/3tmDl36lnWTCRxF5mJbeTHTj/osdKZYWIfKm/fLDkSlL42dLNRFyj02QUTKfEOXqDqAFUkUxKBp8P0FpHix4HgC3UnA1y7l4PB1O3s21foFChIcqvpTcrjlBYcYiX9Ty67LteqIEo2KkljrsOSncZUCgTX3MV0uoh+Gq6nrQna8wHz0g/orUSMwzG8m8eJxGDEzyf33dWIFQ+yIkZ0/EDg/nXFBBVWEjq+oFU4aLmRR8HaTXOXM2VNJpxIvcK0DYcafb/NVDZb9FATYzg/A9fHUBXU2cgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTpf70PpEXHATlpn2bH/MsmlnI6tMUeSFZyEunY/v7w=;
 b=HzFrV3zftn7NI+SBxXDT4hwz0uoUjXPrwIa9z8lnTTgTLWXJ3Vnopxioc/PAkihFBImlydEt8YcNJl5aF8OYWoRAZn3sVdL6oD4xeOresitRptul2om9Cr1zqi7XKysd94ceEWXef4zrIUv9uUf0BKW1oT1U4D/l+VAKqgEPkdQdNwiWVVkTlBREr4voDTGoYOUYoRdTqPYClUC2iw4ylnh6xu92YbXf3F60+AHYB4k1a+feBfoVMm9E9iEPR5c2t3W9HODplmcW/HNtsgl+1HXjyMwZX6GvONgyJC+vzkZDyqr8hFoQIWAXNm2XH+4/5cc9zAKG+kgqudWEspxtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTpf70PpEXHATlpn2bH/MsmlnI6tMUeSFZyEunY/v7w=;
 b=gf+pn8rBMvtwji5EeOaMTbfFjhK9E669VP929rlIZyJLQH6sFkeXOc6gyTuKYkLIa6isZhSKzkf+sujhv8SdbtjpFZonO3my6AQ+wmZA47JGeb+GG0GbihBOY2DaVdJr+cTzPfBFcKbwy/OM7ZHuEa3jMXlnuvqPOVAuFUR1HVM=
Received: from BN0PR02CA0045.namprd02.prod.outlook.com (2603:10b6:408:e5::20)
 by CH1PPF931B95D07.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::619) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 19 Feb
 2026 05:16:35 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::8d) by BN0PR02CA0045.outlook.office365.com
 (2603:10b6:408:e5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 05:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 05:16:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 23:16:34 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 23:16:33 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 1/4] lib/amdgpu: add DMA hardware limits struct and query API
Date: Thu, 19 Feb 2026 00:14:16 -0500
Message-ID: <20260219051630.127667-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: 1764bcac-39db-48a1-033e-08de6f760d0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JqS4IvK8O9vmy/2TdPnWpHmQRm4/gnaSsKW8iGigNqWkEs4/LTFTgtkZ9hg6?=
 =?us-ascii?Q?DRpAGIFEagXZzBXDjWTyQLHKlhzpHw/6sq9uQjot8zOnMuRqvEwWICgBMHGl?=
 =?us-ascii?Q?43x4+yNcJNg4DqYUkEIDWNEgrHIa/Xgsi5fy0b3UcXM6CRXeLE0YNPHKipo6?=
 =?us-ascii?Q?4aBFtzu2tZxofJ+XcZETQ3zZYltlGuqOpQwHamys9u0UXNzW8RqWhedK20pJ?=
 =?us-ascii?Q?HzNNGocuwjVUXZRl8MAmqL+Ha0uXavKNvjZnoBlXRGWedCAbwU/KsFiZM0Wz?=
 =?us-ascii?Q?vweMD+WYGLda8PSazVkU5qEnkR9vbSflrrJ4O8nIwyWLW3d2G+kWkCxin+tJ?=
 =?us-ascii?Q?Y6h0HYV7rLw6ycDc/iVsSN5wiCJo93m1OX+o6U/wRhDBbjmmEd4uS4siwFYe?=
 =?us-ascii?Q?jhoj54tHDSWoo/YytlK/eCW5I72+YfuUsak9+ENV0p3OOe29EMduBFwFyHp4?=
 =?us-ascii?Q?hXa3lDARg4BrmGLXgc+9uvwKf6koIiuxY7JWF1MCRqNh3B1VPcjxtrYhPD8j?=
 =?us-ascii?Q?qwi8CD11zE3Kwjf7Ww7YkaxGDJLAnUj1TsdsgtwjsFmcfPTtoBNW6mWHyVcA?=
 =?us-ascii?Q?g18/JFg5GDJ/ydpbZX1P1GwQ001+1TFMdlnHoiuwhY0kOFeZ5qq36sP9kEVm?=
 =?us-ascii?Q?PyvdewHAHU2ETciNmeWiyd2Vw1AwfdVfrCRWbis6akZgZBZunXl8oKvnxE7j?=
 =?us-ascii?Q?kBpMboSshzUtjWONhRwNEbAvMMK0Ljg0Ma2zpkSIbv3CWWroGrS66LCRxt8D?=
 =?us-ascii?Q?aYTXmaosAktmS59MgUNt1r5HKg3hRdbR66syViXPWwgIvy4x2k7IqQjFLwQI?=
 =?us-ascii?Q?eLXxIQrMm8/C6SIobVyWJ9wWGBbzA865mfaCF6u7VPazV1GSyZYKwVVQ7r7g?=
 =?us-ascii?Q?6C9QLsG0ggRRIWliDzZrc3T0BwyIHEjut0GJRzO+kbEDyXSPG8TtCf9ygFUx?=
 =?us-ascii?Q?T3HMKEg/6CIyBnSYM7kfjtd57n3NT8wTp2U8vomL6jazp+/+WDnMxDq8uk5K?=
 =?us-ascii?Q?BRgbvyGqCu5gGhHm7eH4HBC+v/Re/1tZjBt/kOW4+OXtgNI1dlZVOAwITb3+?=
 =?us-ascii?Q?xpJG0+xtVsXj3ZEy+qIAxLak7tAZl0Vr9aeSnqvf1OjMoB87T2xKAjb2rGq+?=
 =?us-ascii?Q?/E8Duf29MEU0CIyKuGmeu6hJEQH8nL30Wjx6KfF++ika3PMMQbhq/B2SKtFn?=
 =?us-ascii?Q?tWaBJggYKBQtHuwj+k/OEcIDDzoOWbgAstOi/PI9uKsjmdKbZqEyacEV6Oks?=
 =?us-ascii?Q?finZYyVA3vbJHIfRDUlI+MUS2OoD5Cz/wkXqZw5JStCWj/lyz3ijBfnf3erM?=
 =?us-ascii?Q?deUdQIrnJG+VonyMFMGuk9I4rKZJd+C5WrvK2JF+1vth54oOKiB/A64ctm5q?=
 =?us-ascii?Q?QO3R2psbACWh6xNGCjVQdvbUNTCsxP7TpNSwzo+mNHVoEX47UCe/v5IhUUMh?=
 =?us-ascii?Q?M8ROGmGiukLQ4vBdpLRi9ThMzzRbDifLvsGXVh9h03r6fQv/vajJWkkfCN3e?=
 =?us-ascii?Q?9z0Cu1weucTpS6WhlO9JnDsGHg5OSaj3QYklWgwre159iTmMFqqBZh3F/Gfi?=
 =?us-ascii?Q?A2aAc0+kucZr9VvsaqQlHie9IYMbVFg2zS49km4by+fwBOadwomrR5WG5Bwv?=
 =?us-ascii?Q?HQx8yo4zLxIrVbPDCKz0SYnRr6NKmj6Swu702MUxZ9Qq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T5BfgCY+XeAsPyNnrdnTZVfNlxhyxi3vLJriWfLxVwkFKLcYymOgxJ58sjQ5ooSsqC+UZKeYpukfmYwYFlnJT1rtNcT5+yk6TvIJ9i9SoNS2pLX+QiRonRgE48lGSo9dDxEIWogMVbqOw73DiWPiLd3D5CFXg82/HXhiRKV9Zzpg2bPScclaGJMcT6TwdOzSe9BASwZ2Gqt5fFV4hkmSKiNLki+cq6Af/3h8hpHxH12CdD1GN9IfOewl6cuhXn2/o/HZ7+hZsWlz+PFQX5YfqkIl2LuKAvrrkkxp0cq03fVM+XuaoLl3wywItiMR6IfdM4KKhWmbgczbTSi68WVEw8dYWl+RscIEfAMHBhY7ADFWRoBwbshGfaLcoUd+oujLpoiDK/FA2zFyJKPZzq65zQF+zwcZDo7KfWdB5licrnRoZq8Wl1Aml82if/DIojGq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 05:16:34.8476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1764bcac-39db-48a1-033e-08de6f760d0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07
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

Add struct amdgpu_dma_limits to hold per-IP maximum transfer sizes
and safe defaults, all expressed in BYTES.  Add amdgpu_dma_limits_query()
to populate the struct by querying SDMA firmware version and using
known GFX CP_DMA limits.

Hardware limits by IP:
  SDMA: varies by generation (21-30 bit COUNT field in bytes)
    v1-2 (SI..VI):   ~2 MB  (0x1fffff)
    v3   (AI):        ~4 MB  (0x3fffe0)
    v4.0 (NV10):      ~4 MB  ((1<<22)-1)
    v4.4+ / v5.2+:   ~1 GB  ((1<<30)-1)
    v6+  (GC12):     ~1 GB  ((1<<30)-1)
  GFX/Compute:  CP_DMA DMA_DATA size is 26 bits in bytes (64 MB max)

Inline helpers amdgpu_dma_max_bytes() and amdgpu_dma_default_bytes()
select the right limit or default for a given IP type.

This is pure additive infrastructure: no behavior changes yet.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Id407c254f15a6612db8fa986c0fc7c8ebf0f01e6
---
 lib/amdgpu/amd_command_submission.c | 69 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  8 ++++
 lib/amdgpu/amd_ip_blocks.h          | 49 ++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 52327c69e..84f4d01d6 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1439,3 +1439,72 @@ uint32_t cmd_get_available_rings(amdgpu_device_handle device,
 		return __builtin_popcountll(hw_ip_info.available_rings);
 	}
 }
+
+/**
+ * get_sdma_max_bytes - query SDMA IP version and return max transfer size
+ *
+ * The SDMA COUNT field width varies by generation:
+ *   v1-2 (SI..VI):  21 bits = 0x1fffff bytes   (~2 MB)
+ *   v3   (AI):      22 bits, 32B aligned = 0x3fffe0 (~4 MB)
+ *   v4.0 (NV10):    22 bits = (1<<22)-1   (~4 MB)
+ *   v4.4+ (NV4x):   30 bits = (1<<30)-1   (~1 GB)
+ *   v5.0 (GC11):    22 bits = (1<<22)-1   (~4 MB)
+ *   v5.2+ (GC11.5): 30 bits = (1<<30)-1   (~1 GB)
+ *   v6+   (GC12):   30 bits = (1<<30)-1   (~1 GB)
+ */
+static uint64_t
+get_sdma_max_bytes(amdgpu_device_handle device)
+{
+	struct drm_amdgpu_info_hw_ip ip = {0};
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_DMA, 0, &ip);
+	igt_assert_eq(r, 0);
+
+	if (ip.hw_ip_version_major <= 2)
+		return 0x1fffffULL;
+	else if (ip.hw_ip_version_major == 3)
+		return 0x3fffe0ULL;
+	else if (ip.hw_ip_version_major == 4 && ip.hw_ip_version_minor == 0)
+		return (1ULL << 22) - 1;
+	else if (ip.hw_ip_version_major == 4 && ip.hw_ip_version_minor >= 4)
+		return (1ULL << 30) - 1;
+	else if (ip.hw_ip_version_major == 5 && ip.hw_ip_version_minor == 0)
+		return (1ULL << 22) - 1;
+	else if (ip.hw_ip_version_major == 5 && ip.hw_ip_version_minor >= 2)
+		return (1ULL << 30) - 1;
+	else if (ip.hw_ip_version_major >= 6)
+		return (1ULL << 30) - 1;
+
+	igt_skip("Unknown SDMA IP version");
+	return 0;
+}
+
+/**
+ * GFX/Compute use PACKET3_DMA_DATA for fill/copy whose size field is
+ * 26 bits in BYTES (max 64 MB).  PACKET3_WRITE_DATA inline count
+ * is 14 bits in DWORDs (max 16384 DW = 64 KB), but that limit is
+ * handled by pm4 buffer sizing, not by this struct.
+ */
+#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB */
+
+void
+amdgpu_dma_limits_query(amdgpu_device_handle device,
+			    struct amdgpu_dma_limits *limits)
+{
+	memset(limits, 0, sizeof(*limits));
+
+	limits->sdma_max_bytes    = get_sdma_max_bytes(device);
+	limits->gfx_max_bytes     = GFX_CP_DMA_MAX_BYTES;
+	limits->compute_max_bytes = GFX_CP_DMA_MAX_BYTES;
+
+	/*
+	 * Default safe small sizes for quick smoke tests.
+	 * write_linear uses inline data so keep it small (512 bytes = 128 DW).
+	 * const_fill and copy_linear have no inline data, can be larger.
+	 */
+	limits->sdma_default_bytes    = 512;    /* 128 DWORDs */
+	limits->gfx_default_bytes     = 1024;   /* 256 DWORDs */
+	limits->compute_default_bytes = 1024;   /* 256 DWORDs */
+}
+
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 7826c2d0f..331889161 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -121,4 +121,12 @@ bool cmd_ring_available(amdgpu_device_handle device,
 uint32_t cmd_get_available_rings(amdgpu_device_handle device,
                                  enum amd_ip_block_type ip_type,
                                 bool user_queue);
+
+/**
+ * Query HW and populate DMA transfer limits.
+ * All fields in the returned struct are in BYTES.
+ */
+void amdgpu_dma_limits_query(amdgpu_device_handle device,
+                             struct amdgpu_dma_limits *limits);
+
 #endif
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 424b3210a..bb10a9a0e 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -208,6 +208,55 @@ struct amdgpu_cs_err_codes {
 	int err_code_wait_for_fence;
 };
 
+/**
+ * struct amdgpu_dma_limits - hardware transfer limits per IP block
+ *
+ * All sizes are in BYTES.  Packet builders convert internally
+ * (e.g. /4 for DWORD counts in SDMA inline data or GFX PACKET3).
+ *
+ * Queried once with amdgpu_dma_limits_query(), then passed to helpers.
+ */
+struct amdgpu_dma_limits {
+	uint64_t sdma_max_bytes;        /* max SDMA write/fill/copy per packet */
+	uint64_t gfx_max_bytes;         /* max GFX CP_DMA fill/copy per packet */
+	uint64_t compute_max_bytes;     /* max Compute CP_DMA per packet */
+
+	/* safe small sizes for quick smoke tests (bytes) */
+	uint64_t sdma_default_bytes;
+	uint64_t gfx_default_bytes;
+	uint64_t compute_default_bytes;
+};
+
+/**
+ * amdgpu_dma_max_bytes - return HW max transfer size for an IP type
+ */
+static inline uint64_t
+amdgpu_dma_max_bytes(const struct amdgpu_dma_limits *lim,
+		     unsigned int ip_type)
+{
+	switch (ip_type) {
+	case AMDGPU_HW_IP_DMA:     return lim->sdma_max_bytes;
+	case AMDGPU_HW_IP_GFX:     return lim->gfx_max_bytes;
+	case AMDGPU_HW_IP_COMPUTE: return lim->compute_max_bytes;
+	default:                    return lim->sdma_default_bytes;
+	}
+}
+
+/**
+ * amdgpu_dma_default_bytes - return safe small test size for an IP type
+ */
+static inline uint64_t
+amdgpu_dma_default_bytes(const struct amdgpu_dma_limits *lim,
+			 unsigned int ip_type)
+{
+	switch (ip_type) {
+	case AMDGPU_HW_IP_DMA:     return lim->sdma_default_bytes;
+	case AMDGPU_HW_IP_GFX:     return lim->gfx_default_bytes;
+	case AMDGPU_HW_IP_COMPUTE: return lim->compute_default_bytes;
+	default:                    return lim->sdma_default_bytes;
+	}
+}
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
-- 
2.52.0

