Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF0ECCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 19:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FEA10E651;
	Tue, 28 Oct 2025 19:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROpmNvhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798610E651
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761680392; x=1793216392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Et50fgHncCDa3ISr7PgtbTFoajd/yF6dNS6T/LN89s=;
 b=ROpmNvhxOw1g9UycdOuhsDTe0Wt4Pd0iioZZqgxK2QSlXg1DJWwwh0qo
 Ows4Ijy+rDGXKFT6qHkUM6unYSJDe7TmxmRV4NjxH+1U6KLDZMGvQ7UAD
 i4sBGpeV47TfzDyzVj+0VYNTQWIwCNJX18rL9cg5uxh5UAU8x0mheajo+
 c8Fi7rBHFpTnPwi60gW55R5NIzV6oM0FonEs9DLOLsdhm7x07y1ow+bIU
 qK4xMU9SIN51gQi/s+051m1gHMNOZcWa2uWcfwGy/cNtrN5N5R0iL+A4U
 ygUlGprEf6I6TTLfIfrbjNHzW/xJyE1yHUf3zY33ofn9QyMlmGHs97qI4 g==;
X-CSE-ConnectionGUID: 9yd8qLrHRZGfUbhHpaZXjg==
X-CSE-MsgGUID: EDM/8pXzSj6uUwdcv2OT5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63700423"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63700423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:52 -0700
X-CSE-ConnectionGUID: YcZL8IvOSsSMlp+/5o4OKQ==
X-CSE-MsgGUID: 8SVoqtPHSoCnV0AZsfl6YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185079885"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:39:49 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 2/2] tests/intel/gem_ctx_freq: Add null termination to sysfs
 frequency buffers
Date: Wed, 29 Oct 2025 01:05:22 +0530
Message-ID: <20251028193519.3273563-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028193519.3273563-4-sk.anirban@intel.com>
References: <20251028193519.3273563-4-sk.anirban@intel.com>
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
v3: Fix subject line (Kamil)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/gem_ctx_freq.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index ea6ba9ad9..0bac97761 100644
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
@@ -230,14 +236,20 @@ static void restore_sysfs_freq(int sig)
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

