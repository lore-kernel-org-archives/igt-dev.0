Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E76CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 20:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C1810EC7F;
	Tue, 23 Jun 2026 20:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kULFxqT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD410EC7D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782244935; x=1813780935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6q5Tl8gCJHgAN/y7UDBq60TloA2FKYsQUJAmFnPRmgo=;
 b=kULFxqT8P5PTT5po0qzUxuPcc/PfKpWnpWAqobDXuICYhwrSmkprgLjp
 j6Dbi5jxWI6ZbO1s4N7txvklHr3fAXQf8xqbiuYLHDZ4ViEbJkqOmE7kk
 Q0Jf6TuAO9DfDDBLSUvjZwf4ZAGtWaJKxTDxgkVoF7gytIhID/0p7NtoG
 bNUejs5TnEzQHxvA2BZGetlmrwibYsY3XwEUHfrWB/jEco2S5Y4QQQUcV
 1VvXYN/wT8AdnSrwEjvcm2B4a5puAQc8tAFkUixTmG1FCzahSB2AGPGAD
 7VQP0Bn9ChowrT/OMe4U6XQFthrN7n/PG7axETbuo5JVkaeCU3o7zrL6I A==;
X-CSE-ConnectionGUID: KB1YwUFmTYOHE2I1Wdk27Q==
X-CSE-MsgGUID: E/5lSlc8RdedLnKdzXzwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105792462"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="105792462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:15 -0700
X-CSE-ConnectionGUID: 7XmrDM1tQceKxaRul1BBvA==
X-CSE-MsgGUID: bpkW4tY5RX2k/GCCMbsiKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="254700630"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:02:11 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 2/3] tests/gpu_buddy: Update buddy allocator tests
Date: Tue, 23 Jun 2026 22:01:51 +0200
Message-ID: <20260623200152.12996-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
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

The DRM buddy allocator has been moved one level up, and is now renamed
to just the GPU buddy allocator. This means that the .ko object used to
run the KUnit test has been renamed, so IGT tries to run a test that
doesn't exist anymore.

Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
and update the igt_kunit() call to invoke the proper tests. Also update
tests/meson.build to prevent the build system from trying to build
drm_buddy, and make it build gpu_buddy in its stead.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/{drm_buddy.c => gpu_buddy.c} | 4 ++--
 tests/meson.build                  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/{drm_buddy.c => gpu_buddy.c} (51%)

diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
similarity index 51%
rename from tests/drm_buddy.c
rename to tests/gpu_buddy.c
index dbc7c957d..8683b5af0 100644
--- a/tests/drm_buddy.c
+++ b/tests/gpu_buddy.c
@@ -6,9 +6,9 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
-IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
+IGT_TEST_DESCRIPTION("Basic sanity check of the GPU buddy allocator (struct gpu_buddy)");
 
 int igt_main()
 {
-	igt_kunit("drm_buddy_test", NULL, NULL);
+	igt_kunit("gpu_buddy_tests", NULL, NULL);
 }
diff --git a/tests/meson.build b/tests/meson.build
index 4c1a39e9e..0d9008bbd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -12,11 +12,11 @@ test_progs = [
 	'dmabuf_sync_file',
 	'device_reset',
 	'dumb_buffer',
-	'drm_buddy',
 	'drm_mm',
 	'drm_read',
 	'drm_virtgpu',
 	'fbdev',
+	'gpu_buddy',
 	'kms_3d',
 	'kms_addfb_basic',
 	'kms_async_flips',
-- 
2.45.2

