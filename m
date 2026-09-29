Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A655CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13F010E1AD;
	Tue, 29 Sep 2026 15:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GRhVQQZI";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010065.outbound.protection.outlook.com
 [52.101.193.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD810E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4XVFJ2Cwq3c1iRlBwXUotVwvEYWTkq/5afheQUjcVsBOMwyj+Icg33j4tbx9IfVemuy4qYfGQHV0xX9sx3LKQ8ZbBJboYSdPBf7EyUsOmhlvtanQuQEOIDpAXe9nyauZTj26IvyZCzDu4EeLuQk+d7TazjyTn+jGzPQK/PI10zqUXFkjrgZT9X/9PRRzLpNzV8TSarzz+xyKoX1SA5p/QgH3PxPbW/WIku5SfzWP+ZVe5TfzmwyxMUDwHOkxOROeABUQMeVyveC0KoTyxTqiIsKV/ibPS0iZGSVwaVtXLqPXZZX19twVKq+ubv8SCNjgJirT8cHEflphu2D3iJOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcvF+6HjqA7i4uDjRZBAiMKAj1TMyYrtwbXxIFCoRuM=;
 b=YKckgdDnQSHwPRQ/7EIMzVbMxN1ikf6ulSUHLRsen46S6m7GI3CXRgwdBAuv1WSBWwi/CXCJFFy9JsO34/3fpmqQV7ADEJoeohMcqxnSHO0qkpbQchq/oK5jOqS5KVPLT27YvcZ71Lhv0uShSvjvzhvE8iJEmdgh/QhGQef3e5g5oH6Zdxv6c6LpPnDDVoNYZPw9fOmRuFx+1tJzmCk9BmKJUb0HwH9HA2c262hId87Sb6PZxUo+/CkkfbCuOd9AwYjpOba87NU/nhFOsKMP/q3DoYxpRFpKe5goA3nkPf7dKOu86ujEcL4Uyg8Xg7HxiUOE2czdCyvu3poR6E1C9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcvF+6HjqA7i4uDjRZBAiMKAj1TMyYrtwbXxIFCoRuM=;
 b=GRhVQQZIWzAMZ7ALcoFvO4CW0QHYepRqLaIxgPHlFqcj95ZYYQaRp/YeLEBd/YjZxAI78jlRDqw4bht6K1LhiqDpuUfgpd4HNwwlt7LUUKA2AD5MTkQUx/qxf3Rnh7ebhkkQlygpXj2zPzv9ddJRYEm7M4e/JvPKtkr1UHDNKpA=
Received: from CH2PR10CA0007.namprd10.prod.outlook.com (2603:10b6:610:4c::17)
 by PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:50:06 +0000
Received: from BN2PEPF0000A805.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::3d) by CH2PR10CA0007.outlook.office365.com
 (2603:10b6:610:4c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Tue,
 29 Sep 2026 15:50:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A805.mail.protection.outlook.com (10.167.245.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:50:05 +0000
Received: from rocky (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:50:03 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v2 0/5] Preserve const qualifiers in string parsing
Date: Tue, 29 Sep 2026 11:49:45 -0400
Message-ID: <20260929154950.838280-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A805:EE_|PH8PR12MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 268f8fbc-7b6b-46f2-3280-08df1e4154c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: c3jzS1+FN4MUcp+JTQuMOmesNLKL4NhphaB+JEms7VxNnOEevhFuWzWmssABpyUilBB6r/DUCDJWLsUoEg5RYzDXiyMkpH66rAZjc9+TvH/T2wIX+5iT3f0EzMAzvXTlAiLcmD/MUNSFaX52iHJvzEZnnqpk50V8P4+c/pw5+OTrNNV5gj13Rx+BP5cI0N7RTF32l2tNk+9z9RoSRm2a058K6uO2dKY4TvCBAQOlCAfJJBTm1YRX7T/C4CZOMyTJ0NA/7qoSb/mGlfUg2inN8cacpkcsu4tQfEWc5MoI5BGso9I4jVZ29qyKerKHqJ5BmA6Z+eUDwKQ/RWtNLSJUMu9QUKeIghEBL3n87ghsdwRG5TwQ4Cs8NLn+Ggh8LaGdHFIP4/v1kVXvU4Q/jP/fyJHWj6BKMS34l+SAp94KSYoKW2zSO+qTTlj4qucKAqFRwPcU+t1uHikY+YQyrShYizgLQvA1HDxCl/VSasyNhkYPbr0u6xflNBl7cyJGd+n+LLTPlPUbqeXSQ6CKERP2AdxN16D9pKbhB6pqffS9F2BsuDpBlt29Wi9focIufQzCFUMwIQ62+B0+A9o4gzxL+5iXVr7UvbunQkCM93WkxEg7+F6wWYy54gWZ46wqpD8nsitobMFssNNwTA6e2hBzMrfcIZ6thlCjdLlqw263jtaqgPg0Cd/U7S8w/OyER310sIRsxHhiYOMha6Eg0goM9g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N19LzbrKMlNsNIo6NClc/V8p1EozBB5Nu/xo5g7KnvAVNxIbWYYcS2pZ6eVVlE4T16ZsGHVNA+3rfBNwDQosMfoqIYaoAF7m2MNqdn29XxezETTAV4M3zC3e7TUlZ8z/PFdYXy8s9GCixzBKkhDprIze4jQWWkdxYrFwEhS1ZhJWehSfIYlojge36phYceSeQpIMywlQ11WiXg5QRkQyP+1eijM/Vfje79YBNwnLsFFQry4CZwk50YsKeotpaGhjFLhY2i0DJRzDiH6fLRssRqpNKR3ADCWtMKaQ43V4ZeIg6SS/zd1GpztWLAiSPRnoVj3txWqWqIgO+xBR+9cz2Hx9hOnBN6kEHZvu2jiI7BNmFa3uBGoxGpt9oC9cexxDYvp4CM/MIDhKiR3nFCfkFAhPCrg7pwyPr7yhvrP66EyIwdDlZUe9nYx/Ex4AGnx8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:50:05.3451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268f8fbc-7b6b-46f2-3280-08df1e4154c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A805.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6939
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

On Ubuntu 26.04 with glibc 2.43, string searches on const input return
const pointers when _GNU_SOURCE is defined.
-Wdiscarded-qualifiers warnings for assignments and initializations.

Use const char * for results that are only read. Keep char * where the
buffer is modified, and use a separate end pointer for numeric parsing
where needed. These changes preserve existing parsing behavior.

The five patches cover benchmarks, tools, libraries, the Intel SSEU
test, and the MSM mapping test, in that order. Each commit message
includes a warning example with its function and source location.

Changes in v2:
- Split the two v1 patches into five focused patches.
- Include the preceding function context and source location in each
  warning example, plus OS is Ubuntu 26.04.

The code is unchanged from v1.

Alex Hung (5):
  benchmarks/gem_wsim: Preserve const qualifiers
  tools/intel_reg_spec: Preserve const qualifiers
  lib: Preserve string const qualifiers
  tests/i915_pm_sseu: Preserve const qualifiers
  tests/msm_mapping: Keep parser buffers writable

 benchmarks/gem_wsim.c      |  2 +-
 lib/i915/i915_dp.c         |  2 +-
 lib/igt_core.c             |  2 +-
 lib/igt_drm_fdinfo.c       |  7 ++++---
 lib/igt_pm.c               | 10 +++++-----
 lib/igt_pm.h               |  2 +-
 tests/intel/i915_pm_sseu.c |  8 ++++----
 tests/msm/msm_mapping.c    |  6 +++---
 tools/intel_reg_spec.c     |  7 ++++---
 9 files changed, 24 insertions(+), 22 deletions(-)

-- 
2.53.0

