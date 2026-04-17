Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1240F8E497
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 00:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F59C10E253;
	Fri, 17 Apr 2026 00:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Za6o0I8";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459B810E253
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 00:21:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vW6EtTf0tZOVybOGnMzVIWuKtRd/YH/vz13y7X04rcbATF6S2L1UT4wY3lWnhtjO43sbsWHJgjDxAECLb6BlW+w/EGfs07OIaLIFdr1xGGLydwCFEkQDsEw9dwFuLgL5CH3YwHYpzpwiTBm3Vg+VLFsdGEXDOR5jqrJGEFjH7wiQAqMjyKHlPro2MyVkUeMTKNWBEl0nQiM0JLO4s1ChXsZUujREmCwy/Yfmy5TRDxY872G7n/1ix9QWT0Q4EgnL0ySBcEu1qLaduhNL1yaXuDH//y4J83fcCeLivqSbk+L3ePTLWu5WtiU+CHwuCYrUcqM8AZ4sYQmNcm/pnepZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+9kxSoeu3Bx0ZbxfYcVXiU6db94ApnDeLlmru7Szu8=;
 b=XyNGiPPC6xJB26WUJl1XWXTN7Lxy3wThBMobEMCNLckF2R8AkSg3DPK1Bf3TqmwQvVW2i/L+gPCC10Flyl81An1rXgIJ2A50BPpwCF1NpJrHr5Y6PpJ1wavEnb4HtBeyFL2dKLrPRHswBJ7ZBv+LaANChJiR+UkmsUgR9oKYSRGeMc+Pymbd0rOY4iZmha6nI5vSO/wevA7Q3cX4Ma3EpL1J3Rer85Udd9+gyozf9cspYFw80jEegSWksD4EUvO9vyOi8EuqCfgi5+Y5XVS4OSl6PQpEzc7709Z7kIwGJcGIT9wuwxEVd6v7S606loCm8Mu72SzNIPxlGUNRf/3aMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+9kxSoeu3Bx0ZbxfYcVXiU6db94ApnDeLlmru7Szu8=;
 b=1Za6o0I8tMgVxtMCiw5mUk5XFbhIPD/aXO5FfjaSFLJO/p/6QlVtxUjC0uKPYo02U3eZgt6wVIxM8AjiwWWE6ntrn9NlJfcbeck9X6iOdcSPZ86Y1R45cdwpuIPyOVx8sLFiElj0i8ZHRAh3Ogl0g9JOg5HVAaWL2fprVSsk3lM=
Received: from PH8PR20CA0013.namprd20.prod.outlook.com (2603:10b6:510:23c::27)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 00:21:45 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::b) by PH8PR20CA0013.outlook.office365.com
 (2603:10b6:510:23c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 00:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 00:21:44 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 19:21:43 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <aurabindo.pillai@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/amd_plane: Remove unused parameters from
 test_plane()
Date: Thu, 16 Apr 2026 18:21:16 -0600
Message-ID: <20260417002116.94208-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417002116.94208-1-alex.hung@amd.com>
References: <20260417002116.94208-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a4a0a7-3b79-4b56-6ed9-08de9c174e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yd6zgMVzGyFcsxQYaFQ0iDblGgiqD5+fRSKWiaq89kEnkk7/RJkhPb5LeVY6iQEgsnN71pV01lk7B2F7zNFyrXw/vxeXHoQ071maL6AwEUjios+jMEM75HF82GJDTkRrGtbxUU2aNccBN71NPe6YQyuBiYGadBAYR3Nz1BqcAE9HblMScX2n9UNx+uuuCu/3clvrdEp/TvWJk2WyEQb3xy3Yf+FxM8N7IJZ2UA0nXUr8u05kgVmYPFiGrm4D1NKTEXICPKzVYkNNA+pGrTskHPd8f+6QpPh3APwL6Kn+k0BeJCP+hNAviJQiaSW89j0vW4W9ZpTU9QEmv/DueRFi9IDdHBYgITnwZPgES18brIBjJHERF6K0+F+bwV6V1HVGsq7ewR3qCCKB0nnVSnl+QPqpHv01Asdt6S8LTQjSyudEY5JH8OfQu9z8GckjuXROMvr/Ja6e4V8SGHcQFDurUEfOcWdy8rm1hs6I5KSvi8mx31S9XSaf3PDkunIYT2yUSrNKD3HFhcCEP0Ej8zjOronk+fBHAE+BTIxmx6AChItjIFxSXUyiQ4Yj880Afi4lQhv/Kj60vJ5MZdeuLC9wO70dMwBAeASagzFwg3t/nLiYF9QY/XIZUexRTjGcA30LcmxxICSlevWNNqWRxAWZNfjv4GVWihy2QeNWdfDhPItsNxtc3wDdGF9ubgeTiZITtWQ+yzDVPrun6V321qkYXQH2ly4citeT0HqMSd2ZaDlvF3cz7VgBYiOoAU8mum/VSei501HUI2KEaDjt2TTSpQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zYBE4bjncjxNsbRvEa70b1inGKXRC4C1trUVNOj44RtLcD8vYF9Cjbz9q6z9S0LPuLXpfrvz99c+zoWr9/727VGkR0ID8oB/9V6KS7KTKCzz4DEINE5/754P45yBayqJxXsbZXmXZdsrii4GiSYiSjT9toyfAOWGLNs8RZaabFkYSdQdkB550Jd3r2XjWeVmFrtG9aElrcQPWZuaQgAKA5d6dZdCOHWIxG3Sr6c8PbZWfmzdIaT3C93Id70q8Q4zbSSWuBcrZrDpCtuf4rSlKbLE56wjLHDrrR88nQcCD5XuxWM0C43HR2M6L+80C9g2lP/HV+W0bxmjSzRG6gmp+0S9q3pnTMOBuvZcn0H2SjqVmtonc82fVLrPRE0JcX7gP/qqaZx4tIYKFXcUBGWQDJqQrlZoVZ2QDkBSnraZIeaPNCm82owt3qPSgBy4VwJK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:21:44.2817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a4a0a7-3b79-4b56-6ed9-08de9c174e31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
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

Remove unused w and h parameters from test_plane() in
amd_plane. These parameters were never referenced inside
the function body; only dw and dh are used for the cutout
and primary plane sizing. Update all call sites accordingly.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_plane.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index e63d4dc2f..9a08f8e29 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -378,7 +378,7 @@ static void test_multi_overlay(data_t *data, int display_count, int w, int h, st
  * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
  * a ref crc per flip)
  */
-static void test_plane(data_t *data, int n, int x, int y, double w, double h, double dw, double dh, int pw, int ph, struct fbc *fbc){
+static void test_plane(data_t *data, int n, int x, int y, double dw, double dh, int pw, int ph, struct fbc *fbc){
 
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
@@ -455,7 +455,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 				if (pw <= w && ph <= h)
 					break;
 
-				test_plane(data, n, x, y, w, h, w, h, pw, ph, fb);
+				test_plane(data, n, x, y, w, h, pw, ph, fb);
 
 			}
 		}
@@ -494,11 +494,11 @@ static void test_scaling_planes(data_t *data, int display_count, int w, int h, s
 			/* No need to scale an overlay that is bigger than the display */
 			if (pw <= w*scale[i] && ph <= h*scale[i])
 				break;
-			test_plane(data, n, 0, 0, w, h, w*scale[i], h*scale[i], pw, ph, fb);
+			test_plane(data, n, 0, 0, w*scale[i], h*scale[i], pw, ph, fb);
 		}
 
 		/* Test Fullscreen scale*/
-		test_plane(data, n, 0, 0, w, h, pw, ph, pw, ph, fb);
+		test_plane(data, n, 0, 0, pw, ph, pw, ph, fb);
 	}
 
 	return;
@@ -532,9 +532,9 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
 	for (int j = 0; j < ARRAY_SIZE(y); j++){
 		for (int i = 0; i < it; i++){
 			if (toggle)
-				test_plane(data, 0, pw-w, y[j], w, h, w, h, pw, ph, fbc);
+				test_plane(data, 0, pw-w, y[j], w, h, pw, ph, fbc);
 			else
-				test_plane(data, 1, 0, y[j], w, h, w, h, pw2, ph2, fbc);
+				test_plane(data, 1, 0, y[j], w, h, pw2, ph2, fbc);
 
 			toggle = !toggle;
 		}
-- 
2.43.0

