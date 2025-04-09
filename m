Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B91C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ECA10E7F6;
	Wed,  9 Apr 2025 07:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eAamF/fP";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841C710E7F6
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0CwMiYRp9b/9oVnt/NhsksjJcMK5cvXqmZxPsVplVPy//jwtBxZWZvofOHySx0qCMvbz9akOQoDUDoelqujvTIaURoo6/Vrj4eKJyF3EJKSIUWvbvGomyDN4kXZfAA+XBDzQSLZGYhl6GI2vOvh+p1olgBa2v4LLg/bdezLLb7c2Lx23a/gPSp1lITfr9aKYeqvhq+9MjR9aFEncXWkJt+zMfR81y9z4Fo+ZhV5dZTFg1s46bP5fYK4vi1VtOTdApgfAG3EvwK3Hw5rPfIExryyf6Owi+Qs5SBP4Dd2SjgwpThKGxgFAR2tkeYWcqQAWFb6ShWPHWsDDIaUJxrNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdYPTQTNEl8W0Y3BsLqEAnRkGAHHRlAUMKPefBoMMkU=;
 b=Crt0dEk1/S4EMLcZSealt0EqFfxh8poA/W08ZKoEJe2JmWqxH7BBeTqK4J5CurZQpSJg9q2PXIbeDwgw+GHE0yAh5EMxGFrAzysvC5gHwDNsDEAGf/Br/F6ebHFDoJlMLov//bhEg9+AMpAzIjRhhtmqkXsESTyyfrv+VC+qjnwzU07wyLmzIGzNAF/kvb8mE2gDJEoiqlfT2Y8F3/qv2Zp24YlLzd9i4jX4hHq3dMqilEx6aOaEMxZje/Zo+1X9ESvgw+XXVj7lk7FmYYJ/72d6qfBK8tv/csFuybRFC7341HIqK1JRsm5yyrMcQy+qMkdimAkBlCUUZew64xKeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdYPTQTNEl8W0Y3BsLqEAnRkGAHHRlAUMKPefBoMMkU=;
 b=eAamF/fPeqTz5CGvJ1SSeEBTocyhRa/ZqPh/vBaWdFxfCMJaA9IqnbSEggS7WXw9lPF+7Kef2zLOctpmxTlZbF9NeW1AoyQg3+DH53ei5DiyFdfqdDylY8HJXLllUenkP4h+7ZewYS4Qm8gCOOM8Dq7u5mts2RcNIF5CdBC9X+Q=
Received: from CH2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:610:54::40)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 07:50:34 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::10) by CH2PR11CA0030.outlook.office365.com
 (2603:10b6:610:54::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 07:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 07:50:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:50:32 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:50:31 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t 1/3] lib/meson.build: Add AMDGPU_USERQ_ENABLED check for
 user queues
Date: Wed, 9 Apr 2025 15:50:28 +0800
Message-ID: <20250409075030.2501714-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 183ea50e-791f-475c-96d5-08dd773b352f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LznCQHTWu+8O0RfWTr43hIWGpgNAH3tVnNuuGeoviZq2DzA7vPzWbKIO80w/?=
 =?us-ascii?Q?ZOfCvuMKi4cl7uDhbhww0Ks87b+tnxBOu3vqlbg+w2YIx6qE3mLPOZXbh1T8?=
 =?us-ascii?Q?80yAVh6dms1sQZ8ZIaFxug0APoa7oe0HdA1R7v+oIz9SVZbjw3lRjXKr22vk?=
 =?us-ascii?Q?UOGskm7CnCEv9esXDRHTwk7a3V+mibFuszzLJyYv1FX4Enw7ehXk8YtlPWGY?=
 =?us-ascii?Q?rUXjwOfwYJVsbVaBDQl52IAJETQYKdNlwR0RkZqt7hPcQsMdBGhiklLGPWY8?=
 =?us-ascii?Q?/XcUvP8ZjfrV3oiUPhNBd/bzAbpoQfdj+r8T03aUYLxK+wCydcTQNqC2iUb1?=
 =?us-ascii?Q?RiaGaXeAzqV/Sq/AvMEtVFNOzBES2EWw7IO1fa36BRprLJr+6yn4M0VUCMay?=
 =?us-ascii?Q?dxGIHGhrXZXNlIw3Ppixd2DDAvnIFSPTPxMbDW/+47Kc5BR6mBYuY+3mFeuC?=
 =?us-ascii?Q?jEI361/h0o9Uy37IioRyA8yhrI7LLZJon5KClDItdzuzeSl4QsrFnugDz+OI?=
 =?us-ascii?Q?/1LN+XhHZ5Kqvu3wp8o4wU39ZhvFvik2/BsV9DtQiISX1q78PY0U3+xsTEub?=
 =?us-ascii?Q?IKb1U4kmn11RCPm+wNMRM18F1J6gxnBi9fLURyXYTn6IKvwRlhT3JbHYJlyI?=
 =?us-ascii?Q?OHYoUusxkNFnq+wOHnDVQcfRoDGorwCy5o/yP1Ix4I+GS4glNcCUK5n/aFqe?=
 =?us-ascii?Q?lCpiQrpCIAF7nRTHsa0jf+fCMnMOn1RPIL87rrG1JJi5gLiZQ5oeMz8ECP3E?=
 =?us-ascii?Q?FU9jQ0A2CPPg2PTSY9QH+ycnSv/IQqOl8t5S+CWh5MNs6KYAyV/UxMxEwW/W?=
 =?us-ascii?Q?mtVUGDFGlSGBYtiK+eud6JmS0+wm6u+fa1LDilYFf0vjr6yWkcFNprZQau5U?=
 =?us-ascii?Q?tDsQJ8wpIOxwmGOFTVmstFVU0B6J9sxn8sFp65bxewQ5aG92R2QuaKZVgNgb?=
 =?us-ascii?Q?FIXH0umbPXSBDepBpWbE9SRcckegxF3hfdcxhDObuVQXCV5FLtGR+PIy3IBc?=
 =?us-ascii?Q?/iPtWe7cEA725AtU1bkLVzshzthZKTnVW8ERW+XSxjcL84h4xouxsRm/ThO7?=
 =?us-ascii?Q?MjRGw9YdD7Q9mdVUcTZfqC67IyIAPomPWaThvnZCdBRqFMUS02nj6BAcXsDC?=
 =?us-ascii?Q?lMlb4ZW8/fY2BMhabsDSAJO/Siuds5mSfrkIyV4oRz7AWENDig74K5NpE653?=
 =?us-ascii?Q?zT2MpwFVVIjgyvQiAvLSw06Wx+fuZatOiH+vRCiYjNVfLmfI262/xk4BwIZh?=
 =?us-ascii?Q?B10FMi43cHilHVB4S9w9Pyp25BuZVSPlcGnCe+pVtaNhSvzrw9ckZQMFFj/x?=
 =?us-ascii?Q?R6k0PCsc1QEH1vHd07QaMaxlU6Z9bCTegW3DUDeE6JYVZHPWgsN4yHD4o5wI?=
 =?us-ascii?Q?V+8tJfj+pKLSlgydUOPitvPek+NczFFM3Mrzne2D67P/LNAoKmbVoEQK0FQd?=
 =?us-ascii?Q?cd7Yi+HEmBeWwjuFEhHrOoMrAPP37S7I13T2Pd0tYUqOovj9UjTtLi7gbngD?=
 =?us-ascii?Q?WZ0jXatJb14GagM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:50:33.4784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 183ea50e-791f-475c-96d5-08dd773b352f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Detect whether libdrm provides amdgpu_create_userqueue() and define
AMDGPU_USERQ_ENABLED if available. This enables user queue support
when building against newer libdrm while maintaining compatibility
with older versions that lack this function.

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 lib/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index d7bb72c57..8517cd540 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -172,6 +172,11 @@ if libdrm_amdgpu.found()
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
 	else
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
+	endif
+
+	if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
+		add_project_arguments('-DAMDGPU_USERQ_ENABLED=1', language: 'c')
+		#conf.set('AMDGPU_USERQ_ENABLED', 1)
 	endif	
 endif
 
-- 
2.25.1

