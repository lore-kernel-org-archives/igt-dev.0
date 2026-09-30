Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2228ACA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76DB10E234;
	Wed, 30 Sep 2026 15:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaUL6viq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CADB10E234
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790782701; x=1822318701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RCz55fRCP/AzeHhxG59pnCE7F8eQoYAMe12LwQ8yQfc=;
 b=FaUL6viqKM83n44QjelnAShw/pKnlBjo52fHs9AiVAsfcYZ3OmBbXlJB
 XwK+dlK/Hh3w4kfItqWXrcu+niiLgmv/mRgY5lKrHVrrePDkI3pKxN9IC
 ZK1pszsGtssXUI862/TP/yJbDX9H2Gm78n2aUNN3lGsdAiuvh7/crZuKl
 M0ihOaj6wZ75ahwEBBxXZweLKozFXfi93LvdgosSc3K+c4SupotCHuVyE
 QWEzswIz6mNRvD+Zqv2p+CE801nQJwOHOm3BZrvF8HwJxjjC5jXAL2kP9
 jQRj4dHZ0kTXfXG4yLhsbDwLvN/aU3izPAXQdhrgY7wNbXPB2v3bvH9tL Q==;
X-CSE-ConnectionGUID: XyXlNKjASPWQWDyvrRq8Sw==
X-CSE-MsgGUID: Pj8P4aImTIOsS8MtDTDMsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102198144"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102198144"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:20 -0700
X-CSE-ConnectionGUID: vfrX5NxmTiak/5cedQWkzQ==
X-CSE-MsgGUID: InGQsW0TTX6mb7aBVfdzkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279046849"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:18 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_err_injection: Add test for local
 Uncorrectable Error Injection through LSC Storage
Date: Wed, 30 Sep 2026 21:07:58 +0530
Message-ID: <20260930153755.2447513-8-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930153755.2447513-5-soham.purkait@intel.com>
References: <20260930153755.2447513-5-soham.purkait@intel.com>
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
 tests/intel/xe_cper.h          |  30 +++
 tests/intel/xe_err_injection.c | 344 ++++++++++++++++++++++++++++++++-
 tests/intel/xe_err_injection.h |  11 ++
 3 files changed, 381 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
index ff061d35b..dfc245016 100644
--- a/tests/intel/xe_cper.h
+++ b/tests/intel/xe_cper.h
@@ -11,12 +11,15 @@
 #define XE_CPER_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_error_cper"
 #define XE_CPER_ENABLE		XE_CPER_EVENT_DIR "/enable"
 #define XE_CPER_FORMAT		XE_CPER_EVENT_DIR "/format"
+#define XE_RESET_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_exec_queue_reset"
+#define XE_RESET_ENABLE		XE_RESET_EVENT_DIR "/enable"
 #define TRACEFS_TRACE_PIPE	TRACEFS_ROOT "/trace_pipe"
 #define TRACEFS_TRACE		TRACEFS_ROOT "/trace"
 #define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT "/trace"
 
 /* Timeout waiting for a trace event to appear (seconds) */
 #define CPER_EVENT_TIMEOUT_SEC		10
+#define RESET_EVENT_TIMEOUT_SEC		10
 
 /* Standard UEFI CPER record header signature: "CPER" in little-endian */
 #define CPER_SIG_RECORD			0x52455043U  /* "CPER" */
@@ -39,4 +42,31 @@
 #define CPER_INTEL_PUB_HDR_SIZE		328U
 #define UUID_SIZE			16U
 
+#define CPER_REC_ERROR_SEVERITY_OFF	12U
+#define CPER_REC_RECORD_LENGTH_OFF	20U
+
+#define CPER_SEC_SEVERITY_OFF		176U
+
+#define CPER_INTEL_HDR_OFFSET		(CPER_RECORD_HEADER_SIZE + \
+					 CPER_SECTION_DESC_SIZE)
+#define CPER_INTEL_ERR_TYPE_OFF		0U
+#define CPER_INTEL_ERR_COMPONENT_OFF	1U
+
+#define CPER_EINFO_OFFSET		(CPER_INTEL_HDR_OFFSET + \
+					 CPER_INTEL_PUB_HDR_SIZE)
+#define CPER_EINFO_EVT_COUNT_OFF	20U
+#define CPER_EINFO_HDR_SIZE		24U
+#define CPER_PRIV_ENTRY_METADATA_OFF	12U
+
+#define XE_RAS_SEV_CORRECTABLE		1U
+#define XE_RAS_SEV_UNCORRECTABLE	2U
+#define XE_RAS_SEV_INFORMATIONAL	3U
+
+#define XE_RAS_COMP_DEVICE_MEMORY	1U
+#define XE_RAS_COMP_CORE_COMPUTE	2U
+
+#define CORE_COMPUTE_UNCORR_TYPE_SHIFT	25U
+#define CORE_COMPUTE_UNCORR_TYPE_MASK	0x3U
+#define GLOBAL_UNCORR_ERROR		2U
+
 #endif /* XE_CPER_H */
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 6dcc2b1c4..d3e63fa8a 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -16,6 +16,8 @@
 #include <string.h>
 #include <time.h>
 #include <fcntl.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
 #include <unistd.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -42,6 +44,18 @@ enum {
 
 time_t event_timeout = 10 * 1000; /* 10 seconds */
 
+#define LSC_HEAVY_WL_ITERS	64
+#define LSC_HEAVY_WL_ELEMS	(256 * 1024)
+
+static bool tracefs_event_exists(void);
+static bool tracefs_reset_event_exists(void);
+static void tracefs_enable_xe_cper(bool enable);
+static void tracefs_enable_xe_reset(bool enable);
+static void tracefs_clear_trace(void);
+static void poll_for_cper_and_reset(int timeout_sec,
+				    char **out_cper, char **out_reset);
+static void validate_local_uc_nonfatal_cper(const char *event_line);
+
 /* Cleanup helper for injection test functions */
 #define CLEANUP_ON_ERROR(ctx, fw_handle) do { \
 	igt_drm_netlink_cleanup(&ctx); \
@@ -68,6 +82,44 @@ static void run_xe_compute_on_all_engines(int fd, bool state)
 	}
 }
 
+static void run_heavy_lsc_workload(int fd, bool forward_failure)
+{
+	int err;
+
+	igt_info("Running heavy LSC workload %s (%d iters, %u elems) on all compute engines\n",
+		 forward_failure ? "validate" : "stimulus",
+		 LSC_HEAVY_WL_ITERS, LSC_HEAVY_WL_ELEMS);
+
+	igt_fork(child, 1) {
+		struct drm_xe_engine_class_instance *hwe;
+		struct user_execenv env = { .array_size = LSC_HEAVY_WL_ELEMS };
+
+		if (!forward_failure) {
+			int devnull = open("/dev/null", O_WRONLY);
+
+			if (devnull >= 0) {
+				dup2(devnull, STDOUT_FILENO);
+				dup2(devnull, STDERR_FILENO);
+				close(devnull);
+			}
+		}
+
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+			for (int i = 0; i < LSC_HEAVY_WL_ITERS; i++)
+				xe_run_intel_compute_kernel_on_engine(fd, hwe, &env,
+								      EXECENV_PREF_SYSTEM);
+		}
+	}
+	err = __igt_waitchildren();
+
+	if (forward_failure)
+		igt_assert_f(err == 0,
+			     "Post-recovery heavy LSC workload failed (err=%d)\n",
+			     err);
+}
+
 static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
 {
 	xe_mmio_write32(mmio, reg, value);
@@ -106,6 +158,58 @@ static void release_steering_semaphore(struct xe_mmio *mmio)
 			STEER_SEMAPHORE_MGSR_3D_VALUE);
 }
 
+static void acquire_steer_sem(struct xe_mmio *mmio, unsigned long timeout_ms)
+{
+	if (timeout_ms == 0) {
+		igt_info("Waiting indefinitely for steering semaphore (0x%X)\n",
+			 STEER_SEMAPHORE_MGSR_3D);
+		while (xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D) !=
+		       STEER_SEMAPHORE_MGSR_3D_VALUE)
+			usleep(STEER_SEM_POLL_INTERVAL_MS * 1000);
+	} else {
+		bool acquired;
+
+		acquired = igt_wait(xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D) ==
+				    STEER_SEMAPHORE_MGSR_3D_VALUE,
+				    timeout_ms,
+				    STEER_SEM_POLL_INTERVAL_MS);
+		igt_assert_f(acquired,
+			     "Timed out (%lums) waiting for steering semaphore (0x%X) to be acquired\n",
+			     timeout_ms, STEER_SEMAPHORE_MGSR_3D);
+	}
+	igt_info("Steering semaphore acquired.\n");
+}
+
+static void release_steer_sem(struct xe_mmio *mmio)
+{
+	xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
+			STEER_SEMAPHORE_MGSR_3D_VALUE);
+	igt_info("Steering semaphore released.\n");
+}
+
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
 static int acquire_forcewake(int fd)
 {
 	int fw_handle;
@@ -308,6 +412,116 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 	gt_uc_wkr_parity_recovered = true;
 }
 
+/**
+ * SUBTEST: test_GT-local-Uncorrectable-lsc-storage-err
+ * Description: Inject GT Local Uncorrectable Unicast LSC storage error and
+ * verify recovery via CPER and engine reset trace events.
+ * Functionality: error injection
+ */
+static void lsc_storage_uc_err_injection(struct xe_mmio *mmio, int fd)
+{
+	int fw_handle;
+	uint32_t error_counter_before;
+	uint32_t error_counter_after;
+	uint32_t saved_powergate;
+	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
+	uint32_t error_id = ERROR_ID_CORE_COMPUTE;
+	char *cper_event_line = NULL;
+	char *reset_event_line = NULL;
+	int poll_timeout;
+
+	igt_require_f(tracefs_event_exists(),
+		      "xe_error_cper trace event not available; CPER-based "
+		      "verification requires it\n");
+	igt_require_f(tracefs_reset_event_exists(),
+		      "xe_exec_queue_reset trace event not available; engine-reset "
+		      "verification requires it\n");
+
+	fw_handle = acquire_forcewake(fd);
+	saved_powergate = disable_powergate(mmio);
+
+	error_counter_before = get_counter(node_id, error_id);
+
+	tracefs_enable_xe_cper(true);
+	tracefs_enable_xe_reset(true);
+	tracefs_clear_trace();
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
+	run_heavy_lsc_workload(fd, false);
+
+	restore_powergate(mmio, saved_powergate);
+	release_forcewake(fw_handle);
+
+	poll_timeout = max(CPER_EVENT_TIMEOUT_SEC, RESET_EVENT_TIMEOUT_SEC);
+	poll_for_cper_and_reset(poll_timeout, &cper_event_line, &reset_event_line);
+
+	tracefs_enable_xe_cper(false);
+	tracefs_enable_xe_reset(false);
+	tracefs_clear_trace();
+
+	igt_assert_f(cper_event_line,
+		     "No xe_error_cper trace event received within %d seconds "
+		     "after LSC uncorrectable injection\n", poll_timeout);
+	igt_info("Captured CPER trace event: %s\n", cper_event_line);
+	validate_local_uc_nonfatal_cper(cper_event_line);
+	free(cper_event_line);
+
+	igt_assert_f(reset_event_line,
+		     "No xe_exec_queue_reset trace event received within %d seconds "
+		     "after LSC uncorrectable injection; engine reset did not occur\n",
+		     poll_timeout);
+	igt_info("Captured engine reset trace event: %s\n", reset_event_line);
+	free(reset_event_line);
+
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
+	run_heavy_lsc_workload(fd, true);
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
@@ -585,6 +799,16 @@ static bool tracefs_event_exists(void)
 	return stat(XE_CPER_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
 }
 
+/**
+ * tracefs_reset_event_exists - check xe_exec_queue_reset event directory is present
+ */
+static bool tracefs_reset_event_exists(void)
+{
+	struct stat st;
+
+	return stat(XE_RESET_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
+}
+
 /**
  * tracefs_enable_xe_cper - enable / disable the xe_error_cper trace event
  */
@@ -601,6 +825,22 @@ static void tracefs_enable_xe_cper(bool enable)
 	close(fd);
 }
 
+/**
+ * tracefs_enable_xe_reset - enable / disable the xe_exec_queue_reset trace event
+ */
+static void tracefs_enable_xe_reset(bool enable)
+{
+	int fd;
+	const char val = enable ? '1' : '0';
+
+	fd = open(XE_RESET_ENABLE, O_WRONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_RESET_ENABLE,
+		     strerror(errno));
+	igt_assert_eq(write(fd, &val, 1), 1);
+	igt_info("Trace event %sabled: %s\n", enable ? "en" : "dis", XE_RESET_ENABLE);
+	close(fd);
+}
+
 /**
  * tracefs_clear_trace - wipe the trace ring buffer
  */
@@ -667,15 +907,15 @@ static char *wait_for_cper_event(int drm_fd)
 	tracefs_clear_trace();
 
 	/* Call igt_get_error_counter to dump the cper in tracefs */
-	ret = igt_init_nl_socket(&ctx);
+	ret = igt_drm_netlink_init(&ctx);
 	if (ret < 0)
 		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
 
 	ctx.node_id = 0;
 	ctx.error_id = 1;
-	ret = igt_get_error_counter(&ctx);
+	ret = igt_drm_netlink_get_error_counter(&ctx);
 	if (ret < 0) {
-		igt_cleanup_nl_socket(&ctx);
+		igt_drm_netlink_cleanup(&ctx);
 		igt_assert_f(false, "Failed to query GT correctable error counter\n");
 	}
 
@@ -695,7 +935,7 @@ static char *wait_for_cper_event(int drm_fd)
 		free(trace);
 	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
 
-	igt_cleanup_nl_socket(&ctx);
+	igt_drm_netlink_cleanup(&ctx);
 	tracefs_enable_xe_cper(false);
 	tracefs_clear_trace();
 
@@ -777,6 +1017,98 @@ static void format_guid(const uint8_t guid[UUID_SIZE], char string[37])
 		 guid[14], guid[15]);
 }
 
+/**
+ * poll_for_cper_and_reset - scan the trace buffer for both an xe_error_cper
+ * and an xe_exec_queue_reset event, up to @timeout_sec seconds. On return,
+ * *out_cper / *out_reset hold a malloc'd copy of the first matching line
+ * for each, or NULL if not seen. Caller must free each non-NULL pointer.
+ */
+static void poll_for_cper_and_reset(int timeout_sec,
+				    char **out_cper, char **out_reset)
+{
+	char *trace, *line, *saveptr;
+	int elapsed = 0;
+
+	*out_cper = NULL;
+	*out_reset = NULL;
+
+	do {
+		sleep(1);
+		elapsed++;
+		trace = tracefs_read_trace();
+
+		for (line = strtok_r(trace, "\n", &saveptr); line;
+		     line = strtok_r(NULL, "\n", &saveptr)) {
+			if (!*out_cper && strstr(line, "xe_error_cper:"))
+				*out_cper = strdup(line);
+			if (!*out_reset && strstr(line, "xe_exec_queue_reset:"))
+				*out_reset = strdup(line);
+			if (*out_cper && *out_reset)
+				break;
+		}
+		free(trace);
+	} while ((!*out_cper || !*out_reset) && elapsed < timeout_sec);
+}
+
+static void validate_local_uc_nonfatal_cper(const char *event_line)
+{
+	const char *cper_raw;
+	uint32_t rec_sev, sec_sev, rec_len, evt_count, err_hdr;
+	uint32_t einfo_off, entry_off;
+	uint8_t err_type, err_comp, uncorr_type;
+
+	cper_raw = parse_cper_event_field(event_line, "cper_raw");
+	igt_assert_f(cper_raw, "cper_raw field not found in trace event\n");
+
+	rec_len = hexbuf_get_u32le(cper_raw, CPER_REC_RECORD_LENGTH_OFF);
+
+	rec_sev = hexbuf_get_u32le(cper_raw, CPER_REC_ERROR_SEVERITY_OFF);
+	sec_sev = hexbuf_get_u32le(cper_raw, CPER_SEC_SEVERITY_OFF);
+	igt_assert_f(rec_sev != CPER_SEV_FATAL,
+		     "CPER record error_severity is FATAL (%u); expected non-fatal\n",
+		     rec_sev);
+	igt_assert_f(rec_sev == sec_sev,
+		     "section_severity(%u) != record error_severity(%u)\n",
+		     sec_sev, rec_sev);
+	igt_assert_f(rec_sev == CPER_SEV_RECOVERABLE,
+		     "Expected UEFI severity CPER_SEV_RECOVERABLE(%u) for uncorrectable "
+		     "non-fatal, got %u\n", CPER_SEV_RECOVERABLE, rec_sev);
+
+	err_type = hexbuf_get_byte(cper_raw,
+				   CPER_INTEL_HDR_OFFSET + CPER_INTEL_ERR_TYPE_OFF);
+	err_comp = hexbuf_get_byte(cper_raw,
+				   CPER_INTEL_HDR_OFFSET + CPER_INTEL_ERR_COMPONENT_OFF);
+	igt_assert_f(err_type == XE_RAS_SEV_UNCORRECTABLE,
+		     "Intel error_class.error_type=%u; expected XE_RAS_SEV_UNCORRECTABLE(%u)\n",
+		     err_type, XE_RAS_SEV_UNCORRECTABLE);
+	igt_assert_f(err_comp == XE_RAS_COMP_CORE_COMPUTE,
+		     "Intel error_class.error_component=%u; expected XE_RAS_COMP_CORE_COMPUTE(%u)\n",
+		     err_comp, XE_RAS_COMP_CORE_COMPUTE);
+
+	einfo_off = CPER_EINFO_OFFSET;
+	entry_off = einfo_off + CPER_EINFO_HDR_SIZE;
+	igt_assert_f(rec_len >= entry_off + CPER_PRIV_ENTRY_METADATA_OFF + sizeof(uint32_t),
+		     "record_length %u too small to contain event entry error_log_header\n",
+		     rec_len);
+
+	evt_count = hexbuf_get_u32le(cper_raw, einfo_off + CPER_EINFO_EVT_COUNT_OFF);
+	igt_assert_f(evt_count > 0,
+		     "event_queue_count is 0; cannot determine local/global scope\n");
+
+	err_hdr = hexbuf_get_u32le(cper_raw, entry_off + CPER_PRIV_ENTRY_METADATA_OFF);
+	uncorr_type = (err_hdr >> CORE_COMPUTE_UNCORR_TYPE_SHIFT) &
+		      CORE_COMPUTE_UNCORR_TYPE_MASK;
+	igt_assert_f(uncorr_type != GLOBAL_UNCORR_ERROR,
+		     "Expected local uncorrectable error (uncorr_type != %u), got %u "
+		     "(error_log_header=0x%08x)\n",
+		     GLOBAL_UNCORR_ERROR, uncorr_type, err_hdr);
+
+	igt_info("CPER classified as local uncorrectable non-fatal: "
+		 "cper_sev=%u ras_sev=%u component=%u uncorr_type=%u "
+		 "(error_log_header=0x%08x, evt_count=%u)\n",
+		 rec_sev, err_type, err_comp, uncorr_type, err_hdr, evt_count);
+}
+
 /**
  * SUBTEST: cper-tracefs-event-format
  * Description: Verify that the xe_error_cper tracefs event exists under
@@ -1103,6 +1435,10 @@ int igt_main()
 		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
 	}
 
+	igt_describe("Inject GT Local Uncorrectable Unicast LSC storage error and verify recovery via CPER.");
+	igt_subtest("test_GT-local-Uncorrectable-lsc-storage-err")
+		lsc_storage_uc_err_injection(&mmio, fd);
+
 	igt_describe("Inject GT correctable error and validate error-report event with threshold set to 1.");
 	igt_subtest("test_l2-bank-corr-err-threshold-1")
 		inject_error("test_l2-bank-corr-err-threshold-1", &mmio, fd);
diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
index a4b99711e..9b6f67cec 100644
--- a/tests/intel/xe_err_injection.h
+++ b/tests/intel/xe_err_injection.h
@@ -21,6 +21,17 @@
 #define STEER_SEMAPHORE_MGSR_3D 0x00FD0
 #define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
 
+#define STEER_SEM_POLL_TIMEOUT_MS 1000
+#define STEER_SEM_POLL_INTERVAL_MS 1
+
+#define MC_PKT_CTRL_MGSR_3D_ARM_VALUE 0x1
+
+#define LSC_STORAGE_ERR_INJ_TDL_GFX_ADDRESS 0xE760
+#define LSC_STORAGE_ERR_INJ_TDL_GFX_VALUE 0x8
+
+#define POWERGATE_ENABLE_ADDRESS 0xA210
+#define POWERGATE_ENABLE_DISABLE_ALL_VALUE 0x0
+
 /* Node types for error counters*/
 #define NODE_ID_CORRECTABLE_ERROR 0
 #define NODE_ID_UNCORRECTABLE_ERROR 1
-- 
2.43.0

