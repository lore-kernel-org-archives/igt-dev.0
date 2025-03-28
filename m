Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14BAC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B0710E9E1;
	Fri, 28 Mar 2025 10:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTIHzg83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A6A10E9E1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743159588; x=1774695588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I7xXB+JyJQH+0UuGpyX5Ww7WvSBpORtnOz/Qp4vpMMc=;
 b=gTIHzg83G+mhHM8xaOcknruBLe2fxd2M1P4BKUacwP96M9mKei1AM4GG
 MsCydR5/zpZp21ThY2gMEmgYD1McuYnImVyAT24Kcor8OG8SDojhf9qiV
 4b+nRvCtNWTQWD34sFLPzF7UHZh/q180/IOHj7iAuLww/slDIY5hKSwbI
 vo5DCT+LEbg+xHtcxXYTPplSiQxNIcOo74EK9/9CrME5rp7EIEXc/aaGl
 bmNpY00o58FiQG6yKMBcU0262mXJbZyuODItYrHBEM4kiXIibn93TlFuw
 F7NV3CgA4JaKRQaThkKE41IG6nIDbwQQBhdvO9LoKTforjaGdAtVv44AH Q==;
X-CSE-ConnectionGUID: jTmW06q4TjmDZM/2/qrfsg==
X-CSE-MsgGUID: outlXwKqQeaTVoxvqfth9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55886301"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55886301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:59:48 -0700
X-CSE-ConnectionGUID: vuqB1kScSxOOeGf0RY6XTQ==
X-CSE-MsgGUID: Aawp58XfRT2m03REAejsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130271401"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 03:59:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 1/3] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Date: Fri, 28 Mar 2025 16:45:30 +0530
Message-Id: <20250328111532.16620-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
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
 tests/intel/xe_fault_injection.c | 44 +++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..1325a1716 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -32,6 +32,17 @@ enum injection_list_action {
 	INJECTION_LIST_REMOVE,
 };
 
+struct fault_injection_params {
+	/* @probability: Likelihood of failure injection, in percent. */
+	uint32_t probability;
+	/* @interval: Specifies the interval between failures */
+	uint32_t interval;
+	/* @times: Specifies how many times failures may happen at most */
+	int32_t times;
+	/* @space: Specifies an initial resource "budget", decremented by "size" */
+	uint32_t space;
+};
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -118,21 +129,42 @@ static void injection_list_do(enum injection_list_action action, const char func
 	close(dir);
 }
 
+/**
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
@@ -437,7 +469,7 @@ igt_main
 		devid = intel_get_drm_devid(fd);
 		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
-		setup_injection_fault();
+		setup_injection_fault(&default_fault_params);
 		igt_install_exit_handler(cleanup_injection_fault);
 	}
 
-- 
2.35.3

