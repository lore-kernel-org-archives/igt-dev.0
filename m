Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35279E94619
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A892810E1DB;
	Tue, 10 Feb 2026 04:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5OiY04Tu";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011046.outbound.protection.outlook.com
 [40.93.194.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731E10E1DB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT5U1pv4C69tPTMCgCPIauOZ5rqnF3UY71QszBsUpZuhjyKFlzVs37G8C+d5d4mQbSJc3HXQGK1IvEIowJROXc872e/imZcUZiVVNeICQbRbjCd6gE9UJrflnltmHosVoVi0kqOCDdiHT0P/s0+mjWBdPCqvQdFBFW+p6jirXLpzgK2ETiFr1GKIQFEGSI/gh27O8nY5X9ceOo9k0TIBcnwwFquvXZeHBUsxA2Jr8NpJCZ0MT5PGx0eNSjGK75t7lgcNo06jWqb+eIQwYobJ3VTld55ZBVafdcpcfdwJ7xwwkTBj1Fvp/gD6IfvK0eXXNA3toyuJjZWtWhV/oQr1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXYIQ8kVGsgEFUvM/t22mXKqLKSSwDr5toDiOBojbE8=;
 b=gveiRykUER/Mnl4belot61a3CtaZXBs5uB3twyKW+frCqJGon1RRiORQ412u4eqW0WfiozeyR2ckwgMk/geAF2j1tQQ06HS3CfmpWSJ/KBUjqyBtU6Ms3Pnnb9X//DmY7Q4bel3FoKaoFbQ1L31xpSAuuVm9UZarkm31uefEzY3ZW5ARWQbedbi/VInk4XeTrTNMBZVmZST3MJV3Iq97rRQIXG7nb4RUyGIZsN/DkZ9tCQmlpjzvwXqV3W0SLS+hJA2KjFG0rKuMIOkjR2Ph+Vd85qFrONmHaLGpcwMGXDB4JTm7E1KXHDrP10zxA3Q7XjKEyTGNPrfcuerf1lgEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXYIQ8kVGsgEFUvM/t22mXKqLKSSwDr5toDiOBojbE8=;
 b=5OiY04TufqBl3yBqNnOgVQZV5PiUVu1wqW64lOb2n2qHC/pDeV7G5OPOe+Ohxc8Bje6+VbLcT8ZGBQTtM6e1AdSiH9TAmP06ZX9dvhcPTz8FIy0Ssc/H5ZBo4OoeUuKL36ORD29P5j2PyRJDIQT7/iBej/PuR0sC+cWPXQKHLFs=
Received: from BYAPR08CA0066.namprd08.prod.outlook.com (2603:10b6:a03:117::43)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 04:55:28 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:117:cafe::e3) by BYAPR08CA0066.outlook.office365.com
 (2603:10b6:a03:117::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.17 via Frontend Transport; Tue,
 10 Feb 2026 04:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 04:55:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 22:55:27 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 22:55:26 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Feb 2026 22:55:26 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: print total runtime in min:sec for whole
 test binary
Date: Mon, 9 Feb 2026 23:53:56 -0500
Message-ID: <20260210045517.120355-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210045517.120355-1-vitaly.prosyak@amd.com>
References: <20260210045517.120355-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: c99da68a-2fbf-43ab-af54-08de68609c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtvRWpubkZ5U3JJVk83dWI5KzR5UzUxTmoxZ1NqVUIzYkQzdnMxVHkyTUNL?=
 =?utf-8?B?NERUZU4vVWpBS1ZaVk1ic2RTUVlCSUNTRy9nYlhTeThRSnJ3M2xEZWE0YmFn?=
 =?utf-8?B?RjFTZWdFZlNBUGVpZHRpYTNwbWlSSml2MlNrSGg4Z3lCbmZkeWkxSUNtZFRh?=
 =?utf-8?B?elUvNVNjMUtwbTNMa1NGQlhUbmRyNzJPTjFTUk1IZlFGTFBjQ2Vxb2FQM3Q2?=
 =?utf-8?B?cHdvQVRjdUZrZ2Npay9FRzNxbGNOOWxkUlFqSWlwZEU3aGI4RUdHZUVIZ1Vv?=
 =?utf-8?B?bThVWnM0UmhWcDhzTnBGTVBKUVpYdmpRcnU5Unl5eFJScFBNdXI3UGkzQSt3?=
 =?utf-8?B?ZUM0Vk5qV2gvUWd0SHpVaDZ1LzdpWXdoTzVBSlV2TWpxc0h5aTNNb1ZHclFJ?=
 =?utf-8?B?U3pyaXIxOGNXS0NvSXE2VzZKT2lFNE02Z2djS3pObDBGWUVucTNJQXZhMlFu?=
 =?utf-8?B?dFZOOVJ3ZktqS2IwUm1UdEtrOUdTQ0VOVFlwN28veVVuWitoc0hGbVZoclY3?=
 =?utf-8?B?elVCbDRaaXJ0dEZENmRJYmRKVVJkK05rVXdvOU5KWDg1THVnbmJKbE5CMHEr?=
 =?utf-8?B?d0F2N0xJOTNHSSswQy92TFBkSnVBRlN3OVFkMGlUZGd5bllYSXYwaEtYMXhZ?=
 =?utf-8?B?ZnV6MytMTUt5aHFDalpPVm1CWi9BOEsvdkFuNFNYNWYrUWQ0R2pZTzZnREVL?=
 =?utf-8?B?ZE4zQU9NTXhGUUVYZmNOSEhXSGs3NXJtUlVaTHRsa001bW5qbnZybnV2QlB0?=
 =?utf-8?B?VkR3R0xUc01BeDVOSTJOd3l0RWNvZmFVT2tKMTE2S2lBc21LbHk0UFZ6Ulpt?=
 =?utf-8?B?aFZZWGdyQjFEUThqVEgzVEViUGs1TXp0cDZqOXpITG90Y2pwQUNGOEVNSktF?=
 =?utf-8?B?dUVZbVdvTFdsWFYyb1dadWZLMHJzbUlUSzNnT25UeXJLVEVjMVFFRzJYK1Nr?=
 =?utf-8?B?a2I2RkdKRFpENFBCVVpZRkVYNmZUWmNtY1RXRHJ1RG81cndSOElPYmNBT3Bs?=
 =?utf-8?B?blFkOE1LNHVFV2NPa291dGllKzk1dXQ5Y25JTUFBNXExODdQSmJyWHpGaUhB?=
 =?utf-8?B?Nmc5bjRwWlFFYnZGa09uRHNUc3FwM2lCS3p6cCs5MkRQZy94VFFMNnhuK2F1?=
 =?utf-8?B?QTc5bzFqUGE1ZFRVSFJnZFdsMDZBZjRheStjK3ptSzJEdnNkNFJwV01hZG9W?=
 =?utf-8?B?WjBBWUhrWlJlRWE2a291TDJsSDNiZkNKUHJwUE91R2tEWXU3YlVSTjFSZVZG?=
 =?utf-8?B?R0tHVTA1Q3NlOTEvQUJGZHNPd0gvbjVwQzZ1SDQrOUMwSWF0RzY0RS9tTDZa?=
 =?utf-8?B?dGFjTDRYRzdwNjcxbFlXUmtFRHQzYW1JOGYvdXRKSW5oVXlUVVF5QWJzVjVT?=
 =?utf-8?B?REp0UDc4Mnk0cWNJdTEyOTh4Tll5U1l3UUt0NWxXZEk4amYwYkppTy9ML1lP?=
 =?utf-8?B?eVZZUUdWSmdZdTBoUHhHdiszNjRKUUpwRUc1emVCWElPYnJ1cjJIR01FRUNh?=
 =?utf-8?B?NjRZMkhSVlZNWWpSU2tYTkpnRndQQ0J3eUEySHhadW8wUmFtUkRFRzhsL05L?=
 =?utf-8?B?RzBGbUNxRG9zTlZ0Qy9iMGJ6NDNJRFhudDB2Q2EzQWtBdjB3WU9PRVZTRHNh?=
 =?utf-8?B?WGVQckx5QnlnMWpxd1VsUXVveGdkY0xFYmxLbHNzVDlTYmw1Z0dPdnkxOGli?=
 =?utf-8?B?czV2RmI5N3RYSkFldFBzb3VwVC82dzc3RHZoajRhcHZQenpUMjJEU25SUVBi?=
 =?utf-8?B?eGJVMFEwQ3pOOFUyaTBwcGdobG9zeUFXM2hORjNTenhNSElzK3VCTElXVFVC?=
 =?utf-8?B?ekZtUnpuS1BvV2ttVVhMeUVPZU9IbHMycVJCNVdJZFQ1SnlweStMd1pwMm95?=
 =?utf-8?B?R0d2alQ2aTdVeDdkNk4vandMemUrYmt4c0tDTHdDVmxoTjdjVE93NjV5cTlr?=
 =?utf-8?B?VnBscERycFprWjJmK0JIU29KUWRwTmRVajN5SHRBQyttMElPNG40cEgxcys3?=
 =?utf-8?B?dmlnYVFXN1JQVzhlR1ZYYUxTUTB1c2U3REllWmMxTHMrQjJzNXo0TnlIWVpn?=
 =?utf-8?B?azdqd2s4QW15TmhDS1Y5anVVblVXY1Bmdk1MSnVQOVhRa09JVy9pMVRjMUov?=
 =?utf-8?B?ajlyUHhDNHZRd3FwWVMwNUJwS0Y0NzVNTE9DUS9lY3oxN202YkcrV2JmMWxa?=
 =?utf-8?B?bXJpc21nZy9PcGNmSTgyak1YRkhGOG5Yb3daZ3dzMXpERXdhR2oyUHgyZktU?=
 =?utf-8?B?VXU5VngvVUpTUWl4R3J1SDJwTVlBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yEsYsCOzRHwhV9IA9i1D+efNxYoRF2TNw8euxOB/YZVyCQLBzvJFnXbln/YYxIwc+UMWg0nXxSnVtWoemd9k46ZG1pk8H38vCiytXFjcAlvTl9J27WL7/AN3EL64YW18oTM806+UakVGuNVSD0ub5htKCWuLV8HbTzow53ePnFeZbXa9DuHKiTB/R/Q7sLiENhf585VvZiQD0uc9JZerTrPjYU0CTOrug2p1jaLqpmUGAC+00u9mY7fgTAzDcs6T5hnzXHXqBUgNiZku566HBAaRRsfydmSQlWTDFyBJlKv8BbRvmuoXkrHBqmeVB1IsZpfjvC5PKFCXQCIlT6eXmxEwK/+EER1EpY27IRTA43tGvYfxeFdv0CVhanDsxDNgCZ5RvUHucH8ZVoF40AftnciGNRHmhCyC22sGi+oUKDg+e0xaEmtrWs1zKg7CwY6K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 04:55:27.8436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c99da68a-2fbf-43ab-af54-08de68609c30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223
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

Some amdgpu tests (e.g. dispatch/queue_reset/deadlock) can take several
minutes on certain systems/CI configurations. When a job times out,
it is hard to tell whether the binary is making progress or simply running
long.

Add a small helper call at the beginning and end of the main fixture to
print the total elapsed time for the entire test binary in minutes and
seconds.

This makes it easier to compare runtime across machines/CI runs and to
spot regressions without changing subtest-level output.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c    | 3 +++
 tests/amdgpu/amd_dispatch.c    | 4 +++-
 tests/amdgpu/amd_queue_reset.c | 4 +++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 5d615799d..5325c0ade 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -9,6 +9,7 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_utils.h"
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
@@ -54,6 +55,7 @@ int igt_main()
 		uint32_t major, minor;
 		int err;
 
+		log_total_time(true, igt_test_name());
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -249,5 +251,6 @@ int igt_main()
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
+		log_total_time(false, igt_test_name());
 	}
 }
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 2efe37404..44aa2d128 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -12,6 +12,7 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
+#include "lib/amdgpu/amd_utils.h"
 
 static void
 amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle,
@@ -95,7 +96,7 @@ int igt_main()
 	igt_fixture() {
 		uint32_t major, minor;
 		int err;
-
+		log_total_time(true, igt_test_name());
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -218,5 +219,6 @@ int igt_main()
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
+		log_total_time(false,  igt_test_name());
 	}
 }
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 71a7b5e09..edc334bd7 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -26,7 +26,7 @@
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
-
+#include "lib/amdgpu/amd_utils.h"
 
 #define NUM_CHILD_PROCESSES 4
 
@@ -1166,6 +1166,7 @@ int igt_main()
 		uint32_t major, minor;
 		int err;
 
+		log_total_time(true, igt_test_name());
 		posix_spawn_file_actions_init(&action);
 
 		if (!get_command_line(cmdline, &argc, &argv, &path))
@@ -1265,5 +1266,6 @@ int igt_main()
 		posix_spawn_file_actions_destroy(&action);
 
 		free_command_line(argc, argv, path);
+		log_total_time(false, igt_test_name());
 	}
 }
-- 
2.52.0

