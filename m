Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1F8C52D6F
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 23:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57AF10E41F;
	Tue,  6 Aug 2024 23:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bArAnBQH";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4696610E41E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 23:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG5Eu/rEPSruX1ZDfxgPj0oDdPPyj43cJwfJ4ssg/FDD9ZO5d/EAxHKkaKFLrXSZUEOgRbZ2xX0t+VwuoPl1P0CPm1A80tR2OlaAtkd4DlyZnUEKkVEGfWEJLLHwW8zsF4EwtGaOk4RNLtvAjK0TCqFA3jhTWz4Z8ev8/hqiCdUeo6semZJFg10IXOHAcjN5Z1nJDDG0h4oZJOBAQrxjO79SXupxhN2q/NC7kHGF+UZ4ol8Dzoxmi7sU1XEoEZ3laLgJoRAoSM8F7qQxIaG+9qzMl2nts0PCheVzfVrkgBZXNgYgFTReOdQBTxgR4GenC9wdEOhPx5Vu+GaRpD21mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqx4ZCfYkAxZ53r0lgbpIsGJKuz041n84oLAd9JJh0o=;
 b=ZBgD7wFRKmaXmDsVUuiBpTHuTYfFZ6mxDENQTGEhaBIuEuJWzhaT1z57Gw7yDKTH7ZkVOIo9fc/5ah+RL1/V/2fEpH0FTh0QAbd1dTD9tCWxvyU5zcLXqnHyWI91iAZEIOxHg4Ebsp6cOIV+ONt/1g4vQEZa9y/q5vU7/niazbblALQ6HHSzCP9eNCSxWl0UUBKKjj0+Uz81Hc49rV5WYsvnBd+p8bZYSKL3gufHJM5gvFGgR2FQYb9q9i1pNfx0GdApttrmzt/tUW8VXL6nViGqqMagYMpyxYW5f3rnFtF5s+ShOrvi11k5wn0BCEdQLQqMX6v83tZ+Oy9ja0fbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqx4ZCfYkAxZ53r0lgbpIsGJKuz041n84oLAd9JJh0o=;
 b=bArAnBQHtMl985ALi9kG8zPAAiKzTmpcx7jM/ojYGKPV2kE+vOitxsjCIcX5bwK0x9MTtiFC1PfSgg/rlc7mJofEiu85dVrEtK8SckBqOHu+eSPz4QbG9jjOCkZR3YP/u4nipSnmmWxWfJyhmofvjzendVmtQFxfppRHK4nVF0s=
Received: from MN2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:208:d4::34)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 23:39:35 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:d4:cafe::59) by MN2PR04CA0021.outlook.office365.com
 (2603:10b6:208:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Tue, 6 Aug 2024 23:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 6 Aug 2024 23:39:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:34 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 18:39:33 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse Zhang <jesse.zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 3/3] tests/amdgpu: move bad mem compute test to amd deadlock
Date: Tue, 6 Aug 2024 19:39:30 -0400
Message-ID: <20240806233930.344130-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806233930.344130-1-vitaly.prosyak@amd.com>
References: <20240806233930.344130-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: abb90b56-dbfe-4180-62a1-08dcb6710742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qOkQfkB3UMlAfekO3swe3YZxOa6WnLyhPmoGbucbC0uU7SPDwJPL9VauWhDm?=
 =?us-ascii?Q?flP2zbZY+0E0Zk3V/hbpbTPTbKJ76ZrMy93Kn2D4I6XvQBq8OcOc1AHR+3Y/?=
 =?us-ascii?Q?4S0UTOTPAR5QDRwlLvMRaOI7xfzIDvPVxnbWAhu6V7NFm2E5EkUXwNSgwRj3?=
 =?us-ascii?Q?/dQCCFEqvsvNsCLP+feBvqRlCUdYzn7TLX3U0jhX3DX51ksi8nA8Y2u/it5P?=
 =?us-ascii?Q?z/piCaNmq9o2EROi3+W7dkBPj3NQJAzWzgX2LE186cSaMpKXoMXYF542gh64?=
 =?us-ascii?Q?e65qsSUOGi16CdwrBzSUmgjRiKUMHKNCvHM1JJuVdig8/PoPTZX9livBpxTD?=
 =?us-ascii?Q?d8Y46QEot8rtWsvaa4+GKrwm3aTyE2YddUyYX3/jX0gidrlt4rf5jS0hbRr7?=
 =?us-ascii?Q?+H012XZumHPJANlDYU4YMbdyoxgRtIKsooGwSiNgy+H01v0aN/tLk0A03kgZ?=
 =?us-ascii?Q?Zw0qXGVriJdnVXvQ1KOc7ZXF0ORCOogbRB44dcxsNJ4M7qjbBpAKQIMUBCcM?=
 =?us-ascii?Q?ERb12A2lryDyI2KdNL2BQG2nf3hQrtyZmTXRn8lYG+IpxjK0YQruciCskIUf?=
 =?us-ascii?Q?gAbYr147v+HhGT4OydFOnfusutaONt+f3W+j6wzJ4qNJ5KgRV3OCSkeOIuRP?=
 =?us-ascii?Q?xh1Io3jEDxAx7mhmbXqKJd09wfOKEP5bNe7BE+Dpe6WhMFxtutI2QLXgXpAc?=
 =?us-ascii?Q?dokQQewf8seahIMA9WIqWp0ftQJSU5mPZ9kV5KUl9nTR1iEI4EcJT5ryvDW6?=
 =?us-ascii?Q?WoJUffG8gwOBKZ6/+cR/87A1fDO645uXIL65+wvwYEHQbFkWYHkvH6I81q9l?=
 =?us-ascii?Q?EbOL1ISjZn8u2gA07gI5JoWDz+tnzySorhKapyX1L6totNJdaRjb4PP7kLhq?=
 =?us-ascii?Q?vyKpUqVcPH8wP0ZQeIBQeuKXTUaHPJeeK8pLJO2cEJEwUtwv5GF9yvQQQOa3?=
 =?us-ascii?Q?UkjEwKDtLsggbE6a0zUfer/BR85kYLe8BTLwqZuSpqzmESlXF9RCYeZkPPf5?=
 =?us-ascii?Q?QtxslerIO885IzJGzxbCmdtsSUFh185oIqLpygY3R0gjOEQ8+CI1BD4fw10r?=
 =?us-ascii?Q?XdlU9RaTjrmdIscIiKNupzrBop/Lm80ALRJA9DOyXrhTnaoLERLcOB8QGWOA?=
 =?us-ascii?Q?9GsBRPRutilDz54Yo6ukhHNxtPnst8hW/ftk5YuH5wVIR89ipZY5tZtC8RCB?=
 =?us-ascii?Q?FmHXGlwrT+0VkyveUWnzhnSMKvEnO0lcq+angDafqK7qLv8o49nnpVzdkISZ?=
 =?us-ascii?Q?9CNCNbBXoYrmrwpxPAIhWOjm1PnFOG38iWE/+tAv9Lnh1nHRcCoEEqidIvy6?=
 =?us-ascii?Q?tsUXrBxiaxO8bj8+5a747vWCNQy890xG0/adb6dLxAXk0YY6xBTUHo/VoRHB?=
 =?us-ascii?Q?9EYMC6biXotPrPgSb+a+qAminAJjnmBa9FCbUh/ZLqHCiati/cL2Vp6BYnI0?=
 =?us-ascii?Q?cWhlB75dxjHVCD+MJZFWtO6CUINiLsEk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 23:39:34.8337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb90b56-dbfe-4180-62a1-08dcb6710742
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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

From: Jesse Zhang <jesse.zhang@amd.com>

1. Remove duplicate test case.
2. Since the bad memory test only has page faults
   and does not trigger job timeouts on mi300.
   So temporarily moved this test to amd deadlock.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index b63bced0f..04366c0bf 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -898,7 +898,6 @@ igt_main
 	unsigned int arr_err[] = {
 			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 			CMD_STREAM_EXEC_INVALID_OPCODE,
-			CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
 			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
 			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
@@ -992,7 +991,7 @@ igt_main
 	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
 	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
 	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
+	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
 	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
 	 *	}
-- 
2.25.1

