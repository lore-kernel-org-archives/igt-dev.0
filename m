Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1F2CAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 08:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713C610EB82;
	Fri, 10 Oct 2025 08:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF0aXosG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7033510EB82
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760086644; x=1791622644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pZidxy2RSwuLZCA5ewXrbXYGMf6Btx12DnU8JyRoIWg=;
 b=iF0aXosG64TIzKR+Oo8Z8BxhZV15ILymcVe6g31g9IW+9Hlcl/xyYIhq
 u5GRhsQnbKNwaqTBrTo4MD+3hB/tjUbHYbWwPZ+C09HkSN46fvCd8jx4y
 klq4uGoFKuJKkggdc9yC1VN7y3MDAQkC/4pO4jyFKzplSKwHKwI+yZ2sl
 k83ycsPT8PbPVUwyvAz5m4CkJEnaTEkodLSE2XvwKeZIgp7ld3UWNfylr
 HvluD7PeF3z2fgcS5oqWYUZkHAZUU9nCg7k7hUKZIH+CaBhtLdkzHeO4r
 C5YqRMtyit96L34UILNl/etkFnmqnjdsbEyzvtZy+eDXXlur4kFltI4HL Q==;
X-CSE-ConnectionGUID: rXnF2lkqTcSqKw2a+40Bcw==
X-CSE-MsgGUID: WDLP6IrUTBW05/vvAvNlHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="87763909"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="87763909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:57:24 -0700
X-CSE-ConnectionGUID: z1m5zl0cTMqkwVbgW6furQ==
X-CSE-MsgGUID: +VCD3zLZQQee2Y0LSKBUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181362410"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:57:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, jeevan.b@intel.com, animesh.manna@intel.com,
 ankit.k.nautiyal@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Fri, 10 Oct 2025 14:27:07 +0530
Message-ID: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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
index ee0f057d5..5bb3a2835 100644
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

