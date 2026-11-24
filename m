Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B3606A68D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Oq3xpBU7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352810F2E1;
	Tue, 24 Nov 2026 08:32:12 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BAF10F2EE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOQR++VaGfNPgLUDdcxPHdDlqdowUyC2Y1hj1Tv5XcRF0uKsSpzwjpgXeiX+KvJvC8KMnt/xs7JIW4JL6kiajhgYVJ8krDZjSzEOQ3ExWnRo5iBuY4qXnDnRJAqHUmWuSaWLu+2EyD/ePv/EIbd876lH2bJ/omzUhOFi6JeyrzHtA4B4Si7DcHLEKENL2wwanW2nd+bW8rkxaW57B149pwUOkk66e3PMXk0ZfKs8saAvYArakn7AeobCuNQIu0aB8GzIuwuYLcqa/GhvYXuV9Pgfd0FX7cogDMAEX2cY/RnxR+5LG1TpBoOiY4DY/GrlnCRcXAtcc4epqP+ReYKKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shxiDxgaBgVCwjqZtAjkkuH2yRjeuj3Db5suuMsW9JU=;
 b=ndMXUeyxS+w9iQ0SvPkr0tGbfaQPvXvnT0FpsSO6wcFxduXSBdkdUEdL+Up/X8JEkqyGgD5fqrzSpWaNt6aYBg9EQDL3IEHSOJZ3oC/4y1kkg5ZrF6zrcN4sydyjDeFtkMZwTT7SGl/zlGEZwD9vOS/+m6KMYQrZbmcpLbtsTUh7POvJIczlx2z41ypx3e5fNOxDF3Oc8CtR3zR16JhBfDz0DKaHjygWnuENMkgsBkBPQ8FWFNvexH3G8FOK/3I0QBYSZuyX1YBrdXMNp9Af8l/S0gy7+ROgOq4q7TmEsPzqOKMqOwlDVmmQpT7lnu8udR0fAqbzLz9GAKK3MjLAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shxiDxgaBgVCwjqZtAjkkuH2yRjeuj3Db5suuMsW9JU=;
 b=Oq3xpBU7vh+jmzhwClCPprD8U6BH03R6ESTmOMpLRuP1d3gQy3VYvfap2lFZPUh31pATloWOLEqfBHAmFR/3U9CbqX9F4MDI1WJV4U1Jwaj+ljIsybHQA1Z9C1xOZuuNXKg8kKtONcKsLElI7yzxonJc+pVWhzpSKq9kJNbtPlY=
Received: from CY8PR22CA0005.namprd22.prod.outlook.com (2603:10b6:930:45::9)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:28:37 +0000
Received: from PH2PEPF00048917.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::a) by CY8PR22CA0005.outlook.office365.com
 (2603:10b6:930:45::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:28:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH2PEPF00048917.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:34 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:33 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:31 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 05/12] tests/amdgpu: add SLTH tests on compute user
 queues
Date: Tue, 24 Nov 2026 16:27:35 +0800
Message-ID: <20261124082819.2089694-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048917:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: b00b1de0-321e-412d-470b-08df4a04eed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|3023799007|261021121427099003|11063799006|56012099006|261026121527099003|261009223027099003|261022105027099003|261022075727099003|261102123227099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: quRvQNN4hfQzIQWD/KD0w8m6UudOTydcicMe5qB25KwiADEgpWGq0m2hyUwIMsg44S4PqALGEH/uJYhNawMek1Q7uza1UUi65eHwgvUYi0yLS9BHwkZ6SHjgyumaV8VU8a6zpNHZRZkhfyWlfg5HZ+VtI8SJRfUEYcLDwXaDn+3F0wUX9BuQuyoTTlWY76PjSNe5qiEwgiwPq1odK5wRHlpQuqdvpwt64ixPDnO6Gk/JZb8sptzn3ViT+T51kdYF0f9RG3EiC9CwQhS2LVbCUlAOTEz3aYEVBJzhZfykXW2l6oiaVvsSK4V1MeGfyG7RwWMND5NeIvpQAz4qUnVUfTBHkqPcabTAhIGZLwG14zX0bqzckDBQ3qEz+JapwYMTLP5pLtN1XaC0ZZICtlTw1LknSoSwR2Gax8QhNslxY090WBiPIxfXlJl7y6cWR1x0WBKMZN8og9Z5n3+s74RPk4Af+neOQME0+aY9uVk0wUHg7PX6MIo9L9//76fdns1CsdabXuiuLejq7aVDciHU0um5ArQxN3q3cetzOjt9qStWwPgJDBm07TphpWlin3ax3BJVOLDKWiRzLhvZjCBnkV2Mq90CLoeR9+mmrmRweVmntWyEamb1us/MW/mRro0G57Ca0pCz/aQtUYnALwEWjBYbS6Fa9QkS1BwIbgweknJdtBOkYRQN5Vqk1YA0ZUaIskOPVFlo5ZNb2sboFwhwiA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(261021121427099003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uqo1oXQ1fxCIg/thFSlYroNFXHYKlSVGu0brTrzOOnlaNHa+2znbpMj1MLl8xBG4QgIbA49vz0ZQ3xaecAubESia6HqwcfM9CrxQzqV6CvsyX94pExRzIWADxgjHr5cfKIdoE2jsqoldDHIqAOmsWm6+DIPDXtGM2rnyljIr0/bxfRTcAMxJ9Ra2lVIE1srAEaqkI7WxKmR1dyC56De/wVMZUi0oePGzSijdUQc5EHL71nRd3CtYvXwDo5pIId8xwZNz9KHiO42RIRjWtFQht2fnrWirjkzp7Tx73kisgq5SA9loUogm7X++bUv8czsRsR0+GcdnjLxSZVVjmKZwhjVA84mGWcvSz8dCJSI9+pp1zD+PNFa/erIccUBVoxCwkDjF10bdAieoSzHinjiEbGmmxLGrqNNNurzScXK93Xq6yxSS1leKahAOe2VHjNZE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:35.6310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b00b1de0-321e-412d-470b-08df4a04eed9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH2PEPF00048917.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701
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

The SLTH tests run the VGPR proof on GFX kernel and user queues and on
compute kernel queues, and the return proof only on compute kernel
queues. The handler is set per GPUVM, but user queues get the trap setup
from the MQD while kernel queues get it from the per-VMID registers, so
the compute user queue path needs its own coverage.

Add slth-comp-umq-vgpr-proof and slth-comp-umq-returnproof, and
slth-gfx-umq-returnproof for the missing GFX user queue return proof.
They are skipped without user queue support for the IP.

Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 1adbcb629..69b6c0633 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -1453,14 +1453,55 @@ slth_comp_kq_returnproof_test(amdgpu_device_handle device,
 	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
 }
 
+static void
+slth_gfx_umq_returnproof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_GFX,
+			     slth_prepare_returnproof_shader);
+
+	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
+	igt_assert_eq(value, 2);
+}
+
+static void
+slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+			     slth_prepare_vgpr_proof_shader);
+
+	/* The trap handler sets v2 to 42 before the shader stores it. */
+	igt_assert_eq(value, 42);
+}
+
+static void
+slth_comp_umq_returnproof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+			     slth_prepare_returnproof_shader);
+
+	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
+	igt_assert_eq(value, 2);
+}
+
 int igt_main()
 {
 	amdgpu_device_handle device;
 	struct amdgpu_gpu_info gpu_info = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	bool enable_test = false;
 	int fd = -1;
 	int r;
 
+#ifdef AMDGPU_USERQ_ENABLED
+	enable_test = true;
+#endif
+
 	igt_fixture() {
 		uint32_t major, minor;
 		int err;
@@ -1497,6 +1538,24 @@ int igt_main()
 	igt_subtest("slth-comp-kq-returnproof")
 		slth_comp_kq_returnproof_test(device, fd);
 
+	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-GFX-user-queue");
+	igt_subtest("slth-gfx-umq-returnproof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
+		slth_gfx_umq_returnproof_test(device, fd);
+	}
+
+	igt_describe("Check-SLTH-trap-handler-updates-VGPR-on-compute-user-queue");
+	igt_subtest("slth-comp-umq-vgpr-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
+		slth_comp_umq_vgpr_proof_test(device, fd);
+	}
+
+	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-compute-user-queue");
+	igt_subtest("slth-comp-umq-returnproof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
+		slth_comp_umq_returnproof_test(device, fd);
+	}
+
 	igt_fixture() {
 		amdgpu_llvm_asm_shutdown();
 		amdgpu_device_deinitialize(device);
-- 
2.50.1

