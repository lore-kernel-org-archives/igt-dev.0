Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F3DCFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723510E152;
	Sun, 23 Nov 2025 15:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J49ih913";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2E810E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910548; x=1795446548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Fu7qHmJmMRElxJArhets9+yVzeVTc6FOX8BOP04XBk=;
 b=J49ih913bXxwvFYva0sT0zMtsO4oUlxIIvPBNISomYIl+C1XbZ/Oin+W
 qSL43+ubXLaQG7nLQkYku4NqppczqWMJ+jDU/pSoEhhRzVAf8F/8DgSAe
 +cCS9dF+c2Liy6R4vyvmL2i5slFz99alS2IADEGVo7hTGD7bMRa28wDIg
 5Y+OUFAJCqZQ1i5Bl+RRC7mI3aJOSf5DZpZo3r6HIVI2//c8YYVnqrcS3
 Z2Z6+I476q+ZGh9peQB0ezr4LAm6lWalAh4URmLIBf6RLDnjThBsRHskV
 s+bWKjhXLAAVSSyJdMFIaC1QpFNb/iyYyD30XASX3Qa4iyhNxyDa20dya Q==;
X-CSE-ConnectionGUID: HmUqY72LSlGmtrkfKlQvgQ==
X-CSE-MsgGUID: jXjr9b4lSUmR0q4xbOrYpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615259"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:08 -0800
X-CSE-ConnectionGUID: ZaXW/fk+SWqGhNdgpY80LQ==
X-CSE-MsgGUID: spSyGhvDSH6X9WJDPwno5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903930"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:08 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 35/35] tests/intel/gem_pxp: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:54:12 +0530
Message-Id: <20251123152412.599801-36-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

Use igt_pipe_crc_new_for_display() for the protected content CRC check
instead of igt_pipe_crc_new(). The CRC collector is now created from the
igt_display and pipe index, avoiding assumptions about the underlying CRTC
numbering.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/gem_pxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index c8d378875..ac680e485 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1244,7 +1244,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = &display->pipes[output->pending_pipe];
-		pipe_crc = igt_pipe_crc_new(i915, pipe->pipe,
+		pipe_crc = igt_pipe_crc_new_for_display(display, pipe->pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
-- 
2.25.1

