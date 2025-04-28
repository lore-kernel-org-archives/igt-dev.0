Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C1DC369D3
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 11:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC0810E21A;
	Mon, 28 Apr 2025 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwXQHOx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FE410E21A
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745840045; x=1777376045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4whzqdVFcr8P5SWMDFx5VoON9enEjK0QQsqz/9X2ySA=;
 b=JwXQHOx8dAmzPjFRCgaBibIckgHMGFNTDwzAwDIooFbNt/gjbblPrgki
 qcGgoKBqCZq9Pc1nQhdjYhgP2l6h22wJ09xYqb5CRnMLSvsREL7Gz9Idi
 H1bOSZkv9eFN79sXBvvdHpjab4A+TgmNkV3aLqsfEILyVXnMjf3iABJio
 q2xbBpwxUFb8t3wNFKY7sesbfLHtqQlkfTo+PMWTR56qqS9OLd7y5bWn5
 n+5LzXWkjGnRCXiNR7GsM0+rELCJseKO6Fi3HrdyvpS32xoyIpm7dplY8
 USyujswvDwmof5ZlYfndKPRTC7Mqv/2fODhmBlJb9wEgV09BYof/qXJwn A==;
X-CSE-ConnectionGUID: WTTXWxDHTBW8X8How+adKA==
X-CSE-MsgGUID: z4iyCDR4TcqC9+7nYVV+9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="35039844"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="35039844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:34:03 -0700
X-CSE-ConnectionGUID: BsvqJBU4TDSnnpacoYZfxg==
X-CSE-MsgGUID: Wo9sMAmeQ7egI0UdsnsxGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="133388745"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 04:34:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: remove device_reset
Date: Mon, 28 Apr 2025 13:33:56 +0200
Message-ID: <20250428113356.17810-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

device_reset test is driver agnostic so remove it from Xe
blocklist.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 541917393..1c43b7a26 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -37,7 +37,6 @@ igt@xe_live_ktest@xe_bo_shrink
 # Exclude all other non-Xe tests
 ##################################################################
 igt@debugfs.*
-igt@device_reset
 igt@drm_read
 igt@dumb.*
 igt@prime_.*
-- 
2.49.0

