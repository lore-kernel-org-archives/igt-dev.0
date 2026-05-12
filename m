Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7595DCD4F25
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 16:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2533F10EB84;
	Tue, 12 May 2026 16:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDoKXQmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719D010EB8D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778603211; x=1810139211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V3CwDdTJZhNQ1m8SH6yHFP2OeMsAZH8tM7UE0Dwfd+o=;
 b=cDoKXQmV0HslAOjj9XrwbvW02A9gIXlKTIW5Ycx3hwX9Y/tnXVXkX5X/
 DavdSiMuXowVjfd8zayMTxwuCsYZTt1N6GskKJGQ19Vfj6Vuc5JPz7JIV
 2j+dCrSSQEMQQEIC75sJXp+gdSZA9QF1tByPUphsR5bfzgH6EGWtI5qCW
 q4bauxnW7wyzGpeBrREqeSKb0CfmPQs+8xsqz6KPEPQujd850p5cpEZVY
 CHT+egllZF9jBCpb0eXmZR/vzMzyDw0JKKb97OrMxubRZcCXkitqbTbGp
 W+PJmbM2u4H+8Z9j1xs2c/zjFLxwApn6cNu7I8XHQmkwir29Roqr/uVxJ Q==;
X-CSE-ConnectionGUID: FaDSDFT8TrC+xyA1e9qDyA==
X-CSE-MsgGUID: 59F16AcqRri1p7j+hhaLtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79696878"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79696878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 09:26:51 -0700
X-CSE-ConnectionGUID: PsmfKlQcTdqW4aTPNS9clA==
X-CSE-MsgGUID: kAcMaDtJSdmgspMbPBXPrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="268154817"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 09:26:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Fix checks for whitlisted oa
 registers
Date: Tue, 12 May 2026 09:26:37 -0700
Message-ID: <20260512162637.1014955-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

OASTATUS register is not used by UMD's and the plan is to discontinue
whitelisting that in the kernel. Also, UMD's use MMIOTRIGGER, TAILPTR and
OABUFFER registers, which are in SW whitlists in the kernel. So check that
the latter 3 registers are whitelisted and remove the check for OASTATUS.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 56d818d860..a50eb12da9 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3833,12 +3833,14 @@ test_whitelisted_registers_userspace_config(void)
 	xe_oa_remove_config(drm_fd, config_id);
 }
 
-#define OAG_OASTATUS (0xdafc)
 #define OAG_MMIOTRIGGER (0xdb1c)
+#define OAG_OATAILPTR (0xdb04)
+#define OAG_OABUFFER (0xdb08)
 
 static const uint32_t oa_wl[] = {
 	OAG_MMIOTRIGGER,
-	OAG_OASTATUS,
+	OAG_OATAILPTR,
+	OAG_OABUFFER,
 };
 
 static const uint32_t nonpriv_slot_offsets[] = {
-- 
2.54.0

