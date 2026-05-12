Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A281CD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 08:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1910E17F;
	Tue, 12 May 2026 08:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ewcWhbaE";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85310E261
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 08:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7QQke/4pqNDP5H+mbSz6gVNj26QsbJ3dHH+yk+50iQpuSthySLho4J8yXXRyFmbkKOZOgIdwYcfzW+3eS/TSXFGla60NjDE0DfHH05C/1CBlErT7IOTMPvgK1rCG9jtLmf2r9IOklyceUxo8IJD/fFsAQbedDz1ZV2gS32vRvyQHhHYlJpOM7Gy4NdU+pi49rIUWG1ndNkonbqMdAQzsbIGQNwnd4a6KHighr/E7YA6oaSoEQwEttV0bdamWxTXzB/id6hl6WjPwIpdYYKWBfAYYsvuYaN8azUtBNIpgQLD/ScupjR8QxzSYhpSFdkiUj6tJXC7GcB0Bhz4ZQkOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weV1Vbc+60gVQ5/i1Ocz+lMuTK0eEGJ3b1TxWfNpilU=;
 b=NBS0ifMRLP5khIkS9yE5uS7+xpomFJWVRlck+CLyPZQ5EjEqG7h9p78DHJvx+HtV009IjXHpHBV0aM+ZGJ0wwMSqREW47FfINirtB7+b/GwBfgcXxi4M1OdkAio21rUsh0d9ib69aA0hnsVC3EQ5//GXzvInVtdqsRXYdk+R/mRuTtqM2jVtROU+rDXkIh8rSxQVjT6ReULDXbgjMoso3ka9cavGqIXbQfLENOM0J0uZ2/9wWpbT8AtgxgmUS7uEASUVZ+/lGSm5HyPE0T0okn7PkPm9clIkcCktg8G9sie5uOnfTapruyXUkg0a6v40zvNXK2iaPh/cjHlKecmx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weV1Vbc+60gVQ5/i1Ocz+lMuTK0eEGJ3b1TxWfNpilU=;
 b=ewcWhbaEOLFTU2jj1ezwb2vU+TluziILFnRRYrtJKPoDVHfq3IpDWsE/GH+zeR+Cqz45YcufwUYtGyLVoNeN39wcxF7BCKOiIVFaRp0BTdOgUtSkLz1J0OOqDItZjTdGXpc0quxNahBbhdjc4MFBARbFi7Qy59jpYIuGV2pU88U=
Received: from PH1PEPF000132EA.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2e)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:02:26 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2a01:111:f403:f912::4) by PH1PEPF000132EA.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 08:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 08:02:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 03:02:25 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 03:02:23 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t 0/2] tests/amdgpu/amd_replay: Add Replay Rate Control
 test
Date: Tue, 12 May 2026 15:59:14 +0800
Message-ID: <20260512080213.3457271-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 400652b9-a760-4c2f-cf29-08deaffcce24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: wQPAYJVuKqe1/d+LNh2w2m/aHBH2+o6rVRsKgYbsSFrY4Cfu4CvY0lm23kCrGjQ0G/5jrkW1te3gh/GpFGhz/0nmzx457LMxELESNAhdF2Lnm7wGA8dztFF6mMHSjSHpdtHfYS5Ms8yq8Ud4VutcRpGUwZMIuVWmAVqJAuxz+LNBwJvzdYRelBXM4QiPIFkiEhyWK7hK0zWyzOj0j4y4tbXKgl1P6KIo3dkrR/Knaz851RFhTQr59Kbb8BrZllKMElz/7IFqKIUenMIHjtBvU1cxrg+1veXNv0ltdhkTAjgUeio8jSywOJi1t4pCIjm78+v6j7zpMAijDMqY05Yf+XHLXvYRAZwKPKWNIzPjI/rdyMx02joAwory4t6KtYgjU5Jtyohp2/gDHjDP10048kalv4ZXAnsCROOoeZDACPQFmcwIvzKgdshnWGXA9Az5NiTXG7Vf6JMiH+sdWotrRRdr9YSXTaLextrKA960qg97eNRJTdY/yU1AuMyt3fzht9WXZ/AAs3vZgVmy3nalxfqdjEQrXjBpK9TM8yAIzUElx9AzuliyRKY2O3kWnq1YUjqqMx1r3AMJ8h7gXIx1Sq/MUuPFogOelCMKtctWW/FRThFAvWlSap0f+9zaZ+KGP/2DdNJFcdUIce5TdfhOEoLa9CDQ3GIquimJ995pDn5xIsF5vAPo7J0VVZqHX54CzRaMehsRVHxGwyhyeyiKkliKD8YQUTU5QyP0GeBrVOE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l+GZKLn3xFZtCKzMFn7Zbm8pGioESqCYgSK416ZKgNDCFR6vy6aCJKOPwhJiG7fqbFAasHAOQp8Ga34vMrCtTckiCZz+hIg0uAWPMc2eczkgqvNmOuTQ0K0AAm2I7hfFqplywwn3Ez6W33Yu2ipiP2vT7KF1mL9b6Yhcof62mQ0ySXEku4VDJPEhoKGS61P0f3YoW3mjxA0W0sPtFaZjCCsH5DDbmWl/r/GjUlPUPuaExvC0/TxdYCnZS+rSCM9PTmHWTfe4QSj18f4RXgJbUQrTfRtNb9aMIRj5arPFnIYWdC5XIQYA1+yPND+Tu6Ep/O4ldtJ/AiBta+yBw1aOk4mABWd8hTObEjeuRlXTVt8qG0xiYoTp6cgmcz/RIpy4ducCfe5SBojhUV4qszOqFUeWSVVwdPpSuQ8GDhDVEJgNZCbRd2frA6JL0yuL5NiZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:02:25.7922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400652b9-a760-4c2f-cf29-08deaffcce24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042
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

This series adds an IGT subtest for Panel Replay's rate control feature
on AMD eDP panels, and fixes a few pre-existing logic bugs in
amd_replay that were uncovered while reviewing the new test.

Panel Replay rate control extends the panel's coasting vtotal while the
screen is static (lowering refresh rate for power savings) and restores
it once live updates resume. The behaviour is observable through the
per-connector replay_coasting_vtotal debugfs node, but is currently not
exercised by IGT, so silent regressions in either the driver state
machine or the panel firmware are possible.

Patch 1 is a pure bug fix for existing replay subtests:
  - The `test_mode == (A || B)` and `test_mode == A || B` conditionals
    in page_flip_test() / run_check_replay() always evaluated truthy,
    so the guarded state checks ran regardless of test_mode.
  - Three igt_fail_on_f() range checks combined `state < N` with
    `state >= N+1` using `&&`, which can never be true; those
    assertions effectively never fired.
  - Two "mdoe" -> "mode" typos in igt_describe() strings.

Patch 2 adds the new test on top:
  - Two helpers in lib/igt_amd:
      * igt_amd_replay_support_rate_control() returns true when the
        connector's replay_capability advertises
        "Rate control support: yes".
      * igt_amd_read_replay_coasting_vtotal() reads
        replay_coasting_vtotal; returns 0 on success or -errno on
        failure.
  - A new "replay_rate_control" subtest:
      1. Drive page flips so Panel Replay engages.
      2. Wait for the screen to settle, sample static coasting vtotal.
      3. Drive page flips to put replay back into live mode, sample
         live coasting vtotal.
      4. Assert static > live (lower refresh rate while static).


Ray Wu (2):
  tests/amdgpu/amd_replay: fix operator precedence and typos
  tests/amdgpu/amd_replay: add Replay Rate Control IGT test

 lib/igt_amd.c             |  93 +++++++++++++++++++++++++++++++
 lib/igt_amd.h             |   3 +
 tests/amdgpu/amd_replay.c | 114 ++++++++++++++++++++++++++++++++++----
 3 files changed, 199 insertions(+), 11 deletions(-)

-- 
2.43.0

