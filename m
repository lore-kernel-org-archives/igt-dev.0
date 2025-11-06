Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A078CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 04:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FE010E0FA;
	Thu,  6 Nov 2025 04:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiJ36x0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B510E0FA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 04:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762404087; x=1793940087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHLiK4C+Q8NAigl47550Vf2l/pC+O+z5lYej355d3jQ=;
 b=CiJ36x0P5RO+ULVMpq+xkpGQzjyABX849NUCNPQjvW7TDBmN2toDQYYL
 Pf6qqn3LsgThMzzobwCvSJG0M8jebww8IVosD8DseszrgnYp1TKxorieC
 v78lEFVRfk17d3zvU/ucW9SUhF++cw7EH+Fhym/LwA6jOp/rCtdKmY3UI
 cXOBQc7GEF8LD2OQWr3fmj7SVPFUbQlum6lmRz67T37dXfqLc0kj3OaoJ
 /nbzYsO7r4pcCWDx5B1j6zCzDZkemY4MUTGp48MLarLH9dn6K8H3lU+N8
 N4r60nm2SGoMGicwD12J81/45swz+fFIdMthidgzKq3C01m16yc5k8d6H Q==;
X-CSE-ConnectionGUID: FvgcbN07TcGK+thEKIEE0Q==
X-CSE-MsgGUID: HVUshhvhSAerOHBNqjrtvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87161593"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="87161593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:41:27 -0800
X-CSE-ConnectionGUID: teqkQq6KRA2DZ4/+SheEvg==
X-CSE-MsgGUID: tGTOC7vsQJe01m9YGanA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191750383"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:41:26 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback
Date: Thu,  6 Nov 2025 10:11:02 +0530
Message-ID: <20251106044103.1502264-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
References: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
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

v2: Change logic to ternary operation. (Santhosh)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index bcb756202..57691ccd5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -851,7 +851,16 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
+	/*
+	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
+	 * modes are available. This avoids the driver mode adjustment. which can cause an
+	 * unintended clock change.
+	 */
+	vrefresh = (output->config.connector->count_modes > 1) ?
+		   (((data->range.max + data->range.min) / 2) + step_size) :
+		   data->range.min + step_size;
+
+	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.43.0

