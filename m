Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E381C5DF71
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 06:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED1210EC52;
	Tue,  2 Jun 2026 06:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="28U+6A6J";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013055.outbound.protection.outlook.com
 [40.93.196.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E380D10EC4F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 06:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBukJ9jiIUUzkyQtiG7TyQLMK9sXwl9aQXxjUplrnKPtMf2KxNpor3PIrIj4lxKGr6scoSJ2UB8r8ZKnTo5SJLTtCEehNDFhNhc2hLzqfDBvJqBxxitrFlA+1KVfYG6ib25vMOR8ruyTQ84fSwNhWhRs/UE9HUWJrfsukIEXUXjnWfv2BhP/9m8enlStCPKBSrprnOuQVXZDz7reS1DaVA7pbg2+Cx/kH+76o+z0kOHsO45lCKIWia9puuZbP6NMEifsf3ZnFMErd5gQI1u0ZovjcaVn9m7BsvPj0hK3SdmxkKnB5qGwV2HIIfwGQJg9Xwj8dpwmFmz46xmLODtp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKp6eE9ZUEznzwx5Fyp/xlWZKNaDDPi7/oq5PheP+F0=;
 b=H2rIy6gP2++jkd1dd/8yy5F1Zh2gE+dfAVnawJoT3mRX/1Up1x4/E5Z0IYjUVaE52crFRwyc4eatplusxjqRrcdb06huHKLaFwKvg8BHijzT9TG3nDQFUzJwqwbgauODz/e0nuU1GbM095t5ReGeo1VlCMoveEdJtyMv2HvrqR1OqPSR9Q+z8vwb2nLugCI4febEzyehrw6UVOCWkbWiXAFutRajkO4kz0my23TxetRtPxhqAKaXvRGIXcQLTlwQelWSR/zmF/cCXoPX9AIegQEh0KZj377UJnmhckMpHS/Ydr+KBfCKTAt2QvJHb0zEyS5x9jErB54xuq/UMWyGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKp6eE9ZUEznzwx5Fyp/xlWZKNaDDPi7/oq5PheP+F0=;
 b=28U+6A6JHqXpzjMc6M95hkz0MjQneNMfLOC0hY6RliY88hYLqyllkM40VwUcfX+k+g5UukY9M4n7+icod/PeRWV7p3TY4cEoZ4BcZwbKRfiLfZ/WFPggd7LOhyJ/XQGufpxrjCNnb1DoXlh2FFsyeuAMtQSb1wEgo9Z5FHw4Vz8=
Received: from DS1P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::17) by
 MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 06:46:01 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:8:453:cafe::6) by DS1P223CA0006.outlook.office365.com
 (2603:10b6:8:453::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 06:46:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 06:46:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 01:45:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 01:45:50 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 2 Jun 2026 01:45:49 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 0/2] kms_cursor_legacy: avoid AMD Panel Replay
 interference
Date: Tue, 2 Jun 2026 14:41:20 +0800
Message-ID: <20260602064543.58586-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: fd2ecace-93c7-4cd5-5ae9-08dec0729be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: JPDF38t94Pzx40O8m1sbjGAcqYGGzIr5GVPkUTqYL9CckzH1PPI9JBKWbU77IIsdWLxUIMgwepY8kyqV+G1ZxQtoT9kH+78e5Q0pKqZ5Z8x6fVhEekJIeIR6KD5rFyfcsa9uoYjlMwoaCJHOoqVULjJwgZ3wxbUhla//MJojsUyF8B8EPoYxRYstfOWq4Iu6T1Z9tao60QfTOxlh8VtspIPPQCN4271idX0C+DKUfr+PHZOs7M96hkyGpvIAh7Dg3Hv6F2MGB1HIuZ4WUKPtRWJbHqQRpUq2dOhbYVzyxO4DPQeM5GueqqTx0+SHDnMWdbAF0cS+Qtqz6RrCSDl1yfdbdghj1fEB82aXFujv7DasKYqPMeU6afFOLrZjSJwUZtV4iwIWmqTxdB8LQv8kmPd2YKdv3ZdEpNnpY/jZGDq+c8ZVYkW1pRgxMtN/37H6iQSRRfnwiexSiPEC8P8EOj/Kn+ptZuZYpyJfF/HRIIAQ+wDVmtd+glivu4O11jFmdrJxjyunzXxdE+UwIUr5T4u4fI2mp7FEtsltaCmwh9xsW7tcPQHqnSP+YM2pTv7smsKA9xWKskhZGMjwqcu+KtKAOy8h28iNN8yrqAsdxBHD3owpmEebSCaq4HKnWQOt4OpTyKwISjwvMrPfmIwMrxNWBZBnp1TbFcR0gBm95RHosS+gwfCbTdjEoaHyA3rTmEOErDbqa03GFUs9JPJ3Crus/f8b/OCueQ1jgt83B0U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5KZhzEzoVHsSeOUA21vplummBvVNxwFwU128A2biGzEWrJtCifngdUGGv0MzL7dCoC13WKxiz/CBhm2onFSzAOsVSCn9nmgZge30WHwJW1WvSTt+4SAUnD5JbRr0p/RLvBUsCbg5iTSynl+fpJpMKaQn0fPbz9PEtGXbFOfsOl79Xgk7A5RfSdJLpmklb/qO8YGvAu+Eb1o6UFu5W/BjrvVfiiuah7oIVmYXqs+kGpfPcQcL25rE9EozvgVz1RRyGml38y0QYPpnwwp8RqFSAXn37jUiHIVWQ9V6XKLTCfqQ+kAp33MJsRx+KI8703IklPAcy2QN9Si+chP5YJK2oAdX2PCk03G3ngrWM35ap9NQgsycQ5hqsM4UnqnC8tiReSG2xABz8y40aMFJa05Sv4w7kppGjufoxOolzHKSd8iy+RD4MUdYcia70WAaHSZI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:46:00.6420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2ecace-93c7-4cd5-5ae9-08dec0729be2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852
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


Hi,
This patch series adds an AMD Panel Replay disable/restore step to
kms_cursor_legacy.

kms_cursor_legacy assumes cursor and concurrent plane/flip updates
commit within the same vblank. On AMD eDP, cursor updates may land in
a later vblank while Panel Replay self-refresh is active, leading to
intermittent subtest failures.

This series disallows Panel Replay entry around kms_cursor_legacy and
restores the previous state on teardown. No effect on non-amdgpu
devices or on AMD systems without Panel Replay.


Ray Wu (2):
  lib/igt_amd: add helper to disable Panel Replay on all eDPs
  tests/kms_cursor_legacy: disable AMD Panel Replay during test

 lib/igt_amd.c             | 53 +++++++++++++++++++++++++++++++++++++--
 lib/igt_amd.h             |  1 +
 tests/kms_cursor_legacy.c | 12 +++++++++
 3 files changed, 64 insertions(+), 2 deletions(-)

-- 
2.43.0

