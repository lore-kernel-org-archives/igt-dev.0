Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A6D637A4
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 17:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEAF10E111;
	Wed, 13 Nov 2024 17:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVFlW/s4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6B910E111
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731520426; x=1763056426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CriBsEQH51X97lFQqpKGj45lWoY0PwBh13ZoVaee3oc=;
 b=SVFlW/s49U/Qu8MiPrGzFE8kXdodRAZy3ah+dIZ4CjyNr2NrcFHu4YPw
 yYJUTKn8AU4t+YqEOc+nE6NmB/n+xdT2jdzglUesENsrYAkBKwgiKx3PJ
 tQrfVLbUO2NgDOx0j4Mt4zBayvpFI4MkyStfmuoLvnB2SeTR86GrZvp8v
 rdj4e7bS98VsnY6IoHWG0XhB257kmf8Bw+PPTO6c3tynxJ7tof/aUyZsy
 5TWkKobTKP/tzESHNg/kmz8zvbFKO+3nmzBDXXM0a44ELR8R1Qtvwp2nV
 FWPLbYpuicJuriwOV4eOzvi+qJ4bbVVvzK5v0q3Lun/fwdEd+4sBjEW3M A==;
X-CSE-ConnectionGUID: fvQjKdZcSd2sNEvuHslMrw==
X-CSE-MsgGUID: M7l/k/FCTTeu4SbjqBRqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30832503"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30832503"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 09:53:46 -0800
X-CSE-ConnectionGUID: 4RkQO6b6Some8H/CrtbqYg==
X-CSE-MsgGUID: RXzs8pSQRhePTR2+g7OUxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87835107"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by orviesa010.jf.intel.com with ESMTP; 13 Nov 2024 09:52:52 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
Date: Wed, 13 Nov 2024 23:22:19 +0530
Message-Id: <20241113175219.162926-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

FBC test isn't supported on bmg, skip the test on this platform.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b7e3f7379..8ba1faf69 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4471,6 +4471,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		setup_environment();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
+		igt_require_f(drm.display_ver != 14,
+			      "FBC isn't supported on BMG\n");
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
-- 
2.25.1

