Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE3C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 09:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F371C10E891;
	Thu, 27 Mar 2025 09:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in5kAEbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007C510E267
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743066883; x=1774602883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vAVslaJbXFoYGZAcpDDjFTZiNXymN2bcO9VPYSsmj1k=;
 b=in5kAEbwNWzBFMNqlN/FLhLIH9lO84Rz7kciFEgZeGpAn4EIqCUooXiZ
 mE5DY4h1bULUKjB5JvpigVvdRzWlXvUCEnlGHFdWFwSC7YBxrbOS0kOIE
 rd8qgf11ANlZjsyijeZyI/eaxLDYPwvBvaANUjrqaKxRPOaKnN9dJ40zS
 4lKBqf6eEeqw9uwXtYV22TQzP85ok7UA2y8sS1bQHoZoY6PwAr1D6vk57
 mwFvSw8pOwyi/X0vRVgI466heq3lLLL4TPIpbNL9iPUAjybC0837Zq48y
 h4/VWioOLPRtNfCewV5QYjVFtBt3tDj/yemcRu2BiNfgvLx/f+jbEJf0O w==;
X-CSE-ConnectionGUID: 5vqucuKYQ9eI1nboudA3Fw==
X-CSE-MsgGUID: hys7K3VfRXebVl7ohHC8Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69749324"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69749324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:43 -0700
X-CSE-ConnectionGUID: KwATzALmQf6NgwzkdZTmzQ==
X-CSE-MsgGUID: bjnXvdOCQy2xTEjxSMkG6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162311512"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:41 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 4/4] tests/kms_async_flips: Remove allow_fail flag
 from async flip tests
Date: Thu, 27 Mar 2025 14:38:51 +0530
Message-Id: <20250327090851.2740672-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
References: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
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

Remove allow_fail flag as the async supported format modifiers are
now known to the user space. The test now executes for all supported
format modifiers.

V2: Remove check for frame 1, as no longer needed now as valid
    modifiers are being in use. (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index c3a875ced..233f54f0e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -123,7 +123,6 @@ typedef struct {
 	enum pipe pipe;
 	bool alternate_sync_async;
 	bool suspend_resume;
-	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
 	unsigned int plane_format;
@@ -346,11 +345,7 @@ static void test_async_flip(data_t *data)
 		}
 
 		ret = perform_flip(data, frame, flags);
-
-		if (frame == 1 && data->allow_fail)
-			igt_skip_on(ret == -EINVAL);
-		else
-			igt_assert_eq(ret, 0);
+		igt_assert_eq(ret, 0);
 
 		wait_flip_event(data);
 
@@ -724,7 +719,6 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
-- 
2.25.1

