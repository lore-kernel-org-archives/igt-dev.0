Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D96BC25B5C
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 22:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511D11330E;
	Fri,  3 May 2024 22:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTMWBVRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E411330E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714776425; x=1746312425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4CAlgYsUA4CASs0gICrL7YOp5cHZDRjIOVbkUFk2w4I=;
 b=QTMWBVRnG7gIJ1e7COupmDG8aM/itXaQcmGNLhST/7Cg+zBKPNJnCo0G
 cMXzxOFOZYKg+HY10UMLco4yxIG+tIvfeFy9TLVnrbQarUpiB+vlKN84C
 4JMrwNZaBOIzIayP8IztbwFCCr0RKVQHIJ/PtfUWFFRcYs0L8C7+ibK6Y
 w58L0Zeq5aCB0COZeYUGwCWIVJZVArFrEwamhFpzN+mDW4tW5gQ6jBrCG
 ZOayJVhcC0ihTZFbGfZ1EOXd4+Z95zXopXfA8KUxisUlnS/VkwnMMyE8o
 N4Ho7cqaXqA9Fz6JGpy6mCD/EeEOY0wMG9TzMe9YghoGqOfmmr19n/SW9 w==;
X-CSE-ConnectionGUID: LsmTNIQdSYmbzs2v7EinNA==
X-CSE-MsgGUID: L5duAs95QESyRy20KMDkGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22010162"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="22010162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
X-CSE-ConnectionGUID: 3tp8hs1NSby54psqFP5mmg==
X-CSE-MsgGUID: jSXQICdpSWyn4Tko+zvICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="27609360"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_aux: Name function according to sysfs file
Date: Fri,  3 May 2024 15:47:44 -0700
Message-ID: <20240503224745.14890-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503224745.14890-1-lucas.demarchi@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
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

Let's follow the sysfs filename that is being written/read so it's not
misinterpreted as something else: at first I thought it was dealing with
/sys/power/state, which it's not.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_aux.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index d6aeb876b..398665999 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -732,7 +732,7 @@ static const char *mem_sleep_name[] = {
 	[MEM_SLEEP_DEEP] = "deep"
 };
 
-static enum igt_suspend_test get_suspend_test(int power_dir)
+static enum igt_suspend_test get_pm_test(int power_dir)
 {
 	char *test_line;
 	char *test_name;
@@ -765,10 +765,14 @@ static enum igt_suspend_test get_suspend_test(int power_dir)
 	return test;
 }
 
-static void set_suspend_test(int power_dir, enum igt_suspend_test test)
+static void set_pm_test(int power_dir, enum igt_suspend_test test)
 {
 	igt_assert(test < SUSPEND_TEST_NUM);
 
+	/*
+	 * When pm_test is available, it needs to be cleared or set to specific
+	 * test before /sys/power/state is written (which is also done by rtcwake
+	 */
 	if (faccessat(power_dir, "pm_test", W_OK, 0)) {
 		igt_require(test == SUSPEND_TEST_NONE);
 		return;
@@ -1009,7 +1013,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		      !igt_get_total_swap_mb(),
 		      "Suspend to disk requires swap space.\n");
 
-	orig_test = get_suspend_test(power_dir);
+	orig_test = get_pm_test(power_dir);
 	igt_aux_enable_pm_suspend_dbg(power_dir);
 
 	if (state == SUSPEND_STATE_S3) {
@@ -1021,7 +1025,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 			      "S3 not possible in this system.\n");
 	}
 
-	set_suspend_test(power_dir, test);
+	set_pm_test(power_dir, test);
 
 	if (test == SUSPEND_TEST_NONE)
 		suspend_via_rtcwake(state);
@@ -1031,7 +1035,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 	if (orig_mem_sleep)
 		set_mem_sleep(power_dir, orig_mem_sleep);
 
-	set_suspend_test(power_dir, orig_test);
+	set_pm_test(power_dir, orig_test);
 	close(power_dir);
 }
 
-- 
2.43.0

