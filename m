Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BF9D44001
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0C010E5B1;
	Tue, 19 Nov 2024 05:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAj3Nzks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDC210E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731993362; x=1763529362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+9/EDQhSYVlXljRZDjFZ8rEoNIQsbkzr9CXeFqhAN0=;
 b=aAj3Nzks6tA57YMa0rWO1fgtOesRTMcSTkRkOgjj9ikArFZWSAsYaS+j
 gwUX6ZwGD2pPdHibYg05h41rIus6AO7YMUy/7j+Ug9rVNFHBhU5Zf0Mdz
 1Yv5g1KFmhFTe1WYebDEayTjX95FTCcpB/had8FXPa3k7czAiM9SLfuFm
 jPN8knent50VZq5ppIzkogcdSK3xbFOBr2MalmGtwfbXh21FMTsKptj8p
 gU2i6H4aMGyyOQJfXSeZX7zPMjklXWo9v0c2GLzyp5I3ewZsABWfenlFy
 HcqQMpsVsVc4gpfQ0rLyEWtXr2JiAIZtZtVCi6+ztEto+TGYH5WfB+j7a w==;
X-CSE-ConnectionGUID: Zwalj5eHSKKZlZYQNicEQQ==
X-CSE-MsgGUID: 8KkNQVYiRX2sIkOoVngqLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54473740"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54473740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:16:02 -0800
X-CSE-ConnectionGUID: LCGJMWuySN+Bhr/qTA1KTg==
X-CSE-MsgGUID: 7NRlMQQNSzO9NqqYDaHBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89366705"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 21:15:59 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/kms_async_flips: Skip async flips on
 joiner output
Date: Tue, 19 Nov 2024 10:41:41 +0530
Message-Id: <20241119051142.2272779-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119051142.2272779-1-santhosh.reddy.guddati@intel.com>
References: <20241119051142.2272779-1-santhosh.reddy.guddati@intel.com>
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

Async flips are disallowed with joiner, but the test commit still
goes through and causes failures. Update the tests to skip on
joiner outputs.

V2: Skip tests only on joiner outputs (Kunal).
V3: Add a todo to remove workaround when async flips with joiner is
    supported in kernel.
V4: Add proper FIXME, improve log message and
    move igt_is_joiner mode to library (Swati).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_async_flips.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..62df3e1b3 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -653,6 +653,12 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+			/*
+			 * FIXME: joiner+async flip is busted currently in KMD.
+			 * Remove this check once the issues are fixed in KMD.
+			 */
+			igt_skip_on_f(igt_is_joiner_mode(display, data->output),
+				      "Skipping, async flip not supported on joiner mode\n");
 			test_init_fbs(data);
 			test(data);
 		}
@@ -674,8 +680,16 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
 				      igt_fb_modifier_name(data->modifier)) {
-				test_init_fbs(data);
-				test(data);
+				      /*
+				       * FIXME: joiner+async flip is busted currently in KMD.
+				       * Remove this check once the issues are fixed in KMD.
+				       */
+				      igt_skip_on_f(igt_is_joiner_mode(&data->display,
+								       data->output),
+						    "Skipping, async flip not supported "
+						    "on joiner mode\n");
+				      test_init_fbs(data);
+				      test(data);
 			}
 		}
 	}
-- 
2.34.1

