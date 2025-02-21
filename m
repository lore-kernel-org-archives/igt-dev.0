Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B0AC021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 22:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF7D10E0B1;
	Fri, 21 Feb 2025 22:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yvfw9Zpt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD58510E0B1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740176860; x=1771712860;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eZp3XUBU5MWYpWD/+pMYvV7bwiWZPH8MAtbaNFRXf1g=;
 b=Yvfw9Zptu9Fx0OfFoKFB+Ssn/rTnZ0kUs9A9/gVCXhWZlt/okziKFc09
 4k6dSnb1t31w/PlFtS7+XDJ4wlnnpMMZgglFUwv97IL0nyHy+Qf00wcya
 JVjYkapdkVc/SVT9sg1jHSI0iFmfKnX44GPfVUR9bvChtJdjW1WYJ8AED
 uE8/iNNcSBdkqINnn8rTTMgvQi2xcIGGAASaEzdOFYoccdVV28wBp6WcQ
 tI+rc6zORAmlp/2++a1vlPsvm0z849YgXmrJOzEi1VDzOzFKvtiui7Kvx
 +xD6zI+852/2vbCyH6kRv3wE2MuLbarK9sGxHBsNA5frF1AQhtF4pUSw2 A==;
X-CSE-ConnectionGUID: jxiV4B1rRT6xVjSFXBGTqQ==
X-CSE-MsgGUID: nHbmIGyzR3iEMUUKC1+Gfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="63481786"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="63481786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:27:40 -0800
X-CSE-ConnectionGUID: 7pEdg3PGTEec5GfAO2r/nQ==
X-CSE-MsgGUID: XSfxwsZ7S1WuwX/xlmNolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115689272"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 14:27:40 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 ashutosh.dixit@intel.com, lucas.demarchi@intel.com, adrinael@adrinael.net
Subject: [PATCH i-g-t] lib/igt_core: Add ftrace logs at test boundaries
Date: Fri, 21 Feb 2025 14:27:39 -0800
Message-Id: <20250221222739.2335825-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/igt_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b95db1b25..6d9928e36 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1324,6 +1324,7 @@ out:
 	if (!igt_only_list_subtests()) {
 		bind_fbcon(false);
 		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
+		igt_trace(KMSG_INFO "%s: executing\n", command_str);
 		print_version();
 		igt_srandom();
 
@@ -1528,6 +1529,8 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 
 	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
 		 command_str, subtest_name);
+	igt_trace(KMSG_INFO "%s: starting subtest %s\n",
+		  command_str, subtest_name);
 	_subtest_starting_message(_SUBTEST_TYPE_NORMAL, subtest_name);
 
 	_igt_log_buffer_reset();
@@ -1681,6 +1684,8 @@ __noreturn static void exit_subtest(const char *result)
 				igt_time_elapsed(thentime, &now));
 	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
 		 command_str, *subtest_name, result);
+	igt_trace(KMSG_INFO "%s: finished subtest %s, %s\n",
+		  command_str, *subtest_name, result);
 
 	igt_terminate_spins();
 
-- 
2.34.1

