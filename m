Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2027C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 19:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157610E661;
	Wed,  8 Jul 2026 19:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7PyYV/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C587C10E645
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783537451; x=1815073451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8GYbF/sUEwrZ+hdsc1/V5yXOgpBo6zuN3JamihYuv2k=;
 b=l7PyYV/zv/ksZue8hQhS6sGx3D3P6w4JETs5BYKy5rGEAC9hgEzRRvrK
 7wT0TsgXLJpdmR5/fcRLvOQryvEquFF0Mm8vjTXRPUMHTfEURPOcjIlwQ
 zYS7LmZTeNdCKe9KyUNnaxvg6HwZwhG11DwqrvjzP5QWAaNoimfzZkf7b
 wFrM9lZ7QeLZStKpxpZeI+yyZVy2hDLkoqpY1i/kGqX+7Lc0ThKa7IYjD
 1DkDCeDUwIhmhiavNcIdl2r07+TIQxV9uVQLemm3HFyc4580B3gU4MHWA
 1xF/TAcm/UQYjWWdt8ksiTMDIsusQ+/GLobQ7m/ukxJ/CzMUoPAySUKyU Q==;
X-CSE-ConnectionGUID: rNl97Z0oQ7SpkctOZJM1BA==
X-CSE-MsgGUID: jpnpl3RQSaCNfvs5ak3a/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94567506"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94567506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:11 -0700
X-CSE-ConnectionGUID: 3aAjhEJnSaSPd+ibsiZmWw==
X-CSE-MsgGUID: 8/e9bdYGSXmBEN661LL1jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278758994"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:09 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Restore CRTC
 binding
Date: Thu,  9 Jul 2026 00:43:06 +0530
Message-Id: <20260708191306.2995928-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260708191306.2995928-1-swati2.sharma@intel.com>
References: <20260708191306.2995928-1-swati2.sharma@intel.com>
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

After each tap iteration, cleanup() calls igt_display_reset()
which clears the output's pending_crtc binding. Subsequent tap
iterations (e.g. tap-5 after tap-3) then fail with -EIO during
pipe CRC collection because the output has no CRTC assigned.

Fix by conditionally restoring the CRTC binding via
igt_output_set_crtc() when pending_crtc is NULL.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 171a3e99c..8c6073669 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -695,6 +695,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 						 igt_output_name(data->output));
 					igt_output_override_mode(data->output,
 								 data->mode);
+					if (!data->output->pending_crtc)
+						igt_output_set_crtc(data->output,
+								    data->crtc);
 
 					snprintf(name, sizeof(name), "-tap-%d",
 						 data->filter_tap);
-- 
2.25.1

