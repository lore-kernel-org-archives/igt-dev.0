Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77703C3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 15:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322810E822;
	Wed, 10 Jul 2024 15:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3wkmxIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62B510E822
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720625104; x=1752161104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qN5LFDoaHgyQYFO2XLrdRKixEjrAXkKQRxlYggvpC+U=;
 b=b3wkmxIpAqhlcr0c8VYTnsygKwI4JPZjRNJICKkr3g3mGjQfrADrMUSW
 btMk2ykgqecfTBgSgHPZ9u8GeEtUcLW92guaU1gqj3fmx4EPIQNnUqSiQ
 j3P00m/X1ziNlReKmk0mBt17W7+M/C1p6K4eM0VOO6u0OAAAKzmc3+7Pp
 SptzLWBTb9k6plW9usubM0ngmqhk2NMzG7Ut8CvRMDjG7hitHE9rVdlkb
 CblVYNv0qDUNuoZm/tejdX3l7w01hgec/fQS7M4qs9ywnnF0yj4yeT6az
 bXgAQ0c3aDlxkQjdH3T4B2odZBpWeZfJRcUU8N37ptDz7zGOC2Bdv9zEP A==;
X-CSE-ConnectionGUID: sxeMOLA0Tq6wkJ0Q/5CEjg==
X-CSE-MsgGUID: udnhoEUJQpyhcNyvNrG6dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28544909"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28544909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:25:04 -0700
X-CSE-ConnectionGUID: RmAN2QFfSU6UFRco6wHfIQ==
X-CSE-MsgGUID: 6UN96vFRTCWx+EpN5EljYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="71468011"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 08:25:02 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t 2/2] tests/sriov_basic: Extract
 enable-vfs-bind-unbind-each-numvfs-all subtest
Date: Wed, 10 Jul 2024 17:24:46 +0200
Message-Id: <20240710152446.827476-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
References: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
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

Extract the 'enable-vfs-bind-unbind-each-numvfs-all' subtest to
simplify blocklist management. Currently, there is no straightforward
method to block dynamic subsubtests, and running all of them becomes
too time-consuming.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/sriov_basic.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 95a462709..36bca4149 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -62,7 +62,12 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
 /**
  * SUBTEST: enable-vfs-bind-unbind-each
  * Description:
- *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
+ *   Verify VFs enabling with binding and unbinding the driver one by one to each of them.
+ *   Version includes dynamic subtests that allow specifying the number of enabled VFs as numvfs-N.
+ *
+ * SUBTEST: enable-vfs-bind-unbind-each-numvfs-all
+ * Description:
+ *   Verify the enabling of all VFs and the sequential binding and unbinding of the driver to each one.
  */
 static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
 {
@@ -176,10 +181,12 @@ igt_main
 				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
 			}
 		}
+	}
+
+	igt_describe("Verify the enabling of all VFs and the sequential binding and unbinding of the driver to each one");
+	igt_subtest("enable-vfs-bind-unbind-each-numvfs-all") {
 		for_max_sriov_num_vfs(pf_fd, num_vfs) {
-			igt_dynamic_f("numvfs-all") {
-				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
-			}
+			enable_vfs_bind_unbind_each(pf_fd, num_vfs);
 		}
 	}
 
-- 
2.31.1

