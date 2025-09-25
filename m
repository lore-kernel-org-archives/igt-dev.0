Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93D8CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 21:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446810E9B2;
	Thu, 25 Sep 2025 21:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vkJ5Fefs";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2F110E9B2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 21:00:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0I+WvPE6xsmB3sVxHaq1U+3o6KM6/h/ZG0pwYWoY8nDJTW7l4F31zDEYDPoNKfA5p2R7julI9FRSxk3qeavz1qE1Y9gp4ghqLmcn0eDj11+Qm+OaIrTt/fI+d571ZNCJ/f/YxwNpJ+hwM4h6EqquaUv5roz9LySwTWSxv3TlbkMjeS4B20g4WUqm65SLHZTz/gr/fphgKwNr00jLn2sydKyZQGwxCfRVNcdpoxeP2xt/wgWnZbcn14tio0r8YnGMcC6+8aTB8lNHo/1bG/jXf/G/bczQB+PLMopxvEG83yPAG9mPgn1Xh0Li03oFFciboXxhHaqpkvoWIiiSjUa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuNgHvPtwc82/jwEiNZOGZtTOou2TbfTa+rILkxF3/w=;
 b=X0kqlXqE2/5KGRCO3onP9ZEvxHTZNEQUO/tCT/+SqKN41nQ1W3NtTcE8YHhIlQWZC7TV1SfUmlETDhDAvt8nB0WZ0XhuB6YGhIMGer2IKri0XCHDZlp2bUFR9ydANfkQdyZk3Hq36KZIfKMMPdzYyXXPW5Fl0PsHZSzIgTk1OUk2Xv4QIJeZejZr+CI3scsgY9hPGQb7rpuSkXvR/QzwHn/v/TgVZwb29KYfTUDKrG/QAyt6l97Kyb8xqwb/I4ZehHv61oWS80opjB8ARYShVDGIf4j/kU+62B7br5Rs9EXsgexzTYU6sz3joOjxMvTavlZuAZxlylcOzPKaa/qRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuNgHvPtwc82/jwEiNZOGZtTOou2TbfTa+rILkxF3/w=;
 b=vkJ5FefsS7penRG1N0ePcDycxWkyNqVjTsSD4PTFB4Ohvn0H2VwaQnabnQrqqOpW+2TU2yo9vCZpa+e/4GkaRiLLc0OJ9qx+bHbD65ZGl49pae03hkgW7s+Tw8RDnNf67xzQXnlAmZg1k/CdxdYliuQFfib8JijovBz7paR2Ybg=
Received: from CH2PR18CA0042.namprd18.prod.outlook.com (2603:10b6:610:55::22)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 21:00:47 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::c1) by CH2PR18CA0042.outlook.office365.com
 (2603:10b6:610:55::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 21:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 21:00:47 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 14:00:46 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 2/3] tests/amdgpu: fix vcn encode test on VCN5
Date: Thu, 25 Sep 2025 16:59:01 -0400
Message-ID: <20250925205946.324277-3-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925205946.324277-2-yinjie.yao@amd.com>
References: <20250925205946.324277-2-yinjie.yao@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: bce94047-e246-4753-24db-08ddfc7699d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?am8Oud7VTFC7bILLONcLVEezSggWWuXRv75v8gi2Hz4geIc49H8wGQ2TnsUz?=
 =?us-ascii?Q?6ly0bXl6iemLlpra8WUr82hxwdpw4mEZHjKCjxPPTvCwdKGthKxOz2jrczbp?=
 =?us-ascii?Q?R6gubOc4e2iDA4yRLhlRZxPl+/R8YHLHvsrDDYTQOJbEx6BBP65Psg6LDtJH?=
 =?us-ascii?Q?a+Ln+wXGiUMB0OzfUK1I5wLObHLkOIv0ieRMfnvYvTZYhE4goriDAzj3n6We?=
 =?us-ascii?Q?iLqAC7xrPS5v3MnA4GTTtiGRYwbS5qq5QlFp/Km2MUAh6QJKhsvinFjz5zrH?=
 =?us-ascii?Q?vHAs65abKbJl8LSJ/EExg8mv3QY0wxo/mEGf6Aau5gHRokHFwDR6mKrbFHmA?=
 =?us-ascii?Q?emIUyRJdocm03WVymE41E+PBgpy1wdBZl7aS6Sp53svj+cnS3yANzda+ovn+?=
 =?us-ascii?Q?ovXFa68PgyaPwqBvx9QscNlIuNPj3WbCtysAEOXBoF1qd7A0POVP+aOfUkDr?=
 =?us-ascii?Q?8URedhihXB+CBXhuPJ0HcsjQ7PcTE90V33gUX0cddaC7txRfkOyv7GD6t4Me?=
 =?us-ascii?Q?u6Sx0GebZ5BtqwclCBu/hqWsy6BZtBuNP/k5TDPNEdDSqOoeIXsK6l3AvCLT?=
 =?us-ascii?Q?3nX/sCKtcL341Miljvm0/xtzUnTkk4LRnTwyjW6kYXYAyg/6AbjCLmPPdZ4/?=
 =?us-ascii?Q?nwHZmhwi0uSYZ40nVZlTevozZoKgn6aftGB/TSIp4ePOTpNopc78WdYWaq9J?=
 =?us-ascii?Q?SPCS5XwETWf5ZEMoT8YjWxZx+WV40c9f7Ns6Lg9FhJ0YWypFPM8ciU7R0qlZ?=
 =?us-ascii?Q?d3oTeT8Q3gOhfeRBO7PCYQ/C5bekoP0vc+LGo/c4GvJqfKCmCqggX5NHDcpb?=
 =?us-ascii?Q?KtnsCEh+wRJGTigxCZODhinynR1DZXYlnUMQCmdq6F+8FUDl8pIQ6rerwQig?=
 =?us-ascii?Q?d9Di6yj1Js4F9aTZG0Gmru2+xWg05TsnwBUPsNL10xKKp+T0vb2j60Q6mYWS?=
 =?us-ascii?Q?1/U0w3ZEgZTKcU8OSZRAZorJ60d5rxi2jpmbIPMC7tEW/Dgj9sGKhZu0Q7ir?=
 =?us-ascii?Q?xbLw7UCB121J7QCJOmmJTddc1b2jBYgzLFhe6UV1YZl+W6MlEb9VNOZQjn7M?=
 =?us-ascii?Q?8ToHGdijRS0HwbUK/7BhciNTF68OzixsiW+xSxhHkbrsGi7Z/hS29PiYQcKk?=
 =?us-ascii?Q?Ht3g8o9QV7hH7rIaak+csgc5q01tDmokw1DAo92CMLLZWZh3Zgr/lmsr06zz?=
 =?us-ascii?Q?pPg0unawfxu/OQw1czh2xXkEyc85CnXhQHMTWFqmNOOUxs9Rer6OuSKpxcNn?=
 =?us-ascii?Q?ALECWbiPUGapUb1pcvhr9+0g/3aRrzZjbYPdRTpm6wMyrjLLF2/FEMBI0ogy?=
 =?us-ascii?Q?FuJMupKp69RFxOK7FVP44WbXdbBTLOGM45OmZ/cjIFxbGYLQD5n/DRk/qx0O?=
 =?us-ascii?Q?MRg7UOq5YUf1mrELMKwvI8d8gAn9S5nsog2pI3FtjwxowDNhxwWoxF5TBOpH?=
 =?us-ascii?Q?di8CX2ZNjoxa3oLnKkFqZFzLE7G16y9EXxoW5mxBOfFbao5QQJQ0MEtLctUO?=
 =?us-ascii?Q?Babx5yuz//2lzeB9QhyZgUYiNi/5yZWpRqQb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:00:47.2827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce94047-e246-4753-24db-08ddfc7699d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

Update IB interfaces for VCN5 encoding test, including encode
parameters and reference pictures list in encode context.
Add new metadata buffer and encode context override buffer.

Replace raw 64-bit address handling with standard helper instead.

This ensures vcn encode test matches hardware interface on VCN5.

v2: Update commit message and improve coding style

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_vcn.c | 143 ++++++++++++++++++++++++++++++++---------
 1 file changed, 111 insertions(+), 32 deletions(-)

diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
index 03c864c0e..f696d4164 100644
--- a/tests/amdgpu/amd_vcn.c
+++ b/tests/amdgpu/amd_vcn.c
@@ -265,8 +265,8 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
 	st_size = &context->ib_cpu[len++];	/* size */
 	context->ib_cpu[len++] = 0x00000001;	/* RENCODE_IB_PARAM_SESSION_INFO */
 	context->ib_cpu[len++] = ((fw_maj << 16) | (fw_min << 0));
-	context->ib_cpu[len++] = v_context->enc_buf.addr >> 32;
-	context->ib_cpu[len++] = v_context->enc_buf.addr;
+	context->ib_cpu[len++] = upper_32_bits(v_context->enc_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(v_context->enc_buf.addr);
 	context->ib_cpu[len++] = 1;	/* RENCODE_ENGINE_TYPE_ENCODE; */
 	*st_size = (len - st_offset) * 4;

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


@@ -815,6 +820,14 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	memset(fb_buf.ptr, 0, 4096);
 	r = amdgpu_bo_cpu_unmap(fb_buf.handle);

+	r = amdgpu_bo_cpu_map(meta_buf.handle, (void **)&meta_buf.ptr);
+	igt_assert_eq(r, 0);
+
+	memset(meta_buf.ptr, 0, 1024);
+
+	r = amdgpu_bo_cpu_unmap(meta_buf.handle);
+	igt_assert_eq(r, 0);
+
 	r = amdgpu_bo_cpu_map(input_buf.handle, (void **)&input_buf.ptr);
 	igt_assert_eq(r, 0);

@@ -834,8 +847,8 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	st_size = &context->ib_cpu[len++];	/* size */
 	context->ib_cpu[len++] = 0x00000001;	/* RENCODE_IB_PARAM_SESSION_INFO */
 	context->ib_cpu[len++] = ((fw_maj << 16) | (fw_min << 0));
-	context->ib_cpu[len++] = v_context->enc_buf.addr >> 32;
-	context->ib_cpu[len++] = v_context->enc_buf.addr;
+	context->ib_cpu[len++] = upper_32_bits(v_context->enc_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(v_context->enc_buf.addr);
 	context->ib_cpu[len++] = 1;	/* RENCODE_ENGINE_TYPE_ENCODE */;
 	*st_size = (len - st_offset) * 4;

@@ -920,14 +933,15 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x0000000f;	/* RENCODE_IB_PARAM_ENCODE_PARAMS other vcn*/
 	context->ib_cpu[len++] = frame_type;
 	context->ib_cpu[len++] = 0x0001f000;
-	context->ib_cpu[len++] = input_buf.addr >> 32;
-	context->ib_cpu[len++] = input_buf.addr;
-	context->ib_cpu[len++] = (input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32)) >> 32;
-	context->ib_cpu[len++] = input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32);
+	context->ib_cpu[len++] = upper_32_bits(input_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(input_buf.addr);
+	context->ib_cpu[len++] = upper_32_bits(input_buf.addr + luma_size);
+	context->ib_cpu[len++] = lower_32_bits(input_buf.addr + luma_size);
 	context->ib_cpu[len++] = 0x00000100;
 	context->ib_cpu[len++] = 0x00000080;
 	context->ib_cpu[len++] = 0x00000000;
-	context->ib_cpu[len++] = 0xffffffff;
+	if (shared_context->vcn_ip_version_major < 5)
+		context->ib_cpu[len++] = 0xffffffff;
 	context->ib_cpu[len++] = 0x00000000;
 	*st_size = (len - st_offset) * 4;

@@ -940,7 +954,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0xffffffff;
-	} else {
+	} else if (shared_context->vcn_ip_version_major < 5) {
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
 		context->ib_cpu[len++] = 0x00000000;
@@ -959,6 +973,23 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
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

@@ -969,22 +1000,68 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x0000000d;	/* ENCODE_CONTEXT_BUFFER  vcn 1 */
 	else
 		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  other vcn*/
-	context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
-	context->ib_cpu[len++] = v_context->cpb_buf.addr;
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
+	context->ib_cpu[len++] = upper_32_bits(v_context->cpb_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(v_context->cpb_buf.addr);
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
+			context->ib_cpu[len++] = upper_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = lower_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = 0x00000100;	/* rec luma pitch */
+			context->ib_cpu[len++] = upper_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = lower_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = 0x00000100;	/* rec chroma pitch */
+			context->ib_cpu[len++] = upper_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = lower_32_bits(v_context->cpb_buf.addr);
+			context->ib_cpu[len++] = 0x00000000;	/* chroma v pitch */
+			context->ib_cpu[len++] = 0x00000001;	/* swizzle mode*/
+			context->ib_cpu[len++] = upper_32_bits(meta_buf.addr);
+			context->ib_cpu[len++] = lower_32_bits(meta_buf.addr);
+			context->ib_cpu[len++] = 0xffffffff;	/* h264 colloc buffer offset */
+			context->ib_cpu[len++] = 0x00000000;
+			context->ib_cpu[len++] = 0x00000000;	/* meta_data_offset */
+		}
+		amdgpu_cs_vcn_ib_zero_count(context, &len, 15 * (32 + 34) + 6);
+	}
 	*st_size = (len - st_offset) * 4;

+	if (shared_context->vcn_ip_version_major >= 5) {
+		/* encode context override */
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
+		context->ib_cpu[len++] = upper_32_bits(meta_buf.addr);
+		context->ib_cpu[len++] = lower_32_bits(meta_buf.addr);
+		context->ib_cpu[len++] = 0x00000000;
+		*st_size = (len - st_offset) * 4;
+	}
+
 	/* bitstream buffer */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];	/* size */
@@ -993,8 +1070,8 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	else
 		context->ib_cpu[len++] = 0x00000012;	/* VIDEO_BITSTREAM_BUFFER other vcn */
 	context->ib_cpu[len++] = 0x00000000;	/* mode */
-	context->ib_cpu[len++] = bs_buf.addr >> 32;
-	context->ib_cpu[len++] = bs_buf.addr;
+	context->ib_cpu[len++] = upper_32_bits(bs_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(bs_buf.addr);
 	context->ib_cpu[len++] = 0x0001f000;
 	context->ib_cpu[len++] = 0x00000000;
 	*st_size = (len - st_offset) * 4;
@@ -1007,8 +1084,8 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	else
 		context->ib_cpu[len++] = 0x00000015;	/* FEEDBACK_BUFFER vcn 2,3 */
 	context->ib_cpu[len++] = 0x00000000;
-	context->ib_cpu[len++] = fb_buf.addr >> 32;
-	context->ib_cpu[len++] = fb_buf.addr;
+	context->ib_cpu[len++] = upper_32_bits(fb_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(fb_buf.addr);
 	context->ib_cpu[len++] = 0x00000010;
 	context->ib_cpu[len++] = 0x00000028;
 	*st_size = (len - st_offset) * 4;
@@ -1049,6 +1126,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 		context->ib_cpu[len++] = 0x00000000;	/* RENCODE_COLOR_BIT_DEPTH_8_BIT */
 		*st_size = (len - st_offset) * 4;
 	}
+
 	/* op_speed */
 	st_offset = len;
 	st_size = &context->ib_cpu[len++];
@@ -1075,6 +1153,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
 	free_resource(&fb_buf);
 	free_resource(&bs_buf);
 	free_resource(&input_buf);
+	free_resource(&meta_buf);
 }

 static void
@@ -1119,8 +1198,8 @@ amdgpu_cs_vcn_enc_destroy(amdgpu_device_handle device_handle,
 	st_size = &context->ib_cpu[len++];	/* size */
 	context->ib_cpu[len++] = 0x00000001;	/* RENCODE_IB_PARAM_SESSION_INFO */
 	context->ib_cpu[len++] = ((fw_maj << 16) | (fw_min << 0));
-	context->ib_cpu[len++] = v_context->enc_buf.addr >> 32;
-	context->ib_cpu[len++] = v_context->enc_buf.addr;
+	context->ib_cpu[len++] = upper_32_bits(v_context->enc_buf.addr);
+	context->ib_cpu[len++] = lower_32_bits(v_context->enc_buf.addr);
 	context->ib_cpu[len++] = 1;	/* RENCODE_ENGINE_TYPE_ENCODE; */
 	*st_size = (len - st_offset) * 4;

--
2.43.0

