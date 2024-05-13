Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7645C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056E10E636;
	Mon, 13 May 2024 10:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol9PoQBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597E310E636
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597494; x=1747133494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q75dS0iTY0RZSso6XMz6HANxL2PMw7uTwTZ7yYfP6ec=;
 b=Ol9PoQBsXcNShy+ZVg4JGNnY6THtuvvOyaGhIoWPQvJ0RWWpbZqeybDy
 cog/xJEQHlQ4MK2Vlzw4B8swsFNImJeyGwQWl3yWgdo+fzVQMtMXrkVAZ
 qyP4/1rC/90LgNA12P3+B8/Lqnn0b0R+9NvjB/m4CZTS06k0oKZtH5GXm
 yd8z+mQ0GF4lz6ITbv7flVvx8HUsh3ykj+drL7fbQjbTAjUrfUuPUydTp
 B3U/lXecxME5evsyqwS648UW9AVztlU0WhbQYZlEfWxCESnrPI/012qP2
 ffVEG1oPW28usC3+NQoSZ9Rk43l6JS0h/xar8pjRE7HmqPpUFJV9+/LR5 Q==;
X-CSE-ConnectionGUID: IamnFCBRT1+Lq8EMmlj2EQ==
X-CSE-MsgGUID: EVLKypePQ6miRoxFHppJOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22193353"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22193353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:34 -0700
X-CSE-ConnectionGUID: CdiySKk+Qzu+RStbV00StA==
X-CSE-MsgGUID: k+gy5j0uQEKYFYChrn0vfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34994789"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:51:32 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 16/16] tests/intel: Add display tests to General
 Display Features
Date: Mon, 13 May 2024 10:48:46 +0000
Message-Id: <20240513104846.362332-17-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add display tests to General Display Features.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/i915_pipe_stress.c | 4 ++--
 tests/intel/i915_selftest.c    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index de4df830f..203eb46a3 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -20,13 +20,13 @@
 #include "i915/gem.h"
 /**
  * TEST: i915 pipe stress
- * Category: Display
  * Description: Stress test how gpu and cpu behaves if maximum amount of
  *              planes, cpu and gpu utilization is achieved in order to reveal
  *              possible bandwidth/watermark and similar problems.
- * Functionality: kms_core
+ * Category: Display
  * Mega feature: General Display Features
  * Sub-category: Display Tests
+ * Functionality: kms_core
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index e4354df5f..bdac64b29 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -74,9 +74,10 @@
  *
  * SUBTEST: live@display
  * Category: Selftest
+ * Mega feature: General Display Features
+ * Sub-category: Display tests
  * Functionality: display sanity
  * Test category: i915
- * Sub-category: Display tests
  *
  * SUBTEST: live@dmabuf
  * Category: Selftest
-- 
2.34.1

