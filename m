Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9ACC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 19:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619F810E604;
	Thu, 29 Feb 2024 19:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOi970Si";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16810E5E0
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709236657; x=1740772657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LP78hXJ4Oo5T6RWB0FiN9Oex8GxhSXpk87mfqEyBQv0=;
 b=GOi970Si4TW3DmQNaWJvkx/ZglNmadIxoTQBuMWJ3ByFs9irhtTTPQsk
 B4QouPUYo97zh6xM/2N24bINu2OKGlHrnbH55oT9KQOFQyo+H/avTpHUG
 kgojUQfOyAg3Nhx32hQL0hp3tDyQtXVS8lnwbWHmfnCrkJCRlxgeeY6hV
 az07vCDQo0gnauAVrDrQeH2gphckuVF5iIutG2zQkRhkFCTm5Hq9/Okok
 NhsIQzYKrGxAvf3xjgEhmdK/ZTSo/4YGbd8dE05pNydtU79MbPWkjX6DJ
 JhC3uFy59S4ewaHXo4wiyxwA4VVs1+Z5SSOsxaAdoU1aQPGOxYDbhIwex A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3595902"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3595902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="31128846"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Feb 2024 11:57:20 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/intel/gem_exec_capture: Check for partial
 register captures
Date: Thu, 29 Feb 2024 11:55:21 -0800
Message-ID: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
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

v2: Keep includes in alphabetical order (review feedback from Kamil).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_capture.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index d231c53b98e1..065357f2589b 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -21,9 +21,10 @@
  * IN THE SOFTWARE.
  */
 
+#include <ctype.h>
+#include <sched.h>
 #include <sys/poll.h>
 #include <zlib.h>
-#include <sched.h>
 
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

