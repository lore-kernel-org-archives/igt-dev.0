Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E19606D7A6
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kCfyxgzp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8A10E0A9;
	Mon, 16 Nov 2026 11:25:00 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011053.outbound.protection.outlook.com
 [40.93.194.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3624010E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U68FfbEx4fMEteDJhOM0L6u1917EtfEycdHHzWW+Y1lrPL5i1j8/vU85t7smG0WojD52NKqqKY3E9Az+A4vXNQ6kK4kpBxopmG2614C7zjwLeQHhh1NjlP+FIf843UIjJ+PE/UhqTy6jfKr3Lf1mCs1GOKMTR9Ur5sOc3sGzjCs6ITP6oQyMwPkmSLmJtEORg3VG9UavnBeJqIUKaelyd0ue0j+JUcEnsnkFSiTJxL/eQ7nnMRzvnqg66PNWsnGlR1lebO4vsRqE9SND7Ei+xId8a011yRZbtA6OuC+WJR9xhsbdiO41erbd0f+j1nwanAz+TJiFWLu+I4Qldk947g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7inCvASdet+81ZQtUnm3yRHPtmkXB4UPrXpZVA1ks0=;
 b=gd5u8Tg93RFEx3ECKJEhZ4OXvV1o34PmSYV4t2P3n1VgkKbWsDutEiY/I3xBWW4hdVPn1CyWu/DaEy5fy8C2Niw8GttG3cRV4KBkDHQ2NSedMQ/KZQDCD/n8UeAQMv8+/43lFkGZbk/W6utUwlJci+mEaiOxMU7XetZOd0U7PtmkJPAgb+nEWNE9xF9bmozHDm0EgcUftnaZCqPMLCWM8LZgKvbpbKrqNzfGV0i40meiLGiLNzbF/wNshNh3z99hsUdrb5pxyiP24CRqZeagawWMq4OAkoysQuYn28dTj2S6za6D7AVWR1vbx9ScozwbgNQhA+Da5hQE/7LRXfitVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7inCvASdet+81ZQtUnm3yRHPtmkXB4UPrXpZVA1ks0=;
 b=kCfyxgzpu13VrVtrf8Bm5y3KboR4tm7ooKmZ8nBXaa3aaRKHTzjSwgT5ECPKXfqPMaey3gbEjLCG7fbDI3NP7L4ibDGu2lb6aOyDmJhPRXGs6hJOCXdS9YNyJXJihxsUabfg79Rfby59wOx517XPMZqp7ZU6Osv3wRBCIBXlJjg=
Received: from CH2PR10CA0012.namprd10.prod.outlook.com (2603:10b6:610:4c::22)
 by IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:23:49 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::27) by CH2PR10CA0012.outlook.office365.com
 (2603:10b6:610:4c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 11:23:49 +0000
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
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:23:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:46 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:44 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 0/5] tests/amdgpu/amd_replay: Fix state checks
Date: Mon, 16 Nov 2026 15:02:43 +0800
Message-ID: <20261116070248.4103604-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f699d25-1125-4612-2461-08df43d415fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|11063799006|56012099006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: Wk87/di1HqDtValC0pW9u18sPm1taKPy3nqhycsJw2LENdvybFfssneeIHn/SQD2dFK4hQ2koIEn970Ofm8ysi5kfp6bHCVFkmNt3yvhu+0Mjj1feuxqnyoAzvyVHYHpn1rCKBesFOyG58SLn1UdrDFQ/ldFNVu/3N6lquc6UfuQWkBQGwRg9iR/dR8S4EmrV6WpJ89MxyrmVs+wn4z9xKyDiSY69/55kRMOLxLf1JQtjQXPfhSIShRIKcsJ6O5LV9i4begtv8VdCBPY2++baYw67Qtc/rZVgN2GOa/EN3bJDL57tDzT6vg8NoSXX0Fd/E+vIRKVAAplSvERW3kOi9zm0OfaV1WZbgx7b+nnept+efm+1CCpSRGyUp1+IKlvvcvwdtRhtZnY0tKikKrrywrIEsFhB4nreOMXeX+L4xx6v+TwjlfUJPz/mCLIGJZD3diLfmsCClyLUmFgeLOBwupmdQhnRrbiExuXBmwB9Tlb/vAlxBTXLAENWMiV2WWMmZSMn065qCBj+hDz4ni92P18GiO2iR+7wmKKySZ5JCZU11aGjkextUUnz0feigFc25eaIs/+n2JVqWcNF7vUnFELrLoYhlvPFt+Ed2G277/fnckg4EkDzLM/1o8LVe4Q+SNDVNog6nejGy7rTi3v6VIYQjNwrtqG+7MsDmiTXcoXqOdYOm8GZGmETUT1haEAR8KI8r/ZtsA8EDC1zptFrg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: okD+nAZ8AgsnPsDbUEe+5QRm5sZSm+gWUPltSXZOSI2saF7Ayl/OWFkyTO8EzqbxisH8idcmgSo8mDAIb8eyEx3qaKZHo01mWNWf9YI48OimaE0apWnk3jRGHOD/Tnjwzx4rKGCEYDglyH37l+lsh3CAlNEQBRyGz2hr/nMUHuzucpJNZdfiO06UOGzgmCgPJ+RlagZzmYx5L4uqfU1te5id6QdbJfNoBLTjIeXRmIKgoO24eIhz+CkyLux/tUrNI+ixSCtdDad2Dgs5D6CG4k/onTLInmH0q1EGFJaJ/6Ng20+nIRcisEnhYmTOZddFwS4dUsLUnb2fWPtzwIiRILwsc+UKnEhJQzGqaf2j+Q/m1MNb+MqUSrCWjkuOpvyI+qfbByFyFzoXVI7c9As8eDntrFpt1e7uW+P5n7KTWPCvK3gzeKpQwpBaDrPsf26K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:23:49.0392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f699d25-1125-4612-2461-08df43d415fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494
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
Message-ID: <20261116070243.mH7jPNvvQoo8EHqVtZq1CO2xqaR7W2cpMINOxKd3IoI@z>

Most checks in amd_replay can never fail. Fix them one per patch.
Tested on an eDP panel with FreeSync Replay: all four subtests pass.

v3:
- Drop the DPCD 0x378 error status check

v2:
- Split into separate patches, one fix per patch (Jani)

Ray Wu (5):
  tests/amdgpu/amd_replay: Read DPCD at the target offset
  tests/amdgpu/amd_replay: Fix test_mode checks
  tests/amdgpu/amd_replay: Fix inverted Replay state range checks
  tests/amdgpu/amd_replay: Require REPLAY_STATE_3 after settle
  tests/amdgpu/amd_replay: Fail on page flip errors

 tests/amdgpu/amd_replay.c | 39 ++++++++++++---------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

-- 
2.43.0

