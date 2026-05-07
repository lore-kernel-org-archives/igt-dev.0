Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51CBCD342C
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 02:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7EE10E254;
	Thu,  7 May 2026 02:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EeIrKYdR";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B948C10E254
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 02:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMwLbF842KJA+FkP9zyVgTq9F5sDWif4/5WWFOTmuYAU2b9oSkCu74GW5/Hhrde8KU6DIIxgscphQtJ7isaRl6Rm9GeLPgcRAdKSTISz034ZE8cGeBuQ994Iu5FjfeBBHo6M/nIXjf9/Ty0PAi2WqCvdd+AKIHlKvJHPq8q5OOtg+QkTg+s/VQQ4knmYMgv4OlMf6Rnwq81CXgNfMk2ssuS3oeOcVUb3Smik0/9X24M4gWdxWFQKh940WT+R0HSSXnjGeaKtn6esgvKZ1lHcgm1qXrM7ZjYUgJaASfLJS/LlKqxcTxnijlHtEae6VYG8EJDSwMlzKrwaQV1Mz9T8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q001sWS4A7fbqwApki57qXCYv8SjHOft77cp8KS3dps=;
 b=MnDmhg/v0siRUng4qeXHY0My3QyXY3EgEzUt6mSmLXtYJpiiYW7O5B/oCbTDmemDobPXQXCIN+SbIis3d7kiRTp5ID1e0tFzx/4Ud/I9DeLel+0VQmeyIbropQUgtXCsSD2m9mrwlti7XlpWE+6VUSL49eG+qrdNLkdE8eciO7b9GnXDuPsz5/S4EtNInp3MK3UTYvqr6lWgT7Y2EXNo3pDZX3pqFGaWF4Vp+gfkiK80o+cjwyHCQGHYNxqwMED/yVtmp/1/4x6JrAe2xyI5ggyTZERHGiyyvluUB9gmMANSOSDu8qbaOxYks2wb1u4JL6aouKtmhwnJHjbeXFOqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q001sWS4A7fbqwApki57qXCYv8SjHOft77cp8KS3dps=;
 b=EeIrKYdR0WB8paLk7XmwQdPd34gC7XY5gwCi1GczQ8j+y2ZeJRQwRNdGVDtqO/JEgCgGdg9H2/w4QevnVELMYQDqCBJaNqV2cQraIFadHy0dMmX6Iiak0pxl4tjYkbDlcP86l9sRdzzBt+KyVt3KkmVs4N9/+F1jS/I5TYRYAn8=
Received: from CH5PR02CA0002.namprd02.prod.outlook.com (2603:10b6:610:1ed::14)
 by DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 02:53:44 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::6a) by CH5PR02CA0002.outlook.office365.com
 (2603:10b6:610:1ed::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 02:53:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 02:53:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 21:53:44 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 19:53:43 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 21:53:43 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd ARM cross-compilation with
 incomplete KFD structs
Date: Wed, 6 May 2026 22:53:26 -0400
Message-ID: <20260507025340.164820-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac25990-e61d-4859-18eb-08deabe3da6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: QirB2amgKuWxl/2KNX2Qht8TrDyzWeggz6endgXIpzK8zsip7ETgxKlIMHNdWcwEGjTf6SJhCSzUuEEI3rMjmsonwVbCNG+W9zftx7cAJzS1znKYJTs/cLiuHePYlm+/viJMrJY/Amd5VaBicT7wVLa9kLsPTZjpqxeBVDRziLYSG+64En3WYBlcFgkvGI3AU+H7LRVxdtsmszWvWCOPe4tCh2Z7oxQW5k8EQgyF29rtvSMWa+cAxOgPvIrxqqg9kzy8mF2BS5izEeGz7U93+fKAtUDsg7k7Rv5ibXseRASWyz/L+6qFCuGXV8OwsCB8OfOdLJZZZYqhveVqKWWWXTHNEeXshiVxdXIX5VrKFpG2iPJmaPCRQz8zPOHcjoyzULkABAF/0OvHQHQ0bOOb5vnkUdn2wJZvE5Dg1RhK7wtFKOJW03gkXhWdi1UHletBRPiYhC1qfKPHa8gYD1qyalqZuutZbjLD3cBFhlNBTKpGsd+8Bo27ECB0imYwHa9UtdI7ceefymHsyTP6BGVa0T1+8irIPB5ogLeqoqpu/YOY1Q1jmvCbGZuFL19l3czqKOe+GP3cd/jxogj9kwyrOPi6X+Fz1Y4/cI+yW9fOAImN5l2whL0WjYhy5Dc5Z/k1vy9wjeXfs802ZHadTEj4sEOJTmtJoO5ci2MZNXCvCEDztBzodwoKEo35SUI0jgmbm2Ibz+N7Z6SEQs8ilj6Q4/BGKCj1Cjfe4Pe4xXTU/B8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(3023799003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WRAdBrSNj7u2++NyxYU0MCEPMhE+jm9h1Nxzc5jgEitvZ8CM3Ktr5mRrFcfs/dzqBQ/qouRyHwy20DKteJeIuC+sliYQXolGSsWe7IHrbqztpP45KWTo6X72YcL7uqQ0kXT8BMo5aGMBibPcf0SpEO4MG5STxpiZKAL13sZyCiC8NM5RSSUJKVZi7ni+ut7kFML6yUoFEouJrvd+GHdvPWUXbRxfgD+1usmOb/w1dUd/5eEsA1QcbhMeP3MFssfsgZIBhFWzwEvjtcPCnOG2jxWTZsf4EI4c3gu+j8OWoIpO6OphRN4sVs2CCkMhxoG+IaFEB+0zx79DRtRP7IQXwOLCAOzhI390LgufCZYSjCdzqPI63klLXM+fCYAIejsov6NGE6isaziWohL6UFhkK9p93VqBTFNfxQ6dJehoSqQEGD95GkW5/qjd2HvSe7II
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 02:53:44.3015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac25990-e61d-4859-18eb-08deabe3da6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327
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

PROBLEM:
After the previous fix, ARM cross-compilation still fails:

  ../tests/amdgpu/amd_fuzzing_kfd.c:81:18: error: invalid application of 'sizeof'
    to incomplete type 'struct kfd_ioctl_svm_args'
     81 |  KFD_IOCTL(0x20, struct kfd_ioctl_svm_args, SVM, 0),

  ../tests/amdgpu/amd_fuzzing_kfd.c:82:18: error: invalid application of 'sizeof'
    to incomplete type 'struct kfd_ioctl_set_xnack_mode_args'

ROOT CAUSE:
On ARM cross-compilation systems, linux/kfd_ioctl.h may exist but contain
incomplete struct definitions (forward declarations only) because:

1. KFD (Kernel Fusion Driver) is AMD GPU specific (x86_64 only)
2. ARM kernel headers may include minimal KFD definitions for compatibility
3. Some newer IOCTL structs (SVM, XNACK_MODE, CRIU_OP, etc.) are missing

The previous fix only guarded the #include directive, but the code body
still tried to use sizeof() on incomplete structs, causing compilation errors.

SOLUTION:
Wrap the entire KFD-dependent code with #ifdef HAVE_KFD_IOCTL_H following
the pattern used in amd_kfd_dmabuf_unload.c:

1. Remove the old #ifndef KFD_IOCTL_MAJOR_VERSION fallback
   - This was insufficient for incomplete struct definitions
   - HAVE_KFD_IOCTL_H is a more reliable build-time check

2. Wrap all KFD IOCTL table and test code with #ifdef HAVE_KFD_IOCTL_H
   - Prevents compilation when headers incomplete or unavailable
   - sizeof() is never evaluated for incomplete types

3. Provide fallback igt_main() for !HAVE_KFD_IOCTL_H case
   - Gracefully skips test when KFD not available
   - Same pattern as amd_kfd_dmabuf_unload.c

BUILD VERIFICATION:
- x86_64 with KFD: Builds and runs successfully
- ARM cross-compile: Builds successfully, test properly skipped
- Systems without KFD headers: Skipped by meson.build conditional

This matches the established pattern for KFD-dependent tests in IGT.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_kfd.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing_kfd.c b/tests/amdgpu/amd_fuzzing_kfd.c
index 585cfad3f..146702be6 100644
--- a/tests/amdgpu/amd_fuzzing_kfd.c
+++ b/tests/amdgpu/amd_fuzzing_kfd.c
@@ -19,17 +19,8 @@
 #include <linux/kfd_ioctl.h>
 #endif /* HAVE_KFD_IOCTL_H */
 
-#ifndef KFD_IOCTL_MAJOR_VERSION
-#warning "KFD IOCTLs not available (missing KFD_IOCTL_MAJOR_VERSION) - skipping KFD fuzzing test"
 
-int main(void)
-{
-	igt_info("SKIP: KFD IOCTLs not available (KFD_IOCTL_MAJOR_VERSION undefined) - test skipped\n");
-	igt_info("SKIP: KFD IOCTLs not available (KFD_IOCTL_MAJOR_VERSION undefined) - test skipped\n");
-	return 77; /* SKIP - KFD not available */
-}
-
-#else
+#ifdef HAVE_KFD_IOCTL_H
 
 
 /* KFD IOCTLs to test */
@@ -301,4 +292,12 @@ int igt_main()
 	}
 }
 
-#endif /* KFD_IOCTL_MAJOR_VERSION */
+
+#else /* !HAVE_KFD_IOCTL_H */
+
+int igt_main()
+{
+	igt_skip("KFD headers not available at build time\n");
+}
+
+#endif /* HAVE_KFD_IOCTL_H */
-- 
2.54.0

