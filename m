Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92964E9A04C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78810E67D;
	Thu, 19 Feb 2026 05:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zm0LTIM8";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A2B10E67E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n68gYNBIjMQscmb0KY3RSPJOGlHdn32700FN+DIs2qpeUxRM7h1tfTw2TVtolWCqBR9MkBBkm5boL5pxfvTT8oSNuW3dU1WwAi08ogWgtXEt54UAIxvxbjMCCPDglUMM2JO/L2ioPcgDan28o+0uIAcUNJ/618W8HbeXvTeDTt0sh4Th5KCt6Z9TZ2qNs0PVEGeQK0re+FFWzIOgwyxIRhsO2/Vj9m5t0VpC2FhkmHSxVlr3+M0CinAdK6hlH9ICqF4QtU9zSGwGgNEARLPv1ymxIa0Fjm2zlUV2UEunvEOM3HjK78zzTPyEYAqnRc8eG9DeTL1+vd5laG83Kxd+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6FVevsrSyj6cSeoqSDCQo7iBOZgkVykjDIwPZy3h5o=;
 b=pg+taU5nMQ3EkGyVy7zjPvRgNBdAdEcgthcXZq/xmc8yRzTIqe7VYXp2Plz3s1mje31t4EI6wEk+Bzz2XMA7lAMddNBG9OQHxv0EfT4mvmVMkS+baH3RcIM0OHXzcc6GvoVxrsEt86ANUr9oOzMxYb4RMwAkMzwa9AdYYHt6usW8RNP04fpobakqEglX7+3GasCiWchKVJeRwB7MlGvIyHNo2jexv05HVPP5AQyWJPiRrDrBMDovB3b5aBjyAWEikrfIs2Ch4QwIkFDtv3Oj9Cob8a0dIQbEWGhoDquz1e4u/tWG6wkzpHevSo/8r44m37CCTryhOWYuUt4Zmak50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6FVevsrSyj6cSeoqSDCQo7iBOZgkVykjDIwPZy3h5o=;
 b=zm0LTIM8TkGoHA3XNq6XCAQKzFyUhhpjccarJU9N7bnit/WiU/7OM4pA0WUlq8HVxmLs4I3EcOVuKc9Qzs8wfq41MEN+cRJ2Ba9iV92xPHtkFLExp/cam1Oyq/H2JtM/ocv53Kqiyu6Xrjp5iSbkigkj5vCFY8Yw/yaRLgSQV74=
Received: from CH2PR04CA0009.namprd04.prod.outlook.com (2603:10b6:610:52::19)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 05:16:38 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::27) by CH2PR04CA0009.outlook.office365.com
 (2603:10b6:610:52::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 05:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 05:16:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 23:16:36 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 23:16:36 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 4/4] lib/amdgpu: log transfer size before DMA/GFX/Compute
 submissions
Date: Thu, 19 Feb 2026 00:14:19 -0500
Message-ID: <20260219051630.127667-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219051630.127667-1-vitaly.prosyak@amd.com>
References: <20260219051630.127667-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fea2c06-30f6-4f1a-7891-08de6f760ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mnk0OTBEQTgrS1RyUyt0Rnd4ZUJSRGZaQnlvVkpVQzFLdk9jZDlwQTE5Qkty?=
 =?utf-8?B?V2s4TU5xU2ZCWnZqN1BzUm4wbGJ3bkZnMzFMQXlPNG41UzBJTHJTUk9qZHds?=
 =?utf-8?B?SXNZWFQyZTZqMEZwdUdocFo2dFhvajlrc3IyaDc2SkhjQk9sRy9URE9JbU1R?=
 =?utf-8?B?dWxONGp0STZybTI4QlBhTERPaTZnR1JrNUE3THVJTTYwYWdrZTJBTzE1OEY0?=
 =?utf-8?B?MHlPZUlERkt5dFdLVGFuajFTOXlsTTE4SFhIZzhkSGY5ZDdvMmJzRUtDalFD?=
 =?utf-8?B?Y3pmczBaeExQck5VYk1FRFFQaXdkVWIyYVc2Z09jRW43eFEyeDQ4STlVbkhm?=
 =?utf-8?B?YWVNNzlvVnVFK0NFMUlXSVFuOXJpdmN0YnZxb2hHbFNxdldRMWxOYXpJaDM0?=
 =?utf-8?B?Nk5qbWhZVFhuOWFnQ1puUVJsOW90WXVockc1cHBkT1lSODFuNThNalJHRTA2?=
 =?utf-8?B?RDBtZlpwaVV1akFIK2dwUDRsMS9lYWs2aG1hSHJjK0Z5TmNvNHRTSHM3T1pu?=
 =?utf-8?B?czRmZTMvRlA4TW5lK1ZnTU1yOGhBRkVDaHRDUDRzdGJYMmNjZWhpb1RqY0JP?=
 =?utf-8?B?ZGRweE1WYVRIanNicVp3clBpSThSa1VXQzJ3bU56TVE1Wk1UVTRnS2pwZzgy?=
 =?utf-8?B?QzlqYXhPaUJRenlaWTJibHlYUzVzYnZlWVRubkRxcUJ3aW92aWxlU3kra2hN?=
 =?utf-8?B?N2FkQ2hNTXZHTnBOMFdDTGp0WVFRK1BBVG1tNEpLUHk0eVlEM1VIT01ySkJj?=
 =?utf-8?B?R0U0eW4xcmhTTE4vbUpySXpNeEdvYktFczZLaWxEZW5waWZjY004bjgrZHVY?=
 =?utf-8?B?Y2MvVjhPNEhVOWMyMmV5enpUUGEyTG5jTHZobk1rdG83WHZKVDh0eHdxTXA5?=
 =?utf-8?B?RHgrV2FMSGFibXBkZVFFWkYwRThsZ29nWG9hM1cvT0xHZW1RamtZNUpqbk9v?=
 =?utf-8?B?bUYzVDFMWEV5SDhqOWxOeEJISEVueHNpbEZ3YnA4WVc4UmdHTG1nbW5OeVk0?=
 =?utf-8?B?Rkw3bUcxUUxaWkIvRlNySk5weXBWaVdpdDNtUWdkQlN6dU5Zem9kaTRJUi9j?=
 =?utf-8?B?ellLaE9oSExJM3dsbjI2bkcrV3VLVnhvQWU0aDJWbENoMkpwYnprdmhPTi9w?=
 =?utf-8?B?dlVEd2QrSEZaczR0Wm12NU85aVR6S2RnUGRreW9iQmZFN0VQSkt2bmwvRXhS?=
 =?utf-8?B?S2pZYm9nNFp2cGgvWU91SjZtOWN6TER0RVRBbHE1REtaOW9zU1R0WTRKZWlI?=
 =?utf-8?B?enc2RkVuWWQ0S1M2MDR4K0czY3N1dHBxYVdBTmFWSXFUV1NLSCtmWVZTV1ds?=
 =?utf-8?B?Qm1UZkVIc0o1SE9ibU43dTZiMnE3b1lIdVFOT0dXWGxoQ3JUWEFSY1pEVzNQ?=
 =?utf-8?B?UXpRTUQxc0VyWElPMjhQTy9rc25OL0VTT0tCdWpsRHJHdUxCRE8xK1ZNY1FG?=
 =?utf-8?B?YVRjRjB3Vy9UNFZFbWM4NVFKS0srd01hbHVtR3hPdnQvS2hhQ3E2QUxHNE1q?=
 =?utf-8?B?Z3Z0aTM3YkNtZXphRVdiaGMwSCt5UHJENmYrUGtIV0ZUdnozRU1SeFl0MDN1?=
 =?utf-8?B?R2tUc1E2UFFhMDJaQU5ORXBBSC9Gci9TTlhzWm1uVUJaQ1JpRWhWODBvT2Q5?=
 =?utf-8?B?MXdqaFgvRk5TRmhzUW1GYy9SYzFtb1l2WGNWV0pnMkRvd0tPaFVsY2tZNTZk?=
 =?utf-8?B?YkNBb3kyR2VucTYvME45SFZRdXhhajJzNjcyY2ZJbjV3VlRQYmRGWWYrcjFG?=
 =?utf-8?B?U2JRNWxxbmZhOEk2T2VXNzN5SWlSc2NPa3l1VnJ0LzN4SnlrKzRFNTlJekFs?=
 =?utf-8?B?UDZHVjljNW9DK1RIN2lIZEtBK3NzWm1HajJLV2ZQd1NZT1JoRHczV245LzZt?=
 =?utf-8?B?VFJ6T3FDUXo0S09rUXFjZGYxUW5IUXZMeWpHS0hMRUpiVkcrS3VmTVpvOGN2?=
 =?utf-8?B?TUNYeUdVTVh3d3hoZGx6M1RUNlVHOGtlYThSWi9JYitnYzlPRDB2MUNHcXBE?=
 =?utf-8?B?dTViY2tydndOT2JoZ2VWbU4zUlNza3R6Rm9tczJUUmtiK1QwUXRTY1hBRHlJ?=
 =?utf-8?B?NnRGbE90TFV3VHZ3QlVrczZ6QWJ3RzJrTkc2d3pHY29nOEpXMGYyZlBRV3kr?=
 =?utf-8?B?TE5PcktObnFjcWVBSTR2TkVIUW5zL2h2UEFUdnlYVkNNcmlOMmRZTEcybE4x?=
 =?utf-8?Q?NV8v49pLE/lNBk8GocCqA01Z7Gy2qbd4l+WYEZuZ7Z3z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +7MO6YmMpu40+mbp3j/AduVn5wwcIOhFxlrNaKlKvgL+ULg1FmU8nW39tvdHuPshE7TcEpm+PfsG0EIs7sFINPLAFku78nkvYgAPegOT9E1AoneurWGEr9wrCojoFlTlPmDuoJjmtBaGD/GNvipIuFjGr7YdCThxmjUnynKNQUdH+BSGMRM1tS4mPaIZ09Z8KGWAC5k7Bu+sStJtbLXzOLm5UDnkKHrn51/i25Jl/dtWa9QUSVmNlCXV4TlZAkTa8bD1D97BVctY7ZQziXmqR29qJw3qwPUEtA3lcwpdJq6FGqx0+ezK3P62cVxQvOCMypRBivZwRCB55Xm3knDtyPCsZ/gcRBdjxToSF/YvieXyrpX/9qWOrUFN5i2K+KMTyEXpI8hE/DuLzH4SYN5YbVihyHQZ5cu07JI+ckvAA3bDWc/fidplzCa50oPAJYQU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 05:16:37.6847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fea2c06-30f6-4f1a-7891-08de6f760ec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
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

Add igt_info() logging before each amdgpu_test_exec_cs_helper() call
in the write_linear, const_fill, and copy_linear helpers to show the
IP engine name, ring index, and transfer size in bytes and KB.

This helps diagnose timeout issues by making it visible which large
transfer is in progress when a GPU hang or -63 (ETIME) occurs.

Example output:
  SDMA write_linear: ring 0, size 2097152 bytes (2048 KB)
  GFX const_fill: ring 0, size 67108860 bytes (65536 KB)

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I9e0f178caef61bb2c3eeebc57c5c1118ce7b496a
---
 lib/amdgpu/amd_command_submission.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index c14b2cb75..923febeeb 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,18 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+
+static const char *
+amdgpu_ip_type_name(unsigned ip_type)
+{
+	switch (ip_type) {
+	case AMDGPU_HW_IP_GFX:     return "GFX";
+	case AMDGPU_HW_IP_COMPUTE: return "Compute";
+	case AMDGPU_HW_IP_DMA:     return "SDMA";
+	default:                    return "Unknown";
+	}
+}
+
 #include "ioctl_wrappers.h"
 
 
@@ -440,6 +452,10 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 			ring_context->ring_id = ring_id;
 
+			igt_info("%s write_linear: ring %d, size %lu bytes (%lu KB)\n",
+				amdgpu_ip_type_name(ip_block->type), ring_id,
+				(unsigned long)ring_context->write_length,
+				(unsigned long)ring_context->write_length / 1024);
 			 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
 			/* verify if SDMA test result meets with expected */
@@ -567,6 +583,10 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 			/* fulfill PM4: test DMA const fill */
 			ip_block->funcs->const_fill(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
+			igt_info("%s const_fill: ring %d, size %lu bytes (%lu KB)\n",
+				amdgpu_ip_type_name(ip_block->type), ring_id,
+				(unsigned long)ring_context->write_length,
+				(unsigned long)ring_context->write_length / 1024);
 			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
 			/* verify if SDMA test result meets with expected */
@@ -697,6 +717,10 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 				ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
 
+				igt_info("%s copy_linear: ring %d, size %lu bytes (%lu KB)\n",
+					amdgpu_ip_type_name(ip_block->type), ring_id,
+					(unsigned long)ring_context->write_length,
+					(unsigned long)ring_context->write_length / 1024);
 				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
 
 				/* verify if SDMA test result meets with expected */
-- 
2.52.0

