Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8163FCD98CE
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6710E595;
	Thu, 11 Jun 2026 14:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIe9CXz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA15610E042
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187899; x=1812723899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rV7DAD37fSIYwRUVgMpEfuxGt9+TpM1UPnm/u8QcGFk=;
 b=hIe9CXz27tpDkNmyioLEQ1Ia1ao9hqc2Y0MWQkLmvpvImfRj28XD0mPR
 iWjF0QDpJ/Eo9GHTu6X1PXqnXL5pv5gpI5FiiBqu1PLQyk1gBtOl6WrCd
 8fYifJu5CKji1aG56MX8UhQ9lnLnsbWWxWnVhhPYeAbpG/gQhNUfem2hd
 oqBqkuKXKqCWnXFO2oCwqDEjpgfLm4I48x5+k1qLpgZLHnu+dP5cZ7ChD
 JWPwQqH2Go/ZVcxL4o4ziZq2NWPw48TRsuu9k6xoveVRfOXObq1tbNR8D
 Cyo7MWskjdi2KgeJ00DScGtENAAwF2AdNgHLb9ULO+e9SeQyNwx+jPN70 g==;
X-CSE-ConnectionGUID: c8fyy6KVSv+q9sp4lMyrJQ==
X-CSE-MsgGUID: meBAfE2qS3yUInEbu3O7Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81743476"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81743476"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:59 -0700
X-CSE-ConnectionGUID: gQ8oJY1UTweDfNi3aeV0Aw==
X-CSE-MsgGUID: 5Wd4NC+DT0y2h4E8a1uGqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270511175"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:57 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/core_hotunplug: Add exec-fork-unbind-rebind
 subtest
Date: Thu, 11 Jun 2026 16:24:38 +0200
Message-ID: <20260611142438.260647-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
References: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
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

Add coverage for unbind/rebind with live child-process GPU handles.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 tests/core_hotunplug.c | 98 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..2e5aa8d5c 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -605,6 +605,92 @@ static void hotunbind_rebind(struct hotunplug *priv)
 	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
 }
 
+/*
+ * Start a spinner in a child process, then end it while keeping child-side
+ * handles alive. Verifies the parent can unbind and rebind the driver while
+ * those child handles are still open.
+ */
+static void exec_fork_unbind_rebind_run(struct hotunplug *priv)
+{
+	struct igt_helper_process child = {};
+	int ready_pipe[2], stop_pipe[2];
+	char msg = 0;
+
+	igt_assert_eq(pipe(ready_pipe), 0);
+	igt_assert_eq(pipe(stop_pipe), 0);
+
+	igt_fork_helper(&child) {
+		const intel_ctx_t *ctx = NULL;
+		uint64_t ahnd = 0;
+		igt_spin_t *spin;
+		int fd;
+
+		close(ready_pipe[0]);
+		close(stop_pipe[1]);
+
+		fd = local_drm_open_driver(false, "", " for spinner workload child");
+
+		if (is_i915_device(fd)) {
+			ctx = intel_ctx_create_all_physical(fd);
+			ahnd = get_reloc_ahnd(fd, ctx->id);
+			spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx,
+					    .flags = IGT_SPIN_POLL_RUN);
+		} else {
+			ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+			spin = igt_spin_new(fd, .ahnd = ahnd);
+		}
+
+		igt_spin_busywait_until_started(spin);
+		igt_spin_end(spin);
+
+		msg = 1;
+		igt_assert_eq(write(ready_pipe[1], &msg, sizeof(msg)), sizeof(msg));
+		close(ready_pipe[1]);
+
+		/*
+		 * Block until parent completes the driver unbind.
+		 * Intentionally skip spinner teardown: we want handles (ex. exec_queue) to
+		 * remain alive until fd close.
+		 */
+		read(stop_pipe[0], &msg, sizeof(msg));
+		close(stop_pipe[0]);
+
+		if (ahnd)
+			put_ahnd(ahnd);
+		fd = close_device(fd, "child late ", "rebound ");
+		igt_assert_eq(fd, -1);
+	}
+
+	close(ready_pipe[1]);
+	close(stop_pipe[0]);
+
+	igt_assert_eq(read(ready_pipe[0], &msg, sizeof(msg)), sizeof(msg));
+	close(ready_pipe[0]);
+
+	driver_unbind(priv, "", 0);
+
+	close(stop_pipe[1]);
+	igt_wait_helper(&child);
+
+	driver_bind(priv, 0);
+}
+
+/**
+ * SUBTEST: exec-fork-unbind-rebind
+ * Description: Check if the driver can be cleanly unbound and rebound while
+ *		child-process handles remain open
+ */
+static void exec_fork_unbind_rebind(struct hotunplug *priv)
+{
+	igt_require(priv->chipset == DRIVER_INTEL || priv->chipset == DRIVER_XE);
+
+	pre_check(priv);
+
+	exec_fork_unbind_rebind_run(priv);
+
+	igt_assert_f(healthcheck(priv, false), "%s\n", priv->failure);
+}
+
 static void hotunplug_rescan(struct hotunplug *priv)
 {
 	pre_check(priv);
@@ -757,6 +843,18 @@ int igt_main()
 			recover(&priv);
 	}
 
+	igt_fixture()
+		post_healthcheck(&priv);
+
+	igt_subtest_group() {
+		igt_describe("Check if the driver can be cleanly unbound and rebound while child-process handles remain open");
+		igt_subtest("exec-fork-unbind-rebind")
+			exec_fork_unbind_rebind(&priv);
+
+		igt_fixture()
+			recover(&priv);
+	}
+
 	igt_fixture()
 		post_healthcheck(&priv);
 
-- 
2.43.0

