Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF9C3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A82610E692;
	Wed, 30 Apr 2025 01:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SAVXqky8";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5516210E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:42:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MChhuzCppwFY9kFFJEAURaL1pjf16Z/Kgy6wVEQxu4O0ZMknIeSdAsdmpvy1PEIHJZPXO3rNh8kRvm5Z70CPZeFjc29IKbJoMPbGgnKECd/WmRKU4aR/YzID6JTsyApiYn8DOUi0X4lJuKzgxU+o3fNNQyDQ8JMTTqoQwGzKqwygZHhHbuFxq4KM416W+/FxcYMiABIUN7YmhrICkkSBD+49fOPzFqTtm2brnyjImBBvv+1ARcZ8cW8O3jJOOGsAfIbeVqXnFSik+FrI2ciepxh0WZVPFUNuRsWqJTGb2Kjzn1BXinynwlacc6Z/uFEc63mGQaUokCMpWGOg5ksbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oivFLnurv9WFn0zOw1QPnQlbswbiX8DLakrP7rY69Tc=;
 b=ptaB9biFFzzQtRQOPrZKPlFMKYxFvn4QFwmfsF42sYPdoJYQ9OGzw6z7wWbwV0T+FY0BP/Y9xlS+3ZuOUfcNh0Gagc/32GplujitVOloGCQybmTVkC35KQ/cNCiOKWXb8rvJkGB++Ihdzim0zZsF78DlHkPX9zV0edAfNmdY+9cC5+EkFDlX3LTlUIOaZxBAnT4/mgtKlA69cd2pnNjaT/v5l0b8neSYVetgyv7YVYpllKnDn2NsUVK1S6+RNIdxaCYaMlDfvHVAeVlr4jjBt5YCRvDJa81ccmArYDwiii/QvKVdhxai78NTu5UgD8uaQchSjgyNwlu4ueR0lkB0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oivFLnurv9WFn0zOw1QPnQlbswbiX8DLakrP7rY69Tc=;
 b=SAVXqky8dOQ6HQgQClWZkOfaPIMhJVyjaruP6ByEEnzonx83ag0qGRskAQ/Xhkp+/8L/1SPZ5KX6Rj0Jc+xtHULdeYNjUdyAHITzDroytX2uXqPtg9+3uAcwAjFLYGQBNYc39oXWtD/gqGNeAir8wye7jgOGIyviRR0yHNXeH/0=
Received: from SA0PR11CA0164.namprd11.prod.outlook.com (2603:10b6:806:1bb::19)
 by SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:42:50 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::1d) by SA0PR11CA0164.outlook.office365.com
 (2603:10b6:806:1bb::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:42:49 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:42:48 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 36/36] tests/kms_colorop: Add a colorop uniqueness subtest
Date: Tue, 29 Apr 2025 19:34:54 -0600
Message-ID: <20250430013454.226910-37-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 87843e84-af3a-43b6-4758-08dd878850e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Nz46tGHZMIzWxK/V3IVm5HonK8TZhf1GwQo5GTSiKfkW06HZlCp4u06Zd21?=
 =?us-ascii?Q?5k93MoGkJh0pRVhmiuJxrpeJn/TiIzlkDNfevd+tuZI7bE6vRtLffGTZvk/L?=
 =?us-ascii?Q?SiRkUsp5cTU36VYOo+Iv+9yaGhsN/YLNUrM+oOVj/4MVcTkoonmQp2tJdqRO?=
 =?us-ascii?Q?6hwk8VQFaMBLIeqWR/TNsZxXv/uF+1vKfyFgY/uCONL5YGWlZzyxCMzRqFtB?=
 =?us-ascii?Q?0d/I425VOtPs1Bjx80J5U/+aAayt68wxJpdcSXrtf2eq8sxrQ8itAzRt7vBF?=
 =?us-ascii?Q?fs/tS/Lm6eTgNkEPMX1pu6fWllVBTVYr3zwHOzHAxrXxCGXaQz7pyNkb2nb9?=
 =?us-ascii?Q?0SLiKjVuBB8jNBrTfO8HRI0HiEx02PGGqzFUylJvm8xh+lyuFlXK7sCJnPCA?=
 =?us-ascii?Q?qAJGBpvAqkdnKVDxN5PJHVj7LgI5NkOKi1LeOs6s3UIQoRHtlv00jBqUqzNJ?=
 =?us-ascii?Q?jMuSvqEzcSMJfwD7SeYy+au1bqsfN09vw2qECyvGFNJYuiVWKqW8q5b9G9eD?=
 =?us-ascii?Q?yBdoYnuQaNH03wvkX+1dT/6OuVQXLCp+0gmEwneEHPqAurNpMxjzTSfBAh5r?=
 =?us-ascii?Q?cAWpYzS+0zLwCpyNwyuwHlJWsKjZpO/QjLvzgn5QL5PJe9SqeopJnS3J5DeN?=
 =?us-ascii?Q?39O98bLm3ENQC/unuE4YkJ7jlIV7WOxHU5XBl009xaalXPhUNaETbN4j2UN8?=
 =?us-ascii?Q?aUGahZiWojQ4S4JDRlAG3VLuE5wnYn1ounlcD+FSDs9ylsXnTJDCPvTvF/6Z?=
 =?us-ascii?Q?ok+oHLBV63EX+PDiqw7gshTNCpOS5MxKp/88bqs7+JFVy5cH9XFngcSqmQ9+?=
 =?us-ascii?Q?xcDkg+RuJb3NxO2S/jmXPp5kybf9zdjcuEnPvayDgPtt+99HZt9RQjlB6gaE?=
 =?us-ascii?Q?qbM6vIWJCvHEQ+fhb98Wfre/9KGYBvpTccw6K7UtiC+6qiJpwkeSTMCin9Bw?=
 =?us-ascii?Q?2e12ofRKacX9DthSaVVNd1n+9wXCNfC7TqV+3OJfXKw/wwixRNb4Y0yzgHtD?=
 =?us-ascii?Q?2QoMOsnmx/DfpL6UW+FNxyIQdW6XuLQ2zcZiPyJ1AX5jJFm9SLZWWiR4ESHp?=
 =?us-ascii?Q?HmbmgMbMepSwrhBK9Lv1zQB5d/8hxPX9ZXIYolRpaXVV7h0ZYC4AOfmbU/Lx?=
 =?us-ascii?Q?dxTeS9c+mzW7EkGriNvj8tFGwy4+h4XqA9qnABBj/qXbtAjaAJMNa2pDL8Z0?=
 =?us-ascii?Q?xQo4N3Xwi6ikP9Y0b4GBcKtWeRDPM4JwKZyW8EfUx/b+F0tl0mlj3sIRWwDD?=
 =?us-ascii?Q?tPz4u1K1uwz7FflC5n+bZkvUgtUJhEnFmPx6dBf63ekWJ0Ouc9DI7FO7blwp?=
 =?us-ascii?Q?dfhE3CBaMpvXRdV24Ntp0JAg2Plor0dV8fH0/b9oBgjuznZfiy/8LM5FIuSO?=
 =?us-ascii?Q?Ht5KascGNdrrBVaWriZ/V77T0AwwUlN73cd1wniARY9IowBj+keIxGwWWah8?=
 =?us-ascii?Q?WIzJlyfH9a1qIn2M8iPVsWt6C8H8SWqQzjKmeXq95LnXtsYVPqQ3JZmqZiDg?=
 =?us-ascii?Q?oZkdksec9gcHnRQPs5dGiWT4UwEvXV0KAZwt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:42:49.8614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87843e84-af3a-43b6-4758-08dd878850e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225
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
index c4ac3799c..acdebf8b3 100644
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

