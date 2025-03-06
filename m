Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C7C282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341C810E92E;
	Thu,  6 Mar 2025 09:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ4ic5N3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF8010E92E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254911; x=1772790911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zCNZfEWVb/e/SURGazr60sEcbkra3rAvUFtsOUcuLTY=;
 b=EZ4ic5N31k5ZKirP1Dr+MHWiykhU+I7Frw3hzcsXUcIiCgUcDmBBZ1MB
 elT41swBIT3KkH6RRY/SofNQvCdXaBHbXPOKpWK0qadvEr5A2/t7igbjj
 xg8SZW6jxjdRUbCYmwDNfosH+RmnsHkuLVxtwQ7GSEEQlBxuSccu3WyKt
 jNmBwA21VzQBGYrajw6RzgQJIm33FgTjADBZSIBZ2pyvOzrwxoEFcOqEb
 rRQ+S0fY/R5GbXwK5Hogi88rgMsvGK7S6A2Jf0lECIW2vFIF16ZvFKh08
 +QjfmUF9ACt4UD5dvLgjOBe2Pt7pmrCSYrl/uxbsbRm+TWs2Jct+ruaPH g==;
X-CSE-ConnectionGUID: IZCSkl/3RN2ix1TuNNI6aw==
X-CSE-MsgGUID: aA+6KZeUToamFqjHzYtJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839192"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839192"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:11 -0800
X-CSE-ConnectionGUID: KN0Tik9+SvmoXaqPyRWIPw==
X-CSE-MsgGUID: rqBVPyZ+RPS0UmnmyHzm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160903"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:09 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 2/6] tests/intel/xe_fault_injection: Make
 setup_injection_fault() programmable.
Date: Thu,  6 Mar 2025 15:40:37 +0530
Message-Id: <20250306101041.26827-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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
 tests/intel/xe_fault_injection.c | 42 +++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 3631128b2..019ddfb7f 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -31,6 +31,17 @@ enum injection_list_action {
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
@@ -117,21 +128,40 @@ static void injection_list_do(enum injection_list_action action, const char func
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
 
+	igt_assert(fault_params);
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
@@ -326,7 +356,7 @@ igt_main
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
-		setup_injection_fault();
+		setup_injection_fault(&default_fault_params);
 	}
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
-- 
2.35.3

