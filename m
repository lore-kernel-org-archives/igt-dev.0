Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7F6CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BBC10E384;
	Mon, 10 Nov 2025 19:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWls17aH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF27310E374
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802710; x=1794338710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWn27QXqqIQZBjFnGbHLBsvSgS0KT+QG236+wYFiLxk=;
 b=ZWls17aH5VgO5XlA8efQYjog094e0JWTDPMyFOq2mbSLjIbOmQV2HLZs
 QR4ZFyb0GJgxQmys5XkjvZ5A9fiZKS2mqK5ydgJXw/8SgSVrbS4KD9GOf
 TdS8HdSwTh+Li2dvpO2CyrLRPz+VUnLojX9n+8thrxF2xlfaZ+8KG7RCq
 3SBnnpr+Rg+ZlTYkbHqXfyhYGjebpnCxn+atWtk3nqXZ7OdWCqXoGXG5Y
 dOLCBHidC3Ci7xk7EFIZ+aYNKm4xz1VZYvimOb3EHN9iHb1ELgTkGmonJ
 diFlQ4GwkKJ4J0CbTbbn61EjtjLqcVYUeRRd+tBandJSVHYbWvVUwBpdR g==;
X-CSE-ConnectionGUID: KgM8dBWMQD2uItsejw+uCQ==
X-CSE-MsgGUID: 6jeshopTQxChNFaktL8+Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900256"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:10 -0800
X-CSE-ConnectionGUID: yCtnQ59uQW2zKIRAxXROJw==
X-CSE-MsgGUID: O+rf+PflQkybmrRkZebgwg==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:08 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 3/8] Revert "tests/intel/kms_fbcon_fbt: Enable the tests
 support variations based on the WAs"
Date: Tue, 11 Nov 2025 00:54:49 +0530
Message-ID: <20251110192454.44385-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

This reverts commit 47b875a087b33f2c866492624d8a7a4ef45f55e9.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 810bc5114..e8d0702b2 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -40,7 +40,6 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include "i915/intel_fbc.h"
 
 /**
  * SUBTEST: fbc
@@ -463,7 +462,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_skip_on_f(intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
+		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
 
@@ -476,7 +475,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_skip_on_f(intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
+		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
 
-- 
2.48.1

