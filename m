Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E51C8300F
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 09:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6818510E653;
	Thu, 29 Aug 2024 09:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dsvrkZ8t";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEFE10E653
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 09:17:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+3FYE3Jk2v8gi5v0WfDa48tXqc70iMR7xsVepCTGRbSZbIxGed5fqF2Kh4amKi2OTTVnINQxENxkla1DjYMQ8Ii/1MqVas7Zifqrplv5r2/qOxgCxdSDKb4X2zeQovTQt5cZpcAAnq8TOSq1r+PcKjT2qe5x4Jv2WOwpdPXIoCA1WvUE9RmKcvPBAE86jL+4fmy0NmT497l/g5vXzzear+EG4ZUZidWZSZ5UuPa/eba59xyFRemIMavDjT6pcQUzJb6hWb9/M9Wim98Q9R6quQxoEp8e/HBmxkAIF+PeIX/keiWyvssFgLqt4uv7DnA2GYOWWmqG5N06+BHgl/YXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUEwgdr9Xt8Hz5AhiBm1wa+TscJN/bLndEmI34weIN4=;
 b=Juav2leXImnczl39fFhNLGKEsVewRYYwZ9weHKEQPbh0WbagVJDU27GfxiD4bAI4SBjsaPSaEKszPmBduYs7Jb3Ui0dKo3VzVm4d/pXkbNNLTb3/qQXWIAN2zKnKoC4WCGef+OvTQCsuVhf3nDXNZLeN+ev3krroDu+Vn60NBb2h5uwCFV92JpXozFe9NmI8oNVInKnlNwxV6QN/Y+7Wz6BYLg4EX05h81v7SMFVBacECHaYIQ8mhRZ42l1RNiw0UOJKDUuSzrtm9ubWhYh2ja+4TB537d9Hjj4lj16jUx4d8MH2lP1o5xsJtsYgy+gGZmnWK5YG66XaYKtBM8DZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUEwgdr9Xt8Hz5AhiBm1wa+TscJN/bLndEmI34weIN4=;
 b=dsvrkZ8tDx6fJ1LE21tVvcYM4j11jgN+cBTWxWClPvSUTxNpQ22gA8gJLPji81GFpBUethigHOXaU6HBg76WilOW4vX2DG8w5y4cFvny/mk8nOp9jR/7I/1cCwpXX681BaaF8wVWxphwedQqV1xB3gTmVig/ntNGcVd/Kv5dC6Q=
Received: from BN9PR03CA0062.namprd03.prod.outlook.com (2603:10b6:408:fc::7)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:17:30 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::ca) by BN9PR03CA0062.outlook.office365.com
 (2603:10b6:408:fc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 09:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Thu, 29 Aug 2024 09:17:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 04:17:29 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 29 Aug 2024 04:17:28 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amd_queue_reset: fix critical warning in queue
 reset
Date: Thu, 29 Aug 2024 17:17:27 +0800
Message-ID: <20240829091727.192798-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: e4044a97-db55-4b18-d1d1-08dcc80b688e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?obaJDhPoBaw6pEBTStKFoy5BM711JMk17LeMacJ7Oa2WVhXeBnbnrx3jwz0f?=
 =?us-ascii?Q?CIWKhD2MrDebPzBps/9YVpAEuwWozI6c2fb0p3lQ5gFP3O2L7dbu1rA88hOx?=
 =?us-ascii?Q?c1aKgtF2LW1xIZlzZUuP/tSpBaLgPH0NxiPSiJjniP4cVIu+QPFZaiB+BzIY?=
 =?us-ascii?Q?d2UaaqDZHj05hHc8xr71eMMmdzSAOzczjhlue/ssKngRKSlnKht4Lb1Y6Hl2?=
 =?us-ascii?Q?LINQp98Lv/qLwCoPOI0UryNEtbJIifLCs944thxdm2LCGyYEjRLHtjIF/+/7?=
 =?us-ascii?Q?YplX0miuCB+bpEMHQV5GWwq2WPOAv4+IPIT+H/0kDkgTni6lNoinyybWl6az?=
 =?us-ascii?Q?F3wKygI7C3AR7P4BQmNyaEz1cKVEXVeExDzdk4iMHXchGwF75rKiGn1IimEk?=
 =?us-ascii?Q?xZalkOQpRa8SAsnqvpzmp056IE1pmIxzJ5oSpvZVrKlr/SyvvJJtEjEm/hRC?=
 =?us-ascii?Q?Ucii14SlEZ5dsy3YBFPfVa0WEqlmh+sVVMMarvPfAPB86KD0giT6S41qjYhy?=
 =?us-ascii?Q?AjJhIua4UlqVHNcCIl/g3mE3ncacthB/KNfDTmCEEcaG0vrmJBfHuTjiQ6oT?=
 =?us-ascii?Q?0/CAp/ppAyPvajO8k6lhQOAErj1HWEhMqp7CYP+klKkfpCIxTRzkh11TGNw4?=
 =?us-ascii?Q?RPSi3Jwf9boumhHHmwSLQL9RoEfa4dM8/8AAVUKzGU445ydsP6X17kN5Ts83?=
 =?us-ascii?Q?kha5igvYx66tnsY6Uaiz4Ve9TTawshV2v/jZMp0VQJ3BCYaUBBBD7yB+luh4?=
 =?us-ascii?Q?1nujM0WTcjZA7WjmTZg++0fETZSmdZMlXJlyTvivzSk2ZHYcgYWrStBhPjtu?=
 =?us-ascii?Q?bAN7BW6awwSP7dqn7Dspf1sktIeBn/8h1AxPLAOc3ahCtGiEt+eNxNj7qdFu?=
 =?us-ascii?Q?YYVuFBUbHnKo4bb0mrVlgjBMjJHqlS9qzIXT4I4YKL+umKWzalUpKyHs8YB0?=
 =?us-ascii?Q?CDDA5oy6SVD8cagsrB8et3iOR5kiI+8KhzeR9zNc4+30jvZOaZXtZTEiHRBI?=
 =?us-ascii?Q?D7F6PsofVY360jFpruxwv8UTFdpj15puSXjdMTMst5bnM/+9d30QZYk8NIug?=
 =?us-ascii?Q?wKaAJXR4RovM/swDzh/7kMYelLBMyB/zObq4EUtUn0Eb0/EM2fOuYfv+/dNh?=
 =?us-ascii?Q?xn/LO7KNOAebQJZKYobTNKQRJ3FWeWT8AKoXBRJ1tNzvm3E7F8EDjdYuirvc?=
 =?us-ascii?Q?z/3ClE9aUcUycXMml/zklypSnFf943xS1o1mfQGc6IwBClLLkG4BzCwAH0D/?=
 =?us-ascii?Q?7kImiEE1NUZY5ukda3t48N1YkWIKDk1HuNeD4Gvv5VyTj1VykDKf7aE1soEt?=
 =?us-ascii?Q?HAW9CzKq2AYUs5Bd7zqwEZ8hSr60lzqgvbQE2oQqpqr0lNe4KOX6QOttTXB5?=
 =?us-ascii?Q?6IK3qIwaNjNHOA1ccYUrnf53gTymbMcSJiOw3goUyKtfIoxRsblRZ8PUAdIH?=
 =?us-ascii?Q?T1zyErxGSEvEJYAoyrcxNPvHw0UD0/yk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:17:30.1809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4044a97-db55-4b18-d1d1-08dcc80b688e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256
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

When queue reset is run with the subtest parameter, a critical warning will be reported. For example:
run the command: sudo ./tests/amdgpu/amd_queue_reset --run-subtest amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
the warnning is:
(amd_queue_reset:71723) igt_core-CRITICAL: Unknown subtest: amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
Subtest amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH: SUCCESS (9.771s)
(amd_queue_reset:71722) igt_core-CRITICAL: Unknown subtest: amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH
(amd_queue_reset:71721) igt_core-CRITICAL: Unknown subtest: amdgpu-GFX-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH

Because it has three processes (backgroud, monitor, test), not including subtest.
So when these three processes exit, the variable igt_exit_called needs to be masked to skip the warning report.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/igt_core.h                 | 2 +-
 tests/amdgpu/amd_queue_reset.c | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 06c5314bf..5b4f41504 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1225,7 +1225,7 @@ void igt_skip_on_simulation(void);
 
 extern const char *igt_interactive_debug;
 extern bool igt_skip_crc_compare;
-
+extern bool igt_exit_called;
 /**
  * igt_log_level:
  * @IGT_LOG_DEBUG: debug information, not printed by default
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 8482a371d..414677861 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -759,7 +759,8 @@ run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_handle,
 			*monitor_child = getppid();
 			run_monitor_child(device, arr_context_handle, sh_mem, num_of_tests);
 				igt_success();
-				igt_exit();
+				igt_exit_called = true;
+				exit(0);
 		}
 		*test_child = fork();
 		if (*test_child == -1) {
@@ -768,13 +769,15 @@ run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_handle,
 			*test_child = getppid();
 			run_test_child(device, arr_context_handle, sh_mem, num_of_tests, version);
 			igt_success();
-			igt_exit();
+			igt_exit_called = true;
+			exit(0);
 
 		}
 	} else if (process == PROCESS_BACKGROUND) {
 		run_background(device, sh_mem, num_of_tests);
 		igt_success();
-		igt_exit();
+		igt_exit_called = true;
+		exit(0);
 	}
 	return 0;
 }
-- 
2.25.1

