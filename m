Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F30C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 12:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5473310E2AC;
	Fri, 23 May 2025 12:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHZmdNe9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AC610E2AC
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 12:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748004747; x=1779540747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LJvYuhGzD8kw933Dr2oN2f/VYapJMlSWbUvlL6oZZ3U=;
 b=lHZmdNe9iw+aa4u3zjVWSS+F0UDbI2S7mV8SqCGR9ozl+gCbEEm/Skc4
 26NuOnfYhGn9CLbz7OExOqwV5dZ9L7g7C9EwX6ll1xSCJxVHbLRUxxQIj
 xyhn8MglxsSeMMJhpg/Gd4VVPYIeE6O87MrIPoB/Tc0cCnLXyR8wXq23Z
 UZU1kcyKAF67dQqolabm5Wa5b/Mn3JtbjXwlX2/qHOC0s8vs4g8hkiWKB
 9kfuWh/Aik+nmROct68GVJh0bAboRKX4BAl6/Tae6jH+3u2Yd+yNhkjcH
 /RYTeYRP/vd5+JLOoSze/BjDTA6HjkyXRjL0fDS1c5CGEBcnfj+aAggGh w==;
X-CSE-ConnectionGUID: +DSNGsXZR8SOSX7qRcb8dw==
X-CSE-MsgGUID: u9OmLkSFS+q8TZSk946pkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37684227"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="37684227"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 05:52:27 -0700
X-CSE-ConnectionGUID: lWvc+rHPS7SVWSwuEVeIww==
X-CSE-MsgGUID: +KpEV/QMRwqpCdeFnDrBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="142174226"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 05:52:25 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Date: Fri, 23 May 2025 12:44:20 +0000
Message-Id: <20250523124420.3949513-1-jakub1.kolakowski@intel.com>
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

EU stall sampling is not supported on SR-IOV VF so add a skip for this.

v2: simplify commit message (Kamil)
    move vf check to separate igt_require_f with skip message (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_eu_stall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 411c30871..decbcf541 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -44,6 +44,7 @@
 
 #include "igt.h"
 #include "igt_core.h"
+#include "igt_sriov_device.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 
@@ -654,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
 		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
+		igt_require_f(!intel_is_vf_device(drm_fd), "EU stall sampling not supported on SR-IOV VF.\n");
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
 		if (output_file) {
-- 
2.34.1

