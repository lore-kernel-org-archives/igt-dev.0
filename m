Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF701FD8FE1
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 17:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573F810E9DE;
	Thu, 26 Feb 2026 17:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1iiC8l6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0310E9DE
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772127114; x=1803663114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RJ0Mik40/2fzvocA37c5z2/8G3Bg8qyeZbadlQxCi+s=;
 b=H1iiC8l6fHBs4awNJroUzE3nfDnKdif18QoqUFxeanIgYmZdnNz1wh+N
 Z+jXHgPMyu4JcYv70UlLa3MY7XTKHpNmE+vZ/YMKd/4/5WBdzmj06Gpav
 DA15EJmd7ZW0I3JlTA1XU2xdHPzBr9d8lXXCo70904MmnpmCDCJ+Ui5Lb
 WqY2ZvCil8Xnb+azmz9Bo8jpdoozCuWIcK/GbT46T+jQJQ69TJw9ZOaRt
 z7wJVJTAekYLsxna+pKhEgvddNtDQWlr8qAoZNtsN8dBVDk+m/fAlGtjy
 A6AED97AR/oTukvz7xZl/cDG0UsX9yqD/xVLKH/9+7I6c3ZfFGWQB6504 g==;
X-CSE-ConnectionGUID: SrgLQSOjRNmlhaIyCADpsg==
X-CSE-MsgGUID: ZtTnNRlmS0uKUw4D7sOG5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95814103"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="95814103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:54 -0800
X-CSE-ConnectionGUID: etrP/XMvR2mFm7n6coPViQ==
X-CSE-MsgGUID: bd/cRFc7TDmBmm5BPZk5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="220765394"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.87])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:53 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lukasz.laguna@intel.com, piotr.piorkowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Add --extended for
 reset-only
Date: Thu, 26 Feb 2026 18:31:37 +0100
Message-ID: <20260226173137.3221419-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226173137.3221419-1-marcin.bernatowicz@linux.intel.com>
References: <20260226173137.3221419-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

By default only a single dynamic subtest (numvfs-1) is executed.
With --extended, additional dynamic subtests up to the total VF
are created.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel/xe_sriov_flr.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 846731697..de8fd533d 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -70,6 +70,7 @@ static const char STOP_REASON_SKIP[]  = "SKIP";
 
 static int g_wait_flr_ms = 200;
 static bool g_use_xe_vfio_pci = true;
+static bool g_extended_scope;
 
 static struct g_mmio {
 	struct xe_mmio *mmio;
@@ -1160,6 +1161,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 	long val;
 
 	switch (opt) {
+	case 'e':
+		g_extended_scope = true;
+		break;
 	case 'v':
 		g_use_xe_vfio_pci = false;
 		igt_info("xe-vfio-pci binding: disabled\n");
@@ -1180,16 +1184,18 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 static const struct option long_options[] = {
+	{ .name = "extended", .has_arg = false, .val = 'e', },
 	{ .name = "no-xe-vfio-pci", .has_arg = false, .val = 'v', },
 	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
 	{},
 };
 
 static const char help_str[] =
+	"  --extended\t\tRun extended scope\n"
 	"  --no-xe-vfio-pci\tDo not load/bind xe-vfio-pci for VFs\n"
 	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
 
-int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
+int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
@@ -1202,8 +1208,14 @@ int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Initiate FLR without any additional state checks.");
-	igt_subtest("flr-reset-only") {
-		reset_only_test(pf_fd, 1, execute_sequential_flr);
+	igt_subtest_with_dynamic("flr-reset-only") {
+		for_each_sriov_num_vfs(pf_fd, vf_num) {
+			if (!g_extended_scope && vf_num > 1)
+				break;
+
+			igt_dynamic_f("numvfs-%u", vf_num)
+				reset_only_test(pf_fd, vf_num, execute_sequential_flr);
+		}
 	}
 
 	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
-- 
2.43.0

