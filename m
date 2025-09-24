Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66820CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 19:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1409910E7C2;
	Wed, 24 Sep 2025 19:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WoStYNdx";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7C10E7C2
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 19:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK3VV+YJs339Tk9QAnipIT98/z9aWX4ryVV8gftFP8TJg4tojQaz0P109O1ud1QhUNYXWSFVnFGVP+Avf46hJ8hut/rV6/yVw5Mf8wrMgKRsQLxqQRJ44HLUqJ1szQ+jjhQ9BFO0RECo7TDi0uNuO+NZAgABM2fUHN+Pa7vYUaY1TyHD6LaM/Zgknit9wg/P4pOSAHZwq/HdmMKv4PjmIDHsbgcVIp7Dyql/NwciUSh11Giss4Wr7Oe36eLUpBjDj47MkhWD7uGeBOpU7UE0cAVbsKsSlDHVoyjUNuTeaEI7Mz/da2znfB510P4uzRm7XI+3NlamHx2PMVf1h4NHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqEUMjSzuyrqJY7gLG1fDWMGmpo3LfLXUQss1uB0avg=;
 b=Ghkoi/4GCSlZJYVPdiATiNx9sR84DyIscq9vOEkaz/JBI+5971em/3j9lohI2eoyO/wrNDS/A1yC/0hhCxZWfZQouBqqPLzGxcWlrABgCk0OEfuMkzY7HhVFwdJ4QcrKDtlBjtitg9hax4ThbskzPTNtjuqoiXunfVDxB0myhHRtxhh4FIG34mH1iR9pDm2uqDECXUfd7Lno+XUCi6ODRgUZB4Hu3M3YYyXq8PPsbUUhLg9tSUoffYweQ3avy7LJHoJJ9DYqqJWDtvTC+T4264cbwWT5/TprFU+/SOJdJxRfPTJ0a7mGZhTLSgA+tioHAitzNy7cx/AQaoVEClC4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqEUMjSzuyrqJY7gLG1fDWMGmpo3LfLXUQss1uB0avg=;
 b=WoStYNdxL1neB05MC6efrzhgGCxttVXo2BHiw4nbjnEX3m2LqetecZEJoZUHBQqxsDp/jpvIviFd5r5l4VEIF0EEmMDkr6gJlaGflveQKU7/KEAAvwQfmHR7mJ/tAzJGCrzGcfyYdo52JPYqs4y8ciXrQ66Bm5fcm8y4Z1Ajf7s=
Received: from BN9PR03CA0177.namprd03.prod.outlook.com (2603:10b6:408:f4::32)
 by DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Wed, 24 Sep 2025 19:03:30 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::ed) by BN9PR03CA0177.outlook.office365.com
 (2603:10b6:408:f4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 19:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Wed, 24 Sep 2025 19:03:29 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Sep
 2025 12:03:28 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: fix vcn encode test on VCN5
Date: Wed, 24 Sep 2025 15:01:58 -0400
Message-ID: <20250924190211.359135-2-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924190211.359135-1-yinjie.yao@amd.com>
References: <20250924190211.359135-1-yinjie.yao@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DS7PR12MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b88f62-4295-43c3-1c5b-08ddfb9d0cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q011Ns1TtiP4tOnLZq817N2GlZZ3pBk0sp4103ncd9+Dz/vg4E9xhQwmI6ia?=
 =?us-ascii?Q?54QRxOF8A15JaVwnvCkbfl3tU0+TSvLF8YS6D9ykRC28G6cVHkSZtfMrXZXl?=
 =?us-ascii?Q?wT3cVrnHKBb+HDlUbmBdppQjexdqkdIWegzgS8NE3bHlr4eD5xy59vOlClQL?=
 =?us-ascii?Q?SILrsOs+c6kukAA5cwCQeNcFeo5EnJdvuRyU6ytUSJu71aSqFj3Q4k7rBldx?=
 =?us-ascii?Q?1AwkLTKtlIEzOOWsbmJXsDDUDi8yW89yPV81qrBSuevJHpuRuv1SYGOUa3QK?=
 =?us-ascii?Q?axZSPtbXyGdOz1gLMDaJFeH2OPRmlU14c8i2Y2VtonGBMPjM79JCuQLaSwsx?=
 =?us-ascii?Q?yvxW7wpNiucYcATiB+3vL0c0YGS0aZuJbMJ6rMUWsBH1wAQdQAFpy5Sz3nyt?=
 =?us-ascii?Q?Hh2kfUlcKzuY6RzESZqajJaBOEjbXfQuWJ2kPPbZldCWU+UEIWDJ9g9frKEs?=
 =?us-ascii?Q?M8ep17Tp3AOwgUjyPVktf2T+OjwbnoHsYmW07vIHnLdBgk05B27khWXZzc4h?=
 =?us-ascii?Q?LmfNfc2hIAG684tqh8CDcw3srhgGxIK6ZZNa5Eml5ovk5/37I1zHbzU1V1Sn?=
 =?us-ascii?Q?Z3xB4LdhG5k0+JoBdbJCBZVMqJBcDWb2HZlKJKC5VbiduY9n9rfZI1Zc6C6Y?=
 =?us-ascii?Q?KTe0HEclXtqUa20tWeJzJNI9lgrIo5J97v/etDpqaboohKLAkGKv9Mjmcr5E?=
 =?us-ascii?Q?tL4eWpzi4/fLeMqQdhURqCuZwBLrw7bOzs1QynutCC+cw4yuCzLiTX3axp3L?=
 =?us-ascii?Q?4z+gQCP/14C/NIVL78REfLz7KLN9z7Y9Gny0OmHeZujfg1ZOZlbDfK9DaHhD?=
 =?us-ascii?Q?FNiBfUb7K1AbbbCBCBsCxoL2HKc3zSMcBtxvQ42z9uax6GZRmVgE50JMPlDi?=
 =?us-ascii?Q?zRk+gI+Mpp1UHQO//G2hiu9Witf1H6O01+CfCEe6zmx0LtQEmNqUhm2TyN2u?=
 =?us-ascii?Q?gY+Jg+m+votOE6MFHKFzfIGrpNg6M9gkCLTc9Ujj3zt1gcKONIiqYaFydg86?=
 =?us-ascii?Q?GO7XUquCTgTHmNU1ln6RpAg/VKZ+M11rpecwkiZ954K9Z1EpGP//TfrXTKuQ?=
 =?us-ascii?Q?JPsqVwroVSs1Vos5soctQA7P9Jm/2JDWkul+mPCBPqYzNiZMXnKD4D1OXA5x?=
 =?us-ascii?Q?xBj/lqEWf2e2h3lgmMbH+wf9yB68bnfE0qHET/wPmSy8ulyqRrKmSsab5ISP?=
 =?us-ascii?Q?dQygPN6M2etZZetMOXjBdJAAO9W9Cp3KbY/JCm3OpeO9K3I6lgNQ4rTvTv2A?=
 =?us-ascii?Q?tGCWSde0ifP4n+8SxO16kwoExfxUyM8Pa49TOjCi/J5oCRhsISFW9lS7Psa/?=
 =?us-ascii?Q?Scx9VAJYjJwlpDEgTOLfTz2adDLTxqi5ns4AUPkWliuVfOL5H7Cf+f3w161U?=
 =?us-ascii?Q?QkUVHgB5DgPL9RrlrCe/v79ietmXBP6TQp3MANukWQBWZxtZAcK4Rz9uVnO7?=
 =?us-ascii?Q?Y6ENbGygIBp6NrQNK51l2pc2NME6ixFUVFzSxmF+8wuoGOpXCWOdCPGXcLYY?=
 =?us-ascii?Q?J6FTC+T56z3VL++Li4pfccs/Ihe9afvDK/xv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:03:29.8267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b88f62-4295-43c3-1c5b-08ddfb9d0cbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6048
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

