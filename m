Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343CC83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B410E5B3;
	Tue,  8 Jul 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1QzCV4hj";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987410E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 07:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlVqqS49TYL2oNn5Lg/4VTQOerLHS0sDEgeqM4rti4HwIWweu/9ZhlLbAEY3UgxYpLUvAG3DazMWtu9TNzicgf9ltcPi8V10emsf3ZNqR3G4C2Jqjpd27k3m+BTQ6QFS/PaoTUjP2itV6cbn8zC9g+rIPzpe+6ixbOGyxq8aZUN9uSmoJ4iLsUhp2Uao/o2ftiHzcld7aHuF7h3ihzIJ0p+FLJk1f9SXg26Cn2Hhi4hLLvgUDLRags0SQUG/470OqAzsCVjmeGgqAKxxbUaejb8Rk5mvY3cwCE+u1rwFzqT9gL5taSNtspk4YmIu0DRZ/4jI5olTl6QjsccKZbMZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85P2jzGKrNdGYvrgxke/qN8RCZFDQSjKP/eZ2bHphRc=;
 b=TK+wp9OLBA/siHUOyGnYVw2nSKWejQ0mZogx9CSOEUD6/Cg5+KZgZgQPr6W8+ULQr5+93Mj08XQwSUqziKwBVglc/zWh1IJptBlVe5MyvIdNqLFU9txtAJXU5GprEg+qNZkVkIuK29ToNvnrbegY2S9vRng4+oZmZWfifc2Wr7mck6hhWDxZ6d1uw8rXXTPcD9Ozp6HdwjoL8BQ4RfMwkmTFWO077gHx8SP1LQWwu1x3hDtWw3w/4RA8M8IZkH+FB6BmRZQBMP/4zZgONANmqFLFS8DQ8WchIGCpeoEYfu3ssdNqnqxewDDj78IDDIcFxDwdAE5JnDfvNzG8o9tu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85P2jzGKrNdGYvrgxke/qN8RCZFDQSjKP/eZ2bHphRc=;
 b=1QzCV4hjL/4ETHJVXohAKlMEANE76zOqiPZh7puePNFJc1JGWqy9lxFvag/Pe+xoNQbkF9T4xUmeD7nipxYOGPnSSuw34VHEiP6/ZNEzolPjka5Myq4WgEoyq2c2/LWQ10IaqIaFUfLAq02JecpgcWq06SJW9drwe8c/ExPkQl4=
Received: from BN9PR03CA0296.namprd03.prod.outlook.com (2603:10b6:408:f5::31)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Tue, 8 Jul
 2025 07:48:26 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::91) by BN9PR03CA0296.outlook.office365.com
 (2603:10b6:408:f5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.25 via Frontend Transport; Tue,
 8 Jul 2025 07:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:48:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:48:25 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 8 Jul 2025 02:48:24 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/4] tests/amdgpu: Add test coverage for all user-mode
 queues across IP blocks
Date: Tue, 8 Jul 2025 15:47:49 +0800
Message-ID: <20250708074819.624367-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708074819.624367-1-Jesse.Zhang@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: cc64b402-a750-49a9-185c-08ddbdf3d282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+QbhMXuZ/vwaqUbqr09hPfPpdKeyO2Ttj4g7syXPDUo8E8fJv/zT4sr6P9pm?=
 =?us-ascii?Q?/DjWjxnL62Ui/Sqq0XNkdVRFHwjkEkQo4KFbIHPTNdgBPnc1E6tWjtvbVhhI?=
 =?us-ascii?Q?bUe9qn7e6H2QNRAsg7CSr69Qw+R9pYTSeF34l0Ypnu9T8llbAkGiIoxXZOTE?=
 =?us-ascii?Q?hmFZ40z0sL4RxcQzH9G1Lzj8iRoOgqL4gxhV1CSi5GNX4l8f/kBwL5QjKnjF?=
 =?us-ascii?Q?m8weFiVK1BnVXbonXGHk2o299UFN6OvApyysxoiJzdZBqG49iWtNS2H1Wgqc?=
 =?us-ascii?Q?r8tFXF3J4HUksnErEPzZaUBK6v1zY4+IlJn3nR8h/SGaR1iK45XxFW+XM15E?=
 =?us-ascii?Q?hH1wMSMe5DSGIoYataZWbuUiSCP8LUoODamtZmdDl7+fXHlTBl0CIgWVwY4Y?=
 =?us-ascii?Q?tMNPDM+8cTRs3WHozMSig/xV1uCa/9+9z2EQoy36MeTX60c9n16C96JEnjwx?=
 =?us-ascii?Q?X/gm9gtuLiwDcG0NpATNDffkNVQ5O3H7l//q1mm65BWHre2x6nHD11J6VEkk?=
 =?us-ascii?Q?fx5ZNHaelMX1uTgtIuUXG+Gy4m2ABNjK5pn0FDX4i83hKkO9vDTTKfZNDYlA?=
 =?us-ascii?Q?siPLv4v0tzz2xfKX+Kl3Y0EVUIIGoDDauyB6FCG/N6h1nIDblEM9EX7upxHj?=
 =?us-ascii?Q?QjBrWPlMlCt+Hxg6JtbM2+zgIpGJPndjqzAwU4ukeLfMeM9fJ3XgcF2In5AZ?=
 =?us-ascii?Q?63pMTM37uVAdaRY9FvjFUa2ZDCA8T1T2M03d06BSvv9/vXgZ/Xy/5aagym1R?=
 =?us-ascii?Q?v/Q44UtSPCLyTQ4H8m6eICgKB/qTXGFWmwgZQB/AAoXIet5YKC5KPoFsk9Ls?=
 =?us-ascii?Q?rAzhhnjBz2C20jAu0St81Zm6lDyascnw8DDQlDPFsUyW8dInhTyLF5yv/8zx?=
 =?us-ascii?Q?BQ/AkFltKrNCwu30J07sKNnqy6X4MP4tcHYGLhqaSmOUx7KdEfzCi2EOce8s?=
 =?us-ascii?Q?lYsnIaVbFaGWKCPqil2pZSzuhgawLHtCM8BuOWzHIeYY9eF93Zpt3sMBoGsV?=
 =?us-ascii?Q?1E02YyIQ2kTK3jTqhb+Z/DXNDtD+2QHmzjuOR17KpNsvsbcR0xNvDDtwjYKP?=
 =?us-ascii?Q?deK7EtpMdAyxlNb/QEVk9UtumrNVgfQHJ67VWIJ3SXM4A9XUU3yPivGmkTUh?=
 =?us-ascii?Q?+WUsfvF0KPY1rpoSwv9/513TPCsBE9E0JOp+y03yb2gFNcvmVlTaatw4acfO?=
 =?us-ascii?Q?uOFlOji+8RhjRwby7oYVfBdCqg3jHcnXjLYydYRssLFS4ePdHUrRXTKD3gOS?=
 =?us-ascii?Q?U/30F4k9P17tVqlbB7eJCpnnKjQbdBtG7uPDhm4zx9WZajaM+GM++0dgIx20?=
 =?us-ascii?Q?hbPGK1RHuCBbvH04MvpBHVWDvb1poo8S9fXGqazOkGnB0szmqpLVvdTVqqme?=
 =?us-ascii?Q?kFcQy9Xnt0pji6A63Qon9z7snQfz2wXnW+yLIQkaxR9sFastnupGrbbZHhDy?=
 =?us-ascii?Q?Ewe0tCESLWlDwT5Em+W5NMF57+1oPcdVYLcXQDPAvOxQCuyeht5ESj+qpuDw?=
 =?us-ascii?Q?Hwtcj4B6bw7OWis4KxV2XCjyxeXSqANT+FRm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:48:26.2475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc64b402-a750-49a9-185c-08ddbdf3d282
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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

Introduced a new test function, amdgpu_test_all_queues(), to validate
write-linear command submission across all available IP blocks (GFX, Compute, SDMA)
with user-mode queues (UMQ).

- Adds a dynamic subtest "all-queues-test-with-UMQ" under amdgpu_basic to ensure
  all supported IP queues are exercised individually and in combination.
- Uses the newly added helper amdgpu_command_submission_write_linear_helper2() to
  manage setup, execution, and teardown across multiple IP types.

This improves test coverage for command submission paths involving user queues
and multi-IP coordination.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 8c6b466ce..100a634ce 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -139,6 +139,14 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
 	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
 }
 
+static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
+{
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
+	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX |AMDGPU_HW_IP_COMPUTE |
+							AMDGPU_HW_IP_DMA, false, user_queue);
+}
 /**
  * SEMAPHORE
  * @param device
@@ -830,6 +838,16 @@ igt_main
 			amdgpu_command_submission_sdma(device, true);
 		}
 	}
+
+	igt_describe("Check-all-user-queues-for-write-operation");
+	igt_subtest_with_dynamic("all-queues-test-with-UMQ") {
+		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
+				userq_arr_cap[AMD_IP_COMPUTE] &&
+				userq_arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("all-queues-with-umq")
+			amdgpu_test_all_queues(device, true);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.49.0

