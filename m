Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B86CAC599
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 09:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C11010E3C9;
	Mon, 15 Sep 2025 09:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bzd5+87H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C96510E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927813; x=1789463813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDahoqeZ9Z7wNzcQEKkyclkm3gBYG7EnkANmYbxkTE0=;
 b=Bzd5+87HFQjXboQWOvigsRzVbRCEFbg3fPmkrL8/Vcfe/vveAhx7Lg3A
 OKyXkMinS1p0ubGtjKjE3hUCTENYaIkZi6xuDCgpZ1OSNCdVMLA3W8NYG
 RCeuV7lknE8Cxtg6yO3UXIgYoBPYrvUc4f8CzEXN6UKW2RCS6/ceqqG/A
 dJnCsmhEdcKq/TQNPDXDJxswwLrcO8B+1rrqq+5gXoeReERARWUQ1A9/I
 iiM0aFh/ss4nX9np7ujMXZ3ERfgG2NsejKg2ofNT5pLgmwS6w2EZK7tDA
 XU1/pydjeMwKc92pv15ufKvrpxQNftP+jr4p/ST7NaJRZInLY6ujCYgrS w==;
X-CSE-ConnectionGUID: 5LXtbUxeSsWrEydMlBDssQ==
X-CSE-MsgGUID: cRbQGPJRTUW7bQcl+SeL0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60319543"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60319543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:16:52 -0700
X-CSE-ConnectionGUID: qvA7AqKtT4Kgp3N1qKahIg==
X-CSE-MsgGUID: Skd94EUnQXaJ0uyT0jKuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174498209"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2025 02:16:50 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v5 2/2] intel-ci: Blocklist compression PAT index for LNL
Date: Mon, 15 Sep 2025 14:57:38 +0530
Message-Id: <20250915092738.1466533-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915092738.1466533-1-pravalika.gurram@intel.com>
References: <20250915092738.1466533-1-pravalika.gurram@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Madvise does not support compression on LNL.
Therefore, compression-related PAT index
test cases have been blocklisted for this platform.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel-ci/xe.lnl.core.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 1e69170d8..938b2de1f 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -83,3 +83,9 @@ igt@xe_live_ktest@xe_eudebug
 igt@xe_oa@oa-tlb-invalidate
 igt@xe_oa@unprivileged-single-ctx-counters
 ##################################################################
+# Expected Skip as per the current behaviour compression
+# for madvise needs to skipped on LNL
+##################################################################
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-*
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-*
+##################################################################
-- 
2.34.1

