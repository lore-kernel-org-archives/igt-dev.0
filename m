Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11BE606A322
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t0O2uZRZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B51110F375;
	Tue, 24 Nov 2026 08:41:19 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010011.outbound.protection.outlook.com
 [52.101.193.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05410F2EE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaCsJcWpAOpINayev6DQK9xWF2CZ6V8m43i4qYe5wpjPFKwtE2g2VDFeo7kUFteZJcqDusvx182JYCXyVarKsZm4cymN6M04PdLk6GsoD/CvRyulFXmw/EfpSHOlqqV7q8ZlfcoxlaN5fZ0tApOezdWzRRaC0eCX5gC8t3daeH0NF9O6FqSlN4pg786zjYfXXMiljjSojgqendXvDCKxraa2PXbrPmRMl06RFDiwS8NTVsHsS/laxrPyT2z8emhcrhbI0iseXtg7a2VyvSLXFbDCBLvvvvt2WdJR1cVPW3ekPHmX1nmfELOyC7njHYyKfZCqTbEb58Z7+BXep1hDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1cpdibGcrKvxmLn5WVGMFMb1RsUiBfTPWzPH1erixQ=;
 b=eAhKb0xWwW91Olo67vlLtgziZwovNKRlUJP0RxQbGvLlexrzd3LpgeNEpo2MFVNmgMSBTTyrnfsogZyqPcoxOR9Std9w9gIMI4nza/RnTKCfGfVIFmJ8ml5lytTMb8816NlWXH/N8kHu73Ck8z/tbJWLTBiSECroGZ4OWU2KvMihgBEw6DRYpcqwwraCUEOkQf7lsi0xp7KfgqYJsoFjN8WA98kiS7DJugliJGTQ6N2YFzO1pVYYiJv6E23LvNPK+B7b/1yakwsOQapr1KjwMfv+7EW2tSKr3ZT3GMrs4IDCvqfu7rocAOm7jxxkhfEnAMAlabegBPSy7tVrXIQqhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1cpdibGcrKvxmLn5WVGMFMb1RsUiBfTPWzPH1erixQ=;
 b=t0O2uZRZZPN7HjbnOsRbyC6mDoTb1hZU/VQY0X6FcNakCMb+ONqcegc6t/YdFNs01CtQTHWx3WKBxfsKKN0s8W7PCHLgi++Y/Qs7rk0VIDxOeA2cl1YhWyBXqd6V+7EQQTNVxoZx8Th+eIQHVNe/QSc7BcTwqrZx1/qm76Jm8kA=
Received: from BL1PR13CA0444.namprd13.prod.outlook.com (2603:10b6:208:2c3::29)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 08:28:49 +0000
Received: from BL4PEPF000003F0.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::4a) by BL1PR13CA0444.outlook.office365.com
 (2603:10b6:208:2c3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 08:28:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL4PEPF000003F0.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:46 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:44 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 10/12] tests/amdgpu: skip slth-gfx-umq-vgpr-proof
 without GFX user queues
Date: Tue, 24 Nov 2026 16:27:40 +0800
Message-ID: <20261124082819.2089694-10-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PEPF000003F0:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d877e7f-93e2-4f1a-6fab-08df4a04f68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: MMULbvTqlFA9P4Rxbm6dlIbNJTnBFF5cwesb4ELE/dvmlM0SmiemRmMHIjkQhqsouZzaccvJ2ZOUjHbNozAPLXVvmtEJPnX+2sV4/dpE7yQPyjnTdwdACqGwwY5UvStEZLQW+YDYc59ZvLEVa/eFLTsfBXGAUNcPdOer8hqAzXviImSuyvj9714LT34xn7LOJaZ2HjLn99f08kcdB3DYVJX/RxKQuDp4l9/q5CG0UtuxqALF+NL86rQE1X76Zj+pFmKYmpZYrX267Bgisu3ydxxHiYi0gJnukuvUQCv4XEMDvQu2O3HcdrGR54qurbUxCyXR6jDLfvRoEgBk8GYJnFosknu6HF+6+D/xu19ivm/Diza96Q04V6cPK5c5wNy+1BugvwsvB/JSvuAlI+v15Udhbte95JxMTsPvviCOzmA/P2JVrsbdu+VJEPGfpUyppIIYVcwkQZy6mUZtBdOHhP/ELy4952sZlTRxiO7RW3wv+83l58T16uIDDEEumX2mHC2YSvAs302Qz5GkyitQMG//l0lsTyq0zotEZa+B9IwoJIJOd0J6TkhFP1qPIzLviJ35FQ+/sQZc7FjAIEpyqLvd6l0NoTQkgRNIB8taczL23KSQ10/f59FXutpomQxqLdFrLx2MspFMnIvwXRkIXQegSmpeyikXnaxzjJowpRe9qcIF90+tapHIobe0cyuIhZnF9XD5QwIb0OdGZTDb5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fjbm/vyIhX+WZY7eODfU8DgpZMRimdc7ndCjVhdORkXmHxP5gHYguvUmy+etSnLSVRWrugqi0GX+OmHEEYe0aP8q8F/io54CblYv0o6PVTYsmD8J/z/VxFPF9Z9uBMpGJYSphMts1bxPoxPkZhx3SMXGlztZZf3Nt6QEcv0IuJGD+U6jAllMZgr8qG6I4k698qZ/904hdgj1iwnBaIBqeQVFBSUvhJKjopOnDaa3nq3T+P2WNh3VGHUao2kygArBkX2lyd2Fyhjm0xigAncYl6bLMwCAZVi54V+lQ3gee2io0DC8nlNacpvE6hCDjIZk4lYdqrjxmoh+MXDhB4Oljg0u+BxkiAw1SZ83QyHKSBggNMscLrkXI9obEvNPolu5sMxIE73/Ea5syt3SN4GFc1Lr5g0lwb7B1TKQN4yQRvLiTBnkvov3yrMNGFvCes7v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:48.6191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d877e7f-93e2-4f1a-6fab-08df4a04f68c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL4PEPF000003F0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654
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

The other SLTH user queue subtests require user queue support for their
IP, but slth-gfx-umq-vgpr-proof doesn't. It fails instead of skipping on
GPUs without GFX user queues, e.g. GFX10, which has no MES.

Require GFX user queues like slth-gfx-umq-returnproof does.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index cfae27790..a0677fc5e 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -1571,8 +1571,10 @@ int igt_main()
 	igt_subtest("slth-gfx-kq-vgpr-proof")
 		slth_gfx_kq_vgpr_proof_test(device, fd);
 
-	igt_subtest("slth-gfx-umq-vgpr-proof")
+	igt_subtest("slth-gfx-umq-vgpr-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
 		slth_gfx_umq_vgpr_proof_test(device, fd);
+	}
 
 	igt_subtest("slth-comp-kq-vgpr-proof")
 		slth_comp_kq_vgpr_proof_test(device, fd);
-- 
2.50.1

