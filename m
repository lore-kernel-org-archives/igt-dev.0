Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC10FE77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 08:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFFB10F033;
	Fri,  6 Dec 2024 08:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMBAijao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFA10F033
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733473727; x=1765009727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77SBOzlk/vxTVCunrVSw8dMdDt+wmUgy9kryWPEH5Bc=;
 b=CMBAijaoDAAlxQAwIUGEZD8LBTEGXMDK7pF74gRHViJclC0OndLSl/Kr
 Nx2+8a93EMOany/Cub872NO439ummqJ5FeRCyNJBvsG8rD5r0oUExXH7w
 N8z86KTVUDoe6JDKDicfz/JlJktSgaogefG3wO4oxak+ewPNHVNAZODPU
 kNWJX1ST42SneTYSlG06jMI9dh8IGg7ln7ZurYRxiISeeYJHqLJfyoMRj
 P0PwlqE0vlkpJnqPVpnWjs3zs+sNEto+Y9PLMfSPz5q+y2A0euDisJKY3
 idVnp22ERwOwZ2pXjFCqXAxRIjg6l4McZGMf+63QhXuD288mMBMVh/ikt w==;
X-CSE-ConnectionGUID: dM/6RMaBRAe4ArKMf5dmsQ==
X-CSE-MsgGUID: qEsunJHoTXm13jFWxmm13A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44428283"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="44428283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 00:28:47 -0800
X-CSE-ConnectionGUID: N3J73uuhQbS7eAvUlQgaiA==
X-CSE-MsgGUID: nVO7mNWCQuCMawPkcnuZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="117592539"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 00:28:46 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] lib/igt_core: Add helper detecting CI environment
Date: Fri,  6 Dec 2024 09:28:22 +0100
Message-Id: <20241206082822.8648-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Helper determines if the code is running in CI environment by checking
the INTEL_CI environment variable. It can be useful for reducing number
of dynamic subtests executed in CI runs. While some subtests should be
defined, because they can be valuable for debugging or platform bring
up, running all of them in CI for every build is not always necessary.

For example, in the case of SR-IOV tests, while the ability to run test
on a specific VF is important, executing it on all possible VFs in CI
for every build might not be required. In many cases, testing on a single
random VF is sufficient and testing on every possible VF would
significantly increase execution time and CI infrastructure load.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_core.c | 21 +++++++++++++++++++++
 lib/igt_core.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..50759c170 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3060,6 +3060,27 @@ err:
 	igt_assert_f(0, "failed to install the signal handler\n");
 }
 
+/**
+ * igt_run_in_ci:
+ *
+ * This function can be used to reduce number of dynamic subtests when running
+ * in CI environment. While some subtests should be defined, because they can
+ * be useful during debugging or platform bring-up, executing all of them in CI
+ * for every build is not always necessary. This i-g-t mode is selected by
+ * setting the INTEL_CI environment variable to 1.
+ *
+ * Returns: True when run in CI environment, false otherwise.
+ */
+bool igt_run_in_ci(void)
+{
+	static int ci = -1;
+
+	if (ci == -1)
+		ci = igt_check_boolean_env_var("INTEL_CI", false);
+
+	return ci;
+}
+
 /* simulation enviroment support */
 
 /**
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 90f57402f..1c75312f4 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1221,6 +1221,9 @@ typedef void (*igt_exit_handler_t)(int sig);
 /* reliable atexit helpers, also work when killed by a signal (if possible) */
 void igt_install_exit_handler(igt_exit_handler_t fn);
 
+/* helper to automatically reduce number of dynamic subtests when running in CI environment */
+bool igt_run_in_ci(void);
+
 /* helpers to automatically reduce test runtime in simulation */
 bool igt_run_in_simulation(void);
 /**
-- 
2.40.0

