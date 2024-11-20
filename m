Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6771D711CD
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6609510E2D9;
	Wed, 20 Nov 2024 17:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzpV+oyt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9B10E2D9
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732123766; x=1763659766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOTXh3oYFmasH2HyMk2wJ1dsNapyAuyL0L2GbVNJhdE=;
 b=QzpV+oytCHfUL8cl+YPh3TSUIaFORmtIo4emMlr0wbUnDtYEnsEK0kDc
 rjN68aQh8fYBNkV+moQM3+L2mfG0vH7QK4y5yerdv7rh/vQ7Imliok4po
 3JyxOYlPuXMss9ZjJENgGn/hctiyiSDCQzjISa/z2gtVvCahH2M7numfB
 KnEr5T06woKaEbIOBZCIdSuX1aEbMQ+FwpV9XbFvSHcEbkimZFIr4hTJH
 KP682v32q6Dt59kyS+7kc464smYLG7/VW/5aIBxjFDaFR+rsmtcIuSA04
 VHk2KOQ3NR9yeYGfcYFTv0HLt2l8HMCbWsgu5b9v8YgqzDRvrW8Hv7ubH Q==;
X-CSE-ConnectionGUID: s7xgleCmQxuZ00f7BVXBjA==
X-CSE-MsgGUID: 7czWgR/yQRK++rlwE4cfYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32307865"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="32307865"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:29:26 -0800
X-CSE-ConnectionGUID: rhGGIhOTTzepzw2uH7X9xw==
X-CSE-MsgGUID: ga6YOFs/SK6MAALsP8cxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="113254893"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 09:29:24 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Jeevan B <jeevan.b@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_async_flips: Skip Async flips on joiner
 output
Date: Wed, 20 Nov 2024 23:13:44 +0530
Message-Id: <20241120174345.1970095-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120174345.1970095-1-jeevan.b@intel.com>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..486c03b32 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -653,6 +653,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+			/* TODO: Remove this workaround when Async+joiner is supported */
+			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
+				      "Joiner mode found, skipping the test\n");
 			test_init_fbs(data);
 			test(data);
 		}
@@ -674,6 +677,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
 				      igt_fb_modifier_name(data->modifier)) {
+				/* TODO: Remove workaround when Async+joiner is supported */
+				igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
+					      "Joiner mode found, skipping the test\n");
 				test_init_fbs(data);
 				test(data);
 			}
-- 
2.25.1

