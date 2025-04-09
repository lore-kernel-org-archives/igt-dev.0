Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85CBC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E9810E7F7;
	Wed,  9 Apr 2025 07:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ay3n7+Xe";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE18010E7F7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ruv35lkJ6FobiZSYK7+vdUyz6ANqZ9zjjpRAK4cLYkSmQcm4p5JquOAp+Od8G84inXEFN9Q/FFYQjyt82LEu/V+8VMp6E3ft4pknkcfHqLCcYbdHXrXl3xx2dsnqiApUyKCG9JoPFWfFAA+mX2MwzQ7REYQDpESkWoEL09e2Pygl7tGk3bzQmmhYkL6XN4ex3czb2+uoD2qQ0vC6bj+1kKx5msIaedfzP8hR7kFw2SraJRUBYu/JgDXa11dxV8Zof3Dp2gsk1khwt7lKmXKAwzoWVxjXTrD/LPELhJztxqp8p9cLG+fTDHlN+EH0D6/9vAKlLvmISZd2GPi/KXtruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEdzG86hofJTh08evBfrdotEzY0Sq/33vKzwh8GKVUo=;
 b=iIkXk3DUDP4aJ1JBaPVcNjMavpJnPYYCI9DWKLZrKrbpO576DZDBKTn4W/7DlhoWJqESXkfcZVF3G9ZWSIm0DGxK9FZPDjlF0EszOrnELVQWZogGV4SZ7ZpkiXMw4ZzN8R5ikxEaCRs6hdRGfjeMJTg2rjMLKqvUsoGAGmpSa9YTeG6o5B417vWu5pxuEpmorU3Bxirpzxx3QMDSos72p2sq8D7oS+mg6ZFUcYstF2mdN5Gc1OVA536aYssGxT0ERB9YJuwvhax2BZIfOnvQlN+t6DSHO2nlma22bzvAHOIz+HdPuUERcyVw01hWI75P9FSS/3f+KYZw9oq6c5JRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEdzG86hofJTh08evBfrdotEzY0Sq/33vKzwh8GKVUo=;
 b=Ay3n7+XeJI7lM0HUUvTxrzGoJ/GyBlDUO5PnmFgEpCTGuc7f1ZWgNAlmkSyZO12LXFWkV95BtpGPjUFzpHlqq5UBUeRQT1cGGQiB2U2VCKR7VRquTyEWcNfkg+rvZSmD/ah1KYxSR5F7Fhx2xnsoI2H9H1q9JXk8ICAPfK1cNAY=
Received: from DM6PR02CA0120.namprd02.prod.outlook.com (2603:10b6:5:1b4::22)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.22; Wed, 9 Apr 2025 07:50:38 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::2a) by DM6PR02CA0120.outlook.office365.com
 (2603:10b6:5:1b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 07:50:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 07:50:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:50:37 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:50:35 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t 3/3] lib/amdgpu: Add encrypted flag for secure user
 queues
Date: Wed, 9 Apr 2025 15:50:30 +0800
Message-ID: <20250409075030.2501714-3-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409075030.2501714-1-jesse.zhang@amd.com>
References: <20250409075030.2501714-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc6d3a7-0bb8-4617-1ac4-08dd773b37d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nFC9KC4BkiHq49ki1/GFhfuV1zlDYVF8fBrfjoyiV7cBXykj+QSgRQZbVAR7?=
 =?us-ascii?Q?1XBPItBn9CfATC+I6cMmJdoNxgtzR87AMRVFX9EgJnpHJImPzWptqlcfS6/T?=
 =?us-ascii?Q?YQUcAT83B6ky4UrVLmQzyQbA00yA0ivM+kqsu2Pk3cJ5Juxwms48wskstNVN?=
 =?us-ascii?Q?DAb4navB8oTAaTdnc/73RRG7EVlsEKw5T0+HkH7mCMvUvIXasypjTpUjqcSQ?=
 =?us-ascii?Q?TnlgTy/55lZ6Yu+JV0+iNif/MnbcN1VDhXoGkv016MpnsSHNjRMNkZpCX87q?=
 =?us-ascii?Q?Kkne04nuMFGJ+Cc2potC79bv9cqOf8/bfOsKmA7tEGWmqutf8//A+fsAYHJU?=
 =?us-ascii?Q?pQzev84TtWdK/jT60Zo5fVKObJ6VHnAvmE6zD2ZkMag66NyMOncs4chru1WW?=
 =?us-ascii?Q?LF+yumckBeouKqkq7ELRICOCpPCmqP1KyqLUvQPUnEF4C+Ld/gvK1AE6yH/q?=
 =?us-ascii?Q?H1DIjccCqNL68S4Js3UbjXBQT7Zf8AFna65QVMYZbfOtx+pfmM9C44x9ZJoI?=
 =?us-ascii?Q?O45FcVzw/YCNl7JX/lLzwZngtCqUStyuiNMvsVlW9r0BprhxGIs0pDN6PQPd?=
 =?us-ascii?Q?3OYFUaK+khuKgFmTEpuKQnWHMnobeqmbeB0pB4TsKkhUfBYtoBo6tD2yzRRH?=
 =?us-ascii?Q?1nuGrIkzhAxs//JmBmAnPKVVQ87y8L88H6aLuSJHWrQZOXCBURQ7mHkHvLl3?=
 =?us-ascii?Q?1vek8cojcd+rnPgv2cNO4biD8WNSJh3ShFkDda3HWy0IvyNqBNw5GxeCUaFC?=
 =?us-ascii?Q?/71Be95JKKpoJfyUyRok/4SFpSb4qVUdvbxIXCJ9i9wPgCCq76Y/CjYJ94XW?=
 =?us-ascii?Q?69wCT0C+UraprOWdszKLJLAgo5o28NitUfX/XI4ZvCDM0ro55SBVcYKV+3V6?=
 =?us-ascii?Q?fXy0SpC+RMZW75Oh1zfCUuPXunMXsLF1PYVWY1B0Q9yrg31sE2rOEaPQ6b7J?=
 =?us-ascii?Q?RNiW3cBj0MIZ8kRlZ341GLdjhubjJlXdU96Wtm4n6pLKYcQHcoDTPQsq0Lgv?=
 =?us-ascii?Q?y5cvdSygyg3YN5NJA5zE0pHC6laGDm3/VYIACuTmFfvl03HDVyMg+9Iwa18S?=
 =?us-ascii?Q?vVC08kCSCmE2vWqq/xMa9srLYWJVpkH/cRNEl/cNKAdLmmoyNGXREaT87UEP?=
 =?us-ascii?Q?iCLIxOLrHUK2BTXpAkQ+iRePkiovlAYnLWniFN5uYYGJrA2gwJeoPgbVT26r?=
 =?us-ascii?Q?o90RllU2AG2Ayw/KhI/e3C1T2guMEldOdBkMrsnGRi+8epUO7tgjvWnP/1qJ?=
 =?us-ascii?Q?sobb3CQqLfJyGaohOi7OOlwlBTaxT/SyIBplxGtkKgoHrV15YETm/fIJykm0?=
 =?us-ascii?Q?KB4aZwm6arhHp7DGc87vR0ewTyV+WI/14aJhcp8u834Zj8zLI8whX3uEOL3d?=
 =?us-ascii?Q?2KgosBmUeYUYvuxs6nXwIo5xvWKgfZ0mC5AiuKN0f9/NGfvrqwQg1GdZct8U?=
 =?us-ascii?Q?5IDZxXM9RaMCxHKnimE9gSEhd0CEggThUAlAJgxunAcGj7k28OrFocxOY1Jw?=
 =?us-ascii?Q?fjPPPUsZ+HP0jC4VJE9/KfICgVLdZcRX9quB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:50:37.9251 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc6d3a7-0bb8-4617-1ac4-08dd773b37d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

When creating secure user queues, set the
AMDGPU_GEM_CREATE_ENCRYPTED flag for the GTT allocation if the
queue context is marked as secure. This ensures proper memory
protection for secure command submissions through user queues.

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/amdgpu/amd_user_queue.c |  2 ++
 tests/amdgpu/amd_security.c | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
index 361f5acc6..0cdd0c4f9 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -281,6 +281,8 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_
 		return;
 	}
 
+	if (ctxt->secure)
+		gtt_flags |= AMDGPU_GEM_CREATE_ENCRYPTED;
 	r = amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &ctxt->info);
 	igt_assert_eq(r, 0);
 
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 737e6201a..1c880c11f 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -355,15 +355,15 @@ igt_main
 			AMDGPU_HW_IP_DMA), is_secure);
 
 #ifdef AMDGPU_USERQ_ENABLED
-	igt_describe("amdgpu gfx command submission write linear helper");
+	igt_describe("amdgpu gfx command submission write linear helper with user queue");
 	igt_subtest("gfx-write-linear-helper-secure-umq")
-	 amdgpu_command_submission_write_linear_helper(device,
+	amdgpu_command_submission_write_linear_helper(device,
 			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
 
-	igt_describe("amdgpu compute command submission write linear helper");
+	igt_describe("amdgpu compute command submission write linear helper with user queue");
 	igt_subtest("compute-write-linear-helper-secure-umq")
-	 amdgpu_command_submission_write_linear_helper(device,
-			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
+	amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_COMPUTE), is_secure, true);
 #endif
 
 	igt_fixture {
-- 
2.25.1

