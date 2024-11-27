Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4E5D609AE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 07:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236B210EA15;
	Wed, 27 Nov 2024 07:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3wQhPc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C21D10EA00
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694376; x=1764230376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCHAEkSPNvJXAa0nehmxyF0rJ5Vgoc5dBqo1ZKrlhAg=;
 b=O3wQhPc5reGkd42kRq2jUgo3HAwMd8FdUvlvIdwXkC3V/n3zmwZH7Mr0
 4bmtN0CMt7M4Xt2dvCVxoaGpszs+6TI52IMy2piyWzUWsdWpXd5hIv7UP
 fAT9nJ8rYyrPFVpqIjvUNi3EN3P9NEeldQQCUNWlfQJdIfbQafrmUBqhy
 e6sbBNswPqOWD+cyBCiz5CC/qA6vIiTwPTh2ij0kVAxoJFXXpoDkoOGSB
 cD6lWj+84S4hPGIGltdWMONn2E8GIAohqfkS3Atm4kgYgzxgFWl/6NKER
 T74KQ26cCL+w1YYFMciocVx17BylWHuU1opdzc3imFB5kZM25aDyo2Hno A==;
X-CSE-ConnectionGUID: jlefD/qpSeSHhl1e34EWcQ==
X-CSE-MsgGUID: OOJ3IyDKT0e2M0cT1faVeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32628685"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32628685"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 23:58:59 -0800
X-CSE-ConnectionGUID: MOS5icPwR5iMEGUWFKKKEA==
X-CSE-MsgGUID: UQf0RrtWTRyBTff3Oi+mcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92008436"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 23:58:56 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_async_flips: Skip async flips on joiner
 output
Date: Wed, 27 Nov 2024 13:43:55 +0530
Message-Id: <20241127081357.569876-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127081357.569876-1-jeevan.b@intel.com>
References: <20241127081357.569876-1-jeevan.b@intel.com>
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
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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

