Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB51EC369DF
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 12:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A8C10E0C8;
	Wed, 25 Sep 2024 12:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nR32zo7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69E110E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 12:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727268669; x=1758804669;
 h=message-id:date:mime-version:from:subject:to:
 content-transfer-encoding;
 bh=GvtUk5ikTvLTjWjElGOj4qwczMGz7kVWoGT7Oc5RP9E=;
 b=nR32zo7Q333BcUW+2h25w/pVDR1vu5tDtjxhdQakGqoUrEI6J9SZ3Wv2
 O1zGT1ExucUr2Dr0iiJKEncqDhLukphM20tndVpI3FcEW9tz5nMJgHhnk
 jf/uEAeOSQxsA9dKXmzBEDtUDIUk3Vq9eTDp3TygLVvUQnPls9PBgIVkU
 p4HBZBBOq+xUYWpFbpYbl7a6zZ5TrUPQrhqHl0rJsyHKI/dZYSDnLqfWS
 +WrjXQzyUdyXej/U8Usztpvhmg4tds/btEPy8GIHLMf2Ar46CXZXcu5bx
 RxTjHb+w42HWdHGl+y43dWh4YuDXeKZeJaoOUgbOtn4qY8nat2xms7KTF Q==;
X-CSE-ConnectionGUID: yLj3F3KTT/uvdCwVzfoeoQ==
X-CSE-MsgGUID: TwUIRt9iT5mXFKyrhek2QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51728123"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="51728123"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:51:09 -0700
X-CSE-ConnectionGUID: n5TBQEn/S9SnzxlI3B+DCA==
X-CSE-MsgGUID: qIxJ2XCDSZWt4aSeOH+yPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="72071647"
Received: from donohuem-mobl1.ger.corp.intel.com (HELO [10.213.198.79])
 ([10.213.198.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:51:08 -0700
Message-ID: <e76bdd69-3c5f-481e-a68e-157a46b335e9@linux.intel.com>
Date: Wed, 25 Sep 2024 14:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [i-g-t PATCH] tests/intel/xe_pm: one suspend/resume cycle for all xe
 engines
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

*** Please do not merge. This is intended for testing and RFC only. ***

This patch changes the behavior from running one suspend/resume cycle for each
xe engine to running a single suspend and resume cycle for all engines.

This patch is not good enough for upstream, and it introduces issues.
However it reduces the runtime of tests/intel/xe_pm from ~60 minutes to ~10
minutes. The main reason for sending this patch is for CI to test it.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_pm.c | 149 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 128 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c..2659ff572 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -54,6 +54,28 @@ typedef struct {
 uint64_t orig_threshold;
 int fw_handle = -1;
 
+pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
+pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
+pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
+pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
+bool child_ready = false;
+
+#define NUM_THREADS MAX_N_EXEC_QUEUES * 4
+pthread_t threads[NUM_THREADS];
+int thread_number = 0;
+
+struct test_exec_args {
+	device_t device;
+	struct drm_xe_engine_class_instance *eci;
+	int n_exec_queues;
+	int n_execs;
+	enum igt_suspend_state s_state;
+	enum igt_acpi_d_state d_state;
+	unsigned int flags;
+};
+
+enum igt_suspend_state global_s_state = SUSPEND_STATE_NUM;
+
 static void dpms_on_off(device_t device, int mode)
 {
 	int i;
@@ -273,6 +295,7 @@ static void close_fw_handle(int sig)
  * @prefetch:	prefetch
  * @unbind-all:	unbind-all
  */
+
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
@@ -396,10 +419,14 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
 		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
-			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
-				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-
-			igt_system_suspend_autoresume(s_state, test);
+			pthread_mutex_lock(&child_ready_lock);
+			child_ready = true;
+			pthread_cond_signal(&child_ready_cond);
+			pthread_mutex_unlock(&child_ready_lock);
+
+			pthread_mutex_lock(&suspend_lock);
+			pthread_cond_wait(&suspend_cond, &suspend_lock);
+			pthread_mutex_unlock(&suspend_lock);
 		}
 	}
 
@@ -440,8 +467,76 @@ NULL));
 			   active_time);
 		igt_assert(in_d3(device, d_state));
 	}
+	pthread_mutex_lock(&child_ready_lock);
+	child_ready = true;
+	pthread_cond_signal(&child_ready_cond);
+	pthread_mutex_unlock(&child_ready_lock);
+}
+
+static void*
+test_exec_wrapper(void *args) {
+
+	struct test_exec_args *exec_args = (struct test_exec_args *)args;
+
+	test_exec(exec_args->device, exec_args->eci, exec_args->n_exec_queues,
+		exec_args->n_execs, exec_args->s_state, exec_args->d_state,
+		exec_args->flags);
+
+	return NULL;
+}
+
+static void
+threaded_test_exec_h1(device_t device, struct drm_xe_engine_class_instance *eci,
+	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
+	  enum igt_acpi_d_state d_state, unsigned int flags) {
+
+	struct test_exec_args args;
+
+	args.device = device;
+	args.eci = eci;
+	args.n_exec_queues = n_exec_queues;
+	args.n_execs = n_execs;
+	args.s_state = s_state;
+	args.d_state = d_state;
+	args.flags = flags;
+
+	if (global_s_state == SUSPEND_STATE_NUM)
+		global_s_state = s_state;
+	else if (global_s_state != s_state) {
+		igt_info("Something went wrong? Two different suspend states in a single run\n");
+		global_s_state = s_state;
+	}
+
+	pthread_create(&threads[thread_number], NULL, test_exec_wrapper, &args);
+	thread_number++;
+
+	pthread_mutex_lock(&child_ready_lock);
+	while(!child_ready)
+		pthread_cond_wait(&child_ready_cond, &child_ready_lock);
+	child_ready = false;
+	pthread_mutex_unlock(&child_ready_lock);
+}
+
+static void
+threaded_test_exec_h2(void) {
+
+	enum igt_suspend_test test = global_s_state == SUSPEND_STATE_DISK ? SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+
+	igt_system_suspend_autoresume(global_s_state, test);
+
+	sleep(2);
+	pthread_mutex_lock(&suspend_lock);
+	pthread_cond_broadcast(&suspend_cond);
+	pthread_mutex_unlock(&suspend_lock);
+
+	for (int i = 0; i < thread_number; i++)
+		pthread_join(threads[i], NULL);
+
+	thread_number = 0;
+	global_s_state = SUSPEND_STATE_NUM;
 }
 
+
 /**
  * SUBTEST: vram-d3cold-threshold
  * Functionality: pm - d3cold
@@ -719,7 +814,7 @@ igt_main
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
+			threaded_test_exec_h1(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -731,14 +826,15 @@ igt_main
 		igt_subtest_f("%s-basic", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-
 			igt_system_suspend_autoresume(s->state, test);
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM, 0);
+				threaded_test_exec_h1(device, hwe, 1, 2, s->state,
+					  				  NO_RPM, 0);
+			if (thread_number > 0)
+				threaded_test_exec_h2();
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -747,21 +843,27 @@ igt_main
 
 			igt_system_suspend_autoresume(s->state, test);
 			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, NO_SUSPEND,
-					  NO_RPM, 0);
+				threaded_test_exec_h1(device, hwe, 1, 2, NO_SUSPEND,
+					  				  NO_RPM, 0);
+			if (thread_number > 0)
+				threaded_test_exec_h2();
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32, s->state,
-					  NO_RPM, 0);
+				threaded_test_exec_h1(device, hwe, 16, 32, s->state,
+									  NO_RPM, 0);
+			if (thread_number > 0)
+				threaded_test_exec_h2();
 		}
 
 		for (const struct vm_op *op = vm_op; op->name; op++) {
 			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
 				xe_for_each_engine(device.fd_xe, hwe)
-					test_exec(device, hwe, 16, 32, s->state,
-						  NO_RPM, op->flags);
+					threaded_test_exec_h1(device, hwe, 16, 32, s->state,
+										  NO_RPM, op->flags);
+				if (thread_number > 0)
+					threaded_test_exec_h2();
 			}
 		}
 
@@ -769,8 +871,10 @@ igt_main
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
 				xe_for_each_engine(device.fd_xe, hwe)
-					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM, 0);
+					threaded_test_exec_h1(device, hwe, 1, 2, s->state,
+										  NO_RPM, 0);
+				if (thread_number > 0)
+					threaded_test_exec_h2();
 				cleanup_d3(device);
 			}
 		}
@@ -793,16 +897,20 @@ igt_main
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state, 0);
+				threaded_test_exec_h1(device, hwe, 1, 1, NO_SUSPEND,
+									  d->state, 0);
+			if (thread_number > 0)
+				threaded_test_exec_h2();
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32,
-					  NO_SUSPEND, d->state, 0);
+				threaded_test_exec_h1(device, hwe, 16, 32, NO_SUSPEND,
+									  d->state, 0);
+			if (thread_number > 0)
+				threaded_test_exec_h2();
 			cleanup_d3(device);
 		}
 
@@ -842,7 +950,6 @@ igt_main
 			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
 			cleanup_d3(device);
 		}
-
 	}
 
 	igt_describe("Validate whether card is limited to d3hot,"
-- 
2.34.1

