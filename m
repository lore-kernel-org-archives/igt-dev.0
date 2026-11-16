Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D1606A896
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pyvf6HsQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33F810E3E6;
	Mon, 16 Nov 2026 08:13:38 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184D410E989
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 08:12:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+UokKSIsEJx8n1Zd3/BRwDHWFDZKNMxb+ZdT5AIUZPlDqgPwwyJH4SdqSxPVug7R1WWArVQ8uGQtXNXjARxtYiM26qtHpgS6jM/ZY0DDd8r9NTYwmGX0bRmmPiZS3DPe0nYWR+NIt0Q+4pD9SbS/ubWjIksj++qsj20/gLIkFHpKMF0TAs9ocUFxZBtPen3p/oJdS1xuRhaWWCsjyjLkawzcQCIb31UBlor1UCvpyFQHM77IGN5Po8sXvEclHqr6X3O41Yy13K8bKenQttCf9R3AYfgR0gRvB81kH8/OMB/KxJogpwnzu1uL5OCO/50IJEXOFUzlkT7xPeEm9FaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7inCvASdet+81ZQtUnm3yRHPtmkXB4UPrXpZVA1ks0=;
 b=lrJlgJY7ZkHFHYGhUq2q9N4yHGhGtrFVIJkeQUAkxQEmyrwj53CArwLwldNCzkGZUQk4pkSUooyOmqjS9GfJY4TJbHSBEXTJM35+5AsIn4Z/gEnl9Tlr9WWYALraa1YmoihC4fys4w6selWvydx8FIVI446Hp6rLyitayU43+O4LAlmBemSQY8FoFS4sOJYyscMsDe6TpBN8M40R4e17yOcpS8y8Q2ny7kATrcRyycQOR7aO30wJxpEDmnbcltHlTc6Xb2V5UeHvRndErXIoAlREbTHIii7TVo1Tc2wvFn3YpDmGx2OwKl83Spqn5NGm+jo24Yl2tirYPIAQSmv9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7inCvASdet+81ZQtUnm3yRHPtmkXB4UPrXpZVA1ks0=;
 b=pyvf6HsQ4hTbYa/K2rRoeX0jDV0XOMghcIg7/2YKxmos2eGDsaThAmBatpvCJFnI+fCDIsQnLSXK1M0+gELkH76zf22LvDXVNCf+KWPaP1bT0rFHIHCSjeEApTlbCk8sY4r3yEE8o4oLFjZ/iICDsZ7kIAbUy5+ZIKCXFcx6vnA=
Received: from MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::32)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:12:34 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::11) by MW4P221CA0027.outlook.office365.com
 (2603:10b6:303:8b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 08:12:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 08:12:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:12:30 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:12:28 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 0/5] tests/amdgpu/amd_replay: Fix state checks
Date: Mon, 16 Nov 2026 16:12:29 +0800
Message-ID: <20261116070248.4103604-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbae6ea-e64c-4057-52b7-08df43b95de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|11063799006|56012099006|10067099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: KvPR1dUt9GoBKlrU7xYN0bRr1jcDuvdFtRikUCA+HL+Y2HmCxcDCRr+nRa2JPRzsg/9LXvEclj47oPVN9/3sijQsPdJ3gr95anJlc/1Vs7hrMeFyOLLRN51kME9F2p1viS6dXiVXU6tOqIP7m8AZRV/BERJZcTCplAJnRt+kE5XuIKIoZmY8mVNyP51uIwkuosGoythpRW0/4tIML/aL0BsfOMFiZOJZkNNsyBVpD2o0/WyZLNwRJx0EXKGKTeCMqr9xJ0M3CJSbVtBwGbVWzBl4U1SELT/HsUWUZ+QHq70H359CqIQYLVPcl9M4emsK+bWCP0Q5ELzGs+NEAcNoVcWpciYIrTiQAXmOrHz2upQbbFe6UARZb4TI53OfNcOrWNzft+JcATVnAGapWlfOtPL9SEHi9xvNoBHlCi1rdckcboFPycXeFxYgo8ZxUcDWYfoAns6g4HvgmEDFOpmiPqCZ0ClW65Cel0yDj6CrqBD3e9N0BalshrHXBdDTAJacvDxOWODZqUlOiswnJEkyqLNfJSMJtI1hl0YWfiiZaEZIV2w5CJxm2WlJ5OlDW75ZJ2gaFJUlqU22D9PbJQZVYnJLY0svWPPWxZJ+mmPJwBmaQnIof0DbjLinWUTzObabFZ5y/cQ7TezARiBXChJeHfLoSrUBvnmRn1+5LG2g6B7WIu/fSEaA1hVyti0HHXzfFpQV43xxRczHc3y6r+yklQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O3vSwB/QJPxVuDAHGRLWRxqYZ2iBD7cy5FDNr873O9r6d7tPhlXnQRb/pEtymUonNd1WhGq2mzbljaz7n13rrrR8CdS6gP4AiCfb10C2enVstF8rDglGBLBr9OhEqNn340ZtHySx5Mas707bCPkPXbbhlHWYv8zgUVd84cIb3kXccGwyo0nZHLwXWRi5DrYVQtxDWwXXpBSCrQQcq1vH9Sb01Oq8aXORiIRxLfsfBTiuV4E6nPvh40uKkV74WFP6RlZNjPWKZ++P1amsPaIGprKoU5W3GfaddUXEv8i0iAKT335FPOZwvFdtKbL31p+y5HWO53SlWxJMIo+uiGRrQ+AIbFuxkjhgUPhiLasEFOzvviG9O9kM5S5elzWtFoq4xj+Fy1RkHVsb4Z1RrSi961As9hJv8e1oOdCybVeQl5UWmlyJmo25eLT1PI816L0Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:12:33.1554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbae6ea-e64c-4057-52b7-08df43b95de0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
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

