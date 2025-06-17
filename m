Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0253BC7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02710E4C4;
	Tue, 17 Jun 2025 04:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="laDVg05b";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10BB10E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:39:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9+eoObMTmLNHgNjp3YXWkApbhMN7LrkTN80L/f9fr10yCysD4oKscg/8UIJK765uNQCt8PSrqIzdgR9X3vean4ZHe02ApicGdDN7yaQPfcF2yx1mZTAq9tG0KLONr/6d4WUCd/t0GHvGCsHVhUeA1ZRduGWCZaOtw7bxsiA+sCSzZUj6QPYnwrrODxgdNHlVIe/eGYPABa8G6E07XvaLWJMiNdVzGT2IlzzCrEd5HFD+bNkzvduNeTJC9Z6kXCLjpznUjCkx17/evtxryrvgmsVfGC4+Z+cUKJ+1uBtw0gUm0nsje2dEhMCS/ewhNyurVke5ZND7SYjMxCR35ye9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDnGh61oHzWMr7ddBdKvEGyToKJO9yPzCzEHvfphFGA=;
 b=gx4wTt9WqAFE7ttVT3SeTLXMPFS+9mdI85cPXttbhKGG8p1vKKMZBze3UT12qGMkAqickk4ipJbBowSndfCRr+QgO3cPiDVZwKPW6cuRrzL76kq7gejk2DCWALAQVU9I9bDWmGH3qitHy/1om7rfOaU7LJZ+TiisEK2NsoM3fF8lXuX6t1+SsKMqroSAO2Nx8SxEAUk4O69sYDQlSgc+KiZVdKv/pXQE2mB/T26usI9GmV4wwPVnjVcuShYG4nXDF7UpfLUoE8FE5M8MGNLl7oqBJkEipkvJd2ed8fJnwmlMELxAAakzuKhFkFFFI49/hguygpxmY3UIzlSU1pbJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDnGh61oHzWMr7ddBdKvEGyToKJO9yPzCzEHvfphFGA=;
 b=laDVg05bD5eoLeAyFZLMqVkqVepRYPdgppqtvEDMRoJnQB2QfuzNMMb5YtbpQbpx8lD8Q2RBPd5Sr3LJM85cWhWujS0VHQWaKS1WQkWljKNn3Yh8E7qLbKeG5CSXk6ZbHMboGbheTajoZ8DtfFEFHpaYN32o4Moa5AtRgKSoT+w=
Received: from DS7P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::15) by
 CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 04:39:05 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::76) by DS7P220CA0023.outlook.office365.com
 (2603:10b6:8:223::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:39:04 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:38:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 10/36] tests/kms_properties: Add colorop properties test
Date: Mon, 16 Jun 2025 22:36:05 -0600
Message-ID: <20250617043631.2920587-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: 110ea034-faf1-496c-ff6b-08ddad58e3d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2rkyx54ZUrQQF7ZGKsyssx3ot+617197JNZm3yAzYo9pY4t/EVGK3zGdWWPq?=
 =?us-ascii?Q?py9MVMpkFjtyrdZpQNlWQP/y98JqxvbZuOIxH97LvD/G3EJHuYe46ght+vzH?=
 =?us-ascii?Q?xnHdiQ2lVDCLqKu/ded1K4g1owJ6ztg+QhFbjSp95p3vGiIU06tSXFboXqco?=
 =?us-ascii?Q?9nZF8k8JRXOMbnl4yz1239LVSgR8UfgfdfePE5EF01SmWuQLkVWpGj+qFDxL?=
 =?us-ascii?Q?8XIoncf6x7eIUz4GQH9VPJa6TXJqbfX7/Vto2AW1JQ7TkOTVzFI7kIcqDvSx?=
 =?us-ascii?Q?li6Z1qP9Ata+3H4qoRM8eMJWBtYvESOKuYC8hlHdT3VQUjByP5Jau77RNmCd?=
 =?us-ascii?Q?HCpfl8GQA6SJ1HAKF1EXZ6vmlsVBJqzrIg5cjSNx2pkOvlO9Ywv3U/19hmjb?=
 =?us-ascii?Q?xLuWsVJch3W47RgdqnRg10Nw91jaTI6HbB3wYbpO6c0Hy13Rx8r0J5gd7wyK?=
 =?us-ascii?Q?JKAZXZvxwvIVXvrcgXeHjJHi+xbfA+h6pdw0pSzk2/zz/tvmvjcDCHZ65oHV?=
 =?us-ascii?Q?h6xLy7Y1YKfi2iKTtJI1k0uwhWfmiT7IRn3aEzJSuSC3+bRCpJpD9SMlvvvU?=
 =?us-ascii?Q?FJvFIyPoBN461W2l65tA2+J5sD8OBZ2AQ2+a/TiiX/DyVQbCk0OLrK2TjZSv?=
 =?us-ascii?Q?fZKopnaW94VaIijNu5kEpTReFa7kKEgWWNxvi7+fQyvftDtTHhXT8G5I1An0?=
 =?us-ascii?Q?Vo4CNbqaGMdI7jJZiCJ8IgTjuFAxWJSKcKArfGcryGRzj4nqeT2QWIajmcuh?=
 =?us-ascii?Q?/+vpAkbDdTIRaBcDgDsWgpKU3nah3/vkcjU9J2sNdWhZDWinK9WP7tuDCI/y?=
 =?us-ascii?Q?86qTiuR6R4vL/ke2ixD9bpPMZteRdxn09DB17QjK4uaLPiEYP7Gd/d0vZlEA?=
 =?us-ascii?Q?awoZEJ6VwPqb9evN8+34ER6mthr5jx8fpSbqr6Mz89pKImnEpBZjv5pGO4WV?=
 =?us-ascii?Q?r4Q+L3nGudt13FBKEPnA+NTwPKdSeOL1ZWUU/75YLalwTzJoRM/Vy2vzKbGX?=
 =?us-ascii?Q?sQx29XCWc1edjRyhFIcCYWhERjgIPvgbJ+TixEXH8b7WmxoLyAvuYHXgatki?=
 =?us-ascii?Q?s7N1BdO2Ndlewf+MwDVVlwp/rCZ+3o2xYMEgXXu1lQMcMeC3iHcx3SKzBxfH?=
 =?us-ascii?Q?YkvyvaKouLemssWa0C8VlL/8/ftBtjJoi+q99RvuVJ5HqsLR0qJaAn40II24?=
 =?us-ascii?Q?ET4/+PNNudWxsEyyuBf4Uo/fWzV3Neo5HmJR4ACMaYCJGnZG1Vsr51OBsPnI?=
 =?us-ascii?Q?nVUg1brqeXIbyeOilj4epW8rwVxQ0OAUQzmpPsJrue0FNTuOb3z1KtLnKcx4?=
 =?us-ascii?Q?nDXHRZr+cKE1RJIZDI6c0+KOSEl5zn+hQ7uNpbImMJ1SYo/v3f1V/FHcKFdp?=
 =?us-ascii?Q?0vWsGZY/BnVOsh5GRMQiP7XRwMchdDdVElMKl7vYVPidwIRmn977lGQnpPdR?=
 =?us-ascii?Q?MtgkwuMN7q60cq6pR0IMovfcqBq6t0qbc/ARJZX64OGEOg4dSFX+vQgldbK+?=
 =?us-ascii?Q?5dcMwjhwM7Y28wNqGXXdYLhFnu6MwgHcA19e?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:39:04.7039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110ea034-faf1-496c-ff6b-08ddad58e3d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034
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

From: Harry Wentland <harry.wentland@amd.com>

We've introduced the concept of a new DRM core object, the
drm_colorop, to represent a color operation as part of a
color pipeline.

Add new tests to kms_properties to test the properties of
a drm_colorop object.

v3:
 - Update test to work without new libdrm definitions for
   colorop objects
 - Test colorop properties with both atomic and legacy
   code paths

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 69 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 23d6d6f76..4fc240660 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -47,6 +47,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -232,6 +233,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
 	}
 }
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	igt_colorop_t *colorop;
+	int i;
+	int colorop_id = 0;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		/* iterate over all color pipelines on plane */
+		for (i = 0; i < plane->num_color_pipelines; ++i) {
+			/* iterate over all colorops in pipeline*/
+			colorop = plane->color_pipelines[i];
+			while (colorop) {
+				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);
+
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+				colorop = igt_find_colorop(display, colorop_id);
+			}
+		}
+	}
+
+	cleanup_pipe(display, pipe, output, &fb);
+}
+
 static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
@@ -277,6 +311,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 		cleanup_pipe(display, pipe, output, &fb);
 }
 
+static void colorop_properties(igt_display_t *display, bool atomic)
+{
+	bool found_any = false, found;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* colorops are only available with atomic */
+	igt_skip_on(!display->is_atomic);
+
+	for_each_pipe(display, pipe) {
+		found = false;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			found_any = found = true;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_output_name(output)) {
+				run_colorop_property_tests(display, pipe, output, atomic);
+			}
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	igt_output_t *output;
@@ -855,6 +920,10 @@ igt_main
 		  "Tests connector properties with legacy commit" },
 		{ "connector-properties-atomic", connector_properties, true,
 		  "Tests connector properties with atomic commit" },
+		{ "colorop-properties-legacy", colorop_properties, false,
+		  "Tests colorop properties with legacy commit" },
+		{ "colorop-properties-atomic", colorop_properties, true,
+		  "Tests colorop properties with atomic commit" },
 	};
 
 	igt_fixture {
-- 
2.43.0

