Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB81C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 20:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0770610E286;
	Wed, 28 Feb 2024 20:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nT1A1b3o";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927A510E1F4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 20:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dU7BpRx7dgwmaNiwLoKYqsLZ8mya/qjwJ/fGH6YhthNGL/VYJtwhp/6doACGYos3w1jfgBg0EXW0W3znWySkdumLjevJN0NfjCaY8ALpMZho+L1XjQ6DrWi81Vy69/ALlcxbsxJnzDwRF5A06rmVSu6YlnpFPnxJrwr3SRGUOPDaKeVV0BbItvwIVx6zIe4o0W83O5IKb/XdDwJCBhM4CJ3zwzGDay3qmGY7UgUsQubYaaOYMMPCAb2PCYVWIzauHsmZ7TZ380g0WjP9gJ6zSl0BWqPZ9qmNfWQk8QVc9hX4dYuWEmBeQRNVCGRXttXs00IRpNO+kQf7NdLQIiZ1vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zcd5vYgnBQnw0qURaBI4MTfrDqs7ZgKrI+5H/Y95RQ=;
 b=MGGQ6cIBOqES+NGj5f1da6W1zySek+LKmsvy3S7Hvnh+nNoNMYSwxjGvoB4ZLThqrhgdcb71G14hOs7Ck8RnmSjXofQ1Nrpa2CC2iADjFLSpYaU/+1GpYsr9zoG8KiGPaOaKW2JzyEW7AeUsLXLLEwjGLxJ7vNSIkmqPLc71Nev5fOfZZziVxTtVrFHJ/dgLZSvvpilzSkkTxRAL0jVMTiX6lPKtrFzzOQkZ4kRgMgTd4TXcqGpuYH7WqVmqkUovNTjdYgwjVHwUx6FxQhjkEp0xUbfYXQZ63tW/lwLBVljiSjZKUYtyvHN4DNZW4XkKY972N1j5CKXZJYKhYeDpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zcd5vYgnBQnw0qURaBI4MTfrDqs7ZgKrI+5H/Y95RQ=;
 b=nT1A1b3odsWMNMOn0TzS/jusfOeSryIAbyb4oSlqeOozjy2zvlRiFbxc5P9D8VOdhmLvaGVJRzJ2w2mJbCk/21NMBeIWm3IDc0v8ctaNE7DBUBMRKBNt1CrJwQCcXdE+cOMfTW+d34p7DgDJEbwtARJDw2wWV99EWoclowLQFcs=
Received: from CH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::15)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 20:55:10 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::4f) by CH5P222CA0001.outlook.office365.com
 (2603:10b6:610:1ee::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Wed, 28 Feb 2024 20:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 20:55:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 14:55:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 12:55:09 -0800
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 14:55:08 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Michael
 Strawbridge <michael.strawbridge@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH] amdgpu/tests: Fix uvd encoder test failure
Date: Wed, 28 Feb 2024 15:54:54 -0500
Message-ID: <20240228205454.274430-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b25e7f1-c112-435d-d93e-08dc389f8d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqwqMb1omv5e1Scka9WRqQuzRKx0LR+RacN51FMwVbLLbFZ8dN5y06D83/ToHGIfrdecqeQgs0mTzGqTjMGf/kWmRHqTunQMlZyGKA4d39I+O6gW5CnS3UZMU0+U2GegTJKn3xlRLePFVNhAd0xpEi9EPxmkHMge3j9yAGOysaXyfUO/0XQF+57CCvJ66LgQ0bucoivbGUPwyByklktFTLVu8RfTXTfRFeiJOiKhk9V0q5cEfl6GdGC5sGyuVOGgZa1s+wHy75fCNIARZL2EVWTirJnmfhLWNjsEsKRwFFmJJz6C+P01LYhfsrrJfNGn1F3WfHMsVpImpVyWJ87Sj3/Ou5kNwhdxqvqwgQkyZ//914ILDlv2beimm+NuSyYQxydxsxnCIGCXszCwlTk+whyq5rj49XoWxW5fCs07GMhUb/3NJlQssuAv/MqzTpyOaEuS7wcNZh11n8NX8S4NGofiLPg01rN9wbHjOr4y8zqbx07xCjPGcm2lbdRAocN05jB+ZX4ykIGCxv9FUFk72Z2CAH6nMULIIhW6KnGKllsvrEU+l0w2T1gbUKjkUBlOc9ZcGk6Jb+8Ks3iKfE6IPbiFmkZLU63/QKrehsw5qqa009YSQ/RccTtqOKUtiqbks6Jhi7w9MvhFsgH5kTYB/w90Mqg9rm+pZUc99d0g+Wp5Gpho9OjNbrFHQG4VDil/kIrcb77MTpplITJCWdvm70iEp7tTUqX6K87q28hqorO+EVSHVyRmNU+3DdVxUdUk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 20:55:09.9950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b25e7f1-c112-435d-d93e-08dc389f8d45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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

Combine the following sub-tests: creation, encoding
session initialization, and destroy as a single sub-test. After
the following change (1aa0ed3e02945fbbfe54183b60d0add06b1669d9
Revert runner: Normalize test list entries that don't list subtests),
and since we are using a custom job list list (job_list_from_test_list),
and as a result every sub-test is launched as a separate program
(i.e. 'execute_next_entry' is done 4 times), and even the launch is
sequential after 'monitor_output', we had a failure due to resource
sharing(amdgpu_bo_list_create) issues plus it is not expected behavior
for the test. Before the indicated change all the sub-tests were launched
as a single program.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>

Signed-off-by: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

---
 tests/amdgpu/amd_uvd_enc.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_uvd_enc.c b/tests/amdgpu/amd_uvd_enc.c
index e3e85522f..430a636f4 100644
--- a/tests/amdgpu/amd_uvd_enc.c
+++ b/tests/amdgpu/amd_uvd_enc.c
@@ -292,6 +292,15 @@ amdgpu_uvd_enc_destroy(amdgpu_device_handle device_handle,
 	free_resource(&context->enc.session);
 }
 
+static void
+amdgpu_uvd_enc_test(amdgpu_device_handle device, struct uvd_enc_context *context)
+{
+	amdgpu_uvd_enc_create(device, context);
+	amdgpu_uvd_enc_session_init(device, context);
+	amdgpu_uvd_enc_encode(device, context);
+	amdgpu_uvd_enc_destroy(device, context);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -307,27 +316,16 @@ igt_main
 		igt_require(err == 0);
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+		memset(&context, 0, sizeof(context));
 		err = mmd_context_init(device, &context.uvd);
 		igt_require(err == 0);
 
 		igt_skip_on(!is_uvd_enc_enable(device));
 	}
 
-	igt_describe("Test whether uvd enc is created");
-	igt_subtest("uvd_enc_create")
-	amdgpu_uvd_enc_create(device, &context);
-
-	igt_describe("Test whether uvd enc session init");
-	igt_subtest("amdgpu_uvd_enc_session_init")
-	amdgpu_uvd_enc_session_init(device, &context);
-
-	igt_describe("Test whether uvd enc encode");
-	igt_subtest("amdgpu_uvd_enc_encode")
-	amdgpu_uvd_enc_encode(device, &context);
-
-	igt_describe("Test whether uvd enc is destroyed");
-	igt_subtest("uvd_enc_destroy")
-	amdgpu_uvd_enc_destroy(device, &context);
+	igt_describe("Test uvd session, encode, destroy");
+	igt_subtest("uvd_encoder")
+	amdgpu_uvd_enc_test(device, &context);
 
 	igt_fixture {
 		mmd_context_clean(device, &context.uvd);
-- 
2.25.1

