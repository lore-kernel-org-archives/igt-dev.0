Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED7606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TQUkiN2O
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E62810EA3C;
	Mon, 16 Nov 2026 08:20:36 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DB710EA3C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:19:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p39FTEa+YstuFRQFLV2DrfyNOlSkTMseoKlx0sX+jG8HkcJYF6lEAJCSbtiAZ8SLT3xdHA3B8xdmCrHwS42hgffkaes0mhhVlvHD/vA63vpl+2y3vgA18xePufX8dADUuez+aG5rV3BLcsGOyw7Q2V6l6puFw+TSUUFmfYjdMTTEnGETnj27v36L+Npc+gJP/vgQ/UImYnM+yDXp9PpKmJMl2U+M0aZAkA0G80t59RnCNZACXW29vpicsNwxal8C7K5pCzMhNK5RHRwCsLxdUaeSKpJ1b4u36Dqcv4qI/YPY4NznmKX/rSmtkONOY9sLo8GJyS+lekTunLL1iKVTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr8wddrC5o+cakvWCb972DjeImkkhyQYSUh2wzytyGA=;
 b=FOXDPbN0tN+4VgnG9L2sLe2Z9L1y4Um1NL1R8pvn2L/pcXWx4+M8GbuJaKi4wXXElEM27s7bvWM/Hl/j97vOPHfVBvNBtmKYxb8bLYqs6+WsNxcPhlnNMuE/aY0Jp64ziARwtRTsUFkZ9FtsH//kc4CaLb0DTircs7ygh50DO8ieG/zY68TFy7KvU87fCNB57pbORr4mwywSSSkX11AwNHepdTpobSJh+3G//pHFn2G/XOfIsqp8SiIBmc5+h0QqcbctvzPbikcYQlwBUcMOi4bEHVFOBj3XCQiGjxC+X6UXvoUhyBplLIa3N+lgHsWh7jxodIramq8J0w122ZAgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr8wddrC5o+cakvWCb972DjeImkkhyQYSUh2wzytyGA=;
 b=TQUkiN2OVWnm8oEsIqJD15bRwHKhYPmnz18SAbYrhKoqnz/teIUkXEgTFhWsCboY/+E5oAwZ00ZWwBvy2yfpduoNTgsGt6kMLwQBwVm5KGmKSJyC7dmYG+fHVORUIFq4H9kjzJ21VNhY64aVLQMybDAWGVcmcQ7I2Cor0MuN5GU=
Received: from PH8PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:2cf::24)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:19:31 +0000
Received: from PH1PEPF00062F26.namprd02.prod.outlook.com
 (2603:10b6:510:2cf:cafe::45) by PH8PR07CA0046.outlook.office365.com
 (2603:10b6:510:2cf::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 08:19:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH1PEPF00062F26.mail.protection.outlook.com (10.167.243.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 08:19:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:19:27 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:19:26 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 5/6] tests/amdgpu: add SLTH tests on compute user queues
Date: Mon, 16 Nov 2026 16:18:58 +0800
Message-ID: <20261116081916.2142984-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
References: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F26:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f0a9e1-0e38-4a14-fb4b-08df43ba56d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|261009223027099003|3023799007|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: NzFN5CFZevYBBFlzY3UWrEa4GgEX+/uOwPTG11WWrnRX9zErWUAbWOkSm7grkaqqd2jmlDSZXScUI3ue5H29sKoLQVamfg9L0AROY+gttwzBBn61AHNAIviEQyO8VVssf/v/NqzJ+eAVNQld2qVqRAkQLqhgYXc5iPIH7+YJZiONkaPk0i3IWGtnRh8D7iY7L9HEZO6J8LAx8dYGd2e4aO9zS1Y2aUsir+/lGwn2RBV6dbAHP7pcSVFxynMWqbSkm0P5/bz8MKT4DktMUoXL+jVCCACyUNVg3Rs55PBN6WiybFL5FB5eJQO9o85ahHgAyI6ECAmRdXW43o1XUKnGUGYhHuIAkL01lFRDb4ZgyBwWqrjmxTEkiEfUWtkpHyNNygw/18Dijzaimtr32m9PX7J5IQpNnxBbTI0IVxnDFDI/iboIB8RHEh7KOi2dsTXrYNlMdaGcy8ZK3wmqQD8aOkFVXmXe5Q0nzH7VWuOAx0g2/Y3lFo4J7ICAg2CqQ9p1J5cNuFoW7PmuDvw4bStRv9UzEtHBoP74d74zW08hYPyLm+yS6v702osWx2AfJ1sBL+8mALHiduPdtJCGeXeuMoo8LXCTPuRNr1PBsA9/UPqbOW9KStz7BQX3vTj1Ec5b+qEW1tmpnHROLaj288bh3S3ISkDrLdvE6313Q0GQ0ftaiLJnsjBiEcCzA1M/rB9uz10VIZVE4Av39rDdZ9DWQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tTWH3ed2bye/zzwwU9Wp0tn1shDGCZsx8OXocTBYYbC5UvXH74rZkh/rWqcFmh5g5Hx+gpQ+gNGs/+d5/xhNyhUuM+lIaeKs/oe/zvzcCcPGocZLgcKwkhikUytgXaW6Npeesr00R3r+lwPPmR8Z2+OEswCWqt6PNYRrgpm1i6YUOwMa41OzX5rG+i2BYF7d+ENlOcwANXawdzSgqZid0nvluCJ78ydW+CWC+qtKIRD3/WiQ83E+zRCQllBBP3ggYrWZ6fP2ww6JV+ps+dk6oGr/xqKPZkkj3iCgYF6zMu3VouMtF0crlKAf23iXu6/xjvXMJ12XH5fLQmrwX89fRr2erfm8cUUGuDUu9n6wulaUOwb0HEIa0ukrblUstfGtLE/FVEq7XGnahrnA0KN5tdMkuAZjCl1fNjUf57I0LgpLHkK1azDyxHKkmClb/kRk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:19:30.8349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f0a9e1-0e38-4a14-fb4b-08df43ba56d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH1PEPF00062F26.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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

