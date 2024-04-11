Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC765CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0810F01A;
	Thu, 11 Apr 2024 11:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByGdfSUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D69810F01A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712834268; x=1744370268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQYmE0d0ylugm7BX2z8ATZME++8Zy5Hy7hMVZC7suJI=;
 b=ByGdfSUP4zWiMKRpPoIVIKRqQbtWjKwa6j71uiP00kv85+hcWVfpQwoB
 jyuprnvvg4kFmXdUnNPY3Qk4oEY6c5DgjpOiUWj2xNRCsYidjUnZ0O6zp
 ml3KqF4XDQ0QCzYP7iyWjsOhFen9tB8YnBDdHZxMnRtbK/4dzn3MK29s6
 Mfyn/h4R2sJFlSaHVVv61NoDjxB7YX+zM1ChFa6c6Qt/fVxGS6wMm957E
 TEy7e/PbdYk97Cj6rZHZZd+xwXMfezF0M7/J+DeT8FRpSDJfmsKGLvcat
 omA1R3vKnbRuCkO0SaSSeYvcZVrMlWCy9MGVxwam6d0kUmlqIg/CgTqV/ g==;
X-CSE-ConnectionGUID: uiABwT82QMuWNThlb8yFLg==
X-CSE-MsgGUID: fcNmFT0kSPGCZgaYRCHi9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8344497"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8344497"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:48 -0700
X-CSE-ConnectionGUID: 4wnJnsRgS8mcYJ0TpiVEeA==
X-CSE-MsgGUID: icWIpho2T1uYHuEVIKzOdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44156130"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:17:45 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/5] tests/intel: Remove name collision in Display
 tests visible in Core docs
Date: Thu, 11 Apr 2024 11:17:14 +0000
Message-Id: <20240411111717.2941810-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
References: <20240411111717.2941810-1-katarzyna.piecielska@intel.com>
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

Display team is not using Subcategory field, but this test is
visible in Core documentation. Let's remove name collision in
Category, Subcategory and Functionality.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_pipe_stress.c | 2 +-
 tests/intel/prime_mmap_kms.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 6c5e951ab..de4df830f 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -26,7 +26,7 @@
  *              possible bandwidth/watermark and similar problems.
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Sub-category: Display
+ * Sub-category: Display Tests
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 35d1eedde..7759b9469 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -41,7 +41,7 @@ IGT_TEST_DESCRIPTION(
  * TEST: prime mmap kms
  * Category: Infrastructure
  * Feature: prime
- * Functionality: memory management
+ * Functionality: prime
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
-- 
2.34.1

