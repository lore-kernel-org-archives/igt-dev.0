Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B8FCCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 08:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB0510E0BF;
	Wed, 18 Sep 2024 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AG7jz/oW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F310E0BF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726648305; x=1758184305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jso1YiKuKgnn9Xh2MUWG8X/xulsu+zJUU+uIRjv0uxg=;
 b=AG7jz/oWltPybjpPISJF3fAh1Z5MoLdVORynHVaTDibn/7lWd0SHb4ou
 ALxWgZYQWkro4uV1RTJmi/4fFALqH9O2vgvMAEwEWG/elUNWUOKlnBeov
 kC0RBMP84sRgvONhp0oWIcLMeBo771CPFvsUJ07QZb0UmivU+UIzrekUc
 J4+juWAVqBj1DYvNCvhRWzl9aEzAMQH61HAa7mknhMXb4AV1U5NXI7vAd
 JttiAAu4EbHgReZZlozDSVHvWJ8Z8/p5Hf4VUqoFduMuD0yScFYgO8mVO
 JDVYFRLiuHDzUOnEpqfbCtq13mK69yHlsZ89Geg+kh1wsLao51apNmArc w==;
X-CSE-ConnectionGUID: RCVcFqjGSS+PEZAHvGRKtA==
X-CSE-MsgGUID: 9mQggFPLT8yH3fDIBJ2IUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25665596"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25665596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:31:44 -0700
X-CSE-ConnectionGUID: rvg1lMaaSf+/D07FvFeOXQ==
X-CSE-MsgGUID: IlWyugwdSKWtZpvymtyKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73823432"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa005.fm.intel.com with ESMTP; 18 Sep 2024 01:31:43 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] tests/kms_universal_plane: Use COMMIT_ATOMIC flag when
 doing commit
Date: Wed, 18 Sep 2024 13:59:17 +0530
Message-ID: <20240918082918.792033-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Use COMMIT_ATOMIC flag when doing a display commit so that we make
sure to wait for all the cleanup work to be done before going and
reading the i915_gem_framebuffer entry otherwise it may end up
showing an incorrect count sporadically if the cleanup takes
place after the count is read.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_universal_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 8c1ce8143..081847f87 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -702,7 +702,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	/* Release our framebuffer handles before we take a second count */
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_fb(cursor, NULL);
-	igt_display_commit2(display, COMMIT_LEGACY);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
 	/* We should be back to the same framebuffer count as when we started */
-- 
2.43.2

