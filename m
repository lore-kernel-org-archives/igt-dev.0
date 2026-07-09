Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1022CC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 22:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5CC10E0E9;
	Thu,  9 Jul 2026 22:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xAcKwTpU";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612A110E0DC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 22:02:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnOI4bKKbco7N6HF/X81WSCzitrM00Wc6mDUScoeNs672K2BYyqE5U+GW3mJmPpqdL0Jr4sK3JYm1kGuiT50V2KSxSAHPiTm0OhIlmB7euLQ9q0OpKafOdgdv4X5cWHveHE4eHBtOcD6bpgaM5VdiafeJ1T5Oqycyu5gEWyrnkj8Y9SiVoxWExROBRfqm68KrZtb9GLonNU3PQasxARjtG5rNWBWLdm+js4ONvZAWKFZe0cOMrqJu0ilA1rVSu5ig9c9xej0VZKQ+h5WL/Xa+C5RUDsp6Bet0IYaQfkHWDTsS+wNbegIQacbYV+9l8DnGgXvQeDRyoFKO+HhpcOrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9dBgXrkAFBFhfOuiL0Nikw7stHDQi6/hMGlhk78GjM=;
 b=qYjUUItS4rfyZDzOxhOUPF3J03JJoUii9B3n4bXBtxiF2f8Ubl8k5aLx1AReo1KCT5ShYU6bqfIUsvpmsXDM6jI/T5OcBtzpeE+ljb7dAZjcI+fZNpX5WpOwOCW/G2DcqFXVDb0qTHst/L4rVKEWpPyB4TvaYG1RYfoz/pcMgkNee7cCOpupRUO1y9mNxRHpX6ID3uwooBi+rAPW8brjB0s3UjyI6Ft5SNtOp9xvLXLjvIkEbTEE+hQVdK9mfzG3zry6gy3lQGItKBt/FT90F/tGUTOjlaUPfjrBatih72Uux+uuwnurw1MkSv0enEs7b1fglGpAjJkUjoiS3noGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9dBgXrkAFBFhfOuiL0Nikw7stHDQi6/hMGlhk78GjM=;
 b=xAcKwTpUlfv+RHUsMZBh5rsHpRaXigSPO16k7u88PZEo9k5dTqplwX7U0OeVKy7GtDGU5bgy82I54fEfADyEqiBbgx1INhgeI6yeGXJxcxhPVjmKGUo6PiEwbpceqgiqpVjgQpzojNU8bWpmh4Tduo4yM5P7rsnVhQsLbJpx1jY=
Received: from SA1PR03CA0009.namprd03.prod.outlook.com (2603:10b6:806:2d3::20)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:02:44 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::6d) by SA1PR03CA0009.outlook.office365.com
 (2603:10b6:806:2d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Thu, 9
 Jul 2026 22:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 22:02:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 17:02:43 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 17:02:42 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 2/6] lib: Add platform filter initialization check for
 automatic filtering
Date: Thu, 9 Jul 2026 18:02:13 -0400
Message-ID: <20260709220240.132893-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709220240.132893-1-vitaly.prosyak@amd.com>
References: <20260709220240.132893-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: a33b74a5-0513-4105-5519-08dede05cd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: bs+3es3Wit5la8Vjfi/pHpdjFgZlyNvRGcvZDhacoDwkdTuL1NJ7qmD9RsSpQ1jwDk+rHlTkERpz8j6eXZ+WDSMKs4kLbijYt9O69SNTRbm3EUZvPUtQiLL+00kkPTKRmISgkc7CCGnfVpsP2EVfdGkhj4qB7vXINTrNw0P/vgzj7EyvwBZaPADA4iZ5UFUcGGpGti0LUSlca7aAx2hxTEWHjgUkghtFIQMGs0uXsH9btF2oJoE+GARsZJUhglOHC9aGbZToWV/8b29k3ytLSyjpLDGr60TSHQ9k+FfjmZSYHrN61RhHwpeIVqaD40w4lrS29a3xbX4fJnv1hTgg/YjQMYGRW/dkvAIp4k3lu+xvLMz7BuSPPtmRlEZxe+HVJWCoo1qk2s6tONFrwETZqODPAoK+zOCSefeJQcwwekC6qeBVO/YaLjxqEWqNKZrtdFAL6vLuksp4QMmRIT54QaaSWzc8EmtVbBzyge1wTSPNXRKBcG7fnvihyHD4n9Aw4jyqHGcgtvfLWAny0mgcfcyJTWeoAWkh3gjkFYoXPg6NO0K3rEAvPvX/r01GVRHc6rwdvJ0o8zSbSlcQxfw6SsU/j4MRLgBP0ND/21EhsvNEG2xCXjT19w/uPnYUpURD/CStXKIDLWM5HDQvvppvGzvfaixFYdhnwqaVB7PvIiXlAwKF81rHrgDqLhPnvGTf+ZLPmdFpfwHbN5foqoCtxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mKvKD/KQVvnExVWQOQm7uGby2v+AnZdmo3dAtIlJ1le0ySFHfY4x0aaTMRorNd354Bi8WLouurPKaheA7fZCXxrqoZRPOADzXWKq7Bi59ZOJXz5KrUvjtp+WAfRNqqtnwwR8o1MV6bXNWEVlLYDUG9TGvrNG/5LzDvx1LwoQRWqioFvCXArURtECgyAclUhcIFtO8GnZyw7wuEzxldMfEdx+XaD1WENTAcdvCOysY5qzKrEQov7SH0Qv403cCTKmKnS+M8iilr/9rR2i4D+MZD/5fASWARjWN7euVp/3yo5SqBfddRtgv8tHeNc620q9/60/E7Zr2nxupi74RkYDXV7PKTHTqzBuGdK8G7AwEbv7yzLQWbP+YzkEUq9BzG/Z/bmXGzvqry3rTamp4/RjXVCH8OROdwMY+3sn5Swr0LNppAJOTu3ifli1Qz59N6AA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:02:43.8247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33b74a5-0513-4105-5519-08dede05cd96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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

Provide igt_platform_filter_is_initialized() helper function to allow
the IGT core to check if platform filtering has been enabled for the
current test before attempting automatic filtering.

This enables the __igt_run_subtest() hook (in next commit) to
conditionally apply platform filtering only when tests have opted in
via platform_filter_init().

Without this check, tests that haven't called platform_filter_init()
would fail when the framework tries to call igt_platform_should_skip().

v3 changes:
 - This is now patch 3/6 (was 4/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Change-Id: I1f8d7c1b76d8a2e3d5f6c4b9e0a7d8e9f0a1b2c3
---
 lib/igt_platform_filter.c | 13 +++++++++++++
 lib/igt_platform_filter.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
index 5e2e7c744..7ebdeb419 100644
--- a/lib/igt_platform_filter.c
+++ b/lib/igt_platform_filter.c
@@ -577,3 +577,16 @@ int igt_platform_filter_dump_to_file(const char *filename)
 
 	return 0;
 }
+
+/**
+ * igt_platform_filter_is_initialized:
+ *
+ * Check if platform filtering has been initialized.
+ *
+ * Returns: true if initialized, false otherwise
+ */
+bool igt_platform_filter_is_initialized(void)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	return ctx && ctx->initialized;
+}
diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
index d64450489..b4639e610 100644
--- a/lib/igt_platform_filter.h
+++ b/lib/igt_platform_filter.h
@@ -119,4 +119,6 @@ void igt_platform_filter_dump(void);
 
 int igt_platform_filter_dump_to_file(const char *filename);
 
+bool igt_platform_filter_is_initialized(void);
+
 #endif /* IGT_PLATFORM_FILTER_H */
-- 
2.54.0

