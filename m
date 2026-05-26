Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBEFCD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865210E4A7;
	Tue, 26 May 2026 06:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfsIEynX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F3210E49A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779777765; x=1811313765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ajZ9PVPFN4ROhwOaNFQQhEF9UrpYAM5zUIzdkLPUL/k=;
 b=lfsIEynXdtDZN65TjMgoBjfI3C9KbqNqTOa1/Bpy0AgcImU64QXPAmP8
 yDYx3B/sZv4a8ybdjxMLW9cz/Wg/m0+ondeNMmIxSZK6swghg7gmkQ8tA
 Gq0i2aIL/olUrI+nCVdUNBydUX/94Mq1IyXEW5JnNF9rgu3/fjgsFYBmu
 AuYuSpikcQI98KGwG8nctGg8nW4j/pD5R7QxOG9rqyngDpyd8HaUw56Hb
 c/tp+o8WTMdQTciKJUDvsw6ocCDGp7tvsHqOwgDH4AqiwEkQI9yhMU+kj
 xMZiX+YvOkR2PAFLwraDj+xEyJ5/4EP/NckGkfQ+pQCs+86Vuas4nPYsS A==;
X-CSE-ConnectionGUID: ErcytJYvSfSXBAVIMQYo6w==
X-CSE-MsgGUID: okPg4Ek+QzWWa8Azov7PHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80617985"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80617985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:45 -0700
X-CSE-ConnectionGUID: 5sY/ktX/SvynybjOHdiUtw==
X-CSE-MsgGUID: Lo53ohbEQ56LSaKD2YKd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265689295"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:43 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v7 2/7] tests/intel/kms_pm_dc: Replace require with
 proper assertion
Date: Tue, 26 May 2026 12:10:59 +0530
Message-ID: <20260526064105.1818876-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526064105.1818876-1-jeevan.b@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
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

The DC3CO video playback simulation test was incorrectly using require at
the end to check if DC3CO state was entered. This causes the test to be
marked as SKIP instead of FAIL when DC3CO doesn't work properly, hiding
real issues. So changing the call from require to assert.

Fixes: b89efa8048e58 ("tests/i915/i915_pm_dc: Check dc3co count to skip the test")
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index c8cfa300c..27fa5dc39 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -316,8 +316,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
-					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
 static void setup_dc3co(data_t *data)
-- 
2.43.0

