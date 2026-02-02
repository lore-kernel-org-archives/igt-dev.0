Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A8E73140
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4290F10E2DD;
	Mon,  2 Feb 2026 08:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8ULxXiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FEC10E39F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770020683; x=1801556683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/CNL5YK8aPynoOm2ZXIuigbtj1GJaGi924ijbkgHgM=;
 b=g8ULxXiLAX6rRSfCwOJaa2/5d2kgr7uJ85b8sRDOk/5aH7nFexF1VrK8
 h1TMyk7gjIM2IheSXcXfStx8FZ2rO5oowNldbEx5UV0eEyQSdCGAPynSq
 w2UdJNxcnXHUQoHHhv6ne6n/vb5zrrvHwAe4PHZcMjKaBLYUpmsjm4Oz9
 rU6SJtlFK78xmDvWNKszCTGoFOdXMH91u8px0mTgA3hKRUbhCbMv8PvIw
 YoWYfabiXPQYFFyvB1y2F/05fybNzl25AUbxXEjF5FaI9Nr/avVZKKOtR
 /QRm1el+3SMV8Bi19hmGM42KzdD7MKk/FV0rTM1JW9qJuWfigGdwGMyu4 w==;
X-CSE-ConnectionGUID: KfgSeWU7Sj+M+T0ZbuvhOw==
X-CSE-MsgGUID: wNjIWLXFRUu/qCyukS0zrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="58756449"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="58756449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:24:42 -0800
X-CSE-ConnectionGUID: +MKXQ0zyRc+t+h8vm7EiAg==
X-CSE-MsgGUID: 4GP3jevIR3+AGmIKt4dXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209455116"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 00:24:29 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_pipe_crc_basic: Use cleanup framework for
 drm_fd
Date: Mon,  2 Feb 2026 14:15:38 +0530
Message-Id: <20260202084539.2524306-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202084539.2524306-1-kunal1.joshi@intel.com>
References: <20260202084539.2524306-1-kunal1.joshi@intel.com>
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

Use the cleanup framework to automatically close the drm_fd, ensuring it is
closed after all resources that depend on it (framebuffers, pipe CRCs) have
been cleaned up. This removes the manual drm_close_driver() call from the
final fixture.
---
 tests/kms_pipe_crc_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 386cb15ef..f1deaf081 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -397,6 +397,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_cleanup_register_fd(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -503,6 +504,5 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.43.0

