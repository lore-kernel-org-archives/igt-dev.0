Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA107CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 06:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6253410E269;
	Wed, 15 Oct 2025 06:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIaOBlj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218F710E264
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760509781; x=1792045781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCAb2FjDX8qupkzdYSZAKVY0Sc37tVUmIndvuu5dFnM=;
 b=PIaOBlj4wfGlhLxD6+ojqkcfByCWSU0cQ67GNKEbSn6YBI/OvI0VbgbY
 D/Q/n/CljbnFAwtcSlxtWyTQ5ePbM4RlcFeUV34W04cvy3NCXy2KlbVMK
 yvEjJT+Cj9PbsXU5nGPyGLrBWsWDPWh8D0yE+0WUA+916tQZdHw28OFMV
 dJDW/5DHbhOQkmI1N6uOvkx7DpaVrLlF096qdO+MzIXC1v4J8sknUr4EX
 0OQRdefEGKOKFuNqT6Sds/lpu1gN4qZFp9AYftHz8BxIoo52BRJI3WHtd
 1wbu0fxC3SfG3W0eXUtzP7N8mgV07sGpj+mKh/m9G7+meleW50UTUMESl A==;
X-CSE-ConnectionGUID: cl7elYXOTquLtUGy6ruLRw==
X-CSE-MsgGUID: YmfdMze3QRKw0e/QcoSmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66503636"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66503636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:29:41 -0700
X-CSE-ConnectionGUID: RujFDuQeSkW5VBWa6LItSg==
X-CSE-MsgGUID: L+UQtpecStGTDcANNsGEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182559272"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 23:29:39 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Wed, 15 Oct 2025 11:59:21 +0530
Message-ID: <20251015062922.447336-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
References: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace the static LOBF check with iterative vrefresh stepping
to detect LOBF enablement.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 704620a7d..1e4d9cdac 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -870,6 +870,8 @@ static void
 test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	uint64_t rate[] = {0};
+	uint32_t step_size, vrefresh;
+	bool lobf_enabled = false;
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
@@ -879,11 +881,21 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[LOW_RR_MODE].vrefresh);
-	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
-	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
-		     "LOBF not enabled\n");
+
+	step_size = (data->range.max - data->range.min) / 5;
+
+	for (vrefresh = data->range.max - step_size;
+	     vrefresh >= data->range.min; vrefresh -= step_size) {
+		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
+		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
+
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+			lobf_enabled = true;
+			break;
+		}
+	}
+
+	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
 }
 
 static void
-- 
2.43.0

