Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F415C4452D
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 02:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D010E3DC;
	Wed, 22 Jul 2026 02:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FjR/YFFh";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0DE10E3DC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 02:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk/zXr9bmJ1OOzJjIp+lhQqdyWFNZnNqhI7Z1zeelNSZ/fPFh94BZfvIxPuUtHSzvi8Vm5geZCybR7PazfNuYgJayekadjoFkfBJrrGWJFYc1uXbD5IVIaemfMJAL9xbFdjeTVtJ4QrDG9hnZwALzhKgCzefudQhYXBsPYfa4u4Y1BiURIb5sEhKZDpkZ0xPJpCJmwm0PUCd3HoWkERpoBtQBGodus2zmUSo5bIN9t7sfpNHu+YBqCzuCLop86DnE726V9iMbGZD2clh8yhYgnKkV/+E5g3g1Gj4A6vP+1CDzeEFhjZNHsyAyFbIJgAvLFtbooBBqrRr3XPHrlilgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xigflrKcWq3n8U7FynKtb1Td8zEPXI0IwvHxfVxkJw=;
 b=qpt4MkeIQhiW6isGZIh85i6Hh4LHCHIsLDrFHJ/hbJKgfu/IJNgrw+gNBZIVnV9K0Dd6ZSs9GmCUBUkPk22Zjnhq8EayH2yyNs5jxESkEOujHO7kCn/CS2BNwpllAtJV1XAo+4OFqmnOsOuWrl7aYbNb2LWGaYIjul/O8odMwzirJbICICXNceTHQAAojOIdO6hK737af8E8968bFsoK5tUSUps1RjguTSIFc6oWaBcfvWkgnjLYMoBcQaVf7aDwMBQ3ssXKviDxFgYcFqEO6jlVZXLww5UBiI1XbLfp9wYRe4NDk1gqviB+AP/XRDkiak/xvXqn8+LnDcvPIXLx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xigflrKcWq3n8U7FynKtb1Td8zEPXI0IwvHxfVxkJw=;
 b=FjR/YFFhMzWfb8LXDb5GQZwWxERJzUhxxFu7gOobqHTFbJ6j8PEUYaJuah2BQ/O17dutUQwKsT2HZOnpeqlOpzAw99J2Ixhu+dGjhPP3j+RpIPxNQvP5OF9laUkhfOMGdjNotVpp0me+mbZo9JH1PexJ2cVN19w4mwSUaz733Mk=
Received: from CY5PR19CA0043.namprd19.prod.outlook.com (2603:10b6:930:1a::33)
 by SA1PR12MB7367.namprd12.prod.outlook.com (2603:10b6:806:2b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:21:58 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::ad) by CY5PR19CA0043.outlook.office365.com
 (2603:10b6:930:1a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 02:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 02:21:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 21:21:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 21:21:56 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 21 Jul 2026 21:21:55 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v4 3/5] lib: Add platform filter initialization check for
 automatic filtering
Date: Tue, 21 Jul 2026 22:21:36 -0400
Message-ID: <20260722022150.191615-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722022150.191615-1-vitaly.prosyak@amd.com>
References: <20260722022150.191615-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SA1PR12MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 013659a0-a998-4219-eba3-08dee798011d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|22082099003|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KFKGRHlk1DrenMYKd5h6hbLZoxf4AzruLFXENfj209tgfhI00HE6gzlvdrcg3CB2K7jNGtz8IW/J3YP1dz67lcAtuVi4n560AYIaRvfp3OORQKP72yUjLPJPdZ6EsK9DAqZG2cgbCu6SoHoV2xe/wba7ZxI5ncpVL9Ec9VUOO5Yl8hz2KwtJFvO+RPuNgQ3KhqV2RKcxlx21qMFyaxCWby5pY/CgDGNeR04gK/KkAeWjTAs2wPDwCrVrymNF/8vyPTuqG1QNnJU5849hNVCza3G0XqKIlXHgI3QNmn6RNZmOUHpTNCjTpbDTtgdX2INbVJdNUFbexHoV+UemvC/W5SZ7TCRenPmREYIariKzWvMhaxnzof3tiMojwVtKgF6m9onlprragM4gxWNu1apiUdpXlnqaqREjPIlwsUtddyvpKwIH/g0lVW34lKMpfBGm6CAyMSgOTz4ymxMaVZFBqVQzO7db9xSOKnT2pYsMSLNqDxXCoJdlc30K6wmGv5mIc70/OHapqtJW+7/puqR30ZdRERoliIaP6FQhpwKIXg2SJhe+H84ScnyGPC339DCda0mlSrE9XPB1oEo5j0fsAskC+0yPKPrxA3rnaNRUd2M422+mVTv1z/tuK3e0YRmeblCB4NzKryYhJ4KgKycTlqstYViymhio2yiN7iyFjLiv9Dof0rEVllTZbu1ZMou8GH3diemtwm2FZw0lHHujdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: usNPGXPA9EyuL/9g9XOU1qWE1Z7g/lvsgwrdlPXGmfJYUno8CDNyX94GcPOWcjCbIoTBGvGrx7D30kzFMYaVJkbLs7Rul0q3KzoSQq8Xl16pNvPcumHoQ5oh3g8C2oI2XZUbJtPgAmvQagFYB5dqj5dl5V5Q6lbgV8HRfheEiUOCf68ZUHU4qq8dfuuhpBLnFYcxebG2wSojP7MEkGkJ6rJ93xkJFRTTJuTJflfX+VfjGTH6K8sjhVDnDW/Nt0z+CB7jaHcKyx6+Z//j9hkOFVThBuufuQf5SpBuChE8umf9+jSyZuxqh35J1P6OsQToJDqg6s119LA5x6jamufaxjmWCkxrwxv6tT3CX+qLJw06x8p9kvWun3kpY5qI+JuF6YuAvFX3EX8v9KbUO1cSsSOVmjD3ehVSPN7mOibrEqXb7YZ2zy12OFmwaefE7CsW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:21:57.2092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 013659a0-a998-4219-eba3-08dee798011d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7367
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
 lib/igt_platform_filter.h | 2 ++
 1 file changed, 2 insertions(+)

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

