Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5753606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UOYtFe6P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653B10E94B;
	Mon, 16 Nov 2026 02:26:18 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF8510E94B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 02:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKuGg4NFruk33NAmhu7Hm+rWpbga4WDEHgxQeUzTGluLb0wgbvIjh9NapAUIfSonnLphZ0PLMxysNcBPebMeU4HLxYBZMWahh6F//UwXfMa+tW94o3lB0GKCnVE3ADJeTcNO/BxiKxV/6OeRdRkE9qJrfmz8pK64GOaovuCVO4aw3QU5obUthzxZW0D7F49/t+6dx8X3mOd5tb2Ms9l1CN7OFREL9zM2s1M5bNwDP8z+1A9lidxBY88Jw4S8VQEvSsHATWgg6UOBDjIU5woze0eKRfl+odCf83KK3Z1JdQFa+dTv/F0kMozDCqCPvryD9m4CMFfURUBT9w/PLvLSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLN2PVuLNkZVOAbLNLXjbW9PXTvzA9ULIfVetwpTzbU=;
 b=lTJGbfGZx1DCcCGN+nkL81PbKFpY0RLFkrtkWD2FDuwPQyNWhQASo3OmUmnEE75vFsYDgGssOv5MwUAjBoalJWPPOgD72ynF2/MkgU9Dyhm/a+HxGz6zZrEa1ZbSuP+zghp91azm5/nmxnqnT8+Rl1TMS4ejgjTDAw9DLGfC9HMvd4mNd+RDgdNGAe73BxwJ+4X4k2EWT0e4Z4Ml16npWlx6iz+vKPVt1XDsDYovbyAvTwUiHUlfOPI4dvlmbLARgGQ54ZWpaF8XlpbA4ZYKKuXe3n/2bbNTU5Fm1Ng5AMZQgvGVMv8ahiBzFn+9XXCmp4inzTwjdD83qfLSgCKSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLN2PVuLNkZVOAbLNLXjbW9PXTvzA9ULIfVetwpTzbU=;
 b=UOYtFe6PmwMgad3JX1EXCeHmY0ExuVHNZoYFrzy7c/71fxSgvx4b3b/arScBQuUSlG1Dcrf6IRWh7orI6ilOZhc8ux58lJ78vVrb+QSPlVvmddJlc9xDx83Me6dInsVYL6qEdvDO1aCDQw6HGMvGjExr37c29DmY5OZsZzN/1Ck=
Received: from CYXPR02CA0024.namprd02.prod.outlook.com (2603:10b6:930:cf::22)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:25:10 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::5d) by CYXPR02CA0024.outlook.office365.com
 (2603:10b6:930:cf::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 02:25:10 +0000
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
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 02:25:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 20:25:05 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 20:25:03 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v2 0/6] tests/amdgpu/amd_replay: Fix state and sink
 status checks
Date: Mon, 16 Nov 2026 10:24:41 +0800
Message-ID: <20261116022447.3981877-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: df4b8d0b-d73e-4019-20aa-08df4388d673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: lgLEfk3GJw9Ts73Ul3KUoGVf2C08wxLh3Xz5PPkbesctFfvxOuiYq3/l+BdODg7X647EEo0USIAPCpwc/V9p7Qe4yH0fW01SjgR1SkHuaQ4goVb8bB7WbjO0MEudaXAW9oL+efQmb2yy3hoW7tZppxi+Kvn8BKvL3rzLG9TIcPTRvtn7heV1PUJ247QAyvX7kNyPpv1IpxT+YNpgI19QH0DX4AoYlQYd/U1gHm7b9+L5ku408+2YlqbKU5a+HEGNAbahLfotW5GRWQPj1utzVjhI5UNi/omYgf3MPNDqcgwCI9iMow+9rvAcmkjJEXSe7JFsqFGkrImlD4VtGNSIZqzDX5Vza/QUzqEgrtLaDGCqItU8n2qBUXvETYQcSoYcI9qwlQyKNLJPB5EuofrKOzfVvhwcReimaqhNkHTr4b5k5wgUXRnw6Y6Z9wywelANBxYQLx/QhRb+Z5mCNmOtOgsxgciO6Imv9ne2UUSTJ6jGpb8T2Z5PJQXMRDrr/TlEK35HYDOZekk+xMccUImoOrorpjjkSPpSZRUoTcPH7Q/39Hq5xEBYx71wCKvvmD1lq2F03iHl0Cjxfc7cFh053qYX86y6lnBPcs7ucsiGK9kRyT3v9Jh2SwxzH7j2L+kLt0/3F/ExQz2T/XfE7Ecu2ysBGcXWQJxyrjitv6ssUnGtmPe4B+9OPsGMNmS39ZDPN9/kKdqPbj8eInUOSyzjNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ovchss2RRG4SsQ6kNUSFe9IEd/3h8fgbS2MNtlww52gBLgYXDemygNHCNrxhJxRNJPqG/YNAFXgQaJlIZnVMs5b2+86Ap3dy0u1XVpcBt6O0oEQANdxHYzlaXGmQA+ppz0ToXLVt4gkxhNoYnRj9kmw0kh1UJQi2CXksv2I6GeeHRsdEkfHyVbz8wJPfa180qGYW9sEURjrw8aeMgFOcoYLKDpshIun3Py0oFAH7BpXug2BTv0jSYFWyswazupQkl9KhpwOC0XWEvXkHm20joF+YiS3+wPf0pBiqveF6zd8FTkkunoa8l5jlix5TpLV7B7R3you6RgFBkuCRizYNKClF2nx8nd7ZGuwbESLnSy7b87MtXNEJuCZQDOllge8UgENsrxv5eXZ0ja5ZIFnNMEEYHlCJLkM5CpwnjlT6UBGit0SH6lgytELzRzC8Gwc3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:25:10.1613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df4b8d0b-d73e-4019-20aa-08df4388d673
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most checks in amd_replay can never fail. Fix them one per patch, then
check the sink Replay error status in DPCD 0x378.
Tested on an eDP panel with FreeSync Replay: all four subtests pass.

v2:
- Split into separate patches, one fix per patch (Jani)

Ray Wu (6):
  tests/amdgpu/amd_replay: Read DPCD at the target offset
  tests/amdgpu/amd_replay: Fix test_mode checks
  tests/amdgpu/amd_replay: Fix inverted Replay state range checks
  tests/amdgpu/amd_replay: Require REPLAY_STATE_3 after settle
  tests/amdgpu/amd_replay: Fail on page flip errors
  tests/amdgpu/amd_replay: Check sink Replay error status

 tests/amdgpu/amd_replay.c | 92 +++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 38 deletions(-)

-- 
2.43.0

