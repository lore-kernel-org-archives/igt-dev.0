Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C833E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 19:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1799710EC49;
	Wed, 18 Dec 2024 19:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDd8mioB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A825010E335
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 19:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734548676; x=1766084676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jU6DgVuzIaI52L8gInDFQuLUIDRYFy+ueSP1P0naEI0=;
 b=KDd8mioB09POaG1ovqiLrCNpfWfF9LPN+EOPKjsLp07iu1+mOXxQ0xx6
 v9EUEfsyyle9tZnZH63IOyXHmNrk66P90pkIZXIiClf3hymFJMGbWefn8
 GJQDU/CG3NwqBdd72Ajkawfi0H213c+RiSF2jmnq1Be5THUM4sH1+tiOk
 IJHW2ZwBz9qOfyIzy22h6K6ckC5YyliArNimGIqDbSr2Vsw2eh7lSuL3d
 P8tJfwtTjs9UP8kMvx8tymN3K54yFLb3Q63hZyxIB4qxXyi4TfdVG2tEA
 z5gXMbVDHSmizUfA//juByHhJFyRyO2lB17MWl87+R4qwxUGmIDhrXg1b w==;
X-CSE-ConnectionGUID: PbirTnjBRESVRtTX7pmbqA==
X-CSE-MsgGUID: WrnqjiZoQJKNgDvsP91tew==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38717119"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38717119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:36 -0800
X-CSE-ConnectionGUID: 153tt5F6TC+v6ZnnKj22eg==
X-CSE-MsgGUID: NqMO4zj6Tz6yaNIFXsMlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="102946722"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:04:35 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/core_getversion: fix driver closing
Date: Wed, 18 Dec 2024 20:04:17 +0100
Message-ID: <20241218190418.126565-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
References: <20241218190418.126565-1-kamil.konieczny@linux.intel.com>
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

Test uses __drm_open_*() functions for opening a device, so
it should also use corresponding __drm_close_driver() function.

Also while at this sort includes, system ones should be first.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 158133da7..0842b7db6 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -25,9 +25,11 @@
  *
  */
 
-#include "igt.h"
 #include <string.h>
 #include <sys/ioctl.h>
+
+#include "igt.h"
+
 /**
  * TEST: core getversion
  * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
@@ -77,7 +79,7 @@ static void check_all_drm(void)
 
 		check(fd2, info, sizeof(info));
 		igt_info("%d: %s\n", i, info);
-		drm_close_driver(fd2);
+		__drm_close_driver(fd2);
 	}
 }
 
@@ -102,5 +104,5 @@ igt_main
 		check_all_drm();
 
 	igt_fixture
-		drm_close_driver(fd);
+		__drm_close_driver(fd);
 }
-- 
2.47.1

