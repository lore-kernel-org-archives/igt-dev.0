Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF22FC55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 20:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1C810EFCB;
	Wed,  5 Aug 2026 20:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FZMuNze/";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560DE10EFCB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 20:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0+VIWgtxUky+B2t+gRJJcRSWKstsw/I4WaHT2M+VnTaj4IYE/brrOkCt1v2X9BdvRUBk9G6p4ql5c6gni5cB2U79NyD+wAudfV4Kg4/1YxauB9TbmfXbvdVN96iijlR0set6g+vofmvqEcpG3plv2FjY/fmuz2jxJZL5c8LJJa+/E+TTraxO3PBmStNo99vkGEHi5RIj0jiAzskJHeyltFPVOvjXDFWoXHhH6EP0zHZtHAgSZhQ2oszieAKATUiZAgvuD7J5nKieC0J7NVyz7/I00qHqpnO99qeje0aaCo/CaEOyZRaQZm/kPQN3ZPzcdWbdN5ftHysc0VLz2mTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH9wp0Qw1esRFoT9y4f73RjNpgZ9/BDxonykLciBjts=;
 b=wBLIlq2rkj6JCPNaTLEqjoZMpmpXsCd8Qdtn0hTeGeM6ZM3NFso+/mWM5jLSm48qHSxUQCno87NYNaeNDrNeZ6Rw59wUEaylZw1w8Ane8kyQeSf9KSNhHDdUdHmIqdy6taSlkRk2/HFzzkhdZHwrxnWTWfuqkbrQJr4blrqUwmG2XHk9XPgjXQw3FOh5JqDHSYnKopzifcNDXXKygA9MG0voFG4vI2iRQOM/gi8fdEA7GvteieAbnODFGtjoMN+iHGnHpSBXhwAuk9USUNTPc1YbMGmELviQLp7MXEyOvl77TDBt0v3otEmB/qSJbyxakgcKkPiYkqQHGL5gbBOwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH9wp0Qw1esRFoT9y4f73RjNpgZ9/BDxonykLciBjts=;
 b=FZMuNze/YwO/T2ipb4NGaUUHBD5QccgrL8Z474ykecn69ZdNW1D1e+VjH+lXoLRy0AcJ8JjaqxFL8VdmEjONVMoliUoctQ3IlZX+mV7gNZKmcrZnHUbHVM8RbpjMNcs+oRZW8iRz+MxEGYu9U2YAMaRc3O44U426Jnv/3jnYmKI=
Received: from BN0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:ea::8)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 20:29:10 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::56) by BN0PR04CA0063.outlook.office365.com
 (2603:10b6:408:ea::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.20 via Frontend Transport; Wed, 5
 Aug 2026 20:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 20:29:09 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 15:29:08 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 15:29:08 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <pawel.sikora@intel.com>,
 <jani.nikula@linux.intel.com>, <jesse.zhang@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
Subject: [PATCH v5 0/4] Add platform filtering framework for IGT tests
Date: Wed, 5 Aug 2026 16:28:44 -0400
Message-ID: <20260805202856.147163-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 07de8952-8f79-4f48-1200-08def330346d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: EqrTxVgoiDba9pHzQ3/FBJzzUqg1WdQH21EKTbdo7kau1oMnJLPF3MD5vcughgF5778bskLlm/5sKZDD97RpVvlCilfZGCT2McmVSsN41fDKiSiF1NjOXFg327vmbqG9YK4ei21oApmfPJrAa5tdQnM2acvYOfGre13Z4XsKP4eSpkKIN3dLt069yp24hb7BGm+tpT3YVRid3egd139GLTEboG6EYzCY71+NZBi5xHeGnX60uAFWbErS1B+VMkt8pg562f6a507rOM4uzEoIR2hDM+gUHmIYAAUxDVpMsIWzquBAiwirJiURNHIIULio7uKOR0KjWGZREtmmWmycdQ+gGrgycgC+8AwxxRILoakMIedycyJLO8cJBG2jwYjlyy3jLXTKhrmES5ofR9//+77lXzoj5kZ3LT2tjMoYufb9xWOL00uNG2rVJQ4F4MGi4I7509M6N1nm3xuknTc/H+SrFcy7bx1orvfKd6WBXCFYiTQsnLJjzbvUpvq+MI/gvGakIxl1henMeANAxVWHlUzUu7+DcLD+NsOwsNS2Z6inSqeJeNcEJkxqYrmI9WqnakX00MiAmSLcL8/cOugwiJnlxOlAY5ZzwjeODJUXS6NlLrYZdLofWxGvF0XJRg+vzodecrQTVryAUOI71QpX78jMjowbbQDxBKeP1GDEO9ifLcIgNtccuyO9uZGWv5Lk7SnxZXVpeTNXyK8tocdlGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TT/57LtOz1j2qk8+49sxoU44Jn/1XdQroTbTJ/g25f100KsSdgSvvCOev01nKzfe/RNXu9bgyV97IiJx3k2E1wqXPD/VzChZJJtl3qN7vKAqPYh5a+Rvwg9tHLZpE5Gv0fdbJgFa9DNDyA2Ows03p1gfbM56XEV12x9+uK8HESir0wtZR8PYsOU4uU181JcZgS9BqK7hkZsfLlry3ud49BrbIkjdqs/OzSyxAIB1U5O6yAXz4sA5XQk0k/IPB2QUzCh6aso/GkxauycDSJShcSskQffLPUzQu3kEZDzWZIlEL5JPcn0oo4Lb4ZcrCqAqLq/KrfhntYq3QtUPjXa36DdzWn6Unz4ZFcQGsHIgV3z/JpH4OAsCmZ+rL/U55WvIoQlvMak9uRAkFXQ88iwxeuP4zXcmMHvYI+PgxaRQviLNJq/O8vVtt3KeeO2fBd7I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:29:09.6286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07de8952-8f79-4f48-1200-08def330346d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
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

