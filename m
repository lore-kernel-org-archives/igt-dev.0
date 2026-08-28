Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D47C61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 18:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F105010E649;
	Fri, 28 Aug 2026 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVaTbUOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25710E647
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787940431; x=1819476431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mos7saGCKhcSy1rzPstzKGFdEDoRS2bVG6f8s3oEHmg=;
 b=WVaTbUOqg28hv+xrxRgQWvLiqlqv/fz5QBO62TmDtGRCAfl/MRuU6emD
 zGFvgvCvDdGmZyc7yNbal+6uy7OICy+jMVwKKXStNFHpeGPV3QmnBP8Mn
 /uLEAITMzEnr5/DtsM6boPIeSfcPUMdMFiC8MaVcW3zzh06XJAK5UVcZr
 bWyzJaQkTzWActDZib5/fufBxlyuDLf+8oeK8qw+q5YZBKTMRqyIYh504
 JuxZ9v66T1T5gtJsGysdi1kH9NDfT0k1pueuhYc5KbKiyiMaRaxE1b1uF
 xTjB/d8hS8PUNZx+XEfa6AliNGDUkP7vtIWqu1GMxAotj10LikM2IxWsg A==;
X-CSE-ConnectionGUID: Ybb89P06Saqkfoi17nXhEw==
X-CSE-MsgGUID: +UdnUtmCSNSboy/gMqtKtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88310035"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="88310035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:07:11 -0700
X-CSE-ConnectionGUID: 4xCtjpO+TmK8ENPGd0+ywQ==
X-CSE-MsgGUID: UZfzgfVNTQSfT2R8HecXgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="270167402"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:07:09 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_err_injection: Add test for local
 Uncorrectable Error Injection through LSC Storage
Date: Fri, 28 Aug 2026 23:36:23 +0530
Message-ID: <20260828180643.1707505-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828180643.1707505-4-soham.purkait@intel.com>
References: <20260828180643.1707505-4-soham.purkait@intel.com>
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

Local Uncorrectable Unicast LSC storage error injection driven by a heavy
LSC workload on all compute engines to trigger recovery post error
injection. Also validate error counter increment and post-recovery error
counter stability.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_err_injection.c | 187 +++++++++++++++++++++++++++++++++
 tests/intel/xe_err_injection.h |  11 ++
 2 files changed, 198 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index d17d049f4..56e5a600d 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -16,6 +16,8 @@
 #include <string.h>
 #include <time.h>
 #include <fcntl.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
 #include <unistd.h>
 
 #include "igt.h"
@@ -30,6 +32,9 @@
 #include "xe/xe_query.h"
 #include "xe_err_injection.h"
 
+#define LSC_HEAVY_WL_ITERS	64
+#define LSC_HEAVY_WL_ELEMS	(256 * 1024)
+
 enum {
 	RECOVERY_SUCCESS = 1,
 	RECOVERY_FAILED,
@@ -64,6 +69,54 @@ static void run_xe_compute_on_all_engines(int fd, bool state)
 	}
 }
 
+static void run_heavy_lsc_workload_on_all_engines(int fd)
+{
+	pid_t pid;
+	int status = 0;
+
+	igt_info("Running heavy LSC workload (%d iters, %u elems) on all compute engines\n",
+		 LSC_HEAVY_WL_ITERS, LSC_HEAVY_WL_ELEMS);
+
+	pid = fork();
+	igt_assert_f(pid >= 0, "fork() failed: %m\n");
+
+	if (pid == 0) {
+		struct drm_xe_engine_class_instance *hwe;
+		struct user_execenv env = { };
+		int devnull, i;
+
+		devnull = open("/dev/null", O_WRONLY);
+		if (devnull >= 0) {
+			dup2(devnull, STDOUT_FILENO);
+			dup2(devnull, STDERR_FILENO);
+			close(devnull);
+		}
+
+		env.array_size = LSC_HEAVY_WL_ELEMS;
+
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			for (i = 0; i < LSC_HEAVY_WL_ITERS; i++)
+				xe_run_intel_compute_kernel_on_engine(fd, hwe,
+								      &env,
+								      EXECENV_PREF_SYSTEM);
+		}
+		_exit(0);
+	}
+
+	while (waitpid(pid, &status, 0) < 0 && errno == EINTR)
+		;
+
+	if (WIFEXITED(status))
+		igt_info("Heavy LSC workload child exited (status=%d)\n",
+			 WEXITSTATUS(status));
+	else if (WIFSIGNALED(status))
+		igt_info("Heavy LSC workload child killed by signal %d\n",
+			 WTERMSIG(status));
+}
+
 static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
 {
 	xe_mmio_write32(mmio, reg, value);
@@ -83,6 +136,62 @@ static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
 	xe_mmio_write32(mmio, reg_addr, regval);
 }
 
+static uint32_t disable_powergate(struct xe_mmio *mmio)
+{
+	uint32_t prev = xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS);
+
+	xe_mmio_write32(mmio, POWERGATE_ENABLE_ADDRESS,
+			POWERGATE_ENABLE_DISABLE_ALL_VALUE);
+	igt_info("POWERGATE_ENABLE (0x%X): 0x%08x -> 0x%08x (all PG disabled)\n",
+		 POWERGATE_ENABLE_ADDRESS, prev,
+		 xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS));
+
+	return prev;
+}
+
+static void restore_powergate(struct xe_mmio *mmio, uint32_t saved_val)
+{
+	uint32_t cur = xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS);
+
+	xe_mmio_write32(mmio, POWERGATE_ENABLE_ADDRESS, saved_val);
+	igt_info("POWERGATE_ENABLE (0x%X): 0x%08x -> 0x%08x (PG restored)\n",
+		 POWERGATE_ENABLE_ADDRESS, cur,
+		 xe_mmio_read32(mmio, POWERGATE_ENABLE_ADDRESS));
+}
+
+static void acquire_steer_sem(struct xe_mmio *mmio, unsigned long timeout_ms)
+{
+	if (timeout_ms == 0) {
+		igt_info("Waiting indefinitely for steering semaphore (0x%X)\n",
+			 STEER_SEM_ADDRESS);
+		while (xe_mmio_read32(mmio, STEER_SEM_ADDRESS) !=
+		       STEER_SEM_ACQUIRED_VALUE)
+			usleep(STEER_SEM_POLL_INTERVAL_MS * 1000);
+	} else {
+		bool acquired;
+
+		acquired = igt_wait(xe_mmio_read32(mmio, STEER_SEM_ADDRESS) ==
+				    STEER_SEM_ACQUIRED_VALUE,
+				    timeout_ms,
+				    STEER_SEM_POLL_INTERVAL_MS);
+		igt_assert_f(acquired,
+			     "Timed out (%lums) waiting for steering semaphore (0x%X) to be acquired; last read=0x%08x\n",
+			     timeout_ms, STEER_SEM_ADDRESS,
+			     xe_mmio_read32(mmio, STEER_SEM_ADDRESS));
+	}
+	igt_info("Steering semaphore acquired (0x%X = 0x%08x)\n",
+		 STEER_SEM_ADDRESS,
+		 xe_mmio_read32(mmio, STEER_SEM_ADDRESS));
+}
+
+static void release_steer_sem(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, STEER_SEM_ADDRESS, STEER_SEM_ACQUIRED_VALUE);
+	igt_info("Steering semaphore released (0x%X = 0x%08x)\n",
+		 STEER_SEM_ADDRESS,
+		 xe_mmio_read32(mmio, STEER_SEM_ADDRESS));
+}
+
 static int acquire_forcewake(int fd)
 {
 	int fw_handle;
@@ -283,6 +392,80 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/**
+ * SUBTEST: test_GT-local-Uncorrectable-lsc-storage-err
+ * Description: GT Local Uncorrectable Unicast LSC storage error injection
+ * Functionality: error injection
+ */
+static void lsc_storage_uc_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before;
+	uint32_t error_counter_after;
+	uint32_t saved_powergate;
+	uint32_t node_id = 1;
+	uint32_t error_id = 1;
+
+	fw_handle = acquire_forcewake(fd);
+	saved_powergate = disable_powergate(mmio);
+
+	error_counter_before = get_counter(node_id, error_id);
+
+	acquire_steer_sem(mmio, STEER_SEM_POLL_TIMEOUT_MS);
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		  MC_PKT_CTRL_MGSR_3D_ARM_VALUE);
+	write_reg(mmio, LSC_STORAGE_ERR_INJ_TDL_GFX_ADDRESS,
+		  LSC_STORAGE_ERR_INJ_TDL_GFX_VALUE);
+	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS,
+		  MC_PKT_CTRL_MGSR_3D_VALUE);
+	release_steer_sem(mmio);
+
+	igt_info("Injected GT Local Uncorrectable Unicast LSC Storage error\n");
+
+	run_heavy_lsc_workload_on_all_engines(fd);
+
+	restore_powergate(mmio, saved_powergate);
+	release_forcewake(fw_handle);
+	print_aer_recovery_status();
+	error_counter_after = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before != UINT32_MAX &&
+		     error_counter_after != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     error_counter_before, error_counter_after);
+
+	igt_info("error counter: before injection=%u after injection=%u\n",
+		 error_counter_before, error_counter_after);
+
+	igt_assert_f(error_counter_after > error_counter_before,
+		     "GT Local Uncorrectable Unicast LSC storage error injection "
+		     "failed: before injection=%u after injection=%u\n",
+		     error_counter_before, error_counter_after);
+
+	igt_info("Post recovery: re-running heavy LSC workload with no injection\n");
+	error_counter_before = get_counter(node_id, error_id);
+	run_heavy_lsc_workload_on_all_engines(fd);
+	error_counter_after = get_counter(node_id, error_id);
+
+	igt_assert_f(error_counter_before != UINT32_MAX &&
+		     error_counter_after != UINT32_MAX,
+		     "Failed to fetch valid Post recovery error counters: before=%u after=%u\n",
+		     error_counter_before, error_counter_after);
+
+	igt_info("Post recovery error counter: before wl=%u after wl=%u\n",
+		 error_counter_before, error_counter_after);
+
+	igt_assert_f(error_counter_before == error_counter_after,
+		     "Post recovery LSC workload unexpectedly bumped error counter: "
+		     "before=%u after=%u\n",
+		     error_counter_before, error_counter_after);
+
+	igt_info("Post recovery LSC workload clean: counters match (%u)\n",
+		 error_counter_after);
+
+	igt_info("GT Local Uncorrectable Unicast LSC storage error injection successful\n");
+}
+
 /* Inject a GT correctable error */
 static void l2_bank_corr_err_injection(struct xe_mmio *mmio, int fd)
 {
@@ -604,6 +787,10 @@ int igt_main()
 		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
 	}
 
+	igt_describe("Inject GT Local Uncorrectable Unicast LSC storage error.");
+	igt_subtest("test_GT-local-Uncorrectable-lsc-storage-err")
+		lsc_storage_uc_err_injection(&mmio, fd);
+
 	igt_describe("Inject GT correctable error and validate error-notify event with threshold set to 1.");
 	igt_subtest("test_l2-bank-corr-err-threshold-1")
 		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
index 1a9ea2f2e..03c5a14ee 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -7,11 +7,22 @@
 #define XE_ERR_INJECTION_H
 
 /* GT Uncorrectable unicast worker command parity error injection */
+#define STEER_SEM_ADDRESS 0x00FD0
+#define STEER_SEM_ACQUIRED_VALUE 0x1
+#define STEER_SEM_POLL_TIMEOUT_MS 1000
+#define STEER_SEM_POLL_INTERVAL_MS 1
 #define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
 #define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
 #define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
 #define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
 
+#define MC_PKT_CTRL_MGSR_3D_ARM_VALUE 0x1
+#define LSC_STORAGE_ERR_INJ_TDL_GFX_ADDRESS 0xE760
+#define LSC_STORAGE_ERR_INJ_TDL_GFX_VALUE 0x8
+
+#define POWERGATE_ENABLE_ADDRESS 0xA210
+#define POWERGATE_ENABLE_DISABLE_ALL_VALUE 0x0
+
 #define POST_RECOVERY_WL 1
 #define POST_ARMING_INJECTION_WL 0
 
-- 
2.43.0

