Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939B606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=37xq1oLC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324DD10E27B;
	Mon, 16 Nov 2026 07:07:11 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6CB10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 07:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmwJQLM/NCN0rDFWc7gyIphUdX/GxONF0x5Qg/ZLs4NEUQmLB06iEs/pYeh/59xALiQLzvzuZSdtB3UtmPJeDrg134GTy4/GoyOBQKvJKiaqYE1bMgqZS3Kg+uz6jmiS4+UwF9q7uSo+rrFa9SAk+EIwyFxRde0Gme7rkoJ2fQTtALK7dAhi8cAcSF+SQ+hlXqPGpKocCOmsomrukRf9CvHZUJuOt2RQYXmeEUD/YxRg6M0okJJhwqjOHDFlUX+4+PgGsasgpHBNMtyCVoPKMATPxLJE+ShHZmh3seJv2mTgVaJwjMmlrUqBLQl3tQEHjGRhNe1itKsOaFQEoHHYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPlBto2Ny24REZCJ4TXVoWYy0a1bbTX9PdqYv1lqu34=;
 b=HO4A9zbpOeK8AlWS/uO7h2bRByu7Al+N4Aj+UXhtYeM2fLIboVHrvb9KkWIleszB5uNp+DL4Rk7Zwcy0o95DbvgUayT73FmZUeADOAwTGMjDQ0s6sGGgBSBYe37hAjFGF8L7bFEGdvxTNb6ASByEv1jpMznN94wq2rKZv29DzoIrVrFWERTYd88SRtEJmdLaGWAQY780WBUYwcq2Mf6p4WlY3IiMzKG/scgyBsl4nKTOIXtU5PMlbWD4RDvFC9jHuj7c0XFYiU0h2icuZf3+scs3ZCFiywISotjprhMhippYR7OYz3dBk3PPrdTsk70oGkn+2dirqIgWyZZfiOTSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPlBto2Ny24REZCJ4TXVoWYy0a1bbTX9PdqYv1lqu34=;
 b=37xq1oLC6rsOtfkNRkxpgIw6X8JwmkyE5wo4LAOPgEtUX0ohY8474Ku7zCxYCyKLXEJUul1b70nXaP9H+LOT8Ed/cV8vhMP66t9XeuPpfDcbIq2YgAMH+o1bUsV03a3NkT+u2AgLiV/FnG+0c7wuzcYe7/eEWCtGkqbKZcNmo10=
Received: from BYAPR21CA0016.namprd21.prod.outlook.com (2603:10b6:a03:114::26)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 07:02:52 +0000
Received: from MW1PEPF00018893.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::81) by BYAPR21CA0016.outlook.office365.com
 (2603:10b6:a03:114::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.1 via Frontend Transport; Mon, 16
 Nov 2026 07:02:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018893.mail.protection.outlook.com (10.167.249.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:02:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:50 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:48 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 2/5] tests/amdgpu/amd_replay: Fix test_mode checks
Date: Mon, 16 Nov 2026 15:02:45 +0800
Message-ID: <20261116070248.4103604-3-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018893:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b49847-cb44-404f-6112-08df43afa12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: LQPop9OklUyC7gKstgbmMEIDMUvuKqM74OJeMLFVX84BVofQPX4/dwMFZ/fPeP8vle6g+G4MBa7geVTX/ty/qkFNPFAQmv9Veku2CHzhHV6hRhGPQKwJXe0oPIL88Hr1SZX9EeHoEM2i3G7fzbZF1xa0AI5kce2d0+8OuFVL+ophefSGPifgEnVg58NQLc7WdtKK+64ozcwdBYr2tYAGjSrs3IANqrgitqY+LSQzBy1y4s1UzuCGgVABWaIA+Go8BVsYue6PKcXlF/J9Q4KUa5x909HKbEf2iLFSijZPEbzHRjXOS1dpGNn6P5xvC2rjFwJEY7kTezu74MRhSEgDrAksnNUnfNkRBOT2qvxe2iJeBBQfwKh7nZLaewbi8FWaAb1+HjuxD3BjWjb6MeX73Sr1s9u0CfiYyon66NOJJnmEWKbqikLNoMZvw3RTmiJzCJ5zE94LVmNJeIApG6zUPe85G2G7A2aZc1XjRaaD9md365MuSjgTfxMxUgpkA36P/admLo/CHaXxlUMdTdDbrcDrQOYtBXSlqZpyrGbNJzx2kJ5cI+gZPpeA+suLc1pXEYSJWBeblArLr97ea/tvWGz7XbLX24idt1LTPJH5qg9MuI3vtxq9/xcVdkbmJfY15rPHi4nKaj5xCpv0mvyi5bEosciezE5+oZfA0afKjafvP54OWfV7/dQWuLAJpOzdVTp9zzx1SdHlUzSwzJ47Eg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7DdRn0xTueVbthw1/vmDEGdvQdnDHwysvuaqFbzbSXoWK9aNIQRSd+yfQJyPuEtXYfNO0UmRx0lhDimj19L63PZLqq/LkFRW+EkUL/QwQpP0IRIT8PqWuKEy7013dxWqlYAp+caMdB0THk3gCcgNjUJ9M3G1OMkN8rn+yfP7xMZDiStqMxJvEhoHGT0Lw31aHPq80LBwEZNmFh/x/gAmTQ+GwgbuqSS976MfQuANsXnrLv9TQEgdoYSsnaEZu9BrIwcF6l46H2OiBj92QXpNTitwKAFWU9XgqHqK+EBlox3VdGGWu8U6NZUSgphiGWmBACJxgSoMgwncrBxygUmi+HtXJgWD7t4DFknGvU0kbnAvf6B7N/XUSORGJv6h/7jIQOuvJcE7vjpGslpvFjTzST6VgHVHma87Fm5qeJPFtDlgYSTXX3lCYhfv+3p7cHP/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:02:51.1365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b49847-cb44-404f-6112-08df43afa12b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00018893.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913
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

