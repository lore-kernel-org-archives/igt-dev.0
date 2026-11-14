Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB2606A336
	for <igt-dev@archiver.kernel.org>; Sat, 14 Nov 2026 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Bdaa0FRQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BC10E4EF;
	Sat, 14 Nov 2026 02:08:06 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5333410E4EF
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 02:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxbD1xbx/4/+dW9x2ll0xCqozvU6OCboUIc9QUxbcIyFcAeG/p6sXRiq+50YUdxjm8IcXByQEw8qa2JvZmT02U/d3AXz3F+28w86jqA1IUR/gdnHjV05RivPElm0zUq+Jy79dKBpnmeOUrGqNPCsMZ3jFli1Pr7f3hQ1HAB9a9lBV1LFpy7CX3WISjf9qa/V6+8FjwB3LHSRwt4QEDRY5Gf0LEPkIStqi/vSyZflwtfeT2BILKWJUMZ2gFWxJFDkIZr4RCuoeaQ52pgFFcoWc6P4kfuBI6BLrn0jBglmRb72lKhEGfGXCMCKkNOTsKkmzVt1Z14v/PhLsgn4BouzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KAXnuKoCpRVJj5x/JX7WBrioOjDySTDcccV+r6/fMY=;
 b=w4zCEhHIg5qEEa9ANTFg9mhNvCyipP+s2Id40wjckrVZqu1qO5jHSPNIaEKVGnFokiBIFrYOEcSTEgZ9EGQAIBjwt1Lqz9znuJOceHXj9uoNPJ0xZMH2BQSRAuK6i/W/YdPdVwa/gelGhz0cX0JIg8PayQrlqpFfdOLgL+j5UHhRV4/ibBWnmObajqvi/iK5mD5/8HrS1dX8SGwXUTfWfqNlrUBykOimoW/TjQ60HCYuho5xqcVi3sm9hCkpu7GudWTUTiNgFjo2dSBm1WWj3Y2bhNzYfcQECgPBnkDkoENYNEjJeAS35KMizSTyNrbRREw5+fF5g62KnEE6OkBmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KAXnuKoCpRVJj5x/JX7WBrioOjDySTDcccV+r6/fMY=;
 b=Bdaa0FRQKIi9KAs6vgdKCreNstn5AyBjbBruueXpukKoS5zDcD8I/4D/bS81IF63rbJONydM2R9VFNCN6+b9+LUi7kjYWJo4w7WBDb2YJO13wZpuNOG1SEO1oHgjhjrhRKyKNeGPqvscCyewUS7CfqlBwnKbUm21k6LU6xqrFLU=
Received: from BN9PR03CA0750.namprd03.prod.outlook.com (2603:10b6:408:110::35)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 02:06:55 +0000
Received: from BN2PEPF0000A88F.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::6b) by BN9PR03CA0750.outlook.office365.com
 (2603:10b6:408:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 02:06:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A88F.mail.protection.outlook.com (10.167.248.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 02:06:54 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 20:06:53 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH 0/3] tests/kms_colorop: reduce test run time
Date: Fri, 13 Nov 2026 20:06:11 -0600
Message-ID: <20261114020614.830491-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88F:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 19742c18-4e61-45bc-d4c5-08df41f3f4c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|18002099003|261009223027099003|11063799006|261102123227099003|56012099006|10067099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: f+9T4WPRpYRuIH+cWEY1eL3efbcF3+vA/IqLOiuiPCgDWBkthFiH5Y9kIAjvirOJcl/Irg9ulGR+MSUc4BZpfhF4cSasm97qzqPw0Y0Y87WbHWeyWcEzcKi2OKfDZqbsPPHa3X8LzhbtuwgPveC8dsoDsO18bLfxrxQc8gSptkJHzQp0KR7iHMzq7rLfnlX9Td+Gv8f5+GbTXZ2ub+rJYMALjzDnpYyf7sp+HtisOeho9k9Jr4KksmbzXPj7weM/QMX84msCAkpizjn3Ma8VOPDEpa1gnc+/unM09yIpStWr/t+SXoepJ/fgRJapGKyZ5CpMjsddwBD+cSbOYB+nvPDQYXOJFEWs2cdz1JiMw5nvtUeMqm0rPTpwk3uo8FzivCMO1ubq3CF01y1H+lGTQb2YhPCVLxzQzeiALZp4Au/lNppjObbxL7j9H/SGwJGhiulkdMv5URqTFt4P9HI22kK3c4QLv5cSnqL80CzywMEP+PlXILkHKBZ86o/kZX7X+5hCJVDG86KJim6TLnLM2cWBcU32UOaram+Wrj2oz7F7j/X5yOD7y27exI9Tr3eDIdfq+G2YmstK7UW/afX/y7aaURMnz5HakhFHY75Yk2FzgSgSYKMHylwzIwi2sMDPdHgD3Pz1FhO08RTfWXPGC9/EcTpCNMFOHgAFkwj6gs/H+h5PUF+CV6zjRULvGfoL+ZRC5+DzQkcIBl7L2yS+VA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(261009223027099003)(11063799006)(261102123227099003)(56012099006)(10067099003)(261021123027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lK34VAGontuVtmfDjX4FkQorpQS1ST58YZBm3NOpUG6SpnvFhQKATSgDfq0iOdO+dBn3NmAivplDU3kuLHdKRnWmxUuvHkl0zvlwgFGUFlPcxEyK2JLgoKXhRc0uOY0YhOWXu/CurE9Zeni3rFs01mNM9fbn601bmLKta5uPOije6XxNxbdNY20t/HLddfx3r6jFACWQOKtpMPejMM+lOoAwXFlSm3sUQSro68L5aZh5b+2OI9hk99BP8YABcQfJSIG1W2ghUBKjTBAsfHhD9oM2Oork6sZJqadGccKOXJQ7B4/FnKDQ/vDa0hMC9nuBeAKW+bAcYhoeLMH6zcTKNdwcpZcrnKlzxiuZgHgbglSb7MhTxm40P6X0HoWBU3sdD7I/oWf9A6RyuMhFSa88TWAMEAGEJhMHC5BH+SeZa22tH7JaUC2rzxnr+hDpg4Ns
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:06:54.8601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19742c18-4e61-45bc-d4c5-08df41f3f4c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A88F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571
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

Alex Hung (3):
  tests/kms_colorop: skip early when no pipeline fits
  tests/kms_colorop: set up subtest groups on demand
  tests/kms_colorop: check writeback formats first

 tests/kms_colorop.c | 324 ++++++++++++++++++++------------------------
 1 file changed, 150 insertions(+), 174 deletions(-)

-- 
2.53.0

