Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D050CD4F52
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E110EB14;
	Tue, 19 May 2026 08:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kM0vjhiC";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3F010EB14
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEzgItHtP1F2+74Ri8XH+KO1NmkazEyeNbXOtxFm/QdmgZZTtSYmWFDC3WLlb4b/jGZKhqIAK0kIpw2AfbaWXLCgNea+LEOC1+HZTa0pWjUJbk+htMRbC97QLiZGvJU+ATQKB1rdGuEvBi+q472a3ZOW/mDFok+91ZTDnIwCv5D3juNThQJCppAGh4IJZjpCOtLEF10oW5OARaBqTXirY/OIJfthXRGlJJhqcHMi/fz9Z+0I3sPEsCLV3r6hDqHAq6oXXkGSs1Fhigro4MG2pTElH7jDXOGUIw4zJoQVNajsU37fZ1pI5E0XJeuTf4o5gEArWmoIsprZPNV+KIt6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdBs2qUibSkyUtdeI5ospzuWc+NbcKmLO2GeuO4l4Mo=;
 b=P+vja906+OkJGt+0joU5l6KxRvIOSQAWQCjRrS5+JZCKApy4TdnxvXRH8ndT+LGDTnGXbxwvHBECe8ihNiqfI9B0+uVpvdK45IJiRntqvBdtDUoJj4BqTTYjhDuGg4wvV9DgEfnRQES7TKJHHm9/FuGUHEYOaRtbYRJTah/pT3rKtxAhMxvxx8GyL5I+hG0pXuqAbdVSXFulIMjouAz+t9kmwo3F2Dj+rONbUNsy+75SW+LlQc04oIwuWZb2bwFyLkK4QGEsfEe99MzPC9ndMj0y5koUeoL3rHZt5JgrcbsBLK44eg+kCfT+m3nIxASS+3NHJ3XKfx/DUpmrwRt2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdBs2qUibSkyUtdeI5ospzuWc+NbcKmLO2GeuO4l4Mo=;
 b=kM0vjhiCOlMiRE9gaTGTiWVovs7mQi8CVoVJ8uiGdZ1M7gIO6pWUrTk6tdBYMEs4RpCBvHJPzW9iA4odGe6uy/z7HWaE4z3SHk0sejgT9qXz1ZUaLbek85pJfJNZq1nEzDp+UfHKd70r2IokKAoPmz0+airK75tn0QLJ4uuuqek=
Received: from DS7PR03CA0169.namprd03.prod.outlook.com (2603:10b6:5:3b2::24)
 by LV3PR12MB9165.namprd12.prod.outlook.com (2603:10b6:408:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 08:36:46 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::87) by DS7PR03CA0169.outlook.office365.com
 (2603:10b6:5:3b2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:36:45 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:36:42 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 0/3] Update VPE blit test
Date: Tue, 19 May 2026 16:29:02 +0800
Message-ID: <20260519082905.4077423-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|LV3PR12MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c4988a-2afb-4cec-aede-08deb581c2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|11063799006|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info: i974VxUA/BtpdecaSvP2uzsquDmoIo7w3Bt1VxIoOiimRcLKzzGUDZpHKevFUVo2sANnJ3vuZAEh0+P/mAqxNIZF3PL6xcbjg8hZ+DGuRCZ5KhxSLeGhT4oPe30FpFPaBPjOs5+jN9PHnxkgbXo64ygeuido5W4AIbSFHT0ZTmb7w+YO59eKO8f0FvPhq2I4m7qvmGUzYFU83ILy5dugd0weKRQYaGgGMBerO5PUwo+MDHGms8+SWGr/CXiOP2wFWujU8WSRziAeTz/NT7elY/1aHAC0sDRuQtyR85Ih39ckqcycXbG3vMh1MBhE5tkaHYkPaz/E4cK7UDfBjdHTJpDfzs/UKI5DA2O2HBVoqc/YU684aEBwNQDPlpl39pnIdTIFe4wn/T+cJFFEjuOAWGh3fBwPUyQ1eIfmH5tZbKOZ/TlA+TqKweIkzKIuLjviBpABq9MLDnV2j1MTBPWNNn7eKSFFKVqNYtlB+vn1DASLA3YW1k10PtZm021+Ij+fv5YaYV+ERkmGmxPmOAXHrV2zd1On+dFWLU1ZREEurKSfLh4l/nkBbdwwlsO+LDfWiha54QfhrJAKwUaW1qEacLu7wN87YKQYy8kORdf6wx8erCREzfG6bLw5H9cohRvXh6YsTwKzkYI51Q2OF78GaTQ0QHtSE1UIU2x/wQjUPo57EJfwEbk5oTM2Ap3iL8HcAxdAlgHXZBGdPZlLKYzWHe6mJc5C7OZmDx7pc3bkRSU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(11063799006)(3023799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HkeD7ulREBFI/A9F7IdN4RqKoN970/adM8IWbZSNbkbgGHFILTe2ATVmWk3CT1SwL/NB7TBfdY3BE6Vqs6ixigYl/p2iOZuK9/XlwBkQmNaX23HxcIOpXlSSOtlrSLhiQeXOzuEDX1+bcDuYsycm2ji2J4q/+XAwu+ZU6xrxxtV/0Xk5D19k8AO8MZNop9C0b7gRWmfPejywCJi9hqaEW0wIRlAOiAK59UXUCurb2QCYZ6f10ihyZiTHVczJ/Xqab8PfcOccZKf0lk2AuStL0qo4bo930O8diLxYMSUrPD/68xCjUVPellveu//RzJCVvFZe54Vb5Lu2/ecQkB/7Nd0zJbldC+TBqseydiGkwmEF1OUdjsvqfTL7w0lBY1sAZePEbs30z+ovb9krm5n3NEtZRKXTjDdOLAvmj0Qh64HOTL1Q8zh/sajGZS7H4WUv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:36:45.8272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c4988a-2afb-4cec-aede-08deb581c2ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9165
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

For new VPE2 IP, commands for old blit test are incompatible for VPE2
HW. A new test case is added for VPE2 in the first patch. A new header
file is added for placing macros and static arrays for commands, so
source file won't be flooded.

To retain compatibility for vpe blit test to work on either IP version,
a switch case is added in second patch to call testing functions
corresponding to the under testing IP.

Blit test for VPE1 is refactored in the third patch to align with coding
style and VPE2 blit test.

Caden Chien (3):
  tests/amdgpu/vpe: add VPE2 blit test
  tests/amdgpu/vpe: execute blit test corresponding to IP version
  tests/amdgpu/vpe: refactor VPE1 blit test

 tests/amdgpu/amd_vpe.c | 235 +++++++++++++++++++++++++----------
 tests/amdgpu/amd_vpe.h | 272 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 444 insertions(+), 63 deletions(-)
 create mode 100644 tests/amdgpu/amd_vpe.h

-- 
2.53.0

