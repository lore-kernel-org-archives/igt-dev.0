Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F88C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 22:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6510E0B1;
	Fri, 21 Feb 2025 22:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLOwRi6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4837910E0B1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 22:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740177502; x=1771713502;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GnsQM5o5edZbLoBfBdY6+D4G1sh4DyFzostN81L0eYk=;
 b=lLOwRi6v27VnXk4V/TIpSq9g3WWTGrcRaNP4ZGFdoiYkIjiw+OUvXPjw
 4F0l/e1fpW7kLm6ETVU0D7XRENVReYNgfQw8DfIiDq+GDvcUMw/Y8cjva
 dVA/jSFDJf7okF6imgeqv6T9BJ45Bkztopt2VsQtuoYqc9w79r7K1Sk8f
 DPX0nvEoiYTdjui8WXIKGFevlYX9/N4I//qWJ7z/VUmDy1mfMWL+kFLMu
 u5vO2vYl6cXlksUxImbZ3/eE0bkPOg7oLce90QAlvIbI2/JZqYN0729zR
 GhEeP8hIK5q0iDwy0iIT1e9CCRGi5lxSMGSZF4wWjqRBypq+mv6W8ZoJ+ w==;
X-CSE-ConnectionGUID: 9KWcUbP2QHukupWwXjFKWg==
X-CSE-MsgGUID: Lhu37vXWSv6PYE58e2WSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51635622"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="51635622"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:38:22 -0800
X-CSE-ConnectionGUID: RsI20279QZysAsb5WV27rA==
X-CSE-MsgGUID: UcvZUR0IT92F42aaX4hXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116413943"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:38:22 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 ashutosh.dixit@intel.com, lucas.demarchi@intel.com, adrinael@adrinael.net
Subject: [PATCH i-g-t v2] lib/igt_core: Add ftrace logs at test boundaries
Date: Fri, 21 Feb 2025 14:38:23 -0800
Message-Id: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

When looking at kernel ftrace output, it would really help to see the
test start/exit boundaries.

v2: Fix copy paste error

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/igt_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b95db1b25..9702a9417 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1324,6 +1324,7 @@ out:
 	if (!igt_only_list_subtests()) {
 		bind_fbcon(false);
 		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
+		igt_trace("%s: executing\n", command_str);
 		print_version();
 		igt_srandom();
 
@@ -1528,6 +1529,7 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 
 	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
 		 command_str, subtest_name);
+	igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
 	_subtest_starting_message(_SUBTEST_TYPE_NORMAL, subtest_name);
 
 	_igt_log_buffer_reset();
@@ -1681,6 +1683,8 @@ __noreturn static void exit_subtest(const char *result)
 				igt_time_elapsed(thentime, &now));
 	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
 		 command_str, *subtest_name, result);
+	igt_trace("%s: finished subtest %s, %s\n",
+		  command_str, *subtest_name, result);
 
 	igt_terminate_spins();
 
-- 
2.34.1

