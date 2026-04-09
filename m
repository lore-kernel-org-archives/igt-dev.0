Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC10E9DE59
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 07:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898E810E2D1;
	Thu,  9 Apr 2026 07:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3BOrS4V6";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5941C10E2D1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 07:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awuAr95lkllhhnCCRzSsJoCo977/1Aw5HfB6aAwT5CZw5sqL+D7H3iPlOfF3CLIqQ82SS4HO4eLoxZ/kF+Y5/Dy+Um2GWz+Y7DZGAI1CZ8hwa1uZKBRqCAZRohfR2XJGotshJ1dEKDJZg0qEQjiKoLsYG0tQwLrHOCC5kM9zu4NakmmnbR/JGmYLrGxxLjNZVL+qGOy8w3WyXPq9OmolcEvSxk72XFwFBywAhlJ6CF6XSwCZGeMpsg0s6l6OKG34y24gwrllZMyHr8wqKQD7fSsbEgNvvWi15p/Ioo8gVvzacQnc9z5vfccH2lLgOL/Iei3A8Wbfktsf0yFp5WMZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPq0yVmZUS//NxOgn/AgV1CawOTyrJ0NqA+xRvPchBk=;
 b=fjG9pOCey3aiEUV0V0UAC6MKq5WfJwMUCJ2ylazEMzJGmqp6wdKgcfJ5vkUrm+sB2aUqOKYf/4Di4KB4ZVYGccSW2017Wp/85zepljjfLoBkJbtZ8KVERdge/NNrblfA6cqs8pgzJtf3oV2nA5NLvvfAE1aK5TE3rUPQF2o+QsBoLePyai6Z85kfaaDhN6bMHv0tZN+FQZ+5rBh+D8wJEjCCl+hIHTeD9rQ0W2aCj598HyRViTtHKIUTZvPVqAidh6di/6koQ5a+mFuP2ApUoppx7jtEFYw1XiCb2Km2gjmGyQN7uP92KKHK28ZJGmnfUdws+KlS+l8T06QqcwvVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPq0yVmZUS//NxOgn/AgV1CawOTyrJ0NqA+xRvPchBk=;
 b=3BOrS4V6RViN3v3z8wjdm9OPQablRKFcRgkFibtJDAXT2Vl2YGnLGcsygcIqyrULX74NRFxg+jiTh82M3Jc/132Me4ro2sL3pdVSk9qfD5t1y1G1AnSL7ahcw2IWwCoZxN1eXSWwfplXwaivectyiLpPDxA0uk5xfw7x3Kzj4hs=
Received: from MN2PR11CA0007.namprd11.prod.outlook.com (2603:10b6:208:23b::12)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 07:16:21 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::fc) by MN2PR11CA0007.outlook.office365.com
 (2603:10b6:208:23b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 07:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 07:16:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 9 Apr
 2026 02:16:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Apr
 2026 02:16:17 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 02:16:11 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu/queue_reset: Add test for oversize
 packet length
Date: Thu, 9 Apr 2026 15:15:49 +0800
Message-ID: <20260409071558.2658707-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260409071558.2658707-1-Jesse.Zhang@amd.com>
References: <20260409071558.2658707-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abad090-8f02-46b7-c015-08de9607e625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1yBKMrET7Sx3UCGS0crsoL8tCRIx2jO+mIJDI3pLfH0dVZ/9QoMRfwtSQNFVqKAmpepfJKDEUu6Ieo400HQv3Z00qejACFOO/QX2E4SJRYrAsK1XY32s90gy3eMhT03eSwVLYtWuCULOPOE48ngWWzneIBz328rVBIRxeTyVHeVl/AX4WPmTRBzJ6s0ntiLE35/VWXl/56lvFg1pbOTv5/lA/UohRo7usDGdIOkANGuxotQi11kjrwxXHELTb2eT6gyDGmYPPO3A6tLQJJsM88MLleoatC2FpYa0QkNWijpbwGGsDP0Mal7BQY2rWbGvkFC23ET6tfiBnay3JM5rIN9R5mZe2OntT8BkGj6on7yZKZxjZubvjOkKHB8AxjWCc23B/y+GPNkOscU67BMQlVtKjL0bHisvSTMfuwHFuPbsYZ7FYltEKVwCTi76buQ1ZuKXyxMENvy9C+ZhSVLdpCPvW6DzejAf2pU55mi4VGjFkE77qpcRDFd6C8MpDp9ryWDXI8LrGeo06FXnDxxdjAul1EdcG5VBTd3MuzncU493dxLBaBp/rKzC71SzbeeEcEJnkyfFxG3XCdgJ7rdTdJbX4MAM4dtvygfu7TDWKU+3CZ0qxUjkikJUgEULL4yDPe7PN3L0CRYECmkZCufacbt4WcjBP3CSDCp7yW2RYmBg43WEJBEtTmRGHhkxwKzB4ykxs/icPM4dZtBI8TpIBZhJ3ghTMpTxuxJtn0MPgD+2GDpY6M/CWB3ESs0sABr169THjfpmDNGnLLqjtf6RtQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lOhN7OXdgXIdiFacTM2qbKzYeBfd3MiNHFAZQiWNx+AOJ88JSqGLb2sUNJswyRbPuklEB4jjYnXZTISNR/8EnqQM3QWPYQZvkVBA0/WWAuh5cWbpzNd556kH0kMSRtG6XnfO4qzYbBZbXfebfGuB6SVgoUFFAlXJUw9DAR4873EhNqcPzjtL3apEwFQlbRYQrQ3t6b+KDBeQqop3xRdXjkYKWDlWUJQtmzvb1qEQkNhR9DeLRTjCpDmud2xN9kgFLF34AtrNG+Fgg/3ayp94Dr7SGkwY/HKfAgjurBER9mx7cYUmYkiAtPKVUXER0fOx4SvLKQn4BpeanvnBSxmAiMClZ4ErZz/znbbnKtWfZTJO5d9sSjjtDmZQaPFDyupWSUUI4EbtpQaOKEa/jM9I5Knwh547qvDAiktjw+D2hOd/eE/i4hqKQ2pO4hqb7LsF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:16:20.2939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abad090-8f02-46b7-c015-08de9607e625
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a new test case entry for CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE
to the queue reset test matrix.

Fixes 81169c743e75(tests/amdgpu: add string mapping for oversized packet length error)

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 73a99bb89..c770c5ee2 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1176,6 +1176,10 @@ int igt_main()
 				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
 				{ {FAMILY_AI, 0x32, 0xFF} },
 				{-ECANCELED, -ECANCELED, -ECANCELED }, true},
+			{CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE",
+				"Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes",
+				{ {FAMILY_AI, 0x32, 0xFF} },
+				{-ECANCELED, -ECANCELED, -ECANCELED }, true},
 			{CMD_STREAM_EXEC_INVALID_OPCODE, "CMD_STREAM_EXEC_INVALID_OPCODE",
 				"Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes",
 				{}, {-ECANCELED, -ECANCELED, -ECANCELED }, true },
-- 
2.49.0

