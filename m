Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2855C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E610E4DC;
	Wed, 15 Jan 2025 07:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2cyM2ccH";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0C910E4DB
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dvv+/xQitf80hnoqGcTMHiBWE/X7KPDQd5hm7XfgbR9B6v2AIJmhcUuLzgcrnwJjojRqJDOFZ0b4faPydnbWUqe2khGs9Z8vUlQGi4XM85jj5m2S5SNKDtdsO5+eQy1Rwzcyiw/AVg99WtG4ECSj7XfEAXfFcdanuq04hSdM1aCONnbGY11xIG3ewUgaXYuVNecR/+qvDcKF4weSGYshgJE2ZfaeLlpffDnEISOEfHwrwXD9ONoCTCf61zqNzOktF9rzh8GRdQIWH/X4J3ZRrPpg0zR3slupV1aQXnzdZ2TOspoXdJzXyDiY4ZWXXWnwH1bY64QPcm3UUBSUUGpHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C4/1YSTmgYva3rvEbZwCw1M4RkZGmgwGBXg7Fba9b4=;
 b=mvMhJ16IRds+IuNkHGVVmtFMe04MXDCQQoy0eIavwGD4mSHEW2NakJOzjOqQdeAB+BMmBKD0NjGdJc0Rwk4jXJvwEHYRqN6aqAUYWcGwJoqEV1ms8n0I3FaHbbffqHrA/h0mP0JWDiJvyfT0aR9SCciZFe8CyWsvxgkh9U43/wtV8RXO+wJ+aytVojzSra1psA5nEGg5b4ymlNGS42s4JH9WFR+b2lrd8oVmYpkqkNzZzV1oAGQY3DRcIVWtL+Z/xEugwfpN/W2b7BogusyVua2YrmCSyWs56hVqEMm1SnbFis08Z1ATKusywNPoh0an2L8CL7NKKP5z3I1Szx2qNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C4/1YSTmgYva3rvEbZwCw1M4RkZGmgwGBXg7Fba9b4=;
 b=2cyM2ccHzH45vGdi8CdK4t2Sj9uq8Gx8NS3dzGkoXn4cdj/SI9JLYE6el3UYJvMV9J0bCoF1RHRHyvmEWWITnS6O8Wbmk+qUTBoqIYgAFSvH1RDmEJVEDB/PIgOwu3QHUeVe75s6cyNhJNiau+qpnPraGq/X2+ZGbitiAsiO79c=
Received: from BY3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:a03:254::26)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:04:04 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::a4) by BY3PR05CA0021.outlook.office365.com
 (2603:10b6:a03:254::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.12 via Frontend Transport; Wed,
 15 Jan 2025 07:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 07:04:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 01:04:02 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 01:04:01 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 15 Jan 2025 01:04:00 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Handle -ENODATA in amdgpu_wait_memory
Date: Wed, 15 Jan 2025 15:03:59 +0800
Message-ID: <20250115070359.3698486-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CY5PR12MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b2b9cb-ac84-44c8-b040-08dd3532cbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b4oFQSAzsjMr1rKaFotv6n+OCuYe7j9Zw3xkuY+CGkl9A+177Xs1yhyePlCF?=
 =?us-ascii?Q?ohqzZLTjb/cmUS18pABeFQ24RvZXziz45MLpTt6HGMmh8uBSPnHWaDcTRC2o?=
 =?us-ascii?Q?umYPj1Y8Ar0gfGPuchZKflE4kBxqkATL2HeoEw26e61JjHgQjDg3jUx0CVyU?=
 =?us-ascii?Q?F020jKLZQsFrfGBQ54Vo26jIxkaxQqYn+0wKquEMC4Kbso+Vf4P7IuemW3k5?=
 =?us-ascii?Q?w7qgAykIfPylxp2s0ZVr+67tk1H4Tu8iJ5ebfAld8R8JCu7aj6qO2Wc4LW4n?=
 =?us-ascii?Q?A9SF06HSGTJx9CTSrke5/VTei68F1hMJDaSCcA0lNRGzf+azEzHeMSM/myeD?=
 =?us-ascii?Q?X5zj/NPyipLT9BOEWz+aVeh0gVZjXfE5lJxV2nXgLbEQwbIcWqWWgGri0pqz?=
 =?us-ascii?Q?ijWpl/VIH2/4pF519NbmgQ3LHUXwWRIEJ9kzC8BiEhiyifAmuJ3NrmmeyQpY?=
 =?us-ascii?Q?A+pwZPr5PqPDHCuRhXxL2hAn9WC+NzVf92T9D1QKYUxrYW2X+A6zKDHyaDcj?=
 =?us-ascii?Q?hRIo1wfNGMGJvffqSV5pQginA1EO6lbFvHUrC2KeEVwXyqCieFLhZVyVOqfh?=
 =?us-ascii?Q?SR5jZqUZQKQ/ee06+VEbAp+42p5Xi8PeyOhxwQ+5PZ+sl+HMWY3tDMFVxaQQ?=
 =?us-ascii?Q?oV9XsSScxmm08SCPK2Yj4rnHpr3gezR4ouoLOKutRpZKrLU08b0Scb/lzevK?=
 =?us-ascii?Q?bxHV1wuGY5PxSFDtGKccXFR8vVvVOJpb41tOqymcz8IHwvRstzHBtrpZmlnh?=
 =?us-ascii?Q?eHrHRhxie9DNvnktnC8oawIF/HVlWdtFh0jruMLyxomxkJqqKJ8UbrRawDiL?=
 =?us-ascii?Q?RJXqPzwhdiH4KOzaL7aypiW8Va9+zHPov4KwXfoJo7xRmhJ5Ee58r8aIOsj8?=
 =?us-ascii?Q?aDx8q8Cj50mZPScy0zJlLzJyQScJm0gVi8dpILR1rPpf8eZl/mxVReBmNHft?=
 =?us-ascii?Q?l/dQDHiBnpZHtT9P8MGgoRvskhpD/dHQ3EEWlR3c82cXkXFh6YWW+ycO2yto?=
 =?us-ascii?Q?B9kM0j/ExVvmbzx3PAqn5RtSRR/f4NpcJBP6fr7DQemNaDaal6CJMm38UHKx?=
 =?us-ascii?Q?8CCrKgXUUj3Gmo4qT+cmpNJx+yRWG/9iBHM7tiFqfNwwoqalrxVIZeS0KDDf?=
 =?us-ascii?Q?tQl1JpKH3BoKFLNTt0MQLt37MKATBIV3/X+M6lBz9vona9rKfUPiFFOk3oev?=
 =?us-ascii?Q?ffkZd3ETwbghIcQltfh4LVQKd1cxrpJFwpxZMHwVaWF0aHw+P70aSvFR0z/X?=
 =?us-ascii?Q?JMtMgTv3ABhbzyuYrDGCEJK7uG8FZP3ZadyIgcfDFLNXVnHzjKffL3SD4oaB?=
 =?us-ascii?Q?+Mb/Z39ocouLWbXL16FhAx3wyMbNfNaJ4xl+iuCQmCnCDTeBnJl0ZS4kULkL?=
 =?us-ascii?Q?lCP7Tiyv3FbSQyyp01IZYPzO8d3pJAjHRfVRrlfEz8zVor/bKUAHXakDAphu?=
 =?us-ascii?Q?D7aWIp58RV4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:04:04.0904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b2b9cb-ac84-44c8-b040-08dd3532cbed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574
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

The amdgpu_wait_memory function currently asserts if the return value
is non-zero and not -ECANCELED. However, -ENODATA is also a valid
error code that can be returned during GPU job timeout recovery,
particularly for queue resets. This patch updates the function to
also accept -ENODATA as a non-fatal error condition.

This change aligns with recent updates in the AMDGPU kernel driver
where -ENODATA is used to indicate queue-specific resets during
timeout recovery, while -ECANCELED or -ETIME is used for full GPU
resets. For more details, see the kernel discussion:
https://lists.freedesktop.org/archives/amd-gfx/2025-January/118795.html

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 8ac6abf8f..f274a6365 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -142,7 +142,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 		job_count++;
 	} while (r == 0 && job_count < MAX_JOB_COUNT);
 
-	if (r != 0 && r != -ECANCELED)
+	if (r != 0 && r != -ECANCELED && r != -ENODATA)
 		igt_assert(0);
 
 
@@ -156,7 +156,7 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 
 	r = amdgpu_cs_query_fence_status(&fence_status, AMDGPU_TIMEOUT_INFINITE, 0,
 			&expired);
-	if (r != 0 && r != -ECANCELED)
+	if (r != 0 && r != -ECANCELED && r != -ENODATA)
 		igt_assert(0);
 
 	/* send signal to modify the memory we wait for */
-- 
2.25.1

