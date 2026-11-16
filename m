Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BF606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ltv4NxoL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FCC10E94B;
	Mon, 16 Nov 2026 02:30:50 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F9510E94E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsHCR5FnohJ6ugft+weS+OZZaTHz4vHWeN9qptT16IIVykAmqqtfjnVvC7NHlCTeyzhupCq5V7RX2fKPX/hq1jAzBG5TpBjxEYsVS5b0dFS2VcJReVioHjdREWqm2vOK+JP6J7hW8/Al4AnvVccrR44IvKLB/aA8S64bk2/UF58h1eWUtgVV1gNY3WIkPnkdnLqEuOH2wCnps92TqFtMfa+GKdi+MYgNMyfwTJoSlyq9CWSFvXGZNgyEBgidg25FU9vSck+iut5ZoYddCZOSLHG/KFLkR1HtrQEf+XYou4hwS/B3ZD0hs+sthsMOyu0O9tkBKlb2uUwayYVRAQRYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=xuiXoJyhbRxq1nsUZZdgLU0MLYvZBCzJtiGyuibUM992xSY4QIsc4jRr4Nsn9qnOUCDVU9fzppbcMRRVEIGlH/aZIkaV0Tq06gvG82IvbcyrjqdjySWog/O9J2tqnsmCUAsy77BEhXULixDbOSghUF6roZKftIsS2jYJrqK1jnrUehXm87siYjov0fxhm3sjlnAB6znLr9Q8eWd57ar/rSwITA26Lb+zRZtvK9OTBxVHN5FiuYrjQQcPFoMKYJKREyuszi7fMlujziHFHv9YvoH7RNIfok/80NPm2mtPUyMW4ZG7lGu8t5He+WeIUkMeSPUlVZ7bheCQt2RDIUebgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mEO3wsPVZ6HROeFhZc/X38elZBiuNZkxMASNZe8apI=;
 b=ltv4NxoLZKRgGNvuCTqR43shln8Jd2S4fOr1G2EnnvJSCVGnsaINx8iqaEdt9eJyOUyNZuNhh44vd6rmx5XQb/i72x+eJg5LuFQ8UBJtOk0B1TaiZROdoyt0hsqEpTS3Bi7VFWibrGBEVNJKPlEyPb+kEY3LgLA31wOLeta2Jvg=
Received: from CYXPR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:cf::20)
 by DS4PR12MB9820.namprd12.prod.outlook.com (2603:10b6:8:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:25:15 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::a0) by CYXPR02CA0014.outlook.office365.com
 (2603:10b6:930:cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 02:25:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:11 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:09 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 1/6] tests/amdgpu/amd_replay: Read DPCD at the target
 offset
Date: Mon, 16 Nov 2026 10:24:42 +0800
Message-ID: <20261116022447.3981877-2-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
References: <20261116022447.3981877-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS4PR12MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: 2964a2b0-9407-41d3-6bea-08df4388d946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: z3fwucwOWp2csmNUFdpIX6yTbjQI+5q/SshwxU7AIisYxGYdM4DR3LTyuENO/HicfteKccMsabR0nPLlsteT0muTcXRynj4FzvIirRE00Mwz6pIohhUXjNTBZlA29BKFLnCjFDRWP16y0+mIbvnm7vUr3oNh24V63RQwHH+62hs9YASTlXYVhNB6MVZ+kp1xqX6Wpfq/lIfdC5CuJ9BQFK7t6jX6LEsWZjW0tHVzN7j6DlYSzM7uvEUkUN8xqxplgy15ywY+R/fmtStN7whZHunXn32VWUGBDoP9HpO04rBcIcWgje4wStcPCmUjiVEIytSNVyL85JD2Jy/tKREXRmi2n5BQQ8Tu3CpY/V4pQ+jOJZAKAYFLkY+kuIh9PknBbbFmMW0n4OQZK3JmuBjHXvdxRKMyE4UXGDZMy4UcFt1rjLAT2mrqO3C02b8y+5a1E3f4vxZ0Dqc1QAK2ZCVpxrOadH+wgBFCWdAXLvNKDcseCI/rwBfaSxE+HOevxQsfa75PBNIOaKIn5EJLY6umtTrSKPaN44HUW+WAHFvmBQZ2WZ9B8AgQ2fXq1W/vMhNDuazjy1RUgh5zNoJTqWAbLOYJneZMN+dSBDpGIW3nHrsXTpL3TVSL8U50xHS6MnmXdycUX9YpcCY1HuPDA+Xzt8a8LLde5xLclOkGyOPUvm542BFpMlHB7IqYcn+fnY6+Io59GQ/EioOIYVpiDbmVoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zA2paggwzCnkZF3e0BKelL8eTm7qWwdzhgDmC4y7XHg9s6UIjISmRxd/vmbDe+HzNjy8l5byio3ZOV03KI0in5m/oF3h45xihbWNkPktcZfbSb/45I7ppfOO2AXhZoIEeBCO6ulgpaMfHXJH1zkEZy/HCLvlFTbdqbWAtj2YUr4VmpK44Nuz3oRqXSEWQNqjmh7B5lvby8MizjCVzWTlFDGtH8gYYlvwJqfxyaih/glyv1KSaKEW7C+j8hUVd6WA6AOW5N8Z1O7jSm4OzOK7YEMe2gQy0qO4iY7EBkhjqP7DywoxLagrzfeST7NZVgsk2gva395XamcZkQSFQa9DmTRcBoRsLtm+Gk3NSsf0KoV2D/yWGimWg5TNVJqGrMgllwBBZyPyorjYaDPVjOnXbJQvtc5GS9EzluOkq5KHa4DDMItAInHsA075gmce0WHU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:14.9411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2964a2b0-9407-41d3-6bea-08df4388d946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9820
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

A short read in dpcd_read_byte() returns a byte from the wrong offset.
Use pread() at the target offset, and drop the double close of dir_fd.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 775bed190..4640eb804 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -159,7 +159,6 @@ static bool dpcd_read_byte(int drm_fd,
 {
 	DIR *dir;
 	int dir_fd;
-	uint8_t buf[16] = {0};
 	*val = 0;
 
 	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
@@ -171,7 +170,7 @@ static bool dpcd_read_byte(int drm_fd,
 	for (;;) {
 		struct dirent *ent;
 		char path[5 + sizeof(ent->d_name)];
-		int fd, ret, i, j, k;
+		int fd, ret;
 
 		ent = readdir(dir);
 		if (!ent)
@@ -185,31 +184,17 @@ static bool dpcd_read_byte(int drm_fd,
 		fd = open(path, O_RDONLY);
 		igt_assert(fd >= 0);
 
-		k = (addr / 16) + 1;
-		j = addr % 16;
-
-		/* read 16 bytes each loop */
-		for (i = 0; i < k; i++) {
-			ret = read(fd, buf, sizeof(buf));
-			if (ret < 0)
-				break;
-			if (ret != sizeof(buf))
-				break;
-		}
+		ret = pread(fd, val, 1, addr);
 
 		close(fd);
 
+		/* closedir() also closes dir_fd */
 		closedir(dir);
-		close(dir_fd);
-
-		if (ret > 0)
-			*val = buf[j];
 
-		return (ret > 0);
+		return (ret == 1);
 	}
 
 	closedir(dir);
-	close(dir_fd);
 
 	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
 
-- 
2.43.0

