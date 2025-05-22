Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63A8C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 17:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09F10E742;
	Thu, 22 May 2025 17:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsiDhvrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A564710E742
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747935161; x=1779471161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0LpuQzQ2lBLgXinkqumzHQaiWO9PXu+A7IK1mu+qsuM=;
 b=hsiDhvrlZJDYQ7WA/h7ch57IzyInboz1wo26FppIQYOLlVW56trIbVxf
 mjP76i5usaoaADFwmOtkrGtn51nYoRbfG1+6g9JjPQQBSdhZm1qabi8gF
 T3d3BwqR50RvsT8jz74mp8tSsEjqC/ScrOEW29HQ8SzpCFLtDPMTFhf1Y
 Hn7ULVMbatZAXRYfe75+NPC1FOVk1O7XrHc7cLLZMWVTfHLTdT5UsXfg3
 +45x+Mv6v0WxCs7kjvRSEuWnrhCY7EPYVV2NXFT6sdNMlyZ+Q6PGM48+3
 Ux+0tHLFkMRVNAaYvkcOOYOBTu6AwVBGtPgQ2KFFoyuTwoxw/kYja+G6T w==;
X-CSE-ConnectionGUID: AV1I3YKzQBed74oAvJVL9g==
X-CSE-MsgGUID: D7+CcHxhTH269tHLdbkNRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67535672"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="67535672"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 10:32:39 -0700
X-CSE-ConnectionGUID: aFtJUAwKS6GbvvDo8pio0w==
X-CSE-MsgGUID: lw2kTrT0S0qxxdNXsIhPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141224849"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 10:32:37 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Date: Thu, 22 May 2025 17:24:41 +0000
Message-Id: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

EU stall sampling is not supported on SR-IOV VF. Skip the test on SR-IOV
VF.

Cc: Harish Chegondi <harish.chegondi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_eu_stall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 411c30871..aa94d9565 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -44,6 +44,7 @@
 
 #include "igt.h"
 #include "igt_core.h"
+#include "igt_sriov_device.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 
@@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		drm_fd = drm_open_driver(DRIVER_XE);
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
-		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
+		igt_require(!intel_is_vf_device(drm_fd) && (IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0)));
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
 		if (output_file) {
-- 
2.34.1

