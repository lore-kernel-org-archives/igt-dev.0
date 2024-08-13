Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF55C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 05:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4410E2A7;
	Tue, 13 Aug 2024 05:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAnjkOEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7E10E2A7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 05:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723528123; x=1755064123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmuJBzqSsRIhxAS7Vr33ywXy9LMp6mIxxAGQf3gUsIA=;
 b=nAnjkOEA2PQvJe5PngcOi4BAPo6yc9IFEbgaUqPD62rgR6ym5QRmZ7ZV
 J+9ojx0Zn7/RGUGt7uYsccZNmzZ3R2BYRHbTr34PkDvLKl8MnEFRuyfx3
 udbEYZ+4VUJDTd1AhqVDBXRdXbnibiLnUzz+6oImDxYAlyIKZ4at+6T1r
 igzxLevP5+tRJxlAfZyucZA+VqJFLmHut0M7iKkVlVI6y2CbzsxgYD6VT
 aFA4vxoEKKijQK/ShPAAHoq+jAgA802qeNSmjKJzhH8OER2ikOZlpqaff
 2iwTZ3iWXgh3mzFB8g9QJJ8zxcFq1X3n3bJWhjNAVyGM4upwZcbtm5Csf g==;
X-CSE-ConnectionGUID: 953Kd5noQQuie8exdGF9Xw==
X-CSE-MsgGUID: 9lQ/f7EnSZevpeJnufHOzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25459938"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25459938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:28 -0700
X-CSE-ConnectionGUID: Y9UMb2+sTQaycNElvaFHpw==
X-CSE-MsgGUID: H+5BUigWTSaIhZOTdeGF2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58623804"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:27 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 4/4] tests/kms_vrr: Add more logs to skips
Date: Tue, 13 Aug 2024 11:08:45 +0530
Message-ID: <20240813053845.2567954-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch adds print statements
at crucial points to provide better insights.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 4fa3df417..36a22eebe 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -879,12 +879,14 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
 
 	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR | TEST_LINK_OFF)) &&
-	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
+		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
 		return false;
+	}
 
 	if ((flags & TEST_SEAMLESS_DRRS) &&
 	    !intel_output_has_drrs(data->drm_fd, output)) {
-		igt_info("Selected panel won't support DRRS.\n");
+		igt_info("%s: Won't support DRRS.\n", igt_output_name(output));
 		return false;
 	}
 
@@ -894,7 +896,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 
 		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
-			igt_info("LOBF not supported. \n");
+			igt_info("%s: LOBF not supported.\n", igt_output_name(output));
 			return false;
 		}
 	}
@@ -911,8 +913,11 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	 *   - Limit the vrr_max range with the override mode vrefresh.
 	 */
 	data->switch_modes[HIGH_RR_MODE] = output_mode_with_maxrate(output, data->range.max);
-	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min)
+	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data->range.min) {
+		igt_info("%s: Can't find a valid mode with refresh rate (%d) greater than Vmin (%d).\n",
+			 igt_output_name(output), data->switch_modes[HIGH_RR_MODE].vrefresh, data->range.min);
 		return false;
+	}
 
 	data->range.max = data->switch_modes[HIGH_RR_MODE].vrefresh;
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
@@ -922,8 +927,10 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
-	if (data->switch_modes[LOW_RR_MODE].vrefresh == data->switch_modes[HIGH_RR_MODE].vrefresh)
+	if (data->switch_modes[LOW_RR_MODE].vrefresh == data->switch_modes[HIGH_RR_MODE].vrefresh) {
+		igt_info("%s: Not found a valid low refresh rate mode.\n", igt_output_name(output));
 		return false;
+	}
 
 	data->range.min = data->switch_modes[LOW_RR_MODE].vrefresh;
 
@@ -933,18 +940,24 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 
 static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	if (!has_vrr(output))
+	if (!has_vrr(output)) {
+		igt_info("Driver doesn't support VRR.\n");
 		return false;
+	}
 
 	if (flags & TEST_SEAMLESS_DRRS)
 		goto out;
 
 	/* For Negative tests, panel should be non-vrr. */
-	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
+	if ((flags & TEST_NEGATIVE) && vrr_capable(output)) {
+		igt_info("%s: Can't run negative tests on VRR panel.\n", igt_output_name(output));
 		return false;
+	}
 
-	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
+	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output)) {
+		igt_info("%s: Can't run VRR tests on non-VRR panel.\n", igt_output_name(output));
 		return false;
+	}
 
 out:
 	if (!output_constraint(data, output, flags))
-- 
2.43.2

