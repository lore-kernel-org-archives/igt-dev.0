Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5F4C61DF0
	for <igt-dev@archiver.kernel.org>; Sun, 22 Feb 2026 02:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1149E10E0E8;
	Sun, 22 Feb 2026 02:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ptJizZSI";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013045.outbound.protection.outlook.com
 [40.93.196.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124010E0E8
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Feb 2026 02:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAFiwaLWxzhY3aJr88vdQFyBVWucxH1Osa2H1yLXhiP9XcFf7y6HOONA1VqApHzMR77oTgWlMtBZ3O07Xq91b4RiJ0+y/DHrNVAwnrSfRwV1UeyoS05rXBv2kRxn83mFplZEnbyrgDBETQs1qBfraq04XUdzJIY1NSjh6zAv/FDtn1qtdXauDHWpql/F3Qe7S1H5++kigDWUhQBUBuKdMIGJJVpnQd0Eox4DvDDN9cjvKt8S/p7Q/Xm5Lx0F7oJRPwFEYjU06EFxxuLjGSBVQIZ3/61WKoj5RolGeLajGOVaTGPI7udbetvOQO0kpf0GMyT92+eW94FEQPAwBs3Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoISvJquqH9aaLTZfuGNY+NIrAl86Hf5IcBUAf9ptnc=;
 b=fDPdWh8/c9ZVt0wnoSFH7tmCKV3YOt7j5XXG8YMuVdkYMEhcs4VH0kKq2jZAk/V6LKmq5L4BhS5GygRE/1XJf4zau8JvWzGv/iY01/8WX4w9vADH+gNjrS6V7adxumX94uLennJhzMPyh+10LgcDay76l2PkJlCI7gslQ6+akvpxb1eKQUT8f34FvYsTtU9I61TA+kGxwgRSBuXnZOWar/PwXwSoYAfu8wCSaNRwDTuJLZhhujMtyipS/dTVLmfMDokXJgTwwOvBGy0142kA9tIDxScGOVKslSGuSXP1W6BMTylav/9d3uAw0WFqeUtTu9pKgREDmYwSNXFasHyhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoISvJquqH9aaLTZfuGNY+NIrAl86Hf5IcBUAf9ptnc=;
 b=ptJizZSIAKPCU/hPL6OKkluOZhmi5URc2lMuf7zYiAjP6cjFLAfy24BzfAqjj+MK94e0uvvuy1PXiyex+ozMyy+2baNy48UdDkM6YVCNoQh2RZ3o2+0NONnVl439oTY3n3ilAeRS1HGG4prLGzLERNADDmZQq+gDPNwppSvfnMU=
Received: from SA1P222CA0197.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::6)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.19; Sun, 22 Feb 2026 02:26:12 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::e4) by SA1P222CA0197.outlook.office365.com
 (2603:10b6:806:3c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.20 via Frontend Transport; Sun,
 22 Feb 2026 02:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Sun, 22 Feb 2026 02:26:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 21 Feb
 2026 20:26:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 21 Feb
 2026 20:26:10 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 21 Feb 2026 20:26:10 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 4/4] lib/amdgpu: log transfer size before DMA/GFX/Compute
 submissions
Date: Sat, 21 Feb 2026 21:23:55 -0500
Message-ID: <20260222022606.160188-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260222022606.160188-1-vitaly.prosyak@amd.com>
References: <20260222022606.160188-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: dafb094d-9b91-4e00-bb3a-08de71b9befa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVRQeUx4K3hDRVBJd2FraXI5MFhFTjRRQkdFTmZOZUR1MElaRGhTWmQzZE1L?=
 =?utf-8?B?NWYwY1d0OFcrMVpZc0IrcDdQZi9xVXM4VXZKZWlDV0FFNEJsZEJTaVdlUlg1?=
 =?utf-8?B?TUc1WmwyblFJMklkOFV4VEpRMkJYL0JnclE4c1p6QWsxcWJrbm55R1ZydURK?=
 =?utf-8?B?WHE0SHFhQWp1RDducUFKOUxTK0xreTdrWThhSzhpZEZOcUlpaW1hdE1Zb2pq?=
 =?utf-8?B?OTlTWEhNUlBKSm5PQ0RicE5tbUdYQ3ZscWh1Y2pCdU5UNUJxZ1QwTmE0bGRU?=
 =?utf-8?B?akNDUkM5UktxWkxPSUw1M2hadnFMTzRMb2NJMGZTY3RrS3hMVytVWnBucWJN?=
 =?utf-8?B?MnVUSDZJdXFPZXZ6TEQ3bWVBeU1adTd6OHBKZXVQN25DWGVmQ3A0QlErRlU5?=
 =?utf-8?B?cjF3STJpd3lGaWpmZldGYWc5Q3M2MkJwRkdEZU9TeHBvbnVuZ3pnR2Ezb1RD?=
 =?utf-8?B?VURpUmpVSXprNVBZc2orbHFzSUVNU1BZNlc5NU9LcXVDRm1zYlc5bmJOandT?=
 =?utf-8?B?aUpWQXVQUFJXeXNwNUFKb3BFZ2pneW9wVXpCeHYwUTM0eFdBM09BV2lEa2s1?=
 =?utf-8?B?Sy9xWW5TcmVHa3NTVWYwZE5Wcng1bCtxbWhsNUl4cUZ0aWFienRwalBDWE1T?=
 =?utf-8?B?SUY4SUYvMTNWaFVIRm9WbU1URytxRjc2Qkl4VXRiQzg0REJyd2txQXVDcUJR?=
 =?utf-8?B?WTJsQWNodzlnMThScWZ6bWJ0c2lOQ2hYR0pHWHFaUFJWcWNKQWtvRDBST0Nv?=
 =?utf-8?B?RWY1RUZ0bXhVMlhWbm1SaDRjKzFsYnVkcGpEU2ltbmNJcGhaV0VKZkYzQlV3?=
 =?utf-8?B?SElZeXVWWUprcmN6Z3RXYldhK0dsN1N1T2lVNWkvVlhFNHJXTW9EVkRmaHNm?=
 =?utf-8?B?bGNFRjRaWlN2aHVueFBJeUlqNllBZnJWUjFNaG5oQkVwWjF0TnFZdEdleWw5?=
 =?utf-8?B?VndnTmVsdndHQ1JSbVZPaFhBWklSdlNSTTdIT2V3cUFhZXdSbG0rYTNUMDEz?=
 =?utf-8?B?UWtlbnBoZWt1dEptNEtIcjJjUHpzTGdXZk41ZVF2ZTlkRktrdzVxaExoT1VR?=
 =?utf-8?B?SVRxTUlPK29JZ28zemRHdmdkUVJUc05qQjUybFZDTWxLU1IxTGhTa3lmR28z?=
 =?utf-8?B?UlRwRDZySzQ3ejQzSVBDaTkxUlNoSWxkVkJremhCSDZma01CcGpzWEIvRlZl?=
 =?utf-8?B?N2RQQlczb2RLV2lSUlozTU5ET3FTQ0NJcWc5Q2Jab2szbEJrV1FIRnAyZHlj?=
 =?utf-8?B?VHQ3cTBUdHQzYTZzNWI0ckt4SnZ4bHUvM1UwMk16aVZmcXJ6MWdCYytvVmNO?=
 =?utf-8?B?NTYrMDRack5YUzJXRGN5R1E1Y0o0dERadU1qVHRIZ25RRUpEMHV4eGFvanBH?=
 =?utf-8?B?ais3WWZTbDg0QndQVjdaWEdZZjBaZnlsVkk5SmV6Z3RvSmFKTTU2VTkzV2Zr?=
 =?utf-8?B?aUFSTHp5eTdibzYxN2FFY3ltQVFmMzVQZkpFNWZUZFU4WktSODlHSEc5NVJ3?=
 =?utf-8?B?QW1GOFc2K0FScllxZWs4ZWhKRlRFS3ptNWc1eWt3d3hpeWRES1g4ZzJxSVVs?=
 =?utf-8?B?ZW1vblFNVXQ4Q2JaTjhjZTNRei9KMlZEQkR3cTJxa1N5Y1hHaGFwZXA1dVlv?=
 =?utf-8?B?ZGZLYmk5dW85bnJLYi8vMWpIbG5heGt0NEpYUG9icmgwN0xGcFdhYjdKREJy?=
 =?utf-8?B?YTlKM1Y1bHp3QnVvZ21ESnBYZXVsVit4bXRHa3AwSXZmVkl2NU9oTTFaSndE?=
 =?utf-8?B?T2h6NFM4WWU3RzN2dzNQSUxvR2QyRHVDOGM5cyt3OVBOcXBsMWlwaUZTdGhC?=
 =?utf-8?B?cE5WUlYyWjFBRWNvbVR2S3B1SlRQNUsrSUVDd3A0MzNKZzFFcTN3MzJkbmxn?=
 =?utf-8?B?b1lLcnFabk5kQzF0dTlIcUU4OHRmWUlHeFJDb3lzejI1SjNPRVR0RzdGUG1T?=
 =?utf-8?B?S0FGTjk1M0N4c3N4WjJ1QTFTaWFBNjB0TFZocUNvTFVqZGVTb2R6bnBvbWNW?=
 =?utf-8?B?emRFeitiVFdYSmh5L1E2WnJCZmNnRUZsZ1daZE9ONW5TV0pia0xrYzF1LzlF?=
 =?utf-8?B?NWJ2aURjN3BYdTRqL1BrbkJ2SWFyb2svQUZvb3pvTHI0aUJQRUZxQXJYWmpD?=
 =?utf-8?B?c0VoUHlzZXVabDdWdWMwV3lOUmIyTG1lZEtuNVNlSGg4Tk1uVEppdG9xU0FK?=
 =?utf-8?B?LytBd3BOVEJheDVoZS9DQTB3b1NsUENvQXd2ZXcydkFiVk56RDlEOWdsSjVJ?=
 =?utf-8?B?dlBZbkhjYjRna2R3Qm5UeFVPdjNnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bhd+fbjKBNIF6J3rko2gBqG3YZKsiW4HvsdqBN+kDTOPwZUdAYTlOt/GWqwvca+V3HGavWI2pZ2SiZVOzeQCFCTOqL95xBbUXWJrZFBQ9pDuoIv4ASsKNXD3Sm8bDXr8c78xJHg/GRWeM9mL5lZCRCKgb01GyStteE+kugl2kcR6M/21UiceNOx802RTum9GP93sI4eI6TVB9jQ6pa2n1mElzzxfvp5oXVx5g2Z0RUocKAiEtxn+4sYflsr9maiKYf4rOURvrxJvuzM5aCvuU7UO7nfEaozzyRQ+cUCtcWVE/mT3bBI+gztax93nHLTAIvRKoecnkkzccFtvPIm4D0SY6MvlkFHWL+SN2mp2RlodFh5ZUP/+L61YKsLjW7K7kkbdZCcReWkd9mlgjyTXRzodmTB97gsZMe86ctrLWKTGNoozGq4K4WjmYftVrFMf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 02:26:11.9516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dafb094d-9b91-4e00-bb3a-08de71b9befa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
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
---
 lib/amdgpu/amd_command_submission.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 699b8ba6a..ae5977205 100644
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

