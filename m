Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7584FC61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 01:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163910E32A;
	Wed,  2 Sep 2026 01:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OaAU5kdl";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010051.outbound.protection.outlook.com
 [40.93.198.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193F10E32A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 01:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2R8lGC6X5523mHfVnwgtBAdTJdO2gr8WFHsgWaVF9aPrroQZk0aUzWF76OtoFpqvgVYqzYt+0TL9BxrnCZ1v3FjkkHFW2pacZ9Dqx2GIXcTZ81IsqaZfn2La86/FVlkQTRhIHqOnIrJKE0tCxIAzoNiwB29oBR5koGXQzzECf58Rj4uDXStSMxMyAU3GC86A78iy6ZHrF2ytwGRBJatAzu7Zg0Dd40IQetVPrX3kB6YgGqkY0EBfoIfJP/mppRicuqAiKcg0Mzj0WjGp8RsiDw+LFiD3ypcsZUtf5h9Ye9IHh+xjxCQk7qoPwymwdmVDHRLI5/pwISR/ojSdFAGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3DaAmRN6IhFfbvtN2ris0OK8i8XX72bRtVwzDLzY1w=;
 b=l6F+nz0TuJfLUqlnCErZChFpelibCMjhy6pUpZZwC6fo2vZXdmoVmCg5pc/hzMDgHX+wUuaHX3yg5AMnpKQyasBMNuCwWIILS1LTrPaZwlRZpX3XooAZ4xdEV2yP5+BjnqkqI/OoOHnxPKKmyliLRKF/KnS/LeekbE3u1cKaSt8qOrrKj8JoiA0VUbHZqo/RxjRzt+b4Ta0jU/EyLUmlMtX8a0fBqi1MbQNA3SeFeZNCM1K0rd/X4PZFIDsLyEuXgBcKmDCdW3o35N3iSizF5AT6qi+Dtv2/5rEPYJjNkYjNsuKrmQzvFE5WL4ZgIT4oKCq1aPVgNRfD3zc2F6xxXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3DaAmRN6IhFfbvtN2ris0OK8i8XX72bRtVwzDLzY1w=;
 b=OaAU5kdlijAuoZ/xJ9IPHPpUZ2DYLPlWwGU0ka3fjDB3PeHnXRQKQWIM7F5nZ9ZghTbtfznJAw5IjhNZtb64A7Qnl/rANBysZo8Htr00/iOVqkpCNzOJ3j1oeWMpWc/pLGG9Da9TPltSrruXQSq1v6bS7GBzPXolRMuau61VJ1I=
Received: from CH0PR03CA0277.namprd03.prod.outlook.com (2603:10b6:610:e6::12)
 by SA1PR12MB6948.namprd12.prod.outlook.com (2603:10b6:806:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 01:05:07 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::5d) by CH0PR03CA0277.outlook.office365.com
 (2603:10b6:610:e6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 01:05:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 01:05:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 20:05:04 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 20:05:04 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 20:05:03 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <simona@ffwll.ch>, <kamil.konieczny@linux.intel.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <sebastian.brzezinka@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v6 0/2] Add GEM_CHANGE_HANDLE test
Date: Tue, 1 Sep 2026 21:03:15 -0400
Message-ID: <cover.1788309579.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SA1PR12MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: d2713028-fda6-4aa5-41ca-08df088e3999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: mLi/gkV9T7hNGr+V3l14Fzp0/pVBXiTeANRTjYmvP66iZBhIsFmpZvQVSNiybtkSnoDl3Lr9aqF8BXFtaaTsrKMrKxZkbRp/6ic43I3zBEIp6PlgvUWZ9p94jS/YZ5xFFtmY9aS8aLPpbHwUa/HT4tQ0RCrQWZQqrRlrMtkdGTI3x9BLJTqTk53hprKcqBNLZgiizVQPpvQjCAi2MXsSCnkkNbvlkF8dHE9NnqBuskgSzp1BQWYnCcyQVwN0V6iPjZHFJ9f8YpRIuYHC0yrkkHfZLpJ24Y7YkjeNLrPItRJgm1UUZgeBGSI7kfRfanT5laOrKinp4Ma/LRNJg/1F2A/ZSSMXv+NR9rTS1NSGrIjBnLDUWsh7FY2DTiIEgFa5KemQYtUPLTkqXznX4ixSDsBmIF74PYy0/DdEMHdsP7dFOfMMq4sZ5IQStLFsqGg0Np/5d4vCtL1EU05PsVfxYonnr+K7cX9UfGnhFIgA5UG5QUnc3yl2fo3JIJTav0CdYUv/qxxAlPQtFnzzNn5RxwehbOGUlT3Zb8Uiw4tlMxTV3tOkXyZeQO9ZDoly2KMk5a3obmzQcn2KPUxu6uwbJ5B8hpXrnKaYrD9G/XDM9Vr/BifFgpdlzKur8ijAXXMhKm+Zo/dY31KuSAP8ylaUOV8swxvIVWIq0lcmHIP336xfxvjho8nacvx6L/iihWo/SMz+tSTDH3nLhEuL9m1nsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L07w+6b67OH6PeomouY59hRTUZErGtP0ncy78Gei8uHChSpkN6LoiYTCIyVTyc3+ovASOSA5bH3pa5cdXfgVjQgzQhPkSM5OIRBy8DBsd1LnQ75/DWuTavF7FVmScA/D2Wth5VAaR9bNdut23oXQGg6dhdQZs9Zsi7i3Ynx61XoyK5Y6sjZnrKdzj8yNAIvmcUhtJS3A47txfhgHt/qsh3cPSeJLIT4HSmmeddyFtPqrIeiJb9cVs1lQnA8lkDU21/T3B3BjAZLI/CvYX6SyM1m3qd3zq3CUNAZXbjgryV/ywjpfFK+yNyYrrkSLoX8K57GE8Ou3uBpTh9p8kts94O7RwrY5Ku7cgwEPo3NJtae9psT4TEYXvRMAcZ3YBEqdfC2aYD2HjNHSsF6Ocv7rFs+vvZHO0BztpfJrXwJcPo8ifQ6OILd0V93N5EJ6mnD7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 01:05:05.4244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2713028-fda6-4aa5-41ca-08df088e3999
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6948
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

This series adds concurrency, edge-case, and functional coverage so
GEM_CHANGE_HANDLE behavior can be validated across lifetime races,
address-space diversity, and boundary inputs before kernel-side enablement.

The ioctl is disabled for security reasons, but it also lacked a systematic
IGT testing process for corner cases and races.

To re-enable it:

1. Land working IGT tests for the corner cases and races; this series
   addresses that request.
2. Handle `idr_preload` in the kernel and kernel-internal tests; this does
   not belong in IGT.
3. Define and validate `handle == 0` semantics; this series adds the
   corresponding IGT coverage.
4. Define and validate `handle == new_handle` semantics; this series adds
   the corresponding IGT coverage.

Requirement-to-subtest mapping:

* Requirement 1 (corner cases and races): race-change-vs-close,
  race-change-vs-change, race-change-vs-prime,
  race-aggressive-change-vs-close, race-exploit-single-thread,
  race-exploit-random-handles, race-close-before-lock, object invalid race
  to random offsets, set/get race for random handles, all vmas race to
  random offsets, all ppgtt race to random offsets, and all objects race to
  random offsets.
* Requirement 2 (`idr_preload`): this is kernel/internal work and has no IGT
  subtest in this series.
* Requirement 3 (`handle == 0` semantics): invalid-object/invalid-input
  coverage in this series, including object invalid race to random offsets.
* Requirement 4 (`handle == new_handle` semantics): same-handle/no-op and
  functional rename coverage in this series, including set/get race for
  random handles.

Review feedback addressed:

* Kamil feedback: patch-by-patch buildability is maintained.
* Sebastian feedback: GEM_CHANGE_HANDLE is currently wired to
  drm_invalid_op; prerequisite IGT coverage is provided before kernel-side
  enablement.
* dmesg precondition: require_dmesg_access() prevents dmesg-based validation
  without access.
* arm64 portability: the sched_yield path avoids the x86-only pause mnemonic
  issue.
* checkpatch cleanup status: style cleanups were applied; known
  volatile-related warnings remain.

-- 
2.54.0

