Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F547CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 15:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4344710ED61;
	Tue, 19 May 2026 15:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rzPtE7ya";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429D710ED5F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 15:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsvQhXmXrO1xkpdCUUCXkKB9utxd19A8gjlKTZn+UTOgZrhaUf1I0wD9BzvTphm7QMlsP2PD58gC1oNP6vFBySBr2MlVtGBxEg0UfZZCbOyau+YlaTs1f6bLYe7oVSeiVNeaD5U6WbDjvc9TtQAA8lMgv6u7D8t60P5NpeXCXvQ/2Vq110u6QdcN1b8clFtWFfZNTQrI2Bh8v8Ncj9rg+pkq2CrnlZEIYHzY7x0mLj7v+/0r/RyYd56L3djL1RIhYHFoOiWmizW/xZOn9O5sGWpb8mnS2dbY0v+9U43fto7llJv9I9sNqHIPS4yF7FUOxIO5XdQVQriFBP7MnTRrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SgNyNmq5hhcG36n7Yr0Rmv8JCmiYcQQGtwBLlO4Mn8=;
 b=OYJaeUwbUurRm96kmP8hxi52yH5ydKD467iLpoeQRrCtOqYXV8iZhqTfgqKSDJlPhLoc4EEV/5c9cGW4HEZZL+zd+XveRFA1pwOTw7Io01sQ8W+nRIy/5eZDs7QN34C9ARvRWFlA5S3BDXOt+oxqaUw+SU+iuk3v9Qyh7rDMENrAp9G0elGzKapIrlbNeOKSW/Z9bka9csR92TX0guJepDGcTxevoJPAuZGfxPH7fUsCKZMzXF5+UEyVgJ9StpA/cMDSjLEohotv44mZRMXQwJ968VVX7ENGtLn/5v224J2ZZwbBcIkXluwgRMGm/kTmvCXqBYoqvZeJvZwbOsm87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SgNyNmq5hhcG36n7Yr0Rmv8JCmiYcQQGtwBLlO4Mn8=;
 b=rzPtE7yaxe5O1B2hf2E4rb85MtsrugzvY6gmTKUvOrTAwZdt/vJXeKB1wNY1eycCYslho5rfcLgWE61QXMi5VnMU+xLuPqYaTQ+ZPISNU+bC1Bbo/ZlnKpwo/EDBN7MAXuuGi7KtZCKdl3mMjQPSNpbnHgzgbW7/z3ELH2ZkV7U=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by MW6PR12MB9000.namprd12.prod.outlook.com (2603:10b6:303:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Tue, 19 May
 2026 15:03:52 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::44) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 15:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 15:03:51 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 10:03:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>, 
 <swati2.sharma@intel.com>, <kamil.konieczny@linux.intel.com>,
 <jani.nikula@intel.com>
Subject: [PATCH 2/2][V5] tests/kms_hdr: Add interactive HDR verification to
 static-swap
Date: Tue, 19 May 2026 09:00:22 -0600
Message-ID: <20260519150022.3964921-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519150022.3964921-1-alex.hung@amd.com>
References: <20260519150022.3964921-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW6PR12MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff9b9a6-0e7b-4635-fb7e-08deb5b7d664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|3023799003|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gtE+mhNPH/nWODDkYY3fpytRWKV89DqFADS7oWzOxVL/l2T/3+ucLLwvfl/UAiM5DtKf6Uh6Vk9bl65107viuZU4sHllyDxgxq8UCpfQ33rzQ4X9mFbL88HHW2W8lqAHms2aYqGgGQ9hCI8M3e2s+oSIgfW0XogoFXzae+ksWvHvX/81IM/xm9tiWKUYuqps5leCCQp7iXZtbRztk4v3LiOLN/IXzno5USyJ0DvaUz6KmyZdalK3XHaImaoWpsCQ1Q6ntUUrTQXdOz7SV0B3PMQfpQy06u447B/CnCDLcxrVgJe9aCLE+ViJx9TaUwNJ731mM/A78+xT7k5T0gFZvI6IMft5GWdpyPGEqUxSLjilDLQR1eZiPWe1UxT3PoLYzpy8xgrNkO1jNT8bumy0zs0lAs7OAenlMw7wHrWo2CSVuia0wmHMA9Xdp44y/m7fjJ11nctMCzDMmBT/8DUWLfBPYyr3h7L9PzpcGLk3Fn0i3SsDzkQLKiHN3tNWrgN71YN+zSAbJ9YHu+U+e1vgVihAK31STnV/8wogfkqnKwI6cekpriAX2gEd7VI1wgTcZY8JWxzY3gUyN/L3WXwYcUgsHRub0njPNILn4N9cONjgnZJNEpFvJq/yXaspf057JPlGDHK3eWYLGt8JDQLLgWMmiSy3diTq+hwflD7hXXDF1n4UFrFS9hzntrIR+1ZvR2YpSMmATljd9sbkxa/u1QVjBE3iqMxyhB89qXMD1Gg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(3023799003)(11063799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mkn7eM0ZrcoUndn28PMRLzW7v2A88EE7WS0RK11tRbZ4roww8cXl9oQDuiuqKvcNmen7z9TpPDCC7+MaIXQbZMVFbLtRKx0kXvWAZnkfA+6bt2l+CnND8JpXpMMS+VLgiUzmyxbGn5vVgcslX/beEuCEj8zWs/np8dCsxML0uzZhSCPyB+mAnsVUguu8er74AYRo2Rlax+X3ojb7GDyhUQvbzZvmnDQQ9dV+CnqXOtLXVjUQu2YKh5wVamUu8WBZ596+iZECAW63G9TGiXFNhJt/J2yUL5BkckLwl2NLRPvFT5JOB6dR8KHj68tpVuyLs/bgvW5sK9ZYAC//MCh2m0laCEOboHKRlY57nDvEIoFQNh+384NcOxvoQ79CBR79gGZAJPnHXOjLP1rkWcL2gVf41/R8VTgkRnTrZYpvOUAdWtD5sA17QN2vhxSJbtHr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:03:51.3313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff9b9a6-0e7b-4635-fb7e-08deb5b7d664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9000
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

Add igt_debug_interactive_mode_check() for smpte2084 and
traditional-sdr in test_static_swap(). These checks are CI-safe
(no-op without --interactive-debug) and provide a Y/n prompt when
run interactively:

  kms_hdr --run-subtest static-swap --interactive-debug=smpte2084
  kms_hdr --run-subtest static-swap --interactive-debug=traditional-sdr

Assisted-by: Copilot:Claude-Opus-4.6
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_hdr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d21f1b3f8..affd38887 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -454,6 +454,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(crtc,
 				    data->output, 10);
+	igt_debug_interactive_mode_check("smpte2084",
+					 "HDR pattern displayed with SMPTE ST 2084 metadata");

 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);

@@ -483,6 +485,8 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 		igt_display_commit_atomic(display, 0, NULL);
 	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_debug_interactive_mode_check("traditional-sdr",
+					 "SDR pattern displayed with traditional SDR metadata");

 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);

--
2.43.0

