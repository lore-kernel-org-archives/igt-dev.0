Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912EC61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 06:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC3810E3A2;
	Thu, 27 Aug 2026 06:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e16SXAcH";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010050.outbound.protection.outlook.com
 [40.93.198.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9F10E3A2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 06:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaOF9Vxcwv/tz+z43ogNLuTv00CEo8872Rv86qcNKyCpHkzwahBQobULtbJrjgtZnXfTMB+bgdI5jQpqPzXYMBp3k2dZ0JtL/7wcc/wQVuHsdMDxopgENH0NUk7IJT5MbWDnf8QqOzdDdY0Ost4koDDK0k3s96sXVGJ3gB0fJO0O7GbAji1HLb7Jg6q/Z/kKsjUW04X8o6+sUNCD7LKNgzYAZk1DgO4Owl7oFXTjcX78I8B28VFWeePxzHlYObgziEDANdfHrmYTEbUMp3yo2Eb4oIMDGK6cvjZNhQ6t924G0GQYZJR+e7H95tIofY9dw0owPkqjj9YikfooCBSLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoR5Tv1PZERWhNp8bL/tEgfAzPl1k1e/nEBSYYhsgzY=;
 b=oCiRpEpcSBIyodk+WwNY8xk9e9fr6d8hyfQNB4ldyjAwbTRej85unSvbRy1pP8P9oNM/WkqIAnZrBswfQycEfxhZEtKnr2qAeDJZ7cleA2ri2YhxwyF6hkOlrRk7lrhe9+5G7+1whG0wOInQslLQQuMqrvCI4q/iWVRAEF2hcmOtxmbjcdua2wUU0j7jaXv91owWoLcAlaf9xEQnLohnG3Nln9TxTwiO5z1JejNKVZZU8efmdjEXlhjFZkmZ/gRl5pRgbUCx161S/y8M4c6hWZqm50n0nCX+yUCdanidkeuoe4S11889vwjOrSSfd31HEdlJPkOd8TXawE87zwbxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoR5Tv1PZERWhNp8bL/tEgfAzPl1k1e/nEBSYYhsgzY=;
 b=e16SXAcHASkw2iAEJPt7QDU7mJBaCRkYntK1y6aW0HownudlNnhGiGHbbxjQsI0UdznmciCwY53NTtf7mTuDj5Cnd4k6Jpw5xLyht6h1KpR4wS0NVrr7MdXlKwSi3owX/lwqz3BJ0jWj4I8kv6B6ZJYz8jzgVlG5pt5bDujkG/Y=
Received: from PH8PR20CA0005.namprd20.prod.outlook.com (2603:10b6:510:23c::13)
 by DS7PR12MB6190.namprd12.prod.outlook.com (2603:10b6:8:99::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 06:48:11 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::2f) by PH8PR20CA0005.outlook.office365.com
 (2603:10b6:510:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 06:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 06:48:11 +0000
Received: from ram-Splinter.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 01:48:08 -0500
From: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Vitaly.Prosyak@amd.com>,
 <Christian.Koenig@amd.com>, <Alexander.Deucher@amd.com>,
 <Pratik.Vishwakarma@amd.com>
CC: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: add GFX1154 chips for IGT tests
Date: Thu, 27 Aug 2026 12:17:43 +0530
Message-ID: <20260827064743.3002608-1-Kanala.RamalingeswaraReddy@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: d6873f0b-94b7-472f-8883-08df0407292a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: yOqVee6W2FEdLERLR4kQZQKxZIym+Qi4jIcV6kP5BKJ7sJdePsJuh9ckVk0rRkCeWzfjyWBzZI1BIs1Nh8/lg6A0vbrWi6adxueMMVueNwrzGqQIO2W6y0O6ASrUzY9MfAXyBSqgYZdfMRSpFcxSTYMut0pwx+oprhiTKKwLlu3eOwiKdOSLxE6zx/Dkn71nhorhJ67A3l25Y1ACjtWsXFoSpK4sB/Lx3z6VlH5RKlCFaZPOcb+Vm/WaTlxmfVpOEGXAOHaAXkdKDGXauQRcyVOG7hU8XqCwgU0KH7L9AjutE+vOw70feo97md2TieoXG2fVOVz6sG6LZbVc3EVGdLUeiQSh36Y+DtQp2QYnjaLhVOqTJxNgrrQzfNjEN6lFkEUR317FwQV8XgTzxJmwgDEeq41fDzr0YXDWs0PQDSKrLNoqSxe66nCbr7lacYITPflDNaiYvrZlyO80ibkX/ExBuZ056nxwzeEVIkikGsJFg41VzZHNNFuTfGtyTPHd2rIUYgkp8LRUpFdGYAyEpLDwSBFceenJaZKgFH3f7dlWWY+xvrZdg+5+suZbSf1jqnFzbr5CotXsTA6isdIGFC71Aa5hYMc+9BIehInJdFn1T3qSQOVIZDoM9L2mq0DmWNDhNgz8wPHQOFu2zn2llkLToOZAtBliQFDaskdQuENz3GFI147ZmqYUXxLfVhSi4yD59Lwm4UPnyd1gXfbTHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QRkEk6FpAgPrDpK40vStr34Zzrrqxq+QlUp16zWJeHKaH/Q6xKul2N8EqiMBow7//ubyZkQ6k4Wxlon5C536D2ikh9b9o2M6XeYvtT9fjsnOl0vFHYGYvZrX/Jx4mCyUqWusWoNU7qXQ1kbJg4SBSzYUB9wv8iOUq5m0khF9uErM62R2+OajdEjPxbDuZlUGM9ocKjnogOxG/6ltHIiteYo5hK4x08P06xOoqIRZi/P21NdFepETVH7o7pJZ6p5mRKex3C3lAFnMYxqUEjkhwf4iyuV0iqEiO7vlOL1Pu/dTrKUg676wanH29UQYI8nqC9YiedBJed38QilHm4962D9trA9mc97siG6/Y3Up15cpv+DpuHYfmWYwwijy67cerRW2FN6+JasilQQY4r+s21hJctd+PH0RqHfNk19AOmyKe299BJUTbhXyqqNpDnco
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:48:11.1168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6873f0b-94b7-472f-8883-08df0407292a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190
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

Add new asic id for igt.

Signed-off-by: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 3 +++
 lib/amdgpu/amdgpu_asic_addr.h | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 4514fff2a..3b1582995 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -108,6 +108,7 @@ enum radeon_family {
 	CHIP_GFX1151,
 	CHIP_GFX1152,
 	CHIP_GFX1153,
+	CHIP_GFX1154,
 	CHIP_GFX1200,
 	CHIP_LAST,
 };
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index b56fb68b8..7d31a582a 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1433,6 +1433,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		identify_chip(GFX1152);
 		identify_chip(GFX1153);
 		break;
+	case FAMILY_GFX1154:
+		identify_chip(GFX1154);
+		break;
 	case FAMILY_GFX1200:
 		identify_chip(GFX1200);
 		break;
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index e7326b0f8..8b6910751 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -30,6 +30,7 @@
 #define FAMILY_GFX1103 0x94
 #define FAMILY_GFX1036 0x95
 #define FAMILY_GFX1150 0x96
+#define FAMILY_GFX1154 0x9a
 #define FAMILY_GFX1037 0x97
 #define FAMILY_GFX1200 0x98
 
@@ -50,6 +51,7 @@
 #define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
 #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
 #define FAMILY_IS_GFX1150(f) FAMILY_IS(f, GFX1150)
+#define FAMILY_IS_GFX1154(f) FAMILY_IS(f, GFX1154)
 #define FAMILY_IS_GFX1200(f) FAMILY_IS(f, GFX1200)
 
 #define AMDGPU_UNKNOWN          0xFF
@@ -112,6 +114,7 @@
 #define AMDGPU_GFX1151_RANGE     0xc0, 0xFF //# 192 <= x < 255
 #define AMDGPU_GFX1152_RANGE     0x40, 0x50 //# 64 <= x < 80
 #define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 <= x < 192
+#define AMDGPU_GFX1154_RANGE     0x01, 0x80 //# 01 <= x < 128
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
@@ -177,6 +180,7 @@
 #define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
 #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
+#define ASICREV_IS_GFX1154(r)          ASICREV_IS(r, GFX1154)
 #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
 #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
 #define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
-- 
2.53.0

