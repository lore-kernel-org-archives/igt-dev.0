Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9916C87FCB
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 19:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5803410E219;
	Mon,  4 Aug 2025 19:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NczNGf70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F810E219
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754334939; x=1785870939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sybQApY96GbFgSJIeoIcONAfMfiAETy/Cmc5wBUW9cs=;
 b=NczNGf70h/7I/T60Xk9+YTQzbdq+arSXu+hJmaloKWLL4mrVJqWqJwna
 V6mnME0cPm7Emn78t+WPQZmTYb4DpiPAj/KU/wvYNZMTSW6hJxnoV1htb
 rS9lN0GFdTENb8D8SNgPpIFCyA0ReVILXxcUfnsoOJkPXUzxrkkoi4Tz6
 nu7QoGLRG/R4gRt+RUZJ74P3UNYTZNSy4sGZvyinbPDs6fJFd+ANACeTj
 hpJJL3XwvHKD+iyAjCC48aYNL6Sbi9GDVJ1yy0MnKtnTnFOVQfr0LctxP
 Cb6ijNU21q8ykj+2a453dDbrclTd0PqzXl+MG7BTzTzIAo7HOT3lpoaxr Q==;
X-CSE-ConnectionGUID: kLzUICLCScq4gC0vRJC3tw==
X-CSE-MsgGUID: c/qV6O2eS2a9r/m85JQjbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44206795"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="44206795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 12:15:38 -0700
X-CSE-ConnectionGUID: TTNOsx/nRZaS/I5Uxdr3Gg==
X-CSE-MsgGUID: VCtgS2v2RFGqKGTvwbAqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164641646"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 12:15:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Break early if the test
 is done
Date: Mon,  4 Aug 2025 12:15:32 -0700
Message-ID: <20250804191531.1393272-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

For the GuC communication injections, the test is currently looping for
an hardcoded 100 times. In the current driver we call the 2 GuC
communication functions way less than 100 times each (in one run I've
counted less than 40 for one and less than 10 for the other), so for
the majority of the iterations the test is just reloading the driver
without any injection occurring.

To avoid wasting so much time, we can just break early if we've reached
the point where no more injections are occurring. If we use a positive
value for the "times" parameter in the injection framework, the value
will be decremented every time an injection occur in the given
iteration, so we can break once we detect that the value is unchanged.

While at it, add an assert to alert us if the number of calls to the
function increases above our current maximum number of loops, so we know
that the test needs to be updated.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_fault_injection.c | 37 +++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 8245c558c..00d045cd8 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -27,7 +27,8 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
-#define INJECT_ITERATIONS	100
+#define MAX_INJECT_ITERATIONS	100
+#define MAX_INJECTIONS_PER_ITER	100
 
 int32_t inject_iters_raw;
 struct fault_injection_params {
@@ -194,6 +195,19 @@ static void cleanup_injection_fault(int sig)
 	injection_list_clear();
 }
 
+static int get_remaining_injection_count(void)
+{
+	int dir, val;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	val = igt_sysfs_get_s32(dir, "times");
+
+	close(dir);
+	return val;
+}
+
 static void set_retval(const char function_name[], long long retval)
 {
 	char path[96];
@@ -288,14 +302,31 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 	*/
 	iter = inject_iters_raw;
 	iter_start = iter ? : 0;
-	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
+	iter_end = iter ? iter + 1 : MAX_INJECT_ITERATIONS;
 	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_end);
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
+		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
 		inject_fault_probe(fd, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
+
+		/*
+		 * if no injection occurred we've tested all the injection
+		 * points for this function and can therefore stop iterating.
+		 */
+		if (get_remaining_injection_count() == MAX_INJECTIONS_PER_ITER)
+			break;
 	}
+
+	/*
+	 * In the unlikely case where we haven't covered all the injection
+	 * points for the function (because there are more of them than
+	 * MAX_INJECT_ITERATIONS) fail the test so that we know we need to do an
+	 * update and/or split it in two parts.
+	 */
+	igt_assert_f(inject_iters_raw || iter != MAX_INJECT_ITERATIONS,
+		     "Loop exited without covering all injection points!\n");
 }
 
 /**
@@ -486,7 +517,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'I':
 		/* Update to 0 if not exported / -ve value */
 		in_param = atoi(optarg);
-		if (!in_param || in_param <= 0 || in_param > INJECT_ITERATIONS)
+		if (!in_param || in_param <= 0 || in_param > MAX_INJECT_ITERATIONS)
 			inject_iters_raw = 0;
 		else
 			inject_iters_raw = in_param;
-- 
2.43.0

