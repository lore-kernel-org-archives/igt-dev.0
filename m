Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F012CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D0D113A58;
	Tue,  2 Jun 2026 14:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yss77L/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D344113A5C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409810; x=1811945810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LC0snC8UrafIP6m7zrq6HVGxD1IV/2aMch61cpGewqE=;
 b=Yss77L/ktbM/2HViJIVJAUEZW2EcJoYhD8g5BsmWbZs0hHtYbbrcU2GB
 0jwmHdgjnOO7iQUQPaz8kIsArzp9Ss6OGaQcYCy+vr1q3Yqhw8a3VM6M9
 6i4CNRSciN4VzEsknI5XWL2EZqhMEYl1wvy6YKyWXWeAqYvTR1/RRUz4E
 lRdJ3BQGFseZ7XfLh5cANUMYgTHAu85U/lBNfLJIpfl9qrq+cWUHMUoqp
 RYAUCYkL1Nnt8XZYod0xkqvudwMKF1TkykT8RzBnXBm8PovemVBJqGDdc
 RolweG+J75XOrrBBFwGOquT5zQvS0VGz6cIVXpUp7DdYobsEpWZ4FNOE2 Q==;
X-CSE-ConnectionGUID: dQuimAn/REaAc/9q3zY/Qg==
X-CSE-MsgGUID: QfQPtscXSneMwwNaMmhxOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83778251"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83778251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:50 -0700
X-CSE-ConnectionGUID: bFUtTy2SQGmXa69qx4v9Qw==
X-CSE-MsgGUID: +GZLirefQHKey9zg+a10og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248847841"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:48 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/6] tests/xe: Arm SR-IOV exit cleanup
Date: Tue,  2 Jun 2026 16:16:07 +0200
Message-ID: <20260602141609.3941750-5-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in xe_sriov_auto_provisioning
and xe_sriov_vram so VFs and driver autoprobe get restored on exit.
Clear handler after explicit teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 2 ++
 tests/intel/xe_sriov_vram.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 8f573d234..9b4858144 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -347,6 +347,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		total_vfs = igt_sriov_get_total_vfs(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
 	}
 
 	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
@@ -440,6 +441,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index e46416d96..8e6749393 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -354,6 +354,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
 	}
 
 	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
@@ -407,6 +408,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
 		close(pf_fd);
 	}
 }
-- 
2.43.0

