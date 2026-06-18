Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B8CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1F010F153;
	Thu, 18 Jun 2026 14:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIgqG0c5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871C210E7CC
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791808; x=1813327808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IMss0SkAZrpXDTk/Gh/4sSSN1QIYMP6pE1sxKnicOIA=;
 b=nIgqG0c5T+A13ZqBDgZXqrlK21rSlUvhRlekAKVndP2xFir068NuNPhA
 8h0wbk8rx6h78j1NPYOj0GYkhyb0rfXyg5tNBPZxcd+h83UAwMBeLXUxG
 aK+gUXc+Of48BbErQLk4hUwXJdAIMKeLYiLQQ2gQZP9Xzp28NRtP0YD8m
 ve2Xyl3d8y3MPvnuD6bBK+JLm6ROp9a0uUkl7m+Vc1Y+EfaajoDnnFeX0
 l5QXzT9f01toc5rVZzRrDniJSMcd284HdhIPFdOF5GIgTAaLC+DAnDvAF
 ewcASQJunRopKMpQkwRUHwUtpMse8hy4RsCFO0ynjVTad0MLuU7YcPMTi g==;
X-CSE-ConnectionGUID: 2BX45C68Rlyx0fsU3uu+Cw==
X-CSE-MsgGUID: SMLJYwmfQkmgrtOrjJapMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86538752"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86538752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:08 -0700
X-CSE-ConnectionGUID: N0MFxwplRsWVrI5lyDlviw==
X-CSE-MsgGUID: FqS7rYxCTXmVVl3H0+zpOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="286502548"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 3/5] benchmarks/gem_exec_reloc: use
 hars_petruska_f54_1_random() from lib/rand
Date: Thu, 18 Jun 2026 17:09:51 +0300
Message-ID: <d4eef997aef5064ec0e797e36d7196c0dcc1f4f6.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781791747.git.jani.nikula@intel.com>
References: <cover.1781791747.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remove the local duplicate of hars_petruska_f54_1_random() by switching
to use lib/rand.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 benchmarks/gem_exec_reloc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
index 0610308669f2..ff25a3b3b59a 100644
--- a/benchmarks/gem_exec_reloc.c
+++ b/benchmarks/gem_exec_reloc.c
@@ -41,6 +41,7 @@
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
 #include "igt_debugfs.h"
+#include "igt_rand.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
 
@@ -52,15 +53,7 @@
 #define REVERSE_OFFSET 0x40
 #define RANDOM_OFFSET 0x80
 
-static uint32_t
-hars_petruska_f54_1_random (void)
-{
-	static uint32_t state = 0x12345678;
-
-#define rol(x,k) ((x << k) | (x >> (32-k)))
-	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
-#undef rol
-}
+static uint32_t random_state = 0x12345678;
 
 #define ELAPSED(a,b) (1e6*((b)->tv_sec - (a)->tv_sec) + ((b)->tv_usec - (a)->tv_usec))
 static int run(unsigned batch_size,
@@ -106,7 +99,7 @@ static int run(unsigned batch_size,
 			mem_reloc[n].offset = batch_size - 8 - (8*n % (batch_size - 16));
 		else if (flags & RANDOM_OFFSET)
 			mem_reloc[n].offset = 8 +
-				8*hars_petruska_f54_1_random() % (batch_size - 16);
+				8*hars_petruska_f54_1_random(&random_state) % (batch_size - 16);
 		else
 			mem_reloc[n].offset = 1024;
 		mem_reloc[n].read_domains = I915_GEM_DOMAIN_RENDER;
@@ -135,7 +128,7 @@ static int run(unsigned batch_size,
 		execbuf.flags |= I915_EXEC_NO_RELOC;
 
 	for (n = 0; n < num_relocs; n++) {
-		target[n] = hars_petruska_f54_1_random() % num_objects;
+		target[n] = hars_petruska_f54_1_random(&random_state) % num_objects;
 		if (flags & LUT)
 			reloc[n].target_handle = target[n];
 		else
-- 
2.47.3

