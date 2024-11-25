Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7818ED58D64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D98D10E6A5;
	Mon, 25 Nov 2024 16:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVdL6p0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3110E6A5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732551576; x=1764087576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POICHUEYWQwGG3Or+E67plHYRtK9xOYddgYVt6xIXsc=;
 b=BVdL6p0oS9hhT0ECRTkpPRR6h4QnzPaPsMI86wbsOorxAzkBviJiuAKn
 e1KPKGngBFlAmJnJRqpIZHTJE3kdmwVY4teHumFnceJVFHim2a4Xje/x/
 yfmvkd5IV3FBv3CZw/bhr56k0w+tuR8jJt4rBx2r50RXwvUplo7yBLfEC
 kywMeLvviVC3qISDKqRlcmb9f3EEhT0Xi2TulOB3Y33YjTaqDOOcIGq06
 TIZgnHSn6OtwGZwTlJ/ymw243+W4S7NLOo605xStN6nkFaQqqcsRTASiF
 tJAwCDPf+3Rdcie6u0r4KGNwgJ1GJGmDT08VtK/ucpvyt+9ac/qUiQv6p A==;
X-CSE-ConnectionGUID: wuLTG6krRUa1eOYxTJK73A==
X-CSE-MsgGUID: szlVZ7CeTPaNJKEboFcPMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55171134"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55171134"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:19:36 -0800
X-CSE-ConnectionGUID: K16foUgNRROTtE74YfVEsA==
X-CSE-MsgGUID: J57lkQ0sSYCLFPUyyOsSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91768482"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:19:33 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 2/3] tests/kms_async_flips: Skip async flips on joiner output
Date: Mon, 25 Nov 2024 22:04:25 +0530
Message-Id: <20241125163426.382975-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125163426.382975-1-jeevan.b@intel.com>
References: <20241125163426.382975-1-jeevan.b@intel.com>
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

From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Async flips are disallowed with joiner, but the test commit still
goes through and causes failures. Update the tests to skip on
joiner outputs.

V2: Skip tests only on joiner outputs (Kunal).
V3: Add a todo to remove workaround when async flips with joiner is
    supported in kernel.
V4: Add proper FIXME, improve log message and
    move igt_is_joiner mode to library (Swati).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_async_flips.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..3ce6e18d7 100644
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
+			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
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
+				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
+								   data->output),
+						    "Skipping, async flip not supported "
+						    "on joiner mode\n");
+				      test_init_fbs(data);
+				      test(data);
 			}
 		}
 	}
-- 
2.25.1

