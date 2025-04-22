Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E9CC369D7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 23:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006810E3D6;
	Tue, 22 Apr 2025 23:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wtyCUj+P";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2F710E3D1
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 23:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZiHIT2OgzFFPUrYXTZtS2fzDIVXhR66oNhVSrxDOgBJw6uPjZpgCSkuQpHH3k+DDcTNXwokL8T/M8K8YViu9cImE1OTpk0DEu9mh/qoYJVDeqZH9jf39uuKlOz0At/42QTgz4RGWtmltfOL2wdvxkCPnXbwX7JKDNRPhvMtmIjgXkDrUqXG5XzZhaOop42cCbSaiRQ8lHOOetMz1ykj60F+F1N2RxpM0zqsQ52wa7/8LSULj3gRYyZoK7Sz0kk00XHHAT5jBWVuhDgyhTxMrE5veeiWIi4327dLuB1+H3FFqHAAP+OoTalNbM3Y2kWSjMSswXsUgCDAuNU3AMoTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSnI+mJK/MwNoo+/85bwrRbgPGrNdHmQ11nDro8pisw=;
 b=EaeuGc91COcerEjXaxeKXi3uTQf38TByYn2mw1g/xaGxgsBcyocHpaqDyWU/oNZ2EFLhiiVzPPoVnDrs2hE6QVmsDg7bOfjM5OcrZhSJ+XtkwKqQ97UTxrVUK1R7MuTBIhahhbGuHYhcyiNpzM5EEBkCfKrx2Aflb/t/RhEJri+NvV1BYNLH97W1ysfeJkxMqkI8q5j1fPwQGs8Y8+meqpO2NUysUB8cKr3VWpyrm4vm8zM6DmBcGRraQX+EnD6shdxlbvcjB2NgiHIJmiXyYfgDcHaMgIz0Yl4mkQpJcfrtO1Y0Jp2r0sNUQL4q7fy27nUTJJ5u1VCbBUIl2G1ZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSnI+mJK/MwNoo+/85bwrRbgPGrNdHmQ11nDro8pisw=;
 b=wtyCUj+PcOE1jIeS2IhC5j79LofT5ElVZV89c5Auf93hAlVddjZVEIWPDqHB9OK1LIfd9BEDlfu+eSmGLSLjtwUiSQ7sjvdCvCSVUJr2hfOQK+hiW9lxUDJcnLPolpDkv5PzfJK/NmwVPvNdJmh27+f7pCqfKHQwEHIB+lqwPCA=
Received: from MW4PR04CA0367.namprd04.prod.outlook.com (2603:10b6:303:81::12)
 by MW3PR12MB4393.namprd12.prod.outlook.com (2603:10b6:303:2c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 23:57:46 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::19) by MW4PR04CA0367.outlook.office365.com
 (2603:10b6:303:81::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 23:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 23:57:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 18:57:44 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Apr 2025 18:57:44 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amd_queue_reset: use the AMDGPU_RESET_TYPE_PER_QUEUE
 flag unconditionally
Date: Tue, 22 Apr 2025 19:57:40 -0400
Message-ID: <20250422235740.131691-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422235740.131691-1-vitaly.prosyak@amd.com>
References: <20250422235740.131691-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|MW3PR12MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c36afa-9b6f-4a42-2fa5-08dd81f97a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hiF2jzA8g4qfRYfnAK/B8TKbiheoLZeMxg/kCM8lrlwn7fvyyzdIXZBMLK6A?=
 =?us-ascii?Q?xSQg05wV4zTXE+qcEt5y2FVkjf5S3wyjnJq6s2Hx/T86cR+qhfh5mIgu+U2m?=
 =?us-ascii?Q?CgcsSyL0U2F7IoG1UigLJm6vTrxpuwV6lrI7RN/RF+j9b40Y2TU+vsrmFnqf?=
 =?us-ascii?Q?R3bp3b4MGE0FGtJ9I8gEpDzjKjNssvYWBxvLpwR9SR+wgv+guaxJ1VAK8WSt?=
 =?us-ascii?Q?zaF6XfM7KgwtjPPDSA4/7vzuXlgnom+i/hckPB0cnBRBzlJnVtsUaArD0Nh6?=
 =?us-ascii?Q?4R8PqLibhntldv4Sda67LioHZBzt9El+WUVqoPdZgXOXc8lkFg3y9xKnP2N4?=
 =?us-ascii?Q?U31OBKH+J1RVSJZmopNSOMKfKEtHoBTnPXPze+FGv8gJxKmtdm5CPNqHu1rk?=
 =?us-ascii?Q?m6i7SrTgx5m37v0jRP2O2cvUzAt4QAAWnEqXU4l04VHuJRLEZ6xdgRIMOXK9?=
 =?us-ascii?Q?wRm1/7bdF2GsgiL463j+/qFSlmB6Db6T6eDmDFcz3v1NXKwVxdOu4KwVeNWq?=
 =?us-ascii?Q?OnZ0c5GjFalPG+JYtbdr7FkgZYM7J7oWjtHgLjrkst31dTdE2rr00A1H4OMf?=
 =?us-ascii?Q?5KfIsrxJwYvdF5oNkCMkn8b0KwdsVTWU6/1X4u7h4vaVAWrnpirP4Vwymeq/?=
 =?us-ascii?Q?+HiStC+8Z0PUgJWqebjFg/r9kfn4dlXbBP4nBWJ8cOBTXCXMAH0sYEpYU1Ib?=
 =?us-ascii?Q?+f1BIooVbu6Cc6tHo582Xv+QZfbEdLwGETCN21GACDGoJweljCBoxHHXNn/8?=
 =?us-ascii?Q?Lpe59A4VjDlJiqNWK34r92lcjqfkj8KxCHSAUNRr1Be2B4g49lxMTBJ5dDQp?=
 =?us-ascii?Q?tGkW3poPi3fNRrwoLb2zM/iA0+nquUjTdWvW7gUPBjg9Df/J25TUUxzeRvWe?=
 =?us-ascii?Q?NonfiEdynZv0m/DGI1djzdEREOqNHFMOz9ySh8KbArMGX7NtNHKF5v6t+mZb?=
 =?us-ascii?Q?et+KSBTd8XrWyq2p/OcsCdRsaSVlYTeentgbSUySQ+Zy/h97vbsXDSE8PIhn?=
 =?us-ascii?Q?hHrien8px5+FVMTZsaMYXwBg8Iej76k1jB7LfBYuqNsKYmVMG5D82cvTcQ5F?=
 =?us-ascii?Q?Exq7PA8O+/RuW+EZPoGt0g0W2yFuCiO1b5s3FV4hbCW+xXNtTJLKQl5MFqFh?=
 =?us-ascii?Q?SadylYRpdPbTnXzeuBA45HIlmTch9tAw0H4PC/fy8n3hZv9R4Q1tLoxb4/sh?=
 =?us-ascii?Q?GenskFq3APEbduVZ1l4oLiTGIUnZSwSWEHaWZfZj4u6PvOLodHT6HvhdxUmN?=
 =?us-ascii?Q?Xels0Upiy/JDFAuJOlP7MS8d5ONkGlw56fJIps2aTPrFRhfzezrr8YczW5lf?=
 =?us-ascii?Q?M+Eoco23+jtFDOsrCIeopX1p/MADuKJ6t4wNQBIYKVuROR2Wb3q4z87n5OBP?=
 =?us-ascii?Q?CRkYSrF/8nW2XtnJpZVd+ZzfGbHwkbLJ19vtGGk6fLvteaxJDiGBi50qAHfA?=
 =?us-ascii?Q?QPuHyRfRammrA4v1uN2Dj7/0JkvvWQck9JnOO6edyFTFz5DY73SxRAU2TsEO?=
 =?us-ascii?Q?RQnCo9vmpwN3zWg+5PycYVOA9qNbG/qA9YJG?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 23:57:45.9033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c36afa-9b6f-4a42-2fa5-08dd81f97a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4393
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

This flag is supported by both the amdgpu driver and the firmware in many ASIC's.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index a7aca4171..83dabf775 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1237,9 +1237,7 @@ igt_main
 			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":
 					ip_tests[i] == AMD_IP_GFX ? "GFX" : "SDMA", it->name) {
-				reset = (ip_tests[i] != AMD_IP_DMA) && (it->test == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH) ?
-					AMDGPU_RESET_TYPE_PER_QUEUE : AMDGPU_RESET_TYPE_PER_PIPE;
-
+				reset = AMDGPU_RESET_TYPE_PER_QUEUE;
 				if (arr_cap[ip_tests[i]] && is_reset_enable(ip_tests[i], reset, &pci) &&
 						get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
 						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
-- 
2.34.1

