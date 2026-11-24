Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDDC606A688
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CJdy0uld
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF83510F33B;
	Tue, 24 Nov 2026 08:35:28 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252EB10F2FE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoafgeGAfsQ3BmOfl3GWXMN/VmfwU3QZKf2/716OMsxXIb9/3m47mCp+o0OHhO8JIkqkHxFbX8cx1zxNFOMGO3cOwyxzAUH0bCecTUg0CEBjJ0d5LCLruXJxDQbX5LykzRo6j6GtVJQSa/Hho9f+48J2iscfJPPcKQBfLNr50dgEie2/Dkt7/MZgBNyweloU45w825WSatmSt34F70Wu4QqMIOKsr7V5FSEUkYJ6GWt/vspW4Sf/3gpXTJVDvEhj6JCUMaix30WpZVQe7q8mQWIs/k9HbDLsirCAMscqle3CvjngiGKnIFfafzmMfxduEq2MT8cb/mrWGF4TEkJr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIElWHa0NoDhr4/hMEeL9N2Zqtbf2AOTSJt9sAdQVzg=;
 b=IR8sVjOfTazGL2P3l1Y+QZWXU6aaxz1uTmz02R9AioqcCdGiJZAmSa7BxJm2a76y3JN/GTP0Iaz+sU/qYxveVJJ0UXvV6km4Mvy1huElIqyL0q+ydHddswUcVOeY6lbOUmxieQNMSxFNiyCMQa1GKbqLfM9CJCQJBEsDC+9vWkRzOe5OhILpn0lUFcOjqmkBn4icgPKu7t5pfc3iem4ojJ/KZ0Qbq2ebqb6hnoOJN4UTgfeghIOd8KRUm+6HowdXRFQJuL6RrjMQR1UuQ9HZQ070rjfAvfNQZuOy1L0YnFsWweur0kX4q2N2fLS7iGIKX61MPlZ3x7oumN8fP1VbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIElWHa0NoDhr4/hMEeL9N2Zqtbf2AOTSJt9sAdQVzg=;
 b=CJdy0uldDsAp88lxOcb9F12tELLy8/nbuoET60AAfb/1+9ZEbwezLZqhomlUnmoA0WpzxXz7Lhj6Xg7mYDL6O1qYwobV/CikrrY7R3HtKaPuf46GLrlp0DFuupT7TzwLqGVqFKWjqYHcAYV6y2GrPsc890PoHRVU4k5XyTiYfBM=
Received: from DS1PR06CA0002.namprd06.prod.outlook.com (2603:10b6:8:458::8) by
 CH1PPF711010B62.namprd12.prod.outlook.com (2603:10b6:61f:fc00::614)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:28:53 +0000
Received: from DS1PEPF00053452.namprd04.prod.outlook.com
 (2603:10b6:8:458:cafe::80) by DS1PR06CA0002.outlook.office365.com
 (2603:10b6:8:458::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 24 Nov 2026 08:28:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00053452.mail.protection.outlook.com (10.167.23.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:51 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:49 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 12/12] tests/amdgpu: skip the SLTH GFX kernel queue
 tests without a GFX ring
Date: Tue, 24 Nov 2026 16:27:42 +0800
Message-ID: <20261124082819.2089694-12-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053452:EE_|CH1PPF711010B62:EE_
X-MS-Office365-Filtering-Correlation-Id: 4600e3ea-68e1-4c28-8923-08df4a04f8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|22082099003|18002099003|6133799003|261009223027099003|261022105027099003|11063799006|10067099003|56012099006|261102123227099003|261026140227099003|261021123027099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: HpUBgkBD+hcUrnm1jP6D0A09VNLiJr2XChcqxQyUKPs28JVOwSWeHkIkSLhUQ4W1JqlBAOzHj0cFxR4Mu03/OnOAzT/N7xyczVTSN3kY3q2a9ZiA2KVCu+N8dTJXR25H9tGIOM7AaEjD6acOuGUK+VLWUab3BxmnbI6YRUUl7eWkJ7MMyFyl2Q2mN5nOGjqoTM5K745e/JRQEgsEnuCyhhtlApuhDp2bzf7rdY1WKI3CENO3kNIx2m/lQD9mSDVKG/GjZ1LwJzDlGZ1wr0wSMXzEj9/7sLuAkOveoOUWRwolRKYPOteFm+h/hd1vT9cZNT/yEYu7ygStiHya6Wjhp8AqvRCAUod2YwPweINPZzvKwB81hHUnbh/z7BDdPjkf+S8ZCUZ91QS0+cmSqyckQcl+YeG4JehJTEu5jexRXw0xMKpkcD7p5Ez+Zti0nzITRUb0H3Q0OnJIK4KIqAj6mfHUG0FAStkBx7VpKDVHDj7RIluI1Zh1yBO5TBhvQkkksm4O1MuytBO4gp43ytOzvljzHBSDEGgNKL5NQMdbA9jynPWAGuP31tqFAUOxk1Ld21/+0bDzBxsKGWAX7wXg2dz78qS9zxdrn0FbEuoDHvRQz57xowMfmgRqmk9unVDfSgFoP038B6Q3mXxQPFMJSJNnqjU21k7DR3YvyBc87z4O1XccskY5KUy792kHvo0qObB77EMW/VSrgbjED7cFgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(6133799003)(261009223027099003)(261022105027099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e9O3Br97IJB46NEvscsGgo4O/74eC7dPX1qaWVpvzPOvdRl3pA58WedJ+Gv5SeJmBEB2DHApyrA5kfuRkcZHOFzHpWzp5XXKyQiyb/ksGLpRKW9dLWhDo8xKqyQvkiJ9v27RlcKp1M2p8r4wel2l4EbS2kypF3DArItogZrqBQDw1dL2KfbDLegs9JdpLVYcighymPP5OGuT1B8TWfUiaHcSuHqCj5800KsYNe/6mwtt0dqnFDAC9A19uVGUv/XAQNj84L8hLFg5IYv+SmWDh+SgePWwn2WKaLKxFJyFu5dp6yxGIijhcNCUeeNaX2ebbbBphEhb2Mo83IdsJ5RcDNvV17yBokopNZ361xK4mHXppgxRG+ZxlMRx5zeG4/UyA1/DIzxjyk0IZG/YKBrTaKslQz8DT7DZHVBgehC4TNQ356/5ZlEDdXVx1647xojO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:52.6428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4600e3ea-68e1-4c28-8923-08df4a04f8f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00053452.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF711010B62
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

Compute only GPUs like MI100 have no GFX ring, so the submission of
slth-gfx-kq-vgpr-proof fails there. Skip it when the GFX IP reports no
available ring.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_slth.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_slth.c b/tests/amdgpu/amd_slth.c
index 4e4d72855..68cd02cbe 100644
--- a/tests/amdgpu/amd_slth.c
+++ b/tests/amdgpu/amd_slth.c
@@ -263,6 +263,15 @@ static void slth_gfx_dispatch(struct amdgpu_cmd_base *base_cmd)
 	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
 }
 
+/* Compute only parts like MI100 have no GFX kernel queue */
+static bool slth_has_gfx_kq(amdgpu_device_handle device)
+{
+	struct drm_amdgpu_info_hw_ip info = {0};
+
+	return !amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info) &&
+	       info.available_rings;
+}
+
 static uint32_t execute_slth_dispatch(
 		amdgpu_device_handle device,
 		uint32_t ip_type,
@@ -1542,6 +1551,7 @@ int igt_main()
 	struct amdgpu_gpu_info gpu_info = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
+	bool has_gfx_kq = false;
 	int fd = -1;
 	int r;
 
@@ -1566,6 +1576,7 @@ int igt_main()
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 		asic_userq_readiness(device, userq_arr_cap);
+		has_gfx_kq = slth_has_gfx_kq(device);
 		amd_platform_filter_init(&gpu_info);
 
 		slth_sa0_wa = slth_needs_sa0_wa(device);
@@ -1577,8 +1588,10 @@ int igt_main()
 			      "LLVM assembler unavailable\n");
 	}
 
-	igt_subtest("slth-gfx-kq-vgpr-proof")
+	igt_subtest("slth-gfx-kq-vgpr-proof") {
+		igt_require(has_gfx_kq);
 		slth_gfx_kq_vgpr_proof_test(device, fd);
+	}
 
 	igt_subtest("slth-gfx-umq-vgpr-proof") {
 		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
-- 
2.50.1

