Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F8CD4F39
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 23:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC1010E3F3;
	Thu, 14 May 2026 23:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12qP1NHh";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21D810E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 23:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb4gTi+/q53rNfjUwcN+ycjSjjEXGJrDTkXgVc5gsvBXPprJX+pyvvAl8y6alwKuWXYKz5LynaptUpixy6RreaoWfs+c7qukqwjiPhcNe3NuqYq1L1VWTd/U2HxDSDLXJ0sHeC7CvuWJDp1qxNmkY4GAD8G6iYe0Xjyv5cQ+s7RhxxiXJcLtNqZ6aEqXDG6DPSPa/0y/VcwYJyaXSrDBofWq+8vVPAu7Zqrn9OqP+Ab3gyCH7y6SOzJzVpaHUxPWDtR8jtIX/n9/uFBHaeSclq0jQWnR3zK1mayPasX0NJ7xdkUft3IP/PPSRyrWCgElTy5OsFRAPwWjkrcBh3Zn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afqxezRODkH1vBGSZDlGvRb5k4hFZnmmZBgupuyCo18=;
 b=Gp/Z/wZTdcB/QcA3osDeAVp3UtD454Y0BMAHQPn5zs7KHOBF7edOPRh9Ols5o1Sm8j7Y/AYmmRsIvUNS+k+dEuoyj+RkKp8CqKlOh+yjxTN4bwZvSvDVDM/ZN86DmTQvjg+iJd1WS658GE7IvdKb5w/EsCFBlz+lM7Hw5yDsFdBSpmFfu1xOcRzMlhYtQTWkGE31hFvWauggaJEBWJMm2GlBNIAkbl7VagXkqINfTst3A7pbSz0/vP1xsJRaoD+terhbcBxrNGkHO/PBP8cw249wqO5D7UJjc4YjREyh9sh3P7MuvJ89Gt3VzZKOqSJAXlvLjZsmTQiGTQL5ltl6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afqxezRODkH1vBGSZDlGvRb5k4hFZnmmZBgupuyCo18=;
 b=12qP1NHhXoTUkgDbtlLCaWqALA4da0NScxCZ1RwlUwcGO4dBELCVaznbv+taZX7RhsFm6eMWOWPmnY/GC7x+A6E4nz8dH4pgSOkBJ0zZ3L/K2sSg3lcd3goRlRkoc1BcyLBRxW/y+MxzaRPlqioYK/ptA0jB9j4yioit8z3no/w=
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 23:50:06 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:334:cafe::7b) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 23:50:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Thu, 14 May 2026 23:50:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 18:50:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 18:50:03 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 18:50:03 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu: Fix heap buffer overflow in OVERSIZE queue
 reset test
Date: Thu, 14 May 2026 19:49:10 -0400
Message-ID: <20260514235000.125069-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514235000.125069-1-vitaly.prosyak@amd.com>
References: <20260514235000.125069-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: b49fe6c7-2809-48ed-58d1-08deb2138611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|11063799003|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: RrsJU8ex1zLdpwOa5vs1EJ6rUaPC+X4WGZwfo4TbQRA3nygiQ0G4tPIvh5Ec+Po3wPLZlYjpXEldMEaIKszh9F2Wo+aBY5j4LESkQtMXjTHQLsHF4Rtk0usIR5N+z7x7e0pD5ghkjubUOYUx/B4Z81/462M0QVkIuACqTjNBzTS11Zkc+iIl63zboqUnvPsuMJT7kD4S2mfZ/41T7fa+TfSaByKiZwrGj2gNMFh1R1p56ggR1nOD6qEZmMjd8m4+JOI/8cSBi6g463J89wBgePzPqYjP/GxYL2I1vQ3HeY18f4Muk0yJyyh5Y/d2MqiZe5bCnmvKp8Zyt8OpBrNSZAqB7r2OWtLXlEtqtPNAFk52lj/KfEz1T/dDdznE6W7tIra1BtS4Lt/NqTpuAw5tE/HMSSW3nsAML7/I49vS0zISaf0thWk+/di/isS0yYGE6/y8DY6n/A2Hau1f9tlOjMH5AJn8nKj/Adbw+ab+sRHvllARQiLD9iRXBPTOKo6TM5qAuR50yzZAB6fk/sgGcWd7VkY5OBogkFjvDifY0b2aRnH3si8drLjaPioVZ4Kwc6wq24W8JqtLHYLWeZd284DLxxQb3OPdkTzQAMzpo0WqXfzFET4lRxX3eaM35Kr5GRENOG92JXJSprGHQ+V6Fz+SYB6eBGzeZx0hXF8Y7XOynzJs8K/K3EZ9iyGtS7pgARkG82y/wjAKEvlN8qPPbhPAn+bsas5NePEN2MXtO2Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799003)(22082099003)(18002099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XmB6caK1LLsJD+8SPvepjqEceAmkYFte5IFFB6LDKZ/BAyU4WD3GlcvY6Iunap3BBos/O0F+Jiuy8xxQGULqzz72V/4wnKEi6o6+LkJYaVk1+qiQYraMYN05x/702fSUEa0dXs4FqveTMdrKAG9GrAJHZlgAJS9f5PwsTkyiLbpybOaHWYTHGtj3nU5stLrdQxRN4pXjgn9pxAsMCH3lbQyX1NEVlKr0Pyu5mYhSM4VlOMl7piF99zNKFfanYaNkNF7eRHhOtmZ+gdOszG+Qe95a5g0BzlCfQ9//yKwhEeJWngl4TuJbEl1sBo+jJceYOHoWZIjL6J69OfPbq8DAiyGSfDgbuUS6HnC5cfc7kMMW0+yuP6bjANxba19gb0QIoHeB38MZAcRu8BXdNKwMed2Ufsjjnde+ho1hNBrIv1zbcO+l3WURILe/Gb5wdsig
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 23:50:05.6052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b49fe6c7-2809-48ed-58d1-08deb2138611
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

gfx_ring_bad_write_linear() for the CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE
case computes stream_length = write_length * 2 = 256, then writes
stream_length + 4 header DWORDs = 260 entries into ring_context->pm4.
However, pm4 was only allocated as calloc(256, ...), causing a 4-DWORD
heap buffer overrun.

This heap corruption goes undetected until free(ring_context->pm4) is
called in the cleanup path, where glibc detects the corrupted chunk
metadata and aborts with:
  munmap_chunk(): invalid pointer
  Received signal SIGABRT.

Fix by computing oversize_dw = write_length * 2 + 16 (generous margin
for the packet header and any future growth) and using it as the
allocation size when it exceeds the default pm4_dw (256).

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index bed2f11db..546845d29 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -551,6 +551,7 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h
 	const int pm4_dw = 256;
 	struct amdgpu_ring_context *ring_context;
 	int write_length, expect_failure;
+	int oversize_dw;
 	int r;
 
 	ring_context = calloc(1, sizeof(*ring_context));
@@ -570,7 +571,9 @@ amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_h
 	}
 	/* setup parameters */
 	ring_context->write_length =  write_length;
-	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
+	/* Allocate enough for OVERSIZE case: write_length*2 data + header DWORDs */
+	oversize_dw = ring_context->write_length * 2 + 16;
+	ring_context->pm4 = calloc(oversize_dw > pm4_dw ? oversize_dw : pm4_dw, sizeof(*ring_context->pm4));
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->ring_id = job->ring_id;
-- 
2.54.0

