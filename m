Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B8DC54E49
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 20:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7D010E2AD;
	Fri, 23 Feb 2024 20:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRejyaKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6E410E2AD
 for <IGT-Dev@lists.freedesktop.org>; Fri, 23 Feb 2024 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708720833; x=1740256833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0xhS+HjAw2dx7zRzU/o+SxzoZ9dL3bcTs13p0XGRyoE=;
 b=JRejyaKAlqitUGFWaPaZm1bR9bCYfhElOLs1ESOaqhtW0RLu//OUWE7G
 oh9+WGpVcmh/aG6sd6K8sd324QWkwLk6RvNtimQ+yGjUcNMFVh1/kufY8
 IpTqvpdr4PUPM6EFFzhpLjtg7alskKEERAVzwbQVLp+sXZRRwopuHSxkO
 7FheX2UA2hidatFqUejs597R+BTaYRGEP0Souwck2rifXWxLnnNcMXP1Q
 CS0OUAR2zUb+rzgnFC6WA4AvnOoHsUTvmU7y520H9tRF2HC+f/56CjbVa
 sCjv17QBs+7wwXEqUyhMZgKILsvXPsd/cjWXxATzPVgwlqOcU5gz3eyub Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3212152"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3212152"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5995850"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2024 12:40:32 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_exec_capture: Check for partial
 register captures
Date: Fri, 23 Feb 2024 12:38:24 -0800
Message-ID: <20240223203824.1537904-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

If there is an error in the register list provided to GuC by the KMD
then GuC will refuse to capture the invalid entries. This is reported
as a 'partial-capture' when decoding the register state. Check for
this and flag it as an error.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/gem_exec_capture.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index d231c53b98e1..1671f6774f64 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -24,6 +24,7 @@
 #include <sys/poll.h>
 #include <zlib.h>
 #include <sched.h>
+#include <ctype.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -184,6 +185,19 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
 	igt_assert(errno != ENOMEM);
 	igt_debug("%.*s\n", error_dump_limit, error);
 
+	/*
+	 * global --- GuC Error Capture on rcs0 command stream:
+	 * Coverage:  partial-capture
+	 * Coverage:  full-capture
+	 */
+	for (str = error; (str = strstr(str, "Coverage: ")); ) {
+		str += 10;
+		while (isspace(*str))
+			str++;
+
+		igt_assert(strncmp(str, "full-capture", 12) == 0);
+	}
+
 	/* render ring --- user = 0x00000000 ffffd000 */
 	for (str = error; (str = strstr(str, "--- user = ")); ) {
 		uint32_t *data = NULL;
-- 
2.43.0

