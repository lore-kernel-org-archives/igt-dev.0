Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E11AEF0702
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 04:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ED010E1E4;
	Tue, 10 Feb 2026 04:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jHhplVom";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F9610E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 04:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMIr6dXoYrN56SsOSrlCibRM6OTXeFKGN4IRIpLcMaHc4yVAA+ixodPHrBHkNWbgKZhoXDHMk352DpWMa2WhJoHqlVQl7pFgs7DEwxNWjqIMdqWNKr6yHMQktdfJ1isti/UTXb69XJeiPgpfJgie//QKC+LfN4M9d99HcHq8r9NzbP5cmDJjVN0+LR7Kpmiaezf/YI1m/Z8+x+YzyFRP8KeDuJJCexHQhECbQ+gqqgEyicULFQaf2OG/YrOtJVlLMINNNfC9koIpqsPBjKnFv8pHzo9NoWXSOo1zLje6J5GdC4sEutif8gQeRtItsimQlKcdR9pTAFB7dz5253RIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwwK611OoGIzoRIUZq956yYZUvm96KgbkWV7uWMo5SY=;
 b=CbPISPMpnh2zOyga00hX3o+Sr+Mepk5PN39IwP/zsNM5R4ZvS11Y7T1l+7CRSN+GrLRAkb0eFXLhNf+gIHZtceJXM4TR4wL9D02ePhtIwOP6HjavD5RkJpOvt9Wn9N2o7udgCCaxV4AfPChfa/LgoGhoByBliCvjnG0qnzpbb9dG/JfcILXYtbzrZiHVyTo8PjubGrziiM51D1Ozu5xP0flqIAzN0ccXI7d2ikFAdCF7IQdy2ftBE5eZf+9FbyloedxdLbds4BeA6hj2JBEG+vf2gSPiR7TxIxdp/zUtcKXoYbpsHOBiEqBku+sMk75pS0dak2W3CCQURKtGf0t7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwwK611OoGIzoRIUZq956yYZUvm96KgbkWV7uWMo5SY=;
 b=jHhplVomqqQiABDkdojMhFUIH8kviYNxESuf4k/hhuU3vnuQDM8+bw7nFPtmwZCuunC9IkZIE0qo4hfaKF0HUy6MdEWahTtgnilPVJ9imY8Getuqspgr0yspydvFlgDLRGeFYFWjElPbqLBR0LYw19F2TE+6CCPh19UDEKklJtM=
Received: from SJ0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:a03:331::21)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 04:55:29 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::a9) by SJ0PR03CA0076.outlook.office365.com
 (2603:10b6:a03:331::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 04:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 04:55:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 22:55:26 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 22:55:26 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 9 Feb 2026 22:55:25 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: add helper to log total test runtime
Date: Mon, 9 Feb 2026 23:53:55 -0500
Message-ID: <20260210045517.120355-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 897360f3-a77c-4b98-9c08-08de68609c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWxZKzNZODZRRURwZHJraTRZb25KMUlwbk5JVUtsZHhtY2VnbmlCV0FLWXF0?=
 =?utf-8?B?c1o3VzFjMVpaSFYyY09ZcUVKZU95bTZlbEQ5akpNZWU3TCtsNCtjUVA1Sk5S?=
 =?utf-8?B?ZWlIbm5TOU5aeVlCUW56bzRsTXB4YVZ3dEVlazJVaFNodWpPeU9PTWRrNnlz?=
 =?utf-8?B?NHhkdUJvK0ZuQ0VidWpiSWpKMUY2ZGZERXl4T0ZHTFQwdW1KdDFiWjMrMWc0?=
 =?utf-8?B?NWRLNXpXRXd3RHhiaGVtUmF6Q2tSd2U3cEVFcE9kdkRlNTROeFQ3NEorS3Vh?=
 =?utf-8?B?ZFhJZklpa1dXcFZGMVc3SkdNblJuWHp1RmRiL2ZwK0xtY2VQTFRYMEhJdUJX?=
 =?utf-8?B?ZlpVS2NjdkVaZytBZ3ZqbnNvQ2Vxd0p6S3VBSkJGS09WaXVseVRrQ2VlVEUx?=
 =?utf-8?B?c1ZFSitKN0NPalludEJ3c0lvTUtTOE1HbHdCRk5acWEvU1dWRkgwa1BwQmtX?=
 =?utf-8?B?bWdHcTEyQmdzV0NtLzJMVXJXVHRGRlZLNWR1TWliRnYyNVc2a3YxSExEZVFw?=
 =?utf-8?B?djJnT3lJai9DdDJhVVRuWTZSRElnY2ZaNExsWmZ2MnNRWndYcGNxV3ZzR3FJ?=
 =?utf-8?B?TkRQYThDb3ZjUFlEZWRTMnBiRkQ3cjlJcU1LRjh4L0xDOVFybzM2bkIzS0dX?=
 =?utf-8?B?UVVBNjRBbVpWME1KQ0FOQkdUZEJlZXVUZEpWeFYwZjFBcEowR3p0a3NFYVJQ?=
 =?utf-8?B?eDYvODBDS2VTQXh3UmZTYjUyZmxvT2pwNjR6d05uZmJzU2Rid05wT2xCMWJH?=
 =?utf-8?B?QXlKNzNyNFBTcGova2dPZXBua0Y5QmpTbGpFUG5xemsyTHBvT3BCNWxsQ2ND?=
 =?utf-8?B?YXJPeGJQUWhNZWRic1Z5emJ3Q0VHTzRvbjFKRzA4blB4NGRneFRXSkN0MS9Y?=
 =?utf-8?B?OS9MbytSbXlQRmx0aStHYzRqTVZ6ejhLbEpIZGRLQnVSWXlBT2dRZGZNaFpq?=
 =?utf-8?B?WHB4ZHlxT1dXWmRYcGNhcis0SjduVndOWXdVcGhiRnl0OFhXeE9KNm1GeFA0?=
 =?utf-8?B?L3JNU2ZoWEkvOTNFWDZlMnJhdzFac0w3R3M3YXFrZ1I0ZGdvUkNNd0tSZHpo?=
 =?utf-8?B?cE5EUHh3YWlOSDhrMUNMWlB4WWVwQTVzVm1ON0hFeTUzU0hzd1pLVkFuMzJ5?=
 =?utf-8?B?bjNhZlhuMlFDUWRpMXM5aWtlUHBseC9JWkVUZmViZHgrZGJ6cVYrY05IcjFI?=
 =?utf-8?B?TS8yWWR6QmFhOCs3M2pvQ0hBeG9mdGt1VVgyRTAvR0tGU2xJdEF1WTArOUc1?=
 =?utf-8?B?MkZacnlWSGlHVzYveFYzN29VUjRVaS9ncXdBbW04SzlzcGMrRHdQNHN6MVQ5?=
 =?utf-8?B?WGVHMFVSSFNxVnRPc1dpd2RBRWdwTWtZZFE3YmVzektvcEt3aWYreE1QcDFV?=
 =?utf-8?B?RjcrZkFpSG5jVktIdVNQeGRCNURkNUhjWmtKL01EZk4wd2VYb3cyNWV0RUlp?=
 =?utf-8?B?NVdNMy9SWFl5QTdlZ0R1VU95ZXpoeE1VQ0EwYTBnalE3QTFFV2xXTE5CMkRj?=
 =?utf-8?B?RkxyWjJwRWtLK0IzMUt0M3JyenJKUDg4YnlnYklEbEJ2TnhPRUJLQ28xT0V4?=
 =?utf-8?B?dFdoS3BrcFZSR0YremdIY25RL3I1UEp0d3JGOHB5aVhNci9rTVlHMk9CYkxB?=
 =?utf-8?B?S0xtNDJOWUtYZkhISHUvaUZGOFUrTHhFSm5ZRHp3S1JTenRSWHdGNWI2QlJp?=
 =?utf-8?B?WVFrckV1R1ZwNFQ2UGk1MUN1Zk9HUEtzQ20yaDZ2SUpVQnQ1dlVjbG15TlMv?=
 =?utf-8?B?NDdmQ1l2Vi9EVE9OV3VTWE9RSXVMWFhJZWo1V3ErRWRPd2ExbjlhS2tnaVFm?=
 =?utf-8?B?ODlCakkwL29zS2F3SVFiQlhIa0ZjTU93Z3hKakk0blRSakgxMW1MaEZ6TVF2?=
 =?utf-8?B?bU1PcmlNd2pvT2dlN3Zic01pU1NxOU5raGtaU2tZVG5naTdrUUZieHNDVkly?=
 =?utf-8?B?OCt1NDVRSUxVVHNyTXVNbFo0alpsRjhyRnpCeURXb1BPaUcyUHh2NXVnb253?=
 =?utf-8?B?V0h2bGljMjMvd2Vsdm9LVVRCR2JaRGQ5UVVrMStHeDFBU3p5QTI2Nm5vdTMy?=
 =?utf-8?B?bHdDTGVQaG0wUDNtbjk5Y3NjbVk0OUZoNkkvaTFEcXBJYmkvZW5sNnJiV3ln?=
 =?utf-8?B?Z0FDL0srSnRMYkZqa2RCUmx2YTJ5VjMxZ1M5MzcweDRjZXVyT1p2azlkcHZJ?=
 =?utf-8?B?YTFmeGkrbHVISzlMYWNnN2F1QnBOcGRhQWRSdTBGaGNVaElQNUxBRGQvWU1M?=
 =?utf-8?B?NnNiS0RoaFVLR0paQ0orSGV6NUtnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lh2zhKpNkCBgVpTXphAyV43/UN6RdWU3JpFo7vVc9GBT9U+8d+7UiDAJHhI+yWxD8HommX/+jgVc+X0S/pLLEeRsDK8hhmO+BPFIsm5z4yEhMXVmAzTjLRefSrx2rsNPrLvfrz+95hzuPiN6ZFVlC+fYwl1d+KawKO1Lq1ibJmpikvERlafM6BwmGxpb5fFlDPfw/GB+53pBiZCGQLOKmveT9HwyJv1aWt4MYf4tA+IuWqtoAdjaI0RL+cjrqh17hZN5oVkLRuSFzciUw3+adkehqz0heToI4IsS8JcmK41X44+UPmPPGwJbiKTRK3JUON4oT3SnW0nSCX7CuyJ8kati0cI2Hsjc4Kw/lNqgGi8CF5BKKzds9RFV8HYvBgYd9UsYsdy/zxXTR7bqDOSILMa/ClYZRh5LhJKt0su/yy1kSTuG2NqWsbu8yK0zNJ3y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 04:55:28.1189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897360f3-a77c-4b98-9c08-08de68609c5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
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

When running amdgpu IGT binaries locally and in CI, it is often useful to
see a compact wall-time summary for the entire binary (all subtests).

Add log_total_time(), a small helper that records a start timestamp
and later prints the elapsed time in minutes/seconds.

Usage example:
log_total_time(true, igt_test_name());  /* at program start */
 ...
log_total_time(false, igt_test_name()); /* just before exit */

Note: This helper keeps state in static variables and is intended to be
used from a single thread in the main execution flow.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_utils.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_utils.h | 23 +++++++++++++++++++++
 lib/meson.build        |  1 +
 3 files changed, 71 insertions(+)
 create mode 100644 lib/amdgpu/amd_utils.c
 create mode 100644 lib/amdgpu/amd_utils.h

diff --git a/lib/amdgpu/amd_utils.c b/lib/amdgpu/amd_utils.c
new file mode 100644
index 000000000..423d7fe02
--- /dev/null
+++ b/lib/amdgpu/amd_utils.c
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <inttypes.h>
+#include "igt.h"
+#include "amd_utils.h"
+
+/**
+ * log_total_time - record start time and print total runtime
+ * @enter: true to start timing, false to print and stop
+ * @binary: binary name to include in the message (e.g., igt_test_name())
+ *
+ * This helper is intended for summarizing the total runtime of an IGT binary.
+ * Call it once with @enter=true near the start of the program, then call it
+ * again with @enter=false just before exiting.
+ *
+ * Not thread-safe: uses static state.
+ */
+void log_total_time(bool enter, const char *binary)
+{
+	static struct timespec t0;
+	static bool started;
+	static uint64_t total_ns;
+
+	uint64_t total_s, mins, secs;
+
+	if (enter) {
+		igt_gettime(&t0);
+		started = true;
+		return;
+ 	}
+
+	if (!started) {
+		igt_warn("igt_total_time(false) called before start\n");
+		return;
+	}
+
+	total_ns = igt_nsec_elapsed(&t0);
+
+	total_s = total_ns / 1000000000ULL;
+	mins = total_s / 60;
+	secs = total_s % 60;
+
+	igt_info("=== TOTAL (all subtests in %s binary): %" PRIu64 " min %" PRIu64 " sec ===\n",
+			binary, mins, secs);
+ }
diff --git a/lib/amdgpu/amd_utils.h b/lib/amdgpu/amd_utils.h
new file mode 100644
index 000000000..cbac5a642
--- /dev/null
+++ b/lib/amdgpu/amd_utils.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+#ifndef AMD_UTILS_H
+#define AMD_UTILS_H
+
+#include <stdbool.h>
+
+/**
+* log_total_time - record start time and print total runtime
+* @enter: true to start timing, false to print and stop
+* @binary: binary name to include in the message (e.g., igt_test_name())
+*
+* Helper to print a minutes/seconds summary of an entire binary run.
+*
+* Intended usage:
+*   amdgpu_log_total_time(true, igt_test_name());
+*   ...
+*   amdgpu_log_total_time(false, igt_test_name());
+*/
+void log_total_time(bool enter, const char *binary);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index d851029e0..ecb8a4930 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -180,6 +180,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_mem_leak.c',
 		'amdgpu/amd_mmd_shared.c',
 		'amdgpu/amd_jpeg_shared.c',
+		'amdgpu/amd_utils.c',
 		'amdgpu/amd_vcn_shared.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
-- 
2.52.0

