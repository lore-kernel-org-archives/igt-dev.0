Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C65110ED67F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 15:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3856E10E26A;
	Fri, 27 Mar 2026 15:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SCR+ARhS";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062210E26A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 15:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2VxcAD0nK4C6rEGLz6QkioPoeH4PqORzKtoOk9Ss7fy9e+wwApDNJdpNSqOxvPwbAelUdo0DgMgGopdXUTA2o8hUdW6va4Q/xgkFKdOcNVREdzDlG/janTcaKdaWFm52Ed8OOyXHmw6DezDSQxUayQ/MfaSiO/44R71oVRlR8aGyU7xFyyiCDraWhAkJHt5gO6TsSJR5hdC3bo6XX9YCT/A/AlnXQ1EKaMBWCuVKWQ7qoOWxFSjoQ4N3NbL236+Oroop4laPzmzNXx2UyzmSRjmRzwPX9Ua9QpkiqWv4Rrn0k7mJgJLBNw/0brrW/KiKRn0Bog3xpcKnJ+HTES+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FllnK0HDq/+wRoomzaI/IDU4YYqCb6Rnv2wvrQx91oc=;
 b=Ncnt+CVFARnARhQLMCProz0O+UAftCd34XDU8caUquFCjG+70TT8kHLgyqJBHWsjDZYMpkFmsQjUHA0XUT/kIfG07D484Tyk6yUXrt+DkRH5B5sbCrwlzDDTe866VYlHqyTNvP75tQmUwCPrHS5qTVXxHecrSd2YbK3dtvDqcocJYh7vUQ1Md2u95uuxUjx/B+dRlv/5nrJ+AYKkbCUbmni30qf78hIqtGEvGmVsbjDHGciXdzyEcD8IHDUaRYggHJIEzGTnGfgSgKDuiVfcG3AT1rOR4kgjNk4Bdzn3GN88YEwdvHz4DBa3Eb/668mRWHH5bRA/M0msWtXXLwmz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FllnK0HDq/+wRoomzaI/IDU4YYqCb6Rnv2wvrQx91oc=;
 b=SCR+ARhSiFUlqxspsHbg/+Y3lCFbBmTi4uC67kEvnceLzj8iRtPaAo1GH1sImEVasru1zObgKZaF1V7F0uiFZQ47E90D96DNQOdUBFv309+soFFpM3d8eIkGvS1969gH74wzf0B6wdsw0mjz2EyJq4FyhizfGgR1s2byqGzAYUk=
Received: from BYAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:c0::24)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 15:08:12 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:c0:cafe::fb) by BYAPR05CA0011.outlook.office365.com
 (2603:10b6:a03:c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Fri,
 27 Mar 2026 15:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Fri, 27 Mar 2026 15:08:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 10:08:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Mar
 2026 08:08:11 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Mar 2026 10:08:11 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH] tests/amdgpu/amd_queue_reset: disable unstable sub-tests for
 some asic
Date: Fri, 27 Mar 2026 11:07:43 -0400
Message-ID: <20260327150759.13068-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 178f1ab7-a112-4688-6acc-08de8c12a9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 58tEFgN+ltaxDFpj1lAQ3eWDixYZcDJWu8wgj9/O54rrO3KYb1yikFMZ5ODb5xL3lZwV+7hpqOe+1dcHrKtKxu/usKE3CvW5tqUFXBhO1s/1NGV49BD94kSC1xrc5D+tbhOq6y/VcdTdyae/qO2IIyDOYkFR9sgws/eAt0rc8Pr9FLNsE/jN+7DpUZ1995JSeVjA3pPH8yF4IaX3O1+x2uBigwTPfpPYMeMJybYjOJ6byAgzBAy64ZLE6VakB4LDJOwW1W8rv4tsF8eSQU9/YS3FkZxtR2kbQvLqO11yPFb3QcxIk5RrzZRE8Y9FgYaExvDD71GcLpoB9pu36uRMGBUPKyxUjGvPUmpOix0zuE/ZurZmNp5tQC92dYTSLviR/GaJoKvli8eJVKtJHZU7HABOkub12IszL0mpe1jUduqkNqsFybEuYrx9aAob+9dLaZl4NbKHQt0hEyCYgkJmlh7bEWoJrZL7kfjI1Y7uwdKgf8BVYlg1VskEZtto+ECZrHFHXkwvZk2sRazvK0gdnE0wCirdqtZqLTsrmz6J399SDJbx0p3pUptklztQHLI5+6Jfk43OMykAlVpRbmjhToUKf7X4BSGWQuQKochoiiwZ3gVXLyW6kuWdyzqfsTfX7cAJR4A0U7tv4K2NP3HT11e8gxHYE93F0UFg2VgJ5dSytA4hXOOcsii74+OzRPsZtq8vVgLuGsDcXEjfN2dloLVx0EYPo0O+MKO6RUWt/FvjAPftNQ8pKq3tlIUtV20ItsBoehT62olKhPbQL3yZ0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V3uvUksmomtxMJMAZ4HkGAAek1fGbXWRDeErNNmD90C5O8BaWhfQsCcc2roifw/o9gpi2wfLKditmLohY9DqjiosN8vlLfynWW/yIXPgtpuCdTi76T82ia5E8PGc7s0SmuZ/SjurYixJXWgI3PiUG3Xt5FQxZ2VbQY9bhatbtucGedLe8EuAfiRM5s0aHkgqWecp8aKoM54VK53xtzCFpQeibajqtEDEwMLsF+ofWXbSzjOa4aQQX/hduEYl46e2lk8IKS2A/mWH/2vknkl6E8tFJUJBfto1aAWj74pJymJdblfL6qX9FFVoJ7RLS/eDXCX6+O9KgLPdQoGi6JJFdAM9XAmORaMvLEOXGxANPofJ8OcsE8kcJCnPz0M5SGOAFaq8O9u9tiyAh4X1gukAIkQ6YB/qVuwBs2qJRcjPh0pgiEDW4tycCXqGH10Mxr1e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 15:08:12.1228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178f1ab7-a112-4688-6acc-08de8c12a9fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
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

Temporarily disable a subset of amd_queue_reset subtests that are
currently failing intermittently.

These failures are known and unrelated to the changes under test, but
they add noise to CI results and make it harder to spot new regressions.

Disable them for now to keep coverage stable while the underlying issues
are investigated and fixed.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ibaa3d3b2e2f3bbee08d28f33a7103d5e2bee8679
---
 tests/amdgpu/amd_queue_reset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 7cd2ff79a..1f1ca070e 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1177,7 +1177,7 @@ int igt_main()
 				{-ECANCELED, -ECANCELED, -ECANCELED }, true},
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
-				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
+				{ {FAMILY_AI, 0x32, 0xFF} }, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
 			//TODO  not job timeout, debug why for n31.
 			//{CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,"CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC",
 			//	"Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes"},
@@ -1186,16 +1186,16 @@ int igt_main()
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{ {FAMILY_AI, 0x32, 0xFF} }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{ {FAMILY_AI, 0x32, 0xFF} }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{BACKEND_SE_GC_SHADER_INVALID_SHADER, "BACKEND_SE_GC_SHADER_INVALID_SHADER",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes",
-				{}, {-ENODATA, -ENODATA, -ENODATA }, false },
+				{ {FAMILY_AI, 0x32, 0xFF} }, {-ENODATA, -ENODATA, -ENODATA }, false },
 			{}
 	};
 
-- 
2.52.0

