Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8595CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078910E33C;
	Mon, 15 Jun 2026 10:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHhDOlwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16A310E389
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519568; x=1813055568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e+AiqyuzJdFGEIg5lZp5Ew1YVrWLsWDgS17u0XRoanQ=;
 b=YHhDOlwbeoJDVnQGWTphK0cOGt8WSO9YBmcYk4YTNlw1qyamADsQA04h
 ajh1gNFb4xVY7+zffKy79jrIj3UTFXCJncl9C9DBy+30pOVTwj66Stfns
 +nMw6+rrnerT6O9Muf+7UsuYd9a6XRPiVbIlINqvP1VPkAAXBhazRfENT
 M5La/edmsc5zExbxT8TIDg6rXClUpBLGBLqIZxUjdl5QhSHMRg4GSGLvc
 IQM7uUYbwUYPB/I310sNs/flUcXtSyKHPyZVwfiPgKxXnWde0Kk9D6UsI
 tMoYTv97nj/dW1pCA0qwHpxDVdpwV0U7SuH+MdhTnf7TJpHBwE+HqFIS7 w==;
X-CSE-ConnectionGUID: CCNxhXTSSZ6eIo7SaiiivA==
X-CSE-MsgGUID: rqrG0jMCRX6HHT4FiZ+f+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93372350"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93372350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:47 -0700
X-CSE-ConnectionGUID: r0JfPNoRS3u20ngi/UFgXA==
X-CSE-MsgGUID: bf541535S5KqQ/zvB449Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271514772"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:46 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 5/6] tests/xe: Arm SR-IOV exit cleanup with callback
Date: Mon, 15 Jun 2026 12:32:19 +0200
Message-ID: <20260615103220.281656-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
References: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_pmu.c              | 4 ++++
 tests/intel/xe_sriov_admin.c      | 4 ++++
 tests/intel/xe_sriov_scheduling.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..bb6d21b9f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -994,6 +994,9 @@ static unsigned int enable_and_provision_vfs(int fd)
 	igt_require(xe_sriov_admin_is_present(fd));
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
 	xe_sriov_require_default_scheduling_attributes(fd);
+	igt_sriov_install_exit_handler(fd,
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
index 5c7f5d621..8b400a01f 100644
--- a/tests/intel/xe_sriov_admin.c
+++ b/tests/intel/xe_sriov_admin.c
@@ -346,6 +346,9 @@ int igt_main()
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
+		igt_sriov_install_exit_handler(pf_fd,
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
index de697dbf5..47cc5d9b0 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -1469,6 +1469,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		igt_require(xe_sriov_admin_is_present(pf_fd));
+		igt_sriov_install_exit_handler(pf_fd,
+					       xe_sriov_admin_exit_cleanup_restore_defaults,
+					       NULL);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
 		xe_perf_device(pf_fd, perf_device, sizeof(perf_device));
@@ -1635,6 +1638,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 			       "Failed to restore sriov_drivers_autoprobe value\n");
 		igt_abort_on_f(ret,
 			       "Failed to restore scheduling params\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
-- 
2.43.0

