Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1B8C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08964112DE5;
	Tue, 12 Mar 2024 12:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKBnOVHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F85112D07
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710246427; x=1741782427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3mrVZyiGr8GUYgsNaOsyGa+DnX2uxUE9pCOpVd1g8k=;
 b=HKBnOVHY3EJMH14fWfc8/KE+IVE6yfkW6g+wxNWGRDjV57RIB9m41IXz
 CKwKdmMdO0ZLKrizk4oHXiXX0kLvWVeyuh7d6U6UK0S9qOGefvMc3VoWK
 ohatclzCppPhgW32DeGIGn1o0fj95JfN47KbJAoajhtyPhEJl54WFoSG0
 iek7C79wLZT/LcWvN7BBtunFKI0l6UWh/Y/qjK9i2OGMKvtY11LL995BK
 2zNKZEe43ToliAzj4tbmVpJpFEymDSiqkDcW/PMjFDJ8XBtC2hJWo5IMW
 m6+15ZR91BAcWt64nrbzOsiQgWgT5jb3BJuFMGObCLKZaPyWDvhOJ/RKr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16392209"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16392209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11986784"
Received: from unknown (HELO localhost) ([10.245.244.207])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:27:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_ccs: Simplify subtest skip condition
Date: Tue, 12 Mar 2024 13:26:54 +0100
Message-Id: <20240312122654.73689-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
References: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Newer platforms (Xe2) supports compression on system memory so subtests
which might be executed are not only limited to discrete/vram. Enabling
dynamic subtest in ctrl-surf-copy test depends on surface compression
property. Lets use introduced in previous patch helper which returns
does region supports surface compression.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_ccs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 5a79642c9d..d6f5408a78 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -12,6 +12,7 @@
 #include "igt.h"
 #include "igt_syncobj.h"
 #include "intel_blt.h"
+#include "intel_common.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
@@ -618,8 +619,7 @@ static void block_copy_test(int xe,
 			region2 = igt_collection_get_value(regions, 1);
 
 			/* if not XE2, then Compressed surface must be in device memory */
-			if (config->compression && !(AT_LEAST_GEN((intel_get_drm_devid(xe)), 20)) &&
-									!XE_IS_VRAM_MEMORY_REGION(xe, region2))
+			if (config->compression && !is_intel_region_compressible(xe, region2))
 				continue;
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
-- 
2.34.1

