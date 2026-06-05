Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BCECD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 06:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5510E203;
	Fri,  5 Jun 2026 06:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="446JJ6B/";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019B11A465
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 06:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcdIEDHta+TTTf4iRbtdy5ZkoYuO4pc6L2HgRWQE96aRT5+W3pptsDO2snbWKrSsFZOD5b91dbTcdKTca4gXuPDxWc70vcaSA/bGnFfcPtEL+FpWMeM8Qyooe0yrsKIB3xpU/JQcYKGGZ7rz6wvJ90jWKh+LBwhexI+FNzVbZaXmII/3XSW/tLW3Ai1QDu+NnD8ilnIlWq3wYoI5+77YRNyn0uWQ79DMGmySGc8yIdwVkjzRwF15Vmy+0g48b2LjKGa+15lRd8bHM87baN9UQ8TNTWoToqurolGu+kCcOrpPTtjI6FszxLxuI0mnPIJY9/Abfa/ajkL512U4k3ba2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQhD/YT9Tbp7N2mfgmU4K5gtAiLuiitQsRocHaDOvEc=;
 b=W46ZaVfKcYWv1AgnfqvQM3mc4p6tE+LR0DfEB8vxPRz/HG7yWI5z+C0rrHPJ7MAf1aAfYnoET14qdCCodWT5JaEGCiJUqmeuvEUPZD2ohWAT0SBh1Q+R24JqjQWxQebWQ2U4Iolz9LVrwIzS4T5n4GmnZhp6iZg5/F32TiIR0tgQNzswobd2fw28GVQWgStNl49gaZnF9Lq5A/gYZKyyHxtbBwxaOzndN6o3igwQ4Zdz+fFPoXaEc53yr+OzTz9fOCpcU8+aue1zoZtX+II4LzSxeXQOz0Hf5b1OW75buf3Fm6fwzxisfjiEknRnjNdUEfuDgQaXfb8ZCj6v4GBnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQhD/YT9Tbp7N2mfgmU4K5gtAiLuiitQsRocHaDOvEc=;
 b=446JJ6B/biwTbgmKLZ48trtiYLGMY6Va487P+9Km+dFUJTsbVSUPpoJSj//j7kSxbEv22WzddCtNuhfPD4iNoghTXqY9ZcokA37rgqYbaKXNUih87jvJFBz81x8ubTeU4Xkng+EXAMo5wlgTCJLMy8UpkVi1HDX7Vpu418NXV/A=
Received: from SJ0PR05CA0201.namprd05.prod.outlook.com (2603:10b6:a03:330::26)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Fri, 5 Jun 2026
 06:04:25 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::78) by SJ0PR05CA0201.outlook.office365.com
 (2603:10b6:a03:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 06:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 06:04:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 01:04:24 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 01:04:18 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/3] lib/amdgpu: Use correct SDMA doorbell offset for
 userqueues
Date: Fri, 5 Jun 2026 14:04:10 +0800
Message-ID: <20260605060417.2364146-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 370785bd-b829-488a-ef90-08dec2c84baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 6jqZ2SgSJrs430OAMXqdqM6LUX4y8MXXVIv8q/pk9kKrm6TKko+C4+DWOtpGhp/hs9/Kf8dJHshDGT86WwXeGMnG/G4bBXsV8amGjwBTmvuNlDjvE5epBDVyLIBB1u52AR1zwy3HXSDkp66LO+wdcguYfNNusVznA3XaU2V19XvITbOwtHnpYugsVgDiNcov4NXoaN/I7Z8pNT5GFU0ID3DnH9ZYUrEUnJ5ob/WDqoFvlWa+0Ns+CR7mQUGQxgkkHEjZz6y3WSqrfuwQFjoUmM6FKhpcx68jhUNWJX1APuglVg/d+VY4Y/SGCpt0stD6g46ZiyCKy2ylwQjGWWOb6q0AH5RTGJSxMINqtu78UcMt47ICj4/QzwydWdDT9TGbe6NTDVoclTyl/Fd0jOas9nB56kvXEjY4+rM+QzlcrVmNQSDqDSFsx3MhmxstXqvnWoj6WiiE9xAf/fvctipnuXPLGZUHXBc4J47h+a2SkgtIBxZ1uyyq07mZWV4GLIrO3tn6UR0Hels7QbRH2694bXMjnK03L5v+UFSsv+te8VVohDYuoEVA57IuSPsCcrqeVUOnbgavNR55EBPouZtnObN5dhCTQVN1E46gEj3OcO6LMnuBCtFVE/xki6cBScc9vtM/X9SQgz+j4WKMHOLvZwC2ecROh+PqYSTVrvDsspQLLY3Li2/Df2NTlsSUzqt0Rsn+jiFsuCx+Kf8NZm+ZeW6jR5i/bD+eZopoSoTfOb8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ToaxqFiRM9UfZ66JcUvpiLiaOXKrcwtnl2ajD32UF6nZEcWKHqA+aQjTQ0hpFPmhLQaNA7V0ia1PCV4M1eiTN5/RXx0mjLC/mjKGQpdaYvJXCBh943luNyxHJClLCTEErmjIwkbpvP3hs3Sb/0qa/Azg+iH1z9gcb+21NGweJacTRGtHd8sGJBrV8wPMS/2lmBJuNSeaDIHOElapTQY863izKDKyzffEvkXOYXH/wEdd80idjQi3U/Vq9qicZDPVOi6mUiUxtF7BdrdX1Kmb7Q0Dq82c93GxetH1CipNDJmaHKtTbGOiQMeSZ6oj9bafXmlN5UdzdnBOyAgBEmqVZ6S9ofL4UcESZtETn5k/6Pn70J/ApWST4M0ZGMSsH+N338M7AevljcW6YBOio22nqTFIgwESRs7wQ9YptbRNN3GsgxUmJmUN4tG9C+6QuxK7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 06:04:25.0821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370785bd-b829-488a-ef90-08dec2c84baa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475
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

SDMA doorbell writes must target the per-page sub-aperture at qword
offset 0x100 (dword offset 0x200) within any 4K doorbell page.
Using the generic DOORBELL_INDEX (4) leads to incorrect ringing and
non-functional SDMA userqueues.  Define SDMA_DOORBELL_INDEX accordingly
and apply it during queue creation and submission for AMD_IP_DMA.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 11 +++++++++--
 lib/amdgpu/amd_ip_blocks.h |  3 +++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 80aa5569c..b44441d0d 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -748,7 +748,12 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
-	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+	if (ip_type == AMD_IP_DMA) {
+		/* Ring the SDMA doorbell at the page-modulo SDMA sub-aperture. */
+		ring_context->doorbell_cpu[SDMA_DOORBELL_INDEX] = *ring_context->wptr_cpu;
+	} else {
+		ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
+	}
 
 	switch (ring_context->submit_mode) {
 	case UQ_SUBMIT_NO_SYNC:
@@ -1006,8 +1011,10 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 		break;
 
 	case AMD_IP_DMA:
+		/* Per-page BIF decode verified: standard userqueue path with
+		 * doorbell_offset placed in any 4K page's SDMA sub-aperture. */
 		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
-					    ctxt->db_handle, DOORBELL_INDEX,
+					    ctxt->db_handle, SDMA_DOORBELL_INDEX,
 					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
 					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
 					    mqd, queue_flags, &ctxt->queue_id);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index eb118c68a..e26ee68a9 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -60,6 +60,9 @@
 #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
 #define ALIGNMENT			4096
 #define DOORBELL_INDEX			4
+/* SDMA per-page sub-aperture starts at dword 0x200 within any 4K page.
+ * In qword units (USERQ doorbell_offset is qword-indexed): 0x100. */
+#define SDMA_DOORBELL_INDEX		0x100
 #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
 #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
 
-- 
2.49.0

