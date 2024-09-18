Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC46DCCD195
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 10:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C40F10E1EF;
	Wed, 18 Sep 2024 10:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb9/mIcQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB62310E1EF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726655793; x=1758191793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFhswk9kJ8/i4D7P/qtwvzcZMNIUPVlwUpFJIvmU65s=;
 b=Sb9/mIcQm7QmQIhri92SI9tVQwLYNS7NdG5kQvZbUz5Wglee0RkqVvjg
 0W3XahY5UHhoq8F7E2nCmFVWkJV9F1vXdw/C8EMi1OqPyO6vfwJSiSWIX
 1XJw/fwue7RwLi70HGvRl57RoGT+lIB0owpYl9FIDV9fHf5K5QJeyuNyG
 kx0sToTKlU3uQvjc7OS9VZp9gevbzIQcJnGYO8I0VO5iF++ltLY0XFzmF
 eG/ZMng0eh/LFUgF7nmH7yikbiqVIDlmwYqhdrYXzLE3oqA0vlnHXjIxD
 Xfb3czUQul7NFZD2SAbDr/9IICG+fS0FzCwxjMMCrteAjocevc1FkOMNy Q==;
X-CSE-ConnectionGUID: 8I+QvZ2OTDyhtulqtRckCg==
X-CSE-MsgGUID: S5h2RbZHR2+MCjEoS5WMbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25378135"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25378135"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:36:25 -0700
X-CSE-ConnectionGUID: MqbBg8szQxGPddJ4p2U5qg==
X-CSE-MsgGUID: rq0yFRKRQ6ygQq0PcUXdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="100331675"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2024 03:36:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] tests/kms_universal_plane: Use COMMIT_ATOMIC flag when
 doing commit
Date: Wed, 18 Sep 2024 16:03:59 +0530
Message-ID: <20240918103359.792577-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240918082918.792033-1-suraj.kandpal@intel.com>
References: <20240918082918.792033-1-suraj.kandpal@intel.com>
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

--v2
-Use is_atomic variable to decide on the flag [Bhanu]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 8c1ce8143..7e80b1389 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -702,7 +702,8 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	/* Release our framebuffer handles before we take a second count */
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_fb(cursor, NULL);
-	igt_display_commit2(display, COMMIT_LEGACY);
+	igt_display_commit2(display, display->is_atomic ?
+			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
 	/* We should be back to the same framebuffer count as when we started */
-- 
2.43.2

