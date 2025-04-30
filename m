Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA08C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4612310E6B0;
	Wed, 30 Apr 2025 01:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4lH8gn/D";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730D10E6B0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiIKUi9aG1MUE76ER5nlns5XXLFRI/9gNywjKytsO9JNoaSDXlcSyk2GXMNHeXjeJXR8QPQCPkRnUPXMgH8V+n9mN44AFB8FCLJlIJCyVOusnTyq3pj0sW7k/IEFtoAkz5vS+rYW5Y1fJLCtJLF8KqBVmPff00BJX/eGPkuZvkemMUSNUiY4OvxEd+1Xqn9aSAaU/K+td58zM3sYaVYI8UxgJiQcRrsGOugfmZUL33yZauHKeJguEBsjAJ0RsX+3ZApc4uZiLVKXISWTT7kBK/Thq4Im0WFnGvMtTU2+ULAIKtK5UALpnzkIZRhB7ouIlukpGzN8AoFm4pVWgFl8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X25cT+QgwIOD05wS58bABLpBLT8q1dbXE55FTwtiy0g=;
 b=ck6Q3oZaA95ua2m+wDeil2+E13HbnoCDfdznviyLqIrl6Uy3J7NW4UllX0KZ/IRAFJ6XYukGX4OdVEZ7KxG42f8DISA7RLweuaCufU6FKmz6dgN+ZEOF0f0hXpZPQwORvYJhDYzl7goEGR9oFtbgwWLcjoFRGC1HbycdfH/Qi8PVqP2lLjjKTQi7hkhtl+/MI/1cx7hA9MzKrNtTZ+/gMAoR0OiFUEQ2krgWAvrMA/i92hVi5EqolwJ5WF+XEwNqglNZZNE6VhmPwH74qR/JKeazM+5DD9YcTcQ8FzxiIqy3ISf7StW9C6VZNYq6MB6DX8m7JFpT8ciHII2Msg5HFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X25cT+QgwIOD05wS58bABLpBLT8q1dbXE55FTwtiy0g=;
 b=4lH8gn/DTdsC1ClZMRQImCXgsY6lAQGN6Je+UGwNR97MQi+B3E0WlEox9xmm51JciZvkMT6oItVapckx+Chdkb3R3kQ5/7DBBoz15Qjv6UY8+aO5rBHHLTuoIOdbNXaWhfLyIJS/+/aVPBNEMrzz9ytbTbLWvDJ+0uMT/dvGXdE=
Received: from MW4PR03CA0195.namprd03.prod.outlook.com (2603:10b6:303:b8::20)
 by IA0PR12MB8375.namprd12.prod.outlook.com (2603:10b6:208:3dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:37:25 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::d2) by MW4PR03CA0195.outlook.office365.com
 (2603:10b6:303:b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:37:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:37:23 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 10/36] tests/kms_properties: Add colorop properties test
Date: Tue, 29 Apr 2025 19:34:28 -0600
Message-ID: <20250430013454.226910-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 269ee11b-87fb-4494-4461-08dd87878f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lL2oYFYMohYFTgD9v30JgmPa3wvDwHImzV3wXaEP2DeyalbvwdgoDvKJdXd9?=
 =?us-ascii?Q?txfJvo1nN1/AuvqvOtSQRmPaJzLEe5H9tyf02Lyyep3A1QIBGqdgtLYa5eNO?=
 =?us-ascii?Q?9qE8cMtQBbAto31i4GchdpO8UfUZUHtOGX49pjkChTrNa+mIPOzMtTmFx2VJ?=
 =?us-ascii?Q?IPvZs8jcwOn7B8ABtyd7tOxWn06V54LRq1cbv9k/XrBtr3domQjOb70mQyud?=
 =?us-ascii?Q?nKf8wjN6PdB/XyC+8GNy/wwqlhmBXVd1pRPcmOP2qh4WSyodKdkfOoOc5a24?=
 =?us-ascii?Q?Z381wYzoLMky8tVjBD6gsh5MWGu6zJSeAKEhLjM6am0ppQK1RPoWtJWcSPvN?=
 =?us-ascii?Q?NOA2KewGmVSdYawq18vj0lzpYquBvY5zNNJTVDFbiwGM/cz4HJFBw4K4jOjb?=
 =?us-ascii?Q?lqq/xFbQSFEcGshXhdP9qO8OS9jzycXBirVgiT4gIY/0ttcfFTefwPW1aDKa?=
 =?us-ascii?Q?rlDoRo2Ql32xp42vrkVgF6yNgAt4+GALpdZq7QhBF8rGRF5VxIX+uCxRXgpk?=
 =?us-ascii?Q?zFDDXR9YuePiUWECSHy/h7iV8ZedrbxWEgyy21dRG4dWLzfjg/DvgOitPPc4?=
 =?us-ascii?Q?JVcMxKazm/vtkGX6LfmQWAFggHmQsZB5wST4F77oRhbuNc5lZ4QiN0d0ZDdh?=
 =?us-ascii?Q?+9lLLNmVVIwKvftBNHMft1B6QWGZ9Qn1TCEFN/KsMhnBrNvTplV63ej+br4S?=
 =?us-ascii?Q?pHn9vAAmdw6jb6OUV7bhuOzD2Y9ggEuJiuXOKQg4S7j6NygxeRi1/0gz8hQ4?=
 =?us-ascii?Q?nRvMjKfcumQq3h5QNQwT9ghUppJws7CtJyplqUpYVlwkQiUu8/pDLxeLpyMA?=
 =?us-ascii?Q?TuZI6Vc5o1xPvRVl7r6nXLvTScWc1k6DcDLc+gFTFustbGErWGCeLfWVKfVV?=
 =?us-ascii?Q?twKkA4LEYwlibnqnr8mZWzVpWRKRukMbeYTzGDc3HDoUjVWmnGNeLkrXk/1S?=
 =?us-ascii?Q?sUtFLKjzTe8BobsM/0oegop9hyDiqUj+sCJ8NI2cAsIBy7Wg7GpQM+4ewP3S?=
 =?us-ascii?Q?mhswUwa9hr0TJBrbxuXL3Ls4JzwAmLNXFyz6lfzQsHdZ3S2/SPcCcwKqnB3p?=
 =?us-ascii?Q?d6tyA6xXjM3JtXMgRzmyzy1PzD6yhh/Xn2Dj8iuDDPd/Fize9UZGDdlTU3Hk?=
 =?us-ascii?Q?qmZAvzWfW45t/Ov7XjhS/dU8NOSMGgq2oEvJij7hDqtSv+p87Quft9051k5C?=
 =?us-ascii?Q?OUrXnstU4gT4gVHmpwJigGz/6PTgxT9pxPFSTA0sutuT4hcqXPBlhxyubidd?=
 =?us-ascii?Q?MeujMmw/K++3q8JrbS2kM0cI7zVG0InF2RM+0K0fd+cbV3S70BBgMxX/h8uv?=
 =?us-ascii?Q?V9o2SHVFTBOL59gXUHHs4iOLvZJxTP7xV93uGMiiUTVz0kDzWt5T69R+sBFB?=
 =?us-ascii?Q?vAwjeMN7GJk3i8ifyQ4DS+sWEfYGb3YVzA3jJWRyBHegL2ZtnhX7tckYLhjc?=
 =?us-ascii?Q?Jka/r+mumFHrZe57LIXxlkrTG9uU51L4BR0IAE6Aiyc7MPEoWHN0rsMXer/y?=
 =?us-ascii?Q?6OjRD5L9Sb8cKhVQVbbwGvZYKW1Z+it5P+CC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:37:24.6670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269ee11b-87fb-4494-4461-08dd87878f20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375
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
index 1f21fd851..8562618bf 100644
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
@@ -854,6 +919,10 @@ igt_main
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

