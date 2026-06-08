Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29562CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 19:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C230110F90F;
	Mon,  8 Jun 2026 19:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rfs3Dn1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AC110F90F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946962; x=1812482962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aYrQM3yQ6OtsXuzJhox+7uUu7Os4AcFWr75Ca/u/Ouk=;
 b=Rfs3Dn1NWo/oT/hsLbOqqMP/KhYln5wPjO+GYZdTTpynHv7yade+PpgX
 pnIGMVgVafItQZVhbPrRzeQbV/0kC2i7rzMnEeVlFDnT/lm8xGdPDNa+J
 2P2jwdZQ1stcmjxzukEcom3Qa3gg30bOoKsbgpfrHJW0XV3668qGCLfzw
 OsalFtPK6AOCY3MFWu4mYXZX+rPMKUhX0+aSWt/DraZkSQuv5bcZBZDcQ
 jrOP8EynUmiUgsRaIz0S/TbgMo/gNIhPhZnRrwTfsvJ9HMJlvVoqV0nxS
 gmhWI5tKLngpkvV0lMM2NNV3JInwatARjlBOoRZEnbWIOwoMgLScMs9zi A==;
X-CSE-ConnectionGUID: fLQJfUI0RVCyBpHf1EFVQw==
X-CSE-MsgGUID: 1Uls+SOUQmuqu0e8oE+nAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81760620"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81760620"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:29:21 -0700
X-CSE-ConnectionGUID: a6ciFUMHSQmBhvzi2ShjSw==
X-CSE-MsgGUID: Lbyziv1VRhe8/AvgY3VZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="250741382"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 12:29:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in finished
 messages
Date: Tue,  9 Jun 2026 01:08:07 +0530
Message-Id: <20260608193807.2616777-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The exit_subtest() function always printed 'finished subtest' in kmsg
and trace output regardless of whether it was a regular subtest or a
dynamic subtest finishing. The 'starting' messages already correctly
distinguish between the two ('starting subtest' vs 'starting dynamic
subtest').

Fix the 'finished' messages to print 'finished dynamic subtest' for
dynamic subtests, matching the starting message convention. This makes
syslog parsing and test hang detection more accurate.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index dc3ac5304..a0d9c9d7d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
 				*subtest_name,
 				result,
 				igt_time_elapsed(thentime, &now));
-	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
-		 command_str, *subtest_name, result);
-	igt_trace("%s: finished subtest %s, %s\n",
-		  command_str, *subtest_name, result);
+	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
+		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
+		 *subtest_name, result);
+	igt_trace("%s: finished %s %s, %s\n",
+		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
+		  *subtest_name, result);
 
 	igt_terminate_spins();
 
-- 
2.25.1

