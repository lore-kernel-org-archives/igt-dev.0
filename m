Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98405CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 11:17:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93710E3C4;
	Thu, 23 Oct 2025 11:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSLIij2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A75210E3CD
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761218222; x=1792754222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YKI9IboDaatRAnX5kd1poU/vT/3M0jkoVaIW3n4OZ/Y=;
 b=mSLIij2XYdPFACYllHin4ducG5l8LigcMmEOMKaGbDMn6j1SZqRyjNua
 8FsjXmgBhmQ+2dEzRBXDpnky8jEZonh1xJQeu1QvttsftbCQpY2tQs2E7
 /EKlVydpLTSeSsrhXaIRPvnrVXisoaiGiSOU6IuGk03AvSs2Y8eAz8aaQ
 IhSCebGPVJaDinZKUI7+LJISR4Jho6+UKKAp8KiMhuuP9HwXJg2sAl0ag
 BF8hmZtRLSqwXl5F2GbU1aV9da+p8qEgfdIzEB+77RSq9Tp5HvOzrzSCp
 /OMCyH+mfd37hRKc3WCqPfbo/oLMjkchZsx4a1giYHbM9G8wch2OXGXt1 g==;
X-CSE-ConnectionGUID: HCmBx/+ASuOoMejLW/xzxA==
X-CSE-MsgGUID: 2f9iqophScetlOv+l9VK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62593399"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="62593399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:17:02 -0700
X-CSE-ConnectionGUID: +gz8O5CJQSGS2ee5gpUiYA==
X-CSE-MsgGUID: oZQ90cFcRI+24jrDtBihYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184200174"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:17:00 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v2,
 2/2] tests/gem_ctx_freq: Add null termination to sysfs frequency
 buffers
Date: Thu, 23 Oct 2025 16:43:01 +0530
Message-ID: <20251023111258.2108907-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023111258.2108907-4-sk.anirban@intel.com>
References: <20251023111258.2108907-4-sk.anirban@intel.com>
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

Ensure buffers are properly null-terminated after reading frequency
values from sysfs to fix intermittent frequency restoration failures.

v2: Split patches (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index fef2dda2c..3584ae355 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -200,13 +200,19 @@ static void sysfs_range(int dirfd, int gt)
 static void __restore_sysfs_freq(int dirfd, int fd)
 {
 	char buf[256];
+	int len;
 
 	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
 
-	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
+	len = igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
+	}
 
-	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
+	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
 		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
 	}
@@ -231,14 +237,20 @@ static void restore_sysfs_freq(int sig)
 static void __disable_boost(int dirfd)
 {
 	char buf[256];
+	int len;
 
-	if (igt_sysfs_rps_read(dirfd, RPS_RPn_FREQ_MHZ, buf, sizeof(buf)) > 0) {
+	len = igt_sysfs_rps_read(dirfd, RPS_RPn_FREQ_MHZ, buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
 		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
 	}
 
-	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0)
+	len = igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
 		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
+	}
 }
 
 static void disable_boost(void)
-- 
2.43.0

