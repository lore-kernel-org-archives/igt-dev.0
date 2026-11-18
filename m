Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C292606A32F
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=i0HIch+t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1352510E342;
	Wed, 18 Nov 2026 06:18:36 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153FA10E342
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAO0YJZHXNK3zAgYrRKOzk/xm3DsXrxpP8/sN4Tc7reAXOZxsGQ0bU4e7cyWcjYXNrkpdA9mLtGr1tTC7HHBedBoooYa5nFt5CSUjnYsZwHnY9z3ViVEH2Jot7nvq6jf7Z2Tjd26TRN1YigoLkZMPe+bil2Fmf2opuPDhKgAtVSkNL5RNtBNkHGMy6cJ6M3OtP9yf2er6Kwh8dpG3yf4bhILgDMFzM3bFMxD6DN1W5E2a2cBkCw37bAHFtKJK8JX0Nz8d6odIE5Omsp+j0+ZaOaXhsRDgZpAiN8drGaIUpJzLVuF9C7p1zAdS02Mk3TmhaGPlZBCpRDnv7xgFVOEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pA+Qlftw5+sYVF+tmLGorwwOaKruPSJymx78T6yt2g=;
 b=E7VOPcGZCN0bh+Ad2YyHIo7ABtIsDV6ohxjpMh6C0FMPjLrvJv5taXf/ir2b65Ma+sWmqnp9XzUAY4wqyDSHa3xQcdzau5WunO9+WXwT1MA8Syy0WYeK0/r4i/lY9VylTdCaD76rBDl4+fx/6FTiFLwsybNCEAKiNHm9cuipDtL2tBOlbDd5FvO3saX/55G2yZvQ9pVAL01cCcAopeJ20cvdvX2BkblhRWbglRCRz/gNs5kItWIEE1mZA3F8SbupMLzM7G/msbNGHnFi4XitMJUepj/1VS9sVmIywyHe73tevFzz8Bd2I9UXKNCMzLiFxAC9ZiZmFiwY7X+fQ20PhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pA+Qlftw5+sYVF+tmLGorwwOaKruPSJymx78T6yt2g=;
 b=i0HIch+tDXYC9ExyVsxEIU4izw8oVq8pd2JXzTGfVzcA7oXTN9kLFUu2vdf8I5ep/H3xSclatPRvFhEruaFMUEe2QlLJZz9ZUeOzM1V8jjvRJcdgimvf9VOOlnXI1m7OOEnjYNcU+Br9ccQcg5JfG6cKqAFZL8BZIeipmuzQvIE=
Received: from BLAPR03CA0107.namprd03.prod.outlook.com (2603:10b6:208:32a::22)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:11:47 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:208:32a:cafe::80) by BLAPR03CA0107.outlook.office365.com
 (2603:10b6:208:32a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 06:11:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 06:11:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:17 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:15 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 8/8] tests/amdgpu: keep the SLTH dispatches on SA0 on
 GFX 11.0.x
Date: Wed, 18 Nov 2026 14:10:49 +0800
Message-ID: <20261118061059.3012530-8-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2f5ee2-cf6b-4d15-2c69-08df453ac2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261009223027099003|261102123227099003|261022075727099003|10067099003|56012099006|11063799006|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: IyCcsPqN4QTdpmFkF3G/Emuh79DgICipzYUzdfBoPJ4TqBH2XFAtUtUVSZBQLUgK5vQE7B3Llaj+LcupRQ/65oRxEYHSf4y4IU0Iv8AyV2hxKzey+ER2q7mcDmNFOf70MOis0ziXU+eNp8VSL3mxBg7OXumOQgCVouNKmEPcBOIE/O5ICqeGb0tRYY+KC0hAo1akCTj037jVVB4w4ZwWoG4IV8F0qBUyiD86KGP1l8lRMzju2QUmdDjqA7Lxa7VxMrqfCimId8/nRPZfdqQUO7lK0T6w+Jzef0DjJ1PXKQGOngkJ/9sz0XUZv/BLiH3RMhym9F5PkWuFG6E3fDryAL5FL1F9Unl07YOv+AUUoXAHvDDhBD7JatTklBSvpI9Seqho2Gwmb/0ePR03FFoR6m52l8xRnqH9q6oC2KrKSYR+O88CVy5gRWyoUJBcQt243DAF6KhMloQj+UwGM5HOMh//5AmTRpZ4jMY8VjXMzCD/oD5P/keoNdzdiZ79nqZbnizSEyzAdzt1YQ39I3CElGpUGC1Pnr7YpNmWlsAYM2V8hQY/4Cw5hWX6KuTWJbyY+p08fO1L6zNlPluFa1y4eOlN5QSQn6iVZblukkM9X/HcLzpLapNI+Lysy63PWLChGVNZp5NJmrjKVVGBl6K9CWSeLTROA81zNhz/qUr+DMYxcZngudmsFK0wmjW0I1RXvyv4GXksgf4pHgjq5zTaMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JzxQbPDodvG+Fr78SqKPKjj0kQr/9iN1SAj07P9L9FkQDCuNEFEgF7McA35GR2MxPSFe6r5RD88mloRxZmMnun+SrG5GfpVTVs4xbdKJfkoeRam5vABsmgBRb4/20ChyQml91dZLZgaQEDyxVs19axalBh5AOs+byg0HqMkuQtldhzNtgasPR90B/okpLztWVqAdLYNSO/lf4OczS7B8BEaQrTcKMuKrLLiEV4SX7fBPnYQrDfiThsntCrOOdpPWDtjKENd7T3pymH0lWmefEoBja71Nk/NAO1CxxtRy80zotRIfUyXU8474ytOr0UQNstWcesqUsIuf8WJRW52peVZhSw2yOhz87pyUoe3WRVCWQdPO2fVqkS5IESJwzci9U5OUyMx3I6inlq1nBrwvxcqu+dCijc3RrfRC8j9cPu9qoWd/GiWlSkoGGaWhs1rz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:18.6808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2f5ee2-cf6b-4d15-2c69-08df453ac2b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
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

On GFX 11.0.0-11.0.3 (Navi31/32/33) a HW bug only lets waves in the
first shader array (SA0) of each SE enter the trap handler, see the
kernel commit 69a8c3ae2dea ("drm/amdkfd: apply trap workaround for
gfx11"). A wave scheduled on SA1 skips the handler, so the VGPR proof
can't see the value the handler writes.

Program the CU mask with amdgpu_dispatch_write_cumask_mask() in every
SLTH dispatch, on GFX and compute, kernel and user queues: on those GPUs
only the SA0 CUs of every SE, detected from the GFX IP discovery version
like the kernel does in kfd_dbg_has_cwsr_workaround(), and all CUs
everywhere else.

While at it, take the dispatch version of the compute KQ tests from the
compute IP block instead of hardcoding GFX12, which programmed the wrong
registers on GFX11.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 56 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 69b6c0633..34736b34f 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -208,6 +208,41 @@ static void slth_prepare_vgpr_proof_shader(amdgpu_device_handle device,
 	}
 }
 
+/* Set by igt_main() when the dispatches have to stay on SA0 */
+static bool slth_sa0_wa;
+
+/*
+ * On GFX 11.0.0-11.0.3 (Navi31/32/33) a HW bug only lets waves in the first
+ * shader array (SA0) of each SE enter the trap handler, see the kernel commit
+ * 69a8c3ae2dea ("drm/amdkfd: apply trap workaround for gfx11") and
+ * kfd_dbg_has_cwsr_workaround().
+ */
+static bool slth_needs_sa0_wa(amdgpu_device_handle device)
+{
+	struct drm_amdgpu_info_hw_ip info = {0};
+	uint32_t ver;
+
+	if (amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info))
+		return false;
+
+	/* bits 23:16 major, 15:8 minor, 7:0 revision */
+	ver = info.ip_discovery_version;
+
+	return (ver >> 16) == 11 && ((ver >> 8) & 0xff) == 0 &&
+	       (ver & 0xff) <= 3;
+}
+
+/*
+ * Where the HW bug above applies, enable only the CUs of SA0 of every SE, so
+ * a wave in SA1 can't skip the trap handler and make the VGPR check
+ * unreliable. Enable all CUs everywhere else.
+ */
+static uint32_t slth_cu_mask(void)
+{
+	/* SA0_CU_EN: bits 15:0, SA1_CU_EN: bits 31:16 */
+	return slth_sa0_wa ? 0x0000ffff : 0xffffffff;
+}
+
 static uint32_t execute_slth_dispatch(
 		amdgpu_device_handle device,
 		uint32_t ip_type,
@@ -340,6 +375,8 @@ static uint32_t execute_slth_dispatch(
 	igt_info("PM4 dwords after gfx_program_compute = %u\n",
 		 base_cmd->cdw);
 
+	amdgpu_dispatch_write_cumask_mask(base_cmd, gfx_ip->major, slth_cu_mask());
+
 	gfx_ip->funcs->gfx_dispatch_direct(
 			gfx_ip->funcs,
 			base_cmd,
@@ -608,6 +645,7 @@ slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
 		ip->funcs->gfx_program_compute(ip->funcs, base_cmd,
 					       shader_mc_addr, output_mc_addr,
 					       0x002c0040, 0x00000010, 1, 1, 1);
+		amdgpu_dispatch_write_cumask_mask(base_cmd, ip->major, slth_cu_mask());
 		ip->funcs->gfx_dispatch_direct(ip->funcs, base_cmd, 1, 1, 1, 0);
 	} else {
 		/*
@@ -615,7 +653,7 @@ slth_umq_run(amdgpu_device_handle device, int fd, unsigned int ip_type,
 		 * packet, so program the dispatch like the compute KQ tests.
 		 */
 		amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, ip->major);
-		amdgpu_dispatch_write_cumask(base_cmd, ip->major);
+		amdgpu_dispatch_write_cumask_mask(base_cmd, ip->major, slth_cu_mask());
 		amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, ip->major, 0);
 
 		/* COMPUTE_USER_DATA_0..3: s[0:1] = s[2:3] = output address */
@@ -718,7 +756,7 @@ slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
 		get_cmd_base();
 
 	uint32_t expired = 0;
-	uint32_t version = 12;
+	uint32_t version = get_ip_block(device, AMD_IP_COMPUTE)->major;
 
 	uint8_t isa_bin[8192];
 	size_t isa_sz = 0;
@@ -842,9 +880,7 @@ slth_comp_kq_vgpr_proof_test(amdgpu_device_handle device,
 			base_cmd,
 			version);
 
-	amdgpu_dispatch_write_cumask(
-			base_cmd,
-			version);
+	amdgpu_dispatch_write_cumask_mask(base_cmd, version, slth_cu_mask());
 
 	igt_info("shader_mc_addr=0x%016llx\n",
 		 (unsigned long long)mc_address_shader);
@@ -1131,7 +1167,7 @@ slth_comp_kq_returnproof_test(amdgpu_device_handle device,
 		get_cmd_base();
 
 	uint32_t expired = 0;
-	uint32_t version = 12;
+	uint32_t version = get_ip_block(device, AMD_IP_COMPUTE)->major;
 
 	uint8_t isa_bin[8192];
 	size_t isa_sz = 0;
@@ -1253,9 +1289,7 @@ slth_comp_kq_returnproof_test(amdgpu_device_handle device,
 			base_cmd,
 			version);
 
-	amdgpu_dispatch_write_cumask(
-			base_cmd,
-			version);
+	amdgpu_dispatch_write_cumask_mask(base_cmd, version, slth_cu_mask());
 
 	igt_info("shader_mc_addr=0x%016llx\n",
 		 (unsigned long long)mc_address_shader);
@@ -1521,6 +1555,10 @@ int igt_main()
 		asic_userq_readiness(device, userq_arr_cap);
 		amd_platform_filter_init(&gpu_info);
 
+		slth_sa0_wa = slth_needs_sa0_wa(device);
+		igt_info("SA0 trap workaround: %s\n",
+			 slth_sa0_wa ? "enabled" : "not needed");
+
 		/* The shaders are assembled at runtime */
 		igt_require_f(amdgpu_llvm_asm_init() == 0,
 			      "LLVM assembler unavailable\n");
-- 
2.50.1

