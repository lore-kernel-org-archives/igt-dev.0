Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA06606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XZcEa5At
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B4710E928;
	Mon, 16 Nov 2026 01:55:07 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010005.outbound.protection.outlook.com
 [40.93.198.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C799F10E008
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 01:54:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgoeJlkhgDkf50j1jzJuVOX+OtGOQnuYV5I8rXrn9gYQrvqp01wBjITWH/5OqbM88SE7GgzvdFMKlJLs4NK2itBNZBRWjKCtTDKqwIuk1LouakaxC0Xq26VUCkKPSworOOVFZi95I+F+YeKY/BrVK8ccdEvj9YjWJWmW6Q3SxDyvjGTKm+UiU/HF0DYCoDbwUuP6uorCbCzfib9pEJhd1vnxhw5q3ZbDNSwsIGZk3g2gYBRQihSMdqK4KU32b+D301CAj/+lne4mW7V+tXqMNRkckaQWK7MVhoyV0tVzSMbX1erYvujW/k+3eUbaGo7zO7OL706gTl5AGT1rmduSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQDO0IkRFitTmR+KdujbD76uai/ZlxyQGcC7KA3xClM=;
 b=hMt66KV1iTnBdZz+dDkOA05DDJQDDtJzpk7qhdjwTAbD2Hwwshoppqhg6tcvXy2bcKeNZOvZjlI1MIEN8FRF2P4IXPUfplz8CEkJ5MBNwsM4RGlXddahibwwoE3b3Yq0XK1zNdhFJEwxAgBrJoqYiPGPhJ2KBBHZ5CtXTf2D3EknJZMLIOeH/nrvJFI8xRbdNE8EgZentpGlRfnRPYPhqMhOn6cfuam/x3/ehwoVslAavAMDWL5bUrlrNeP7PbU6AijeCcGAtIZXuyKj3KZtDL2JEhASk8Z+CNyytLVeJF1ppPtu7VaqIGPJllILkiH86ZF47EH0MRUsJMP75H7nFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQDO0IkRFitTmR+KdujbD76uai/ZlxyQGcC7KA3xClM=;
 b=XZcEa5At+2EjCMs41io24jDQBP84TEYOO6sI6d5Bp0CLQSkIu4W+oWTzzG551cLgnUxPG0Wc+rgdK5Mo8MtqB+Ep5FWs59ea0pHZUeGIAtNjbRnBiN93wXAv0JZgLMc8+UgNOsH6SPTpeR9OvKT8+gX+NBV6TJlMr0tJpr9xhBk=
Received: from CY8PR11CA0025.namprd11.prod.outlook.com (2603:10b6:930:4a::19)
 by PH9PR12MB252631.namprd12.prod.outlook.com (2603:10b6:510:42d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 01:54:02 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:930:4a:cafe::67) by CY8PR11CA0025.outlook.office365.com
 (2603:10b6:930:4a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 01:54:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 01:54:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 19:54:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 19:54:00 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 19:54:00 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian K?nig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: skip queue-reset tests on Navi10/Vega20 with
 LOCKDEP
Date: Sun, 15 Nov 2026 20:53:39 -0500
Message-ID: <20261116015358.135466-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|PH9PR12MB252631:EE_
X-MS-Office365-Filtering-Correlation-Id: 198d64eb-0bb2-4fe8-db8a-08df43847d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: LrTvQnsT2iRTpp80SkI3KnEd0GSrLXP19ouhxdFclgsjCfpNQD3eNY4/TckFiYVB08UmOA8hbP4w2yEOGYMhws7dRX9jUJKgDuwi96dx7Kpb0Rivlw5xcFCQEkjKrQ+2ctVBO8QGGrhJDUQip+ea6W423TU57kCwTfTU44QB8qgiDA7U/LN+ZGc5yUA3bIO3/fl83s/hsP6w11HOfFY1VFsRGJqI4VA2RF7AQIqdt/AYsqkc827zQ9EocrgvuLeMP0zqRRlRnJy6AWZ/aJJdHEDjTOLLkmxeN2G6910XyYl4MK+qT+0fXxv80sdLpxfJsPwfm7NMHjyRmUtokwetdVr/wKYKQquSyd/PoE2daCwI8FlhECb00leQJAOUGP2KaFiF44kmsL39JAQGnOmWN+qDv4AdK+TWWCYluTFsCfXHsRBGp4mwLdF66KrdJDQPy7Zl2cFTXV5vtbCG2jxnFL1AkQqiD4ziJJ5yzaDRi7wg/QpBoe+2RdzyAMv+45UwfXz9lI1uuQF4LcNn2pCrikRSNhP8uW8SVhbtiIHRwEUrXetmuQqlVgz+HAq9JQxsrgO33EDVy5qWXs54iybsr0gI7bQ8F3ojecj/iPXJUp5BCVfYgQeJDjIdyph0+rHcY3jUSxxzH+0d5GiKsWGn6QS8zO7Ijz1+Adt209u6lU7BcwwcFY+/TF/KBdZ21Sew1lInnvN7dYwQbVGsAjT3Ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FQkmKG4SEopyZraltTQ3Rd+SCzpJ2BgFIb1Y+KLbNB0bWuEyrWeZR9qvtnWnNbcQfWg2qZY7ve04vP2hFC319Usl2zqKWwPls5+8Uwf/9hJMqADNelGFgiW+A8x76pcJsjT8zGXiBP8mt0w+tVE3y1F8kM36gwGnTQ6pK7XvKYwkyMJGOCPw1Dv9YVNL7R1qr+7QybCdP1V08kP3Fwcl5Nmfady/6B/t9e8oOotIs7LELOLdxvQwuU6XS/eC72waOdf6YuEl5bG9HdaNLfRLQ55tIRqWhGMNtsqHO2AaQoMN1AFAGo2xgs4jdXmvxMobM9Q1UxfWfFTXg9CLUB9zqQPmUBdbl7USyNKhNY2Edm3puHOqtfugcga/NUf6f744Ts93r1W33PiS8SZ/1KgP+XnAQR/xflXkdot7BXF7daB1snhM5LeutWuDa/gWCsPH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 01:54:02.4359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198d64eb-0bb2-4fe8-db8a-08df43847d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB252631
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

Temporarily skip the queue-reset tests on Navi10 and Vega20 when
LOCKDEP is enabled. Keep the existing behavior for other ASICs and
when LOCKDEP is disabled.

This avoids exercising the affected queue-reset path under LOCKDEP
while the corresponding DRM fixes are pending. Remove the workaround
once those fixes have landed and the tests pass.

Cc: Christian K?nig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 7f445eb8d..0e2347640 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -26,6 +26,7 @@
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 #include "lib/amdgpu/compute_utils/amd_dispatch.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_platform.h"
 #include "lib/amdgpu/amd_utils.h"
 
 #define NUM_CHILD_PROCESSES 4
@@ -498,10 +499,19 @@ static bool
 is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info, uint32_t version)
 {
 	bool enable = true;
+	const char *platform_name;
 
 	if (version < 9)
 		enable = false;
 
+	if (enable && amd_is_lockdep_enabled() &&
+		amd_platform_get_ops()->get_platform_name) {
+					amd_platform_get_ops()->get_platform_name(gpu_info);
+			if (!strcmp(platform_name, "navi10") ||
+				!strcmp(platform_name, "vega20"))
+				enable = false;
+	}
+
 	return enable;
 }
 
@@ -1252,6 +1262,7 @@ int igt_main()
 		igt_assert_eq(r, 0);
 
 		asic_rings_readness(device, 1, arr_cap);
+		amd_platform_filter_init(&gpu_info);
 		igt_skip_on(!is_queue_reset_tests_enable(&gpu_info, info[1].hw_ip_version_major));
 
 		if (!is_background_parameter_found(argc, argv)) {
-- 
2.55.0

