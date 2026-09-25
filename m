Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7FAC98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 19:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7008110FC1E;
	Fri, 25 Sep 2026 19:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VkuzdgoK";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6940E10E226
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 19:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtXCVyaR2CLty+mR/0CYfwOI6OkrG2ZFokBFMn3hrdGoo9Z/oAs6QK42o66+WpLFUzjKsRGvVS/aPl+wSXlgraiSELzFdhRRCi3V8tjnkasapSnyjX3BHFYQgdnXIVgPbaqm4pIcfzj0N8rZ/v3bboJThEOj+/YQ40+BWBc6c7juGvI6KdMPFutMsBg/ZJVqKahhvHCWBM2bTutZSSM+D9HFZZyh4I+V4D8JHMpwUWWhwVdFRribfiXUwGupU0kpVR37iCjKV4QXLpA3AjdSRHHWEdlZ7gswokTW3oXVGvfRYkU2qJL15VRsWeopXFIcPpsjSJv9ifkjTMiUNR9GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7nDopvjiwKB7upx4RLKU6SIldUYQ3aIgeOq4Q60eDo=;
 b=DKH+otqTO7sKahZzerEGGkXN3X2Q47pDmgBXIqgvcBUaaqOP3OIFq7h/ZsbT6ABLi+ZZP63Q9JjRqOpAn0U2A3BdXJa0GXcGQ/T3LJGDQDUBIn8pNn03slNPw8Cx4l5oFyYBS/MFY85KYVkT0FwSRVb/BmikspUuE3EPBVHNaAGGlC0qqGD60hnlQsMZT4w+lROlAI1lztQeGHBs0jMmSxK29KwqA1VB4e64xXatzS6yEVLsAXXOCTXCyM5cffNKTnIgxQcTj4KFetPEme2fFNKlGJjIfkOVhjPgHUiTIl4vCgLfPB58TWhscFwAiLLxyH6sItfOF4nx0VPkFMOTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7nDopvjiwKB7upx4RLKU6SIldUYQ3aIgeOq4Q60eDo=;
 b=VkuzdgoKbM20klOdMFHlY7cO9PiwkienkTaG1mcwAXbHLufXsDutsqTs0+OzkyS1DkZexRO0fHN+dEMzK7XLC3A1A2XWXgBf03hFQB2mUjCo7B91DrNUfZRCx6QUdJgr+mAPbZsc+MV8FNQvzipbxMImmh4leSyvPgzC2RlTkJc=
Received: from SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:36:53 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::7a) by SJ0PR03CA0104.outlook.office365.com
 (2603:10b6:a03:333::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Fri,
 25 Sep 2026 19:36:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 19:36:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 14:36:52 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 0/2] Preserve const qualifiers in string parsing
Date: Fri, 25 Sep 2026 13:36:40 -0600
Message-ID: <20260925193642.2627600-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: d773ed9c-9cf7-495b-7999-08df1b3c5a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|10067099003|6133799003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: lCAfmNf+kk3EXxrOubU1iiDTnAj7/u5YGar97dzyXP3cG0p89mwUzCku90hbZqqT7rbNiQsfOGzsuV9lIcyQwH3aoIYP5Mz44ITfXc2oCOw9OGt98vv526DhKowkuLnCneg1METAWFJJh04gozFlyvLlh9I69cFAP1eZLVT7saVhJXH46ITyJqovPrc8j1OmY+Hb9FO+H2Yow27WKgoHb+Vd1B2spdogNq0dCQ1lYvcDRxh6UvNrOxqOkmNgfFPieqNI5NQAuT9QGfJFRBUDq2nDq7i3+ua/GtAh5vLlPzza1nsUFcSNFiwH6xVbcm5zGuaJQT0JZQZxAs52Lnkc4TTOVl69n2F2cLExClyFhbNEadioTCJpHQKxxQt21uA7/jJZMIRo4hMt8fT7s6xBeuucydeUStFPPyfJim4xG14PqKWYqSgW3KTReAYO9hmf4LCDeO30vvPTlqT6am0dEhrqH2iFskP1gcD8ZQ7091IapbmxuSeLM/9Tt8tRKENsacWnFRjg9EP/C9qF34iqXU3JLvoIYNX35OQ4jeEkQIKthYeKJ5S2cQyXcHQo0a/UpJBJEB1lmEQbEMRi55Rlgz1w3fYH5G7XznHbDYkUkDLHFwe7b/5tl4O40lb1SShu9xOBLU/iMquiKRmYMKl9h7FtfyjiRTO5mmxWFb5qb8yB6iRl7hE4ewEW3NT/meoNratUcolgrEyoRvJ1ndSLWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(10067099003)(6133799003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bjK/qlg0CfW27sNYlMmaeSwSjuAOAv0M4M3t/vA00TLPysn1Y/aTKNbFNLwUhRwwTwBc8FL97DUa973X9OSOAjOmfWh3zqVE7BWp4IHe7M6prSnMYwyGffvq7UTiXHMQCihabb3bjQjybMCuP4boQkzKuBsrhPBfpx68m1gHAazJ95N14uIa3n9PrEqRWN/iabVTbskoUX5dcpP/g3H8t6jtyrLRX2M7EpTh8A9rEiThGHZSRTfdFDbuFPVMt9XOaK7x25hy1UooKEyH+8fBo+DuZgW+/Jt2lXeL1Bd3/uzNoVBHsMPSd1zKsSQibzrLSVyfxFHREli3Wy0bDkKK63+6PHDiXKW5gZI073Lcia2DzReHjx8Ei/JtDBEbTZ7B/OtUsLDHXdcQLTec95u76+oGTo/PiAnInkuyoXSslVl5+f5u7Nlr93cj73do+W1M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:36:53.2884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d773ed9c-9cf7-495b-7999-08df1b3c5a1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966
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

With glibc 2.43, string searches on const input return const pointers
when _GNU_SOURCE is defined, including in GNU11 mode. Storing these
results in char * variables triggers -Wdiscarded-qualifiers warnings
for assignments and initializations.

Use const char * for results that are only read. Keep char * where the
buffer is modified, and use a separate end pointer for numeric parsing
where needed. These changes preserve existing parsing behavior.

The first patch covers libraries and tests. The second covers benchmarks
and tools. Each commit message includes a short example of the warnings.

Alex Hung (2):
  lib/tests: Preserve string const qualifiers
  benchmarks/tools: Preserve string const qualifiers

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
2.43.0

