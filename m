Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C49EC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA94B10E502;
	Tue, 30 Jul 2024 11:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ht8U3zie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBE110E502
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722339477; x=1753875477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gZ5XwME2HWh5sr9cF+FNOSeuofPRJKYZmI3PSpYxwEQ=;
 b=ht8U3ziewxR8QQfEm1MX2pHyxydEh810oeMSvdULc/uCxO176He36TCj
 TMHngyUd27bqjLkvIJ5UEkjKYzaPeO5nIMGn2I3dDpiW8e7D6hjp+Obys
 BlpgY+xRCZajjxFWpAQ+oGGvORBYq+TSijr24Z0vyz2R6dtqc7nbbhv8s
 On3avLSxlMbuyrmHI/96KM8h7fw/aGzN58nrh+rOAJp/3QjZ5X7Nj+oGd
 /aqUv7ETnoXqCJA9xCR6XangItRZqJ4VyuX0xefNe3Tz67Rmt8ObLiSAw
 Mn7t3fHpJiv2ZBf3nhuZcC58l2/8wHx1eVXSjZZyvsMLgBXpjP/YneQ1O w==;
X-CSE-ConnectionGUID: 7WSajwGOSCe9Y7eWgNdmJA==
X-CSE-MsgGUID: 2WU8eV1gRmGifIydCmoV7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12786664"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="12786664"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:37:56 -0700
X-CSE-ConnectionGUID: OvupC2h8RtGItSC08vJaNw==
X-CSE-MsgGUID: THUj8jaWQo6tjw986Coi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="84957872"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:37:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_gt_freq: Add a wait after gt reset
Date: Tue, 30 Jul 2024 17:20:58 +0530
Message-Id: <20240730115058.1104767-1-karthik.poosa@intel.com>
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

After reset min and max takes sometime to get set to rpn.
So add a wait of 100ms after gt reset before reading
min and max frequencies.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 93ebb5ed0..718f720c0 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -33,6 +33,12 @@
  */
 #define ACT_FREQ_LATENCY_US 100000
 
+/*
+ * After gt reset, min and max freq may take sometime to set to rpn.
+ * So adding a wait of 100ms after reset.
+ */
+#define GT_RESET_FREQ_LATENCY_US 100000
+
 static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
@@ -318,6 +324,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 			     "Failed after %d good cycles\n", i);
 
 		xe_force_gt_reset_async(fd, gt_id);
+		usleep(GT_RESET_FREQ_LATENCY_US);
 
 		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
-- 
2.25.1

