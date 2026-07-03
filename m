Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5940DC43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2D510F81E;
	Fri,  3 Jul 2026 14:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZtWsmJtC";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013050.outbound.protection.outlook.com
 [40.107.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747C910F81E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px74p9k8EpES0vuDbXpk89MgOtNpmRXVCADx88bfUEeAubAeHyk8e0VCaUPcPPxpQ/H8qbyyYzCYonJ/9QVcZNYGhHc1pPQCXrETBmNQ1LGq6W/v6fqxSmCy2m0d5vcEZSzuPhyb2xTX8OFowgUoEgwFJKgh33m5bW20cojmxeVUXOdhGJHSZf2q9hukdh6KT0/AH5DkNWSenbMyf7E1Zv64JXgZpvEAJ9kKjNqfUdIrb4FoZyV/tSVJy1Wt6K1OcVrijJouOSQp1sDPbdFO5WYkcwCz7lMb4HjpezBBhVG0pFPRy/NSnvGov2D0ENXCe3lHFaaGHHptICbDY2kqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXQjsoDTgM8L8jeJ+pDq1SOxIopvX6yrebvnf/DKucU=;
 b=hFYk0fCdE5fsNO0wTmvbM2ZTf8ASwI88y9JdHFMvE5e/o3YamRs6WJFL5xy5Xfphz49Y/BTw9P4ThR4OYBCJnLiolsxkPMkw/zZTWhuIFR8/fZKOnjKeYZIoBoyBkFk74sMy3uAVBjBbXWR3uTb/WrPOBLiFp8xyLgiT2DLmV7GCvEJek9NChWBGEXJoZsmC/vsHH8jaQNq4h7Wj62z/dK9ClijREbsuto2k7kJ73Pkor+CLws2NoKsj0gYUn7cN1JpofpDXMpQi+TX4Z4cUz7b7OhkeDp97Spudu9falyVIZAInlQPrJW4+VuRzYJ9SaPxdcCtvBJG3Kl7UJ/0G7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXQjsoDTgM8L8jeJ+pDq1SOxIopvX6yrebvnf/DKucU=;
 b=ZtWsmJtCr7kqP33Y0Td3vmlK1wso6PD3iCoGSdt/kXSLdKaDVWvkyXLpV4t/M0pWdNNHlViSUFlap8tMl73e6HWMo6jCEPtp3TLNh06BXuxZ1oIzs+nPZ4WUTj6yItCMc4pNfSjLonl4VQwzGMICjWhfMzy8yB0rGt0NlWp6zPg=
Received: from SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::29)
 by IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 14:11:50 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::63) by SJ0P220CA0006.outlook.office365.com
 (2603:10b6:a03:41b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 14:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:11:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:22 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:22 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 5/7] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Date: Fri, 3 Jul 2026 10:08:25 -0400
Message-ID: <20260703141115.69015-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703141115.69015-1-vitaly.prosyak@amd.com>
References: <20260703141115.69015-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f98b1b-1bc7-4971-b05c-08ded90d0666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: bmDJUwtJjdcvqMEe6eDHTnVuwBj89k4ZD+5otXcQ37/nic19a18Sf5BXwt0ir2lSBgzFwVXCBZLo83dzaL3z6VflRmsbz9+Y/4QY2y7KnDd3r4cYY8V/TuDAOVaCYFl7ssKrCpbkb5MA7YfZUbxrtq0MKHBRJRivR624ibtW6NREtOWi+vniuOgITLYIIZsBUFbsq/kEU+2wIUuSzW8ctppmuRj4/VJ5ziJtCVX6O8wBH+KPxiSvnTxJx3Na/3X+viZU/nL6aPJr0c8KpFywdVrhnNw4b9W2scH/CNpwe/w/LmC2P6srR6ZKWu/IwJhd/xGxXBhe6gIKWvc/GoOehnPEdx0x85cmF9dDgBAcU+jg8f6KU8m8Fcb2dWtlATncWINF9BMpsqt0N0Cs+5po0be7+5qvpVwZIxelghl11DaNK8BM6IG5OvXz4yYJgModZQXVL8aZ1GD9SFa4TjJst6wC8rOhs4LRuUUonTvvLrrJuC5tnQfu6xYG5TgLQJ13U7pwENkUq1EPzzT5mDKY3gTWXSxjDy4DXFzyc0R7h5narb4aL9Es7vc+nQHfDSKWnIDgpiBaWHSzitxVthsaHFU/9cRY+adHXmYJJn5glYvJiXEYMTWzlOErfc84vLtn/Z9NAptEGcs4KvS69OY5FB/cj1zVJhEN348PJqGGeNvyq7VH3WCFf6i6jJCke42owbx4NFf2/Q7jKJ8Nrpzhrw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7i8W6vKYuvXwh3qvgob87awgY4aaMsSpg0MrijxEiMyB5ilRQPsYYLpkvZKb1m5EB1wrynaPaYzLpXwphZvxldFhpMJd4q4mvMZCwwlrX2LsoYxnTRECg9K9mg9EkAP3PACNytjYZK90nJ8yC9s3CUPwefNw/y2p8VnOllXN1Iuinyp0N1Jwq9Ns+wKuoBVKboDt0n+Exj9AWfGc8GaU+I6118iLGKQ5fxnUJgYnPnw61SaYTDHMNQgllTOL/oq1ABtI3ycldhxR2yn302XRGcrraujpYDEo2YRYEDARig2U9QukSwvbxG3X0xLFRk2MNfyz6fWB8gcMlHzVqF5i6g6gGr0rpz0mOl00btmOOl9BTUZ8LzW0kSQzYRMSohAtpWJmUMMAjXCLZmSk56+fTYKHES7ObZXr+nUJX6JbGrUJkaqwvZzlEltv8By27Vyl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:49.7655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f98b1b-1bc7-4971-b05c-08ded90d0666
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Integrate platform filtering into the IGT framework by adding automatic
checks in __igt_run_subtest() before each subtest executes.

How automatic filtering works:
- If platform filtering initialized (via vendor platform_filter_init),
  automatically check each subtest before execution
- If subtest matches skip rule, print SKIP with reason and source
- If not initialized, behave as before (backward compatible)

This eliminates the need for manual igt_platform_require() calls in
every subtest. Tests only need to call platform_filter_init() once
in igt_fixture() to enable automatic filtering for all subtests.

Skip messages show the filtering source for debugging:
  Platform filtering (config): SWDEV-12345 - Known issue

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/igt_core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..d2a6d79f5 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -80,6 +80,7 @@
 #include "igt_rc.h"
 #include "igt_list.h"
 #include "igt_map.h"
+#include "igt_platform_filter.h"
 #include "igt_device_scan.h"
 #include "igt_thread.h"
 #include "igt_vec.h"
@@ -1580,6 +1581,23 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		return false;
 	}
 
+
+	/* Automatic platform filtering - if initialized, check if subtest should be skipped */
+	if (igt_platform_filter_is_initialized()) {
+		enum skip_source source;
+		const char *reason;
+
+		if (igt_platform_should_skip(igt_test_name(), subtest_name,
+					      &source, &reason)) {
+			_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
+						"SKIP", 0.0);
+			igt_info("Platform filtering (%s): %s\n",
+				 source == SKIP_SOURCE_BUILTIN ? "built-in" :
+				 source == SKIP_SOURCE_CONFIG ? "config" : "env",
+				 reason);
+			return false;
+		}
+	}
 	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
 		 command_str, subtest_name);
 	igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
-- 
2.54.0

