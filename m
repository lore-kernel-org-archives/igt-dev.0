Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7448CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D5010E6F9;
	Wed, 24 Sep 2025 11:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu8klcqR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13010E6FB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758711980; x=1790247980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ew+nolFUuxwE0bpVqkzi0QH+QBJ+qyHl9Ft17RzC2DU=;
 b=iu8klcqRte1PzZKgAEDGVRmUyDqs9advTMDZEYNYK/u3Mb4n5fJoX56J
 nMR4yIOX8aLa/ui8bj4FDjHB3eUcgA1Zwb55WtQyT16K2JSxXuGOUB3GC
 uDuobW/FzALkdfOHkRltmScxCotJrwi91wAfwSGzG4KRO0Rkbk+QtMwWs
 nqtzKVLcC3gn8zJtejImPnPRfdlofP5o63CNWYamNvhrwuH5nm0uHs4eJ
 wmCd7GLxowwRFgjqrwjN/Kf4NhO0KDIR19cHtGvUzEY6NZRhchZbqHN+G
 nhny3wjtmfqcvOd3ps/6NDoSkGOGlDnQ3OGwdKjVVmmYp5ijfjnnG77gY Q==;
X-CSE-ConnectionGUID: Cs/vHIJkQBeCUKHo8KZCFw==
X-CSE-MsgGUID: S+Fi6fxbShW1H2Gcznfpzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72362639"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72362639"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:20 -0700
X-CSE-ConnectionGUID: JrFlUy9QQPi28PiRYUl+8w==
X-CSE-MsgGUID: RK1SV8jKTJO9VZePyP1cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181299029"
Received: from unknown (HELO localhost) ([172.28.180.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:18 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t 1/2] benchmarks/gem_wsim: Fail on thread assertions
Date: Wed, 24 Sep 2025 13:06:06 +0200
Message-Id: <20250924110607.563913-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
References: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
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

Call igt_thread_assert_no_failures() before returning so thread errors
affect the exit status.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 benchmarks/gem_wsim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7a6b10028..098415b53 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -63,6 +63,7 @@
 #include "i915/gem_mman.h"
 
 #include "igt_syncobj.h"
+#include "igt_thread.h"
 #include "intel_allocator.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
@@ -3362,5 +3363,7 @@ err:
 	if (is_xe)
 		xe_device_put(fd);
 
+	igt_thread_assert_no_failures();
+
 	return exitcode;
 }
-- 
2.31.1

