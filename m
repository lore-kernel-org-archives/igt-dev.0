Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8ABE9E30D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 13:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71110E5C1;
	Wed, 11 Feb 2026 13:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4gqKXch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040AB10E5C1
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818176; x=1802354176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d2/muG4hNOckFg10fi8LupIH4x8xsy1M7B4kKpvOtmo=;
 b=H4gqKXchRD+jcjXyFyDE99Y+G91mY3WIFaQPwEhzPkBDy+FTif9vnLI+
 beLr58m0MXOHMg8Swo94NPuYCsDd6L1iHm9SZ95VUUyptNqCUrI0zfW2d
 7NJbeImzL7skm8VPshBl6RtiyOtK/b20zDXQ5ETUYvBzGoVR6jsKa4snf
 ba1L+kBFsRoUM1zt/8rE3Yc0NDzWg3E6Sw5WIrwlmisJ0BIp47t8sysxl
 zM8SfkQcgeR6+jq/a+3EKpiKzAQl+VVsGXpG/zHTwqJhGHu5Y4EnHb+GF
 +YYl5Cl47TUw3oMiYhChLv278YZxc1EwNX14HZfeyl03e47jMc2m2JX6t Q==;
X-CSE-ConnectionGUID: 4/8pDhxfQPWkSVoMRx+1Gw==
X-CSE-MsgGUID: Y2ODdzXoS6KCN5coyMM5bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82603455"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82603455"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:56:16 -0800
X-CSE-ConnectionGUID: yjzKSqU6RJ67bmMYQ0iZAg==
X-CSE-MsgGUID: uSxv/tf9S46no1cbthPxOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="249904551"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:56:14 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_eudebug_online: Skip canary check in
 set-breakpoint-sigint-debugger
Date: Wed, 11 Feb 2026 14:55:49 +0100
Message-Id: <20260211135549.14135-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
References: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Unfortunate signal timing can result in tripping over count_canaries_eq
assert in run_online_client in set-breakpoint-sigint-debugger test. Skip
canary check in this case, as it is not important for this testcase.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 39ecca479..059f918a6 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1667,6 +1667,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 	max_sleep_time = set_breakpoint_time * 11 / 10;
 	igt_info("Maximum sleep_time: %" PRIu64 " us\n", max_sleep_time);
 
+	/* Skip checking canaries as they can be invalid due to signal timing */
+	flags |= DO_NOT_EXPECT_CANARIES;
+
 	ts = (struct timespec) { };
 	igt_nsec_elapsed(&ts);
 
-- 
2.34.1

