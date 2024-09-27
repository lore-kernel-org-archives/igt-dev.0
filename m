Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95150CEBF8A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 09:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880610ECAD;
	Fri, 27 Sep 2024 09:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6EsA9Yr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7010F10ECA3
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727430263; x=1758966263;
 h=message-id:date:mime-version:from:subject:to:
 content-transfer-encoding;
 bh=jZdQeBQydIgpB0BS6TtrXop7VxZnbbrar6QjQVZX1Uk=;
 b=j6EsA9YrWR7XP/iUt5eeuYWLaSeRRWdM953P/ny+WWOAmyq/uW2Kn14y
 2xIpCJ9ISxddEnTJ4ZmZyLOZPrc9ZphiPaDKNyi+xeekMXQBpv/ea/SqY
 9wuXskF8SChVqgz32VwWM7U7JniZx21yxfUsiw617zZQqJ8SdWb0ETD5b
 a6guUuCkOIFMw94utgtAfVYbeDDFgLZlSJgKcNN8HKxsU2z2w7CjbwuFK
 zaVXRTQRgpd3prJzpB5w7AuGGLG6so0fiWmkiu/2mx3H45apTi82oTMqO
 6r3tootqSoCiYfbxJj3kM/peKeK65myEi4jw9HEQYR8+/tfxRu1N3k9SN Q==;
X-CSE-ConnectionGUID: ZlfluwvARZu44ZEFE+Ax6g==
X-CSE-MsgGUID: HyqyKSq2TXa16RHwC3uzmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26441020"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26441020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:44:23 -0700
X-CSE-ConnectionGUID: QaohYbPsR0WygGKUfHLFVg==
X-CSE-MsgGUID: /1N0aKzZTfywpwlp8+2EPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72891893"
Received: from tomotoso-mobl1.amr.corp.intel.com (HELO [10.213.199.80])
 ([10.213.199.80])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 02:44:22 -0700
Message-ID: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
Date: Fri, 27 Sep 2024 11:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH] tests/intel/xe_pm: one suspend/resume cycle for all xe engines
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

Changes the behavior from running one suspend/resume cycle for each
xe engine to running a single suspend and resume cycle for all engines
considerably reducing the xe_pm run time.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_pm.c | 135 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 106 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c..0189055d2 100644
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
 
@@ -440,6 +463,77 @@ NULL));
 			   active_time);
 		igt_assert(in_d3(device, d_state));
 	}
+
+	/* Tell the parent that we are ready */
+	pthread_mutex_lock(&child_ready_lock);
+	child_ready = true;
+	pthread_cond_signal(&child_ready_cond);
+	pthread_mutex_unlock(&child_ready_lock);
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
@@ -718,8 +812,7 @@ igt_main
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
+		threaded_test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -731,14 +824,11 @@ igt_main
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
@@ -746,31 +836,23 @@ igt_main
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
@@ -792,17 +874,13 @@ igt_main
 
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
 
@@ -842,7 +920,6 @@ igt_main
 			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
 			cleanup_d3(device);
 		}
-
 	}
 
 	igt_describe("Validate whether card is limited to d3hot,"
-- 
2.34.1

