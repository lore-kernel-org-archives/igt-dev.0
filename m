Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2AF606A330
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=sIw3I2rM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AA210EF7E;
	Mon, 16 Nov 2026 11:28:03 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDD910E190
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:25:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbYsVrEzVmHOyYasosMFKgWlcvrDLtn+S4ROr7Bn+GVN1tmRRSvhOhbYLaU/H2EuhjSFuMcp3R6TwgrO3B7WzIdpMAFMf+WGOyODbLb9NITEIWstCFU6V6IXbmPuAMVGsv4YDysRiyOqft6TVFcNKvdXtYv6ooyrQsBxc8S8TFXGXKnIvZUu52Sejk+uN7bTCn0wNUGZFxtfYLT8iWC+F6Xd4TOXfJ1RFOyuUm6+ux6YLKwa+wBXf8a9F1V6J2OI+28cwji42cGSNFpZBHblBaJvAGAbRtdl/DWo9b8K8/kBu3pUi53SvhifljYEefMwHC5XGaCgJdbvvo1nqnf4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=Ujn9VH1rQo+X47y1vQ5E+deiXJ+FAmFkei7XpUNQuxg8JB86JdBc36hbykamRRgzxzmj8u9/eyjqwdyTS9gXakWS/VGG087+FU7RTR1xZ3TxjqdfmZ7SKey0tHvPTJ4fb4tNT/xfFNXjWy/a6O/RLEUPcd48xdDVlpwnrOrnN1ZTq6GKva8/UjQkGlao8hak04FJRCX+/DlcaHXwbhJaAfpm1KG/8oSPA2tq1N3eJlhjuXuMphkEYgmsUK23sfbj3wRmqenzq6o605LLNBfKRSA5UFg0Os0NQ+yAH+cqSg9PGuT7LkZyzBwapAsYw8ab2uXe8LWP4hA87s+LZ9QrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qDXsUcuuwwwEQ6ouGkPgOIpndRNCMGHsSahPSxjc3k=;
 b=sIw3I2rMCNxUgcIr5mYZbFs5zgeIcEpgVvcCJRf7AQwxorfRODAaOKxk3gC/slMRUbog5tvts7eNObKgJMvKAmB5aNgfBcQNADoOjogq8QDb5rjKhPo3jGh9Ud2hAcCT+TC8X08UVIDI97E+5QOQayJT/8N4MXqGR8IzoQOuRI4=
Received: from CH2PR10CA0013.namprd10.prod.outlook.com (2603:10b6:610:4c::23)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 16 Nov
 2026 11:25:32 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::65) by CH2PR10CA0013.outlook.office365.com
 (2603:10b6:610:4c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 11:25:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:25:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:16:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:16:09 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:16:07 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 4/5] tests/amdgpu/amd_replay: Require REPLAY_STATE_3
 after settle
Date: Mon, 16 Nov 2026 16:16:05 +0800
Message-ID: <20261116081605.4135642-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: c114e306-2ad5-4e83-0393-08df43d45358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|261021123027099003|11063799006|261021121427099003|56012099006|261026140227099003|261026121527099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: LfHpFkpPuFy++rhfwf16mlMJYLuqXyLLhlTZkAT7vhvCrmck3LAYYz2MoofKjUbAsIpK8DOeThVPQGLGwCT44GMOmYNBjHNoyCYtjg1FMxOeD+/0PoG3h5tfkGROJzbG4vmXtZPHrBdXAMI6aef2FvEcSKs1MMIB1jNdr//wnopD3hvWm4euf4eG6YwtD7kFgtcTZRXuYhP5KrFi2xEbBi2xJ/5ZTkv268enLG5i2v/nitYyCtBYeRAKfkaA4Zku/ederqp8m7ulAUTkKBN+0xiAKuyAJ+EogMdjV4PnLvHok89Ai9CkQyl1dgjS7/ikpr+ann2UnSxk/WuXWIKWh4yTB9R3lkElFZgQbjyQdinsrm4fEpW/eFLfVFDgsDxJkEEwkb/PnMlpILLpCboiQcBtoTP+dpCUm+mR0jAudO4MMFtsTW2YrNfxye/5rn+7LenjWikqZ9eR6uq46T2a3SrxI2I/iT+Cf9qTmfLh/gHpWQfz96DXs4OqfzKNzyJaJyxlw4aYn10am5XlIBddERKcSMN+u2MQUeTE1WZO38Gm7XVkCJ3QpuRoiF1Dngm8owdnlUH4sin3e6fek2E1xihlENV7uBvuLF8qi7vvcYtKPgQ5j1TipJb+uvLmDZy7ez+H3/Au464MqA7K+SQCIUg2uzdsrXhna3/IM8qFKDvKpAUQKdicZ32IsBysvicSNZ63PwCSLncJBEmxXS9Oew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(261021123027099003)(11063799006)(261021121427099003)(56012099006)(261026140227099003)(261026121527099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EWgHL3KL5u7/BlXDIFarUvn0CUagn3J+Y8+lBvADTxantTY6L2hfi7v6x9RJXWr490Ju42I84Q4CUjON+5B4NfxQe0SHULvYCfZ2NH3XcCtdZ8HAccpQIE4MZvmYQPSceVw2z4zrW6DkpzR2NjvR8E4xgAnjmoDehFuqWkndO5rShKGgmZTEZpfhLi8Zl2Y0m492IhszxR63WC5j3PGoqI3DoOYxqActDuP/nbDieUtd14FvUEVgXW/QAdf0p7FR45Or3d+vffnKRFAtNasUbQaqxDGRpToNfM5wPgwPplZta3h+PdXCkYh/ea/QK1zQjYY7QDfFLSQ3nS2XKNmcIL1iqNlVVFrmi3ZeSEWq3UVei9VJHMh8NfSc0MqKngWSqb9jcRa8CX1nI7wfB9Qa7U2v8lOBHoWjNWIBVTi37n9/SQ4vHwKmX83N1FWxBjOm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:25:31.9989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c114e306-2ad5-4e83-0393-08df43d45358
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
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

