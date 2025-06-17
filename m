Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E42C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FD910E4C8;
	Tue, 17 Jun 2025 04:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hl2vK2kR";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824610E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJfyUAtWgzukbuxzexAWi7bY0WnhIdzbXVTOW6AERQmJxzYcnN7jBTAAYJYOjZJ36ogaTRcIRAIQT2v7L87UI/sTXEocyVeDV3WgmuJrcQj7Y/GbRwjvB3OApvcHJzTAHe59mnACeoPaDxZwvno1eRYK3EyeU4SNnmmFllhjYhNOt4GR1euqEAKBj+UJQZbrCTNMkZ3CvO5sWp36Es3oaVKtWkjV2Nu+iAJ5sEUUuQqstErui5XK7mZYD68eV0oeOecjpdxGy5y4ruA0dme+eG0AmITnM1ohOdejarAZHki+O+leM3lHXCTnR2AtVv7w88+NFyjHjc5mjfArK+unEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ob/Gr4WTMOyHnYY4iDrpOMFdRejmAR9VZOlSJhTQ2VA=;
 b=FY7pWvq43HQXTyfcLguJIU0Mwik1naCsInNdZM35hF+Xo9p5mVi1SCVcTvWw7C0fl5VAefkz6FcsLxS03Wj83/1yE9EM7FFgPC6ckcBr2PLLm6lV3FWC4bmfTJggyh/9tUQlWRibn9JedTPPBe9EHyp+jxgPxyJK9YKCtUGhdTM194eIwWMUyTnk4lCnxDC/A41AyyO8ZoBnR9hOwfUtA15I2vS0ENq2S/m5eYTQH2vRWXSg9hmQtAdjoQQJzeE0SD8zGFu19Y59NeFUm0hfxgZQf7tYjRKUcj+z3Tnxmi6h8TGgIbVmbsWmSBo9MT5VaGekbl7J9h/hQWl7KhOl9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob/Gr4WTMOyHnYY4iDrpOMFdRejmAR9VZOlSJhTQ2VA=;
 b=hl2vK2kRH9u5JOydmSZIop9PiLOhsdWec/xGYgWoXRScXX+2Hw2+/wBfLbvluFnGj73gTNNJqv49zeiG+6OIBavhDJUclOfrJ9zDe/ktBf9TaF0VzwUNgm4d3M8z7UL1NAF8xuRpkeunPCK6rju97D9Oyrunwq+GilJPiniilbQ=
Received: from CH0PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:76::24)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:43:57 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::36) by CH0PR04CA0019.outlook.office365.com
 (2603:10b6:610:76::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:43:57 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:43:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 36/36] tests/kms_colorop: Add a colorop uniqueness subtest
Date: Mon, 16 Jun 2025 22:36:31 -0600
Message-ID: <20250617043631.2920587-37-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: b897b43c-f213-4db7-c1a8-08ddad59927d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KBPY69aqxfaQjzThiycxLcQfMtqtToNmGQHjSGrtV/ZLxVE6cKS9nCxVKuUb?=
 =?us-ascii?Q?jpxcXAAZAzURcYxsiFx6Fs6nJatuDMiUufZrlkpUjWOGpaXSrxiGZPCfRG6y?=
 =?us-ascii?Q?cVWQ8nA8gFn6208vVGGGXhivxzLeyKTM3cB66VzGWUggVyQnD0DgYHzrAcOW?=
 =?us-ascii?Q?bPK2ysNbYjyAoXc8V2z5IqDH0kBq65+POej7HY15MalK3xBvMzJFD8KEjwOO?=
 =?us-ascii?Q?9xELXT18Bc/NPxSxnztSALf1zIVBtev5/qwbw+gBXTvNJ7xVYiNViahCsU2H?=
 =?us-ascii?Q?cYMGoKXepu172d+U1D8ZcyrcObHKL3dSsd/avRIEP8JCBm/8kFg5l95ixv3E?=
 =?us-ascii?Q?QqVRR5NSkRcWLB3pJXlaOk4HLuhJnY0q4+NigXX2eLdytmyqxrHNb25ozDX5?=
 =?us-ascii?Q?8UM/Em0qEpeXTSv85VMum+kq1mwf4ryZrQ9JpgXwaFhsHkQdRy1BTf6bYRBw?=
 =?us-ascii?Q?4ayxHNADMENGC8JN2PyF26FzKs/0LOpulJDQvNVa1Snt88PC1eebWzupYEUL?=
 =?us-ascii?Q?Z3IKJF12ixN6m1+4iUKWaMgymQWBxqpgmDkBrUBnvjXRBz54yI4P9CpRxYQV?=
 =?us-ascii?Q?KlI77J2KwFEkjgxz970hWrtDAoGq9jc9tf6ubFqNAyvPX8cfKWPMvj/HQFtw?=
 =?us-ascii?Q?6tC5Ng5vGb+u+jup1RRX029DjLcQFhjtJxjDuqw0/p5U1cx+hzHD8kQOc50V?=
 =?us-ascii?Q?67U05NsZiXtG1IperQTcITEjlw6HQ4+QJ+i+r/75Wf8hM7D7c+kIeLaEiP7k?=
 =?us-ascii?Q?5j2N5IgN7lyjv4uAPuciaYjIdmuBcN+JTgnBeRnAxP8gExw3oSSOp/1/V0EM?=
 =?us-ascii?Q?NzQsg694NcrefdoS74IVv1N2Hy+5xIsUIKyE9ufMxg/TQbZx1sNGIlb2u6gh?=
 =?us-ascii?Q?teYHRUdoZpygTGYRWmLe+D/OMdRPVcDf6lKmCJ2rrif6GkYMmszQugkV+yDg?=
 =?us-ascii?Q?W93O9DBf8vb/0MvFGoGr/D8OV9yyq96BSe6mTEIsz1t6P07ix2RIU3Oz2AOg?=
 =?us-ascii?Q?QH25RHn0hpy/2NrTOr7zS2Mawu0BxoMpopE4Zl67C+1XDHeyHI6AUJpWoR99?=
 =?us-ascii?Q?wYijPXqsoVIE77UKoys+F9vzOpXtzxNSp6excUixFv1T3+onp1yUUcG8pooy?=
 =?us-ascii?Q?Gm62KnOTrl8F0vtycx/jvLSbFcRy946BzDiR99/KrRfbIjX99FdddHuTJGLW?=
 =?us-ascii?Q?kOyuAynqvr7e6U4cuUqr2MfZbDW9MlvGk3qcbJL2E35+ZuMEXPbqUWRfmH2r?=
 =?us-ascii?Q?48f4IEDOdKntkDoqeYYDGeudpBw7Nh5ulq3s13+I1BpWbcxMuwYxIMRWC0kO?=
 =?us-ascii?Q?r3dM7sneLZ+OE2KSknGC1a+SiLjVSP0yjRPCkqvoViTpHWChhoddLhIIaDI5?=
 =?us-ascii?Q?hgJWP8zrkW4md1ynbHdVl1sty7N+I150lQZ4Ztdw3fIkMkRR18iRRPA0cyqe?=
 =?us-ascii?Q?ifPm1S+dtHBQ5hlala5X36HPlevOjCEcXzpIfRW34FWjntbolY+cQ32RoT8G?=
 =?us-ascii?Q?JgXKrlbOgBEE66x1T5VrSDRG+1k5MUc/Yp3I?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:43:57.7351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b897b43c-f213-4db7-c1a8-08ddad59927d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812
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
index 9eef602c3..64bce9867 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -25,11 +25,16 @@
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
@@ -555,6 +560,47 @@ static void colorop_plane_test(igt_display_t *display,
 
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
 
@@ -622,6 +668,10 @@ igt_main
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

