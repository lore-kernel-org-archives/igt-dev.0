Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74408606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BTbZCZwC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5DD10E73D;
	Mon, 16 Nov 2026 02:27:13 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010054.outbound.protection.outlook.com
 [52.101.193.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556810E950
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:25:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX/x9ljHEn4R9d5MtScDqPYsEzxKOj89xZYas/tXl/gEMvNni7l0gKh9t12JPR/Rf+g1bLbjKk+n6FZXww2tiQ0obflVt1NANSATOnpHJIdv42kA+mVMfCaebJlmqeJAdyMSi61XH4yXkUILAN9+aU2VkEfbRTGOD9mifVcnJZHP6osTChD1D+/HBihqx/Beb/Kefj0nKKYq/qTQHIONL/EbF+iGgSHIAeHvYI+5scSJQYbJMSrvFLlI822/eopakePp0x+S5+CEkv+eW/hP0gOpasC95ign5aj/W7zb1KL2Pdjze0BrQAQFdZFL6ypoTT+Tm7aRME8At19Mozjc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPlBto2Ny24REZCJ4TXVoWYy0a1bbTX9PdqYv1lqu34=;
 b=O/syTQvXFUiVytOQhTQU5UVBpjNVx0zFof+Foq1wk24lSvgl5iHWbJ5isGDVL0vtoGPDioHK+D5/2EEI0DnuMDgwjdnw2ZviSpM0ewVPElYPFg2To6LD9IiPclmclGgv8BUY/kRRbxlnOgc2sns7v3curYlAkXJmk06jJsA/b2QIz01RN2zyk85uIf1AqZCg42CII9Z60gAPwFF2Y7W3KFDpKA1+p6ww4q8GHJ8fVFrXlA0htSvURTLywZDsEkmzhahoOnFw2jaxOBJCB95Z24ik4hQ+SbakqvbgNeIs2s5LtDg2u+Og5WX6uz1RlgbmGHLOytFOvfednkXjO02TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPlBto2Ny24REZCJ4TXVoWYy0a1bbTX9PdqYv1lqu34=;
 b=BTbZCZwCHck4jfntMc+1YUOFZ7SR6McfV4M2z3h98qZZ1E+pqvgxgW4QWmKEPYL68mjuFmiqMbukhcC2PRmEoOXFrL0/Cgo44SeTZkicSQs8pn4BHAXECt+lTPl29OOfK11UurqHDVzg99MQkI5NaMysIxkA8EKGIaRyuR0nPOY=
Received: from SA1P222CA0097.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::24)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 02:25:16 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::2) by SA1P222CA0097.outlook.office365.com
 (2603:10b6:806:35e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 02:25:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:13 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:13 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:11 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 2/6] tests/amdgpu/amd_replay: Fix test_mode checks
Date: Mon, 16 Nov 2026 10:24:43 +0800
Message-ID: <20261116022447.3981877-3-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: b7293ec9-e7ae-4c52-432b-08df4388d995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: TzHQGkF0U3Fwcwq8RDVQriWle5seL37gsgz0sLXAuzH6zmthNlTftp59aCx2sduzeZ8o46K4MoFCKcz2qFyN8FF+T7avFWHOpogdvg+KnoF4QkzwPRPsZwKgICsRQTxXqDZKH4p2dEfp0LYwpOb//6wKEWEACdpqPwY7t6O8Z1f9DSS5y5+ojL7As2a33ATkNN8Pj2ONlQAdIE3tZkyq5Ym49z9BFEtdwVG0U6OfH8JOblF2eGW15Lz7KH3fvM3P1warqXqhz5I2l+TJbN0iiEDepUJPu853i3XlynexWSnI6QbLPRtSDv/ovAw3ovANd6Wm6fyj46nt50XICGfCgWFwiAc4G/wTEWtjzBU/7s+HE3GKT8eVxkMTDjjl8IJyhu/KEnL1T/thEretkv1bek7WGv8zbjwiiXKQUmngW/bvTQVjL+4nzgtEGC/RqC2Y6uASciIKDrlwN0CF5y/ZvFTJdrzsU7iRzqCTYPMP9jL7cPnjGZEyeXPEL/kBfPq+u4UwQBrzFDbiPKLyopwb9We/h3Y6wbU1RZoafKHS9QCWVCagDY77dmlJbgKxnFjNMYsGZiqqoQ/G5oQQs0xDjUI8fEDwaXAZOK3+28iooDqLDF/v76oy52pBvjzjAAq2bnt7vAfBIRgL9MaYEZZPD3AunYbvS/cTlZKLLJMVFsWI+iVqVTzQhYA1F3l58cf16q0Ye8GFZVPhzRgrfvzvSw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vd7z7OcvBiqPIW9NXhuq0g0e/kS8zMIzxBft7Ctzj7xz50pROzzxeEOjml3WdE6PnaX/8zaAHMaBSlXAX3SGox0t+q9HkdeI9ndPr8nAC1BKVlwN58aN8ahLbwO5phpPqrAILpDp94BrsXGqGmOdSG3LLSXAxAGnLlRA9Vomb+TMLM1ec9w8r7LQ8kmIYqwfxP3p7Jw1iMns91tZNk5hH/YVTp5PQ/1k7FvZ+wZSmmEz2pEH7vzE1hMeVuEgQCG9cFOUECMd4+Y4thm5zS1vYtR4MdJfIqpvb6YO+MVLqsR9548n76b61ofdB6uEyG8VLDq4It9GBjc7UADK2jo40RRfCwGKqWIuUewscWqoKm/OgUuEEG2gk4oq7UDTjFK7jFQ+gmFeNOgCdEF3MMzKQkPyf4IUYqBIBfM1Ulrk2hPloSu8gfXW+FyjUYtzUXrG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:15.4323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7293ec9-e7ae-4c52-432b-08df4388d995
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both test_mode checks are missing "test_mode ==" on the second operand,
so constant live never checks the state during flips and the static
screen check always runs.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 4640eb804..f4dcf0d21 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -221,7 +221,7 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 		igt_require(ret == 0);
 		kmstest_wait_for_pageflip(data->fd);
 
-		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
+		if ((test_mode == TEST_MODE_CONSTANT_LIVE || test_mode == TEST_MODE_INTERMITTENT_LIVE)
 				&& frame_count > 5) {
 			/* Panel Replay state needs few frame to enter the live mode */
 			replay_state = igt_amd_read_replay_state(data->fd, output->name);
@@ -287,7 +287,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		page_flip_test(data, output, test_mode, 20);
 
 		/* Check Panel Replay state in static screen */
-		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
+		if (test_mode == TEST_MODE_STATIC_SCREEN || test_mode == TEST_MODE_INTERMITTENT_LIVE) {
 			/* Panel Replay state takes some time to settle its value on static screen */
 			sleep(1);
 
-- 
2.43.0

