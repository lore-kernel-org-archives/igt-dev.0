Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4613DCD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E274610E33C;
	Mon, 15 Jun 2026 10:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQ8mTG5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2467810E355
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519559; x=1813055559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WCGXEo2gK1GKmHZTiBd7dskiLIbftiz6wvtlyfGeS4Y=;
 b=TQ8mTG5Z9gAbk8IFJNatYBAxMnqGkPVUfwbxtl8C5hKm7ARZlodtkI8w
 bHK8es8/bCWNIgUCQYDgLDpy7jT5M5tYcpdBPyQDL5OiC4HgCEU3LSoTh
 R8NqV5A5tTtgMxutUPsfZznsuusWd82aTzlPjT0xeV98qmBHwGPpxX687
 MMljvMOfRVwi7yshZ2lmx4M6ocBodUxRM2HNhcOK1P4pRYTWNFAFu7s0k
 4EWnfZNkNj83OU+N9Lrq9PgGbtDNAqFHsujgHcFxgd/LJD3PYS+uDl7B5
 75izH8Drmi3u3nJAPIZAndptFr5obkisW+xhI4heoWTU+7AaiV0IaoR/p Q==;
X-CSE-ConnectionGUID: D2/b/XfCTCO8rWJCSSFv4w==
X-CSE-MsgGUID: 3WTCWY+fQCOcZK4CsVi8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93747691"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93747691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:39 -0700
X-CSE-ConnectionGUID: 9HB20zZgSASJ2QD3gTCTbA==
X-CSE-MsgGUID: oETFE5oYSeuiB+9Fk4MZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="241082778"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:37 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 3/6] tests/sriov_basic: Arm SR-IOV exit cleanup
Date: Mon, 15 Jun 2026 12:32:17 +0200
Message-ID: <20260615103220.281656-4-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in sriov_basic so VFs and driver autoprobe
get restored on exit. Clear handler after explicit teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 69240ab54..1e563cee9 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -129,6 +129,7 @@ int igt_main()
 		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
 	}
 
 	igt_describe("Verify VFs enabling without probing VF driver");
@@ -217,6 +218,7 @@ int igt_main()
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
 		close(pf_fd);
 	}
 }
-- 
2.43.0

