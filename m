Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24A1CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671CA10E8A3;
	Thu, 30 Oct 2025 04:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w8GIw7LH";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00D910E8A1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxZcYuLixidv2EEOaIG0625LTfNvzV4C3HdawyNm/plctUcXlKOn18eeKpNtfL+nSqWmdXKAT0nw+a3rLp+BCmqL886x3rgwHCwHGsEyrKp2K2vbRApx7RWTwgp73TzFvGrBez7sPfqKZfh1l7XF73uFs2vQPp4zjIlBzN9IZZpVDxWfzdfjWCw2AvYADIW072ZyjxqPZLXDf3WrRKRnF1w2HXnlsjRGqK40zOWYu3OV+KhK1PE7nD5gqNIRADzT9Ep11sykZETaO2DLMXmeJCvxzV8BzXqfrdz5WfEb2X1Vch0NC7vQ5fiaDl2Jx1tCfuAMDuyQe9a17xQfU4RaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4cGKUJTOyjrxhRls2t1/UvhrgmxUpJvdFQEopP9GB0=;
 b=ik3/JoSCTIW+GkVTLs5XC20pDXAptCzmWJNgequ445Ciy1/4uEvkewoG9hNCYh8CKZB/froEbOt0ZuLWbFvf8q38RM61skZGm9/2pPAzn6HQXUbXlOT6E9laiu6cD8izw6pmJGXXfBDvBXffp5GGOqKfCoL4233/qXg177Qe4+BhXrWvxtmRgZ0u+2ubwabHm/3vSXCzHiNXNdJrohuWPjlCvRCNpdmMLpaT7ewLSSoJ9Iwb8tIjMBPDS/Pu25DN/aOGUd3uuom5tno7U4XyShCp/n9w9OAebLeg35mIg2++AZOtBmF1cZcHgervOVegpXbE0meUUD10p/k4Ktdc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4cGKUJTOyjrxhRls2t1/UvhrgmxUpJvdFQEopP9GB0=;
 b=w8GIw7LHcw8EObzqx+3AI9UGpjJlD2mgk5tUMFnomc5czKZj8dnyk2sGORtHz9/HaMtBUAdSGSiNzmBndsT0BixciZ0Yi8xB/7shTZmaXUOPAiLmKfD8cpZeWnvwc1EW6P26/AlWgCiQNBOfV+iq0dEidhrwH1Uj7ZJFtgf9jAA=
Received: from MN2PR05CA0066.namprd05.prod.outlook.com (2603:10b6:208:236::35)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:29:31 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::42) by MN2PR05CA0066.outlook.office365.com
 (2603:10b6:208:236::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:29:31 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:29:30 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 06/32] tests/kms_properties: Add colorop properties test
Date: Wed, 29 Oct 2025 22:27:35 -0600
Message-ID: <20251030042801.2315866-7-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: f8834a51-5b20-496b-42da-08de176cebb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jAWFbeKYw5h/bbO+6EBGt3ZIGHEacdx69z9yOFmLtPX53l8Wq5ATKoSh7IpI?=
 =?us-ascii?Q?cZKUiXhjvFdMniIPBRZgthwfVijQ5thf0wJ8+VH7yFViuxKSoPtaL916SbH4?=
 =?us-ascii?Q?ySPRp4rdpBTSSxBWoxkSZA1cS9bPYVqVG/MYXrA1ELVrf5G5UbnRtGIfcM3l?=
 =?us-ascii?Q?Fg2BX4ByUWeno7lK2WVKVnPYv0HWzoVMBJpvkelgLCk+DMS+JuhGxdieY3io?=
 =?us-ascii?Q?Y912BnyurY8lO7dAskGHTmW0fF/BRVLGeM2Sf8xuGQeUlePp+TODs3mSlNR3?=
 =?us-ascii?Q?NHMA4FSQlqLiZkQ8s60HxgkThOcmRk4RzNniIUHePV9iuFt+n1oIeEMxnG/9?=
 =?us-ascii?Q?cHVi2UW+gwVasDjt8zjLMsOdEJQkymVkfSsEXpi8+pSR9po8n24zkN5Jsxd6?=
 =?us-ascii?Q?KKJP5TsA71ITTg6qxKHTuOrEaU7QPVD25/dSBVfTRDL21PtL59gSD8DrsQdB?=
 =?us-ascii?Q?L5/1yu50l781wDRPCkJOV5QZ5dCP6ZOErXTgwT7yrgnvVr6VFdbRsEHhqPhk?=
 =?us-ascii?Q?77jeNSfFbJEMSVvQEehAHn1SOUOAWrhSLZK0A6da/f7tsrv6+TXgOmkP5Xll?=
 =?us-ascii?Q?nFbWwBdj4ontkpPKvEdTnTz3lzH4xFWUHXxc/kRRFTCZU40boUKNbINxrngL?=
 =?us-ascii?Q?P3bLrc4/wgllTXlXNv+b6SxTZEwDoxVBXoa4HaOqMLnH2a/VL6ct2e21eBjL?=
 =?us-ascii?Q?gf9fsWLfjcizytBaOmSSsw5jDvoWYMJY2DGGhLtcd/8XXG43C0v6NZrzDP37?=
 =?us-ascii?Q?E857SN3EXwml9IEtfm45WbEd6M9iA6If9C5dVZJFVtSRk1kl1tBIJZ+WFK5P?=
 =?us-ascii?Q?yPIjPbZtI5NBk1Ipw0MrqDIaE+KNSYe75J2moB6PqWktgzPrhpVJ7gKvFD2R?=
 =?us-ascii?Q?KwJ46+M3UFim92pzfWUXlj6gqOl5M1NvZDA3IyvYf+WrClon/rpRbJx3iHC+?=
 =?us-ascii?Q?e8FwD5jmQLGIfg0QLYmDIzZ9+xSQlXL2zmuUWIdkB2xi4gby6KSXhG5+7v1p?=
 =?us-ascii?Q?+WsfL4yE1pSytWjJB9ul+CWHaUTly/SXhFgW1zFYVKX3LZ/AsGiIUxknY0rQ?=
 =?us-ascii?Q?3fXszsN6rTyJ8B5EHKFD+Q4h9nbsECm3bttTwCFxwNYno2RU6KWEnSddfJY6?=
 =?us-ascii?Q?WI2b97lWrFG8xuqNDXW+HfA2fWzW80AUYyVvXiXc/bGxNn/jrqItHAQQ7SrY?=
 =?us-ascii?Q?001pZ4SeVOt1U+/OiI2P+H2QVQbgV+gRKWHe3og7/rLtmEZeB0Sq11AZvSO0?=
 =?us-ascii?Q?0Ve5usuSG5GkEsr/s6CfmoIzkNbKnivEu/6tYye7H0pm5g0u5/76HXanqJs0?=
 =?us-ascii?Q?U3jtk9O2YsUyp43e/ctMFYKv35ASfUl45hfqdYjrWyFz08XdZ9BLQMuh+l0D?=
 =?us-ascii?Q?gNl6vldudChDXR46/fJrz4xJ0ArqllRgc+HIw4+p44O1n8e6qKLH0vIB2elV?=
 =?us-ascii?Q?fS0LoxKpKpr/i/Yh/0b0l+a2mSpb3luadm/VkXFMgmLFxmIx2fGkD4GK8keT?=
 =?us-ascii?Q?NUvjQRZxi8z8F5E8947GXX54v9KZzbHGjqMtkk2HlKxTRRFJlUfNbRyX5UhB?=
 =?us-ascii?Q?a+KrpR05kUJ/KGtjVSs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:29:31.1387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8834a51-5b20-496b-42da-08de176cebb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3bdf23aad..21e09504a 100644
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
@@ -230,6 +231,41 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
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
+					  kmstest_pipe_name(pipe), plane->index, colorop->id,
+					  kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
+						atomic, display->has_plane_color_pipeline);
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
@@ -275,6 +311,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
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
@@ -853,6 +920,10 @@ igt_main
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

