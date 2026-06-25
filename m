Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B09CDE009
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 19:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B59A10E260;
	Thu, 25 Jun 2026 19:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZPNWG6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C110E260
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 19:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782415762; x=1813951762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XUzLyrLB+YB+HBrIkU+1xbGG1ZGJgWtIDSj+6mWnlkk=;
 b=ZZPNWG6Lz49eUfHdtlVaOBkbLAZjBD1FNRshzJevdTpyuztKRSy54Gct
 VRwUFehDiodWREMssFKQzHVrFl4JMc1bIedawStj6qfg8Cxh5IxnmsDdj
 BTvdiv6D/lIQff7WVdK/JlfSWhrZcdFgfAmwJ1N2+GD7I6w0qpj1NYDuU
 K2zmt4phV8JFGgxnfyCTyugDv9F6ZWIXVZH7WV2C8LIkHOSybj8HHUWQX
 UwGzYNvhaiL1T+Ek6W5XvScL7NYvCfLKjka2CDKFBojUCK11QhLHueqTK
 Maj+WXZPEf+8R3HNXE9IXoesAAe7SI+nxE00e3qEZJI6THxcMdhuOXfqE g==;
X-CSE-ConnectionGUID: aeLOx6E5TAytRU80YV9fQg==
X-CSE-MsgGUID: kzuyAdeIS1qx/kzDvTKamQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93859258"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="93859258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:22 -0700
X-CSE-ConnectionGUID: OvK4nJKpTuKPKuDBuGsMjQ==
X-CSE-MsgGUID: W4NBtHhQT/KVAbU/i03sIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="252912758"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.210])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 12:29:19 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/gpu_buddy: Rename the KUnit buddy
 allocator test
Date: Thu, 25 Jun 2026 21:28:50 +0200
Message-ID: <20260625192850.56004-4-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
References: <20260625192850.56004-1-krzysztof.niemiec@intel.com>
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
and update the igt_kunit() call to invoke the proper tests.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/{drm_buddy.c => gpu_buddy.c} | 4 ++--
 tests/meson.build                  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/{drm_buddy.c => gpu_buddy.c} (51%)

diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
similarity index 51%
rename from tests/drm_buddy.c
rename to tests/gpu_buddy.c
index dbc7c957d..4cea2e124 100644
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

