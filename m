Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B5D2ECF6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 22:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E039110E169;
	Mon, 19 Jan 2026 22:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E6Ah4cXp";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF0910E344
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 22:43:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hr2uXE36yyOGznd4hvW9VE3z+5Q7iTRiy14nSB9AEVLRa5zpMvbH5D31d0bf2j9abM2PNpUp0nr2AGFqADSOSoSOo57qWpWn/M6xqJwcarndiDWUryqR+I0+TnQmLy87ybHh1xbU8hyuKuhz7RNljSw8fSRz50jFpYp2I2RQssPp7JqWkRe2MToFD6VcHsC0UOAfXIC+4bTDw26LbOgI4m0EI6dnK3OM7r6uM4wNVa9hFC+wBY2RZn9kvzMVzJvkXW+XcfzxVo6xuYqyWstWcnxDOuJiEXzWKFBf3oe7aNeyFnIoPQIXEpvYMvBOj+P7OLkCcOV7xsuSoRn8YTfgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXXMt/rEHeIH0IFBXem76E8GMV/B58gKL0+opsFrWjc=;
 b=ds1OurjUg9LDhH2mFGM/PIlK/dj523uMzdbq39DF+VUsXjaEXy5M1D04oMZsjGWBVtmp24vyI7hC7C7BUDCEz+UsEM5d3qLw9oTNo7Rx2gD7KkwhTkMNy3g3SSeike9L27/44E2b1dluJ9YPC//HaNuy12qz4lw44QeFB/9rgLcyA/le/hjkHROXiofPmrzMOrqcgqQ8kewETPsyk8LzoUSUBPDjJQiLSwPtkQRvWpS2KXbboJfESEuPyfqSEaZd4VmcG/OhPSrjTJ1jHpJSOclUCYuY6DIgqR8A6S6e2O9n7Mp6yPZLEIvc6idABm0O3/hudBWiKDOlEwljRGF2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXXMt/rEHeIH0IFBXem76E8GMV/B58gKL0+opsFrWjc=;
 b=E6Ah4cXpXEvZsvBpToPfnvgqtWpwRA3ynor521lCPJsBm4lo4rUD9ZnSU0OyGEid5d3CJC2Yzr9Y/Xp8fp7GlWQ81EV1G5pvUVu9G8SNscHBYMM0bwIhVyQiRsXoXGNBuZEZRkTeI8w9ypOJLnxYtrv4dyxlsXAHiU6HOlAsKMk=
Received: from BN0PR04CA0194.namprd04.prod.outlook.com (2603:10b6:408:e9::19)
 by DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 22:43:08 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::ed) by BN0PR04CA0194.outlook.office365.com
 (2603:10b6:408:e9::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 22:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 22:43:08 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 19 Jan
 2026 16:43:07 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 2/2] lib/igt_color: Improvement fb compare time
Date: Mon, 19 Jan 2026 15:42:37 -0700
Message-ID: <20260119224237.561000-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119224237.561000-1-alex.hung@amd.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DS0PR12MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7904e7-f416-4509-7df1-08de57ac1deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PIfCnMDdQXs57Hi+pnMMmGTbt0tNAk/k1Me5LJaHUExU3OfDu3D7Uzicep7o?=
 =?us-ascii?Q?ga6O4IkP660HUTGeUrQeoqMXfIuGpMipz9qm5xXhML0BWA+J8z+M9Y4WPtQT?=
 =?us-ascii?Q?KVaB4NOcfEm/PYACeb1O83DqOc2QjbZ/jetnfd+qg/udqoKvPW13wZMPm6mL?=
 =?us-ascii?Q?Bqz9S2P96/kL0zsNOQK7iyke8qLUyX/OW0I8GytKXz2aac8dh1avN2Tj9B0h?=
 =?us-ascii?Q?IfKO9ZebXlJkXkhUjrKxvnSUlGmEmoIEzvYfVWmMSqt99Wlk1qXShP8bUezW?=
 =?us-ascii?Q?npUghz3E9b+h357wXcmEzo05NUqhSUY6T2UbBe6V7+NUgB0oooj69kSuXPIu?=
 =?us-ascii?Q?rjmmHS5C92yi/FIRYKdcIFLnmaMNpn8GvQjnApKbzx7aW7f7hisWMD/u9MFM?=
 =?us-ascii?Q?gpZ+a0JUqTMBhnHsY+geuT5fOKgOPENfFzDj5AHSC+SLVEV6NgShtO39RcTp?=
 =?us-ascii?Q?vyTqbMj8KgPD7czD4N2ESSr38qCicIPBMDh8mB6N08UtIIkN3P0SginRWzg+?=
 =?us-ascii?Q?iMtxOW8bTKBGTpOmVg0XNjW2YN7udZyUaQTyiknop0YebKWSbm1H/Jomx6U6?=
 =?us-ascii?Q?ndSt5jZbvZQ0bPWiYH1Evr74Lj95xirLkbILNJxhTn6EQC52jMIcHUCuK1Lh?=
 =?us-ascii?Q?DaMANqFZOPj8jDDw0S58ezIvNE/qGTLd0f8WLpHX2FRaQIThsvHOzfxozAOZ?=
 =?us-ascii?Q?+mW8zIrGm4o8wsCtEJy01YccT+fRmdh8SNNzNHVcYg9WQYD6j7ANUrodM1xU?=
 =?us-ascii?Q?zIPF1oaVe0EhftVMxPM7294y9V/wAq7q85+1XY0/eTUIaNLUGGykN0DQPtUx?=
 =?us-ascii?Q?U8oYc4iN9PZvwmyV4QLLurUB1mAXTRFuBc+oWQ+xcl0g2mdcLPDbErAQ56a3?=
 =?us-ascii?Q?ZEeT51e/uO9uF8YRBfscIeoajLJZ0FBvfN0pTBRrSVT7qOevW66H7Vn+qqM5?=
 =?us-ascii?Q?3Hpyr/E0A36L1vOB3fuhjWvhbdUMVXR7A8n+BOLwPb2cl8wGO2bKa7UiXmrI?=
 =?us-ascii?Q?qPUZfY9/IAewARzVvXTQZ5Vnzi8RLbJNkv3uhMhR7NT4uCy3MJIi9NwvFTS8?=
 =?us-ascii?Q?XP0taWfN1NrqtTp8AhmPUezGA/uIGk+Pwc1LLaSBrspRs11Fp1IRO60dlfuy?=
 =?us-ascii?Q?Tomsa/Z75JOxEtcy0Rey0Ek1Wntu8G0MwqNf0g39tKZiwUPz431qe/wexvIS?=
 =?us-ascii?Q?/turGWOTnP8xZN5z685TGMfv3YS7CBJcMunk/bA3aCv3A+GXKycHjGQpLTvT?=
 =?us-ascii?Q?HOZy9DX5EC7NmOYtcmRZldEpBBzCm5YzU8CHljkogsORVpNbOt+lcoYrxLDk?=
 =?us-ascii?Q?tPeAHwklzzIzUaywv9sMyUbB618HCjYz216WVeEZcVgUDIHbyiPbb09nibGc?=
 =?us-ascii?Q?d6e7QvZhtv7ox9jwbQEwa7KVKEJlCkPffbJL2d/VYtDSvJGEhWQjhUkJaeHL?=
 =?us-ascii?Q?Z6EegsOPoSgbuZ715uIyxX1Z/w+uucgspQ13k0wlEUqDrqNX1jdYFdXQQYEU?=
 =?us-ascii?Q?JMSJPwUIGpyFeNjlQRYip0kMwPYk0UtoZnyA8pa7H2cz678iA0jz3SfEUBVu?=
 =?us-ascii?Q?y0rwDyoigVO4cVU+OAqyNukZ3wM8/8UvW9NtgBFSDo+SbYYte1eQAirOWVw6?=
 =?us-ascii?Q?f66g8RSJgVKoOb43NlrYYvY9k1lV3h2NFECWmvb0xm/SAIE+oLFqAGuf4xO4?=
 =?us-ascii?Q?BU8MtA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 22:43:08.0725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7904e7-f416-4509-7df1-08de57ac1deb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7771
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

Copy the memory to a cached buffer first to avoid slow memory accesses
on dGPU.

This cuts kms_colorop execution time on dGPU from 1 min to 17 seconds.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_color.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 4d94421ba..8b2564d40 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -575,15 +575,30 @@ bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t do
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 {
 	uint32_t *ptr1, *ptr2;
+	uint32_t *map1, *map2;
 	uint32_t pixel1, pixel2, i, j;
-	bool matched = true;
+	uint32_t *cached_p1 = NULL, *cached_p2 = NULL;
+	bool result = true;
 
-	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
-	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
+	map1 = ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
+	map2 = ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
 
 	igt_assert(fb1->drm_format == fb2->drm_format);
 	igt_assert(fb1->size == fb2->size);
 
+	/* Copy WC memory to cached buffer for faster reads.
+	 * Reading from WC memory is extremely slow so this is important
+	 * on dGPUs where framebuffer mappings are typically Write-Combining.
+	 */
+	cached_p1 = malloc(fb1->size);
+	cached_p2 = malloc(fb2->size);
+	if (cached_p1 && cached_p2) {
+		memcpy(cached_p1, ptr1, fb1->size);
+		memcpy(cached_p2, ptr2, fb2->size);
+		ptr1 = cached_p1;
+		ptr2 = cached_p2;
+	}
+
 	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
 		uint16_t mask = 0xff;
 		uint16_t shift = 8;
@@ -614,15 +629,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
 				igt_info("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
 					 i, j, shift, mask, comp1, comp2, pixel1, pixel2);
-				return false;
+				result = false;
+				goto cleanup;
 			}
 		}
 	}
 
-	igt_fb_unmap_buffer(fb1, ptr1);
-	igt_fb_unmap_buffer(fb2, ptr2);
+	igt_fb_unmap_buffer(fb1, map1);
+	igt_fb_unmap_buffer(fb2, map2);
 
-	return matched;
+cleanup:
+	free(cached_p1);
+	free(cached_p2);
+	return result;
 }
 
 void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
-- 
2.43.0

