Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958C7CA9ED0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 04:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D15510E6F5;
	Tue, 13 Oct 2026 04:24:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F7710E6F5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 04:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791865415; x=1823401415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCwTbde9D9z9szh3A9jG4FPMKg6LVfD8PcL3bvmXzrc=;
 b=N1DwU/vaUh5x5aMyAR2HltU2dj08RGh13rf1mYTvBI3DdMztOdpjOALY
 3SPd1djLHKb7aNZ5xjNepPiyzKCFOV7c02QXnjMl1DQfILiiSh8AbQdFj
 6jriGsAloce8dPMblIwewBXLo7fNWNwf6Ic2sJmASHWn0ZRemvVeDt8P+
 odjq0FDebul7K15m/ZhPi800021L4STe61dxBSsf911OVVhZfklsmbpdK
 gTJuRTUYZgXUI0cGkjzDd9BhLC+I0LTprMifkdq7cY2LMwWF+p+FomAwB
 OeO9pKxPbcLt22Jq75ZkQF0q+XXT84qOyptW9W0iMVmLEcSkhRUvL0mVP g==;
X-CSE-ConnectionGUID: AJlTUDvxTVyEc6lqdREeWQ==
X-CSE-MsgGUID: +WVw17IrT+qiUqUFcML7Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="478033"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="478033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:23:34 -0700
X-CSE-ConnectionGUID: fv5eNcUNQOe3MNVwsaj7xg==
X-CSE-MsgGUID: aDEtONr/SGGqfeEEPuBpiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1178113"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2026 21:23:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, ramanaidu.naladala@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_vrr: Let the pipe go idle before reading
 the DC3CO counter
Date: Tue, 13 Oct 2026 09:52:56 +0530
Message-Id: <20261013042255.803521-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012093308.731774-1-suraj.kandpal@intel.com>
References: <20261012093308.731774-1-suraj.kandpal@intel.com>
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

Every atomic commit holds DC_OFF until a frame after the flip, so with
flips arriving every ~33ms DC3CO never gets a chance to be entered and
the counter stays flat for the whole measurement window.

Flip first to confirm LOBF comes up and stays up, then sample the
counter across a second of an idle pipe instead.

Fixes: a65cce526 ("tests/kms_vrr: Add new test for DC3CO validation with LOBF")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Move the dc3c0 count collection (Ramanaidu)

 tests/kms_vrr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d83adea74..8058a138d 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -106,6 +106,8 @@
  */
 #define TEST_DURATION_NS (5000000000ull)
 
+#define LOBF_IDLE_DURATION_NS (1000000000ull)
+
 enum {
 	TEST_BASIC = 1 << 0,
 	TEST_DPMS = 1 << 1,
@@ -1177,6 +1179,8 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
 	unsigned long dc3co_count_before, dc3co_count_after;
 	uint64_t rate[] = {0};
 
+	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
+						 IGT_INTEL_CHECK_DC3CO);
 	/*
 	 * Bring LOBF up first. Sampling the counter around the whole of
 	 * __test_lobf() would count the modeset and the content rate sweep,
@@ -1185,12 +1189,11 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
 	 */
 	rate[0] = __test_lobf(data, crtc, output, flags);
 
-	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
-						 IGT_INTEL_CHECK_DC3CO);
-
 	/* Keep flipping at the rate that enabled LOBF and count from there. */
 	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 
+	usleep(LOBF_IDLE_DURATION_NS / 1000);
+
 	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
 						IGT_INTEL_CHECK_DC3CO);
 
-- 
2.34.1

