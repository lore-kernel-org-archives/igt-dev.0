Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D986DCCD1BB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 18:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA210E18C;
	Wed, 22 Oct 2025 18:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dArHQzjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85D10E18C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761159336; x=1792695336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJCR2FO0UhYIY3Vlsmm+ioX1dmdHv652JXRKVYNajjE=;
 b=dArHQzjpJfBtbdFvfvXpQjH45gOloJ/JuCAz1w8VIoLmoJBGFIHMRX60
 dVJS42UQ7PDDUCRedFcn4tBAcA1RR/HNI59Y20KgCxstVCR7O2+H0WRpz
 rMok6Hlkp96+hn5BegftbsBs0oF9vkSePPMm1Ast4y3EpPcg1LlrvgFHj
 STZIzslhrgoAWL8AoU7pWwe3KqiyN4CaS/x7aHVZ9HwQULf6oJs+okc8e
 thpIBjnXkQWPsR5XPiwJuKFyZXR3/LlTe9ucn1635o8qf0wNkrHtLBzq3
 PTfDUWsHxwkboMNlysyXFQvKvprjKboBXmHBafmEM21/rqiWLFOXIiiAC g==;
X-CSE-ConnectionGUID: 2xuS0eqPSWChclFCLnniOg==
X-CSE-MsgGUID: GtEGHUSXSMiwVaKvOh4PXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63241616"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63241616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:55:36 -0700
X-CSE-ConnectionGUID: wPtPnGqESwKJT3Eh3bB0MA==
X-CSE-MsgGUID: Vhi5qaYkRiy/Xyl/U1/+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183537706"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:55:34 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback
Date: Thu, 23 Oct 2025 00:25:09 +0530
Message-ID: <20251022185510.1099036-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
References: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
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

Starting from low_rr + step_size could cause the driver to fall back
to a lower physical mode due to proximity to the lower bound of the
VRR range. This results in an unintended clock change, which violates
the expectation of seamless VRR behavior.

To address this, the test now starts from above the midpoint of the
VRR range when multiple modes are available. This ensures the virtual
refresh rate remains safely within the active mode's VRR range and
avoids triggering a mode switch.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1d9e579b0..b90d0f3c0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -850,7 +850,17 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
+	/*
+	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
+	 * modes are available. This avoids the driver mode adjustment. which can cause an
+	 * unintended clock change.
+	 */
+	if (output->config.connector->count_modes > 1)
+		vrefresh = ((data->range.max + data->range.min) / 2) + step_size;
+	else
+		vrefresh = data->range.min + step_size;
+
+	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.43.0

