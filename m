Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99351CD6E60
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B92113A5D;
	Tue,  2 Jun 2026 14:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNezc9q0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B107113A42
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409815; x=1811945815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=czxQbo/NmOUWhiZhUqf/sfc8JWbiAPx7V/EvlRh6d9g=;
 b=VNezc9q0HZQpDY9ASNHgNZrceTiz0zcmIqN/G8o4buWe7IYakdGTacXq
 nA/T6wFt9+WXTTnUznRfoNHIAfWsklz/yVYzM3ziyTZb9GmSRUGJTHm8X
 V8aHdm+YynqS4owhpoyqiQG0jLjVAogJsizAPt2AFfLNZk0ip9UCDyWvN
 +KPYCnHc9mvu4TUWI1mu0194xagI9NJ5RGOptZC0PsQwUfVl1U/5Mpjot
 5wLqOvfGwg6rt8JsKZ+NqHDocV+zEfJ4w/XUTiLljJICflj1NGoAgS6Ec
 h3iRVqMY2aBilLZokcU5l527ep9eQ0BFjmh2GTlYjhDefyZ8XwhAgS9s8 A==;
X-CSE-ConnectionGUID: xN6jLuoHSG60i9uR2O7cjw==
X-CSE-MsgGUID: YS17TA9kSFKcS/qvk0ZgeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81320854"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81320854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:55 -0700
X-CSE-ConnectionGUID: Hx5dhxjOQ2OBsBrFe4NkKg==
X-CSE-MsgGUID: 3BsHrjJZT7iPR0HfqpDwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="241421514"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:53 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 5/6] tests/xe: Arm SR-IOV exit cleanup with callback
Date: Tue,  2 Jun 2026 16:16:08 +0200
Message-ID: <20260602141609.3941750-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in xe_pmu, xe_sriov_admin, and
xe_sriov_scheduling.

Use xe_sriov_admin_exit_cleanup_restore_defaults() as exit callback to
restore Xe SR-IOV admin scheduling defaults. Clear handler after explicit
teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_pmu.c              | 4 ++++
 tests/intel/xe_sriov_admin.c      | 4 ++++
 tests/intel/xe_sriov_scheduling.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..ec0266577 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -994,6 +994,9 @@ static unsigned int enable_and_provision_vfs(int fd)
 	igt_require(xe_sriov_admin_is_present(fd));
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
 	xe_sriov_require_default_scheduling_attributes(fd);
+	igt_sriov_install_exit_handler(fd, true,
+				       xe_sriov_admin_exit_cleanup_restore_defaults,
+				       NULL);
 	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
 
 	/* Enable VF's */
@@ -1035,6 +1038,7 @@ static void unprovision_and_disable_vfs(int fd)
 
 	igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd),
 		       "Failed to restore sriov_drivers_autoprobe value\n");
+	igt_sriov_clear_exit_handler();
 }
 
 static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
diff --git a/tests/intel/xe_sriov_admin.c b/tests/intel/xe_sriov_admin.c
index 5c7f5d621..344a141b7 100644
--- a/tests/intel/xe_sriov_admin.c
+++ b/tests/intel/xe_sriov_admin.c
@@ -346,6 +346,9 @@ int igt_main()
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
+		igt_sriov_install_exit_handler(pf_fd, false,
+					       xe_sriov_admin_exit_cleanup_restore_defaults,
+					       NULL);
 		total_vfs = igt_sriov_get_total_vfs(pf_fd);
 	}
 
@@ -429,6 +432,7 @@ int igt_main()
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
 			       "Failed to disable VF(s)");
 		igt_abort_on_f(ret, "Failed to restore default profile values\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 4228eea2d..bd0ae95fa 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -908,6 +908,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
+		igt_sriov_install_exit_handler(pf_fd, true,
+					       xe_sriov_admin_exit_cleanup_restore_defaults,
+					       NULL);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
 	}
@@ -952,6 +955,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 			       "Failed to restore sriov_drivers_autoprobe value\n");
 		igt_abort_on_f(ret,
 			       "Failed to restore scheduling params\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
-- 
2.43.0

