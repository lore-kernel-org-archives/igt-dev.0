Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5E606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KJg4Rmvf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C700B10E4A6;
	Tue, 17 Nov 2026 00:28:24 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858CD10E2FE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 00:27:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh4Jl24ahNc7ZRe0YaOaslijhLCbIF9dt4TwV6KZzV8183Q7HTDKbC5fLNPrEnssH8CVhHIsHsbvvPt6+kL+G7h8w73pwOYYoXSzqnlSBDHLWMM3TH0PM52HpJAcPLHJXwrSlGLOo8gqdMm+as4xB71T7oojVxVo35r7EkigWVQvZ7X+G4Z2ztx+NLeNRW4s85NtD88s6aqB6pkkdurUY4DXnnuOOAQA/u5C3xu0RTJADKrSYpQE+HIHveA5T2q64eQXEngjxuHG5XdBe0Nsbh2A4MspIX4TLWrItuq94eJWudA9kks+5qy1sZGA1LujL75iZX3WCLPInyTG0Z8+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGKjlTQRMvrAaX3JWFnjV8fcuKb1js4G+zi5XAG5Wgg=;
 b=pyUe7kbgQJT7A9+tVGHhWFY3hF2suprTiQL412a/VOP7X84fURYGm40x3oJl52z1At3bqEGakZBqXMZI2L4G08wbdC3PQME/vtefz6Pc4NI+opCgAVhLF3OpwLbwrsRxIyRd3bcQTD5YhXjlFxX+Dk3qm7Qpic74p3Q+0olJD1fSlZPqVLcJXESNp8n2rZsFDmlPup11rkKLqHD4jdHF8Tpa5MSbwJeRSEVXpT/aB4kUGrxK0Toh+QU/Dx3ZqpXK3x2V5QYkVBA20BFKcg8gSv6+FJTXay3RROprtR8fyRjM8lTPiPDQX+wDbnRTxvpShYW7ChaT4uZ5+n7Jy7YdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGKjlTQRMvrAaX3JWFnjV8fcuKb1js4G+zi5XAG5Wgg=;
 b=KJg4RmvffVuMAOeraAQBERH0nlM2QXhIBHfXWRBMDfkSu/3ef/TQfKF77FDV5BnusOByj0splL+xy6xD+DI1yRzFPJMHlIkK4jpRsqDlNtfpurzjlOtP6iA1Gc9XdaehBIlfluHlBBTA7JCAO8/l3ju32c/Xc/xIno+eY7HPPA4=
Received: from CH2PR12CA0029.namprd12.prod.outlook.com (2603:10b6:610:57::39)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 00:27:17 +0000
Received: from DSM2EPF0000000B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::4) by CH2PR12CA0029.outlook.office365.com
 (2603:10b6:610:57::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 00:27:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DSM2EPF0000000B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 00:27:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 18:27:16 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 18:27:15 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu/queue_reset: skip for all LOCKDEP enabled builds
Date: Mon, 16 Nov 2026 19:26:46 -0500
Message-ID: <20261117002709.51673-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSM2EPF0000000B:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: d3eb41fa-5f0d-4559-d590-08df444188df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|11063799006|56012099006|10067099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: tM7zJDU8Uc1hVibnFYafIvCloquCjF/ISfkNf1j8Fu4lgKU2wNEAnBWMYiQZot+kGUVEM3XROm+Atdd/MQuOYt4cf7gUsUdAchiWT7cDSeEvOQt/z8xLy6CfalfIoD8QFmIFNkYQ5Qm6Gu3y9/w42VsghWGWq+Yb3lqmmzrWDYaroY/JcV4U3BK036jtNVda+PvMW/41NZBtVKQgYPzKGilJ0E/BT0puw2WIAVBRtpmG3dT8ieyiNSCnXEeNFkJcSGhQ2tP80lj3hwvtPRT4jvnJmDmVZ9uzoGfOxuBIchcwJS3Y1L+ogcjC/gkRScU9qt8gAMHdc6kf+5f9fQ2aN+PYek18yRMRjbRs+ImpgS/iHZxO9JvppFg7Ajs1Dh6Rk4t+W9XwLjpMCYkj2Uk7mVRiv5+0ywq4BlJZfdMvrDOF5t2+f9NdApHCPYdmFDS98V2QQbUjMbhOJJ3tYIGudJJDbeCLqXYWDNbPj1AXT9y77xjAvglhvhUZvQAibIRlq0Qtp+RkBsgHoScqiDxu7dJZO8ydjUwfGJS8pVNT9wU/ldFzHaWQl7JsJghAyzANWjh6BhaBoHSYuHG/KD4uC0dzyGx/bxC2YE45oWcSdd2fzztbSBvxkcSRrwLSzSr15Ky43IWkb3azeEm09lvxrSSeAY7aRCHwSVHh8/T8AHBgCLZ/JbJpnQuTayrNdGG38vgSO8jrQODpSUKGsYGSAA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(11063799006)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zDI1yD6UsAeawgAobE0hAttF/4uW30JGyBKl+L1BVfBAPPC9xpeUTS4Y6VN2UbT48jlhpqIQFZqQ28kDFg+u+8UZlnA2VTxRjd9tfTgM2/IzEP+i21q4spHVOXPmAb2Ibv8N7T4CRn7NOwD59JZkKnDtGU2NhaXtI3j9Nat7Qc97mtdCK46wFG1RcwfWv1jr6cJ0oyDBcE96NErWzvQQZRGPB46I8OX/7B+L77dng1bUIP0DDIeGatknqT0eTlAGeSd8vfjn0ur3OUh2sXoCXNqYIzAuQIbfz/dazE6L5BH3z0I7CT4qDN+bINZtZikqJZ+VZdB47zu5vI/xmmJOXy6NhOG58b2bUwtXMXzmz3vIb3pJta3dvXj3AwxVyTN1H6x9oTiFSvzBu5WxD32Qk6sEblO/PFVlVwAr+W08Q0HmST9HvglFAhwljjYchEkL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 00:27:16.9004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eb41fa-5f0d-4559-d590-08df444188df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DSM2EPF0000000B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 0e2347640..f984c3326 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -499,18 +499,12 @@ static bool
 is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t version)
 {
 	bool enable = true;
-	const char *platform_name;
 
 	if (version < 9)
 		enable = false;
 
-	if (enable && amd_is_lockdep_enabled() &&
-		amd_platform_get_ops()->get_platform_name) {
-					amd_platform_get_ops()->get_platform_name(gpu_info);
-			if (!strcmp(platform_name, "navi10") ||
-				!strcmp(platform_name, "vega20"))
-				enable = false;
-	}
+	if (enable && amd_is_lockdep_enabled())
+			enable = false;
 
 	return enable;
 }
-- 
2.55.0

