Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7CBCD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD8310EB0E;
	Wed, 17 Jun 2026 19:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MEeb2HJh";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EEB10EB0E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 19:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuPDAPf7EZ/vWnqGTWKUCkvuuaRREd5QquVdeifAYGvfun9OdWUe0QLBs3SyTqCzVa7upP+kX+yqXRQmjZU5hheIfrGGBcgLobrpU2lp+9DjHbu5bikVc6yRZA2tfpgSg4xzAkvz1f9albjTr3HVy4L+zOKZGmXtb8HKq3B+ikybWx/fvMUXyY4EaADaIqyDTw+qnfLv4BQyj8yz+xKnufHawHtJUMghyM7fnCjf1F1qsfl8H274wvvKFzK+LWxp3IaL7qTe1HA9ZtZgrbEL7NyCmZEoyYYZlday1a7Z1cm8xJd6OejIoJNJkxENY55U+oDlP/dq0maqDm2QjLIgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxxpag43H5MFKoyQ8ESF8cpIkKJ5tyU/72/hy6nzM2E=;
 b=LKna2AlECnBlI1SQhUhnTPGjNd8XohVK2kWRVNEPHMvMTVrCsNFYRS+vvLQ6j+W46FZPnQaKf9CWfiH58HzLp/mYpN6LbBzOakFsujm+i0ZlCpXXqWrvqOHGsbtUQ3ldN7Z29IV/+ColFPLf5puO7wPu0Fuf3E+TqOJQQZ4q7FeOLxFRUNDFPHUW21c2qnWIheUEw1TFRv4tlLLIT5DIaYwTy5mkOkO+4GK+lJJc8cTN8NdvNGXCkxuug7b75RhnSJiLbCzqQ1FdOsmkI4fMNExOWKfmsQohbLrJjZdOD+9UqnJDO7xjvhlt3+cTxlQs7iGxXJU/tDrbwLkZ5979Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxxpag43H5MFKoyQ8ESF8cpIkKJ5tyU/72/hy6nzM2E=;
 b=MEeb2HJhnwS6j/dZ3l4akQU6dtHmXdAtauy7eiCuewv+hlwDD74RnvswC6HFGwyInS9bXz14ihxGxYiPeGlk1CayDmfh1b1YB1pChqpYcdtUpOOl6WWL4ydO9qbiBiqNBYVl22davq2kiCRf5jbgTrmb7bl4ET9lFaXkIGprwUE=
Received: from MN2PR05CA0042.namprd05.prod.outlook.com (2603:10b6:208:236::11)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:25:12 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::1e) by MN2PR05CA0042.outlook.office365.com
 (2603:10b6:208:236::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 19:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 19:25:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 14:25:11 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 14:25:11 -0500
Received: from jzuo-laptop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 14:25:11 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <Christian.Koenig@amd.com>, <Alex.Hung@amd.com>
CC: Fangzhi Zuo <Jerry.Zuo@amd.com>, Mark Broadworth <Mark.Broadworth@amd.com>
Subject: [PATCH 3/3] lib/igt_amd: Fix 8k Memory Allocation
Date: Wed, 17 Jun 2026 15:24:49 -0400
Message-ID: <20260617192449.4166-3-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617192449.4166-1-Jerry.Zuo@amd.com>
References: <20260617192449.4166-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: ee62b74d-f781-4371-745a-08decca626e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 8z7bV00qP+wS1+OUFkykEe3YsIPeDDO1NooE079kU4BAnTpKYdODg5pHvAAEelKZGaNBwg7KKtQMVSrgQI2lJgjQ6vk2nF2SZLaYUv62F3+38es8JdW37rPiCSk+fmGigMynvh/LPIONKz3EyLxnPzefQTnxEPbZ2K5LuPfg+r2GAVNzo9r7yiIEaSp/Vgc8F13AL0QKed8sV/q8j1sZDlrfUe8fJkLcnoIuMYdS9rlDEMS5F/VDpWTMV8JNqk59ZlRcaTKgxeJOejVExjWclYkOCWKAu0+sPpnIc8tv4z0heBLEUKgVVnSEKnMDevRAV7Czhjf3yYbKVlGpJjSobZi1hau+zezzY1UQY+VXhKCp9doAQHkhS5UBnEBsONkW8MVUzotIYCuHT65cwn0Iu9yY5BXFz6i8CO/w7WMrg1XqjvSwJ4vvBJZGTLzieud5NayeSvb28gfVeDRfRsUC2/rV15Zs5FSxWctwjHFv/OlGihT/f8GEvCHdi9994mHkUy6KM8k6qSDzVYCny24g6S/6EJm0OQHXQoO63YSXyAXhpII0fvt/OnJVlBEYWjEipm/Wx+/msC+mVOL3PGvtoHM/10rH6+06Xlep3/w1o0BYwox63HxaWkwUGCmT1LUTGmYxsSuY3NOmDyKn+29EUW41bhdUWkJH80xvZXLpbkNJn62UcsBJbG8M3/CGbYrewZYTFZbxnQKHG38dB1+IZtkpsrt+GRD32irnSi1Rudo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DS1T9jd7iRK6bsOX6SXDnVg3ErZhiejigX6gpwPmETEHrG7bnBhUq/NB4RsnyQ+4jcjX5EINFSWFtCQ2H/tj/8GMWWOnVUQZZmSLtNEDQXNUNW9VSh/fIiOiIe5rzv4xsyCnc9zazOzWRkGCklyzQEdYmyPa0jd7xsW+MlXnpxxLfK3puyLWvZYgKoFTQhXsSwS+XVztWSF1v9O1fBY8jz+N3Jb3ZC7dsh7bvQD+gq80pBSiNpKEA2gyhe/XP/l+IhM+bSdbvIR1Qu07Ade+cTBuQIK8xAwEqNl5DQz9NdH+c7kJfSoDgx4+5aTguBdyPGmRZsgVtlKTt49yUJEINeBXS7UnJLigAM881bMxf/e6zL6KFjDoF1byUj/Zh4ytikkuygKrYIetazfgXBSTJzqtvPmOhxHxT5CX9fTkAQd1oXX49FW1vn4uNEkyQ0ML
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:25:12.1637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee62b74d-f781-4371-745a-08decca626e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234
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

For the memory allocation greater than 5k on small BAR system,
need to stop accessing BO with CPU.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
---
 lib/igt_amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 47e587e54..5e8626c02 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -58,7 +58,7 @@ uint32_t igt_amd_create_bo(int fd, uint64_t size)
 	create.in.bo_size = size;
 	create.in.alignment = 256;
 	create.in.domains = AMDGPU_GEM_DOMAIN_VRAM;
-	create.in.domain_flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED
+	create.in.domain_flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS
 				 | AMDGPU_GEM_CREATE_VRAM_CLEARED;
 
 	do_ioctl(fd, DRM_IOCTL_AMDGPU_GEM_CREATE, &create);
-- 
2.43.0

