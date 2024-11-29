Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CCED70E1A
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 04:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9518210ED94;
	Fri, 29 Nov 2024 04:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTrZyPvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602D810ED94
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 04:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732853575; x=1764389575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCHAEkSPNvJXAa0nehmxyF0rJ5Vgoc5dBqo1ZKrlhAg=;
 b=PTrZyPvKCefqg2hRXlDHBgiRJU8nSNJFHGTtK259cyZHjsRBFiNFaAh/
 D/Xy8ondbzEwR8/vlJtfleu/stJHkCA3QemtWt0Z9OvdhplkTAjC3quPm
 RildvtN3hkzG1QH0tZSvxqU7ohdMniKsg9isyy6YWEIx5WM3HBlY5Zekq
 41Vjp6FbMOEyqhYgH0F6YP1g9r8OBbOuVa7MwdPmsMvKx3OLwcgV6iyqk
 7ZXbyhpHQaiPKKu0O/fWYEzo0pVSu1Md2i9z4kotu8lGxiVU5a+NTqpIl
 CAvsUp+GjP+5OzGSzcdfHUJyxz3CnK3fevNnAT6Z9FtINhpyYG1Y9X+6A g==;
X-CSE-ConnectionGUID: n5VYAvHxRymic+A+zIuTKg==
X-CSE-MsgGUID: 3FkhDB7bRUikTthVuadPHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43704020"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="43704020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:12:55 -0800
X-CSE-ConnectionGUID: b4xaBHtwRxCcgzTvRaLkrQ==
X-CSE-MsgGUID: frilho1TTfW4ugXJJmaljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92848993"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:12:53 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Kunal Joshi <kunal1.joshi@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_async_flips: Skip async flips on joiner
 output
Date: Fri, 29 Nov 2024 09:57:44 +0530
Message-Id: <20241129042746.701796-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129042746.701796-1-jeevan.b@intel.com>
References: <20241129042746.701796-1-jeevan.b@intel.com>
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

