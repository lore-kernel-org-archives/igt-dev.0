Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C7BC77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 12:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4F210E1BD;
	Mon, 23 Jun 2025 12:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyqiJhkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3A810E1BD
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750680541; x=1782216541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x32oLpNAu84x5svHShcxw93ZYJVYK+C+IYf/DOojjVI=;
 b=LyqiJhkUeUgUC/SRxqncwDirdy+e0kjSNT4CmsDK6SEECDECPKYX5BSn
 8FMNmTjSF7mBmR27pS1k+N7+tnxZvrGmjNWCl86t2a5E60oRYXhsOcNc/
 fjM+8Y41Rp/N26prv+ptxtGY9LgTbhEVr/m0jnJ1V3hQW6iV838pXGzA+
 TPIcVZQGDkV1y/bF8jr1U4OXh4UQx45b1ZqvHat1OaUKtlpkP5kwpfxQN
 QIgZN2BGKgAs2fIhFqqeCryobRKtExiO6A+Hik+66Hh3KZhUTphsb2VgB
 CYsMWwr3+n2P+cVjumYygZWSJ/rw3pbcvj59KaP0ZO9k/8DzkjgiNo4fP g==;
X-CSE-ConnectionGUID: Aos4oV4zSpiJq2qmFVeh4g==
X-CSE-MsgGUID: gd+GNEbgQNuLM2TWYH2vTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52753629"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52753629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:09:01 -0700
X-CSE-ConnectionGUID: IMmgtdM2T3itXIJZavac0g==
X-CSE-MsgGUID: Q4BxpcooQ5ekdOUKtWJw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="188798470"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 05:08:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_cursor_crc: optimise cursor crc on simulation
Date: Mon, 23 Jun 2025 17:36:43 +0530
Message-Id: <20250623120643.613082-1-santhosh.reddy.guddati@intel.com>
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

Reduce the number of test crc iterations on simulation to avoid timeouts
on simulation.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_cursor_crc.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index cacd2402c..28c747639 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -490,9 +490,20 @@ static void test_crc_offscreen(data_t *data)
 static void test_crc_sliding(data_t *data)
 {
 	int i;
+	int max;
+	bool run_in_simulation = false;
+
+	run_in_simulation = igt_run_in_simulation();
+
+	/* In simulation, we only run a few rounds to keep the test fast */
+	if (run_in_simulation)
+		max = 4;
+	else
+		max = 16;
+
 	struct {
 		igt_crc_t crc[3];
-	} rounds[16] = {};
+	} rounds[max];
 
 	/* Make sure cursor moves smoothly and pixel-by-pixel, and that there are
 	 * no alignment issues. Horizontal, vertical and diagonal test.
@@ -521,10 +532,15 @@ static void test_crc_random(data_t *data)
 {
 	igt_crc_t crc[50];
 	int i, max, x[ARRAY_SIZE(crc)], y[ARRAY_SIZE(crc)];
+	bool run_in_simulation = false;
 
 	max = data->flags & (TEST_DPMS | TEST_SUSPEND) ? 2 : ARRAY_SIZE(crc);
 
 	/* Random cursor placement */
+	run_in_simulation = igt_run_in_simulation();
+
+	if (run_in_simulation)
+		max = 10;
 
 	/* HW test */
 	cursor_enable(data);
-- 
2.34.1

