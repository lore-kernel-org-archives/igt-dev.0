Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A370CC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67610F28C;
	Mon, 26 Feb 2024 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HNC7h9gK";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7A610ED25
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBYuODNrlS5OzBoLdgrLbxSo8AzDCBk16voMviI2jdmtq43O11MvPMXE8LS6v20mBsSRx2bXVipGKA1tUXyyl+ArxZbhzIMHM66nV5TIbKBvzTh9iRaE3hDI1W4irHT8Vxt0+k7K7t6DaLauwK7JIn7xzvRByBPTVJCHsiRlY70SIyIiQAyx+aq9njqbjZNqBN6CjNQ3jef5ipIGM/pAY138iYtdSKvUHdVFp0EL/elWym+hu7nWxBHi9+2xDAXhVf8H4c44rSUBQIRUb8SI5hJz3uMXK7WTqyMaK0Lzd0Q2E4ZMJekfdGxhRi7gBygo3CGw3pWh/M/GieXXHRdDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoDVjL9GgVLNQ2XM/N/VS+9MOFYSXUs5In3ExJkY2Po=;
 b=NNguHZ9o6XJNiGMIpBNYXLUqRwRTiIe/eo90TpfuePHJC26uoIzLZyG0y2DB8pYzPDvul3fuVSMPUJNTCAM493KV3ua+tHXAWzO8P9HIUF6YzQGfewUmJFO6BLpBdgEgEo3Uv2woh19jX5RuvaTt0WvCQLHbgOXiQrD56nbazxNuTsnkreEuEHjLvBvCcSCRhBYDAembzbSxH85Xi6sLZ5BQGtDkB14BWodloO1zIpJoo2lf9kkylGR90ha+UPsJaOECQHtXPFxHAE0zssBGnJk7FQk496jn8CEyzVQUgKk5yjc6uPVrISd6NmFjHqWv5BwXHotIMZitrxLY1ouTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoDVjL9GgVLNQ2XM/N/VS+9MOFYSXUs5In3ExJkY2Po=;
 b=HNC7h9gKF/2EW4fnsjXlk4Y8pOz+0YUrxhypSpqrWiIWa5pYg7YJQRREN0mL6kBT/e/bqQ4jDLMBGXG5y/wxhCOGnZyjuB3EBOUH/IiBUAve8My+ym/dulL7F2/Fim2qEgU2X28Db6vUNGJwAwTDYWVSfprT/J6tNNRx1A2nKBw=
Received: from CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:34 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::9) by CH2PR12CA0003.outlook.office365.com
 (2603:10b6:610:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:33 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:33 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 09/32] tests/kms_properties: Add colorop properties test
Date: Mon, 26 Feb 2024 16:13:53 -0500
Message-ID: <20240226211416.100660-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7b3620-2df3-4445-01eb-08dc370fee8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ymmRtezUa1kVDtBoNsmka1jTl9VbpTPcKRV5iGF1TkeNcmokOd/tIL986i/lZHs2N4yCwEpEJTdXFLlgVaB6MAoHj9rlBYmhjF/83FP1r1UMhbhqvZHCJROnKN4QsqqWTZtYD+W71RYP8+wt0HLKm3al8OTRJLvcbVW/Uyy5hwYgGnGGHOz87btIpCNIzg6/2RrzBjjxg4EOroe/z0iarYEpwf/CwbJk2jRTvOJ0sIOJBBFofu8oJHSLjB8f+3kQHwR+ojSb2Oap+kLW+fyYpPlGTRKFDHtCCvGHwF78yEeH4jxDRq5T7dErVS+IxDMcvt478LfQqD6NaLkK2o2HFM3ESgFQZFiHfgiijzMZfxHWM3ea5h2aGuJ01kgFY6wzUeZpuMMSzJ5xwj37ldyF0z+LF9ObbJobLHb+P44th2oQYhGxKrYVq64zzDOmWd7KbaN296q3brV9iT9HAAyU0F0j+6j01/pHXiKj+1eJVOhrDjCiP/EWdNyp5nTcexFebx2N9Tc9H/hyrrR+iKrxlqQu5XVsfNndae3QEfr8SWcvF3iJWrVs4ago8Vbwen9NBwiNUa2wBlNtgu86J8RxHrUGry8qmTfW6wYR64LaZCMoHQ4eAFnQyPc/kNw77rtOJswV/zvauBp358dsH0LRtcwJvOgthipitt4lFXm6v2C6PBznCUqgqA0COFddbnllaEM4JPgCd6kytSGhMiMwM5d0nYUtu9onRaXA2FTDdzOI8pOwG4i0p+mFvKys21n
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:34.5045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7b3620-2df3-4445-01eb-08dc370fee8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
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
 tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index bd414f534c99..7104a7a9d55c 100644
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
@@ -266,6 +300,35 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
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
+			run_colorop_property_tests(display, pipe, output, atomic);
+			break;
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	bool found_any = false, found;
@@ -799,6 +862,14 @@ igt_main
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Tests colorop properties with atomic commit");
+	igt_subtest("colorop-properties-atomic")
+		colorop_properties(&display, true);
+
+	igt_describe("Tests colorop properties with legacy commit");
+	igt_subtest("colorop-properties-legacy")
+		colorop_properties(&display, false);
+
 	igt_describe("Tests crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
-- 
2.44.0

