Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D85C36011
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 15:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC1610E912;
	Thu, 27 Mar 2025 15:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVco1uUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A810E912
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743089518; x=1774625518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsAMX7YakEbeIzDiYrXaTa/TVZsUgNkkpfyTIdRxaeQ=;
 b=XVco1uUsUvspa/JDjTwEeLTuMFKrFQvw0DHQpLYAl2LMbXUdYs/9JGgb
 2fRQsFdzHYqZ/toAc241pdXUeSo3RNJOHqLAUEIDzu936gXQW0GjFidkJ
 0uLOhPZ53TXbTFOmHz8M7Bg/EWN4NdCnvcdpDkvGqZMhjM+xTTUGandXI
 Cz/Utb9P4VQ/jO960+ZXn5pxtsSREa/axPBS2EAwLnn/NEg1bfsJgeIQt
 NICKPoHyVsmW9ZgickxjdbohWbXwJXs0mV7O7WFh1PovALKffAXW0KloE
 hmwlIbnuRtN9YnPP1ojeZ7A0++B6pV+YocX4amaw8qCW4VlqAAbeYnqlz w==;
X-CSE-ConnectionGUID: aLHe3BpGT9qmePYPRuBj5w==
X-CSE-MsgGUID: OxJUZp7fRQebeXJKxRN8Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55079431"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55079431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:57 -0700
X-CSE-ConnectionGUID: LCLlM3vmSSitvv8Gy5IMVA==
X-CSE-MsgGUID: DBvA1X6pSKuS6i3PeeXPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130241186"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Date: Thu, 27 Mar 2025 16:31:30 +0100
Message-ID: <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
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

Add some general guide about adding new library function and
a few guides for their usage outside of tests.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 CONTRIBUTING.md | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index b571b5e68..d85266a6c 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -38,6 +38,33 @@ The Code
 
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
+IGT libraries
+-------------
+- Tests and benchmarks are the main usage of IGT libraries, so they
+  could use test specific macros/functions, for example igt_assert,
+  igt_require, igt_skip, igt_info or igt_debug.
+
+- New library function could be written when it will have at least two
+  different users, for example if it could be used by two or more tests.
+
+- In a new library function():
+  if it has macros (for example igt_assert/igt_require/igt_skip) then
+    write also __function() counterpart without them;
+  limit also usage of prints igt_info/igt_debug, this should be a part
+    of test code.
+
+- Libraries and igt_runner
+  Runner should not use lib functions. It is crucial for CI runs so using
+  libraries puts a risk of bringing changes meant for tests which in turn
+  could break runner.
+  Note: You will find places where igt_runner uses lib functions - this will
+  be on ToDo list to be fixed.
+
+- Libraries and tools/
+  Tools should try to not use lib functions. Any abnormal condition should
+  be simply reported by printf or fprintf to stdout/stderr and then tool
+  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
+  igt_debug nor other testing/printing macros from igt lib/
 
 Sending Patches
 ---------------
-- 
2.49.0

