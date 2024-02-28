Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9077BC5475B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 23:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A0E10E002;
	Wed, 28 Feb 2024 23:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lH6ifNFP";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612310E002
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 23:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4qToxM7e/9EeZrpkqGm0HGnPGbEvobrsX+TthuSe1J2jcuV+gzFvnuy3Ca5+4Lu3o5kUR04348Vw0GcrX14KXkM73OnyKVXrF3vQn6PGBafbCn1cXl5oshMY7DxgjkTfkLBtCxNXk5DHNHuCC9Lf9U/KcQQLC0BnF0ge2QwQb7h9DbWberduboYxlJR2UKlFe+gzfmVJRvf0UXg/f9jAfmbjSnkLIjXGvrN5AD05iDxU0+NJnOslvYq7D1rGJaR0TlrnhwaHDzJOCVLgzHLgh2AcGWYz5hr2ygKWaMhTMGqcjyCRdfSg0GayEqJ0JFBZY+mFM525WV0ASyTBgsAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zcd5vYgnBQnw0qURaBI4MTfrDqs7ZgKrI+5H/Y95RQ=;
 b=EyO9Voed7n7NBf7m3/2OEPQyoywTql7kQaIHz5E4j8/04RK3UnQ7QnufZMTc+wErgShlp8d37kuNvKuvjn+kbRKDrXycIlB6fjwUoDoxYuPxakQQEK/wvRTzPIAW+tejY14lp9PxVJcBQG797TNZzvlPQoksfb9SqgyVl5qRz93WVP9SJj3yojtw1Q43WmxMl9NMUmpyXPXl1IM1fj4ORUXayjLRm+bsjwprSez0McRqCLk4dDsgJFlkG0xmgUWKAWw4bKy9JTNo+AuhRCEqSm4jUTlCghqWI2OVm3sNvnShVaAMgjAgSoHn06D8lOOX60E3aLg+KfKfZb5Xvv1fXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zcd5vYgnBQnw0qURaBI4MTfrDqs7ZgKrI+5H/Y95RQ=;
 b=lH6ifNFPK62IiZCy42tGKaTXXKkr5RIercmNLNbFLD0aDPi8v0awJ0PICT+l6LaxgtM3zCpqECRiT+RlE8R6mTYKecaEVCLBspMzW20UcUn8Q3qEv0gWAOu7XK06Ov1VE+WsqYLqNWsd5bg1ZTSnJ2P17/wtcirAluYN8aXmtco=
Received: from DM6PR11CA0059.namprd11.prod.outlook.com (2603:10b6:5:14c::36)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 23:49:34 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::93) by DM6PR11CA0059.outlook.office365.com
 (2603:10b6:5:14c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Wed, 28 Feb 2024 23:49:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 23:49:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 17:49:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 17:49:33 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Feb 2024 17:49:33 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Michael
 Strawbridge <michael.strawbridge@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH] amdgpu/tests: Fix uvd encoder test failure
Date: Wed, 28 Feb 2024 18:49:29 -0500
Message-ID: <20240228234929.358061-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 099ad5fb-6d00-4147-af22-08dc38b7eaa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +qxWpLPIEfebfIqzFhwkSPZX5c+ecpSxjD2BFsTOj+5R1xmCfOFv2vMv/btsuDCCkTci/SrEDKrcVP5OyiOx7k+2YB2HH7bn+Iu3UgFRjCTj+RICCQUZ2rFV/KjTz5O02jzWMZWkcBVShj5znmU6fLIyFpy540DedvXarhXRvB1Ic4PgqpcZg4gjGtrjq5tbEvgP5/QwzqcF7yOhBI+zkAONux4K8mYCqlF1FvdfYSwGlHp8qIQfnfpKnqbof+DpZbsSGP2QDLj/HOMoTuFAblWMB3BQCXvaQDpqiCpKA/7Uc0hOVZxiWT19RO0e6F0EhLPgZnm224XKLn1nVRBkzCZQax7nKYy5eBdw7vqINATSr+xB/OvGb2PrIQyNCXuWjqNa9VjF6ueY7fITT8vCW81daASEWWf/pvFXl/Bp5lPZvwEKwLLAOdezVG3v75BG02iRCo54fRq31reIlHk5e7luWMqMa/NxL8uIVrwxTTARPsamC+N3jLOr3lHCEgP4a7jRoDS01Oy3VhteeLCjL2ZEvr4aYXJJG5h2/PfWOH5uidL6l+jwsN1PbV3k5buLRvmS33AMgFzMCLUBJR1+OITCItXecUJ2NVvBB78+LDLcOoa3SoaYfQmfV7c8FLBEatCEEcj7DQEs3E8O3kagqKosmZ/QmKZC2J4rTFChtbc2W0nlVrW1BuTcbVTuQmqchotYArcf61HGeC/oCyX/uGvixkeCp2ZpdJ8jOrN3nK8MTdTgaaDcoR8uItQa1GDY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 23:49:34.5752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099ad5fb-6d00-4147-af22-08dc38b7eaa3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210
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

