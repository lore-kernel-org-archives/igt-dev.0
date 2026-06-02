Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28A3CD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892A7113A55;
	Tue,  2 Jun 2026 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDhqXhBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4907113A52
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409806; x=1811945806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ms7s8ozJp/cGrDk1o/PVO+jJH/BoSEqlfTgvhAUqyEM=;
 b=aDhqXhBU4+eqQRlttF9vektD78yjnTYmM5yi/ZuhyTwvjdvkRc2DZl7V
 fOjRrAd2jiYUpFzkAXMqvc+Ty3KJ85dyCbLSTd5fYOYfMA3UDQaaoI0AW
 j8FNu3+GR7j5cbT7qBgxpr2hIneeeHl34Oza6gj7t/XTNUpbOIIv3VZvE
 OnvN7yVkuyjuYt5AkytRVaookGbI8xHKe6IK8Fab2nAS8IO4jk8hIfOQT
 yZHYlcRPMqZudwQRfIU9DsMICdhDzkbO6UGywckbUMYvzSpYZWS8sS3JX
 31eaj1DBKdN6EWBSjTdBIy4XI8mOb8RZmvn40gzjRO+pyPlXxpyxYsPvQ A==;
X-CSE-ConnectionGUID: hNTLPxB2S/GOKe3h/HoUhQ==
X-CSE-MsgGUID: sVjT2I60Qq+Xf8tAoZZTAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83778242"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83778242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:45 -0700
X-CSE-ConnectionGUID: lo3NDfGpS16Ya7o1JWDPmg==
X-CSE-MsgGUID: /h2yCCcUSG2Sgi1IEZDtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248847796"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:44 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/6] tests/sriov_basic: Arm SR-IOV exit cleanup
Date: Tue,  2 Jun 2026 16:16:06 +0200
Message-ID: <20260602141609.3941750-4-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in sriov_basic so VFs and driver autoprobe
get restored on exit. Clear handler after explicit teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 69240ab54..e551aed9f 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -129,6 +129,7 @@ int igt_main()
 		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
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

