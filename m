Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFCAD2447E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 18:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5687810E997;
	Thu,  4 Dec 2025 18:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1e80W+Su";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8640D10E997
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 18:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1kegnGJl5TSo/K6A9GRtcv0y3utDYoJ11UgytWFx0y7a4OCg4XimgRiM6FMgJl4Jbnd0goHj3wKzUHdnFomGmC41b/rwoHTORJ3yzWrS90/yFy+kExpsypTb+tdzwQ5y2dotDHJZ9ilbXS+ZIZPe0s3qZV7LjKbHvBx6l4Ad5QrJQX6DF+8cLmtNBWvuX06xcx8SH80C7MpwQXhA3lVoYHs6iDZGE7BQUnCMAq+XtBlfsMA9H1HCw6ghI8P5yaSX2OGhSyftkxtguRXzXAEfTwjhCcyoleUex7+KCqtucSVOAM+6gxGavxFTPG5LedG1B0nk/IjuMw5J4d4X3eG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHxjKBc8UkGYgot5SiPfdb98FpxAI0XliCSWSHCq9Dg=;
 b=O2/GHW9CDclkEVYyYVRpUey49Ws/3bpcweRUnCmDzoW1KLvnzGPh8yaCKRZe/aM1HJIqGy5tlQ5YJgaZjHARyHbbGw49W2uoEcvFw2kWNZSUOMnXZwndyg99u7dh5GicTucjxn6mXEI3HzDIjDqO8l8RVL6BpU6/TDe48EdFMK9W6+3n4ECsjhfVlUEo/bGvd3WDt8GENuWYSTYbYT788MmzIv93SDQ0a0bvcc3b8o0Vz5ibVxlVf/VgU+0bevGBv++clIxgeV598Js1ktpKiwYyiYPc55rxsZ8gMT0eS/AY163EWjNPKsbQ0nRS6WoLC6WFaEUQC/+LGXzkZn0k0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHxjKBc8UkGYgot5SiPfdb98FpxAI0XliCSWSHCq9Dg=;
 b=1e80W+SuxRinHK6HtLdkolCKTs3HE5QA0i/adfjk/ONP3wHrF2+alPGcJS3EMoMToqvdlrtIxoLmR65WbAGlGmBuaJ1LoYPFyD21Sf+HMVyGVy3TNzNZSWGcdHKN2YO/Qz+H/em8//8/HyhymYUeUQ/p5UEHnrz47njJ4KeaCXE=
Received: from BY5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:1e0::15)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 18:14:49 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::e5) by BY5PR03CA0005.outlook.office365.com
 (2603:10b6:a03:1e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 18:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:14:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 12:14:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 4 Dec
 2025 12:14:47 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Dec 2025 10:14:47 -0800
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: fix build without amdgpu_device_get_fd
Date: Thu, 4 Dec 2025 13:14:16 -0500
Message-ID: <20251204181442.45975-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 410f9556-9a23-46f0-55ef-08de33610302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWpBSzJXcndpUXRRWlcweDRuVk9tRXB0R3pXYzdSKzg0RjJCdGEybDB0bXFV?=
 =?utf-8?B?Y1dzdjRFanlLa2JCTXVwUlNlc3lzdzFSaW4yUDZKa0VHNzl2bGFYRmx6VnNH?=
 =?utf-8?B?bFU1ZHRpbmNXamx2OTljR3B1VFY2ZnAxSmsvYmpCR21sMmdmZjBScE5WTm55?=
 =?utf-8?B?N1drRzNyTlQ2MHNYYmlmd1ZxN2wrK2FVYUVUNDhiUTJNUDJwVUMzQXRDemtn?=
 =?utf-8?B?MmdMeHBzcnRvSXdnaUliNVRRZHlOWHhoRzA2dWw1MWVIcEVNbWxZaklUSDhm?=
 =?utf-8?B?dlF0WGVvOVdOVU5ib1d5SGdWTWQ4czBYVklrWGpRU3NjdU1lL3hESUQ3WTZl?=
 =?utf-8?B?cGNIM2tKZTZUS0dvUk1mUGZoTEVUWlZZTGN1MExhcERzUmVYTXVYb3p0elFx?=
 =?utf-8?B?djlobS96bVNUanhKNGNJWTdqZU9LeGRhZEFOMFVSZkx0eDVOMHEyMDYxYUNz?=
 =?utf-8?B?QVptUEp3eTY1Q1dtckhHd3JQOEVlM3lvdjlpWGo2V0g2UUQ2TXlIcElNTiti?=
 =?utf-8?B?TXRxN3dPdmtRbmh5MjJmVE8vQ0tvRmd5Vml6ckRFVXR0Sm9Xckwxam9kY0Yw?=
 =?utf-8?B?cUlDb3l0MjJWSUpmOGY5YUx6Rzk0NG9WT0VBWU1nWGx1OTA4Vmg5Y1J6NmJx?=
 =?utf-8?B?R3Q5NTNyaURpY1d6UEI1Zk9waEltaXJDV0FOVEo3cDBocDhVWnJoUENzRW9P?=
 =?utf-8?B?V0J0eXZSd1JxTG04dGhnT3k2TTBYdGpQSU1XVVBVUmcyYXF0dHBOSXVVNWdR?=
 =?utf-8?B?N2Q4R3RTV1p0bUFseDhnbjgydk9yRGpxWUtkUld2aEh2WHdvWUpYRWhNdVlz?=
 =?utf-8?B?Y1BKa1pDaUVGV2xxME5OaFFKdUtQMG05QkNvbXIwZ0pWdnVUclB0OXV1TTJD?=
 =?utf-8?B?RkoxRUZVOEx1VCtPN2NVRWMyZ2hVbDJCc0lwbVRmUVhaTGdSOW5GVkpRSktL?=
 =?utf-8?B?WkVFa0lZSmNEYWFsYVptNUR2aVM4U2ZyUVhVUFF4azR0VW1GQWR1ZndudVFq?=
 =?utf-8?B?ZHJLZDFJNHpPQ1BoY2NpVmg2SkNVcG0rQVd5WlZSMjErenhOQzRYNDByN05O?=
 =?utf-8?B?UjExLzdtLzdZODRvYUw4cksxRFMwb1NWK016MTl0Y1hJVjFONTJ2TlcvVERN?=
 =?utf-8?B?Vk1WOWxHQ2tqMUFJZ0w1cnBKTWsyclg1WStBMVEzY2RXeE5XV3YwUEFhL0ta?=
 =?utf-8?B?eE5Sb1pIN01BWGFYODluTkNjT0M5VFdQNmtSTVpYeXVqajd0RElSdzJRc1Bs?=
 =?utf-8?B?RjVrOFA0TE1oQkVsRWszYWlyd1dWS1VlWTB3Kzd0eGcxaUhFNGJ3M2VRNjFH?=
 =?utf-8?B?emJzRXMvMG9HYzg4UDVjemFEcDlINE9MMVJRV05ZbVBKRGV1ZDhJbUpNc2JC?=
 =?utf-8?B?anRBMDRCc1hCbExoMjNXR2pnTWplMGR4dWhWOXUxa1lSQnU4c1o0d3dzSmJM?=
 =?utf-8?B?b2ZhNjBBbmU5Nk1OMmZBdmpBaUFGRmxGT2I3bDlVYmJ1SHM1M3lWM3p1d3pX?=
 =?utf-8?B?VzlkdW9aQTBLbHNJUlNQSnFuaURnQ2pVVFJvQW5RcDU2bWMzNURaMVRFVlkv?=
 =?utf-8?B?K2ZoRnFuSDJHNDE2SmUrYjVLZ2NLVkpwZSttNUd5UWtZRmgzdVBEeHE0L3Bj?=
 =?utf-8?B?N0dybnFOZEdxaGV1b01nbVJ5enY1c2hxMHU4d3NjK3I5OXMrdWpUdVBGZzlS?=
 =?utf-8?B?V1doZEppcFBlMDVPYWJDSTM0eUNvTWV3NGdTenhIR2poTGoxbU5YbFNhM2Ux?=
 =?utf-8?B?WC9uVXYxall0enE4OVU1dVFuRjFmSG1kWUxXSW5ESENVbDgrdzFWcngyR1Uy?=
 =?utf-8?B?K0czeldvL0hLclZDTFdzMU9zN2Y4cG9zeXhuZy90Z0l3eW5ZbWQyRUhHZ2p1?=
 =?utf-8?B?ZzRURFRYMjdOMmlqcGhab3FxVXFJVXNkWUN6T0dUNk1WdWIraXMxSmt6dUk2?=
 =?utf-8?B?aXdNRGJLVW5YNkx5ODZNZEMyR1FhMm9iMkthNTgvRTJkbXZGN1hKWHBzREdW?=
 =?utf-8?B?OW4xeXRQeXRTYmQ1V2p2OFUwcTFkWnZIRlQzMzRjMXJsUjZhV1h0UUZQTjhx?=
 =?utf-8?B?d3RaZmhSQ1dkRlUvR2VSZGdDTTRhZkdEODZqTUQxR2JNZnAwMk5weWtXUFU1?=
 =?utf-8?Q?g+Aw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:14:48.7145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 410f9556-9a23-46f0-55ef-08de33610302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

Building IGT against older libdrm_amdgpu versions fails with:

  amd_ip_blocks.c: error: implicit declaration of function
  ‘amdgpu_device_get_fd’ [-Werror=implicit-function-declaration]

because amdgpu_device_get_fd() is not declared in <amdgpu.h> on those
stacks, and we compile with -Werror=implicit-function-declaration.

The tests already have access to the DRM file descriptor when opening
the device, so instead of calling amdgpu_device_get_fd() from
get_dri_index_from_device(), pass the fd down from the caller.

This avoids the dependency on newer libdrm_amdgpu while preserving the
existing behaviour for resolving the DRI index.

Changes:
 - change get_dri_index_from_device() to take (amdgpu_device_handle, int fd)
 - update the declaration in amd_ip_blocks.h
 - plumb the fd through tests/amdgpu/amd_mem.c and call
   get_dri_index_from_device(device, fd)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 4 ++--
 lib/amdgpu/amd_ip_blocks.h | 2 +-
 tests/amdgpu/amd_mem.c     | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 6ce207fb2..73bdace5a 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1768,7 +1768,7 @@ bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr
 	return (ret == 0 && glob_result.gl_pathc > 0);
 }
 
-int get_dri_index_from_device(amdgpu_device_handle device)
+int get_dri_index_from_device(amdgpu_device_handle device, int fd)
 {
 	/* For AMDGPU, the DRI index is typically available through the render node */
 	/* We can use the device fd to determine the appropriate debugfs path */
@@ -1778,7 +1778,7 @@ int get_dri_index_from_device(amdgpu_device_handle device)
 	int dri_index = 0;
 
 	/* Try to read the symlink from /proc/self/fd */
-	snprintf(path, sizeof(path), "/proc/self/fd/%d", amdgpu_device_get_fd(device));
+	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
 
 	len = readlink(path, target, sizeof(target) - 1);
 	if (len != -1) {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index c591d21c1..51f492da2 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -436,7 +436,7 @@ int
 find_dri_id_by_pci(const struct pci_addr *pci);
 
 int
-get_dri_index_from_device(amdgpu_device_handle device);
+get_dri_index_from_device(amdgpu_device_handle device, int fd);
 /**
  * is_apu - Check if the GPU is an APU (accelerated processing unit)
  * @info: Pointer to amdgpu_gpu_info structure containing device info
diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
index aebe22e66..39abd4f66 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -1401,13 +1401,13 @@ cleanup:
 	}
 }
 
-static void test_gca_config_basic(amdgpu_device_handle device)
+static void test_gca_config_basic(amdgpu_device_handle device, int fd)
 {
 	uint32_t config[MAX_CONFIG_SIZE];
 	int dri_index = 0; /* Typically 0 for primary GPU */
 	int bytes_read;
 
-	dri_index = get_dri_index_from_device(device);
+	dri_index = get_dri_index_from_device(device, fd);
 	/* Try to read from debugfs */
 	bytes_read = read_gca_config_debugfs(dri_index, config, sizeof(config));
 
@@ -4223,7 +4223,7 @@ igt_main
 
 	igt_describe("Test basic GCA configuration reading from debugfs");
 	igt_subtest("gca-config-basic")
-		test_gca_config_basic(device);
+		test_gca_config_basic(device, fd);
 
 	igt_describe("Test allocation of large GTT memory buffers");
 	igt_subtest("largest-gtt-buffer") {
-- 
2.51.2

