Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6127CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B14310EA76;
	Fri, 15 Aug 2025 04:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b4zGA3O8";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B21610EA76
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:13:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWnnRtXgy9z7nRj5BMdlD77EaFcrIX5nnCVk+av69dMrDjejzxT5mMMgFXcOTPHVFQkM8p6Tqyoq7/GIWA2RFqhN56bZ8WuTQNi1mz/pm4p3QhMC3t83cxUCT6bt7bxqTSBj4uJmPKkJlEQw7vi9n4DSHKmHyjDoCUlY9RwPr6ZJWA09O646a/p9fzvOmRK3C2RYaEodmem29QngSrv5LjBoZVA+/ESP7wWrknHpYubZvoRHS1a8fyHgMk1SjawVF+RPk2a1Frr3MkrFTgOUwRCUCI6B7auHVOEoEN6lJqXBiJHZB/tKmqkfu5a7blDsEVqEosl2UOH4i7ZDXyWmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B3f3aee2X5p+obbngizslVWN5Ig+Yt6ZthQpuaV8Ak=;
 b=c4bqSYztQOX/X2d4xK0j05XWj+2LHAQM+mdBsCtTb1+1vQzn+yjYDKz9V0oed8QAlJh4PrB+54blH1tRQwnnQdnJtxL2F0W/jKnmRQZ8GT0SjFU3f0824EZcoYo7Imp3yWQTkz5YnHTJWy3VImxgp9tSRbYwe1k+ekWo1wgm+5WuIq207iOwqRBzktaKDGGVg7B1fx7i6BY6mB/DQ7tsMXEy+BmBVG1QpvBUPInKtmR6d/yV5Y1CK8woT8bFMzUIobZt+RL/lzo79Votwq3c594KKA0Rd1CKAFEIA5dW9vWbanI/DZHvWG+tc3K4nG0MlEd1vjPELsnrTeK+o/WfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B3f3aee2X5p+obbngizslVWN5Ig+Yt6ZthQpuaV8Ak=;
 b=b4zGA3O8M4Kxb1ZXXrKVQlL5KSn6qXcT1+pMAiXXprcfYeOD+eirbPEgnTgkIq3K4k70k69AjssnrSaARF3CqqiUTrDQJ9+1r/Yi2yXDc14/7fEDYPCeRdRuEjWaMlGd3O1vCPo2fLRjZS/OEdKzHsZBADZ89y9T3PiTUIHjHUk=
Received: from MW4PR03CA0039.namprd03.prod.outlook.com (2603:10b6:303:8e::14)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 15 Aug
 2025 04:13:16 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::3e) by MW4PR03CA0039.outlook.office365.com
 (2603:10b6:303:8e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:13:16 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:13:15 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 30/30] tests/kms_colorop: Add a colorop uniqueness subtest
Date: Thu, 14 Aug 2025 22:06:59 -0600
Message-ID: <20250815040659.3321102-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1a0fd7-fa0d-46da-f3b1-08dddbb20f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RcjkgqxGvL1ychA9EFPBuWuxawZBS2R/p/TAbOBMOa1PLTwPMuExZs4Lse2F?=
 =?us-ascii?Q?MZliKlUn7q2fpDyszJXKHdqecBHSW6nn2PiKx23We7HhSUVYv7TdEFWqlSlJ?=
 =?us-ascii?Q?BVzyLTvfh/fg72z3bGYNmaEYLXTJemZIjpa1psFj8FFd8d9k+MlQB4HiHhWP?=
 =?us-ascii?Q?Yo+DlrNnnEqTlTjmWYQYvli4dTfmExvHVWiG3PonbrZMTOlToWsQnuoCSoky?=
 =?us-ascii?Q?quGpvN4YIyCn1cdPzez6LjE+JhJ9sLyVg7jYmJ9I1icuyK3hPk70N52eFQ+y?=
 =?us-ascii?Q?6yrvaJ/i07r1fUZ8GpAbHLgIoPYXaDJKWajLynJFlSAVB5LXoItuRrWxF3JK?=
 =?us-ascii?Q?YwXzSb/o6KZdyBDt2R49b/uvd8ZP5cT/fT8ByOHrLT/pCQQHO8SPYluoMI5P?=
 =?us-ascii?Q?z+QhOU1lojaIVFNikqUQ033VX722AlRDjLXddNzdBmJi4wPCQZmbtAT17dKz?=
 =?us-ascii?Q?6c4V0sPZlTSz2oXemZQRwo0hXvxUX/+ASeLfnkSCBC1meo13B/VNGt0flulO?=
 =?us-ascii?Q?5Rh3MyllgCmbPIvpTxc6JPaskcAiHd/guFkbp2qrVK7vOm9szN6ocXcVHjG6?=
 =?us-ascii?Q?pJRrg/eYa/Xx+ErwH+Y9kt2ZaTjSEaJp6vYiKlnn1D5np8X4tOx248/Ncu1O?=
 =?us-ascii?Q?Ud7o8CRmqYjwT/Of3T97igf7YEyS90U7aI7VT8cCupSvKPGH9dQCmv5yfOB8?=
 =?us-ascii?Q?lYLSpGHxVAebQtqhCtpN3RScYEKetdgCwKvXcXBcG+4KZPMxhyuSij/TrrIg?=
 =?us-ascii?Q?FPt4hsajwIvw9auo2NvfwKsPHo613TzGDbkT1CuEY12Yu/Xi5qoZLkw1M6YH?=
 =?us-ascii?Q?9b5B6ZMrohubFViYHetGWZoHrum2Ck9JhvSSBzjkXfYXphy9kKyvkF6W+Vo3?=
 =?us-ascii?Q?IrdRX88sUMSmmF4LpDP8PMtbj2wl4iX5md3b+FQmIAbOJ6MBwxzDE0UawOcE?=
 =?us-ascii?Q?US9ZvtH8Eix9WiKeH7UwPtINfdOXKL28fzNW6akn8kJ1eIYwfwsRuth5KE1o?=
 =?us-ascii?Q?n1J3Rhpw4qH/pk+Y5egT8Dap1ZMEfx01rP5eLvuZj9ts00mIbQGzghYUZkyx?=
 =?us-ascii?Q?DXsGBuvTIKDEZRukOYD9JaqnfOLaujtsdVGZF5VcYp0TPDodBPZGFtqd95rb?=
 =?us-ascii?Q?Y2fwfvwr1hHn1pO6XUOqPZZWVYwew6HnfokVrfSAq55c9VM6rH6Vp5v99DhO?=
 =?us-ascii?Q?O2KWDKT+PIi0C5EF8kIiwiEAQ0rLktxO2jiAW/S/zaMX9ChwHp3XB1zDt86K?=
 =?us-ascii?Q?ECjYiRqNiuZu4mFyQ3N1BpPyvNXLamIqf27tnsbuLjchqpRiiYazGwm8hlNv?=
 =?us-ascii?Q?YD4Gt+ekOL92Dpj4MUfNgkrgbPuJ9F+T+Kgai04m4QKGOrYvegXPSbXCm/q5?=
 =?us-ascii?Q?KVuOsnQjWy5uFYeg9j0dCcsFzYJmfVS7R+btfPRPR/+dRnb8ViguIn5LDN4E?=
 =?us-ascii?Q?R5skES8ZoLx62+o2ga8bAN5xnJqCBxrFfa9dfK90ebV/LNdR4NvyDD9B0y4F?=
 =?us-ascii?Q?bTtDZ8hVZ79smCeMr3G2o0hBPGFhOB82wxHc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:13:16.3816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1a0fd7-fa0d-46da-f3b1-08dddbb20f60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334
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

A colorop should have unique ID.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 06b89264a..2ae854c5c 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -26,11 +26,16 @@
 #include "sw_sync.h"
 #include "kms_colorop.h"
 
+#include <glib.h>
+
 /**
  * TEST: kms colorop
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
+ * SUBTEST: check_plane_colorop_ids
+ * Description: Verify that all igt_colorop_t IDs are unique across planes
+ *
  * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
@@ -546,6 +551,47 @@ static void colorop_plane_test(igt_display_t *display,
 
 }
 
+static void check_plane_colorop_ids(igt_display_t *display)
+{
+	igt_plane_t *plane;
+	int colorop_idx;
+	igt_colorop_t *next;
+	int prop_val = 0, pipe = 0;
+
+	/* Use hash tables to track drm_planes and unique IDs */
+	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
+	GHashTable *id_set = g_hash_table_new(g_direct_hash, g_direct_equal);
+
+	for_each_pipe(display, pipe) {
+		for_each_plane_on_pipe(display, pipe, plane) {
+			/* Skip when a drm_plane is already scanned */
+			if (g_hash_table_contains(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id)))
+				continue;
+
+			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
+
+			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
+				next = plane->color_pipelines[colorop_idx];
+				while (next) {
+					/* Check if the ID already exists in the set */
+					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
+						igt_fail_on_f(true, "Duplicate colorop ID %u found on plane %d\n",
+						next->id, plane->drm_plane->plane_id);
+					}
+
+					g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
+					prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
+					next = igt_find_colorop(display, prop_val);
+				}
+			}
+		}
+	}
+
+	g_hash_table_destroy(id_set);
+	g_hash_table_destroy(plane_set);
+	igt_info("All igt_colorop_t IDs are unique across planes\n");
+}
+
 igt_main
 {
 
@@ -613,6 +659,10 @@ igt_main
 		igt_require(display.is_atomic);
 	}
 
+	igt_subtest_f("check_plane_colorop_ids") {
+		check_plane_colorop_ids(&display);
+	}
+
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {
 		igt_output_t *output;
 		igt_plane_t *plane;
-- 
2.43.0

