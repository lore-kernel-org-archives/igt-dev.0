Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89BDD25932
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 04:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F50F10E24C;
	Tue, 27 Jan 2026 04:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVAyXwwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7D10E264
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 04:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769487149; x=1801023149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWQG2UXnypLx/kRh9fDHqjswXGV6lE+65SNPO4Kyh9A=;
 b=dVAyXwwcwagVDRPVGsw97pOCY3lYS5e/AwAlcMAFUNazIvKcCkrpcPnL
 BnWC0OMceLv/CUxpIdtXuY/CDqFI3/3brboYxkYeTyiiR8R9LTyM6Xkyh
 twxA1+O9v9bHWUtZ0Qmj1ylZh6OYSwEdoLqjLX0dzIDW/TbyFw3CJtCzN
 /fBNNMFpqP6Vkykte/tXWOcoNvCGSrJi6Ait9x9aJW1CivbvW1nr3VpRy
 EZUoah3+sv7e5ZacB/qSaqpc3Rey+cPdLbAd/iR8PJKQ1TdNPx5wXRYhM
 ZNXdJNjIfBOriYSPXWn9/xazOaoiurYIBPdMuw1oFnOGXp7SDvcVrm0Uw w==;
X-CSE-ConnectionGUID: xFjBqMLGSrK1zdQ8EfF6gA==
X-CSE-MsgGUID: 1G4yHJ+JTmOfrsC9ZLg6dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81783928"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81783928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:28 -0800
X-CSE-ConnectionGUID: Kso4QsU0QdK8ayeV2DKg/A==
X-CSE-MsgGUID: J8EY7Z2+SkGquimcV7+qiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="212724535"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 20:12:27 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v7 9/9] tests/kms_writeback: Use helper to fetch default
 FB format
Date: Tue, 27 Jan 2026 10:02:33 +0530
Message-ID: <20260127043233.254107-10-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127043233.254107-1-sowmiya.s@intel.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
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

Replace remaining hardcoded formats with the default
formatr selected by the helper based on requested BPC.

v7: Refactor the commit message (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index ec8d974d0..d467652f7 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -685,7 +685,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      get_default_fb_format(&display, BPC_8),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
-- 
2.43.0

