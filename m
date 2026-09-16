Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75C4C982C1
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 22:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4BA10E2DD;
	Wed, 16 Sep 2026 22:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HrXpPBe9";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F3410E2DD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 22:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEYl29PImUxK38FSHdo9SN6bOgP+/S2reBcyOs8OJjL4vo3Jg0zH81JRqjyqmZk0PMFIzgMv8Jywq3xe/YrChsfL/zkOrqKAw2srt9jSTJobuqcfdcjxHPBdB/tda4zMPB/doy3hcqJ3Ay9n88H5Caqd7RNEw8OGgHhKi260pB6wt9KCjE0E6XyaTGDO1gAVE/E3btTRC+JjI96rMS7CbaNTKeCncjZLzE51pyRhGjk5u+N6QdJ4YUZgFsxOKZosXPnYzYgYJhqfDqRLF6nGSPHG+C09FgypN0lQtdpZwp8WM4i+l2uz8D2hQjW95XNrmXCVQbAWDQn3eGRqBDZHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGzZK4y5iYRot3ajuCXJRfy9NwxVEgNehUT8sDnW9Rs=;
 b=gGwnr2l90+WQyyI8T87PPNSeKbxXhGAYSpw2SJ2QE1gSjLjjCLXzzrCYrXiZPoUb/sDl97uZkuZIU9kbIXBTgEYoa7tTlklidw8GYWtdAU4R0c5s/Xl2U4U/qtPqNNoWXEVRxbo9Nr5tuStG3eAnwXA0PtscM79OkZn3/y6vRaQC2D/xzsOI+nF+iQsYR5B0riVPKgTqKQT76NQbnELdmx8UvZwZX9nvIUWvbV6OJHlnn0W3fJsMQlPWUn4eAd761xV2R2i+1F3ffYHBtQm65z1lD4NBUaSQXd3zpXrVc1qoNrNFE5I/isKAe5B0HKAHhpJzAolH14dDcu7xJ6rMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGzZK4y5iYRot3ajuCXJRfy9NwxVEgNehUT8sDnW9Rs=;
 b=HrXpPBe9+LYA/mGGvrBa5Wsjaf91LE8hbJj3AygyaIiwtshPFt4QstfaCkuAAkXxKBVoPQvTvv321pu9NDptMDDnPfg5V7NEMvBT6BYYH1tbOPOp1C99hC/j0VChHawEH7x+UD/wMrBe+GGzDJFXXWYJqa8z+6nIBUSYWq9hwDQ=
Received: from BN9PR03CA0258.namprd03.prod.outlook.com (2603:10b6:408:ff::23)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 22:59:09 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::4e) by BN9PR03CA0258.outlook.office365.com
 (2603:10b6:408:ff::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Wed,
 16 Sep 2026 22:59:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 22:59:08 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 17:59:07 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 17:59:07 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v1 0/2] tests/amdgpu: Add shared lockdep checks for reset tests
Date: Wed, 16 Sep 2026 18:58:45 -0400
Message-ID: <cover.1789597588.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 0781b306-b0e1-402a-37ba-08df14461d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: T4W/VKvl9kceQ7tliaQpykfSU/VBaC59Z5cuN/vIoaQf6B5RfWTiLWyuTVGz13JvvSS4hOl4U6azxUqENJqvBPLwCPbO5mHJRL6r2PxrFl8ShghOZ+mTKpif2vZhXcUDbEfLnnR8qoHGZeAnACi7wDMfHZpc/lktQIWk4D975FuEHK426nSfUk+pSsOXvHY20ET3A0UlugTFRWBn8+AdDK8tTt/uNA1H56K378Sk0ouI/AagNUGFwZJPgWYbU2hvKv+G3jxaU5eOnFbKhMLncIPOgKfKHomHduZVLpgDCWhvETdhsqIwKbfuakFXml2RnMOPXl5I5Kall4cYAN2SlHZBkEX/xj+Bmq9gp1LBh2KLvyZzw7jmIfak8UllNFKatKcQxycq5M3MOaBH6FSfH6UyLjjPIY+uSV9ufF1mh/P7nL+x2Z2vmPLO4NBBAK3o2SJCOiKkYtV7SyhC0pRpf6btFcyGWrP/TqH3W6MmQGr+C38ZLcmkSh6dmCG8oqZaCBQ2gMWU5o+JDHLsgdKapq9poDuWHtEZ0xqlniAeENCjUXRmReLqLi50UprH2/b2YLHJNpAu+sY2Kl0UpWiv1pxglaSssmUACIep6vdPVCsKZD+kl3W1wSTGQpygLccAACR6ghsZ40RkPZxRhbIZDhg5jIq7QFWOsoRKL+0tEZ4kCCUxz3JpHrP8f3xxDxjpRnFGGlUae9pTXobOdROq2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mr60e+GKjabRnu55zvzJPUmuFNb8qBT7wOcua+XWaDzPNE0ZPOMDqD9P/aeM3p8/h0fPYjo+mhWsIWbod0UNlMjmIyXFlruRx5dJ2vDXhfDVWAKM032UqmQAVyiAxwa+QcJMupCFJz7FNeOV7Hhrxhg62tNPqFMBNQGPRmTYqei4uD8h4JkO/3S37y2PPF/kPGF+mmzmPW44ZZbHAVrwSDkx5d1BzYT/HX7y9AFGsd4B8D7mjEcY+75osFYL/jVRk8efn/P6WO95qF1BrRZa3W5JyZ6wmWRdLQpz0r2znON4h4824NX5npk04hWgfO2W1UUoTUfgFtbehLwtZoyeRyxcZLEk088kqWayYf774w6LCwBvIQx1sv5L7Ed3yeLyD9J8oCEBsJoGw4ox5M0g73Ks7yR/Ik8KSOnx0HNRMtCyRZyUu7Edaz3ffysjpzxz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 22:59:08.1659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0781b306-b0e1-402a-37ba-08df14461d52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

This series extends the existing amdgpu lockdep validation coverage by
moving the common /dev/kmsg and kernel taint checking logic out of
amd_lockdep and into shared amdgpu helpers, then using those helpers in
additional reset-oriented tests.

Patch 1 is a refactor only and makes no functional change to
amd_lockdep. The test still requires CONFIG_LOCKDEP through
/proc/lockdep_stats, opens /dev/kmsg at the start of each
lockdep-sensitive subtest, records the starting taint state, and fails
if a lockdep splat or new TAINT_WARN appears. The helper move keeps that
logic in one place so other amdgpu tests can use the same behavior
without duplicating the plumbing.

Patch 2 enables the shared optional lockdep checks in amd_dispatch,
amd_deadlock, and amd_queue_reset. These tests mostly exercise queue
reset and GPU reset paths, including user queue coverage, so they are a
useful place to catch lockdep issues while reset and recovery paths are
being stressed.

Unlike amd_lockdep, these tests are not dedicated lockdep tests and must
continue to run on kernels without CONFIG_LOCKDEP. The new begin/end
helper checks /proc/lockdep_stats first; when lockdep is unavailable the
check is a no-op, and when lockdep is available each subtest fails if new
lockdep traces or TAINT_WARN are observed.

Vitaly Prosyak (2):
  lib/amdgpu: Add shared lockdep violation helpers
  tests/amdgpu: Check lockdep violations in reset tests

 lib/amdgpu/amd_utils.c         | 100 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_utils.h         |  14 +++++
 tests/amdgpu/amd_deadlock.c    |  45 ++++++++++++++
 tests/amdgpu/amd_dispatch.c    |  25 ++++++++
 tests/amdgpu/amd_lockdep.c     | 110 ++++-----------------------------
 tests/amdgpu/amd_queue_reset.c |   3 +
 6 files changed, 199 insertions(+), 98 deletions(-)

-- 
2.55.0

