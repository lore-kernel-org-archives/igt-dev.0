Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD6FCC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 11:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0197810E0C6;
	Thu, 15 Oct 2026 11:50:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688F10E228
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792064948; x=1823600948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L4NjSIGFtC1L07nJ+BmuSQGVpC43K3Y2xAaBZZsgTVc=;
 b=MhrcYbHmIwJlqYTo5Zq5Vb04jCUz8/T02I7f+wQF5UhhwmroC33bKEc7
 k8vhd1BwuTRRGagRbnzjp6RmKMgeng1lXdewgoVdZI6BJs0K29KLCsYgV
 LulDCQueTIWZAB9TX1FUkgVcsosf8QykxPaQuxBs0dfL6jTGw97WRLU5i
 /n+0ERxt+lDytrMdhRL2tyozAyNr0VyHbAqdiGhuDKCm8k7vbE3YHBfMH
 Poh9Rr6rAdvg8T/iFgiwUQe4y40II4QypsCQmnAkTLF0Pp48bQ4/woFUV
 yFuGHDENQIRjZMdbAgSKkSchguUiQfsfsn0L/ahJFqYCfuYiUlFrJOddR g==;
X-CSE-ConnectionGUID: g7Jm69r5SCO+/UuAK/loug==
X-CSE-MsgGUID: L3l29Mg2TxSTLqV0StQ8lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="840908"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="840908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 04:49:08 -0700
X-CSE-ConnectionGUID: t8uYaj2RSyiMDzOuTEBWvg==
X-CSE-MsgGUID: wSMBspIoQsC34dVDmlRTRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2033830"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2026 04:49:07 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] lib/igt_eld: Log module load state when no eld# nodes
 are found
Date: Thu, 15 Oct 2026 16:55:48 +0530
Message-ID: <20261015112548.2682369-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

eld_is_supported() silently fails when ELD procfs node polling times out.
Log module load state to identify whether audio drivers are loaded when
IGT attempts to read the ELD nodes.

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_eld.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 896ab0e6b..bfb83a213 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -36,6 +36,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_eld.h"
+#include "igt_kmod.h"
 
 #define ELD_PREFIX "eld#"
 #define ELD_DELIM " \t"
@@ -301,8 +302,15 @@ static bool eld_has_nodes(void)
  * for a bounded amount of time before giving up to avoid spurious skips. */
 bool eld_is_supported(void)
 {
-	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
-			ELD_SUPPORTED_INTERVAL_MS);
+	bool supported = igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
+				   ELD_SUPPORTED_INTERVAL_MS);
+
+	if (!supported)
+		igt_debug("No eld# nodes found; snd_hda_intel loaded: %s, snd_hda_core loaded: %s\n",
+			  igt_kmod_is_loaded("snd_hda_intel") ? "yes" : "no",
+			  igt_kmod_is_loaded("snd_hda_core") ? "yes" : "no");
+
+	return supported;
 }
 
 #define ELD_MAX_SIZE 256
-- 
2.50.1

