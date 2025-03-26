Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3C1C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7B10E792;
	Wed, 26 Mar 2025 23:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PkR7u6Bh";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6194910E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb6iYiEtyAk33RXkth7olqx26/0IlxSRxyLgdrCiFaKODIDRoOvowhy/ohxdjlSCqPJtSPh/YVtscDha3SAaXm25rpOPS+8hvaj8QgIER+CsqDYmXHlBAfy57HYUacc1UIp9eDmsiF4tYzKPm6e/XUFRqwSZiY4p0NhvVNagAGgEzVooJIPt40E5HrW3pgtz0H1QNmuLdIby4SLDk7GNm7jV3nlQahMrrqr1WQILBxkSxBptGSpQWu41VQGIxQOnbg8z40v4trr7qm0P+SlsmvD4QaJUb3rqy1va4aLJL74a+eAW1u1H88YSN+K/BIihp8buXFEsJHZRXj2WTTCy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X25cT+QgwIOD05wS58bABLpBLT8q1dbXE55FTwtiy0g=;
 b=v/dAPVur8v0+s28YANbkfF5+C4+GG6yriY0c0iz0w/XswZWOaEQX2VKtj3DjXjZXul8cnsBbxSNn8zmRj25t1XD4gYbyl8Xla8oBuUk+a1ZJ57kcbXvfflERHeonymAN6WUUW7b+jZMvtcRZpCMg6c/0YZQf14pkbqYbFbIPDEKTEdikipdZnE00KdhbsVxP2Tfgfjl5DreLCneo8x6VbBBFib5PbD1GyayDLt/lo1mDGw+THhPFLO6qICjtjzHj9X002RyX+T81q/wQbhgLfB602ReGawxpGQfaYKbu3PLHH1MkDnRhqiwgd/gcWAcwZLPy/54eAWUguwhedU9IAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X25cT+QgwIOD05wS58bABLpBLT8q1dbXE55FTwtiy0g=;
 b=PkR7u6BhNIQFYUfOfqC4ZcuqDVklsIoe+JH7s9ajScGlrZh72iRU2Kt4G8rqig4SNRhjS+TSbI9MPy124u8tvATROuqz/Ep8QpmYUlXhyNlObNL4L/vxc16Yl7EINF+P8sxlXw+b9SM5nnMh9KDgfiK1oeJeWoQI+lDF1wM0gs4=
Received: from BL1P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::31)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:41:21 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::ec) by BL1P222CA0026.outlook.office365.com
 (2603:10b6:208:2c7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:41:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:41:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 09/37] tests/kms_properties: Add colorop properties test
Date: Wed, 26 Mar 2025 17:35:41 -0600
Message-ID: <20250326233609.2980110-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c274b1a-1170-46a7-fdb2-08dd6cbfb642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OiFf5Mt3vsJSRzNgjLYU4KeodL5W0C8hbu8EuJlfz2g3+UhwNLSbGoaxFoeH?=
 =?us-ascii?Q?R2qUJX7NZvjbh+Nlz1S+Ln7dvvmdBvFUX/eEk5Ds89PwpM4J8yuJ1MYnlehg?=
 =?us-ascii?Q?iR0Bih3DbQ0xoCUBSTqSyFvxcXFlCRTLmL0XrnaD8Yfqsqti2MdfLeoJQzsW?=
 =?us-ascii?Q?OgnAs9ERSouHUdyBywTLimB9vz9wrNnKzNTQ2cyPObUW6fZ7cVaBzvg0TvBa?=
 =?us-ascii?Q?4cz7jTXR1GWDJDk1gDVZqDovjHE3WZWCzHXT9YBEM59foBErCc57hwr0ooaF?=
 =?us-ascii?Q?6v3KYIn4B8FvSIE9sb/y/Uhx4/CW8k/sfOh2i/sYjDxw6UvjZRwxFfAYB5rL?=
 =?us-ascii?Q?xSC3Sn1rrJfJWamI928GDHtO93dnvtFY79PDhJSMxDwVfL3zvUFZDa53Rn7o?=
 =?us-ascii?Q?iWO5cZJKFEdtlqTVQHdZeDTKfBk3tgJjc9cr2PKiwCGSRfrjzZ2JKKB8DA+s?=
 =?us-ascii?Q?D/S9JK5YH6vezTk3BVFzSm8ZvIRlypa+ph7qRzZYEuItiMypfpwenm3SAPO/?=
 =?us-ascii?Q?2IBtswksehJT9/ZFDctSIctFiF5NcvWXdycPVpnpwTOoF9UWSV4X5qyBd+Be?=
 =?us-ascii?Q?2gsgTE/wsehp64fDT5kh1tZykPPuZ6inyZez9/u8zFOI5ILM86S8sYlEq2sd?=
 =?us-ascii?Q?4XTkam3ku8WN0rChooPT8k31Rcd8EqrokHDi6TOlRaI3C1rIqaOkKQ1v1AiL?=
 =?us-ascii?Q?0qY0YXNiJPihcidJL7sB9JCYvPJPNZtfVSOgTVBMYA+afIzf1QLvls2iNDo+?=
 =?us-ascii?Q?ocS5f9NMUhvNRpau8hZINhNiE8PjPGiWfrZ0hZdmrRD/5kzbu/e5laQwTIR4?=
 =?us-ascii?Q?ldZmGNuY2y1CYqplP4yG6ZCMjngY5jMBs1fuKSrnQPw2C5dpYU11YoVygffz?=
 =?us-ascii?Q?QJ08v3xvk3SGsAqEmFyipXm0k2e17RuTNWjUFAw3cvAr6mvCR5UL5GA+Hpg+?=
 =?us-ascii?Q?DHkE8NGJobhXkUhVKX0iXcEO1vq440P8ajcWSuFsTbqb+gUaw77VVBq7aqz3?=
 =?us-ascii?Q?i1Jzm81PVEKWfUkkb9xNVGpjTNGLqEEXjsez8C3x/O64b7T4nL2pwK/wn5yw?=
 =?us-ascii?Q?Khht/HwIkYO3a19M5BsOx6ApO/os4QZ9lu2CgThKuqCk2NfG3ANEv28BMRb3?=
 =?us-ascii?Q?DpWCQuzKELf76v0en/NDUkCqP6/BKhyVqEWSEE0b0TYU8pRIuY/2eV1204GB?=
 =?us-ascii?Q?uCF6KG0VB9PGRpYHpNEuMa7J17ClpMqyXU36eleXLgk6kO0rPGRAL6yw6p4x?=
 =?us-ascii?Q?cWL+QMqsLt0f6XIdX0ao4XLtn8knviIj2FzBBxoyYGgH40gf9ioTb2UYlsoX?=
 =?us-ascii?Q?lkE6poWguCeWW4HFF8VDdKI9o9gXB2OsbtSkORxyzCqMHDYEH7TLKCfs1wW6?=
 =?us-ascii?Q?5ZG3QgV6qHl2Y4sirydhMUQDdLUReWWV+T1K0KcAVUW7JWFXAmceQmM0QVRN?=
 =?us-ascii?Q?l4t6L5MFBakwH4dcYzwwIurj5p4+gRJLqxwHbb07DdUPFRMueAY+ITS1mdlJ?=
 =?us-ascii?Q?9+mqL1uLlmNzTN4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:41:20.8562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c274b1a-1170-46a7-fdb2-08dd6cbfb642
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
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

