Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33FEC3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817A510EA8F;
	Thu, 11 Jul 2024 13:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr/ym9Xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C3610EA8F
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720706358; x=1752242358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJDBeWH4myIz9ExKwMR7C5fb2ZgGm08+AOuUKeRpjYc=;
 b=Qr/ym9XkjB5/33zL1zIJ7jk6K36J8xoiJIhhfAAb1iFkiaIlUW1+ml3q
 0D9U74bmmiEQ1d2ID4VwyfHOvOZdKMGO8ogUxSy/Ag6kLi6TE5quzdLoU
 j2ENd68GV2lHdMbYACvLgVzD5WdzMgXfu2wUeD6LtTaHTI7zmNj9WZXia
 QUr4VQTAB0hqPQFfcRRYCQo6xQbX66EPpfbu8C8JTuZMfj9L8XJPGGTwb
 +ftW2HoZk5PPi9tsV65Uk2axwpr0c9go7gz6v1m01ceeqtsFPXz9R6Uf8
 pIqgGZfmh6cw89olX4ia+JcFaFmVub8vMLXde1TVhWY2wH2KDveTN9BbO w==;
X-CSE-ConnectionGUID: e0YLYLGRQvaCObM8uwM9cQ==
X-CSE-MsgGUID: YxdeAYauRDyxoB9MAH/17w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18222384"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18222384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:18 -0700
X-CSE-ConnectionGUID: sLFZkUw+RHmFHZccC+ZKJQ==
X-CSE-MsgGUID: d/3DYAytSSeMF61+yhab/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53389469"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:15 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/sriov_basic: Extract
 enable-vfs-bind-unbind-each-numvfs-all subtest
Date: Thu, 11 Jul 2024 15:58:58 +0200
Message-Id: <20240711135858.975304-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
References: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
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
 tests/sriov_basic.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 95a462709..eff93ef7a 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -62,7 +62,13 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
 /**
  * SUBTEST: enable-vfs-bind-unbind-each
  * Description:
- *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
+ *   Verify VFs enabling with binding and unbinding the driver one by one to each of them.
+ *   Version includes dynamic subtests that allow specifying the number of enabled VFs as numvfs-N.
+ *
+ * SUBTEST: enable-vfs-bind-unbind-each-numvfs-all
+ * Description:
+ *   Verify the enabling of all VFs and the sequential binding and unbinding of the driver
+ *   to each one.
  */
 static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
 {
@@ -176,10 +182,12 @@ igt_main
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

