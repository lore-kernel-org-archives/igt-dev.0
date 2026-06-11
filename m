Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A108CD98D2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 09:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF98210EDA1;
	Thu, 11 Jun 2026 09:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iZ4f3Pw3";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010019.outbound.protection.outlook.com
 [40.93.198.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC95210ED99
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 09:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnsNomtBGZtscwBCLw+qr0F0R/ors5Y137RxfKl+EE/Ccqc1JD2texxbqobv9hGtATD5uJoRDcQBbwiigpLvAc05kitoE6tULVpxZI3At0+ZTXhYR/1wmswMonFQGK9FD+4J/B3kGZ68eW/A9j4qwfSPfs2hyrSbCSerDwKAT+Nynrsn6fFeeTxgaDJA1mySeYefcoUL5ZND2IaItdKH62K3jlWOiNAhLpU/TXnoBTqMauH5Eh844IuzalHNBqJp5y1qo1fTgH62IbOF7BGQNKadhdxtPIk+4jfgV4bGhkSXX+HOWOX6Jx53uhQzsUOlDYuTfN7qI9lcLMSK1hAwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVNBgcinpAKQTjHefM6RWDjl7lylJ14AedtDrkXir38=;
 b=r4TLM0mIbpQAs6zeZwcSZT+8fBHdOY3PHvMhaLf0SbPtyefe9I50iQJEufsf1jCwV4eAJ2BishDzOzvQ8NM2iou3fYIMjz61ZSrDKpkRr7rOkyiP0F+WKe5OkbJtYz+TJWN5yx8V/9NRwE5MlM0tIXJumyUTzX04vyr3No+nLXJW7DjRe1oUUFGluVzh/Xj4ahn9OgGHXSHdZKW0emBu554dlasm1d2DzjRWiUWIbTHhPGumEQmnDmmA4UAdXd//tQCwY4sPe8RlHzhtJljyjjCMWPJ7Ing+4oEsFmtvV0uz1NeveiBDwVQPNyv9oz3LK5hpfFOqtZ7+E4//rzneEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVNBgcinpAKQTjHefM6RWDjl7lylJ14AedtDrkXir38=;
 b=iZ4f3Pw3BxwcfIibqnU1krm/YPt9ScthsjWRJ3hzZawEnskvyWSKiKJVrOkbjdbOiyS+9/JN2eBe7nhALk8SF+ZCJ+W2V0yw7QHO2PqkuZzXRUf6wY6MYnXOCqK2WLI7b4lcsDKi3Tc90wnOLqHo2Wp8Hd4GVQ5SJAo4AbX5Sa8=
Received: from PH8PR05CA0001.namprd05.prod.outlook.com (2603:10b6:510:2cc::22)
 by CHXPR12MB999221.namprd12.prod.outlook.com (2603:10b6:610:2fa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 09:07:56 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6d) by PH8PR05CA0001.outlook.office365.com
 (2603:10b6:510:2cc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Thu,
 11 Jun 2026 09:07:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Thu, 11 Jun 2026 09:07:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 04:07:54 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 04:07:48 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: check hang slow guilt via QUERY_STATE2
Date: Thu, 11 Jun 2026 17:07:17 +0800
Message-ID: <20260611090747.947651-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|CHXPR12MB999221:EE_
X-MS-Office365-Filtering-Correlation-Id: b3248a3f-348b-4f1a-b5c4-08dec798ece9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: UCSrTh2uMLnXAz1K/yorA1xhwpBK5n6qmc6SoV9NZyVaVAUlZsP/M0mNCfg10UI71aHllNKFl0Uc6YdDs8XkC53qunofov/alkFxk4gx77Iazepgm08k2npwWttTm8v4DgfHFP5tfRlJdpAXlAG0j8EpdhR2JS4oZevtk4/cYVqIj6zM1cnXP/6N2f/nD9XgMa2YBg7S3tbi+4jNoVlaHsboLmA57/86/ytGnVyMm2aoc188CzMZkSs7Fm+ziioP2q7grqL+iD6ictbwR5p8OnBmxwOEXlb2IW3ZFFW0sv5HwHu68zQ6CFPXK4OKmD5LQfMukxz+YARMzvjAwjIEiwG6aX2zpKJM2Gc5Yb5xFBMiR9zX+Ybb8sNWtMZConKpIjiU87ixOHY7gPSJdhTOVkeaH9lsDTi0LPMdqwoBpGY6dsuDhsKrtqfGqCSm4K+ozMBGDOBgEt1Oe4I4CpxtoDZlYZKjSXyjO/EaOjO83AhpQfHZnbGucwO61p1f0Nd80aPsYwZHPi8DaOtbVZ9GK5ebDDSfSTxxKTelprDyTp4iqQaIt+avlwd+WFFlsw4xotobZB/TVidfIg9GzQ7AoXV/CXmfbVm5+uhOrIlM4IjKY5KrL2Oyq5gk+M2iu7vaU/sDtSZn9QxDiSco8cQ0Bwjv3FecpN5LkptDAYewt+/S1DF1d8Ns+zHYavv0wK83w5XjqmJgbx7GWW9k2qDQCj80KBmtxFYk60yYLuqDAZ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FR7o8faqTDNSVnrKqFhkC3rqTiU5z6VqWkPNbDnEkanyHd/WzS5kHdNrHsJIEyxg0ox5U0Nfx+ijdJQzMsawm0Mz3xwqS+ekohlsqZ83d7U0CiT2r5BoEc0aFb+3FiIkBYPdNFuXIDUhjJJ0czkGE7B07BHYkuR91eOqj4oojcVS2Qgjk3HFL2F8N2a40qctVJryeUFuzzfDp/R814N38oZOhH6iUFi5hMN7ZBJumJ8gc8wIp4OD6CTWQ6LW9YdA1tLbXm5MYW7frCn5FNW/iqMhLoFvLIB0ELr0zzMGjLTKWlQq/E98hCefKtDKv5iUqnBL0ZdKkyA2RExjzi3ctD4Yhjulugqn2o41aWaQQ2Xu6gu15YbCbVso3bIm8J3ZaWtf2p7pV4NElqyF0R40rSCxQCXxUqIqeqJ/MCAsd8+11aWyBBiIgRmvxJbl1qdk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:07:55.5773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3248a3f-348b-4f1a-b5c4-08dec798ece9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999221
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

amdgpu_memcpy_dispatch_hang_slow_test() submits a hanging dispatch from
its own context and then verified the reset via the legacy QUERY_STATE
ioctl (hang_state). That interface is deprecated and cannot attribute a
reset to a specific context -- it only ever reports UNKNOWN_RESET.

Check guilt via QUERY_STATE2 instead: once the reset has completed (not
still in progress), the context that owned the hanging dispatch must be
flagged AMDGPU_CTX_QUERY2_FLAGS_GUILTY.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 138222cde..76a6c1f55 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -489,8 +489,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 static void
 amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 				      uint32_t ip_type, uint32_t priority,
-				      int version, uint32_t gpu_reset_status_equel,
-				      bool user_queue)
+				      int version, bool user_queue)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -677,13 +676,16 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
 		igt_assert_eq(r2, 0);
 
+		/*
+		 * The legacy QUERY_STATE ioctl cannot attribute a reset to a
+		 * specific context, so check guilt via QUERY_STATE2 instead.
+		 * Once a reset has completed (not still in progress), the
+		 * context that owned the hanging dispatch must be flagged
+		 * AMDGPU_CTX_QUERY2_FLAGS_GUILTY.
+		 */
 		if (!(reset_flags == 0 ||
 			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
-			/* If we're in reset and reset hasn't occurred, then check
-			 * that the hang state is equal to the GPU reset status and
-			 * assert otherwise.
-			 */
-			igt_assert_eq(hang_state, gpu_reset_status_equel);
+			igt_assert(reset_flags & AMDGPU_CTX_QUERY2_FLAGS_GUILTY);
 		}
 
 		r = amdgpu_bo_list_destroy(bo_list);
@@ -770,7 +772,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 					    ring_id, prio, version,
 						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
+						      prio, version, userq);
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
 					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
-- 
2.49.0

