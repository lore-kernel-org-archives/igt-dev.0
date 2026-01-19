Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FAEC98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 04:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6281210E359;
	Mon, 19 Jan 2026 04:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ykuqda66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC1C10E359
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 04:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768798098; x=1800334098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HT1zdDr43a8ps5fdfRlHYSlwmmVlJiipYHHNIuJxn6o=;
 b=Ykuqda66/SGHbf7k7a9Z3QmI93wg+WT4pVNOq9deimOvC+2CUA8ksczz
 9O64jlF3YQrDZgHcIpY/bkOd+qauFupeQF7c/JYd7BfOSbXy8saWMoai+
 8kc+6TzYrb00F6LEEav82bh3EtKnXNx4DJPnrPYQLPfNDY6iWdqSXxS3V
 f/Z7l5V1t0Emnc6IwRjgHyz+/Ruk8yw0UJseL8D0nhHUiKJ6tN56LdBUA
 JSz5jgszesCnIXXdKDqlIr7xheIgPZfLliAgXIHzMrhfHY59iwAEm7Mk+
 GXbB17rSL9PWKRkAKwxUEjF8GbMFJoVksa8RgoBr3IKu69OVtlWJ5sfPs A==;
X-CSE-ConnectionGUID: GopsQiUkTkC4HQcEyatSiw==
X-CSE-MsgGUID: Z93TVRXcSvecR2jNgZM0LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87581751"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87581751"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:18 -0800
X-CSE-ConnectionGUID: 9UCACq/FQhaDcM19RnsOtw==
X-CSE-MsgGUID: W47G4dgjQUKCjGFL9qj6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210271141"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 20:48:17 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v6 8/8] tests/kms_writeback: Use helper to fetch default
 FB format
Date: Mon, 19 Jan 2026 10:37:32 +0530
Message-ID: <20260119050732.110985-9-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119050732.110985-1-sowmiya.s@intel.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
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

Replace hardcoded RGB default selection with a
helper that chooses formats by requested BPC.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 66da5603a..5d41a62d5 100644
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

