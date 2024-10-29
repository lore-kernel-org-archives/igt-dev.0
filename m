Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2960D74942
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 21:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9110E3B1;
	Tue, 29 Oct 2024 21:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwEhsmIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43D110E3B6
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730237783; x=1761773783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmP9W2C/tqhWMX8dh8MadpikDK8nFYpUmgo90CWuOPc=;
 b=gwEhsmITydgSj7mvsfTXUzFUSRkFoZLOSoSh8AfQdvoa0bY5/XlVBLG4
 dpaYKku9uPf2S56OLXc3yNRCPzGJLvdyiUoH1sCd43FlLe9DEKt5dNYOj
 9vsu81s1Moa6ppJlgDi56MonD4BsiD5ha0nmga4/AagfcMLzobryywwZv
 1evb5LFfpvHSiUrarxRGpOuUwyBPf28SEB9OeaTR8MdVNOYt/CzxwQryk
 gq6LdYUiaCiUirjQxZ+455v/6uFk+NfTaYvvz5ETO+lDU6B4Yxb5M5OYF
 ekKaZANJ3Y4T7RstTLY1+KeqsFJpg6VIyS4VmHC2Rdj5H2Mc/a3aLrSoW w==;
X-CSE-ConnectionGUID: yF6GhkixTd+A6B2h8DBzoA==
X-CSE-MsgGUID: 4bfZdhbzQiC6Zi5vD9P/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47391381"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="47391381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:36:23 -0700
X-CSE-ConnectionGUID: r2Mo355KQnCGCBaTnCE3pw==
X-CSE-MsgGUID: 60iaKWVXRquUMbvy+Hdyhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="112905051"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:36:22 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Date: Tue, 29 Oct 2024 21:36:21 +0000
Message-ID: <20241029213621.170938-1-jonathan.cavitt@intel.com>
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

The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
and timeslice_duration_us values.  However, while the test does restore
the timeslice_duration_us value at the end of execution, it does not do
the same for preempt_timeout_us.  Because the value is not properly
restored, future tests can end up using the unexpected preempt timeout
value and thus have unexpected behavior.

Save and restore the preempt_timeout_us value during the test.

This fix does not apply to xe_sysfs_preempt_timeout because only the
preempt_timeout_us is modified during those tests, and the value is
correcty restored before the tests end.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_sysfs_timeslice_duration.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index cf95a3ac1c..6912f166b4 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
 {
 	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
-	unsigned int saved;
+	unsigned int saved, old_pt;
 	uint64_t elapsed;
 	uint64_t epsilon;
 
+	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
 	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
 	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
 	igt_debug("Initial %s:%u\n", property[0], saved);
@@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	}
 
 	set_timeslice_duration(engine, saved);
+	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
+	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
+	igt_assert_eq(saved, old_pt);
 }
 
 igt_main
-- 
2.43.0

