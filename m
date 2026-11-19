Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37A606A32F
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NqAuR9PH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856A10EB84;
	Thu, 19 Nov 2026 06:24:11 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77310EB84
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FswsXF1yNnzmUc/D0bfA0JPp2QFUybmdVNjlJh2lrt8TxGlh+jBC/VNa+C0aCClYS2h6d63pfs3rBF8o00EwxLfqaiyNFZPZEaG4GOPR1wED2g4Jx/RCMzXsYnkGSEFft+j+y2BI46btxH5q58UaZ3sThw9n2HHB+NHiMQFgnhzRWg9JiQeO1GNwQGXF5G7VrthSM4SVROJ/is9ZCRmI9+gl5ffR9Bk8QkXu6h8+UvcDAbGpAzKOGBx0F8UM1khUMCl0nkEGppA55iue+8d7nqKBuNOAxtYP1L4TlVgIyJhm+YK1BihjVwYKVwRbslPGxA7bvwrgddirOJ8x3aFa0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pA+Qlftw5+sYVF+tmLGorwwOaKruPSJymx78T6yt2g=;
 b=aJqbcJuw74YLEEe+IotjXcnOMGGgX0HsCALnClAehmDXrHpG1mepA+PuD/5c+bRsssqisRtPYAKQhvaDjKewHTdfydjE6DMm/W6xbpxQbtfZZzYRkwKbxwrE67ZFb6Pk46NpN4723k6xghWKcRgrGuipAnIedeVjuYVFvjEGcZ32Vi0bp+NCaeskXs31KM/A1bcFPP6BrTtNMSN6yBnaDEm5897051S9CeFNfMxurAFh1FwFqTOLVSret8fGysC3cUwgEogBodTBt8TxBy3Q3jYtb+TOyXoSqjYKvD8UoqdusjkmxYS9XjDgB7YOPv9/5K8he+f2yVEA/e9Lb4CNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pA+Qlftw5+sYVF+tmLGorwwOaKruPSJymx78T6yt2g=;
 b=NqAuR9PHDmJlvnVKTdMXW5xoNyo/rF96rj9k381Nak3XTu4DEmAgub03z7amIBksIDcRjLiXQzQl3JNgH6REU7RUn2FFh/xWxpAbs7KroDdG8t+n/hEjM9W9NzvZubbOVhtPn5sNRxP9NM2Efu/LRC7+ouGgRYDTEgP+cGlCoP8=
Received: from DS1P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::19) by
 EAYPR12MB999132.namprd12.prod.outlook.com (2603:10b6:303:2c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:19:13 +0000
Received: from CY4PEPF000392DD.namprd03.prod.outlook.com
 (2603:10b6:8:44e:cafe::a6) by DS1P223CA0015.outlook.office365.com
 (2603:10b6:8:44e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 06:19:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392DD.mail.protection.outlook.com (10.167.247.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 06:19:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:12 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:10 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 08/11] tests/amdgpu: keep the SLTH dispatches on SA0
 on GFX 11.0.x
Date: Thu, 19 Nov 2026 14:18:29 +0800
Message-ID: <20261119061847.3442210-8-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DD:EE_|EAYPR12MB999132:EE_
X-MS-Office365-Filtering-Correlation-Id: af61a8ea-4af6-4d11-39f3-08df4605080f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|261026121527099003|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: mjIv+Xu9ckHSm75m23rxOBW9y5IF98ed6uveZKSRg4Sy6N9FutC+c/BH4/iDpQkbqIoVRfSOIVBl/YSSnBvHhxPwnZhvChlVBswgjx/XYKeDfLdcWAxu3jVIkSwv3zTCj/UYGny+ddtGqSEJjhcUCHRAEthXgtLYH5aJ4Ieovcq0aRnuCBHQWZCGb+8pa8TLQ/7VA7nfKxP3PzUmySj3YZIVtp469hXMlG9HVBEM9XOxycUfDogXX6XVc7Xs4N4LtJQKzll0Mt/6neq4cf6DKy2bB954K0apNhQN3DpcK9Jgqm9eVXSueJlXforNcJ0SrAd4yX3XoSPMvuh1YbSnyQ8SXBNytZXhJqlgO5Adnb0mhVUdWWrbHqnatFGBXWlCHYWGa0pbErkvlvQdB//wANWioSWOHLtx+ikfRi7DAGAWGLFA/MBRGo44awFmwZIXepFlTJjFhYhIKemx9y40u7WaVCSma2wOO299+WP7E9MA5+6AfGPdyoIoqLyK0HsoRo7ao1oJ3uj+rpmVXIOzb+yJXGd2ZdY1F7dqN31PIuAktptez7vz+73mS6PQI3WMkuRuBQRbHw1JOCKOoo8IT0uHsJ2wft5SpnTFpE6IudOnDlDECGZ4tUsvqLMdZ5sjERQSIPpzH2nmbHR6doiiu/MC/+UDX07kxUxuQHAuyqzZO7OBsfOddfv6G9dRS6nR881v72xTl55ozUIOEFRb3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hHCx/UDAdz886cKRzkAaZWQtmi/Dom0roSOZFP78r8oI3WtPRcKLnu9ZRlMxbSGnNy145RtiA5EAvCnqv8zJX+L5ixdyZUa1b+/zv3cUQAAAciukLt2j3zOiFaiEOaA/CpDNLEllFZZ+3fSlUuJjRHpCffBIRjqaND8tBXsiQf9SklTScJODjbNGuSFreeEnALCIMGJK7WqfEBDhcMV9P173mRQ/RTs4rzSo14yOH3O4mAwP7Lf1fPvKpmKT2KgknheHC1+vLoUNiG+qsi1Hm/Gsq/tqQaVq3tKMBmlA30nfKvYirBOMWhSxhV2A9inezPZDyDo3RNWuwRt92gbV5g7W9lpcJ9CRXO7uHvBcJQZHToE2eogLsVsIV9tpxtZ/WG0mlh0PczttMoVkQV7EYM9wdbmrd0i3kmCc/GeJK+g3BlGWFFlS+QXomdMiB5YW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:13.2974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af61a8ea-4af6-4d11-39f3-08df4605080f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392DD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999132
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

