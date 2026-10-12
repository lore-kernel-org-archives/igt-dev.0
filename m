Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C7CA9ED0
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 09:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CE710E8BF;
	Mon, 12 Oct 2026 09:34:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657E010E8BF
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 09:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791797605; x=1823333605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D7CKf7BUe9hv+PMfswDsWwDZuoY1tEXPQpIfiWRVmN4=;
 b=FzXN5YN2c5aT/3pjj1Ku+SuwOzCFOGXpIzky/u38Ca9Vm9lNx7jE0V44
 1wsVS20e+J8byWG72HLW9/MvSd5rXp/nkBzx8GW05LId29cu6xN6phUjq
 QOlP12WvB2gV19acB8kLN12waTwRJ8kltcLkFZzuMQ/UjYyqk6M5JjorG
 VehmAsEPZ2wTAMLcnmx4SpCF6wDVG9yXs1w0A9HGQ7qiB21LXjMnimjpm
 yob1lIbOdbAcgz/GGVPE0rLfILbRAAsov55VY9zrgwzG2ReEscOYG3Kek
 c4OGLguOzps1bICHGq4pHQh3XI5OFbXQjdvWN7pEta2LFgDT7yyRx16vx Q==;
X-CSE-ConnectionGUID: AwFm+IJnQFCrnCzGG5eicQ==
X-CSE-MsgGUID: HkTMaqUvRgqApeM8izYUQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="491049"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="491049"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:33:11 -0700
X-CSE-ConnectionGUID: +dIphDYbSli/q3z0GETgeQ==
X-CSE-MsgGUID: 4ZTVdli9RxCXeb2Ie7CPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1156041"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 12 Oct 2026 02:33:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, ramanaidu.naladala@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Let the pipe go idle before reading the
 DC3CO counter
Date: Mon, 12 Oct 2026 15:03:08 +0530
Message-Id: <20261012093308.731774-1-suraj.kandpal@intel.com>
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

Every atomic commit holds DC_OFF until a frame after the flip, so with
flips arriving every ~33ms DC3CO never gets a chance to be entered and
the counter stays flat for the whole measurement window.

Flip first to confirm LOBF comes up and stays up, then sample the
counter across a second of an idle pipe instead.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_vrr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d83adea74..1a3e18740 100644
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
@@ -1185,11 +1187,13 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
 	 */
 	rate[0] = __test_lobf(data, crtc, output, flags);
 
+	/* Keep flipping at the rate that enabled LOBF and count from there. */
+	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
+
 	dc3co_count_before = igt_read_dc_counter(data->debugfs_fd,
 						 IGT_INTEL_CHECK_DC3CO);
 
-	/* Keep flipping at the rate that enabled LOBF and count from there. */
-	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
+	usleep(LOBF_IDLE_DURATION_NS / 1000);
 
 	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
 						IGT_INTEL_CHECK_DC3CO);
-- 
2.34.1

