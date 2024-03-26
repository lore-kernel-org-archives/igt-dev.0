Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B989BC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D1E10EE13;
	Tue, 26 Mar 2024 09:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eR+TnHs9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97F610EE13
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445420; x=1742981420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoZz53nAxT0nx4F/o5H/PymBRQqeWUFvXBBEpX/AC9U=;
 b=eR+TnHs9nczdMEHCyrbiO1WZTCqzc/lPvMWvgqCod39y0qax6uH/M77y
 vblkBCcqYClTiUKOtBKA7nUgyDp5bQ1/FfUZukQOXNx5LwguINcvRx+sZ
 ZUZyhxTVF9Bi4cQAL0YijUWgC4eHgjjkMPF4NbSpALMG2g1P5pjQsMwpC
 8wqqR8hYMCWyihCfQ4yzoQsJ5YHFxruBPYJop3KBdQqEG7zLkLknmoZ8P
 O1Z31kS/zEFLwYKTHEYKI4gfPu0nKe+6Y+YCKC2rcKEDa9jiggdtaq6SP
 +Z4/XWekxpMY8y/YYhFSuBNsrcAycBSVPJvKbjegQZEunh+PMyCVqK2zF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378730"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378730"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15965139"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:17 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 07/13] tests/intel: Add xe_prime_self_import to DRM
 subcategory
Date: Tue, 26 Mar 2024 09:29:01 +0000
Message-Id: <20240326092907.1979345-8-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

Let's move xe_prime_self_import to DRM subcategory to unify with i915
test documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_prime_self_import.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 8e7290e9e..f47733bb2 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -28,7 +28,7 @@
 /**
  * TEST: Check whether prime import/export works on the same device
  * Category: Software building block
- * Sub-category: drm prime
+ * Sub-category: DRM
  * Functionality: prime import/export
  * Test category: functionality test
  *
-- 
2.34.1

