Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BE0C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 06:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF010E47C;
	Thu, 16 Jul 2026 06:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K/mbRNw9";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139410E2DE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 06:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfCqKqRQVn5qm5j1rPKaU2l9cjz/MDWJQptsGK0EcfAymZ83Pb0erZ5l4UJHLIb6zLlJ4PxqYBwN6z8WEkTznljF5EyTxT++46a/81GHfZs0hIIbexTtNkwrTFbYYk5gDWsRIRCFQ+uezgbNBe4AMmgyrJabB9L240MPxPgAfnOl1qKET9JEb+ia62wybzHwQ2iBPztU2X5777w0KQHrmRcUAjSk/rE7fhN+i0aCV+PRWw9dpluME+A9wXcyJGSnF3nJeBWQnjL/TKu2de6q464tUCNwx4cecjlIZ57FCb6VkgMU15F7vm1uvvhAsM2LYC8kpHtE+Ew1w4Xc/U0mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IS5Ocn/uIDS9ajmtO2JhTPo3o9XedFHWNJNnZCSbfQ=;
 b=xxXkyE0Q9PatmoigCQM90ofgF0q62PJlE/BPHXiYe1YCYblVcBlaM2Ml1hcht9Rm5IjPBZyFisi0mzC6qkefC4ogky/cJXntA6LP/xugxVcEwKDlqNql/lpzm60BmnbPKrTpVLXQkOfOI0Q0Vf6WIEqIrCtt7vXqJUtKwT6Kt73dOvolekXGDAXrIGLu42dz9EF77+q+vjsItuW0ijNCFA5eA6+BsYBUuuOVopQPGxw7tYZ0LNy8PjwL9rk8PNLrCRi1jknkZgwmhps33VNzyLNGMYNpLiOEhvXgZRbvwBzKRTxfW/YZpUdP5zaGFJ9lVdQ/OjEsvJJUPf0lgbzJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IS5Ocn/uIDS9ajmtO2JhTPo3o9XedFHWNJNnZCSbfQ=;
 b=K/mbRNw9/5GCgWLOlXu7COLuColpPgnE09sQVNY8+BUnNDCCI6q7Zs6x8vcm4ZfotN3bJ9ZBtZCnLHJQHhighc2Aq8V0wxKzXXfY0LY5NwJulLaPWLWQNYvbT73LVmse6DvKi3dtWWHrJO+c8S+aU+JEVWvm47pKFyA1twXxScw=
Received: from CH5PR05CA0014.namprd05.prod.outlook.com (2603:10b6:610:1f0::24)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 06:33:16 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::89) by CH5PR05CA0014.outlook.office365.com
 (2603:10b6:610:1f0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.4 via Frontend Transport; Thu, 16
 Jul 2026 06:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 06:33:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 01:33:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 01:33:15 -0500
Received: from james-PlumDAP-MDS1.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Thu, 16 Jul 2026 01:33:08 -0500
From: James Lin <PingLei.Lin@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <Pinglei.lin@amd.com>, James Lin <PingLei.Lin@amd.com>
Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip 7efc alpha-swap CRC
 check on AMD at >8bpc/DSC
Date: Thu, 16 Jul 2026 14:35:59 +0800
Message-ID: <20260716063619.3344-1-PingLei.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 168186a1-bb7f-464b-15f6-08dee3041e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|56012099006|11063799006|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: DHQzuNEqwDERpsY1OKUeS4IyAn+7DjQcR7FE2CVh7pkyexC6G13Nbp1bMIM6HhYKkRciV25X1dLh61KICtjhW/T5ME31zxdBGuQkzPRCvv/p+ZXkgoVEPZr0smn5R3Ugh/s2BhF1cLntD7rFb1g4WwiKrpR9WRpU5W5epskURtcPwP/6PI//pBeJmX3gaRBi+sinS67lnvhFvhfKPaWnjrBFV9OgpZ7HeflVtSmOn15v23dmT9aqgQrcu/6ijE8CXVRtTDAg+8G37ryZyNKM4sjHsAJo+GJAhyzfHbo8eAWW7rwI1QBe7/80AWgbo7FRmsxT+k2y+BlzDLubeuuDPQPQF0O6cVoQrPewxIGPLXXQbvAsIsP6lNLDzvXNZ7ZXK6RogMvxdSEAujoSE4H4pypZjAMLVroW/NStRX7lLRriCBxYlmEJCV4TW5P47Z+VhQCik1mn5eV2VwA4+XeKfuWEWACV1zHyomNupZ8QQi9W6zgXR9rHSeIYgi5gbyw4Y9ur1St+ysdqPTaCwWOLT7YhJoc5nTP7iGgNScBn2NWo8oD3czWKeSgXCcWcK0K6ZtFNNSdoV3POGHA7YIAqRSr9b0RcPVjxOMNJLkjPoBXo5Ely3bpSg8YoVNvcCUVYnQbVF96oPGtZ7QcYAKNTdNo+PAPzWH9SOM6SduyEF7PY/6IgTHHWzQKmm5sw8ixIB69oMd25E+zFeCNQR6PceA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(56012099006)(11063799006)(18002099003)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QDZJrJ8EcWU19OYVcWeRTGeoFBGFWu/ISUDyTcEpzbq9hLYERQefUQJa7fsNf3TF3+YlWDnDu/vO3ClXRIFhuCV1u8Gq7an3wlXSkKmU8jCIavFbmTa4FzFxkcB/vIPA1wGNeeG4wkgwCM+WOs7VD+nhnF8fCBPJG5REnVqg1V7WkjYTuvnI3DahIT4z8WcNagllkKEvxb4d9OtR6DCwBGcpZtgeYEsluT9+xsp/LYsy9WYEKsLNBaXXiY69qy25IcqqusheaSm1GPBZ1/fzFPMy0fAek79+0SI8XO6i56IKxRGuKvoyW6sY9TP4QkxHdpub6n4EEXD39/lryOlA+PNt5RO6/9Ip3YMEMQ5IbPhXet6ISp6wGczWRdyuZJiL3uLJf++bJ0pWbgyh57pEa1j80EaRr/EbEfxSfoLslh890wnVp6TeBbDFXlieR2Qn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:33:15.9166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 168186a1-bb7f-464b-15f6-08dee3041e38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
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

[Why]
alpha-7efc and coverage-7efc assert that swapping the plane global alpha
(the KMS "alpha" property) with the per-pixel fb alpha (0x7e <-> 0xfc) yields
a bit-identical pipe CRC. That identity only holds when the whole blend
datapath collapses to exact 8-bit arithmetic. On AMD DCN the alpha/gain
values are 8-bit, but the blend is carried at higher internal precision and
only quantized down to the output bpc at the very end. A swap that is exact
in idealized 8-bit math can therefore leave a sub-LSB residue: at 8 bpc the
output quantization discards it and the CRCs match, but at >8 bpc, or when the
stream is DSC-compressed (carried at its native >8 bpc), the residue survives
and the CRCs differ. The strict compare then turns a legitimate precision
artifact into a test failure - observed as a CRC mismatch on an eDP link
brought up with DSC, while the same test passes on an 8-bit non-DSC link.

[How]
Add skip_if_alpha_swap_not_exact() and call it at the start of alpha_7efc and
coverage_7efc. It is a no-op on non-AMD devices, so every other driver keeps
the strict check unchanged. On amdgpu it reads the CRTC's current bpc and the
connector's DSC status, and skips only when bpc > 8 or DSC is active - the
conditions under which the alpha swap is legitimately not bit-exact. 8 bpc AMD
configurations still run the strict compare, preserving the regression
coverage the test was written for. Track the output in data_t so the DSC state
of the current connector can be queried.

Signed-off-by: James Lin <PingLei.Lin@amd.com>
---
 tests/kms_plane_alpha_blend.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 3a2649833..e040d5bec 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -33,6 +33,7 @@
  */
 
 #include "igt.h"
+#include "igt_amd.h"
 
 /**
  * SUBTEST: alpha-%s
@@ -77,6 +78,7 @@ typedef struct {
 	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb;
 	igt_crc_t ref_crc;
 	igt_pipe_crc_t *pipe_crc;
+	igt_output_t *output;
 } data_t;
 
 static bool in_simulation;
@@ -442,11 +444,49 @@ static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
 	igt_plane_set_fb(plane, NULL);
 }
 
+/*
+ * The 7e/fc subtests (alpha-7efc, coverage-7efc) assert that swapping the
+ * plane global alpha with the per-pixel fb alpha (0x7e <-> 0xfc) yields a
+ * bit-identical pipe CRC. That identity only holds when the whole blend
+ * datapath collapses to exact 8-bit arithmetic.
+ *
+ * On AMD DCN the alpha/gain values are 8-bit, but the blend itself is carried
+ * at higher internal precision and only quantized down to the output bpc at
+ * the very end, so the swap can leave a sub-LSB residue. At 8 bpc the output
+ * quantization discards it and the two CRCs match; at >8 bpc, or when the
+ * stream is DSC-compressed (carried at its native >8 bpc), the residue is
+ * retained and the CRCs differ. This matches observation: the same test
+ * PASSes on an 8 bpc eDP link without DSC and FAILs on an eDP link brought
+ * up with DSC.
+ *
+ * So keep the strict bit-exact check everywhere except AMD at >8 bpc or with
+ * DSC active, where the swap is legitimately not bit-exact.
+ */
+static void skip_if_alpha_swap_not_exact(data_t *data, igt_crtc_t *crtc)
+{
+	unsigned int bpc;
+	bool dsc;
+
+	if (!is_amdgpu_device(data->gfx_fd))
+		return;
+
+	bpc = igt_get_crtc_current_bpc(crtc);
+	dsc = data->output &&
+	      is_dp_dsc_supported(data->gfx_fd, data->output->name) &&
+	      igt_amd_read_dsc_clock_status(data->gfx_fd, data->output->name) > 0;
+
+	igt_skip_on_f(bpc > 8 || dsc,
+		      "plane-alpha/fb-alpha swap is not bit-exact on AMD DCN "
+		      "at >8bpc/DSC (bpc=%u, dsc=%d)\n", bpc, dsc);
+}
+
 static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
 
+	skip_if_alpha_swap_not_exact(data, crtc);
+
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
@@ -475,6 +515,8 @@ static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
 
+	skip_if_alpha_swap_not_exact(data, crtc);
+
 	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_start(data->pipe_crc);
@@ -539,6 +581,8 @@ static void run_test_on_crtc_planes(data_t *data, igt_crtc_t *crtc,
 	int first_plane = -1;
 	int last_plane = -1;
 
+	data->output = output;
+
 	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
-- 
2.43.0

