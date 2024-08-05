Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F97C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 11:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B98891E1;
	Mon,  5 Aug 2024 11:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KczZSgLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE27891E1
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722857570; x=1754393570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hnAhJrMoWEMBRqBzs9cBe4mIBGbIsWkJL9RfIj5dcWA=;
 b=KczZSgLyDF3BFG0eG6obRpPTyX1axLC9td2O9hIA/lI408EGFE5NdZe3
 Z+6yzabQEzOdieqdzkwO+q/l92eiuToq8h/BZF/arDu/P4eTI7k2k+day
 aixSXLE0hRTN41YXX1cLQ1DH6c+yX6JJyaUIc+Cu/oNUpktkN5TEU9J7z
 YVC6/2LzR8unS4QXx/6d4PaQFNqhpjnIeLDW2ydZ7OgC4IRN1RiXbsSFC
 7vpbstoPBiRjxoYzPkt68knTGz/hps+9Vpyhq795DJB34hwCgF77sCb9s
 dSBzG3QhR2jNWyHDC5zI17bOrdRQBsHTeRPM6eGPAMApPd7NQuf9KU99k g==;
X-CSE-ConnectionGUID: wQifQMH4TzaeCzzHNswXmg==
X-CSE-MsgGUID: IBiXurs5SeGaA9OSTpiO6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20940518"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20940518"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 04:32:49 -0700
X-CSE-ConnectionGUID: r9mNF565SPmW3Wm4OnZSkQ==
X-CSE-MsgGUID: XIeqzljvQyeAgmfBaVyvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56357314"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa006.jf.intel.com with ESMTP; 05 Aug 2024 04:32:47 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Use extended flag to
 reduce the debug log level
Date: Mon,  5 Aug 2024 17:03:03 +0530
Message-Id: <20240805113303.978177-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

There is no need to reduce the debug log level for local executions.
This flag is used to prevent the reduction of the debug log level in
local environments, while it will lower the log level in CI environments.

To avoid reducing the debug log level in local executions, the extended
flag must be explicitly used.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f4f8afc66..f11e846d8 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1189,13 +1189,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
+		if (!data.extended) {
+			dir = igt_sysfs_drm_module_params_open();
+			if (dir >= 0) {
+				current_log_level = igt_drm_debug_level_get(dir);
+				close(dir);
+
+				if (current_log_level > 10)
+					igt_drm_debug_level_update(10);
+			}
 		}
 	}
 
-- 
2.34.1

