Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD2FC79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796B310F1F4;
	Wed,  9 Sep 2026 16:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QFr+lsAQ";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C850010EE6C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 03:38:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2ToSoIXor8cRXiNVOKnlP6v6NPcsB2E5z6k+9WUnRP1IamwxgoeKN5JuXQQhGzr7EMz4QJhRIJzqa0ISY4kEe+hZq8wcIS5FD060FTFl+jng7uApjo58+aaFCijZWMc+YaDjuPrSDrtdXEs8HRl7W7ur86Y242rjn4prcHJshSoVJF/TWOMOcNFLFrG2gqfE6tZ46RfXDnCBD8/tjUMKKynH4FVnPEWhdmExsKcz8fj/wuMSR8yHFjpoT3VUghlh5h5zBvzBX/sP70UWm91vNTAuw5mQexeM7Nn8ThMKcoyxIMdvck9evaMVEBWJsZRfR+eCHP9h8PKGAg/8K+AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHYdIAwk/EPebawojmBI1zV8a7nkSHa630uspl6HBC4=;
 b=k+wEm1ebYlwhmFPkBeSuiZ8SX6/3uAKEjySdlzDUSg/4I08HosRn8Od/rAFk//MMXNE5CqIhShEsxZjj30FRDsVGRq2owR8CCAlDuoVG6ZMGzYtnzql0g7Xft43WnM4Y1/er1MPH/Z+Bdf+AX6sohAxkmCrcWrjXkSv0/jLaUbgbFSMRRFhsYItd4Uss3wsr3VYlOmBZMt2M/HY96V7PnAJ8cVxTCxvZWGND9XW1AEfx5AvIh0duNcvXAUOphCvaPTKMaZTTBwGPhuoY0AzRN+1NrzqXJnc2e5lNvD9nk9EEufX3XL744FAIscZJtlQ9akiDc50YJYkU60Ksu85bhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHYdIAwk/EPebawojmBI1zV8a7nkSHa630uspl6HBC4=;
 b=QFr+lsAQg2bkeZBCQtoESlDPMpOVKe6TlB4YuCgabruaQ1plYecm1fNKxrpO5h7MkCjltYJILR+jTVXQXYw15TQKDUIGyNStdAV7Jp0+8VJErHiFlDvp6kvutKDpCeFTsFbj321zinIAfNkVJ/m+C8FkQQ0vC8KGSQalaAVOrlM=
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 03:38:46 +0000
Received: from LV8PEPF0000005B.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::3b) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 03:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF0000005B.mail.protection.outlook.com (10.167.245.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 03:38:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 22:38:34 -0500
Received: from granthali.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 22:38:33 -0500
From: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>
CC: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: use shared amdgpu_ce_cs_enabled() for all
 CE CS tests
Date: Wed, 9 Sep 2026 09:08:11 +0530
Message-ID: <20260909033811.406258-1-Granthali.VinodkumarDhandar@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005B:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9bba43-44c3-4141-e672-08df0e23d9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: yKXMeTki9yVxq09bfShQY2O4o++FMuGMDHE+8lkQxuIQ7Du8v5qR/7dAiDK2S7WIEtazBsaKpeF0mpd+344zGSq9dd9TvQno+SOeYwM4/xWXAjil+A3HBZGr0fNTbAgu+8XrSDAtVEyVPXvl9XJObcQ6d3mU6v6N9i+KD6rPkJKPETQqX17pNoI1zuu/Me06dnxv1RTd3AS/s2Ww1ltbXGlZI6swv2hXX6RJ9a1cR9K9y5UKBsnxWsIYL2FRb+wdhVpwdmRAdXsD7mA75ByqiarzJe1XDs2s6aeHxbkwSGNuVHu12WSfQfytgq8yfeHPmptTlVcTiIkxSc9r6s0TdHDk/kbdP3W0XuxsJH6TDE4nE+SjOSmXr/EF+rBpOokCqYGBlQy/h96dF/4BntnGTmPp+CbgIZtPfTfwuzsEEmqSaYjNPFyWqVKN4Sd0VEkKdLUviMboX+/DVhDyd1TXRgPzhDqfcAwh2+MiJidh9BX2XFat+3WZqD9Bs7W3lwcG73nDcwf9ho7kSRWlfq9wCkZRXwaCVcoKVYMsYxVADmpFhU0SWQg7IduhUok4kCKb8efYxZRPyBLZpv+o3lE8n9Ww3vHbPaqMgSZ8irsGqMbrf1k7VVjnAPXaoTh1PnFW0bupYa7ef6DcngmwuslkGgqIJmM4s8UyIo1jzO+gi/VbUbCOePc/itgM2SxSls0Rx/b/L/JWcGX5eq41wOoxZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d5RiGu//jrSb2+yL86gqhLaG29GBkSe1vQa032Kt+KosSxW4kfbKE3czO7aKKSl+cP/W8Q2zpuUwyD10knSVU5Cj5fRk28xFqUqwVdNF9k3uu7q3iAJlCrUUwBGBA2lUF7lX/lFa6klvLLdBWxZccSKKOuPksFJh8kwx5tVeRoRpvmhLt1Va69oeCw1rg5gDUgU3YcT+biVT+t/wB8RR1VToCLAjqO8dkUgKhrhqcfI2L1k5HQyERHtXG52EqdlT0RZhO9TjeWRovaIRuKnkZmTLJa7KqbmFdX3AcEWLjUFHnl7WTkO/jEOKJ0/7zMCJkP7drrbaRNedJ0QzQ5JrOieDx+L9Itl6HhRHYcQGAFnkr1KjOJMfDStaAauS9cJnl4+P87Z/VsHjicvF2dU68bWlK1MoXGM6uOQ1g7n/EkBN041xwmFsySZMFqkyKKtD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 03:38:44.7548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9bba43-44c3-4141-e672-08df0e23d9a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000005B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
X-Mailman-Approved-At: Wed, 09 Sep 2026 16:02:29 +0000
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

From: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>

Commit b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel
blocks CE CS") introduced amdgpu_ce_cs_enabled() to gate the constant
engine submission paths in lib/amdgpu/amd_gfx.c.

Extend the same gate to amdgpu_command_ce_write_fence() in
lib/amdgpu/amd_command_submission.c. Make amdgpu_ce_cs_enabled()
non-static and declare it in lib/amdgpu/amd_gfx.h so it can be reused
instead of duplicating the check, leaving all three CE CS paths sharing
a single definition.

Fixes: b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS")
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 4 ++++
 lib/amdgpu/amd_gfx.c                | 2 +-
 lib/amdgpu/amd_gfx.h                | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 7210cffb9..c7b36970e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 
 #include "ioctl_wrappers.h"
@@ -805,6 +806,9 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	const struct amdgpu_ip_block_version *ip_block =
 		get_ip_block(dev, AMD_IP_GFX);
 
+	igt_require_f(amdgpu_ce_cs_enabled(),
+		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
+
 	/* destination buffer */
 	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
 				    AMDGPU_GEM_DOMAIN_GTT, 0,
diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
index 10bc74b5c..ff9f869a8 100644
--- a/lib/amdgpu/amd_gfx.c
+++ b/lib/amdgpu/amd_gfx.c
@@ -29,7 +29,7 @@
 #define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
 
 /* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
-static bool amdgpu_ce_cs_enabled(void)
+bool amdgpu_ce_cs_enabled(void)
 {
 	FILE *f;
 	unsigned int mask = 0;
diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
index 90addf5bc..8bf108365 100644
--- a/lib/amdgpu/amd_gfx.h
+++ b/lib/amdgpu/amd_gfx.h
@@ -32,4 +32,7 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
 
 void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
 
+/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
+bool amdgpu_ce_cs_enabled(void);
+
 #endif
-- 
2.43.0

