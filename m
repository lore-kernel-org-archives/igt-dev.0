Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F66CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7712410E7CC;
	Thu, 18 Jun 2026 14:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIN/OG4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBDC10F153
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781791852; x=1813327852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Mnzuwnh8tM1VH3fnInjXBDK9HcZkOu6k4tQinP0vVw=;
 b=fIN/OG4s9Mu9h4D3AauZgtMisGNuySsYW/EUBlGSGA9oY7pVppO6uyDD
 vL/dx53pBacZ+DNDygfjsRGVlvI6iRThkQAEF6/onxe1QbCSdpkC/V/NZ
 rXWiivUmnhQdNarzCPDWcDnvxDl/cRDm0lLkhF//XDe6ZKN1JP7uWxOQu
 SZqLP9Wx6uSmvR75XUW8pp6c7KtrfmI2tc/Dt1oPasirqfhZOyBMy/Gbo
 pFVCaLVI2LUUZlDg6cUCOHKF90zI9H8M0bO08GxBdzURJk9BLCgDqufQd
 cn2XSR30OZFvbv8DEBHcWIKwwbxaLTXRZn75A75AtY/MC/Oxrt8JLZdvK Q==;
X-CSE-ConnectionGUID: XdbpXK5HTLGtnZVaSmfI6g==
X-CSE-MsgGUID: 25gTfiyRSkCrWTI7gqVTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="70143064"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="70143064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:10:52 -0700
X-CSE-ConnectionGUID: +8fkmRXtSmifoLJq+wyAWg==
X-CSE-MsgGUID: Zu/Ix00DQtyW/NzfC9jbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="252275918"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:10:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 4/5] benchmarks/gem_exec_trace: use
 hars_petruska_f54_1_random() from lib/rand
Date: Thu, 18 Jun 2026 17:09:52 +0300
Message-ID: <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781791747.git.jani.nikula@intel.com>
References: <cover.1781791747.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remove the local duplicate of hars_petruska_f54_1_random() by switching
to use lib/rand.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 benchmarks/gem_exec_trace.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace.c
index 4263ccb03dbd..c27639105903 100644
--- a/benchmarks/gem_exec_trace.c
+++ b/benchmarks/gem_exec_trace.c
@@ -42,6 +42,7 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "i915/gem_create.h"
+#include "igt_rand.h"
 #include "igt_stats.h"
 #include "intel_io.h"
 #include "ioctl_wrappers.h"
@@ -92,14 +93,7 @@ struct trace_wait {
 	uint32_t handle;
 } __attribute__((packed));
 
-static uint32_t hars_petruska_f54_1_random(void)
-{
-	static uint32_t state = 0x12345678;
-
-#define rol(x,k) ((x << k) | (x >> (32-k)))
-	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
-#undef rol
-}
+static uint32_t random_state = 0x12345678;
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
 {
@@ -277,7 +271,7 @@ static double replay(const char *filename, long nop, long range)
 				sizeof(*exec_objects)))->handle = bo[0];
 
 			if (nop > 0) {
-				eb.batch_start_offset = hars_petruska_f54_1_random();
+				eb.batch_start_offset = hars_petruska_f54_1_random(&random_state);
 				eb.batch_start_offset =
 					((uint64_t)eb.batch_start_offset * range) >> 32;
 				eb.batch_start_offset = ALIGN(eb.batch_start_offset, 64);
-- 
2.47.3

