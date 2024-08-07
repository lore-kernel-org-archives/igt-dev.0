Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD3C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 06:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4010E03B;
	Wed,  7 Aug 2024 06:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QCc/q4GE";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD97510E03B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 06:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADh3Nb8+TymuGwEuaPdDCxv1aqmVaxnRStmHKov+4gnWhbPKv41XwXxFojQksRPTlzpwNKxSTYUeb/Yr2dOARumLqdi2KEblsBTB85UoltdmLe9CNbaeuMhyMbaDST+diTvolqS1y2Vop84oBih3UveO7jAfAvgpuQuUNr4XMKY9i4F75q65RKdkzWaRVdimkqPDKHhpaG+QnmADdI9U83dOPJSha29/ZOTVoR6JVKWFeNLTzjbATiE9BvUXMkblvYl6oqxkfrVHJf+SdJjrLX/P99cmITnRP9IwQLAFn6wAHRKB4lCwVkznsA7Ij8P2ZL66lPQ4cutsJ38gE4SJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+atw++TDegrXAuixoc7kYjrLgjjtBiTEmfwRUi2t3g=;
 b=aWovuc4ziZyayeKE8gMBrtAolre32ZdGeJdYeC9Pz4IAcOmuGI+2lgmN7gyIQxntV79oRVBZbVI5KEyloBZUnZGGd6j3ZGQGVcrwZD66xXVTA87Q8BwmU5qt/gVOi7Z81qG2mhz4+6gDYx8p/gexgMqld2/LlwRWQR1wyx0jTciw9X09FPnTGkGVPFYIjLiJASFHaBLA5/S6fst/8XmdFV3vJDIdZZy0MnkACuZAGT8M3c1QQIGOq/RmBvQ8Vixs9Zw8tg7J2Fz+Njk8sfdQc3G8txPS/XM7JglnhUHrpwIghqKfudETUX9bmIfPXmFYV9Gzz2iIzGYb/D95PJa8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+atw++TDegrXAuixoc7kYjrLgjjtBiTEmfwRUi2t3g=;
 b=QCc/q4GEmV7XYMot79aWdEZQt7jXVbyTcKp8+/cpq2UdotaeVqpVzQfF9LH5L2pjJmca7fOxqWcdhTMIEBp3ieEq9ob1SK2vyrVRzY5qx0AbXZ9WoSY6V0K1F0cgXF7dYbram97TOkWNZn9luzGZf64ExjXcdDvjBoltEsNknUI=
Received: from BY3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:39a::21)
 by PH7PR12MB6907.namprd12.prod.outlook.com (2603:10b6:510:1b9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Wed, 7 Aug
 2024 06:34:48 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::ad) by BY3PR03CA0016.outlook.office365.com
 (2603:10b6:a03:39a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.28 via Frontend
 Transport; Wed, 7 Aug 2024 06:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 06:34:47 +0000
Received: from ldev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 01:34:45 -0500
From: Tim Huang <tim.huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <alexander.deucher@amd.com>, <jie1zhan@amd.com>, 
 Tim Huang <tim.huang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: correct the GFX1150 and GFX1151 IDs
 range
Date: Wed, 7 Aug 2024 14:33:50 +0800
Message-ID: <20240807063351.727312-1-tim.huang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH7PR12MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c32ca4f-6134-4802-70bc-08dcb6ab08af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jBdyNUuN4vJ5KzoGvZD9B/fdvvsQvSiilgxIw6AwUnmRjvaK43uMt1CyVRSW?=
 =?us-ascii?Q?eJeKpwCtBJuWuxle12oJ2TCPg+NKSqO7Fap8iZgtjljnXJW6CIxqJK0h/2ud?=
 =?us-ascii?Q?znk/Pzokf8v7ehECuzyqzdrIhBAgAqNhLvVxN/WyDuO/7VOhOJej3hJKVYWa?=
 =?us-ascii?Q?V6t85qb0PGxgzELxul7t3yElNknWZkG9ubzVIjFtK3rX+nBBqLz68RBgUujU?=
 =?us-ascii?Q?PvZtxvNv2wK/SKIWykH7QXayNC5xPX66T/SYEJ/uqstoS18Py97xrEZckrm3?=
 =?us-ascii?Q?mBjz0AbMfMkjyOwIrti19D2b+Ea7RpEFfz8stQMuKUpzeuzzdhdiUc0xMc0a?=
 =?us-ascii?Q?e5Z/Qnf2FehYS/2cAetBKaXjk5HBIIgZyUz2NkKKdGKf7xzjIOqzjt5Gjsvx?=
 =?us-ascii?Q?ohZInn79MIQQuYOkFu1DGJKC2ggrfoTaNLX4ogcnk9rgXM7WGd6R91TnyApM?=
 =?us-ascii?Q?ykRoUO00NaZd8AVgXmZ+5/STFzA5vQr31QQ8pgKujmPjAYJJPm+jvJlb9Xah?=
 =?us-ascii?Q?53Po5pyVPNyOuYBeBRwe2qg62bDZFdRe6TGGBpB/CQ9v5LPn2pU590kn0qeU?=
 =?us-ascii?Q?3U6OX6wsIE+faGZ4GBm6OfmVxubVABCMNRZdKybJqahUU1vJUlobwd+mtjkX?=
 =?us-ascii?Q?3TyXwx+Cv7o1CldkSVmSYtaG41veAeL9R61082ZHeG7isnhzP+hmtgA9ljdH?=
 =?us-ascii?Q?Qj9QjO+yFV3YNgUbnQsTjMlFxVG1ArvNrd97nb4u6U6d6cH29HtSjyBU6x+J?=
 =?us-ascii?Q?GCeoKpktpeNjGRgkR92AJu2WgTqKgS/jNBTZ8/Y3F9CiFrEGzUGVyPKvv6XY?=
 =?us-ascii?Q?6ris9jfNkn2HaTvk7QzYa0f7lyPX/a3PDcWNK8Ep2xe9Eg9B2TNVyXJ4prrN?=
 =?us-ascii?Q?2CHi2k8akp0cC/0fYHH/H1CnVoOClMzqC5bypaLnuvZ2ziBHyKTuHYtgbtq0?=
 =?us-ascii?Q?cdWayR1Z62ktWn53W7RljADkzJV/7CAM3dD2e8Gr8WV7zsDUyBKti1CRGnp+?=
 =?us-ascii?Q?yXK0ikZwIROZzqbOUeMkDyp1nhaNyqINKfWrJ3ClfcvJ7DZANwH9cETn0aOX?=
 =?us-ascii?Q?Kopjs1ktn8kbZBeIBWm+c7o6M1KDIJWIp0y82/CTkXqiJQxAe8Xv6fyMLHz+?=
 =?us-ascii?Q?b87QzO/7LSE4oQyjztOHzdy+iw4WcpAxFQ3mQN+B0pmwL94d4U+YuBfmVKCY?=
 =?us-ascii?Q?Z2oNHdw85XH2mxDP+/jXn8s3qkyOejLxEjAB326c6SWohAYkOBjMkwLaZXeE?=
 =?us-ascii?Q?uUPBFu4AZ6R/d5ao/oOYdP5zVjZEbRCIkqETYfG7B0UZvQihx6JGrwtmpu68?=
 =?us-ascii?Q?MGKuvNsyJKNfNVhjZZTBptz8MPgcAfWZdIukX1OyK736lg+cUHWvFZKUdp8z?=
 =?us-ascii?Q?lHQTEwfHOytDUhgtBrmCxMdPUMx8tc9RbF+3tvOTgtE2PPHRZyNgW2rxZwqS?=
 =?us-ascii?Q?892Y/GO6q5adtTBqTy1sPJbValH+oJWT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 06:34:47.9427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c32ca4f-6134-4802-70bc-08dcb6ab08af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6907
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

GFX1150 IDs range from 01 to 64 and GFX1151 IDs
range from 192 to 255.

Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amdgpu_asic_addr.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 0ecb0b803..3829b0306 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -107,8 +107,8 @@
 #define AMDGPU_GFX1102_RANGE     0x10, 0x20 //# 16 <= x < 32
 #define AMDGPU_GFX1103_R1_RANGE  0x01, 0x80 //# 1 <= x < 128
 #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
-#define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
-#define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
+#define AMDGPU_GFX1150_RANGE     0x01, 0x40 //# 01 <= x < 64
+#define AMDGPU_GFX1151_RANGE     0xc0, 0xFF //# 192 <= x < 255
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
-- 
2.43.0

