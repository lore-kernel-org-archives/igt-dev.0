Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07921C369D2
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 07:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6F910E34B;
	Mon, 21 Apr 2025 07:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2Ngl2je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52B810E34B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745220592; x=1776756592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7qhy6kLGNGIsPqU8GuIK7PIrsMEFYnC18SkOPI7J5z8=;
 b=D2Ngl2je5Dtw2aMrD0otJHU1o5LdjhxnpEPHfb8dpeHn8NIwtqfeiGoU
 EmNkhwYMFnngfR0SICDJ6p9kT5H6RD6PlYD83XIMPmjpTTSZ4+DnFJ5Dj
 ZmNet7vTePCzfXxZIyL8uCgdjWacInnembRjkMNVbCvgjkHs3i5LGR/a9
 n8FHGZtX7NHY6XPEKPOlqidx0CWZsYSvXZkgl1WQMpUMGPpfy8DoFrjie
 aMCUN0GScsfqDqOCeX7UEiz387GD32OXJsxftDPw7W6apNSu0nxMk/vnm
 oYHYIsql2OI6kpdWwcrrV2uEy8gxw10vpd+fXoqPYcAs/pUBTQQ7PRkZt Q==;
X-CSE-ConnectionGUID: VOOZ/A2JSOi8t9gST7swng==
X-CSE-MsgGUID: HkV+SvKHSGSQWchmR3CS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50411587"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="50411587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:29:52 -0700
X-CSE-ConnectionGUID: 9dVj/ZMaT/WBNB+IP44q9g==
X-CSE-MsgGUID: vJ+ulTH1RW2RuqgAYJijCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136508849"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 21 Apr 2025 00:29:49 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v7 2/3] tests/intel/xe_fault_injection: Inject errors in
 xe_guc_* calls
Date: Mon, 21 Apr 2025 13:15:44 +0530
Message-ID: <20250421074545.5549-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
References: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
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

Use the kernel fault injection infrastructure to test error handling
of xe during driver probe when executing xe_guc_ct_send_recv() /
xe_guc_mmio_send_recv() so that more code paths are tested, such as
error handling and unwinding.

All xe_init() kind of functions are called just once during driver probe,
so it is sufficient to fail first/all calls to them. Driver communicates
with the GuC multiple times, and the real failure can happen at different
call, hence the need to inject failure in GuC communication functions,
like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
all calls, but we need to be able to select specific iteration to fail.

To address this problem, an optional input argument is introduced. If the
argument is not set, an error will be injected in every possible function
call starting from first up to the max number of iteration defined by
INJECT_ITERATIONS, currently hardcoded as 100. If the input argument is
set, an error can be injected at specific function call.

Error can be injected using:
igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 74 +++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4eead2a14..d95b51f2d 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -26,7 +26,9 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define INJECT_ITERATIONS	100
 
+int32_t inject_iters_raw;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
 	uint32_t probability;
@@ -236,6 +238,38 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_remove(function_name);
 }
 
+/**
+ * SUBTEST: probe-fail-guc-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
+ * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
+ */
+static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
+               struct fault_injection_params *fault_params)
+{
+	int iter_start = 0, iter_end = 0, iter = 0;
+
+	igt_assert(fault_params);
+
+	/* inject_iters_raw will have zero if unset / set to <=0 or malformed.
+	   When set to > 0 it will have iteration number and will run single n-th
+	   iteration only.
+	*/
+	iter = inject_iters_raw;
+	iter_start = iter ? : 0;
+	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
+	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_end);
+	for (int i = iter_start; i < iter_end; i++) {
+		fault_params->space = i;
+		setup_injection_fault(fault_params);
+		inject_fault_probe(fd, pci_slot, function_name);
+		igt_kmod_unbind("xe", pci_slot);
+	}
+}
+
 /**
  * SUBTEST: exec-queue-create-fail-%s
  * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
@@ -410,10 +444,35 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	int in_param;
+	switch (opt) {
+	case 'I':
+		/* Update to 0 if not exported / -ve value */
+		in_param = atoi(optarg);
+		if (!in_param || in_param <= 0 || in_param > INJECT_ITERATIONS)
+			inject_iters_raw = 0;
+		else
+			inject_iters_raw = in_param;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -I\tIf set, an error will be injected at specific function call.\n\
+	If not set, an error will be injected in every possible function call\
+	starting from first up to 100.";
+
+igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 {
 	int fd, sysfs;
 	struct drm_xe_engine_class_instance *hwe;
+	struct fault_injection_params fault_params;
 	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	const struct section {
@@ -472,6 +531,12 @@ igt_main
 		{ }
 	};
 
+	const struct section guc_fail_functions[] = {
+		{ "xe_guc_mmio_send_recv" },
+		{ "xe_guc_ct_send_recv" },
+		{ }
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -514,6 +579,13 @@ igt_main
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
 			inject_fault_probe(fd, pci_slot, s->name);
 
+	for (const struct section *s = guc_fail_functions; s->name; s++)
+		igt_subtest_f("probe-fail-guc-%s", s->name) {
+			memcpy(&fault_params, &default_fault_params,
+					sizeof(struct fault_injection_params));
+			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
+		}
+
 	igt_fixture {
 		close(sysfs);
 		drm_close_driver(fd);
-- 
2.43.0

