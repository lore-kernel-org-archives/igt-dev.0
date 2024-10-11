Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC4D24469
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 03:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5855E10EA1D;
	Fri, 11 Oct 2024 03:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6Hq6ET5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C810EA1B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 03:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728615931; x=1760151931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=byjOpDB9dNyzK/0REOqwc51PwLBgs7M6SIyyqhTFjBk=;
 b=W6Hq6ET5vGtFw7l6teYPoEjvDrE/oaLPzRQJbJ5rtWIcRmoGw9a2gbI9
 seZqbSC9h6MqkGqfChubziP1qDdRYTtSa3oGRI9THOMJYfPGxW+X3ad1+
 5Sqx3CPqLbofWlKd0mYrFfCfCWimXJTawKzqCWcEEdEMJUaAAaaMYZK1L
 6WYokyo07eOHH7TnnIFyf0dYA3WEF9/uH4PxsAWMqyeLxdgmZPgBwEsWj
 hfSjjCGeyLnxvIeJc6nQLzB5TZ28XbasTvcpW7yDI5HXCWpXZKTfMB7Yb
 oXsyRl80HY65jUJvuquKhQkfGx1pnt0/fUfF+Yjoaf9Irz2/zoX4R3QYl Q==;
X-CSE-ConnectionGUID: U1S+YMxZRrGHYKUySiQ7dQ==
X-CSE-MsgGUID: cJGJukbuTeeZhSEFS85oWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30880144"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="30880144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:31 -0700
X-CSE-ConnectionGUID: IUv3PO01TO+Ox1hHepGYbQ==
X-CSE-MsgGUID: a8DxKZJ6RUmR9Ry8Pz+6Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="107654647"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_query: Clarify delta engine_cycles
 calculation
Date: Thu, 10 Oct 2024 22:05:07 -0500
Message-ID: <20241011030507.321961-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011030507.321961-1-lucas.demarchi@intel.com>
References: <20241011030507.321961-1-lucas.demarchi@intel.com>
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

Let the compiler do the wrap around width instead of doing different
calculations depending on if the second value is lower than the first.

The only reason for ts2.engine_cycles to be lower than ts1.engine_cycles
is if a wrap around ocurred. The wrap around should happen
wrt the width reported by the kernel. However that is not really true
and kernel simply reports the value "as is". With Xe2, the value is
actually 64-bits and width is currently reported as 36 (that's being
changed in the kernel side). So, if engine_cycles would have to wrap
around 64 bits for that condition to hold true, and in that case we'd
calculate the delta by shifting (1 << ts2.width), giving a wrong result.

Luckly, wrapping 64 bits means at 19.2Mhz takes forever and is not a
problem in real life.

Anyway, fix the math which also removes the ugly check by b >= a.
Example:

	#include <stdio.h>
	#include <inttypes.h>

	int main(void)
	{
		uint64_t mask = (1ull << 36) - 1;
		uint64_t a, b;

		a = mask - 1;
		b = mask;
		printf("%"PRIu64"\n", (b - a) & mask);

		a = mask;
		b = (mask + 1) & mask;
		printf("%"PRIu64"\n", (b - a) & mask);

		a = UINT64_MAX & mask;
		b = 0 & mask;
		printf("%"PRIu64"\n", (b - a) & mask);

		return 0;
	}

which does the correct wrap around and prints 1 in all cases.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_query.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 87ddb58bb..1566680e7 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -15,6 +15,7 @@
 #include <string.h>
 
 #include "igt.h"
+#include "linux_scaffold.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -738,6 +739,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 #define NUM_SNAPSHOTS 10
 	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
 		int index = i / NUM_SNAPSHOTS;
+		uint64_t width_mask;
 
 		ts1.eci = *hwe;
 		ts1.clockid = clock[index].id;
@@ -763,12 +765,12 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 
 		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
 
-		if (ts2.engine_cycles >= ts1.engine_cycles)
-			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
-				   NSEC_PER_SEC / eng_ref_clock;
-		else
-			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
-				   NSEC_PER_SEC / eng_ref_clock;
+		igt_assert_eq(ts1.width, ts2.width);
+		width_mask = GENMASK_ULL(ts1.width - 1, 0);
+		ts1.engine_cycles &= width_mask;
+		ts2.engine_cycles &= width_mask;
+		delta_cs = ((ts2.engine_cycles - ts1.engine_cycles) & width_mask) *
+			NSEC_PER_SEC / eng_ref_clock;
 
 		calc_freq = (ts2.engine_cycles - ts1.engine_cycles) * NSEC_PER_SEC / delta_cpu;
 
-- 
2.46.2

