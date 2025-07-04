Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05F8C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 09:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9790810E9C8;
	Fri,  4 Jul 2025 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLfHAKF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7A010E9C8
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751621760; x=1783157760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvLsglNreSUxfjwc8508aMAby5x6WUaVVhDHNxbIoGk=;
 b=NLfHAKF/l6HjuLrKrWIhva6kVgs5JzepO4UhgXvhRVtBS8b758Vtlnvc
 /dhxR2RW/Rm6SG6uj9S/Z+x5cSkTG8qI69KYTi3mFkGFXauc/oFsArp23
 /zE8vw465SNjZ+hCxTWAcXYrYr00RrnFK2E7WzAxOqORMPlos7IHf/pg+
 fcOuKUCZoi3N8nwDkjuzUOraEf/U4zKkX6X3IZDGoLBBOtx8Uj9MK9hHt
 I8yIdmMBiNOnNe6oZi5+2C8/0Iy8KL6wVA9D9zjKr/tF0Cmv/WKqj4GkN
 fQNLzv1r/Evm7lQnqvy1mt5pI0/rdUVcfgVgHGD+C+ae1gwTLqnf8opDm g==;
X-CSE-ConnectionGUID: bM3k+A5ZQ3mjUJitgvbjVw==
X-CSE-MsgGUID: iIFymZdZSOW55sw+562ujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54098935"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="54098935"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:36:00 -0700
X-CSE-ConnectionGUID: 0ma5nd20T9iJbEPQvTZ+Tg==
X-CSE-MsgGUID: rpMLpBcKTbW5f8h/azyV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154688103"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 02:35:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Date: Fri,  4 Jul 2025 11:35:57 +0200
Message-ID: <20250704093557.499836-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250704093557.499836-1-michal.grzelak@intel.com>
References: <20250704093557.499836-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Currently, there is NULL pointer passed to the test as output. Pass
non-NULL output pointer to the test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..d0b21b694 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2329,7 +2329,7 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_PSR_ENABLED) {
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, prim_mode_params.output),
 			     "PSR still disabled\n");
 		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
 	} else if (flags & ASSERT_PSR_DISABLED)
-- 
2.45.2

