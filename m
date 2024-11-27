Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0ECD6D22C
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 19:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADCA10EBCD;
	Wed, 27 Nov 2024 19:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfHChtfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5E310EBCD
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732734413; x=1764270413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rg/GCNhGOIY8168QesXXn/u8MDsSvc3S6XOCkJtOgtw=;
 b=VfHChtfLshNDK4Gbfl1s/nbELDbBFFB3s130QdjC2Rz1KhDk+RaIQUuS
 5ABeU7b72JxOLqaaQsfvRrbXx9YnBD10P4mTvo0XcSL+cm2/IIbm6i0IU
 e3hpF0vJtL/6v+P928usKfJmerg/YjEuI+qIB3pnh5Dl24NZ11/Xh8JWJ
 dEDegcwp/kNgN64tBQZd2cVLO3PH/oRKjoAcVlMwhe+kmJegx9o5Ar7If
 w1/9CWq0hj5xE1HxggkcsG6co3R4V6BEagw3ObiJZipPGYBudKlyACRUq
 bEcmmIaqQmHcpjEaxZGD0jur8VpzO6nDNd7ECGucG9prYnEVZLtkhSEgn Q==;
X-CSE-ConnectionGUID: +EfEK/QGQPWYJJJfO3Z8dw==
X-CSE-MsgGUID: AM7f+XddQ3WCL+VRH3fB/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="50355534"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="50355534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 11:06:53 -0800
X-CSE-ConnectionGUID: 4TZ8/aBFTAOz5lkuH/9Nvw==
X-CSE-MsgGUID: 0RjXi0MQTdqElP00GHRXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="122851642"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 11:06:52 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_scaling_modes: Add informative messages
 for skipped scaling mode tests
Date: Thu, 28 Nov 2024 00:35:29 +0530
Message-ID: <20241127190530.3421021-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
References: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
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

Add `igt_info` messages to provide more context when skipping outputs
that do not support scaling mode. Include `igt_info` messages to
indicate when invalid pipe/output combinations are skipped.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_scaling_modes.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 5fd34c4b2..dd2c6426c 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -117,12 +117,17 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		igt_display_reset(display);
 
-		if (!has_scaling_mode(output))
+		if (!has_scaling_mode(output)) {
+			igt_info("Output %s does not support scaling mode.\n",
+				  igt_output_name(output));
 			continue;
+		}
 
 		igt_output_set_pipe(output, pipe);
-		if (!intel_pipe_output_combo_valid(display))
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_info("Skipping invalid pipe/output combination.\n");
 			continue;
+		}
 
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 			test_scaling_mode_on_output(display, pipe, output, flags);
-- 
2.43.0

