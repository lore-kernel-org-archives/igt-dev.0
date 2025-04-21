Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08D6C369D3
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 01:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFE510E09A;
	Mon, 21 Apr 2025 01:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="42H2Fdyb";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD3C10E09A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 01:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksF6MeDH4GMI39xOwKyWqJMSTghU84SUDxs4SREQAzaU1I2RxGt0LwHcDsKyMOETyOfgjeouAIooUsOdGN9VWIEbB5a/+VlSbTsW4jFs01tdIs69yVzheQ1igbqd0fCG7ajoDfhzlcPO7+djKQmXHE2wUu/Lgwr8qHOKkDvBiN9IrlLtHDNlGzwsH7YNW7SEcAZ4h6O0P+4koI6b2MSfYJ8FvMQdKnsQ80EwGZ2Gt1H918vJldC+x6kTdbUgByjFQtRcfmgHMpMmdQdgcohetTLNkgBJybiXjg58BkL+EP20SHGv+x72b8rAM8SioqUfWhY5nhq/Mcfq6S0FEe1q3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSpLrwgZuW6PJqykbkpVyCbN6zsxFQB3K65q/UXO3p8=;
 b=WgAexjpmY6MOqO1/ty2xL+CvdWdNUYTmIiAd7jeaq3B1H2IVqAN3UixGyqb/cPDGPIKy/bZWil5+h8Tl/zQBdlug6XVnuwemac8qrCBHRUHQAuhtjNRkihXz7okyYxpjIz9CZLPqIawKlfCqHo7Ic2NXOj8K5zkgMbnPBSxyaBTHL/RFyJxsHNO4X0EZzoLzxlYOafnmXNTtAaHTQn73Do17FuqLuo7zW/nj2lE/AuGWZ7ypMwu1PKFp/DxlAv915GFMe/syChnytC5xdHKwRJIgHQwoeSxFGOPEvK1yXftyyz6GPQp/59acmNt9ZNKxIwS12bXKxcC0r9rg1Ox5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSpLrwgZuW6PJqykbkpVyCbN6zsxFQB3K65q/UXO3p8=;
 b=42H2FdybdN97gUD+WNx2zk0Oxdf8IlqxXLmNOTxDL1HU9KzPQSOpOch1piK7YuXdYILBWGTiq9GzIj3vjIE5a5eBe8A0tOfiucglZcBLsOZDh4EYuXUIF0gnWqQziwY4il2rwUECJXUYY+oHURAYq6745ur40UTbDQ7fiEHsBMQ=
Received: from SA9PR13CA0003.namprd13.prod.outlook.com (2603:10b6:806:21::8)
 by CYXPR12MB9427.namprd12.prod.outlook.com (2603:10b6:930:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Mon, 21 Apr
 2025 01:39:19 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::ba) by SA9PR13CA0003.outlook.office365.com
 (2603:10b6:806:21::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Mon,
 21 Apr 2025 01:39:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 01:39:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 20 Apr
 2025 20:39:18 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Sun, 20 Apr 2025 20:39:11 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse . Zhang"
 <Jesse.Zhang@amd.com>, Jesse.Zhang <Jesse.zhang@amd.com>, Sunil Khatri
 <sunil.khatri@amd.com>
Subject: [PATCH i-g-t v3 1/2] drm-uapi/amdgpu: Add queue priority and secure
 flags definitions
Date: Mon, 21 Apr 2025 09:37:32 +0800
Message-ID: <20250421013910.796313-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CYXPR12MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 696b39fe-457a-498e-ce6a-08dd8075557a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vGnQr3a09yvYv0rsko1K3kTI69TD1dMqv2eWQi33EskgK907yGIPFH2Gm9Sj?=
 =?us-ascii?Q?8SbtkK+GsJlVz7oAIs+vZ7wveQGIEQv00YQzB6W2F0AdyIZeIYgkudGC+pks?=
 =?us-ascii?Q?oSc1uJJrPPLzO2N8fKZamokWllLbqJGmhbXKMq28FE4DLiMXyLvtJyvsgJTl?=
 =?us-ascii?Q?WSZxi9akNxoMJ1ldrMQ8B1vkCzWHsR86G7nemQKWB4DTDAGiHcwzjMTj3PLh?=
 =?us-ascii?Q?xIW4B/TX88aPbzvEg61zK5Ct9wQKEpzYA1z7Oov9PC/IG8rGBC8nWKs6yKXC?=
 =?us-ascii?Q?XR/IA9G0TSDgdYNHsGkE4k21EUVBbzjcQn8uG4YbEXyYcy8zID82TLe0v/A0?=
 =?us-ascii?Q?wscERMxsAq+P8kWw5N1St60gW0F7gBQMsAHiDM6yFO1E2IEjyzM78uFlsNpm?=
 =?us-ascii?Q?mvOXIpmh9zJ/AZWqXTYzjPS/5758aIwYaXt0v3j+SQxwoBbew0LC+S2Mfs6S?=
 =?us-ascii?Q?4F/3bm3nkSnWyxuRAGjFC4gFkjaD+lO0xfux8upT8HkLkzjSLjVg5GMWp+CD?=
 =?us-ascii?Q?Lz3srZZLWVOAo95E1QUE3k8Zn3B9tqIe/QXzEX5gxqn9T9vNI2wSBrUooiCL?=
 =?us-ascii?Q?4oUzaLMuLzY2GfUUt8WhI5QeEWNgVma1LTtCDULmE/mGiICFZp1MtC7agrRG?=
 =?us-ascii?Q?L9PcQIeUcEIzwQfdGhVOG3yl6MljKUVkJNWMucYSX1fvTeag8KW3k8WZl+ez?=
 =?us-ascii?Q?SFfp/vP4+nhBHfBg0AWgq+1HeltUqcAuacaNwp6mROClCwooTQqVUBgs7Lwx?=
 =?us-ascii?Q?aK5hc9JFntKKwZ9Pr5jMINXs1YmIpZmwxA5X0Er0YSWqKPqFQ/fM9QhXRVd1?=
 =?us-ascii?Q?L2+YqNmBRTFbYm0w+2LjwTQDcPU6O3Iv9yC0kWyL2boTZdsJUBJZ4TlkZH10?=
 =?us-ascii?Q?NmtKtC0PWRuIVG44ypPmRm4pdCfq1s9kRl21shJE5kpTvZXlHmwKsB2fvBPE?=
 =?us-ascii?Q?zPQ0TX99TchjAK9dTpHzGWJCCHCzopUzmqU6dhC9jwNs3B6URhzbwWJqqcsk?=
 =?us-ascii?Q?jLMYdbu7WQyrcTPowAUAowG1Jf4x0Xb2d4cBhTU9k6ZIg9PBfCw4jp12oQIj?=
 =?us-ascii?Q?EyPtwi3Jzz+tlxh+Q4kBloySkMj5vVqE18byiBeOxCLrSAUnVk09jGRXbrur?=
 =?us-ascii?Q?trQ1Ud37Wio2Gkw8LVTxdPre25CS85WX3Slc+LZ5EyOL0p/mBLXQULsQvG6f?=
 =?us-ascii?Q?GsHUkYQHevXKpZ8abkRL2LKK/E+gpDuWfswo82RELY4tQrg0Z+hcmEZTYJ7z?=
 =?us-ascii?Q?9pvqpN0yJOhUoHItYHwvc6ZX10++J7QI5O8vMdgQ3KofbCXO/y5f81A4p5CG?=
 =?us-ascii?Q?/nTgeKvTMMSxH//PJJQHLyuEW6qchRqVyL4eURrd/o0Y0CAwVctzp6J5oboU?=
 =?us-ascii?Q?nKmbsjf892Bjdvhk3Y8ZXVS7GDOYfbKIueTXX3XYpQZAvWiIA2yKMHOM7Kmv?=
 =?us-ascii?Q?LR7HEruZT43ESU2xqfhoppQR7WyHtFpgjBK9a0gAeaVtQvT0IE1ylw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 01:39:18.9494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696b39fe-457a-498e-ce6a-08dd8075557a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9427
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

Add UAPI definitions for queue priority levels (NORMAL_LOW, LOW, etc.)
and secure queue flag in amdgpu_drm.h. This matches the libdrm changes
in commit fdf384d4b546 ("amdgpu: add priority and secure flags for user queues").
https://gitlab.freedesktop.org/mesa/drm/-/commit/fdf384d4b546850bc4c200541c42d29a62b2eca7

Related driver patches provided by Alex:
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122782.html
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122780.html
https://lists.freedesktop.org/archives/amd-gfx/2025-April/122786.html

v2: In general, UAPI changes should be part of a different change and only uapi should be part of it (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 8191d0bd0..3f4813879 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -329,6 +329,16 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_CREATE	1
 #define AMDGPU_USERQ_OP_FREE	2
 
+/* queue priority levels */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_LOW 1
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_HIGH 2
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
+/* for queues that need access to protected content */
+#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
+
 /*
  * This structure is a container to pass input configuration
  * info for all supported userqueue related operations.
@@ -355,7 +365,7 @@ struct drm_amdgpu_userq_in {
 	 * and doorbell_offset in the doorbell bo.
 	 */
 	__u32   doorbell_offset;
-	__u32 _pad;
+	__u32 flags;
 	/**
 	 * @queue_va: Virtual address of the GPU memory which holds the queue
 	 * object. The queue holds the workload packets.
-- 
2.49.0

