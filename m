Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FF606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z0c/EKAi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729D810E4A5;
	Mon, 16 Nov 2026 13:21:51 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013025.outbound.protection.outlook.com
 [40.93.196.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65910F19E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 13:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUeYKKdmXPfJBjE3WWJVkf/pm1kd4kvos8wyUxQj3rOf19fWRZOkodq2c2gdtgtgkn1Y84IIhu7KZcCCfuzuVO86p55Zxw9WGztHPsqdrRh3D7mcCt88ZZ/3KmGKsUAMMXsM7NFBLH25hR7PJtD52u9fG0TQK8xN2IxqUc8bPJJe0iJfcjrkIrZzoQzcG8vc0aKoToQL3Hu4+Fse3fLsHNX3lKjt+5Al4wAjUfPnKXNP3EhGopLaDAzKiKkE7mgRwQi5KqJ08m20YdWk+lVKxmaxfq5QeWg5I/Q7rega0hG3+oVtz4y8qvvLQlAvz7a0CFTH6p5X1nHx3p0BgOWQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or98iZz4Sm/ADzWQLOCxTuCFT5xfTnu6VdaumI9UZdo=;
 b=UgW4gQjmNOUGpirqtGq5OQmRiyxT+hkf8LRv11lv2pEnoDbjsTECy/wkoSnl+/H+6Q+R3xEEBjjZWcwMFv3lWZrJ5cno3ImpgyfD/ebNxaL+WSV0DMPCGAuDKHKOLhfb1lWEMzo9r85EAPt16EWgYjJMihnI27WdVcRVfRoG9d0gv15PI7/gtFm/WjYqHLPOuTRWLM9Q2Y90ynmyYEbIpFYOyBdjWr6+Mms7PjZ1Ph9a9JTcYXcF4R5weQtaOJSK0iS/08OXGROHHxMGBO3ya/GrKRfTZfgpt1BhAet1DQV7K8Zi+Qlfqc6oGYcef3ErbaRgrZLOsBYBEjPFJLWjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or98iZz4Sm/ADzWQLOCxTuCFT5xfTnu6VdaumI9UZdo=;
 b=Z0c/EKAicLaPuidiJ5Z0yV5eXHgnhWtl1eCXniosEHY1quHXDk2ao6iDRky9ZHWWwYx6L9eA0B2CN2hhC/AQj1ASFeLJPn/iXnR86gDW2L4AKbFXDwRbUjSg1jNu9uK6IkL4akspbQzGeDRKJH2kmf6t8DPpK8YgPEm9k28sLm4=
Received: from BYAPR21CA0008.namprd21.prod.outlook.com (2603:10b6:a03:114::18)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 13:20:42 +0000
Received: from CO1PEPF0001886A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::21) by BYAPR21CA0008.outlook.office365.com
 (2603:10b6:a03:114::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 13:20:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF0001886A.mail.protection.outlook.com (10.167.249.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:20:42 +0000
Received: from vpe-at2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 07:20:40 -0600
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Solomon.Chiu@amd.com>, Alex Hung
 <alex.hung@amd.com>
CC: Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH 0/2] tests/amdgpu: add new tests for VPE3
Date: Mon, 16 Nov 2026 21:20:26 +0800
Message-ID: <20261116132028.2021-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF0001886A:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e61c8b-6f1c-4f39-84f5-08df43e46a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|261009223027099003|10067099003|11063799006|261021121427099003|56012099006|261102123227099003|261021123027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: PPLVoppWG1uSNvkvP4yt8vxwHiowfPNlnHJxFYQpqkGWOb0Jv/LS7tkPKHHn85GT4VNAt/+6xGYpu2TfJ3WKxorxprgEYf+Jnwuk3m07kBylmfYKigmEhNjfabDq06XdVJ4M3Q++Dm3sfRWsfk1JB2nXVnihJ6LlFTc6RqoYurfdzFhdPwpb5DQZiw5QQ3u/Ig33b6qpXnPK8Z1V7gsaG08/T9Zi2ZJslOh7ID5Spv8pvrKW0LGi9fA9WQakyZk8Q0P3uVCaZbFilY16agldRyBTktOuJqc8lU/a49mJUYWwMJfuBLSOmqFmpEUdddrT1JgZaE92twGrKuWM1zk40c+k8bxsUqNRPAysF4x+jhr1YCovPD/Gul4TZVoqh9n+rypJ4opT3kNRBVd9kAwM9IVa5R8LkRqg5621IHONwYUiwy8Ly8thZyqHB+5t9iz36KZi3aII9jXKGgG8YwEgWvqZI4twtIjg0cla26ypJIWZCnnbyT37G5vEln1B+J4YwqaIpl9Mn0Qe0+z6lF+uFaAImAKjg5u6n+0rvGrMtEIWii4tNGmPgoSlOyBOCGvvJKjZBLZnSRaU7yD69Xj5KP4cxCerYMBiNJL0rq8IM64c/W1iKD3KdIq1SyEXV4SQbE/hri4B2bKztImueqbGnPqZeFCGjcpt1faXwAVSKpHRBQD6Qfr6VklJBJajvfhNwKclssK3yjo2bVX4BE0jPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(261009223027099003)(10067099003)(11063799006)(261021121427099003)(56012099006)(261102123227099003)(261021123027099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mwVjsjeapnuxNZD67hx0/4os/yZySoDtIQv5rrpob0KqxubOS7NvO8sWUKa4JJe+MmBkXwQSWseO2mmPVCxGxipGxdW+uj2g/N/yUvu4E3nu6pM0TXaCg2goIChUCBcq86SDvvqUls12jyyoXVQnkcoayEpb0k2+CSpN+IRbAB/tOmlu6uBps8F199CzMa+PEH13892O2Oms5/O/c3pXGiex+v79EtucJ7G5VG9BRa83jxmiesOguoFiHlO8HprUtb9slsUUxhoqSKLqCnl+Oq61SosEuAMrkCeWmUFaz5VMd6OErwqB9az8vZOXU9QVPOpUQ0ldIOQgfG1pE6tv29HUly7zryH4i6uURVYAvVPVLnnnTjFjALhHlLoUmKPKAaGkOsj+PEKHG4HOVHiDXiJLRCqUI62RAB/D8aAH2OdbaTk8eINo2099KbUU5+hr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:20:42.0975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e61c8b-6f1c-4f39-84f5-08df43e46a25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF0001886A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244
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

The first commit rename some command objects. It's for the second commit
to add new test commands without conflicts.

Following previous test case addition convention, command objects are
added into amd_vpe_cmd.c, then exposed via a getter function.

Caden Chien (2):
  tests/amdgpu: add VPE version identification to command objects
  tests/amdgpu: add blit test for VPE3

 tests/amdgpu/amd_vpe.c     | 118 +++++++--
 tests/amdgpu/amd_vpe.h     |  33 ++-
 tests/amdgpu/amd_vpe_cmd.c | 483 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 595 insertions(+), 39 deletions(-)

-- 
2.56.0

