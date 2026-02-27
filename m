Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DB9FEFB5D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 15:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6CD10EBC0;
	Fri, 27 Feb 2026 15:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKBbSYmi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033E10EBC0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 15:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772206070; x=1803742070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ruQIrURtK2uwqj9F3SUEUjxQoGmGj8lquPd36EFKcnM=;
 b=EKBbSYmi4QqlaCY14ulDeceW8M8V9HbB2/d4/AkmFpV7IBRPfqaeL8o7
 gL3Qyvz7eaMRhnOL3xTU7g8BLcbGsT3H8/4gwC+ONclcEZlB7ID+qcAY7
 mFEogfGSEXswqU31Y7GMujEGsusytyZ/wac5VinEFPhgd7eF1RYnZxSYB
 ZpJwQqZIi86Oz57kkDdqP1reT6rpaZ57/W5RUPJNhG4E8K+0IK67huSFb
 PzHBalW5NXrH2fOW0HNaEzHcMc2WOgkIe/djsjgW/U3/Q4zv8lwK/gxnP
 ubTeSpT7qdk1nZ72SexTXhv+t/gfEBhzdgz4Ri5HWzM2wgzWJc6FYODgq w==;
X-CSE-ConnectionGUID: uyaPmWndRLiF1Y7WQGRjSA==
X-CSE-MsgGUID: FzsrbaidSfy5KWTGGSylIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95909473"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="95909473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:50 -0800
X-CSE-ConnectionGUID: 1wkzWHtbR9agTB++HamYng==
X-CSE-MsgGUID: nbu7tNXnSnu5O3Hx9KR3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214766124"
Received: from pdudkiew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.25.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:48 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lukasz.laguna@intel.com, piotr.piorkowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/intel/xe_sriov_flr: Add --extended for
 flr-basic
Date: Fri, 27 Feb 2026 16:27:34 +0100
Message-ID: <20260227152734.256604-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
References: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
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
index 2080f4e85..be949fe01 100644
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
-	igt_subtest("flr-basic") {
-		reset_only_test(pf_fd, 1, execute_sequential_flr);
+	igt_subtest_with_dynamic("flr-basic") {
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

