Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBA7C531CC
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 20:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F5110E0A4;
	Thu, 19 Feb 2026 20:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atY/Z1l9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6DA10E0A4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771532945; x=1803068945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m3YpcmkR51UjUg2/61RPk6mg6uhJ1+WZaw6udj5WDxE=;
 b=atY/Z1l9n47Tn9bnhtHoqyesVELucBmjc+QOSQ9fMbR99YF2/tVLS8h0
 zsvlZfo/usUFqxnoctUf0+NRfYfz/Rk/gER1szyTDXwb2sOHWy6lJtiy3
 5mhnNfPd/lPRPZBPTY2TGIB+CkGdHZuAKMrx7pKq2zlfZ++uhcEhLPqKo
 NmnOHryYAnihOANjiP0EZQtyV3kRfl7Or46mZV2+NfG4vkRI8fBxvnxb5
 BhC8YWJlVRNemAfGXEU7vVtoEhT0RnYjPSO8/xiYfEyTbzc+iiZy6J7c+
 O7/QOzu3bBm0F4RkjAu/0p4++GtIykzdpGCMoft/Rq1IKg5ijvVJMrZop Q==;
X-CSE-ConnectionGUID: m7KFiCvhR528e46MB+zqUQ==
X-CSE-MsgGUID: LKTIzUBxSl+Cw7TmYhehsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72334181"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72334181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:29:05 -0800
X-CSE-ConnectionGUID: JV39yPaRTiiJehgoj5ncWg==
X-CSE-MsgGUID: 1kg9xAmFQJ6VC4PKf2HyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212836656"
Received: from espano-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:29:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Fix reading ctx_restore_%s_bb
 files
Date: Thu, 19 Feb 2026 21:28:30 +0100
Message-ID: <20260219202830.4514-1-michal.wajdeczko@intel.com>
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

Currently, all ctx_restore_%s_bb files are zero-terminated (due
to a xe driver bug) thus we didn't notice that the test is not
clearing or terminating the buffer used to read the file.

Use igt_debugfs_simple_read() helper that correctly terminates
the buffer so we don't fail once the xe driver is fixed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_configfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 0db4af2018ee..c99c35c90055 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -245,8 +245,8 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		igt_info("Test %s\n", v->test);
 		igt_debug("bb '%s'\n", v->in);
 		igt_assert(!igt_sysfs_set(configfs_device_fd, file, v->in));
-		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
-					  sizeof(buf) - 1));
+		igt_assert(igt_debugfs_simple_read(configfs_device_fd, file, buf,
+						   sizeof(buf)));
 		if (strcmp(buf, "")) {
 			igt_debug("Expecting empty bb, but found '%s'\n", buf);
 			igt_fail(IGT_EXIT_FAILURE);
@@ -323,8 +323,8 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 		igt_debug("bb '%s'\n", v->in);
 		igt_assert(igt_sysfs_set(configfs_device_fd, file, v->in));
 
-		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
-					  sizeof(buf) - 1));
+		igt_assert(igt_debugfs_simple_read(configfs_device_fd, file, buf,
+						   sizeof(buf)));
 		if (strcmp(v->out, buf)) {
 			igt_debug("Expecting '%s' but found '%s'\n", v->out, buf);
 			igt_fail(IGT_EXIT_FAILURE);
-- 
2.47.1

