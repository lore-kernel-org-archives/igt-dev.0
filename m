Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067A0C61DF0
	for <igt-dev@archiver.kernel.org>; Sun, 22 Feb 2026 02:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3510E0E6;
	Sun, 22 Feb 2026 02:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nan2c5e5";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD710E0E6
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Feb 2026 02:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/YUL0XJVH+HTL7GwFDioa+dYLW1d6AAX6aHEw9x9WiF2j1iqazoG4/GGZe6raaLjb0SMLQkERq6m5aFuq0pwof5BHQV/MnxEhsF4btkRyZZO6567OeWvYG92zGXbczUf7rUL9ZvrueCAISXnY2GD4DtBmmd3ncqrjL4JhQ1PCSWYQyGMeY53xLR7D/tQz9gFWkiH3fGt3ImbFCq3i5Gs5ns8K7McLvqey5loiUGkGF88kF4UHOV/LjbnhXcpcIzkDKoWUc736fcWUn3upBv8Ya//BiHA5eo9j2MVsTXjlzS3NrPeXgFgMWqQLQ54rN+6AxHLvtVgT74qSpvWLUSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4ptaOFK76yyZq8h1YgEuTTXoV8mvDGSBrhlAe5FZ4U=;
 b=g/o326cq6S+asqqKO8hRWwu1ElaBrWwT62jaQDoYlS9XOKFt7Wg8zcZOgavsksIW1hSYkrB5l6QPvUPO88SshbaAEOI9Twh5Y9aOUK+7W7DAktsGR1tLEXHqZjW6958lD1Y6Fx5dUTt7372v99WbFASxGTe4bm3uKzq84iws50BRtYA86MuIrbNIqnRRlm0iHlhoxM4rTs3G+ZnpVoOqXKzMGoqzxdQa1+w+1nWShLqUUvDZhRJPXZO/0fdYmAmiJKTSG060RGGl6vkRw3TovEyGmfOnunq8tVGqnoG5+nOy67Fo5taP1/5WssyWku5M0na/tVIwQ9Gqolu03RUoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4ptaOFK76yyZq8h1YgEuTTXoV8mvDGSBrhlAe5FZ4U=;
 b=Nan2c5e5KuCYEPws0gfMCXnFwOxNvPjGUmLRnThDXKBr7PurpLyv0rKS31HZ0Ore19KHkmgoGg+ZXV10ClmEL3wP9pZKrewHoMMLbvvFlz3jDRU3Zfb5+mmNylqDmGDvl1Pft+vQ4K2KN5qEtCFs56+WlH3lV9zCl7jkQW/i5yo=
Received: from BL1PR13CA0330.namprd13.prod.outlook.com (2603:10b6:208:2c1::35)
 by LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 22 Feb
 2026 02:26:09 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::db) by BL1PR13CA0330.outlook.office365.com
 (2603:10b6:208:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Sun,
 22 Feb 2026 02:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sun, 22 Feb 2026 02:26:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 21 Feb
 2026 20:26:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 21 Feb
 2026 20:26:08 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 21 Feb 2026 20:26:08 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 1/4] lib/amdgpu: add DMA hardware limits struct and query API
Date: Sat, 21 Feb 2026 21:23:52 -0500
Message-ID: <20260222022606.160188-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: d095a9db-e05c-47be-6bc0-08de71b9bd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4sZ4sNXgpKFI2Q9yrNjR4eyX0eFJsXFnz3z7YiLy92JnVowlKX3bnPd+3kR?=
 =?us-ascii?Q?K4Ct4tt5BqcUwvAifMeWFEXpgRyPxRzQwsStXF++azQtYihhJG3FIhfJ5CfC?=
 =?us-ascii?Q?ekDbmAZG11eENzrKvs1ND3LHSqlDU4+H07M+ByoA8msCov0qRSYLOSGdk6MN?=
 =?us-ascii?Q?uvdsShfDI1aGzp4W1oimJOa7LtkCk5dMZlve0icWtWehZYKrsePayUOCFsOb?=
 =?us-ascii?Q?yAXxAyPY5lG3GDHyUFnB2eEIqeIIHtH1DwNQ4pqgH58pwtm3k9Hqz0tGqGtW?=
 =?us-ascii?Q?iuxei1klSmi+aii4+4LibVlQFzgMeJFksllYJ0oXvnPcD1MZi5VUF993+ByD?=
 =?us-ascii?Q?kYpYzrmiCboRejP3VwJUb/QPSbt3LFMMHuGsuomR4ZPx/1R/MQKndTwIRtCg?=
 =?us-ascii?Q?VUSggp/8CCFeTID775gjT+PVtpZnM6pkiyrw8Jud9OvLS5IkINT7aTtpLjhn?=
 =?us-ascii?Q?vfbyx84s6kihZyxw7JXlq7mbne9PfPj5mszdQ6aO21radhoso2ncgMzhWez3?=
 =?us-ascii?Q?l8VunRpVoCi8Aqy2pTqTb51GN7WIWP0yQKWmatZaZDkt+p74WUkICteko/q7?=
 =?us-ascii?Q?EZgijT7EtdiNVglVulLi4NtZeBeyINfAhM7xHFzjE/lTtuu0s0rKxBgbJA7Q?=
 =?us-ascii?Q?S2Xs4kf4zo/3kUbYYj0EgH8nXufSOQQbmH4ql7/x2ZhMUdHPGkbX5Zbuo/kY?=
 =?us-ascii?Q?tQ2JuhDkO9jLqY11ZHVGRSBxKXLky/e4p8oMGO0fhfn9dWdgLXi5R9sRLJBY?=
 =?us-ascii?Q?jyDIb5SbWywzxDc//InNvllQCRXFd/QQYFoZ7OH20jGEKPH7C2KsZ5PmbSOu?=
 =?us-ascii?Q?nUx8wkIJAMlk1gqzX7w0ipGdBEOx3epyaHt76WAiglYQVogB/+YanmOT3ngq?=
 =?us-ascii?Q?APckLZ45PF/lUS/8Ncyz0YttD6krorq25BqfhwFNoLT7UGrbXsh1Gm/mNUQP?=
 =?us-ascii?Q?8MExuJqJAAtla4utJ4IVScyb9GkZMdaIv3zlvToUcEY58cXyNv+tHlyu4T8c?=
 =?us-ascii?Q?qEEz9VimH7zKROeSwUqn9eQlMHVQieZeeJ+ZYA4lUIyMzvjcXsMPOdvI6esC?=
 =?us-ascii?Q?5neEWlEoah8bWFpja8HrRhZcn7SrJDj6Ud/GUrZkwwMXK45EKEYUSLo3g39c?=
 =?us-ascii?Q?inghd/FiQyaAUf3mHmSlxPTk5FmR1NrJwXwJ41xefKexrTzWg5GNJnRnEZ0q?=
 =?us-ascii?Q?lhqzQ8uES+u70zjtxWdCdE/nQ771UNEdYBdva259uMiiNzq4t1oOaPWXV0eZ?=
 =?us-ascii?Q?a/3r1itixqOOkaJCwkJrfY30eZeCbuXB/aqUE86klJ3c6Tjd+4zzfP6SMYAE?=
 =?us-ascii?Q?2QmAMbc24jZPZbq4BqjkJTJJ+z6o/bhEuRt1wwMhpj8A3LCNVV5Azc8AV6R7?=
 =?us-ascii?Q?reRiXp21ahbtZskdEzzIg3jVgaANdpUFL8m4ynwj1FgItZCZTi/P66ICgrh6?=
 =?us-ascii?Q?Pb4zGYFFlZtX+MqFd8yoXMb6bNG67py3xQzz0VwRAjAdDTTCVfmB6B5r9dmQ?=
 =?us-ascii?Q?jHE8b4NWC2v+NjfbATIQIkqb+abzBCEZq7+V2mAhD6viGb3wb6UmgdPVpul0?=
 =?us-ascii?Q?KbVcTv8fJDzmyqDXT37NcsS1tL19f33Fhbob3t2L29Z8uFw846m/vrNmQWe0?=
 =?us-ascii?Q?JmxDOhzmkW8nPJ6Z8x2w6AUE3m2Y/91WtdBE9QUFQEwyuzCumPrnJ5TEklHp?=
 =?us-ascii?Q?ARaxEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +scm0D6wMkEKu5XwjfoXWDYQKMPhX+cIiPkFWle8tEQj3rDI0F0djQUzFJ6JHU/wf3jRQ7gKqDOywYdQo5whnlpJzGGkcyeMiEQOfMgTzQQ+kIyJVeQbTH9uQ22tuJ+Lcbr4nzD7Txc+ZwqmtRg34ZDLtAn3j/6agDrBWCyWJ7Ux/3eSon8NHIZJxqfkiITsn2V/9AlTc+qf0vlzRAKGETsNMBcRP9LRNozppo6r1I2i08/RBhxqHDGGMnEbS2c3JHtS5muBVqRhlouj4byIl5VFtvee5mbwZ6Em16+lug3A9aDNsHsS1PoegrUYDTgJSE015jq0ZzfLAWkkTo/OTfwHdn3B+1Lkg0J4A7bKkLDOhl6yp9WmC+deCKwBAB1fjVgQX7SxyN869RqclNHgySqOX9n5/pq0dYG+y1RMwkmIuRt3ue9PAEBQmMtg19IZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 02:26:09.5668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d095a9db-e05c-47be-6bc0-08de71b9bd8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120
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
    v1-2 (SI):        ~2 MB  (0x1fffff)
    v3   (VI):        ~4 MB  (0x3fffe0)
    v4   (Vega):       4 MB  (1<<22)    [COUNT-1 encoding]
    v4.4 (MI):         1 GB  (1<<30)    [COUNT-1 encoding]
    v5.0 (NV1x):       4 MB  (1<<22)    [COUNT-1 encoding]
    v5.2 (NV2x):       1 GB  (1<<30)    [COUNT-1 encoding]
    v6   (NV3x):       1 GB  (1<<30)    [COUNT-1 encoding]
    v7   (NV4x):       1 GB  (1<<30)    [COUNT-1 encoding]

  Note: on v4 and newer the COUNT field encodes COUNT-1, so
  setting COUNT=0 copies 1 byte, and the maximum COUNT field
  value transfers (1 << field_width) bytes.

  GFX/Compute:  CP_DMA DMA_DATA size is 26 bits in bytes (64 MB max)

Inline helpers amdgpu_dma_max_bytes() and amdgpu_dma_default_bytes()
select the right limit or default for a given IP type.

This is pure additive infrastructure: no behavior changes yet.

v2 (Alex):
  - Fix SDMA generation names to match IP versions:
      v3=VI, v4=Vega, v4.4=MI, v5.0=NV1x, v5.2=NV2x, v6=NV3x, v7=NV4x
  - Fix max transfer sizes for v4+: use COUNT-1 encoding semantics,
    so the true max is (1 << field_width) not (1 << field_width) - 1
  - Change v4 minor version check from == 0 to < 4 (covers all Vega variants)
  - Change v5.0 minor version check from == 0 to < 2 (covers all NV1x variants)
  - Add COUNT-1 encoding explanation in commit message and doc comment
  - Add inline comments on every return value in get_sdma_max_bytes()
  - Add get_gfx_cp_dma_max_bytes() to query GFX IP version and cap
    pre-GFX9 (Polaris/GFX8) CP DMA at 1 MB (observed HW truncation at 20 bits)

v3:
  - Polaris (GFX8) GFX/Compute CP DMA finding:
    PACKET3_DMA_DATA byte_count register is 26 bits on all generations,
    but on Polaris (pre-GFX9) the hardware silently truncates the
    transfer at ~1 MB.  const_fill with 64 MB writes deadbeef for the
    first ~1 MB then stops, leaving zeros in the rest of the buffer.
    Verified: 1<<21 (2 MB) still fails, 1<<20 (1 MB) passes.
  - Workaround: add get_gfx_cp_dma_max_bytes() that queries the GFX IP
    version (hw_ip_version_major).  For GFX9+ (Vega and newer) the full
    26-bit limit (64 MB) is used.  For GFX8 and older the limit is
    capped to 1<<20 = 1 MB so the test stays within working range.
    gfx_max_bytes and compute_max_bytes are both set via this helper.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 97 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  8 +++
 lib/amdgpu/amd_ip_blocks.h          | 49 +++++++++++++++
 3 files changed, 154 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 52327c69e..e8266173d 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1439,3 +1439,100 @@ uint32_t cmd_get_available_rings(amdgpu_device_handle device,
 		return __builtin_popcountll(hw_ip_info.available_rings);
 	}
 }
+
+/**
+ * get_sdma_max_bytes - query SDMA IP version and return max transfer size
+ *
+ * The SDMA COUNT field width varies by generation.
+ * On v4 (Vega) and newer, the COUNT field encodes COUNT-1, i.e.,
+ * COUNT=0 transfers 1 byte, so the true max is 1 << field_width.
+ *
+ *   v1-2 (SI):       21 bits            = 0x1fffff bytes   (~2 MB)
+ *   v3   (VI):       22 bits, 32B align = 0x3fffe0 bytes   (~4 MB)
+ *   v4   (Vega):     22 bits, COUNT-1   = 1<<22 bytes      (4 MB)
+ *   v4.4 (MI):       30 bits, COUNT-1   = 1<<30 bytes      (1 GB)
+ *   v5.0 (NV1x):     22 bits, COUNT-1   = 1<<22 bytes      (4 MB)
+ *   v5.2 (NV2x):     30 bits, COUNT-1   = 1<<30 bytes      (1 GB)
+ *   v6   (NV3x):     30 bits, COUNT-1   = 1<<30 bytes      (1 GB)
+ *   v7   (NV4x):     30 bits, COUNT-1   = 1<<30 bytes      (1 GB)
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
+		return 0x1fffffULL;                     /* SI, raw count */
+	else if (ip.hw_ip_version_major == 3)
+		return 0x3fffe0ULL;                     /* VI, 32B aligned */
+	else if (ip.hw_ip_version_major == 4 && ip.hw_ip_version_minor < 4)
+		return 1ULL << 22;                      /* Vega, COUNT-1 */
+	else if (ip.hw_ip_version_major == 4 && ip.hw_ip_version_minor >= 4)
+		return 1ULL << 30;                      /* MI, COUNT-1 */
+	else if (ip.hw_ip_version_major == 5 && ip.hw_ip_version_minor < 2)
+		return 1ULL << 22;                      /* NV1x, COUNT-1 */
+	else if (ip.hw_ip_version_major == 5 && ip.hw_ip_version_minor >= 2)
+		return 1ULL << 30;                      /* NV2x, COUNT-1 */
+	else if (ip.hw_ip_version_major >= 6)
+		return 1ULL << 30;                      /* NV3x/NV4x+, COUNT-1 */
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
+#define GFX_CP_DMA_MAX_BYTES   (1ULL << 26)  /* 64 MB, 26-bit byte_count */
+
+/**
+ * get_gfx_cp_dma_max_bytes - return max CP DMA (PACKET3_DMA_DATA) transfer size
+ *
+ * The register spec says 26 bits (64 MB) for all generations, but pre-GFX9
+ * hardware (Polaris / GFX8 and older) silently truncates at 20 bits (1 MB).
+ * Observed: const_fill on Polaris writes only 2 MB, rest stays zero.
+ */
+static uint64_t
+get_gfx_cp_dma_max_bytes(amdgpu_device_handle device)
+{
+	struct drm_amdgpu_info_hw_ip ip = {};
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &ip);
+	igt_assert_eq(r, 0);
+
+	/* GFX9 (Vega) and newer: full 26-bit byte_count */
+	if (ip.hw_ip_version_major >= 9)
+		return GFX_CP_DMA_MAX_BYTES;
+
+	/* GFX8 (Polaris) and older: effective limit is 20 bits */
+	return 1ULL << 20;                         /* 1 MB */
+}
+
+void
+amdgpu_dma_limits_query(amdgpu_device_handle device,
+			    struct amdgpu_dma_limits *limits)
+{
+	memset(limits, 0, sizeof(*limits));
+
+	limits->sdma_max_bytes    = get_sdma_max_bytes(device);
+	limits->gfx_max_bytes     = get_gfx_cp_dma_max_bytes(device);
+	limits->compute_max_bytes = get_gfx_cp_dma_max_bytes(device);
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

