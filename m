Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222F1CF9C6D
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC74510E35C;
	Sun, 22 Sep 2024 21:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bH6TnXNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E2B10E35B
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039642; x=1758575642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWjiyAaVc4UFN5mdSnOeHN+C2kN2dVBrwAy+c5I8ny4=;
 b=bH6TnXNKSb3qNeSv5FnZUZoHu29yP5uhk5bcswfyRk/hDZAlMaJihMAW
 6txUFGM1YJs0BrXPCTi51wxpw+eCpStl8btOcf7mhB4n0unmSNgrupD6I
 wuvhS/L+9edl8QyxWZ/0KOIo0v58yFKCZxbFZCyMpSoqyt9VvzlQs5mWE
 DjJ7CGyzZOA0Wjv+RM7dsPBV/0t7X/Woesu9v23omrqGeLPFwtdNmZ1dP
 L27AahSIJ7o9LYVDDjyChda0p1YL4xkRVBJD1aKzYCxFpZ9Rs58J6yFI2
 z4JUNLzigDmx8JmodVXxSiWXUNgbFV6OOUvR8DgM1bS1Eg8cxzuasMfAc w==;
X-CSE-ConnectionGUID: r7W9Ks7nT2GPr8TlYLuVVg==
X-CSE-MsgGUID: cR1TjMs3SV+Rf7wRDyeWEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641016"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641016"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:14:01 -0700
X-CSE-ConnectionGUID: djwHx28wQUOXG2g4sYw5Zw==
X-CSE-MsgGUID: bmgp27UmRs+OfMWLQTKt/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188119"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:14:00 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Mon, 23 Sep 2024 02:55:49 +0530
Message-Id: <20240922212549.1361889-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922212549.1361889-1-kunal1.joshi@intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
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

HAX: Do not merge

Just for testing in CI
---
 tests/intel-ci/fast-feedback.testlist    | 1 +
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7b84ccffc 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_fallback@dp-fallback
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..110675cd3 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_fallback@dp-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.43.0

