Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF863CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 23:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466AB10E3F3;
	Thu, 14 May 2026 23:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xtKHkbN+";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010018.outbound.protection.outlook.com
 [52.101.193.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3128710E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 23:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRxk1fdeDweF0SdGluXMfifeDLcDHTwU8FU2dgRnZ9Z9bl0vSBCRO0fUpY+fHSQJcYZWPUCahhhhL0E21ufszKMU1Qsodd6Q6Gbvdo3T1WAlh3LiKjlZjvxzGgWTLl/M8qbNjDjfcmYRhMl1QNM4GzC2a9nSmDt//MejYogNQtBfC7QKZQOCfSZv919NyjKaLNhNiIu7Zu057GkB8SwRWKm6RiJNHbmnXIezlLu+LkFl1+WeiDgp75V+8RTJgdh7W8mQHU3zKC+gJziJ9Q7V3rMRzjgFQmCGhLRjJThxiSh82Xg0sAdJqNXz5j/zls4AkPgxcgOAEp4stOUwLDqEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVK8tsOcNsFpM+E6ZUpX8SpcyXk4s0qFJAEKdPGjGJI=;
 b=El+qfJgxru/dDsx2sOsd9VJq6fYQWlA1V/LDEIg5PdRrzMO+VQ8S0oRXGrrzeQi0NIEN1o8md0vTxvLUmlzNOPKx2/LF5A7dvZxgk08Qoqz5hX/Q+cv8V/g6ICpyoRiEzUUipjAzTzCNjOdX80UwOzda8rMVG4WJdsyUt6ppJFfdoX5AuUqHEHXs+n9R5i52b3GiKuPncQoCyy8SPhdfxCqm5B3QgTRdPNNUKLHhTTax0/wH5Wu0YnKkXpg7IXEd3+y9NKD51nbpois3dcAnvWxCj9n9Q37tsabVv68lsVi6ijHmKGkaglO4Vwvwb3hkY+JhnpuBj3EQQtaE0HsuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVK8tsOcNsFpM+E6ZUpX8SpcyXk4s0qFJAEKdPGjGJI=;
 b=xtKHkbN+/9pPo1CmgGlNwujDMi4QOPR3ZyF1Wc+N7Un0hr3nuh+kOuwZq0pchs52kwFxxSdjo3lYQmTORjNNYsb7ighm/WTpwATgu/TUnckk7IWLaG/0H1SeyitdU5ut9NyLjBCWnc+uu3JD/R8dIAp88XkG8p/XceBQHW1GmYU=
Received: from BN1PR12CA0007.namprd12.prod.outlook.com (2603:10b6:408:e1::12)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 14 May
 2026 23:50:04 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::78) by BN1PR12CA0007.outlook.office365.com
 (2603:10b6:408:e1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 23:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 23:50:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 18:50:02 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 18:50:02 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] tests/amdgpu: Fix queue reset monitor logic and allow
 -ETIME in CS helper
Date: Thu, 14 May 2026 19:49:09 -0400
Message-ID: <20260514235000.125069-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 122406c5-ce34-414b-a99b-08deb2138534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Y7Vn0Yjas7BVMpfVPQ1eepatQ05pWaiyUNVZnmt43MBEUVavZldTo3260AMzCidfOIkvzfhUgwVsytX3mO5OuD2dQM+oihtXPneq+TlAZKUNqSN4C3SbpC+oN+XwHkJa/nJvXh24VLJ3EWvlm2L87bksG5QZaKlUYXQI9FBH5CebSO8icGlqD4g7pLlJlVJLdrOc6baHlUt7PTvGz1gUbXzyywHRsIFk3TMfqBq0vr/CZi0lIY3QY4mwn24Up7nmx3jPC9zTRR1BQnwdqzgcEBco7wmv05Bg/I9LzEXRxsN/XxnkgqQsGuS9qmropWwVmAh8f8Yim4EcqLCH78XAKvVPyISvMt/KYozRs0isqD+HtKkYVI2D0Abm7oUNmFmuOCE4doPU++LBql25yGeP1KyFMd/16cFDOravol99d1NrGMV9/i0M4tG9lyJ7kQCZGKNbe+6xWwI/FcClywzYbsCfE2CY6OyBJuQbVBc/FgTaX491qlZL4Oi/h6JlR/C2AWkKAJgTGXC9tfUNLln4gSaHl6Exu3Ag+yM6V8/rAkGvc3x+FHY3rbDKcxhgy0uvMdUyLDWshDHgI/Dshre/Rge7hYzfufdUrqo+4SrV4eSyA/dNqvKdyfAYihwPVaVCezfqC1mKEgy07qpdKUWaowSDcgqRFa9yAfX8+cwj8D6RUSgCMRDBrNmy/Inp0exHDvC7yRi8IgP72Lp2MZSuC0mmD2xcGWq8WLBASpJMLG0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(11063799003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ev3/8WapqXdtu0wgIz+IptnmWKJvP46kRtcgZ6UU0BdWLBK1FXaTNzKDWwspcCwiaRwH1ez4TtXgZDQLTVm89m/F7CmxiD6P27AgOcUlwGzCKywBJUW5ZlvMAIne4OW6B4u1gmRBEbN+74TZOaRg/kUaOwT9F1WDSFTWNxAS8yJ9QmFi4jmvcbz/MH2M6+HpiBOI1Kk8aJfIN6kGQ9C/OlqG+5vau0xTiS+CvvBt6BlB4a4Rz/wKH8Xfie4gKUYFhQ+EBN+DtLUdy4p22ApVPNPYXA+3WBtPUfDSDlVanbjZJczgIEwgTXN3/o/QVcK54JAMQJIg8pYUsg8vKd035TPpWECWZstBuvSkGxiZM3kQJOBGCwrHFaItwgaRK4xGvL8a7W9xs6EczwNmqjw2yu852BrXCxEumaVTLztH/mSHoG7r9Wm1MemI/hog2Qr1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:50:04.1713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122406c5-ce34-414b-a99b-08deb2138534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503
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

Fix two issues in queue reset testing:

1. amd_command_submission.c: Allow -ETIME as a valid return code alongside
   -ECANCELED and -ENODATA for good jobs during queue reset. After a GPU
   reset, in-flight jobs on unaffected rings may time out waiting for the
   GPU to come back, which is expected behavior.

2. amd_queue_reset.c: Fix typo in run_monitor_thread() where the condition
   used == instead of != for -ETIME comparison. The original code
   (error_code != -ECANCELED && error_code == -ETIME) would incorrectly
   treat -ETIME as a GPU reset end failure, when it should be treated
   the same as -ECANCELED (i.e., proceed to GPU reset stage).

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 2 +-
 tests/amdgpu/amd_queue_reset.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 1a5fd9446..a0777e5ae 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -143,7 +143,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 				 "expired %d PID %d\n", r, expired, getpid());
 		} else {
 			/* we allow ECANCELED or ENODATA for good jobs temporally */
-			if (r != -ECANCELED && r != -ENODATA)
+			if (r != -ECANCELED && r != -ENODATA && r != -ETIME)
 				igt_assert_eq(r, 0);
 		}
 	}
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index c770c5ee2..bed2f11db 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -668,7 +668,7 @@ run_monitor_thread(amdgpu_device_handle device, struct shmbuf *sh_mem,
 						set_reset_state(sh_mem, true, QUEUE_RESET_SET_BIT);
 						break;
 					} else {
-						if (error_code != -ECANCELED && error_code == -ETIME) {
+						if (error_code != -ECANCELED && error_code != -ETIME) {
 							set_reset_state(sh_mem, true, GPU_RESET_END_FAILURE_SET_BIT);
 							break;
 						} else {
-- 
2.54.0

