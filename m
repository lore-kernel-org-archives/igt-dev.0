Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F1ACD98CE
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 05:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4887610E80F;
	Tue, 16 Jun 2026 05:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbf4MWWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0A710E579
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 05:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781586839; x=1813122839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4xHchjycmO00gzPURHaKxbQgA0LSP81TRYbAQ5RIbE=;
 b=bbf4MWWUA8BqT2pMtOaNu15wPRge2IfiKlYhwiFaEikI1y/cyRMZlzBZ
 BXXN3RBuQGrm1c8LVFOGKKo1OiLg6WZGuDVejP8bsMBGkNKlk1LvPu6TH
 NtT6ZvGr8OhCnlCCPqmyfFFisCTloman5bTeAmLp/pvV+8lx0Ng9cRs78
 dFdnW5+UNejIFuB0yYRm9Z5C9xU1zNvTCCyudrYxJpbfA+aeyyFDJpOYu
 7A3PTbvymWh6k+y54jIDSRBZ4jG8UJFcme88mb31uxOchb+hpJdBnN0Z+
 SOj7OVMAIjB2jwSbbjV8uSbo9nD1Q3AbC10TtKcn9XnZ8KUN8XitWKfCD w==;
X-CSE-ConnectionGUID: 0baMawPCSlG/dJlGPUJ8aw==
X-CSE-MsgGUID: 4RDd/HLqQlmWsPrFir/Z2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82536825"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82536825"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:59 -0700
X-CSE-ConnectionGUID: s821r25uRBamFRwb7Espkw==
X-CSE-MsgGUID: GQz8WWB9Qiy3Cxnp2pHq2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="243294079"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:59 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_debugfs: Add checks for existing
 root dir entries
Date: Tue, 16 Jun 2026 05:13:46 +0000
Message-ID: <20260616051348.610849-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260616051348.610849-1-sobin.thomas@intel.com>
References: <20260616051348.610849-1-sobin.thomas@intel.com>
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

Add non-empty validation for existing root-dir debugfs entries

Validate:
- clients: entry is non empty
- gtt_mm: entry is non empty
- info: entry is non empty
- name: entry is non empty

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index d7a204a09..3697d481d 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -401,14 +401,14 @@ out:
 static void test_root_dir(struct xe_device *xe_dev)
 {
 	const struct check_entry expected_files[] = {
-		{ "clients", O_RDONLY },
+		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
 		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "forcewake_all", O_WRONLY },
 		{ "gem_names", O_RDONLY },
 		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
-		{ "gtt_mm", O_RDONLY },
-		{ "info", O_RDONLY },
-		{ "name", O_RDONLY },
+		{ "gtt_mm", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
 		{ "poor_man_system_atomic_support", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
-- 
2.52.0

