Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2A6CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F2310E355;
	Mon, 15 Jun 2026 10:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBUfYGfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2310E34F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519563; x=1813055563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vemEaPqdIzk3oP4uXNgWQlPLsfz692SyGbN0r7RSaGw=;
 b=IBUfYGfPhCIKVJNoP6nVaNS5jDM8y0g3otCUcxx1jLTR36lc4/sNWVnn
 itWK/D6skpzcuA5O5lpdIQYmV6CBvdoZLKJwQJTOFFzTQql3G7kmA8brs
 RJs89hdUsfZ1+qAMkI5CTFcJr1PrptDif4/nfc4oaUJTPfZ5wYwe7hANK
 cgChQb+CtflVy810/vJMXY6NosQRVZWub35FVxWDbg9Y4QbWQjI50r6kt
 kQVHts5wFnExyZwbDJKLIKs3LrcyTbzW+M8UH+oapxqNPnVh0U7lmKn0D
 96ikn3qzOlIuZSNFl40f0NYW8NFZXRNW4dHczuM9oE1RfMr0eQGXR7STR A==;
X-CSE-ConnectionGUID: qJ9dowrCS8acfQ0LLznJCA==
X-CSE-MsgGUID: PyRTeh6XRxykoVqHxnWSSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93747697"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93747697"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:43 -0700
X-CSE-ConnectionGUID: 3fzZwNTAQH6UdiO+weL1yw==
X-CSE-MsgGUID: CImC3brzRDqeRpQg8EfK3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="241082796"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:41 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 4/6] tests/xe: Arm SR-IOV exit cleanup
Date: Mon, 15 Jun 2026 12:32:18 +0200
Message-ID: <20260615103220.281656-5-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in xe_sriov_auto_provisioning
and xe_sriov_vram so VFs and driver autoprobe get restored on exit.
Clear handler after explicit teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 2 ++
 tests/intel/xe_sriov_vram.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 241a1bdd0..d0e0bcd21 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -347,6 +347,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		total_vfs = igt_sriov_get_total_vfs(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
 	}
 
 	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
@@ -443,6 +444,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
 		drm_close_driver(pf_fd);
 	}
 }
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index e46416d96..4d80ab700 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -354,6 +354,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
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

