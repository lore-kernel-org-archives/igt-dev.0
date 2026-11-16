Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26245606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xLg/le1g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B746110F4C5;
	Mon, 16 Nov 2026 23:06:19 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D52E10F4AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 23:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOM63upBxDRespfY+uAPzfradAF0virBbUgMyPumy/iVYLUx5gs6n45mn6+eLAMtt06D7N6kVtodH5V/F9g304YdRb0WIYR7Sh4kSYIYnzx0qB0aGyc+xbYSI+LoForq6Ogbf1ZoUV7ZyzD1wxZ3X/EWTaCLNeV0w+15kAM8VZtwm/0IMIUaQUurydaYfhI3G7m/CnHDjqEXwoR5IB2DoeQOXAzh27fZSGTbeMgVT0MiSc0by0V8wdUYRVYR+amviu7TmcZovUXX4+uMy75BdDRPYdfOBX19ZqvS8tbopl2Vd7uReijjVxLJOc14JNMB8s5yX37eak0SMglXn5NXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dElFxEbW+aMJCltcHjLo8GLxbY1TK1Tl6JngHFNabWk=;
 b=ANMiSXwZaeXlIALF4zG5souE7ugEPpoKKTaXTHqQPEmC5eyKHHbnyO9amx+rhuW83qK+opPa07s4Hyi9UwfDEkEPKZzZjYt9dNfqJVRR/0VvV8ozyiAKLEZxJ9Rc/hB3MCLZghEWbZ6rCtK+TCkktaQN83fw811Fa8+AVwG48CbSWbB+eSQPAPBQUc/7Ebou7MJfn/ok04E3rGIG+d0LbrxIoYB4jgbEQEs0og+2ON3qW692cmmTNxewU5Q2AnYb9KvXjzhlStSFTbxfzIScalQQ9elYzJOM4l8o2MvV3Mxx0f7HhVVvOEnXIeXXSL+5SWyqm1VWtp4KFexSO1StHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dElFxEbW+aMJCltcHjLo8GLxbY1TK1Tl6JngHFNabWk=;
 b=xLg/le1gNseYIYw/xQyMpUCJcOuoQe4k5SQfxQOHzrd87rGHgzeFDPPm9ccJZF0WJRnPHyGxu2ni6C5WmHsZQ+Wt/ECI2IYt5w93FnA8KU3cWi7z7e040RyoEpY7jw1zu44Yt3ovUokRR+JLhmjYuNRPuhXwGnVnd53BaIbbk70=
Received: from PH0PR07CA0111.namprd07.prod.outlook.com (2603:10b6:510:4::26)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:01:47 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::1b) by PH0PR07CA0111.outlook.office365.com
 (2603:10b6:510:4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 23:01:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:01:47 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:01:46 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v2 0/3] tests/kms_colorop: reduce test run time
Date: Mon, 16 Nov 2026 17:00:45 -0600
Message-ID: <20261116230048.2020931-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DM6PR12MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: 976110a1-34e2-40f6-7103-08df44359746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: ZllXL59kXAAVF0DzlQQS7OtAdQY+oMEKIOvO5xkmVBzgmdtxyVMokzJG0sfnlFCzUBKDczeDzpVOUZqVQm8NijBp8st4MXfqO/1paaGE75LgskF80eiQR7zE8hMZj4qaENXK3DzrO8ks24haJOmVfYyTxK4S1cGD//LZ7cKaMeAudc7XwD3Xbb9yh2Zc/g1fPuyUjBFMXHVaJ2uu/FURIGPWnYGNyI9bXovIfGsaj/a0Q9gqBlYxHTBJ8NXokWo4DLMivbPMOF9KSmdGpI5gci0ph+cBFRKG/AhzGtXNYC85xawc+LqrQ+oZl7oFB/6W42LRY4qt78n3EpAtQH+WpVUgkdrKixLl4k2f/B5lWFz9mND7QKAGwNWvHuW5Va1y7svrviYuxqivkZWMvnoZ1xgckfuJCWhfTBPMAtQch1CxumszEAwVAnV034k14Y1YjZKirnYgkwc1B3BSRRqrGjYBda+qMrlOGZhnxdfKARbhuGefn7ThgV/FPtKlAYNtazSUJ3mmPWJtHR9ncGErNd4dsWjb173wfPNqUu009ukf7is6GhNRZ6TybKGfagjZxH0Zf+iqBzZmgi8UDSgc9p0eY81DEE5Dfw1S9tvqAgYIh8DrCybiV3WAXPSR3E6+PcsVX16MKI3kvXr8iChQllgzmFY8rkZQlFHIq4UZ8fkfaLC5iF+uhca/uHeFv653CXJ9KDfgG/r0qob5Huw0OQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k2z/4ibBNqYFXlalu4VPZPY6LVpPqfbclUQRFVJwVe7DTTfURUYV58Lj6CQzrfMF9QCKbT9FUKdOD1bi29Js8Hn18MccejzsimP7ZjdVxSyx7JjP2+I3vUjPTGl2qF4yYUSV+JHdwR6EtUP9DiCXPzl36VuaOR2AeZtwQBRU/6aGvTbhAQs5rCFX4xL+Svn/Jvci8LWIyECyIGlmPin4vFOlf4EXHBq8LSXMuwcgoyplJ2zCT8tU+j05l2ADi8ZHN4H+d5l3xrlgNWxY8zfP1+XUEnF5irsmdOBgZ2AJCbEO3iqxfxWoumPmcSeiO/8vXOi9JbHbTNAbo+ujs/dk3U11DbakZv3hdGTDE2ASc2G2FvUdnS0pQjRnEtkYH9DofNODRItjJOEBCSr5iLWdCnWsJvidOpF2svwcR7nKqCb1+a0qGHg8yA7j6RLiJeCe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:01:47.0793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976110a1-34e2-40f6-7103-08df44359746
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419
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

kms_colorop spends most of its run time on setup and framebuffer
accesses rather than on the color pipeline checks themselves. This is
worst on hardware where CPU access to VRAM is slow, like DCN 3.0.

This series:
- skips subtests before touching any framebuffer when no color
  pipeline matches the requested colorops,
- sets up each subtest group on demand, so a process only pays for the
  groups whose subtests actually run,
- checks the writeback format list before creating probe framebuffers,
  and creates them once per connector instead of once per CRTC.

Run time of kms_colorop, before -> after:

  DCN 3.5: 0m11.116s -> 0m7.401s
  DCN 3.0: 3m32.316s -> 0m16.382s

Changes in v2:
- 2/3: Keep each colorop_group in static storage, as igt_subtest_f()
  returns through siglongjmp (Harry)
- 3/3: Create the probe fbs only after a primary plane supports the
  input format, so unsupported formats skip instead of failing, and
  clear the CRTC and writeback state after each probe (Harry)

Alex Hung (3):
  tests/kms_colorop: skip early when no pipeline fits
  tests/kms_colorop: set up subtest groups on demand
  tests/kms_colorop: check writeback formats first

 tests/kms_colorop.c | 349 ++++++++++++++++++++++----------------------
 1 file changed, 171 insertions(+), 178 deletions(-)

-- 
2.53.0

