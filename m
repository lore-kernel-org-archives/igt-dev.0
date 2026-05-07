Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CFDCD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 03:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC9210E07A;
	Thu,  7 May 2026 03:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xA8pQSfj";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011015.outbound.protection.outlook.com
 [40.93.194.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD50510E07A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 03:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZerxDlnIkLr9Hs2nzYr0twxqYR1d1X2viw9wVi8bO31EsULXecn3/mirvQqdzhUM/fynusO5L6yfaBDw4bikoPDN6b3tt3+tIM9PG3oowsI1kX7VZNKkf2Qc8XNmewGZJvzCjBvLVzZIri4tRVNTLmzHzczKCnJFXOq2tFoj0uwj3bhEbRNsKlnovJ7hBjl+S5pE95RZvdICN+1lFEFlYavBAY1wJ3TFQUCh67rr1W/5nYCbTft8AlX1dHe9UxC4D+UhsKEFODebMfFjfzkEDnwpD+u8jUjfpU9vSlYPeDSIQBpYzCEz75vaG3jLbBTDtnKS1f5RHv091S30kooqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm1l7rbHfLpC8Aq+C8BPVpcxZ8iAZlTgZJheKjpJUDQ=;
 b=eP4jIESO/n23JckPmbZ1xnkEOnz9LqJayMRmrejTtY8+lOH+hhdgBoHKc1CXrMEy8XyQbCqQR3rAg8R51clGPiY4H5OwEAwJ9diePmhh2tl59cLVx/W5Xf//FOPzHTA7CjCkLPKCsP4urPDQ4D5E68PMHfyYYO3fpbQeKNVaZrE28UJyjUNK+EhyW5FOsvW1yVCmgeGUGKj3H/YyXwOAlgjt8zetonptompZB6K1VBZ8Q138n+x7fNcacF5cKZQfAWlf8Uewzg/1TLQfy0du7EKCn3V2B0EEYh+NEnrNaWPOlvlTeKusTIzCXk9PA6HcqGgCb3qRvHtvryfaegvx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm1l7rbHfLpC8Aq+C8BPVpcxZ8iAZlTgZJheKjpJUDQ=;
 b=xA8pQSfj3OOItMHfOJhuVjSFuUK0C89ZVRkpYDli5UYxChWR8u0+dDePOdSDijM9pefNt5RMwJZEmfMCn7RMh/4LFZ+xMtLYhcedQdd8hW/eh0pjP/dPxDUEBeZI/MBNrbpYiSR4wnBbZ10vFxssBmuPKrp+Ut6clMohbSXmtjQ=
Received: from SJ0PR05CA0177.namprd05.prod.outlook.com (2603:10b6:a03:339::32)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 03:53:43 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::b6) by SJ0PR05CA0177.outlook.office365.com
 (2603:10b6:a03:339::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.5 via Frontend Transport; Thu, 7
 May 2026 03:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 03:53:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 6 May
 2026 22:53:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 May
 2026 22:53:41 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 22:53:41 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Fix amd_fuzzing_kfd runtime skip when KFD
 device unavailable
Date: Wed, 6 May 2026 23:53:27 -0400
Message-ID: <20260507035339.175401-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5bccb2-e89f-4fcf-9de6-08deabec3b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: d2ahj9wvqm5UwFLtFpniPhCxcrNiQ8E1rVuwjTibE6pJJfZKdI7vKPqvTZRvu+v3jmTlCLnWf/xhT/ufrcDZ3GDJ1Sj6+9mt/bTUyWr1S2DSxEa8ureDAc+/qeToF/ZnGU+NLW99Hn9lPlgFdXeuOj659oL64Dt2hfDWlFFYevkNlVUg/KfDPWw0IzuQd/wVWFLHy/+R+gBYDOUV2ml3ywOlldEdCPEoJJUxFkrhDaMsMYk0WStB4GZO1MVXKSne/R9zXy9gB28RKSphJD9MkxJcdzoxdsC4KLRIN/uwOmnyy9QEbv1KCK0fV8b7G4DjgjhWh19qWhtsei3EaYmSJJ5LR6jiqAsF0Fc2CHmaLNGqYgkatzhQSWjfA/E13EtdlF/O97+Zc88XoneZUGcgoCsfuytuC/bfwEzp3+i+raKYTjV45ApC7lQO9dnOPYzu1OwzpylpsWz4qcZ5jzVg9Y0BmGwUiu95lFPKs/kznC8K5xq0gYZWNI6m+oy9+siv7rlpsy0Cr2O0IEIT7kK4DPkuMxwC33HjBASj6UylVTZQjxLNUiSr0PaUfIdxyr6vOxkDAbPyEmYmb8yVQnX/Ng//KZVw/SqnlButqIQmYePTrKfyhzNTm9HQ5bRtbQiSSqqhq1NWNSA45F18MRO4Nj7gYAsmHfs4QKhyTzjaMMZCVCT7BSYSOQCgyiunf8svG8991aSbAICk5BgltAc7ETdLkeMG/WqoTLtE0MmslZU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YBrIGbODSdeLv5xV5mu+GHep2EVO3ahDVMFV2fKADjPAHXyn0BLROUPRBvVYdc/6h4+YSGlF61TYh9v5BPSZjSnJEoS0njkocg5htOAv91+GTUmsNPnTU1lehQmfkG+QjD50+FhUIB6UCzn5dTXaXBGFS16MEZADDgui8xTy4kCgvIdGFhxIIzTsux4VSmumYB1kMBsKiqk5leXEP7h1RKdPyYxQo3y7kiO5XqQBS5ff8YeBIGmi2bsN5jwamgdBoGDRkVEAaPF/vW9CxB/4mFLr6Hr1GYrbHP1b/JVGD5kgsl525DToMmdFhn0cTW5v65nZuVE29wVnojHmyoq3JWGmDnSsggGLWwaUaY6hx6QYgFytEIBCz37zwsB4KNLHHCKABbDnnqEnxnTRS96xMAwQlXe1+fEknqBN2zDR+jEssR4+QsBB6Ca6PYPVgMjh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:53:42.5839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5bccb2-e89f-4fcf-9de6-08deabec3b35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
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
Test crashes when KFD device is not available (no /dev/kfd or insufficient permissions):

  amd_fuzzing_kfd: ../lib/igt_core.c:2389: igt_exit:
    Assertion `!test_with_subtests || skipped_one || succeeded_one || failed_one' failed.
  Received signal SIGABRT.

This happens in CI environments and on systems without AMD GPUs.

ROOT CAUSE:
When KFD device is unavailable, the test used early return instead of
proper IGT skip mechanism:

  if (!kfd_available) {
      igt_info("KFD device not available...\n");
      return;  /* WRONG: no subtests run, IGT framework assertion fails */
  }

IGT framework requires at least one subtest to run/skip. Early return
bypasses all subtests, triggering the assertion failure in igt_exit().

SOLUTION:
Use igt_require_f() inside the igt_fixture() to skip all subtests when
KFD is not available:

  igt_fixture() {
      /* open /dev/kfd */
      ...
      igt_require_f(kfd_available, "KFD device not available\n");
  }

This is the proper IGT pattern:
- All subtests are properly marked as SKIP
- Framework sees skipped subtests (skipped_one = true)
- No assertion failure
- Clean exit with appropriate skip messages

VERIFICATION:
Before fix:
  $ build/tests/amdgpu/amd_fuzzing_kfd
  Assertion `!test_with_subtests || skipped_one || succeeded_one || failed_one' failed.
  SIGABRT

After fix:
  $ build/tests/amdgpu/amd_fuzzing_kfd
  Test requirement not met: kfd_available
  KFD device not available
  Subtest kfd-ioctl-GET_VERSION: SKIP (0.000s)
  Subtest kfd-ioctl-CREATE_QUEUE: SKIP (0.000s)
  ... (all 38 subtests properly skipped)

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_kfd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing_kfd.c b/tests/amdgpu/amd_fuzzing_kfd.c
index 146702be6..9d5735f12 100644
--- a/tests/amdgpu/amd_fuzzing_kfd.c
+++ b/tests/amdgpu/amd_fuzzing_kfd.c
@@ -263,13 +263,13 @@ int igt_main()
 			igt_warn("Cannot open /dev/kfd: %s\n", strerror(errno));
 			igt_warn("KFD compute driver may not be loaded or hardware not supported\n");
 		}
-	}
 
-	if (!kfd_available) {
-		igt_info("KFD device not available - skipping all KFD IOCTL fuzzing tests\n");
-		return;
+		/* Require KFD device for all tests */
+		igt_require_f(kfd_available, "KFD device not available\n");
 	}
 
+
+
 	/* Test each KFD IOCTL */
 	for (test = kfd_ioctls; test->name != NULL; test++) {
 		char subtest_name[128];
-- 
2.54.0

