Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2229CC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 12:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055CA10E7EB;
	Thu, 12 Jun 2025 12:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By6FCioC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438E10E7EB
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749730189; x=1781266189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3zdjkDMK5rxw6yN9BnOBosdx4AaoInkimEW81aDABaE=;
 b=By6FCioCPzRkN3LOZ/yqk2FBmv/j7UEEj+2uqElfdb8Ublo7/m2Zx0kE
 ov/nwHjOXdWLDNpCbe2aCmRAVwTGKlohsiSDPC/jaiX3lXx9cll3bPiTK
 1yxWL88GCdBP6hTaIwlBmeSAeXzP1shRF2QUf9H825fLbSa7cQRoFORph
 yt6aHtEA1552jjXE6quSl9p2eXXWVO+C3Fe3DBoFTu+vtaxoAVBsSEf8w
 Z8EPNyrFN6zwfrIChD8emNcdR0+4UO5GcwEurPJFQyBRo+j3dFY4Yxva/
 KqjfaLeK8KvwmCwNkbh8cfXrfCld2Kk8sV9Zqvfx9gtFTm+sV2Ml+uAQv w==;
X-CSE-ConnectionGUID: FCD1dmkESjqzRki/0FI1Pw==
X-CSE-MsgGUID: pvoalN84Q42TAIOT64g7OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69345264"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69345264"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:09:46 -0700
X-CSE-ConnectionGUID: R9mbsP98SACQa5rZTfd5KQ==
X-CSE-MsgGUID: kv2I5ZJ0TAmhe3zfp4JrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152647377"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 05:09:45 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/intel/xe_eudebug: Reduce debug loglevel
Date: Thu, 12 Jun 2025 12:11:04 +0000
Message-Id: <20250612121104.2824149-1-jan.sokolowski@intel.com>
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

This test exceeds disk usage limit on CI environment
due to logging too many logs.

As it's copied from an already existing comment, link points
to the original mail and it's author.

Reduce the debug log level to 10 if it's bigger than that.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Suggested-by: Pranay Samala <pranay.samala@intel.com>
Link: https://lore.kernel.org/all/20250128052825.424586-1-pranay.samala@intel.com/
---
 tests/intel/xe_eudebug.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index bdf73c4e9..9e98c619a 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -20,6 +20,7 @@
 #include <sys/prctl.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "xe/xe_eudebug.h"
@@ -2798,8 +2799,18 @@ igt_main
 	int fd, gpu_count;
 
 	igt_fixture {
+		int dir, current_log_level;
 		fd = drm_open_driver(DRIVER_XE);
 		was_enabled = xe_eudebug_enable(fd, true);
+
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			current_log_level = igt_drm_debug_level_get(dir);
+			close(dir);
+
+			if (current_log_level > 10)
+				igt_drm_debug_level_update(10);
+		}
 	}
 
 	igt_subtest("sysfs-toggle")
-- 
2.34.1

