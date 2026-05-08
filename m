Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F1ECD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 20:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC6710E34D;
	Fri,  8 May 2026 20:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JQqcK6Un";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2EB10E355
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 20:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZtou27Cm4o63nQeJMmyuIW3BIRHbmtVKreVGBkpV5GMxo2CKBxVPChzWhiWoy6Gu8TgO6j18gCoUXC3SFWjM0rGqDl2cEwBkWy6ZcVvqrsuJlnmvzt+liv8ZZraZU0a4Lz5ojBHXd7GKIfBV4qyGmFeBHHzG0iua6UvE+Rsn0ikMWLqoYou6Ak/TTnKwCv2vTecsMsrfoRMUAPP1XIt/WyarnSZczgUSuAM419jSYI5NOUVQkiCVSvKaqqc1gU0sxhAD7LSdmvHZ0y8sUqk+ytIbP+Xodts1RLbqBk+X8Px34/XK2RzK6iC1WPnEoJbCFCVMzHEmH2bCKGKbenewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDejKbm9a4Y9EtaMvDyQmsFQ0/koubcZ7d+qZiAKXcE=;
 b=bebFg6/JkYc7lI/8GGcjxJRcer+3RwQ9+HhzTbCdlog8hkdR28zLharwlYX82mEPQN+SQrUgKzmRnU/FNqDUK5FpfJ9w+aDjxota3cXOizEBEIrLvdCWYxsOZWHEwUNNwJjSgbNdzmLvwu//mrdu/9eLrv+N6hrpk7Hi6XNuZ1LGH03fsTuQcnWReNe5riCWU8e1J2bss07Q0TbbkiqbTHYZ0AGiklNQY0HD1WrZyCZc1SKPX9MKMVZXrb/QKwhV/HQh+VRtLkGZru+LLX6KUcvYxllmja9Htl6BuFL/2xxk9kEuF4aZAWUeizXM/FPkozyXVkHv0DafCx8z5Avu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDejKbm9a4Y9EtaMvDyQmsFQ0/koubcZ7d+qZiAKXcE=;
 b=JQqcK6UnZ/8Ic4N0w+4cOPPCmudwijB3qFVs4d93vZPEigXs35ANIqWjED9hwYu91whM1ff0LMpO9mXWRRl2tbSw+NNN+ZPFweAIEhUd52gROdVPhm6QAzoVx/9VtzTydfiLTxSaU0lbM/sRqhGpoSwEH8F3XkCosftJYpXBB7U=
Received: from SJ0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:a03:3a1::8)
 by SJ2PR12MB9006.namprd12.prod.outlook.com (2603:10b6:a03:540::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 20:15:43 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::ee) by SJ0PR03CA0363.outlook.office365.com
 (2603:10b6:a03:3a1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 20:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 20:15:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 8 May
 2026 15:15:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 May
 2026 15:15:42 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 15:15:42 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH] tests/amdgpu/amd_fuzzing_sysfs: use local include for
 amdgpu_drm.h
Date: Fri, 8 May 2026 16:15:32 -0400
Message-ID: <20260508201540.54172-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d8f25e-f433-4035-e111-08dead3e9530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4kT+ULaPwYW/08uKu/U/LKJMg24gmG2Vd8+fD5fRcnGOuxO1tOisPNr7Bz4PAlM7hlFPAAZSYikPZfFIrgjGvx+cd0MDCs4lg4GqWr7RhRbl1GbG9Der7agNslLNVDeS6ayZ7UFOsiA//n6K74mk9JBgCdZbuh+rjhglELkE8UPep8qj3vqUx8l22aODcfI8bcnR2BCmmPTiQvNiOpBnhOxvdGnhURAfDpI2lGuwnw4sh1MqrRarCR40pQpjvYKpC5BmYc92ZnqJFAlFBXcumB2DAlf2KNV/hTUAFloF8i7A1UEZDiJalIw2jvjdBu00jVjZKL/BxxI0/CzgpNqP+RWYXdRosDwsup2KdDm71l1zoMDAt0/CreZKs7IcQJzfta+weSFK0vvRQmH/xsPwOookAe0E5iULajZ38imDDqB/m6iPcLFFgPXbVSoeoKY9IAnKfvTMih3iQecw+W3jewYsGflaLES055kBSWKcF3wQICKu6BVfbpz0q8ypE+yc9Ojdevd2Y5ssXQqxY4zXkWldZ8Mc1zd8bwaV3mpoTfefbCeu1w/VFN8RS0qlORJk2n3ENLWs/vpHtKUtkoroAOOa1uc8hhpOsWaP+RVxp5FrTCikfetarKcXJ/ru4XxbSp+FBhebcxEN70Nfg7qi5NwxjniYEz7AqCoO9WyR+fmeqU8UQ2jeCBD8/iT5Z7xKBFfrvLjGRfcoKEpZMNponZDvGbAKJNKN1qnngf/5U0w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bHL9UudxUcn6/otbBnlyFOsavZYuFIfFTqWBUe8yEWsq3DTW4/5rL+0EY6DsdRlPSMU7mP9fzf/VyT/3x8LUoOIyiKedPu41Rwrl85WOX21eDJL1mztwq8Ux94rBK9s3ErwQwJ4HhzUoLudTOgbCXxMK58tXUZ1wV0BwTi8Y9Zp6Adfo2msnUGQDtSlqnRaauTqlMG5J63Yb8hkaOWCyaVVb8Nc8KBuLjwmZIeH8fUcJRddR2jsIuAQAT/orYmhCKqO6zYp76bu34pvheZgz5BMgX2KvuAFa8mrLo8SMk6+eqfdiCHviUcJOvD+GJ7XfGCbkFjlmntTXXnRZ7jTl0bkRRbT1GIV+jD8PA2dTUmG9OmOrhP+8GGcYe9SHQkVJfmx9CW5KDcXkOSAC7//Y0Tpjst0pMbfU1yTJvXKPputbzvzIVVHFQXjU5o8RMpLf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 20:15:43.4435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d8f25e-f433-4035-e111-08dead3e9530
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006
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

The file amd_fuzzing_sysfs.c uses #include <drm/amdgpu_drm.h> which
requires the system package libdrm-amdgpu-dev to be installed. This
breaks the build on machines (e.g., Intel-only CI) that lack that
package.

All other amdgpu test files already use #include amdgpu_drm.h which
resolves via the project-local include/drm-uapi/ directory that is
already in the build include paths (-I../include/drm-uapi).

Switch to the quoted include to be consistent with the rest of the
amdgpu tests and remove the external dependency.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sysfs.c
index b02f3b7ce..381e5388a 100644
--- a/tests/amdgpu/amd_fuzzing_sysfs.c
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -29,7 +29,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include <amdgpu.h>
-#include <drm/amdgpu_drm.h>
+#include "amdgpu_drm.h"
 #include "amd_sysfs_spec.h"
 
 #define AMDGPU_SYSFS_BASE "/sys/class/drm"
-- 
2.54.0

