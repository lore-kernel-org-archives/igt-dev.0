Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F9ACCF9F6
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEF910E8C6;
	Thu, 30 Oct 2025 04:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2Wa72+eu";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011063.outbound.protection.outlook.com
 [40.93.194.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C2C10E8C6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:34:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGVQb60bOz727/wBCQ1+2+lPxud2HvswCM/e9hpzz+cZGVmYpU1jnNJh1ViJXgecqeO4GL1jxhKJ37xpCZtH52RS4rCoDABo8otQZPuvl7NWROdVR4xFDd/b7NuN+6uI9Ux7KDzEUZ1xyteQ5S9iuA+xbi/mNtGxSDTYazsJ+jk+vJ8xMkRpB3u8LsbUbOHIFy8GY0nVbagNu9mtKg8PwwbYifgc0/ahQF51UGBeeN8NdnXy/XMjrEM2HHxh5/mXUzz4wqRwYEAFD7FVNxVfb+HYqIhB70w2wMulHY0oqZZs+wXFaHg6qFMIXjI/TbiLcxeCT1XIMaBGQYSXzEP2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPboBf5i4IBdGk4JdLhpHacHouOd5B+71JRiQRXkVik=;
 b=nQI3f79QZmnwvkfkzzAYT3j5ASGzXJh4Q98m13pqGgEt6G366l0OQx2l+RakMrmsW29fQ/hWDGSHnuBG+R9RweARRWmGK/BtWzXJyRMQ2aba4YLg6sIRXch/HlptD6lLZ5lpoPMaL4VKwCXdo0NZjj8AZdxJiKjzihHyCdjxnVajhY5uwoolIvwSpDgeHy5xJrt5rdSLMGfqMKFBjeheoDDLnjy5BZ1h3usizgrI4waCNOUqGLYohg7uHh6fCeFeZQls82QQ3vJ2Cvji8ya5DChSSt16dR96WsNv0uHBnqbxtNyUJAsDP0FblkJJ0LH1meB8XytxGndjP85BcbCAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPboBf5i4IBdGk4JdLhpHacHouOd5B+71JRiQRXkVik=;
 b=2Wa72+euNFZDE0L8inh8jw3V41uM/M+TQb/FWGDsF5uk1gJ/S81OjJwrd9YLZbEBQIFTl9hRfE3rpislHgjm1AmFz36yWN/+UbGVZIb+Xf0/lSRdvLDA2AgCiFI8vHfGg1RhKZ3fys55u6K/wflKfiXxXI+1MwEBAoeEiCcbpxU=
Received: from SA0PR11CA0146.namprd11.prod.outlook.com (2603:10b6:806:131::31)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:34:55 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::f6) by SA0PR11CA0146.outlook.office365.com
 (2603:10b6:806:131::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 04:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:34:54 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:34:53 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 30/32] tests/kms_colorop: Add a colorop uniqueness subtest
Date: Wed, 29 Oct 2025 22:27:59 -0600
Message-ID: <20251030042801.2315866-31-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: a164c3da-03ee-46fe-8145-08de176dacb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oXpVA/ptX30wsDDre6edXmIhoTS/fT2OvMugcu/KPqvjB6jEMdpm2YVK7LVY?=
 =?us-ascii?Q?s/daJAh/w8CyPCDi4C/LK2tzV6jj2FoR408oc7dPLIgci4zRX88LEVmcwcFd?=
 =?us-ascii?Q?esRHBkVc9CKNMojlfFV4RbSFUWZMLLrsWFpsdqhH90pQxRbfitQQhryPRgQe?=
 =?us-ascii?Q?h3/T+VkBlXPrlArYQ4PvaiBs6EClqIkZzbqiC56A33go9gdb7cJAl6ZIfM5B?=
 =?us-ascii?Q?nPkLwTuyyj1PJfugll0j13v1ZGUp1vh+YxjK8ncWAAyz3Iodoc/2npC+mTV9?=
 =?us-ascii?Q?qNrGW8ZSPhpobK2k47vsuDrx64su4Udh5DpBmbiyKBnOBmbKOqCytIzI+qZu?=
 =?us-ascii?Q?sgtmXVhAELRn+fExLzxivFCobLc+lJqhA31cn4cODGWJRqCwbuG7dAxKDeqf?=
 =?us-ascii?Q?4gADpgX9mktovnUS7sNPFnw1nJD26XD895LJCE0HEvqOZ4wujEdhWdqMLCBZ?=
 =?us-ascii?Q?cXv5dUV/L0VHPoIHlaU2b8jjJu8WIM70DjO8H2Ug2pDfp1sPuHaL0qjZKrAo?=
 =?us-ascii?Q?VXQy4yZGo+w54KrIscfi1/YPjcixqKkn1E4FRdQNjb6YXq8ZkX8jfJbCl59I?=
 =?us-ascii?Q?CQ/h3CpOFiBWALmiw5KVbSTIb2c2FehKkKORMPOGdDMy95PCWxEgya+ke44G?=
 =?us-ascii?Q?iosJovCA11DGIR6hA5Ct1E0hM7207smUOXmQ35ZFspaTgmWVRrywkwLxUULU?=
 =?us-ascii?Q?3vhktaLgoeCeZLSa/stSM6IUSHWy/g9Sit6vSneAACdYBFb51ogKykB9c4EQ?=
 =?us-ascii?Q?LMJPXeeWDWclK4M7mhP30mUwqEh82Na1QtLVdGjcNYD18N/jM3pADdpnDsXS?=
 =?us-ascii?Q?vq3m9ZW0lL3rqQ8FBPj0pkJG0U3cFRS+UlhmrEdp3GrcYBAcA011twr7Qvxj?=
 =?us-ascii?Q?6Nqo5wuFwejnwu+Rw5urTTFFiN4GpPgw654UVdLmycAxR9GM3JHiSttOjaBS?=
 =?us-ascii?Q?XZJ0Ayv52plwvB0eyiAWG3m+e6+kuH6seajMy+x8pPQ4YxgInHFCQ3M/IqyZ?=
 =?us-ascii?Q?J0KyzfsKD6T4od6xyuMy3bk2zS9TVqalBmsDSFSn9N/Wy9U1XRcBCc9RVXI8?=
 =?us-ascii?Q?kYUe+XVhEWjTjdM3p/kd7oh/H5CVCyI7IN2J+Pc0eP+ZyJoBC/gtQ6t1y9/f?=
 =?us-ascii?Q?+XYOrC1kiITPJ/1zPoocFnvT4gLt8w+AdCkYtd7YNh5zIM+Sjb1xW5STps7/?=
 =?us-ascii?Q?7G2+RrR++rbxV+Qxstig6DWtWoOGXCfhoj3U1PTrQGR2mTD4+CuChhMRn2IE?=
 =?us-ascii?Q?gq+KXaBOVo1NFdmbOAKiwBrU8vvc0wPb+/83vKQKeS2LcCkwm+d3olOkSxFu?=
 =?us-ascii?Q?kslBKyH1gH4DBb1G2e7SbjkoabysoP3LMEfT23++UmSCyeDzgnwpRjnpl7Vz?=
 =?us-ascii?Q?Iq9vOyt7N9Sxd5A+wQnWXxxXirA3Fp14fFd2WAS/vBf0T2taY2Gl/Ax+3zch?=
 =?us-ascii?Q?N440VGR6qytPfemV6+UARVeA5qMEFNmceGKl8gxMQ43sx/t3qNWzy9U0EWFX?=
 =?us-ascii?Q?1SoCdB1CybUQJH6L7MNZkQv3vtY1V8b1szC3mzNYUx9EYYQYWnYXepXyT0X9?=
 =?us-ascii?Q?G8qeG24RaZnNa8HDWks=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:34:54.8748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a164c3da-03ee-46fe-8145-08de176dacb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447
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
index a0c016d10..da4710b07 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -8,11 +8,16 @@
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
@@ -486,6 +491,47 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
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
 static int opt_handler(int option, int option_index, void *_data)
 {
 	switch (option) {
@@ -577,6 +623,10 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
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

