Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D499C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32210E689;
	Tue, 15 Apr 2025 08:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hB2DaqtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD8210E681
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704728; x=1776240728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aaycaCT4tOV55CAfh4mFGJL2DS/0LCSiRUYQxiwiHA4=;
 b=hB2DaqtId/Qztv0rMN5nNSEskyTOU0YuDESI3NGG2NDlJEohg+cqZcOO
 mOX+Eg4HV8F59hX2ONHEZBL8YH13mBO3S+lb+ulf5ewgQp6asuwe+W2WJ
 4ydsZPaYOpVa5oFia0oo50c85zknP3sjv4pZ78RtMjOSE89vlPjIw5RlW
 rtmwtcx8dA+4kGVivxbEGJ8bRhNGxqmVBuzWaEKJf8HQs8Y36yP8IjDwm
 d94PlOWCzlfzHjciKg/1ZxswnICIEIw59RU7jrC4jhm5docuSZl6SGZ7A
 /6ANNcjZmZ6orolQDrn2fpButxTztSN68uTEvbGOOqROPt2fxgEHfiQBu Q==;
X-CSE-ConnectionGUID: NgJrnUGZSISjBjrgxf8+WA==
X-CSE-MsgGUID: ubcZF/JyTAaVLjThyQgfRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46334797"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46334797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:11:23 -0700
X-CSE-ConnectionGUID: qrVsLgVtQaa2xFmXUpGwGw==
X-CSE-MsgGUID: UlKYcV64ReiFkUs0EmJ9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129821006"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa009.jf.intel.com with ESMTP; 15 Apr 2025 01:11:21 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v6 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Date: Tue, 15 Apr 2025 13:57:09 +0530
Message-ID: <20250415082711.4831-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The current setup_injection_fault() is always programming fixed fault
injection parameters. Update this function to accept fault injection
parameters for better injection capabilities.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 46 +++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index fdd11ffe6..e56cdb304 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -27,6 +27,18 @@
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
 
+struct fault_injection_params {
+	/* @probability: Likelihood of failure injection, in percent. */
+	uint32_t probability;
+	/* @interval: Specifies the interval between failures */
+	uint32_t interval;
+	/* @times: Specifies how many times failures may happen at most */
+	int32_t times;
+	/* @space: Specifies how many times fault injection is suppressed before
+	 * first injection*/
+	uint32_t space;
+};
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -122,21 +134,43 @@ static void injection_list_clear(void)
 	return injection_list_add("");
 }
 
+/*
+ * Default fault injection parameters which injects fault on first call to the
+ * configured fail_function.
+ */
+static const struct fault_injection_params default_fault_params = {
+	.probability = 100,
+	.interval = 0,
+	.times = -1,
+	.space = 0
+};
+
 /*
  * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
  */
-static void setup_injection_fault(void)
+static void setup_injection_fault(const struct fault_injection_params *fault_params)
 {
 	int dir;
 
+	if (!fault_params)
+		fault_params = &default_fault_params;
+
+	igt_assert(fault_params->probability >= 0);
+	igt_assert(fault_params->probability <= 100);
+
+
 	dir = fail_function_open();
 	igt_assert_lte(0, dir);
 
+	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
+			fault_params->probability, fault_params->interval,
+			fault_params->times, fault_params->space);
+
 	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
-	igt_sysfs_set_u32(dir, "probability", 100);
-	igt_sysfs_set_u32(dir, "interval", 0);
-	igt_sysfs_set_s32(dir, "times", -1);
-	igt_sysfs_set_u32(dir, "space", 0);
+	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
+	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
+	igt_sysfs_set_s32(dir, "times", fault_params->times);
+	igt_sysfs_set_u32(dir, "space", fault_params->space);
 	igt_sysfs_set_u32(dir, "verbose", 1);
 
 	close(dir);
@@ -442,7 +476,7 @@ igt_main
 		devid = intel_get_drm_devid(fd);
 		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
-		setup_injection_fault();
+		setup_injection_fault(&default_fault_params);
 		igt_install_exit_handler(cleanup_injection_fault);
 	}
 
-- 
2.43.0

