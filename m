Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D49ECD3436
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 03:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3D10E570;
	Thu,  7 May 2026 03:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZxD1dUBL";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B2D10E570
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 03:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDqapuAEaGxKKc4lSYOj8DXAO2tubSok/URbwl++wBrXMWIuBj1Eew9jcXCpWFbWmDxSwRju6eWfXPKGystO2Vv1K0iVVKS231bSsCnBzavQ+zmtfhZlhJ+1ji8OZFNEsUud/cxIOce7LujgLIVKv0SSTehaiY1JsOEpGBfN8W8X4+q8a2u8JoyJDd+my/20hoAkeEoflJB5epaTrk0fcD8/AO5SVOuB8DyFDcy1ydFx2yx6VPz6CC/fcHA44b5qrUjdP4f7eNxH3HqvJiOFuE74lnKWRXAhz6NLtlP2LZ1wOcZ+1nDVo0aylei10ZZB/nOfsHry3RO+Yw2OGIp47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqRvT+ufwkmUXcoKNSPk8xiMK5zDOIRtLrO9IPNhDJA=;
 b=JIIU7V59P4zUjT97RDDuEactWO60Xs5/225um5Iu11i1E0zCytiCiafrxJJZ0+T8b+S5de7N/r8saT3cCELbjmz8x0kPbb8ryHoVnv4HbCdbVJGcIR5aBMr5b4RVAXCF8lkIgyoUR32Sf1vK5S8zuAXQARFIs0YQATOeoeApfdSuWrfQHW/teN2cH5Dcw9tidZslPBNMCnJCWpD1ZGKGxu3hhw9/Ngq7aSxVVk49qA3JaT1JeVapNaWDU6+VTashg1uTnTD/o/1grNAqEyj62J0QbSsn2wb6B1P3vq5NZMDC7AhvL6uRy2q5IPp3ir2xfM5im6HGw4vCTphVRq7Ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqRvT+ufwkmUXcoKNSPk8xiMK5zDOIRtLrO9IPNhDJA=;
 b=ZxD1dUBLx0L7I44tN2PszSZhfXera5t9OOpmzfpUp8H1X1ISsL2e1UQElu0wFB6/QAkut2iCHobpa3fpXLQn1jmPCEhYjYvOfMHim/fmXyo6kcH0c0VncL5WOXpiAPDpLz52+aD2TMeiq3Suhhu+fGcQkmfRGKdmo7ili3cww7g=
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 03:15:52 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::2b) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Thu,
 7 May 2026 03:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 03:15:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 22:15:50 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 22:15:50 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Restrict KFD tests to x86/x86_64 architectures
 only
Date: Wed, 6 May 2026 23:15:31 -0400
Message-ID: <20260507031547.168170-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|PH7PR12MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3fd7f3-4b20-44da-f6b2-08deabe6f1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RyCy4gcxZ+sBouHATfJZW/LvA3HYp+EEXyo9tcSSnRdEsHoJEM10qyNVZm6vlRzeoe7tjFLNyD9gakTLmdUvpy2L6DC0YNsTfrJAlwPMk9MXEhTDm8+pvQHdsuzh6bIcti+FNkpoOj7vwgqaHNQA45TFs40qh0FA+DhDqp/Sxz6KtSnYRbh8FYZ8jRKV7dup/bfnOFO5lFjR6Cki1OOzR6Mam/qz4EbrxcaEr3J3Mo/BP+UJbVvkIxqiBDCxQcEVKZccc+fwJ2RI+1K+CapeQenmj/Th/lodGkeUlMKs7KTxf6nNKfLkOA7wAauNMCssavpVB5sa7BD84AhfPP2irY/45n5n84UN/GQmSLbEqjfe132KGzeRad+WSW5HDBYdsoY6A30xOiNN+3naRes9LqjEaoOp4SKsYqBaXQEvuTYYoMFsuCiBdaana2DZNm2Km4mZpdspWjzDopjpwQc/4mHliofLxjeqxc2vlWRS8WvNaphPjsSbyPbQQUM4PPZjCHit2mAT0vSpM2GqHawtKf5Q4utZEx1iLEnT3+xVlP9DgxtCtgg/ZWQBfFrmRvyvclYnfhF3e3LToln6KXGO3O3hZMHgvwE0R3CGd9hUpGS1yZ1SrNwbPMCldDNylS8xfgvkauIEvzPCHTyPZlGqyjlffTpoPPmIz20wPKtX4nsoW/L8H2YPIHyxsD6NHN3NDGqkqJpaq22+7xi4U4tE7HL1QDNaaGzFZU7uV3A7uBQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lhdACNh0hyg6Y55TGuPJplUZ6KNImti6v/tfKd3mS8NQXxmACIYPNIBssz6QCDXvLzj1n05f28Ud/F32d1jq8F/aCxdYc6P3kU511iBl1OxfeHrmFYB4o0RNuJipy6L/4jXVkKfYWKaJNvZKNNxDL9EC+2QjSDaDspkGz/BoaffLFbePfVVcYUriqt1aCObNPftBQU4BzS03D/LCB9F+hk6NmvA3JiPBFreLE0Y2W3I4VAyV/QvzO3nhN86tvTJrDf+/a/HhjvpzcyCyO+QeLyPRrAd2TkkpMzVdgqCV3/vj/QiYoQTDnopLkMeg5oRpMXP51AUOHBoKxDnW0nuIUIE02h1t7A0PmRFOnf+CHVH/9aLTDcIUgH37BjOufmYv+Bt1zzVjy6CPQegNpmxRajg2y1CiQEc1s6+RdCCMqFNKEPiN+qK6ZOAwAyt5HHGS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:15:51.7968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3fd7f3-4b20-44da-f6b2-08deabe6f1b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619
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
ARM cross-compilation still fails even with HAVE_KFD_IOCTL_H guards:

  ../tests/amdgpu/amd_fuzzing_kfd.c:72:18: error: invalid application of
    'sizeof' to incomplete type 'struct kfd_ioctl_svm_args'
  ../tests/amdgpu/amd_fuzzing_kfd.c:73:18: error: invalid application of
    'sizeof' to incomplete type 'struct kfd_ioctl_set_xnack_mode_args'

ROOT CAUSE:
KFD (Kernel Fusion Driver) is AMD GPU specific and only supported on
x86/x86_64 architectures where AMD GPUs can be used. On ARM systems:

1. linux/kfd_ioctl.h may exist (so HAVE_KFD_IOCTL_H = true)
2. But many KFD IOCTL structs are incomplete/forward-declared only:
   - struct kfd_ioctl_svm_args
   - struct kfd_ioctl_set_xnack_mode_args
   - struct kfd_ioctl_criu_args
   - struct kfd_ioctl_dbg_trap_args
   And others added in newer kernels

3. The incomplete structs cause sizeof() to fail at compile time
4. These structs will never be complete on ARM because KFD doesn't
   support ARM architecture

SOLUTION:
Add architecture restriction to meson.build for both KFD tests:
- amd_kfd_dmabuf_unload
- amd_fuzzing_kfd

Only build these tests on x86 and x86_64 where:
- AMD GPUs are actually supported
- KFD driver can run
- All KFD IOCTL structs are properly defined

This prevents ARM cross-compilation failures and accurately reflects
that KFD is x86/x86_64 only.

VERIFICATION:
- x86_64: Builds successfully, tests run
- ARM/aarch64: Skipped at build time (not compiled)
- Other architectures: Skipped at build time

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

---
 tests/amdgpu/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 4637666d9..0dc689e40 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -74,7 +74,7 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
 	endif
-        if config.has('HAVE_KFD_IOCTL_H')
+        if config.has('HAVE_KFD_IOCTL_H') and host_machine.cpu_family() in ['x86', 'x86_64']
                 amdgpu_progs +=[ 'amd_kfd_dmabuf_unload',
 			  'amd_fuzzing_kfd', ]
         else
-- 
2.43.0

