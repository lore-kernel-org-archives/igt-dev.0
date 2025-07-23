Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7874AC83F1A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 11:03:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0742A10E339;
	Wed, 23 Jul 2025 11:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8G/s/yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CE610E339
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 11:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753268621; x=1784804621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aE7eBQS3sBFC2aC/fy10HTIRuQw20eDuv1Fzgyy83lY=;
 b=g8G/s/yq81JvYjsrdRu21QgdhUVdJV1TkiZEosFYjTRNDLzDGby54Blj
 25h91zdYVR8avOktusPjlpayd+sab+Jp7SWTU09wz3l9xf2Y3CSlc07PI
 fqezub3F2sPBpESEtZ4z0JTDSHgYPQUMjAzynllJ1+iuRrMTmel7tbpzq
 disQ4rf8+hH02pLMeyWudN5M5WSbPNBh53sPL+sKyqaR4UUBzi93FbA3r
 cKBoro7GJBw9DMt9E0yAQPP7W8MxLwaBOEYW0ElCoeoOWgoQvwTzZ76VE
 d0MAHf5FHNQ3dXfvwN1DaIC5fE+HeiBYFpfuv0LTnPU21PfCH9LXpBr4B Q==;
X-CSE-ConnectionGUID: c83KWdHvSY2pDYq3rxiCgQ==
X-CSE-MsgGUID: mgAxaj1MTkugXTwLGNUvwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59204765"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59204765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 04:03:40 -0700
X-CSE-ConnectionGUID: kSQHay8zRKSDst/UGCBleA==
X-CSE-MsgGUID: 6kZSRz8ASGuTXGC+QC69DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163703167"
Received: from opintica-mobl1 (HELO jhogande-mobl1..) ([10.245.245.146])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 04:03:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] tests/intel/kms_psr: Do not test frontbuffer rendering on
 cursor plane
Date: Wed, 23 Jul 2025 14:03:19 +0300
Message-ID: <20250723110319.2012982-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Cursor doesn't generally support frontbuffer rendering. This test happens
to work on i915 because i915 has frontbuffer flush call on render
completion. We do not have that in Xe.

On Xe this mostly happens to work currently because any plane/pipe register
write is triggering update and that is keeping display and PSR awake. Now
as we are moving to using trans push mechanism to trigger update this
doesn't work anymore.

Stop testing cursor frontbuffer rendering in kms_psr if using Xe driver.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index da947feb6..f062d184a 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -893,7 +893,8 @@ igt_main
 				igt_subtest_with_dynamic_f("%s%scursor-%s", append_fbc_subtest[y],
 					      append_subtest_name[z], op_str(op)) {
 					igt_skip_on(is_xe_device(data.drm_fd) &&
-						    (op == MMAP_CPU || op == MMAP_GTT));
+						    (op == MMAP_CPU || op == MMAP_GTT ||
+						     op == BLT || op == RENDER));
 					for_each_connected_output(&data.display, output) {
 						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 								      data.op_psr_mode, output))
-- 
2.43.0

