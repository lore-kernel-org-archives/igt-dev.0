Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F53C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 02:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002A4112955;
	Tue, 16 Apr 2024 02:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LBsHGvjE";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB026112955
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 02:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG5YEEWRpWoF33+tgJOlsq9K7h8Gq5o33rG0s/yuiFfGHw/Zd+djd9ARryY46GvjGiNtjQ4d7DuyLjIeXrXb2RiT9rDxY4m9w7AZ3gOnY/Di/VY0jNPyzBqI3pfJJQJtPQQvXUtSeVBt8tQuLIhg/Kl5ivtXchyeHPgAtu1t7iFdiEFzWlcbYP3yt/9IsDgkfdpPlmbsEcwlfa8sQzM9GH9u7OuPDdnDEsGPrOpQ1oDUZvqFuAuER9C6RI9pszNGW3ZVT0YnoyQG54/KDXgMCK7hstWd0n3sTq/hFAiRMFtyoq2yacWc99LLMgUtPfTMY/1m4M6+LpeX9HzDEZ3STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpUZpmwMZN6e71wCUHjx10Jq11idyl0rkuO919xRJaw=;
 b=W2rCMKq5iNyZ/1aaJ12txNdHGhQ73eptM+V6x4FkBlvP1No7le1F7/WjwyNQdv2/zMZxFitCI9AbEfcUIHp3ZxFks02KCGGQhR6RtXSmK0JOiGOoOiFfHxpUluGwm9OE+rtAhjb8/u1Q4loADtONziud6SPvYwEDa+04CsZ3lrIEKW9+9QHClablEioCjc8E9BGxwAf5Fl0b1sYb/MetPBIpWpKk0IT9SiM814tbWQj5qvSm5jL9lxnDWKtZUflSFvMtZBcQmqfE+OSmLvgntIkQksONSJn3BVvlVWwoQQBsvafOSHDHExZ51o9H5bXrdw+IcIS08nzYP4dYLWHwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpUZpmwMZN6e71wCUHjx10Jq11idyl0rkuO919xRJaw=;
 b=LBsHGvjEM6AhyGLDPcx2icy9P8JRPTM2JEkEZ/HmEPLqI7sHUEUb2PvqhQokkkKiKlDAjEFxxTRlRnIhCNfUP72kT3Z+UtRqzknVLBgivVjH1vzd7z+TtRQihVNHprgHUdXhO7T86i0Lqc1vfVh3ZcfMzsL4CGGMqa+0g2A3b5Y=
Received: from CH5P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::13)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 02:04:20 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::cc) by CH5P223CA0017.outlook.office365.com
 (2603:10b6:610:1f3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 02:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 02:04:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 15 Apr
 2024 21:04:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 15 Apr
 2024 21:04:18 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 15 Apr 2024 21:04:11 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: add check for deadlock test
Date: Tue, 16 Apr 2024 10:04:05 +0800
Message-ID: <20240416020405.184146-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a8af55-25eb-41ab-8172-08dc5db98743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6R8KbJ9Y+B+JE39k/d69hZE4yDtgCL2bX1CU8Mnwb98gGxbk/4ZNhrTCs2C1b3pfmtc/Sb6KyqASPUWrVkHQpjV/yOSVD1zFbH8zVRlHGicmsBfTRSRs1wGwKs3FjtD/V36NdTG833IolEauEKVRPwsnS0zewnu2rqSEZd+/xPY2Xq8chByLkE8tlE+PF0WGsLSqT9e9KuEwwPerhNLUVoFoXN8iaL1HnyZsjGgxhhtftIoWX+rKtXNlWIpsaqBnB23UQ5LaLuAancSa9+C3xoTgpA+FR5zDMuZo1vC3vuXZkuUDNPyxkX5C9dUXyutPs5WPMix8Lu+arfRIHvYmqhvcBWgMajVD4rx/l4lp3+9kn5du1x/FCN14MlsD0xCvlW8f3aB+IdD4fefRZ8sFvm8hcJlnOJgr1W2jmhVEYUOjZyZ4e1t3zOadumPvsSE3N1KsN71mwq/okWhzw95E2vt9owNYgDSDdbxYLkpIRMAAAfn7tAkz0pbjDIsezJo0DKeKAjdIr6Vzq+8Fp2IPwacK3PyGkwekUtUNB7HIOqPM93Gxi8J57sMckzEKHj4WtYbc0e+zNz7C8d3hObQdSvBweGNd5isOger4fi8fEAdU0uOjLB57kE5U1VNnf7Q0Mr34T79rawyeZK114r+xvXY+219JCwWmAjQSgP4X17vSMOhksOntV78xT42oDkPbcsBjMD5GJQSPfLEV9v98eDYF+WV8Dz0xodFt5UYggI5+hYeSQDhDlCf1ty3M/AgOi5H2VCykiypHYD2Zepjb3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 02:04:19.8667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a8af55-25eb-41ab-8172-08dc5db98743
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657
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

Only enable deadlock test  for ASICs supporting GPU reset.
The internal related tickets:
https://ontrack-internal.amd.com/browse/LWPSWATG-6036
https://ontrack-internal.amd.com/browse/SWDEV-112212

the issue report by:GMP, Vikram <vikram.gmp@amd.com>
The internal ticket:
https://ontrack-internal.amd.com/browse/SWDEV-455182

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index dc7ec4366..7a27fae51 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -9,6 +9,28 @@
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 
+#define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
+#define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
+#define AMDGPU_FAMILY_CZ                        135 /* Carrizo, Stoney */
+#define AMDGPU_FAMILY_RV                        142 /* Raven */
+
+static bool
+is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
+{
+	bool enable = true;
+	/*
+	 * skip for the ASICs that don't support GPU reset.
+	 */
+	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
+	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
+	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
+	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
+		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
+		enable = false;
+	}
+	return enable;
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -34,6 +56,7 @@ igt_main
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_rings_readness(device, 1, arr_cap);
+		igt_skip_on(!is_deadlock_tests_enable(&gpu_info));
 
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
-- 
2.25.1

