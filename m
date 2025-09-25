Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB858CAC5B1
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 17:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727CE10E996;
	Thu, 25 Sep 2025 17:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cPdyaZ7p";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1001610E996
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 17:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXFHQL8mkXHP0puCEtmuaJAgu5a9vnkYofsyodW+fzz8CcAhB0bgqnnS0SdR658DoKf2/GTwu/+Rb5XR7hmeHsW4G4pdQCAFI4Q6HJnqlGKpWvR7EkLN9cvgfwWh0NfNA7hupjFIgrZxPPb8LVlpySEZLtmg/QMiHYWXupnSGNpoURIFU9zOJndFQ52lQffZYlrG5UxSoWvVXzmEKMoniBiKCI1O09WD0E7reAqt8hDWfWtr3O+GN2iyLj5nzLLINgDjXHiC6h2pCxLrqSmjMcopsRdppp9EcOnP2+RqtDDlFmqIQgNqdJD/RUzib0IT+RtB1BRHTK3bBdckDXpnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqEUMjSzuyrqJY7gLG1fDWMGmpo3LfLXUQss1uB0avg=;
 b=j4hi/uG6xH2bNEcb0N8VVV1kr9IoaIMCpiEXr+mXe5m6dzh+q4v86aNOMYwohJJ92aBEVOHG2YDI1Wwxx6GNbjEimZ/zkly5bOuevQqESL8kzhPuWRMFpbU9pGki+9sy7icsSXWSIr4iVry4koBdSMe9vJ54+nx16EVURhi2Ke2seycMaGuhhY1AHbnenNsiNGnsxt8L08n+Hnsy3iDEyZ/5z7DHmrZ1rNtEojhC/2p9ehtOvzgCmyasnZczRksZFPuj7EZX7tpH9U21+f0hvJMbJpZst9lWLPrcbxz8CKf7KVH77bMzpsO3XqMchx9zzp3LjK4LdrVEpqA4FNTpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqEUMjSzuyrqJY7gLG1fDWMGmpo3LfLXUQss1uB0avg=;
 b=cPdyaZ7p2zKe16jKFiNxIv1M190pZP0GNmSGeDuCnsNAAwvfv0lCWvZHdfCj2DtyiqdY5aksd3JrY8BATMCfZE/h8JWt0MYQunGQIM1Kr0AONIVCl1VOfTrukEHfgzTTBiJuwfyYb9GJ1j5oRsHkHEB+YudnmQ/i3InPyslsXtA=
Received: from BN9PR03CA0668.namprd03.prod.outlook.com (2603:10b6:408:10e::13)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 17:04:44 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::15) by BN9PR03CA0668.outlook.office365.com
 (2603:10b6:408:10e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Thu,
 25 Sep 2025 17:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 17:04:44 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 10:04:44 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: fix vcn encode test on VCN5
Date: Thu, 25 Sep 2025 13:03:00 -0400
Message-ID: <20250925170405.145614-2-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925170405.145614-1-yinjie.yao@amd.com>
References: <20250925170405.145614-1-yinjie.yao@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf29c90-52fb-4aff-eae8-08ddfc55a018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LmnnR0KVFK89EIVtiV4xrrJKcQZvkziAYtRDkDmJIs1Cts/jTmI7zpVffBqQ?=
 =?us-ascii?Q?JZVwZoT3MfW3YZ3LO2oNKPBzgSuIEWtSIr/Dzy10Zqc9ivndBZVRbbv/04K5?=
 =?us-ascii?Q?8nEadsmEPaApSvbcv3SCyUK4nt46DBiLzdaNN7JYqygHFpXeNA6upgqqWMJh?=
 =?us-ascii?Q?qCYjQ96KjypFmfnEVbP+8p2yMRreLUYLXqTT+cqa/dKxB1puYqYn2eGsr+Bd?=
 =?us-ascii?Q?uYPviSvs9Fvtj2ahYCP90wlt5QkipnYdlOhysy2Wg5GLEZKhyOTg6Z2R9SDb?=
 =?us-ascii?Q?w+rc0i19T4StEAq7mI7+JB9oaQmpA4coNoQ+zCvZXpkedgjYrPXQkiVrn478?=
 =?us-ascii?Q?ZBbaC8KH9yheQUCLa8F2azAqzpVYIDV98gmxSGIN/qBdjmdch0+/00NVcNzr?=
 =?us-ascii?Q?nVBrntE8SA09GnBveuDWH65kysymQTWXX9N89myxoNW51PU8Ktx72xuuNQWN?=
 =?us-ascii?Q?twW/7Rp6veMY1Vv5uNevdbpdtuBahG6i10HkSEZtJBsjgAdwdG7qzi98UBoB?=
 =?us-ascii?Q?bM3dnEbT5Q2tEaipnXZ71YHKu0MvHwA2KUxLn19jkQj3OCcPz7F9tRT7UyDm?=
 =?us-ascii?Q?rEg9xG4WjhFnAnzxvQEYvTKYyWuFT1RSqJMvqNui5e0mjS7yIos7Iev12rk+?=
 =?us-ascii?Q?0/AIodyJssBB+HPwoQkYZroLM28hXM/52sLdtap2liDPV2No7oeqaN54qcHx?=
 =?us-ascii?Q?4pLd9A+gfmGkX8+zkD4TRHVrN0v5FJCtVU4nI0KfquWcyLQrhpmQlnFPWRQj?=
 =?us-ascii?Q?xHX0MIAw3FzXB48MihwRA34GomHydHmMPksby6zgbm2Rl9suZYVMMe3JQpzu?=
 =?us-ascii?Q?bpOXxxubM2/srf65MZU8zjxPDcdD7EGy0izzj3iT9fOSPD6hnUiNoDef6NC4?=
 =?us-ascii?Q?SOVeWbZxBhv32p9lmSARHZGfqBBfvuYnqRxCCw+cxWGDrKh/gZeo34Xv0sY7?=
 =?us-ascii?Q?lY7Bahb21s/ryKuFBf82ySH/uuB1ZUgNB7Nr3qTnyY0tOhVLWJoYfmX21b/u?=
 =?us-ascii?Q?78Z5yn5bIzofjardZYLwsr84nxaZC2EmaGQQz9gamwWkpGpq2J5FqrF/eXyS?=
 =?us-ascii?Q?G5TFdI7TQ3AeE6fUwb5RG+gEnRw3IfJS/f39ISCuL7juEKNGkWuxTbEYNfyM?=
 =?us-ascii?Q?w/b2p8oyHPbRAHLR0o1/0PxdAisu4PyKju/Q5EnpfT0THUiF6yORC5R4nGFj?=
 =?us-ascii?Q?B+yqdyX6J2YfDQgdxywY7C+aLnZ5HpxbsEBPFKgD8ky1DZzio5HBiUJZ8Lni?=
 =?us-ascii?Q?HIsAaTPzeLGBNqvfiHB9m3E+DJbbUSWwhRv+2oQ83ry5aK/BFcPw1FjXdLAm?=
 =?us-ascii?Q?/yyPLZo90V3N8P0+4lAb6FtbXYH5ehtR1gLk5RAxPYURyp228nQ5DUP0vXqi?=
 =?us-ascii?Q?Y15YcjQ6BZJuBddoMr761SFL6V1Rf7rOGSapYNnEslwENP+sMSr6gppk3N4/?=
 =?us-ascii?Q?uzeb5Bg/Y3KrzmZp56C0b7vdw+RjldZkFJNuWsXA+/3wFVKyEm0+jjeMvFSO?=
 =?us-ascii?Q?2hnveQDp+pPbSKzg4q0O0Ol39OokmbzqTN5n?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 17:04:44.4463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf29c90-52fb-4aff-eae8-08ddfc55a018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
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

Update ib interfaces for VCN5
Remove previous workaround to skip VCN tests on GFX12 family

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c |   7 ---
 tests/amdgpu/amd_vcn.c      | 111 ++++++++++++++++++++++++++++++------
 2 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 32766c0b4..bcc0971a3 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,13 +59,6 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}

-	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
-	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
-		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
-		return false;
-	}
-
-
 	return true;
 }

diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index 03c864c0e..20a642f45 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -316,6 +316,8 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0;	/* constrained intra pred flag */
 	context->ib_cpu[len++] = 0;	/* cabac enable */
 	context->ib_cpu[len++] = 0;	/* cabac init idc */
+	if (shared_context->vcn_ip_version_major >= 5)
+		context->ib_cpu[len++] = 0;	/* transform_8x8_mode_flag */
 	context->ib_cpu[len++] = 1;	/* half pel enabled */
 	context->ib_cpu[len++] = 1;	/* quarter pel enabled */
 	context->ib_cpu[len++] = 100;	/* BASELINE profile */
@@ -777,9 +779,9 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 			struct mmd_context *context, struct vcn_context *v_context,
 			int frame_type)
 {
-	struct amdgpu_mmd_bo bs_buf, fb_buf, input_buf;
+	struct amdgpu_mmd_bo bs_buf, fb_buf, input_buf, meta_buf;
 	int len, r, i;
-	unsigned	int width = 160, height = 128, buf_size;
+	unsigned	int width = 160, height = 128, buf_size, luma_size;
 	uint32_t *p_task_size = NULL;
 	uint32_t task_offset = 0, st_offset;
 	uint32_t *st_size = NULL;
@@ -794,16 +796,19 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	}
 	v_context->gSliceType = frame_type;
 	buf_size = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;
+	luma_size = ALIGN(width, 256) * ALIGN(height, 32);

 	context->num_resources = 0;
 	alloc_resource(device_handle, &bs_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
 	alloc_resource(device_handle, &fb_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
 	alloc_resource(device_handle, &input_buf, buf_size, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &meta_buf, 1024, AMDGPU_GEM_DOMAIN_GTT);
 	context->resources[context->num_resources++] = v_context->enc_buf.handle;
 	context->resources[context->num_resources++] = v_context->cpb_buf.handle;
 	context->resources[context->num_resources++] = bs_buf.handle;
 	context->resources[context->num_resources++] = fb_buf.handle;
 	context->resources[context->num_resources++] = input_buf.handle;
+	context->resources[context->num_resources++] = meta_buf.handle;
 	context->resources[context->num_resources++] = context->ib_handle;


@@ -815,6 +820,10 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	memset(fb_buf.ptr, 0, 4096);
 	r = amdgpu_bo_cpu_unmap(fb_buf.handle);

+	r = amdgpu_bo_cpu_map(meta_buf.handle, (void **)&meta_buf.ptr);
+	memset(meta_buf.ptr, 0, 1024);
+	r = amdgpu_bo_cpu_unmap(meta_buf.handle);
+
 	r = amdgpu_bo_cpu_map(input_buf.handle, (void **)&input_buf.ptr);
 	igt_assert_eq(r, 0);

@@ -922,12 +931,13 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	context->ib_cpu[len++] = 0x0001f000;
 	context->ib_cpu[len++] = input_buf.addr >> 32;
 	context->ib_cpu[len++] = input_buf.addr;
-	context->ib_cpu[len++] = (input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32)) >> 32;
-	context->ib_cpu[len++] = input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32);
+	context->ib_cpu[len++] = (input_buf.addr + luma_size) >> 32;
+	context->ib_cpu[len++] = input_buf.addr + luma_size;
 	context->ib_cpu[len++] = 0x00000100;
 	context->ib_cpu[len++] = 0x00000080;
 	context->ib_cpu[len++] = 0x00000000;
-	context->ib_cpu[len++] = 0xffffffff;
+	if (shared_context->vcn_ip_version_major < 5)
+		context->ib_cpu[len++] = 0xffffffff;
 	context->ib_cpu[len++] = 0x00000000;
 	*st_size = (len - st_offset) * 4;

@@ -940,7 +950,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0xffffffff;
-	} else {
+	} else if (shared_context->vcn_ip_version_major < 5) {
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
@@ -959,6 +969,23 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000001;
+	} else {
+		context->ib_cpu[len++] = 0x00000000;	/* input_picture_structure */
+		context->ib_cpu[len++] = 0x00000000;	/* input_pic_order_cnt */
+		context->ib_cpu[len++] = 0x00000001;	/* is_reference */
+		context->ib_cpu[len++] = 0x00000000;	/* is_long_term */
+		context->ib_cpu[len++] = 0x00000000;	/* interlaced_mode */
+		context->ib_cpu[len++] = 0xffffffff;
+		for (i = 1; i < 32; i++)
+			context->ib_cpu[len++] = 0x00000000;	/* ref_list0 */
+		context->ib_cpu[len++] = 0x00000000;	/* num_ref_idx_l0_active */
+		for (i = 0; i < 32; i++)
+			context->ib_cpu[len++] = 0x00000000;	/* ref_list1 */
+		context->ib_cpu[len++] = 0x00000000;	/* num_ref_idx_l1_active */
+		context->ib_cpu[len++] = 0x00000000;	/* lsm_reference_pictures[0].list */
+		context->ib_cpu[len++] = 0xffffffff;	/* lsm_reference_pictures[0].list_index */
+		context->ib_cpu[len++] = 0x00000000;	/* lsm_reference_pictures[1].list */
+		context->ib_cpu[len++] = 0xffffffff;	/* lsm_reference_pictures[1].list_index */
 	}
 	*st_size = (len - st_offset) * 4;

@@ -971,20 +998,66 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  other vcn*/
 	context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
 	context->ib_cpu[len++] = v_context->cpb_buf.addr;
-	context->ib_cpu[len++] = 0x00000000;	/* swizzle mode */
-	context->ib_cpu[len++] = 0x00000100;	/* luma pitch */
-	context->ib_cpu[len++] = 0x00000100;	/* chroma pitch */
-	context->ib_cpu[len++] = 0x00000002; /* no reconstructed picture */
-	context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
-	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32);	/* pic1 chroma offset */
-	if (shared_context->vcn_ip_version_major == 4)
-		amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
-	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;	/* pic2 luma offset */
-	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 5 / 2;	/* pic2 chroma offset */
-
-	amdgpu_cs_vcn_ib_zero_count(context, &len, 280);
+	if (shared_context->vcn_ip_version_major < 5) {
+		context->ib_cpu[len++] = 0x00000000;	/* swizzle mode */
+		context->ib_cpu[len++] = 0x00000100;	/* luma pitch */
+		context->ib_cpu[len++] = 0x00000100;	/* chroma pitch */
+		context->ib_cpu[len++] = 0x00000002;	/* no reconstructed picture */
+		context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
+		context->ib_cpu[len++] = luma_size;	/* pic1 chroma offset */
+		if (shared_context->vcn_ip_version_major == 4)
+			amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
+		context->ib_cpu[len++] = luma_size * 3 / 2;	/* pic2 luma offset */
+		context->ib_cpu[len++] = luma_size * 5 / 2;	/* pic2 chroma offset */
+
+		amdgpu_cs_vcn_ib_zero_count(context, &len, 280);
+	} else {	/* VCN5 */
+		context->ib_cpu[len++] = 0x00000002;	/* num_reconstructed_pictures */
+		for (i = 0; i < 2; i++) {
+			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
+			context->ib_cpu[len++] = v_context->cpb_buf.addr;
+			context->ib_cpu[len++] = 0x00000100;	/* rec luma pitch */
+			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
+			context->ib_cpu[len++] = v_context->cpb_buf.addr;
+			context->ib_cpu[len++] = 0x00000100;	/* rec chroma pitch */
+			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
+			context->ib_cpu[len++] = v_context->cpb_buf.addr;
+			context->ib_cpu[len++] = 0x00000000;	/* chroma v pitch */
+			context->ib_cpu[len++] = 0x00000001;	/* swizzle mode*/
+			context->ib_cpu[len++] = meta_buf.addr >> 32;
+			context->ib_cpu[len++] = meta_buf.addr;
+			context->ib_cpu[len++] = 0xffffffff;	/* h264 colloc buffer offset */
+			context->ib_cpu[len++] = 0x00000000;
+			context->ib_cpu[len++] = 0x00000000;	/* meta_data_offset */
+		}
+		amdgpu_cs_vcn_ib_zero_count(context, &len, 15 * (32 + 34) + 6);
+	}
 	*st_size = (len - st_offset) * 4;

+	if (shared_context->vcn_ip_version_major >= 5) {
+		/* encode context overrider */
+		st_offset = len;
+		st_size = &context->ib_cpu[len++];	/* size */
+		context->ib_cpu[len++] = 0x0000001d;	/* ENCODE_CONTEXT_BUFFER_OVERRIDE */
+		context->ib_cpu[len++] = 0;	/* luma offset */
+		context->ib_cpu[len++] = luma_size;	/* chroma offset */
+		context->ib_cpu[len++] = 0;	/* chroma v offset */
+		context->ib_cpu[len++] = luma_size * 3 / 2;	/* luma offset */
+		context->ib_cpu[len++] = luma_size * 5 / 2;	/* chroma offset */
+		context->ib_cpu[len++] = 0;	/* chroma v offset */
+		amdgpu_cs_vcn_ib_zero_count(context, &len, (34 + 32) * 3);
+		*st_size = (len - st_offset) * 4;
+
+		/* meta_data */
+		st_offset = len;
+		st_size = &context->ib_cpu[len++];	/* size */
+		context->ib_cpu[len++] = 0x0000001c;	/* META_DATA */
+		context->ib_cpu[len++] = meta_buf.addr >> 32;
+		context->ib_cpu[len++] = meta_buf.addr;
+		context->ib_cpu[len++] = 0x00000000;
+		*st_size = (len - st_offset) * 4;
+	}
+
 	/* bitstream buffer */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
@@ -1049,6 +1122,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;	/* RENCODE_COLOR_BIT_DEPTH_8_BIT */
 		*st_size = (len - st_offset) * 4;
 	}
+
 	/* op_speed */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];
@@ -1075,6 +1149,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	free_resource(&fb_buf);
 	free_resource(&bs_buf);
 	free_resource(&input_buf);
+	free_resource(&meta_buf);
 }

 static void
--
2.43.0

