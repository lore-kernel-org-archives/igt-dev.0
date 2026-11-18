Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD7606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UHMmvmBT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B68110E52C;
	Wed, 18 Nov 2026 06:14:04 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096310E342
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adOPOB2N975NZbnRrWwGkUM7Mo+aNoBOhazdnpFRKsw2fkFpNsS2BRnL+qlwRJxQcwsOV5wDEZ7cmqv7A0+W3qPRjVhANc5Oh7QRJtWR7cYz4uAso6Clr3KsmvQHi1Q1H1k4VVAabl/rILOIirlKciMVEN8WJVdexD3r7StWTeuAKM35kGB5iraCR9UgBiKXFdsyV2LQ9zJzxaLNbUM2Gag8d4ZOoF/yJPRJ//RJy1qBdEIv4TPrrone7FHS/6WcAPdK0qqQIe2Xg/P+4vbmPW3OE9cC/J+/0H/XbKDZdR61NznhgQaV6T9gPC7R2p7yN1VnxiilN2iF69hev936mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr8wddrC5o+cakvWCb972DjeImkkhyQYSUh2wzytyGA=;
 b=WNuriWw/1rqzKk5YAYzTtxz40djw71QZjjlOmLAFUfc5r1AEIdrMuLO05nuHQFq040uX/uHJ9oYDfZNFGNOb8IBmXZjtcWjBhzu5I+1UVYnq9ccbhLLnhXNT5zeZeMBDjQKmLHEZazborLs573Cl+NihQgMeplZ9oBTn2sNs8wv7/TkGQBTsvta2A8SjhC1TJuNCaD0PSdXsJ4CIZttKMzY/SN5/pdcPJSw6nIns4ee1hQt5SxTQAuBXlilsLMF6YNozsGSrtBQTyTbAZeT1b/iB0xBRV7lMBo6DoFlutM+jEbshYgqYuKRE6KONtI5zD8mX9E8iIiKXzcO8zwNyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr8wddrC5o+cakvWCb972DjeImkkhyQYSUh2wzytyGA=;
 b=UHMmvmBTyXJOqDYCULLI4TaWS3+qMGRPeGYZbYhtQ8g48Zg+p3CPSdL4sQjILYykcMhDKpRz+G9oskdXctZ6ecLFpEgagJSR60/1nC1My5lneVvi/R4irZoUUDyZu8k3igBuxyiinEr9bE+isjRpp7h6CA+13EgfdXTHqDAIwlc=
Received: from MN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:52f::11)
 by LV0PR12MB659346.namprd12.prod.outlook.com (2603:10b6:408:608::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:11:11 +0000
Received: from IA0PEPF00000037.namprd03.prod.outlook.com
 (2603:10b6:208:52f:cafe::5) by MN0PR03CA0017.outlook.office365.com
 (2603:10b6:208:52f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 06:11:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000037.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 06:11:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:11 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:10 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:09 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 5/8] tests/amdgpu: add SLTH tests on compute user
 queues
Date: Wed, 18 Nov 2026 14:10:46 +0800
Message-ID: <20261118061059.3012530-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000037:EE_|LV0PR12MB659346:EE_
X-MS-Office365-Filtering-Correlation-Id: 515385e3-727a-4121-b192-08df453abe99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: z0F9ugHhYVOirEo8P+o9nZix/57p9FbKtOGlU6vcWev4HKbAUXhlsXdsjqptauD+Wvp0l94CHjUE7Lii3kkeEdp1f9hUxPLV6aEIgLo8Pka2Iy5KOUKw5BvOBrV1ZhuQIpSx/YxrprzPRXFXvKO14rGQHy+QaH5KR5UnWt11tmSUHw3iwURFFZbG/SHt8Nh9W8ILA9Z9TJXBODHMTUlseNLXX9AyyFrwam8NPXdLjpnlriN6H67SrBObbYcIr2uLhah7w1C41i9SWSUS9WZCcAq21ZfGRGV5dSGV2r3F1VZYeJ/BJZvJ6Bw3msio+1j4XxKM59PiBMH00drjZxmyAFnj28ycaCjRIR5+Jbp/Q16EcfoOEtD6pYQm7STPrQW5mhw2c924OaFe/LnmLvTll1z8m+yPkwrVbIcHkFrR9qEUW0yRIvjGIB8Qz8eGVa0dw4FoUg2wFlEj9SRkTIUO+FerSIG6LODPfk3kWcJYxBtxfmx8lBGFUg8ZDzQcejdSjGo48r8aRYHZ2JBKuGN2h7x/O5IhPzLf2T2FPXZmXnpH6mLjdFy0WLxKqJHvuiwzwEnpzF567xlWctnl3uuXrczBPHLTbpIP914raZ1elXU3yih7PQh2Q647w0LbkfWq2atYgSfm/PTiNMAYlCKbee8eqJRToE08D/SfrKhaywf5ZhknNHE+kLVMTY2gkhP3fP6VKnvM/i7RLZxwx4KbqA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5+qCEXJAg7fk8d0mt2Js+tamLCfNKr0bugZd5yZRBzq3p4QJ4/d6AVOelDZTcE8UVqeCymkIVVMj82kuBfVyn1EtwPUx/EFR/rpreuDogjhkufyTTEQulwC66pJtdG2W229X/sCN5myj1dNfsKRmcCUFvtQRTucsSD/XEuw5IL8srMBG1reukbDNnr6YG3PRnxUkvgtJtdZfrmBEHQmrssi9zVYkZVPlgNlqjW8kGHa+9lzFCwjMZQodEWfmu7e9saHlhjVd8H7HM/3TkYPiOPz/RUf2WR2xuiZ66WP/TGxE0q89zo+ZZro+AJHEVClm+i8yNoMZxR7XXl1AzE4ree3bd+bGSG65pUu43MkO/Luih1cI21zdjcq8//pTxvhBIyX5guuhH9MTTV/FQ29zVjaXprfX4bHviiz0EwcWn45q021SbNtxG1rQjvz0/5Z8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:11.7626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515385e3-727a-4121-b192-08df453abe99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB659346
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

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 2037c71ad..364ba774b 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -2276,6 +2276,42 @@ slth_comp_kq_returnproof_test(amdgpu_device_handle device,
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
@@ -2454,6 +2490,24 @@ int igt_main()
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
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.50.1

