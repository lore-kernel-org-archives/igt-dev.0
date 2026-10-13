Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF36ACA9ED0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 04:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CF010E6F5;
	Tue, 13 Oct 2026 04:33:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A01D10E6F5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 04:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791865961; x=1823401961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NrAOzuG7axkK2ttnTWj6GZMWdlgRBbozT9CNOqCW8o=;
 b=Xq6wBQySirtiIydX9/vV+vcJp0whQNuKLil/KvqDT4VX+KRZ+kBjaGd0
 /p4gBQZ6s8YrfJcOhsFnsa5kHlEZ9+cwxkiMEs+NRLduujNh49WvLEqkq
 Av3YZbqtHl/UyZ80RJfmBu70X22sVzzPCpqjlDHcV3IS1pR7uFvfU8WTK
 FbcKTs+Ji9P+nuPi96vIMGA7uXX/0zhAd2STQ+mATLjBikTnfR0dy0Zx4
 3xmzZGdxSi8Cb3ZmWKyYRVsxgnkeJEZ70O2SU9VzX+gYGAlBPmrZSl6WP
 2ZwvujjbUSeCXTufjtVdUfXMHH9AkIaL/gVxsdLY9CyCsZcnjv6ItBj/Q A==;
X-CSE-ConnectionGUID: KFRLcGC8QJKwjP/qfA6Iyw==
X-CSE-MsgGUID: Q2J5R9yZRgGhr7c7qv+HlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="472566"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="472566"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:32:41 -0700
X-CSE-ConnectionGUID: 3v1Wdxp7RRqJLOGtDqTORA==
X-CSE-MsgGUID: 3DIitpG3QdSfb7/HjGQaQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2836954"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa012.fm.intel.com with ESMTP; 12 Oct 2026 21:32:40 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, ramanaidu.naladala@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_vrr: Let the pipe go idle before reading
 the DC3CO counter
Date: Tue, 13 Oct 2026 10:02:29 +0530
Message-Id: <20261013043228.804706-1-suraj.kandpal@intel.com>
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

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_vrr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index b41c58539..a02106fa7 100644
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
@@ -1158,6 +1160,8 @@ static void test_lobf_dc3co(data_t *data, igt_crtc_t *crtc,
 
 	test_lobf(data, crtc, output, flags);
 
+	usleep(LOBF_IDLE_DURATION_NS / 1000);
+
 	dc3co_count_after = igt_read_dc_counter(data->debugfs_fd,
 						IGT_INTEL_CHECK_DC3CO);
 
-- 
2.34.1

