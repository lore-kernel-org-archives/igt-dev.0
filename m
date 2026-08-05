Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD22C55ABF
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 20:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616910EFE7;
	Wed,  5 Aug 2026 20:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZC88fH5q";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E25610E25C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 20:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYSBDwyDlvYlqh43yKcRVsB2i8pZYG9OLDmnsGjRUL6wBwOiJHSd9X7duv9VfdG1sXUYkIEsooUDp+E7x9AixdpziAF8iZ1T37cslx7YFY6RezGEJPR9FTdBJbAEvDcVbQkFn5Vwhi8m9+aDsf/GvzsBdjbMm5BcI448XkY3TUZdlMIE8yFSpNn0DYBUpcDfrDzjojuIxRFU34gFUBgMJwtYnJkNONG1N02EgDJLfyrNkG7zrz5+LKcgwnjwPm/ouuEF9Kae5VLDgjdIJOhPZ9u4aypZaWl8/9W72tLyAkaMRixvszn4f013b6YwOimK8472eQZOxiLWi0KOPMEEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH9wp0Qw1esRFoT9y4f73RjNpgZ9/BDxonykLciBjts=;
 b=MhQPx6SfkNk+LVYtzGXfCwGwaw6lsapFAD9/0HlTZ0NL6xcQAHDe7fYhQxotm6+DDD+tWanVzyPOWY6dcTVFd7HQb4Ennwt4UfU9ry/24+tkdRTxb7Kd6R/TEEv6xp+muOhgG01k25kmJFRjQLzFD/dbxQTS2mfBkJ5y6poibtbwQUcqYXbSbwVreV6Lq8nbsMvTbuaBj2n1rWtNCE1NVyUxPnvBsnyvlLJW6rRcej578gmorcmX8WMZzPB9jvNB5JHIfctf3AGPu8K9ZQKMGOeBW9BbH7y1DqUM2UYMdIK7qsAbVDKYnYioRS47OuMte6zaiszY3My38PPGedyRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH9wp0Qw1esRFoT9y4f73RjNpgZ9/BDxonykLciBjts=;
 b=ZC88fH5qMVjqd9dvNEC3cbwcJh91Y2uZDA65EBiHtPvuhG+38CPKcuKtZt6UzLYtTiyvdzRaOJr4FX6ZQFAvm9a7MR5iubVfJem3dTvyoUltHD7g2ykojOR892XoahSS6CkMyAUP8ON1VtPMUWDb8oRCLi/70xu+/Y56sa9GgSI=
Received: from CH2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:59::22)
 by CH0PR12MB8550.namprd12.prod.outlook.com (2603:10b6:610:192::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:36:18 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::a1) by CH2PR03CA0012.outlook.office365.com
 (2603:10b6:610:59::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 20:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 20:36:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:36:17 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 15:36:16 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <pawel.sikora@intel.com>,
 <jani.nikula@linux.intel.com>, <jesse.zhang@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
Subject: [PATCH v5 0/4] Add platform filtering framework for IGT tests
Date: Wed, 5 Aug 2026 16:35:25 -0400
Message-ID: <20260805203608.148375-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|CH0PR12MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 244824c7-1eef-4eb6-055b-08def33133be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: aqU54/n0jU30Uq7LI314h07ZMEbT4w3Fltux/ft8/KrgPCofa20ipOuCrpR8lqeVtt40dRYUK5Ap62/PwnLgYU20w1B9ahR/K0lAqMcYgWRT4Hbfp0UfL50MnxMLlbitJDgtKnJsWA5IANYLgBnq7Pf+RnXr1WvR4iTi3ErmR1QQUY6DuFJjevQ1PhpaeWnFauloS3hvDyZP2s6pO7w7YATZr0gGqQ4BWcVyogGi0ok+jOM9HKvpw0Mg2LgZh1IeO2AY6SfvzNEswH0jG00Pa0HqIxDFpIzc8tlR8DE70jkGMsgEYHo+PWsa2Ij1JWGqFH006fzz3D+ZHgslDbLjefIO/zwuzU91yj3zCpAMXy+HlcwAijJkTmcGKzUxtNXMA+kA1HRB0F1Y0sCGzXsObxzVnfnGTTI08svBpIJ9uziji9E4oia/egFsx6eucBFFX9PJqdY5w344AdDF2gzTKAfnkrdULGWDny7l2HnC9/Sg3KxNeWZYHyzhyC2wNyDs1QXZiW6Mqi1OXPTUtcwvq7q4O592fOyNchVq4RuXqt17LM98zJnzzdn4AFNibZaZbVbGb51K/WVl6qK0nfGDoCr52DvJtRWFWdKkassWnY25M68xxpIryJJnQGnzvlP85LE6lDpJJwp/Wqp5sPzB0KuPjuupT29GZPbLiQxGaT8L1w4axWMD9JvLG1zSTOo4MHkEcIh+o9c6E0JPnG9iag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lCnRhQy7xAJ5hZR3dd6dNtIhYCW6cYm2MyfZFillMTaXpnMuqy1H/JjXXAOfwppKiQin1sBLOHk0Li9xy0D+gYh4dIAEHUYsfvC6E5U+cjIjr9MEXYLfMk5gWQThUgvVKwl4Ycm1T8JUN28j07casApBz1NYq/7jaca9gGTOlNl4+K/2OMho7ADjx4nV9+moJWbMlwMOoNxNBK8L2OLZD2E0CD7P83IxYYP4y0x8FOn3WjHQ+5itjuJhyqHY53g6qdnFaXqpEVwzm2rExr2sV2OPyn0KRDq9kmFNCZgGqP3elZit6yjwJ4Z1IRs/jAXe2+shlTeorpSmh1hZvaq0jjR7ZCc4v/bUHIysOdSj0HkvjSWugcpNssvG1FXkHuBbAAxCb0aqDaGQjfrgCPv6d4Wn2z7SRjSvQ3ooZd3AqhzuLjRe71gC2w9eDgUiaXJm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:36:17.9955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 244824c7-1eef-4eb6-055b-08def33133be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8550
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

This series introduces a generic platform filtering framework for IGT tests,
allowing tests to be skipped based on platform characteristics without modifying
test source code. Three filtering methods are supported with priority ordering:
built-in rules (highest), config file (recommended), and environment variable
(lowest).

v5 addresses review feedback from Kamil Konieczny:
- Replaced emoji with ASCII equivalents in documentation
- Removed Gerrit Change-Id metadata
- Restructured commit message per upstream standards
- Added Pawel Sikora to Cc list

Vitaly Prosyak (4):
  lib: Add generic platform filtering framework
  lib/amdgpu: Add AMD platform filtering backend
  lib/igt_core: Enable automatic platform filtering in subtest execution
  docs: Update platform filtering documentation per review feedback

 docs/platform_filtering.md | 351 +++++++++++++++++++++++
 lib/amdgpu/amd_platform.c  | 328 +++++++++++++++++++++
 lib/amdgpu/amd_platform.h  |  53 ++++
 lib/igt_core.c             |  18 +-
 lib/igt_platform_filter.c  | 574 +++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h  | 124 ++++++++
 lib/meson.build            |   2 +
 mkdocs.yml                 |   1 +
 8 files changed, 1450 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform_filtering.md
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

-- 
2.43.0

