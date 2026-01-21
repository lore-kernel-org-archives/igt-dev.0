Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B009FCA5FBA
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 03:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FCE10E0C0;
	Wed, 21 Jan 2026 03:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iU+uFhBU";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EBE10E0C0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 03:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvoLI3javjXTkNQVURmea0kMQY/STHXuL6LFkcAen4Yu4DhjgoNhAmu590B/sOZyhFyccJz4O+UieUTf/0Iednbhk9s7Krfj3CO0fMINaH4mtPbV+2SlNy5U9nljbQEBSMp48FRTa6dpiizX4jpHgCPOn0EUCG9lxUMuAVxN6vrTVcDfiJdL4obaENF8N0DMgWSNPEZ5QMS0Jf66Fymv6IBUIyRuL1fpbiyYQqkijDa7knuHQ4B+EPPzzPkRiavC5U4uas3j1OV3u3UQdqpNp5Szpe+ucRHIY8cCjVqBTHonYCrM3CAp1FxI8cSL/sFaZH0mBX2NaECFSAhcMwKXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lU2Plh5m8Vh0S5sNE82D4VvsBI3ZJNdKva03dOi1Dc=;
 b=O+ThkEHD4/MboNu5N932aup6VFroSXh49WJUYfRgoJw8EMw15a+dFWKeXvjqwaNT0Ujv5GCNqYMVW+hJMG9HYmGrrrVLo+ayf2Jf1lGssQkSqKx1c+OQgnizXUXo3kcOu5gLoCR+lbib8/e6zVnMSm9Fzps00fYpXQ+UfIHI7P27fGLEpLdaYUaM2KVFe6JwLW74xLAzPvZCKQQ/jEElcZ0OtZB/kHIQE9gWXISj9osVS55MGMHmu8mxaGEDKdN3SXFhWrZSHueVfbo6T2rUF/8ght0hiwjHa3riy1rNbiFuZ3SxWRsKpUqbsq4UAs88L9bbWe4k0nl50R+xeQNx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lU2Plh5m8Vh0S5sNE82D4VvsBI3ZJNdKva03dOi1Dc=;
 b=iU+uFhBUtU6LTmCjHgzg2ZSWl1//oO1tp9zEgOmpFXXoTTyYadO6GYpK46LXUPOSuk7uJUdtDORUGPcgLRMPIqMBZb3mo645S7G6C+v7l7L1YiJZQZTZlgif5Ie+tVpK7/UJwM9QPFa+OMy+pJRoysii5z5zFPEkig6Wgo90YcE=
Received: from BL1PR13CA0096.namprd13.prod.outlook.com (2603:10b6:208:2b9::11)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 03:41:01 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::aa) by BL1PR13CA0096.outlook.office365.com
 (2603:10b6:208:2b9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 03:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 03:41:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 21:40:56 -0600
Received: from kylin.lan (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 19:38:13 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>,
 <suraj.kandpal@intel.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH][V3] lib/igt_color: Improve fb compare time
Date: Tue, 20 Jan 2026 20:38:01 -0700
Message-ID: <20260121033801.407475-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c994493-1224-4c44-4fce-08de589ee551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WJqr7TivhbLlOKkvnG1MZ4ypHTUX/ecVsVRj6Q/SU/o5vwBU/KXzXOc0mEoL?=
 =?us-ascii?Q?wzfFa+Rv89m/fJK7SMyMbGcvviFidq/TI+so4SouXmOOCn3BqVZBHEP4URSl?=
 =?us-ascii?Q?ebM3EgxTVLCk1g/qNASC3SLXcI4IxUuolBsv4FHJM2dNi+OVaExBCIDcKQlS?=
 =?us-ascii?Q?mctgFulKVUBIKlBNN/kTClWfgXb3R1skzmcAbVzvmLhE9VLgo3Hkmbsj+shO?=
 =?us-ascii?Q?ByfypVx3Jb9OfOPQQdvocPP+POSomicBM9DYCH4BQfEqzWqrHcmNywBs+qk6?=
 =?us-ascii?Q?I+KnnLD327CSPIEU9ULQ+TfXY3skYz0w+nBNMLteyMITMgQMMishHq/uLI8+?=
 =?us-ascii?Q?vQbykKvIv8cbmQHVAT/l0Qvk8cY001FIFhEqYuTD5PQXG4F7la2bzuGTeR6m?=
 =?us-ascii?Q?AFv0nBq72S2IPcrNSmsiOIPsvOC4+/c90xchwffEJ511hT1cXN5GcJfCICCS?=
 =?us-ascii?Q?n4NaQD+O/BMPRTaJjDKarwMKeObJGsqlgCm9SIvRbsQaUfTNTwkU4olIDr5v?=
 =?us-ascii?Q?k5nch3PZLds5ZsjN+MuZzhV6HHKqwmJ85OjM8ZY8B9dQspiQE4elOlWfSpaG?=
 =?us-ascii?Q?zMQ5oNu3fA8Aogs5fNy9u53LoN7HpYpXC/P1FW22cM3noWnR2TggrBein1VN?=
 =?us-ascii?Q?slCkIG8l3gOMRmTs6Z+6CkM3N6nwme3k4F16s+2qi06ySvaaIXPMUxRkny3o?=
 =?us-ascii?Q?M8t58m8H0WCnKgZLzw+5w9QZW5UXgezlihhVooGEQqIVTVVTQWquGwmRvnPH?=
 =?us-ascii?Q?R+yBPOwOT2OyXkdFfbJwDqfmMxPW3Em55Tz3n4iKd2DtgUXEqR6mI/pOAJ4Z?=
 =?us-ascii?Q?8uVygCdwQyisrtvOIlHBZa583jFL2kEtGJ6OpZ5v7jKqbkhDPVxZretzu89l?=
 =?us-ascii?Q?VkqPdS/9O8NW9jtVyabm9gzvGS0LiDr7eq50TmC80iM5Kfo7+TcwONVLFlQO?=
 =?us-ascii?Q?lTkTdyxhSd9YUkw40NxhqNZCetbkYvrI3sJgdQ22KCdC9gTXvKvJfYRC0Asn?=
 =?us-ascii?Q?PiBQ6dM0wC4mNLM8XnmoEK/ThTsYTE2wauFpPtEhXDkTl84oVICK+xyeVQGk?=
 =?us-ascii?Q?kF4q0pNwVjLeexZsjxaZqeYTxCttIfQx6iMHx6KCRDVGMPFlyQ7lYTCJ8SHn?=
 =?us-ascii?Q?VWN/e07aNU1I8abOQ+Im7zstSV0Y4Ic0qZbkHS46HCFiOujoj+DxTZHCvoBs?=
 =?us-ascii?Q?ZQ9eC23OCD9V4eD9evHHrXxKjFrkr47o8zLCN51VnYGqE6devcAJBvD0r+pY?=
 =?us-ascii?Q?cWI2J2WznVkF/Rjbw1IqIuvMWmfLPUGw1d8B8PiprQIrCPM8hY8j/qmOzKwm?=
 =?us-ascii?Q?+X2SxYidR2mA3GDRHT55oCvcXyGB7EQuXyzvgm+p9mjjSp7zSNKLBFeFhSrT?=
 =?us-ascii?Q?Dlon6e6iQ2P5dGOLJ8/T0joALZfkOoqqjasrakSzmeLT8lmM9JB3Hj2vVryJ?=
 =?us-ascii?Q?voDFDW1ZZS1YEJwyD3NZiL2cz0c2/NtwJIMIvZDYSgIECQEFnmW0/JMuyUcH?=
 =?us-ascii?Q?w4J95aX+RdEN6oUKc4W0tjLXmRuHX0fOAI6y3/K65ktLi//prdXu4aFRDxKQ?=
 =?us-ascii?Q?9ELCD7fUCXjQbduccfF5R3gHJTik6RGADFSdhUY0pEvAV1l/e512JL+MLJ5P?=
 =?us-ascii?Q?edOg1Tv92s/kQ48wtNxGfWWSNtEILq9WeQdrJM4VTq7+cpcX2Gd0Yly2P1cs?=
 =?us-ascii?Q?COwDpA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 03:41:00.8232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c994493-1224-4c44-4fce-08de589ee551
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

Copy the memory to cached buffers first to avoid slow memory accesses
on dGPU.

This cuts kms_colorop execution time on dGPU from 1 min to 10 seconds.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
V2:
- Change Improvement to Improve in Subject
- Update comment style

V3:
- Move igt_fb_unmap_buffer after cleanup so map1/map2 are always unmapped.
- Handle partial allocation for cached_p1 && cached_p2.
- Replace memcpy with igt_fb_map_buffer to more speedup.

 lib/igt_color.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 4d94421ba..54cfebc40 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -575,15 +575,38 @@ bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t do
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
+	igt_assert(map1);
+	igt_assert(map2);
 
 	igt_assert(fb1->drm_format == fb2->drm_format);
 	igt_assert(fb1->size == fb2->size);
 
+	/*
+	 * Copy WC memory to cached buffer for faster reads.
+	 * Reading from WC memory is extremely slow so this is important
+	 * on dGPUs where framebuffer mappings are typically Write-Combining.
+	 */
+	cached_p1 = malloc(fb1->size);
+	cached_p2 = malloc(fb2->size);
+	if (cached_p1 && cached_p2) {
+		igt_memcpy_from_wc(cached_p1, ptr1, fb1->size);
+		igt_memcpy_from_wc(cached_p2, ptr2, fb2->size);
+		ptr1 = cached_p1;
+		ptr2 = cached_p2;
+	} else {
+		free(cached_p1);
+		free(cached_p2);
+		cached_p1 = NULL;
+		cached_p2 = NULL;
+	}
+
 	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
 		uint16_t mask = 0xff;
 		uint16_t shift = 8;
@@ -614,15 +637,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
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
+cleanup:
+	igt_fb_unmap_buffer(fb1, map1);
+	igt_fb_unmap_buffer(fb2, map2);
 
-	return matched;
+	free(cached_p1);
+	free(cached_p2);
+	return result;
 }
 
 void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
-- 
2.43.0

