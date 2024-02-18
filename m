Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A71BC4829E
	for <igt-dev@archiver.kernel.org>; Sun, 18 Feb 2024 05:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78DA10E089;
	Sun, 18 Feb 2024 05:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jo1gsXQB";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FDA10E06D
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Feb 2024 05:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQkmKFtVbtkL2SX5TtqEWegEUUsHLaZCWbEP0TFCUnlgqOlgl/6+JI0TI7mVtY2CWD933EwOeXbEug0RQc6kUrOAC7cZd59yawUuHbBLfKGHO/2tSdRXWKy1sNIuswsqG7IRGlzTyERBYYK8Wr4Tx2eAH7W536ibKqecUBmVqpkCpPmLfaIXwuy2B4ADQECEoyQKUv6XbuXCQynm5KW5ORYVCRnl9zD2iLK2FA5STnCdw/CkB1GELtGjfO3eTwNSqqDu5T28Ar0udQWdYIOJVhfkh7DQtNRMaC7lgsdVPH1DsNb4sF9llSi2rz1EOQa6zpZA052rhd1Xpmu7V2xD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSdowKeDIjlTjKQTAT/67cxs+JAocLnBRJPBorM3284=;
 b=k+mgavKStY+07P+IUrGvohQPbL1z66RtKJoLBrY4j7IubmVxavtvvkuAJhAOeQ8Q2YFAKMBUb7FTk3Szh3UEw1uv3KPsYyUiPh7y9guyPjfYm6Ikfg2NtGlywcYnc8ouNPBx3Ym1YCzQ60v+3HjKTrIzPFfXQD3dwXOI4T7oGzTHO0YHCaMwDn8M2+EbRDfcxonVtubh3i5SL1WXEf7yJdFGbSbut0T+WCOmrKqI8B6vB2iaFaVhi9aBjxQpa53Rs6m9RJ1D3WPlHBwSLX5CwaFyiRzDHV//BiqkOXN9yyk2XAI0sGIGno5KhT+9B0Oov9lXd4YDbgRCtYgR9VP+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSdowKeDIjlTjKQTAT/67cxs+JAocLnBRJPBorM3284=;
 b=jo1gsXQBqjY+9MRIt6uWmdhPR4Bhfl6oK8czEbk8HEmoNTrlYmO/rp7t1yIkAdv8UVVfZtRXnhGTWZQRkH3J7CuPJb6lSCZkCQ4hOMXW5E2tYKJunxzMqSSWLCgGsC+2rXTmdr89a09HeVIxKlFCUh2BHB3zW6sKbht6V1REG3k=
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Sun, 18 Feb
 2024 05:20:04 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::ef) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34 via Frontend
 Transport; Sun, 18 Feb 2024 05:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Sun, 18 Feb 2024 05:20:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 17 Feb
 2024 23:20:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 17 Feb
 2024 23:20:03 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Sat, 17 Feb 2024 23:19:56 -0600
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
Date: Sun, 18 Feb 2024 13:19:55 +0800
Message-ID: <20240218051955.2280087-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c4c44d-1c01-480d-1784-08dc3041434e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpaF5sAbSDbA0woXENk5j+mPhYaR/ZMOhWf8Qg3H/TV1ZwyDYIqa1yOZIn3MgwuXXeSIYownUM/HYZwjbQbA9xy2u+ZvmbA+aM3gppWtLv1ePU228QEIEpHD3f3aQqetbojfxpUbP69Ijn85b9GtLknCRBzQHc5xQ45kyCUw87deQE/zAK/riOCuTBEJ4eHoNfk81iymBkQZk/lgD9KznSFUDpZZDYVK5GWoFYgtKH31WyUTo4ZXB5zYZ5+9dGMWgdLh12Jqdb/Oe4accdZBHAVzLzJ6+UC4mLnde1d7hXBo8KerNAeCHJWqd9ENN9sLWGj/5r81rcdLbUIxEi18q6XUwGN22vdKkValr03c0jeZG4CV5Ei7Y7QsIQk/spF9vIV1PQPa+vSJqASbJvwDg8tMg0AVTnmShrPo26W9PQBgU2ZRo6SnplW36g1r9Z0aST1oWTPxJraITpqXrZZgzAoRlra4o5pzQKEiHXM3csImf5wp6dbP6A2xk/7UOT5KMYZhua8vNXWB+ptzybOSns+jB5+V6LMWJev9zPiLtJAv76YnhWzBNKpWCWGz0VZjZG2tWghXQKwkd1AxEIEvH7TbCO5w3LxWh77C5QGy/a7bracwqK7izaolgKBPYr+oUXoRpvVkpxarbfeD7iqfJaOAB5IxFCia/Zj8o1DG6d8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(36860700004)(46966006)(40470700004)(2906002)(26005)(36756003)(7696005)(478600001)(2616005)(82740400003)(81166007)(426003)(336012)(1076003)(356005)(83380400001)(86362001)(8676002)(8936002)(4326008)(70586007)(70206006)(5660300002)(44832011)(6916009)(54906003)(316002)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 05:20:03.9341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c4c44d-1c01-480d-1784-08dc3041434e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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

add GC11.5.1 to match the amdgpu kernel.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 1 +
 lib/amdgpu/amdgpu_asic_addr.h | 4 +++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 847fb0375..bce2c6c2e 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -105,6 +105,7 @@ enum radeon_family {
 	CHIP_GFX1103_R1,
 	CHIP_GFX1103_R2,
 	CHIP_GFX1150,
+	CHIP_GFX1151,
 	CHIP_LAST,
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 79ce7b5a8..2ee94105c 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -693,6 +693,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		break;
 	case FAMILY_GFX1150:
 		identify_chip(GFX1150);
+		identify_chip(GFX1151);
 		break;
 	}
 	if (!info->name) {
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 0130ae2f0..cbe02871e 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -106,7 +106,8 @@
 #define AMDGPU_GFX1102_RANGE     0x10, 0x20 //# 16 <= x < 32
 #define AMDGPU_GFX1103_R1_RANGE  0x01, 0x80 //# 1 <= x < 128
 #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
-#define AMDGPU_GFX1150_RANGE     0x01, 0xFF //# 01 <= x < 255
+#define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
+#define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
@@ -171,5 +172,6 @@
 #define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
 #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
+#define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.25.1

