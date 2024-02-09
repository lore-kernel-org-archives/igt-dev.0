Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9BEC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CF410F999;
	Fri,  9 Feb 2024 18:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R16EZkdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A710F999
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 18:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503723; x=1739039723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LlAGdcGWZzZU3rE2MjtLihdnTBj+CpWaKEWQ6uIrg4U=;
 b=R16EZkdYRhvXCgsHvUnEnwbO2kqShigpT7FmUn9zZ3+ow4MlqBCWAF74
 LVcRfVF7D6B/ksHcmyHJwrJU8R1Yb2tUK9OoF5ZMttnC8UBESYX8vsK+W
 P2BMNUlDbQMy6rNve9oeAlRfbATCls+syn1Wvn/wP9g59AbGsNfzOCPW8
 Z0V/8VaKk/OlMjI+t1XdfbYmRBMfGQcVfl1mbbzkqGccAOXSsmtiKJ61q
 6/bA/j3qLbPTU3GAocfNkRBHrSCMdbP4w0h6hrPDIrlhgDjKO0/f3Cfn9
 +i4zeAPsFW1HF5LlVlGkfilLPTkxoIisyjR6hkVDx/IObKkC9qL3WO5uL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12049326"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="12049326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6647795"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 6/8] tests/intel/kms_dirtyfb: pass the bo_size
Date: Fri,  9 Feb 2024 18:34:31 +0000
Message-ID: <20240209183433.375099-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209183433.375099-1-matthew.auld@intel.com>
References: <20240209183433.375099-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Looks possible for the derived bo_size to not be page aligned leading to
broken behaviour when vm_binding it. Pass through the real bo_size,
instead of leaving as zero. This will be enforced in the next patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 7bf49cb15..26b82e50a 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -254,7 +254,7 @@ static void run_test(data_t *data)
 				    igt_drm_format_to_bpp(data->fbs[1].drm_format),
 				    0,
 				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
-				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    0, data->fbs[1].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
 				    intel_get_pat_idx_uc(data->drm_fd));
 	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
@@ -262,7 +262,7 @@ static void run_test(data_t *data)
 				    data->fbs[2].height,
 				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
 				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
-				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    0, data->fbs[2].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
 				    intel_get_pat_idx_uc(data->drm_fd));
 	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
-- 
2.43.0

