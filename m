Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C7CEBF9C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 11:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609C10E1DB;
	Fri, 27 Sep 2024 11:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXIgY1Or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B1710E1DB
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727437098; x=1758973098;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 content-transfer-encoding;
 bh=i2p04AAo/5HW5rceADlYT7FanHGvRaDATUsQw4be9Xo=;
 b=YXIgY1OrRpcB9d9D9F6YeSLVdCL/4RULlDZtX2INatdhBAsSSh+CTcQr
 rLv6+Vf10o0tBtiyrA1BORBONo7BcLyJkPPJzr6eRGBdWHPSBecuiIvJm
 unG8Fgf8gNYys9DT56veG5Y/6f14vtiuv7MuihEBK/3RB2NVsGQc8AeSn
 ytQfCNF/9yfDZth8olKCsP/pb0JlInXbhrH7/cnc3svy4Sp1wX6zlEW67
 lmO82xDHyDnyWSQPeM7NnJ48DGrNllTS72pvBA/9M1aow8aXgjXoZZzXY
 3zBNliaS7AQV3D6v7xnUvPWZU0Zn4FCUKum4m1i31DLcR/QEz3lSSx2RO A==;
X-CSE-ConnectionGUID: UyM2pi/uTseaKld6r76Zmw==
X-CSE-MsgGUID: 8OM2JlaeQ62nl3ECJqtRkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44092994"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="44092994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:38:17 -0700
X-CSE-ConnectionGUID: 5dv32KA/SoOZTOJ3OGwv2g==
X-CSE-MsgGUID: IgEJA3IeRmGDF3EGcYQpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77291269"
Received: from tomotoso-mobl1.amr.corp.intel.com (HELO [10.213.199.80])
 ([10.213.199.80])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:38:16 -0700
Message-ID: <573a9807-9687-4918-a234-e22dde568bbf@linux.intel.com>
Date: Fri, 27 Sep 2024 13:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [i-g-t PATCH V2] tests/intel/xe_pm: one suspend/resume cycle for all
 xe engines
Content-Language: en-US
In-Reply-To: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
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

Changes the behavior from running one suspend/resume cycle for each
xe engine to running a single suspend and resume cycle for all engines
considerably reducing the xe_pm run time.

V2: Fix race condition around child_ready and fix subject line

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_pm.c | 139 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c..066c5ddf4 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -54,6 +54,22 @@ typedef struct {
 uint64_t orig_threshold;
 int fw_handle = -1;
 
+static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
+static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
+static bool child_ready = false;
+
+typedef struct {
+	device_t device;
+	struct drm_xe_engine_class_instance *eci;
+	int n_exec_queues;
+	int n_execs;
+	enum igt_suspend_state s_state;
+	enum igt_acpi_d_state d_state;
+	unsigned int flags;
+} test_exec_args;
+
 static void dpms_on_off(device_t device, int mode)
 {
 	int i;
@@ -273,6 +289,7 @@ static void close_fw_handle(int sig)
  * @prefetch:	prefetch
  * @unbind-all:	unbind-all
  */
+
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
@@ -396,10 +413,16 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
 		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
-			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
-				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-
-			igt_system_suspend_autoresume(s_state, test);
+			/* Tell the parent that we are ready for a suspend and resume */
+			pthread_mutex_lock(&child_ready_lock);
+			child_ready = true;
+			pthread_cond_signal(&child_ready_cond);
+			pthread_mutex_unlock(&child_ready_lock);
+
+			/* Wait for the suspend and resume to finish */
+			pthread_mutex_lock(&suspend_lock);
+			pthread_cond_wait(&suspend_cond, &suspend_lock);
+			pthread_mutex_unlock(&suspend_lock);
 		}
 	}
 
@@ -440,6 +463,81 @@ NULL));
 			   active_time);
 		igt_assert(in_d3(device, d_state));
 	}
+
+	/* Tell the parent that we are ready. This should run only when the code
+	 * is not supposed to suspend.
+	 */
+	if (n_execs <= 1 || s_state == NO_SUSPEND)  {
+		pthread_mutex_lock(&child_ready_lock);
+		child_ready = true;
+		pthread_cond_signal(&child_ready_cond);
+		pthread_mutex_unlock(&child_ready_lock);
+	}
+}
+
+/* Wrap test_exec() function arguments in a struct for pthread_create */
+static void*
+test_exec_wrapper(void *args)
+{
+	test_exec_args *exec_args = (test_exec_args *)args;
+
+	test_exec(exec_args->device, exec_args->eci, exec_args->n_exec_queues,
+		exec_args->n_execs, exec_args->s_state, exec_args->d_state,
+		exec_args->flags);
+
+	return NULL;
+}
+
+/* Do one suspend and resume cycle for all xe engines.
+ *  - For each xe engine: Create a thread for test_exec
+ *  - Pause the thread where it expects to suspend and resume
+ *  - Wait for all threads to reach the pause
+ *  - Run one suspend and resume cycle
+ *  - Wake up all threads
+ *  - Wait the threads to complete
+ */
+static void
+threaded_test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
+	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
+	  enum igt_acpi_d_state d_state, unsigned int flags)
+{
+	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ? SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+	int active_threads = 0;
+	pthread_t threads[65]; /* MAX_ENGINES + 1 */
+	test_exec_args args;
+
+	xe_for_each_engine(device.fd_xe, eci) {
+		args.device = device;
+		args.eci = eci;
+		args.n_exec_queues = n_exec_queues;
+		args.n_execs = n_execs;
+		args.s_state = s_state;
+		args.d_state = d_state;
+		args.flags = flags;
+
+		pthread_create(&threads[active_threads], NULL, test_exec_wrapper, &args);
+		active_threads++;
+
+		pthread_mutex_lock(&child_ready_lock);
+		while(!child_ready)
+			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
+		child_ready = false;
+		pthread_mutex_unlock(&child_ready_lock);
+	}
+
+	if (n_execs > 1 && s_state != NO_SUSPEND) {
+		igt_system_suspend_autoresume(s_state, test);
+
+		sleep(2);
+		pthread_mutex_lock(&suspend_lock);
+		pthread_cond_broadcast(&suspend_cond);
+		pthread_mutex_unlock(&suspend_lock);
+
+		for (int i = 0; i < active_threads; i++)
+			pthread_join(threads[i], NULL);
+
+		active_threads = 0;
+	}
 }
 
 /**
@@ -718,8 +816,7 @@ igt_main
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
+		threaded_test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -731,14 +828,11 @@ igt_main
 		igt_subtest_f("%s-basic", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-
 			igt_system_suspend_autoresume(s->state, test);
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM, 0);
+			threaded_test_exec(device, hwe, 1, 2, s->state, NO_RPM, 0);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -746,31 +840,23 @@ igt_main
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
 			igt_system_suspend_autoresume(s->state, test);
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, NO_SUSPEND,
-					  NO_RPM, 0);
+			threaded_test_exec(device, hwe, 1, 2, NO_SUSPEND, NO_RPM, 0);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32, s->state,
-					  NO_RPM, 0);
+			threaded_test_exec(device, hwe, 16, 32, s->state, NO_RPM, 0);
 		}
 
 		for (const struct vm_op *op = vm_op; op->name; op++) {
 			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
-				xe_for_each_engine(device.fd_xe, hwe)
-					test_exec(device, hwe, 16, 32, s->state,
-						  NO_RPM, op->flags);
+				threaded_test_exec(device, hwe, 16, 32, s->state, NO_RPM, op->flags);
 			}
 		}
 
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-				xe_for_each_engine(device.fd_xe, hwe)
-					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM, 0);
+				threaded_test_exec(device, hwe, 1, 2, s->state, NO_RPM, 0);
 				cleanup_d3(device);
 			}
 		}
@@ -792,17 +878,13 @@ igt_main
 
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state, 0);
+			threaded_test_exec(device, hwe, 1, 1, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32,
-					  NO_SUSPEND, d->state, 0);
+			threaded_test_exec(device, hwe, 16, 32, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
@@ -842,7 +924,6 @@ igt_main
 			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
 			cleanup_d3(device);
 		}
-
 	}
 
 	igt_describe("Validate whether card is limited to d3hot,"
-- 
2.34.1

