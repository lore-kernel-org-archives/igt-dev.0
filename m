Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FE5CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 14:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4865610E755;
	Wed,  5 Nov 2025 14:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0UM+Zbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBA010E757
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762351528; x=1793887528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3KPmW6+x0+iBtIAJ4pUkZl7OzaF/HwfqhwhDANeBgI=;
 b=U0UM+Zbq8+1M/U7TGrQR3tCzihYBAhiZ6/LbsMUeRwWGIBZ5sTJgycPA
 xJC4mEblkxBIKQWDYc21mqXpWw1EtL+grupwd+Z2KIm0GeEgdrOS+Z7Cg
 Znh5lm+SM0ZRw1ysjCpbzFPpJYUa78t15goIH0GqpID8wpfd1ohM1IukD
 2JmfoUsw+ikuzZuztlRXvVXipOGVTRp+88atSkc+H7udhrVk7uZHHhbXY
 nW3nHK5EhC/pOW1jn7C63Xey0Y0aKUCFs/AJiBGmk7Gt3KqxMUivLXLXY
 LW93jleJVDZplowbJJBq7Elxt0uJZuRdR2j1FzlwkaVJ3fI9eXDvvWheX g==;
X-CSE-ConnectionGUID: IRTYwutZT+OTfsb2PcXt5g==
X-CSE-MsgGUID: 9Pt+AbXJTFqwKmoyHwn8xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74758115"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="74758115"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:28 -0800
X-CSE-ConnectionGUID: yGO+ni6OSC+o7xpoDCNJHg==
X-CSE-MsgGUID: lFdlSGy3RP6dZGYDl8O+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187131333"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:05:25 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v4,
 2/2] tests/intel/gem_ctx_freq: Add null termination to sysfs
 frequency buffers
Date: Wed,  5 Nov 2025 19:30:31 +0530
Message-ID: <20251105140029.1796233-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105140029.1796233-4-sk.anirban@intel.com>
References: <20251105140029.1796233-4-sk.anirban@intel.com>
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
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/gem_ctx_freq.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
index bb890d195..6b510aca1 100644
--- a/tests/intel/gem_ctx_freq.c
+++ b/tests/intel/gem_ctx_freq.c
@@ -200,13 +200,19 @@ static void sysfs_range(int dirfd, int gt)
 static void __restore_sysfs_freq(int dirfd, int sysfs_fd, int fd)
 {
 	char buf[256];
+	int len;
 
 	igt_pm_ignore_slpc_efficient_freq(fd, dirfd, false);
 
-	if (igt_sysfs_read(sysfs_fd, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
+	len = igt_sysfs_read(sysfs_fd, "gt_RPn_freq_mhz", buf, sizeof(buf) - 1);
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

