Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E538C531D2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 14:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F326710E370;
	Thu, 23 Jul 2026 14:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIsVv9OC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2CE10E370
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784815876; x=1816351876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tVCvM774Wfla1v8POKr7LexELJz4TCHtVITJFr+jk0c=;
 b=OIsVv9OCRWXcv4MIxDUDHZ7w3jZw+InxtqyoYzVvlaw3NYEuqwmo7EZ3
 E9yqku+cniFVfyo7tC7KaaTed6/bpdffRwpWXexxTuQ1zA3q/MLjV6+wB
 KLSX86c32KFJ943iGc/s/lElSNG/zOaDS6cAvLsN9xshC4bv3zKDBQIHQ
 3iD48Ndiat/mtP7sm0IuBnDj2OcpSzMzqQ2EGnbV/ztf8Zp13OfWmzCp9
 wuubIDN3vXjZM7X4JP+SEHpyFkUBs9Skegwd5XCk7KMI7d05NAvN91w+F
 yrI+OqIb0sxwcNLMoJgQp1/DHWAqQrNtbQ0GhhVk9fwPoz/nDp9UJJzwX A==;
X-CSE-ConnectionGUID: mCXjG9bZR+mh9Nq9h292oA==
X-CSE-MsgGUID: jACGwXmyTFKgwl6hLzRL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85487310"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85487310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:11:16 -0700
X-CSE-ConnectionGUID: KftFKScdQSaiVNNjbC6R0Q==
X-CSE-MsgGUID: zndw0sD6SBWdkH6VYMMD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255053610"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.113])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:11:14 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block kms_setmode@basic-no-cpu-idle
Date: Thu, 23 Jul 2026 16:11:09 +0200
Message-ID: <20260723141109.174083-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Test kms_setmode@basic-no-cpu-idle has the same behaviour as
@basic on Intel, so add it to both i915 blocklist and Xe
display blocklists.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/i915.blocklist.txt           | 4 ++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 6ab955fda..bfb1e6b5a 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -213,3 +213,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ##################################################################
+# Valid skip :- Same as @basic on Intel hardware
+##################################################################
+igt@kms_setmode@basic-no-cpu-idle
+##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 3e30e5772..9259d1aaa 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -143,6 +143,10 @@ igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)
 ##########################################
 igt@kms_setmode@basic-clone-single-crtc
 ##########################################
+# Valid skip :- Same as @basic on Intel hardware
+##########################################
+igt@kms_setmode@basic-no-cpu-idle
+##########################################
 # Valid skip :- Connector uses CRTC that is incompatible
 #		with the connector
 ##########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 7462294aa..e5151c33c 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -124,6 +124,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
 ##########################################
 igt@kms_setmode@basic-clone-single-crtc
 ##########################################
+# Valid skip :- Same as @basic on Intel hardware
+##########################################
+igt@kms_setmode@basic-no-cpu-idle
+##########################################
 # Valid skip :- Connector uses CRTC that is incompatible
 #               with the connector
 ##########################################
diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index d44c4030f..c57766ce2 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -41,6 +41,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
 ##############################################################################
 igt@kms_setmode@basic-clone-single-crtc
 ##############################################################################
+# Valid skip :- Same as @basic on Intel hardware
+##############################################################################
+igt@kms_setmode@basic-no-cpu-idle
+##############################################################################
 # Valid skip: Connector uses CRTC that is incompatible
 # with the connector
 ##############################################################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index c46312d1e..7ec8d434c 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -50,6 +50,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
 ##############################################################################
 igt@kms_setmode@basic-clone-single-crtc
 ##############################################################################
+# Valid skip :- Same as @basic on Intel hardware
+##############################################################################
+igt@kms_setmode@basic-no-cpu-idle
+##############################################################################
 # Valid skip: Connector uses CRTC that is incompatible
 # with the connector
 ##############################################################################
-- 
2.54.0

