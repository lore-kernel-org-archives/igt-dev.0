Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8628BEC1425
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 08:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427F510E95F;
	Wed,  4 Mar 2026 08:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1UxxpCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2CD10E95F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772611636; x=1804147636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehKZ4HJ713bqvftqq33mUyy7WN2YsQ0/HLVpwbDqmJY=;
 b=f1UxxpCqCeOZRmcv/o7+t8dFPNYiUxYm8fhMUPYVi28GGMC/wlkF1uEy
 WlKoWl5G8BhPMYD8Ui3ORTxJU6yTn++HuUFoaJTiglBDvoY4vwcqni4gj
 sd6mZU1UPKdEgXW88CzRpwGg5ZJ6s2YKfHEtT9AFYBC1arWp/3h7J6AO/
 pWFqK6NmPQyflq+f0ZS/fybc4eGfDMURtvTfI7R39N8zTRcWUmhIdKDzJ
 ahF6uOWyyHR7YCAXNUQp2nW4owgqXzarz045aHAnMuKxxJzcw3zh7treX
 QliJANPGuGKOzWt1FGFEn7slcC/o0nxLuT30Q511WCtnvVOxLypnBCvvE g==;
X-CSE-ConnectionGUID: kxQ0t35HSKShT0ppqwqTEw==
X-CSE-MsgGUID: rI/a+2ldSyi3ZmSL1E3/UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73539109"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73539109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:07:15 -0800
X-CSE-ConnectionGUID: 3qxco2C/Qni4MSevbMMZCw==
X-CSE-MsgGUID: 2wEcT5FeQaKlgnrpB/7v/g==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 00:07:13 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/kms_sharpness_filter: Detect and
 bypass joiner modes
Date: Wed,  4 Mar 2026 13:47:46 +0530
Message-Id: <20260304081746.2083480-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081746.2083480-1-pranay.samala@intel.com>
References: <20260304081746.2083480-1-pranay.samala@intel.com>
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

When the output configured to a joiner mode (Big Joiner or Ultra Joiner),
switch to a non-joiner mode before running the sharpness filter test,
since CASF is not supported on joiner configurations.
This ensures the sharpness filter test runs on a single pipe configuration
and avoid false failures.

v2:
- Add FIXME (Santhosh)
- Rebase

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ba325b377..f71038a9a 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -440,6 +440,22 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			data->crtc = crtc;
 			data->mode = igt_output_get_mode(data->output);
 
+			/*
+			 * FIXME: Joiner + CASF currently unsupported.
+			 * Remove this check once support is implemented.
+			 * Until then, run on non-joiner mode in joiner conf.
+			 */
+
+			if (is_joiner_mode(data->drm_fd, data->output)) {
+				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				igt_info("Executing on mode %dx%d@%d\n",
+					 data->mode->hdisplay,
+					 data->mode->vdisplay,
+					 data->mode->vrefresh);
+			} else {
+				data->mode = igt_output_get_mode(data->output);
+			}
+
 			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				igt_crtc_name(data->crtc));
-- 
2.34.1

