Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F7606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xz816rlc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B310E94B;
	Mon, 16 Nov 2026 02:28:59 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56A810E94B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxunBbB0MrsQWrYMrxPLr1Z30zcQqHGtgOM6Bknhxg59spWaeB2U+enVSBAGq+GN4wx1C7xZatFLZpAG/yc/As5BOHXJsU36Vq8RggFtEtVC5amZmXswURJsGUOSEqqG26mXsrFEx8Ec2I7r6uKI4I697x3hTX8ETzm0OxqNVUMuexFDDikpvV4KdtgYVqJCcGCiEiXalBCRYFEnnjr4rh8im74cWROlGcApI9EoyyYDNQWcRqTqjceYr8LLYzm8zSNaUl6CW0QVq2vSsl4iYt5wuzDARXSRWustLWNlqJITBm19AElemQexgptKXURh93xvEKPJDHNDbHi+QLBCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=yXtcJEMzzSwAl70YKdV+pepSoVV8J5bOuDzPAO2FF9vNdlkO6rctSD65Ko/xdvehCFuTxFQXFK6oaTl1IjaRj6v4/d7/Wl9ex+r0TjnFB/DoWWXuCuasJ2MDO06Sy1IP/DoHTgS/eDGykEQYcqaD5QMMpG7PGl04zPgEdhzKyKQ1eMbFTqQMuIhv9M4d7BxzAP2m2VbOLzWUDLylU1LOBcqjajbNv2ua8JoSChe8Roh8/tf72aEVlKvvs60hYfT2aPNkN18BXYdxwwmteFtsIx2m0PQbsZfmY05EHhrm5M1uCWBTGGXnkV9KFBd9qSWZAKwnCHHcikjyroQymW/mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=Xz816rlcl6bVmUewtEUi93FBPcY6K0TMLiX4Ul73RGqRRHh1tkzc73zYV+4YXJJmIx8r70XHo6vmuIiojC7kSs1fgkxleBOP7JS7+qjxrPWFqpETo5TlV7geJtT63dtanat910+EXvSgdRrYS8LB+pVg71nb6EMK4229qJhFqPc=
Received: from PH8PR20CA0016.namprd20.prod.outlook.com (2603:10b6:510:23c::20)
 by LY0PR12MB461782.namprd12.prod.outlook.com (2603:10b6:404:233::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:25:28 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::f) by PH8PR20CA0016.outlook.office365.com
 (2603:10b6:510:23c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 02:25:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:17 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:16 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 4/6] tests/amdgpu/amd_replay: Require REPLAY_STATE_3
 after settle
Date: Mon, 16 Nov 2026 10:24:45 +0800
Message-ID: <20261116022447.3981877-5-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|LY0PR12MB461782:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b8233f-96cf-4dc6-6090-08df4388e0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: zg6IaJNluzTFXyYWNWBJyNfAWU7KoKuIQJy7DFpStvNH5OgPYlEPw880JLCEUeyTu7+IkJqlZVDo+4jE8JIa3MpL/KdrB2oPNgGMC54cR5sYybN2UoHg08kzb7yMp2mm+exyUanPaTQAXACvjoz0WI3jBJNRZ281Mb4E8eDFIftL3G8ArWwpqs1a2iX+LZTzznPqMvl1/ZZs4890w37KOGb3Ybjm+dZ+jYLK2UrL0M33zr0eAD7W3RYfgpQUr93kLv60h+8WQLaHbjicdg+8CHLdfmzKVMBFcFEYfi9uTjkHL55HFfxWqLd++KKdC4mo1Rl/DE1E3rvy8FN0Kg9QfxfNiMMtzjWVBASVR6bnqDbCDuOvHF9JYT6JtwW9zzxhZVMbwnwPnF/NQc/IHiSq6DJDA/gymyjSwWjrdqajBF8sPm+uKuPHOsVfoTkn6bbg39iNgrnLUeXIMXhB+e7GSrDpsLx5MmGnO+6PeGxbcaVBxTM2GNlUpUPntFjAuxujryl9BuZvAnCYBBVWaA/wxRCso9N7yah69KrhFewDagXNA+LxNbyeK2h11QsMSdWkBzbKH1DgdErW6ANt/BBSSptTUQ6DeeeA9kSwepsM5ZxheUbb0d1+BN57kdXRgw2EBUETcYIp59loTPpQyXPpAyrWIOQe6J9R+8zaOOsRZDUgPrixaD6UalB9mtos9diYybBE/wDW3DF5/TF9sQB3Pg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +cAv8cRQrJz4l6SPDhJGWUOppUFL25P/eA2J0whD3QYmhHK9dPfr9A91hXa2kqg+l5BUpTekwyM/juQ6gRoNFEosMjJiu6RGroSOxOzgSHkY3DFQH2R0C21B6Q94MCl14nRuDt3bK2itGaFmuHfVQpCo61WyAx2pGz/ukjqb4NqUEbq0UEHLDwtmjryLIiUq63zQGYjdfkwXrbM5yijzwHF1VitJtiGJ817tnPUxbGsSA49oV+Er03yOby3iGRoSNukHnegftzhfBfZkBXHnSbX7Twjuyvazu2FMJ2sPOeb3pb5NxBjOBZ09OFDUUcG1LdAuQ5MBNVmVVpG6uuZ3IoYFuCL8QKhfKSmEUp3aYpcL2DwW8CBeKPRdoTVJ8tkE92THr518a0bZ+cq5Pemi/spgjiW/bXqTB6dQADHobUP1sanPrjdGdtzoTFQG99g/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:27.5446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b8233f-96cf-4dc6-6090-08df4388e0ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB461782
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

REPLAY_STATE_2 only means Replay entry has started.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 7082df706..e73d2abf3 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -280,7 +280,7 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
 		replay_state = igt_amd_read_replay_state(data->fd, output->name);
 		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
 		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
-		igt_fail_on_f(replay_state < REPLAY_STATE_2,
+		igt_fail_on_f(replay_state < REPLAY_STATE_3,
 			 "Panel Replay was not enabled for connector %s\n", output->name);
 
 		/* Do some page flip and let the replay go into live mode */
-- 
2.43.0

