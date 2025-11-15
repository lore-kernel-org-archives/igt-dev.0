Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D8CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90D110EBDC;
	Sat, 15 Nov 2025 00:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="caq3HfTH";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081510EBCE
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiSY0OiODXa28aEiIuDjz35oaNbgzjy34A9Xm0uaT/5WkkCpzcrwXWIvrMgyrlRs+Xhe8tfhFvAhaNHxZzvrEFeg2+tNTqk3QYHabt8vxAmzwOpYDsWfZroWzjdu1iKie7/mktBMyI6kTBhtlKbAiXMpjsxR0oz4o5IB6F0EqtoP7al5ZLSlQsiPDAaWwRQ7GMZ6BXAd8bSzQDP9Q2erICkynOSSA3UmZEuGsIMrm6DzY5sE4dlvl1UwT/oe8tDPgBrgQ+wXNdyVLx0gY73+LSJLI70YGj/EcYWV4ejs8FjHbVoss/AVA/p6YkmX5cEQpvafd14zfxNDmL3EIbmY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULKyItNTAbGHlz6d13oCVL253oTJnqDq6npNsc78goE=;
 b=Vt6TfJmufjVbDRp9ckHydfawrGg1d5d07m22+BfbRCeqhEm6PWWu+4yyruFG7DoKkgfwoaTjgkG7eSD/o31nHYjlQrheWgn9ljKTDISgXAlbZC9lXkOoE8tAV6ztgsbTkuHzCm95uQmXtkbjMBCh4B/ptjOwH9W+onXNI6aP9okk9DJIoGRcMtkJFCKCFQffxzfs08OT9gSW5zZQWiOU8ZlnbzQ3IkMFHRHSc1W/ID+3NIcc5wzg/BjYL0HYXUISCx1QaV3yI8II9uNZ82sAuaiReOjeBk7SJPd6IOXUJo1cGDMjNho/vicsK7BEca2LweGhDE4IJ+xAAm98x3nPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULKyItNTAbGHlz6d13oCVL253oTJnqDq6npNsc78goE=;
 b=caq3HfTH6oPhdnauwUbDSKUDojuPhu1VUHj92Skx9Ivapb2z/C+X2PqWlQKT+7rqbYgFMAJYJ79X4kRZFzkUf4QOPtYIU/82UMBokb7EyLQUEZMOxQDWRf1QVS/qd86twpcpe8qYiv1WtWQyNB4ICY30Ei8alWWb3MwAjhqHYgQ=
Received: from BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::15)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:19:17 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::7e) by BLAP220CA0010.outlook.office365.com
 (2603:10b6:208:32c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:19:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:19:16 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 02/32] drm-uapi/drm: sync with color pipeline commit
Date: Fri, 14 Nov 2025 17:18:11 -0700
Message-ID: <20251115001841.3563993-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cef29d-53cf-4f7d-7e6f-08de23dc9d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qFeWVeEFKjn66vkdB/YPWPXp3Usoeo7iWfDvQxaO52pnbzO0nV830C4+8dnG?=
 =?us-ascii?Q?6J0moJDPRGfBThs6GwoDfAMyAw6qZUUqHVHcfLkVy5qlLSImrtv8gZ4lgI+D?=
 =?us-ascii?Q?8Bja1Ubi7on0dd+o61xIOT3LuddKRe1QTEESicc7jAbleodKj7i3DgcHGa6x?=
 =?us-ascii?Q?E4FtTkwbd+tI5KPxltSYwP50tPuqhU7r7Lvdi2WfdUAQaTCQQ7QGH6PqP5up?=
 =?us-ascii?Q?zxfdgHq/HuUU8rkCZ9MZHcyP8swiqLtv/fstrbIQA0d8y6WxbbCFfklfenqX?=
 =?us-ascii?Q?et7HyJ2Wz6Yj0DCFM9opzXSPGKx/RWGFWfX3202PG3259dHwvPK2fwY5oc7F?=
 =?us-ascii?Q?kqq917RwdhFRTYbED5GxFXOI6dbwjCR8te1IPEi3rTyo08dJGr0oOM2X2d6m?=
 =?us-ascii?Q?5Of8euF6xoE3Er2fwqO0w6O4xY5drQjYlXPMc3OcPHXfm8yCpxSkHROIFJHs?=
 =?us-ascii?Q?gQs8teP9hRSCXP6PE3Hp9ffMufWLo0UbBD80pgllwBLj1RRrvLD3/hMxx0/p?=
 =?us-ascii?Q?n2X3fBpFjLys1gTiNWEzITQlAowjyZC0h/HuHgjgnWjOaqLNNqAjDhWnV7rG?=
 =?us-ascii?Q?PilD/cncYrDY1oLkdPwl1UyOtwrYGPaAeIYJC3lt3WUDStuiXZXZ7oEknt/z?=
 =?us-ascii?Q?W3SSr4R4Ee0HPaHMEKX5sjPuZEl72sscohdgso0ru7nuseUb1XClyk0gED8V?=
 =?us-ascii?Q?TOQga44z71z2tnQ74+E/R3JIzK7GIiG/mL4AfKHZM39M7QSWVQ5VHrDBgvkp?=
 =?us-ascii?Q?WsbaBZUee1WKYG9QxXtLKp21jmnwcG8KJDX8RD7WA771VbMyKxev5zl3X17G?=
 =?us-ascii?Q?20Gg79+w2GRzT3LPJ9dpecm5TcCmpI95ljRjJasWHhiWxye01dbgcfEHzNJ2?=
 =?us-ascii?Q?41/7nFgLfRuQofH3hLiBWNBaY9/FTyvQc2YMWiSDthOozxIpib+zMmDaiQDn?=
 =?us-ascii?Q?8oK7TABSpmX3Wzl3rqEuNS+MDS8fQprJ2500ilRTQW27MHmK9F2bDWhRr6G5?=
 =?us-ascii?Q?j2VnH3mE9tfqvbc1HJLRFmGXRnNjyXmiZs+X0thq2btgU//0w4Ym8TBBmYSH?=
 =?us-ascii?Q?Qpvh/VwRyN4TMCkmCm1zttVbzOx8BVe/MH+jV+bC/253A1x1qTMR0gNfNnJn?=
 =?us-ascii?Q?VDoWtPVHfkVlHvCKunxmLU81A/ldY356xBxxgoYEI3w5KXfYTi+A/6XVHj21?=
 =?us-ascii?Q?A0nBjPbwAzS1NbaqESr7PjeCX48L7qYPmy+b9eq7H/xgdUaC+jD/zV5MFfZq?=
 =?us-ascii?Q?bXz3Hrqf0y2/aMF1BlEKeHD56kjw1t2HCL5TIs+E9fZwLKdX/Xira3nqVURJ?=
 =?us-ascii?Q?xSUrHoifUH1extJa8I9Qase1VmReH27DaAmizbxpj4s9Cz2emBA08zrDuxR2?=
 =?us-ascii?Q?el73hiIhtIS5xXUANN82BJNtuKIDnV441YjhEr43v5ZIcSmL8+/sDAs6cALS?=
 =?us-ascii?Q?X1BqBRJpbOF21ZqIJOW2yfRJKbGq9cOsOdyrFmTTCaOaDewIUN2wainLPY+1?=
 =?us-ascii?Q?WHKb7OsEgOCKNhCFVxvhVCwwbSCHyWExQ1OJKrJhwzUgy4KnsrBr0HuvNvPW?=
 =?us-ascii?Q?8/bwRR25cGirB+81MM8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:19:17.2744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cef29d-53cf-4f7d-7e6f-08de23dc9d5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
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

Sync DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE in kernel.

TODO: Add sha# of kernel commit when it's merged.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 include/drm-uapi/drm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 4e4f7c2c3..baa620e3f 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -869,6 +869,20 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.43.0

