Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C5CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 15:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CBD113AAE;
	Tue,  2 Jun 2026 15:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZlLOAa2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FC4113AAA
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780414972; x=1811950972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x8X649ZPJFnE7rrF/zvgLCR+/SYJjcq32YKSpG3IwAk=;
 b=CZlLOAa2VS6UrPIlLjUA5pN3bE5Mn+Zji73dt8lvtg06zswSuWJl6FXk
 v7NfkUw5cVDUYyaeucUkH1CY6JJSNEkZbev2sE4eV0gdHhKDX/Qs9V8bw
 f91Y2ethsZ6Pqje+hLNp3SLNTznj/63YmEcIJGNxT650/so7COgdk9e3R
 PQlfiCuVXy8Xgdlx4HPHnEZS30/m82aJ0SYxm8CHUypvGzFAYfxOmjWME
 jPv8f3L4njAPJxZIy0qXsW4/726yMxWhyRaO7LM5KCzC8mWHlt3QaMCgf
 3VfKy4rtPFdfEWAj75oy/w9QIM3brOx9pd4MmSJ510ZYVWL1roUsaBy/M Q==;
X-CSE-ConnectionGUID: oGNKoGQNTK2R75YlUojtXw==
X-CSE-MsgGUID: totQIuzxRl2dC0BzGaykhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81200842"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81200842"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 08:42:51 -0700
X-CSE-ConnectionGUID: L3HnEpaOQkqZZmPuqBIOMg==
X-CSE-MsgGUID: 8hLx83O4QuSpKLDT7H3b0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248872438"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 08:42:51 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH] tests/intel/xe_sriov_auto_provisioning: Require total_vfs > 1
 for fair-allocation
Date: Tue,  2 Jun 2026 17:42:47 +0200
Message-ID: <20260602154247.967734-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

The fair-allocation subtest validates whether resources are fairly
divided between VFs. With only one VF, the check always passes without
validating anything. Require at least two VFs to run this subtest.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 8f573d234e..241a1bdd06 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -351,6 +351,9 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 
 	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
 	igt_subtest_with_dynamic("fair-allocation") {
+
+		igt_require(total_vfs > 1);
+
 		if (extended_scope)
 			for_each_sriov_num_vfs(pf_fd, num_vfs)
 				igt_dynamic_f("numvfs-%d", num_vfs)
-- 
2.43.0

