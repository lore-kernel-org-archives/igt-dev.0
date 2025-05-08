Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853AC3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712BC10E32E;
	Thu,  8 May 2025 06:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBQ+ueKW";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7810E367
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNmu7SVMrFuoPt8YhR/Ou1NSr4pciqk3E4d8/7Neo9sMOPdELlN09ZmlkzJxzT7nHT/oAJGVVpiNX9o0M/Zea+MolBQ+70mY7tWy/T+1pWfSFEBO7/vW1g85ZxzGyPnSFlp9MWu7DG0gNqMqn1bEY+jv0eTZ+SNXsUnthdQlP+DTpFp4hbgX/TzKIRfgqutlIotICWy7DfdqQV1sznIM4wmckkXIwsIXmInm1lfWiliDbnY9A8h47qK3ZyUz8aLUFVe4zaieqUjbJaokA/ZBBdpeATepqhyxl/vUwbMQvIqvCy+DhFUlhCrUgOrVPxjpakzhchQ958gS2Od/22n8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv1daXb/Uy048yMX6SNb6IHAQjMz+NaRLIXsjedieG4=;
 b=Yk9izVKdu3HuYHEZ1/GpxzMzWL48TmO8B1h1tANAsWd48VNfD9ATUEXPDIMLu11QT3I5nzeRTKj5TUkA0N9jVTQ2ShH4eJ+DaPASbfwTtwLj0rJKLEj96n0dyHVWj4QtLK8beLdJR/t0dCQyl2PJd34j9Iuw8/ghY8ieSRvRY9xd6IHM8V1ZEMA08I1eOMF7JeUGtszymMYrP5+C96e7rm+Hr7earYnmXm3owPHs4QYnTVNMcm0yMJ5fuMV7ZFCuRoU9zfFcwFy8c7MCzTfd7U1P7q/oHV1t1S6XPzV1UWCgFRYsd3Bvnv425dRAmck4yJ6Kue9wDKn4enBIvPCDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv1daXb/Uy048yMX6SNb6IHAQjMz+NaRLIXsjedieG4=;
 b=PBQ+ueKWEGiCQipbTpHXIeAv8JBbk2WPwAg0QHOWytBNBRY4aUe6Mz9Qny8Wp94LVcBCDcAP9JiOhNS9IK7aVIYu2STxISvdoM8uUDIRr6ZUgdrPQe6raHBfab+p9FuPb1HVlrIErq3wj5kH3AWWMjy/3Q1Ps5p3mTrEI8dcows=
Received: from BN9P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::7)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 8 May
 2025 06:09:39 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::53) by BN9P221CA0012.outlook.office365.com
 (2603:10b6:408:10a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Thu,
 8 May 2025 06:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 06:09:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 01:09:38 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 8 May 2025 01:09:26 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 3/3] igt/amdgpu: Add user queue support to deadlock tests
Date: Thu, 8 May 2025 14:07:06 +0800
Message-ID: <20250508060900.2821847-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 205b9242-b3bc-452a-39a8-08dd8df6ea3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6dMcx0M+FH1hPBtCFi0nidPdOHKIeJ9YAOhhkx+7VhK36MCeol0T2qiFiC7u?=
 =?us-ascii?Q?VwKgvDEwyPOstlmtdrl1SXnDpMjkx4OahoL3UwYRIJ/XtbBvSfH7TmFtKMK9?=
 =?us-ascii?Q?dbogCn+nPP83DuRqp4flONSskOA1wTTep3tfE9VFqE+mMnG2hGgtFbo0xREM?=
 =?us-ascii?Q?mb9SK5tC9Pcym6L4bonIGSEz/D9hHwZBQUFQJaSmaOGthGKnClCia/22nalC?=
 =?us-ascii?Q?hpC/JzoPsiIhpHjM6JvfmM8tpY0dXz5xW32gtBjUPpNq8ic6s7uqn+NeM82I?=
 =?us-ascii?Q?YUu9Ca5GPvANWv+QPmZIk6DL3cx752OjRl3P9PH9axJXsPdxwDFbVQLfiqoa?=
 =?us-ascii?Q?00918OuL6nGhUYk63D5NeqRtHukBh+ISUcvP3fm2D00W0AM1e0X1UGt/tJJJ?=
 =?us-ascii?Q?7o8r64fbdLHpbJl4+55a1fVE+JsNGsv/XpeKOWEAP3q70Ikd+yue6TUZzaEK?=
 =?us-ascii?Q?rqm6vee4E4d/3SaI+xA4KZT+soZMRrDQcRygaT+C5zZciOgsUfHmIQeF7hmM?=
 =?us-ascii?Q?rVaGGjMLyKU3xADRSmQ9CkgVhZ2NiME80ICbdhcFdQal3MnvDOiveU6LTUbG?=
 =?us-ascii?Q?defWfA+ZcDWCJEoNVPBICMNdEtzPBV+9iKaWPYizrazSTaqIUho0Yiy8tVcV?=
 =?us-ascii?Q?lu1chVE7Sa0rjZrZmzJ3Q/wllvGZRdc42sVWXlIHHXBZQzi1hUS7XN00IL5O?=
 =?us-ascii?Q?gTNCdtfurcEF+lazau3GPlMos7SDjw6S3b5g466s3nyVr4Vxc8RNt6wgvkNi?=
 =?us-ascii?Q?0BneaNjHboNwDKQzpeFmUo29aR12WkWz0Y2EBW4vX1AWVEBxU3gj75Oe2YRH?=
 =?us-ascii?Q?rlXRbH8Oxuf/oafn3T+FNygnYGxxOhrq9KA+8IQehSRKSnmy+Xfq4F5NvSQ0?=
 =?us-ascii?Q?uQqcmnEYDFc77BACaosaJSCzKsWkra7q04WCrbkib0A4IB7xHo7CE1p2KQMv?=
 =?us-ascii?Q?/OLKEookHPWHHKEmcxlVx6GcUOpntk+rGEd/3qQR3pVUBm7h44Dlfr0BdZDp?=
 =?us-ascii?Q?YYoTTyepIUNkS4WsnlJYVoLmc94/KkhOLDljibKIpxyEMYMEC04SXVNaqRAc?=
 =?us-ascii?Q?yU7WKKh8Rvhzni73skc3rDJARcDK7JqDLJMBXxOHFgGuurHLr8Zml1TFfSdJ?=
 =?us-ascii?Q?yE/ReZPI66S6qJOtONMPEHbJ154qtK3lGExOX/HGl/s52ci2ZAh6yzIFTemL?=
 =?us-ascii?Q?fI389IKBB8pnWXgBRMYhkF7t7v6czNGd4KTUuULv1TVbujtktHIyks7MfuL5?=
 =?us-ascii?Q?HcaltdCg0VjpP/MVabmoL4vFLC1tuNr5ZVL/rJxLYSudg3mJ5cpILCPb58BH?=
 =?us-ascii?Q?0wHHFOXNWQR/6wThFWyFePfdvyycPJEDyeeig0Yj7OdMHNvqosmetF//xtKK?=
 =?us-ascii?Q?njmSvxc5BUy4ED2H1/R3gY9CA9v9jtI10/FHranXHFGwO95B+wTndhyD9qJw?=
 =?us-ascii?Q?q3gLq9vu2Xk0k+GkrYrpWqK9ny1KZGRGaGhedYWg1sQHNK3LW/5PeEYaGmr3?=
 =?us-ascii?Q?6Z3fg4w2RZR2n7GTc6xS7u0aJmIhZWvjQYhB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:09:38.7514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205b9242-b3bc-452a-39a8-08dd8df6ea3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598
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

This patch extends the AMDGPU deadlock tests to support user queues.
Adds new test case specifically for user queue error injection:
   - Checks for user queue capability
   - Tests illegal register access via user queues

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 472f28e68..d59957cc2 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -9,6 +9,7 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_userq.h"
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
@@ -40,6 +41,7 @@ igt_main
 	int fd = -1;
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
 
 	igt_fixture {
@@ -59,6 +61,7 @@ igt_main
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
 
 		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
@@ -79,7 +82,7 @@ igt_main
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-reg-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-					AMDGPU_HW_IP_GFX, &pci);
+					AMDGPU_HW_IP_GFX, &pci, false);
 		}
 	}
 
@@ -89,7 +92,7 @@ igt_main
 			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-illegal-mem-access")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-					AMDGPU_HW_IP_GFX, &pci);
+					AMDGPU_HW_IP_GFX, &pci, false);
 		}
 	}
 
@@ -107,7 +110,7 @@ igt_main
 		if (arr_cap[AMD_IP_COMPUTE] &&
 			 is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 		bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-				AMDGPU_HW_IP_COMPUTE, &pci);
+				AMDGPU_HW_IP_COMPUTE, &pci, false);
 		}
 	}
 
@@ -143,7 +146,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
-					AMDGPU_HW_IP_DMA, &pci);
+					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
 
@@ -153,7 +156,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-					AMDGPU_HW_IP_DMA, &pci);
+					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
 
@@ -163,7 +166,7 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
 			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
-					AMDGPU_HW_IP_DMA, &pci);
+					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
 
@@ -173,10 +176,20 @@ igt_main
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
 			bad_access_ring_helper(device, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
-					AMDGPU_HW_IP_DMA, &pci);
+					AMDGPU_HW_IP_DMA, &pci, false);
 		}
 	}
-
+#ifdef AMDGPU_USERQ_ENABLED
+	igt_describe("Test-GPU-reset-by-access-umq-gfx-illegal-reg");
+	igt_subtest_with_dynamic("amdgpu-umq-gfx-illegal-reg-access") {
+		if (userq_arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_GFX, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-umq-illegal-reg-access")
+			bad_access_ring_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
+					AMDGPU_HW_IP_GFX, &pci, true);
+		}
+	}
+#endif
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.49.0

