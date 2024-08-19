Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69221C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5765D10E479;
	Mon, 19 Aug 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jTnDlzZH";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87AB10E471
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEbKK4ZRREAZvniqvVcQl6qpBEUBAEt6iqQSHlhYV3u27xOAaPi434s2Nw/roysJiICQe4o4OpKriPiqTrLXT7X1SgyrLuX2lqeP0jLJhxCprWnSze0FBJAxO3LbIqBJLMxgjpwNeksUKB+wcJH49MW/3HWxRW4+65js3E+p0hVL1UT8UTGrx0SsuCZClR8VWFLgy0NSXDRmPz1n6Rum1QEXl2VGZRrmp7mHKgy15KhHw0GOFkppLFeH2eql6w5+/spmdLDrMJEn+nxeh97FJpKyuh8V3/mPkaNW2MoExkTiNCvGCp4Ewrx4aZTDbGa2isdCiMsuHSIGELXMpuaIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GJMcUtaecdZ6g4sySVeXxGk+l+91a5HMKDpL2da9A4=;
 b=q7s2WbWxEAGlcjRGG53stf4X+Z6/4an4L8NGfkRYKwi0UMtJCpt/yh0g2D+tOhTS0/6Z7U7Tukby3GsFSm8+cfdwG2/nlokMgD560Dp6oFOM3bZxAVJh8HAZcsCas3UBbpWVUvgRrt1kTr8JVE2hh6gTZaOhie/HUW+7sPEsHfitujB0+PQRfP5X/h4kk/LTE7LVlgo+djxr2g3ym16a1kw6yLJUtsbvfpRYIKExhzaVX+Wrp1mSHe6RLLZ74qaS9zFnuqHcGGHwfTMM1C1dPGt+jRZIqeduJst8CeHxTJC4cqOeLgB+77Osis97d0qkL1yl7aXusoUZ6NkQY9bY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5GJMcUtaecdZ6g4sySVeXxGk+l+91a5HMKDpL2da9A4=;
 b=jTnDlzZHHhYsWo1m3JF8npwLnVXLXyXYgrDkxYvM69M/GlBAlNl9UeskBGd86WMwtJRfNHfo/KkjU2adQMk6Qoxlr/97H/bl9q4B8aYYr+ZDCg74T1pilVc/T0OAsNczOQ+r6uFc2gZJHDYMuQ5v0TfT9pE9kNMvewFZQWL+MYE=
Received: from CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:38 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::16) by CH0PR13CA0024.outlook.office365.com
 (2603:10b6:610:b1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:30 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 09/37] tests/kms_properties: Add colorop properties test
Date: Mon, 19 Aug 2024 16:57:55 -0400
Message-ID: <20240819205823.316656-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa24f48-bf79-4e08-720d-08dcc091b29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sIuYfQ3GUdK5L/H/PKGahiS6dGRYdv0MYuW3TDofxh4bd1WOLbwbxurQf+wZ?=
 =?us-ascii?Q?Bhnq3frlXfO7T96ZGHw49JxE6xCpYQv+yDCRsAOO56J6vDhuhvPsVHPZ8Wvw?=
 =?us-ascii?Q?9hoD4iqoC+pvwH7xQ8W3U8w4U3ijJTX0f817IcEu9e2nVOGqaTk+Io1hyqy4?=
 =?us-ascii?Q?RB0QA+LbtXxO8F+d4Temp3W6/iZnE5lx+tVhqNPcoF6IKwiTDYCAFBPHa3QG?=
 =?us-ascii?Q?57IFVdbE93zM3EPWIGLa/iS8c9hMyL0ypRk2XiHwvW1RJDoQLJxzc97LxUOb?=
 =?us-ascii?Q?b2gByWvHCkx+e7zRbHcTmRmgpzDc8ZZM3s+tkYJvXf7v6CiVzZi4zBqfMD2A?=
 =?us-ascii?Q?NcfMvCUzlbRxqAXLkDjhBCe+owYumd4Gb6d1u0B171INjweirq5w+ecM720r?=
 =?us-ascii?Q?YM7TMTPhS4XH8B6erjiO2RAtuiMEVzwfeYxO5tJgwFyVAwgfD2BRJs3+eSSh?=
 =?us-ascii?Q?I0KIB81vlKXu1ytP8jiss4ml5Tkd3CEqXteKxCPZtUeaPN8BEO4vU9nY1/b6?=
 =?us-ascii?Q?mlNK0HxD4aHo64a3l1UkWuIpnXpOHNH8NGfe5BBNz2jdloJkDZsfiFKrPTXe?=
 =?us-ascii?Q?h1O5xkwAo6nHxayh0lpawTmln/NzM2I/5Y614Gv8CcgQvZ/UCwAhTKuDluxr?=
 =?us-ascii?Q?p/9mqJMUBrtTo6wHVF2ZaQasWY2magg0wkGj+6ScVAMtmR9ZV3cJ30s4Ofe9?=
 =?us-ascii?Q?k5oGv9GuZK8frJxjlGqx5Ahh7KPNoK+xaMC1qlfTFixKgtqzH+Zvgkc99qUC?=
 =?us-ascii?Q?Y7zKHcln+5Hh54IIyUByzNLlp8BQqJL5REqo0nFCkb8UKMNTbA3eGaXTcpiJ?=
 =?us-ascii?Q?fPXNygU24K6XEZ89ubp8HzOygrw6my2bdDf8lQwNJ2kkV5YJG5M+8YEYeSlv?=
 =?us-ascii?Q?D9IPm3nS/yHE1023AQ77lzPHvx7S2EMdP6oyra3J4Sbi/o4/nHXsWYdOpagt?=
 =?us-ascii?Q?V3oXUI5WxTsDAvS6F4hA2ckCkCmlVVVBgIDRgxiA8yuI4BCKFNdZT49jvmt5?=
 =?us-ascii?Q?dFHYaRw6bpyPhrfzffOUQ+UB9j5FGKSSfK+vPiVJO/8ybV+KPEUQT9EUTZPa?=
 =?us-ascii?Q?731dxovE7mLL9p+9HdtLK59thDsKDV43VgkBcLRdJP6+1Ndzk1StXmqFRO1N?=
 =?us-ascii?Q?4NBVYPLnXFds04dMZ+J4JjiW/e4o4L4GPdy9Mri61cySv/oKsYCfzI/i7y3P?=
 =?us-ascii?Q?BqfG389C5L3HuzppO1HNdXOuwcP3NPd/CH4lMvwfWCo9c5E3VcCcy8+XKMQQ?=
 =?us-ascii?Q?j/hp8VV+3AaNC8yMTOeGGlEtxRRMqQMZ016XYz2Mu9d+R15UvDqWreILlvnK?=
 =?us-ascii?Q?ti4eNNWxSOss4EDlG993A6pTBm/dFq2SF3GPWc+sA9Mz/0JSebrxlrKpVonW?=
 =?us-ascii?Q?1V7J+o04eSYmJ+PiCZtN3Qj/8Kz3OzZvxzpbAymBxjCbfKJySas4j2dhAc6T?=
 =?us-ascii?Q?qBrkrFlLxf7Zdc35cCU38KuGq21+nefI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:37.8309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa24f48-bf79-4e08-720d-08dcc091b29b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
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
index a93c93cccf64..75252b3c9dbe 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -49,6 +49,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -221,6 +222,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
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
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic);
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
@@ -266,6 +300,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
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
@@ -779,6 +844,10 @@ igt_main
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
2.46.0

