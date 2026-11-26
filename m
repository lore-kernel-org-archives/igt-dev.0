Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB9606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 03:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5q0awdkF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FD010E2EC;
	Thu, 26 Nov 2026 03:28:51 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010022.outbound.protection.outlook.com
 [40.93.198.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497210E461
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/IfmYZiNkQGpJcXp7Q1yZ7VI5O9u4q4gzsO4/4VVG6mYfsyvsEpywMJXeY84zpXMaIyUnRodmYqEPAM/DHoMl3nY8hMvjeJWizQs40tywAo18IwN9ebnX95PH3RGBUGWPcZiNdk5k6frFhqeqHh2SXTwmN0ANZDwf89CAXZuHC+1FIvTJfD7I33MAVHOgRcsF+yAXSshbWNfeYTKfNJjwCPp5SxgpbOwDPaAaKvwYKQmsXu6+A0eQmTdBuudhrOvu0ekPkJ8y42bQZzQWVS2cN0ZqTwtA7prIX5fbu6XAHAl7oHIKsw9AInaOO7zWjwFxAP6zl/k8N+V4AmOoSyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waLNmIpUdC+vZU69J6AhNBtqmf8bvfZaIBpac20ZWnI=;
 b=bCuZRKGCKvKhRUN7KipgxKmdyAiZUNNFHWDIXLFuPts8rl+Dy85KXX0syxpTl6bZpAiitJb9CQGciGnMK67HJSSsJY9boKz3cf1T768jdCOdqE7BWEN527Hgk/3pFVNkdJsjaugAPuTc3j49gRbxEGRRmTMSc/JQUW72SJ10XS8fcqV1fgXl0PR6CdcPgfm3XHeK2tPb040NtyQdZNZI3cNkQGWG8NJ1F2ponn5I7IMIpqVq5VKzEXMxN686IU4H4GrlNhtsGk18DpQRAThC8LNjrrRBrhgzS66HL5z7VAi4fh/6JIM0iumVJZt5fg7XnETOvwJuO9usC/ofCuOJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waLNmIpUdC+vZU69J6AhNBtqmf8bvfZaIBpac20ZWnI=;
 b=5q0awdkFmWOKmK9QyGKCAGVhVvkgMI4qR5XVa8guEcmcz86gxXhtm3d6HwO10p2/JaBHvPgkTgnfqTLmYijlI/4MIDYWfLOTtVcSdg8tU6JQCibQ4/5xVO+tZjkkz2UGbfjRWpCUzm8rmOYpb8KwjeUEcoQddfdMDVSA+q3OlGw=
Received: from MN2PR06CA0019.namprd06.prod.outlook.com (2603:10b6:208:23d::24)
 by CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 03:24:08 +0000
Received: from BL4PEPF000003EE.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::33) by MN2PR06CA0019.outlook.office365.com
 (2603:10b6:208:23d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 03:24:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL4PEPF000003EE.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 03:24:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:24:07 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 21:24:07 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Claude
 Sonnet 5" <noreply@anthropic.com>
Subject: [PATCH 2/5] lib/amdgpu/compute_utils: add dispatch helpers needed by
 SPM capture
Date: Wed, 25 Nov 2026 22:22:06 -0500
Message-ID: <20261126032404.172848-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126032404.172848-1-vitaly.prosyak@amd.com>
References: <20261126032404.172848-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003EE:EE_|CH0PR12MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 783a6aef-3943-4e55-d0df-08df4b6cbb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|10067099003|56012099006|261026121527099003|261026140227099003|261026130827099003|261026135527099003|261028144727099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021133027099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|6123799006|6133799003;
X-Microsoft-Antispam-Message-Info: naQHG9iACyO5Re6d9eaF+N53ip7ioS9WcUSdqeAB3M/t/ByTmBhjm5G8tvRPULsL8nVlbEEEdJ9RHx5LFn8YQKpInMrbBKKI+SZMOrCjTt+VoWUqiU6gbwy/OeP0NZuLuJcssAvRLnxVigXW9fa42AIN2ne74jgjS62JI8gjQvbw4E4kzy9AWxTNQ6YuFxhguU81OR0387zJD6SpboXtUed18INt4YoSGFQkL8kg3h33vjIwkZiYQz9WiAl1c8cJn/jnnJfWpxw/1bkTDISlhPS4h07B09uAHWLF9c5skWk9/6rExD1MW5qTDbJgpB9xFQ/DV6WwrIW+/WXvvRx+vb4ZtrYsvOki6sx+ukniLjfzTXRITgfY9vsioDegkUtQ0I2XdPEGuCNHls73XVFaCv+NXppYkupclL6uJYWzN1DlZLJsy9ESB6AikLrfMYIoVQIBiqFJuw7jNNQ+c7M497aWhcC+l8TKh0CLfJqXzfQ9l9lJVLNgQRoyJ7YFy78ZJ/n2V5c5DnhtgUhNFt5Xmnk5mcWMZ7AmqcBQGUBvB3ku47oq/Rpk4TnD1zYCskAaqpDnFIfg/yrvEmW3usD5fNtEYH+WdO76ZUU3F1iGDe3uroohOCnk4CQW7QMU15hA036RO+PCYxseb4nje89sNpu6ximAK2fIeeDrHA7GkqNkrU28u7l4h9jYGzvdABrEXoUKAWx+8edVuJPJr2uwgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261026130827099003)(261026135527099003)(261028144727099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(6123799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RPR6kJFOWxviQbRs+vuT5RszoJeVn5eXuUgFb6pdOioXnmj2NHCJIl/OBaq90ETBNQmqX/p1z3lkwuUfvVeD5NjNABezX4R23PjkR94NeKlTWYRu8cjtYvcAY8WPLpRQlu5PqbV5M15Vh6DGssjOBBEVts7JltzJoMW19vmCmJ8S511dBPVuqBRYw4hUScGHIPx1vhSKVPDXSB0qf19rnz3qMm1B3tMKw16wq38V9VF16Oe6KgbIP0mQWEnZ7YkuuqXjIbk3c+GUfVK4KsoBjMHOeHmkEH71pMuFrft4IqnpELE11SPALBmDwvOb3EhyOygTsTlfL4FmPzDUu2DZTZkztjUy0sywq698iJ4W3FIRJmFho5ogmRpd+Ron76vHv9KUhEYem+qyL7pt4OPtH/wDNNnCPYSAFPd14Nl+kI9nTn+k7SM5NU/txuw1Btfc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 03:24:08.5065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783a6aef-3943-4e55-d0df-08df4b6cbb92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL4PEPF000003EE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Two small, generation-independent additions used by the upcoming SPM
capture test (tests/amdgpu/amd_spm.c):

- amdgpu_memcpy_dispatch_test_with_bo(): identical to the existing
  amdgpu_memcpy_dispatch_test(), but takes an extra BO to add to the
  dispatch's resource list. The SPM test reuses this to submit its
  CPF-busy/cache-hit workload while keeping the SPM ring BO resident,
  without duplicating the whole memcpy-dispatch sequence just to add
  one more resource. amdgpu_memcpy_dispatch_test() becomes a thin
  wrapper passing resident_bo = NULL.

- amdgpu_dispatch_write_direct(): factors out the
  "clear mmCOMPUTE_RESOURCE_LIMITS, PACKET3_DISPATCH_DIRECT, NOP-pad"
  tail every compute dispatch in amd_dispatch.c already ends with, so
  the SPM cache-benchmark test can issue its own dispatch without
  hand-rolling those PM4 packets itself.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c       | 27 ++++++++++++++++---
 lib/amdgpu/compute_utils/amd_dispatch.h       |  9 +++++++
 .../compute_utils/amd_dispatch_helpers.c      | 22 +++++++++++++++
 .../compute_utils/amd_dispatch_helpers.h      |  3 +++
 4 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index ebb721781..2943b4e3d 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -271,7 +271,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 }
 
 int
-amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+amdgpu_memcpy_dispatch_test_with_bo(amdgpu_bo_handle resident_bo,
+				amdgpu_device_handle device_handle,
 				amdgpu_context_handle context_handle_param,
 				uint32_t ip_type, uint32_t ring, uint32_t priority,
 				uint32_t version, enum cmd_error_type hang,
@@ -279,7 +280,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 {
 	amdgpu_context_handle context_handle_free = NULL;
 	amdgpu_context_handle context_handle_in_use = NULL;
-	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
+	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[5];
 	volatile unsigned char *ptr_dst;
 	void *ptr_shader;
 	unsigned char *ptr_src;
@@ -452,7 +453,14 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	resources[2] = bo_dst;
 	resources[3] = bo_cmd;
 
-	if (!user_queue) {
+	if (!user_queue && resident_bo) {
+		resources[4] = resident_bo;
+		r = amdgpu_bo_list_create(device_handle, 5,
+					  resources, NULL, &bo_list);
+		igt_assert_eq(r, 0);
+	}
+
+	if (!user_queue && !resident_bo) {
 		r = amdgpu_bo_list_create(device_handle, 4, resources, NULL, &bo_list);
 		igt_assert_eq(r, 0);
 	}
@@ -530,6 +538,19 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	return r;
 }
 
+int
+amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
+			    amdgpu_context_handle context_handle_param,
+			    uint32_t ip_type, uint32_t ring, uint32_t priority,
+			    uint32_t version, enum cmd_error_type hang,
+			    struct amdgpu_cs_err_codes *err_codes,
+			    bool user_queue)
+{
+	return amdgpu_memcpy_dispatch_test_with_bo(
+		NULL, device_handle, context_handle_param, ip_type, ring,
+		priority, version, hang, err_codes, user_queue);
+}
+
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
diff --git a/lib/amdgpu/compute_utils/amd_dispatch.h b/lib/amdgpu/compute_utils/amd_dispatch.h
index a7cb5d348..2d699a261 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch.h
@@ -41,6 +41,15 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					struct amdgpu_cs_err_codes *err_codes,
 					bool userq);
 
+int amdgpu_memcpy_dispatch_test_with_bo(amdgpu_bo_handle resident_bo,
+					amdgpu_device_handle device_handle,
+					amdgpu_context_handle context_handle,
+					uint32_t ip_type, uint32_t ring,
+					uint32_t priority, uint32_t version,
+					enum cmd_error_type hang,
+					struct amdgpu_cs_err_codes *err_codes,
+					bool userq);
+
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, const struct pci_addr *pci, bool userq);
 
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 60fbc7d10..cbaea3e98 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -243,6 +243,28 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
 	return base->cdw - offset_prev;
 }
 
+/*
+ * Clear mmCOMPUTE_RESOURCE_LIMITS and issue PACKET3_DISPATCH_DIRECT, the same
+ * ASIC-independent tail every compute dispatch in this file ends with (see
+ * e.g. the sequences a few lines above amdgpu_dispatch_write2hw()'s callers).
+ * Padded to a PM4 packet boundary with NOPs, same as those call sites.
+ */
+void
+amdgpu_dispatch_write_direct(struct amdgpu_cmd_base *base,
+			     uint32_t dim_x, uint32_t dim_y, uint32_t dim_z)
+{
+	/* clear mmCOMPUTE_RESOURCE_LIMITS */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base->emit(base, 0x215);
+	base->emit(base, 0);
+
+	base->emit(base, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+	base->emit(base, dim_x);
+	base->emit(base, dim_y);
+	base->emit(base, dim_z);
+	base->emit_aligned(base, 7, GFX_COMPUTE_NOP);
+}
+
 /**
  * execute_compute_dispatch - Execute a single compute dispatch for memory copy
  * @device: AMDGPU device handle
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index 02e28aba7..6dd3c5260 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -37,6 +37,9 @@ int amdgpu_dispatch_write_sync(struct amdgpu_cmd_base *base_cmd, uint32_t versio
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
+void amdgpu_dispatch_write_direct(struct amdgpu_cmd_base *base_cmd,
+				  uint32_t dim_x, uint32_t dim_y, uint32_t dim_z);
+
 int execute_compute_dispatch(amdgpu_device_handle device,
 				   uint32_t version,
 				   uint64_t shader_mc_addr,
-- 
2.56.1

