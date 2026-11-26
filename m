Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2E606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c9xHKb+4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371A210FF36;
	Thu, 26 Nov 2026 07:52:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D65C10E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679225; x=1827215225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9yuGXe0YjKHgeUonQwVWZUs/q6oPJT9dIJL5V2/apE=;
 b=c9xHKb+4xFivXi10KtfntwTMT9RDPwKMAV1Y6C4g5EcMLIcD4Ls9ydR9
 uzI487p4dyFNMHupHXazho6/8JS4fc5rKm43mX7DjOO41LxfIT4zPWPuX
 dFE8BO+QQmqdu4R49ofFkvcONd0BTDHETfU75LNqyhA/mBR0k4yisCQnp
 Bk5n/5tHNbo4KATvbZyItZ8udsnsn2UTQUxSvlauDu5dSsoeint98dV/l
 AwfeJHxk0gqwj6inMBQKNqDeT1GHJ0hWkbKYYenJbSoC/RQUXgH4fzynF
 9XLk1hb1/tvDlE9uQOqDTu7HImR9mbTdG4JkSb1Couvmae02cv/6ZgDF+ Q==;
X-CSE-ConnectionGUID: 6oWFlGWhRoubPW3K03RyHw==
X-CSE-MsgGUID: QW93DOV1T5edtILsTUXooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566204"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
X-CSE-ConnectionGUID: CvGJJuTdT1aHBvBeI+CwaA==
X-CSE-MsgGUID: CHALvIr6SduVJQ/8ZhjXug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991849"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_err_injection: Add memory error
 injection tests
Date: Wed, 25 Nov 2026 23:46:44 -0800
Message-ID: <ddaafcc58b2c5ac3502bde37ab1317db13d6d9d3.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795677252.git.harish.chegondi@intel.com>
References: <cover.1795677252.git.harish.chegondi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Inject RAS memory errors through debugfs interface
sc/ras_error_inject that exercises System Controller's
RAS error injection command. This requires DG Diag FW
application be loaded. The DG Diag FW file needs to be
passed as an input parameter. The FW will be loaded
through late binding through an IGSC library API.
The memory errors count will be fetched before and
after injection through the RAS netlink interface.
Memory errors can cause pages to be offlined which
show up in the debugfs vram_bad_pages. Count the
number of bad pages before and after injection.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_err_injection.c | 246 ++++++++++++++++++++++++++++++++-
 tests/meson.build              |   6 +
 2 files changed, 250 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 74ae9b243..efdd8664b 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -30,6 +30,27 @@
 #include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
 
+#ifdef HAVE_IGSC
+#include "xe/xe_igsc.h"
+#endif
+
+/* Error injection IP block IDs */
+#define	RAS_MEM_BLOCK	2
+
+/* Memory error injection sub-block IDs */
+#define MEM_AXI_WRITE_SUB_BLOCK		2
+#define MEM_WR_2BIT_ECC_SUB_BLOCK	8
+
+/* Memory error injection type */
+#define MEM_WR_2BIT_ECC_ERR_INJ		 1
+#define MEM_MB0_AXI_WRITE_POISON_ERR_INJ 3
+#define MEM_MB1_AXI_WRITE_POISON_ERR_INJ 4
+#define MEM_MB0_AXI_WRITE_PARITY_ERR_INJ 5
+#define MEM_MB1_AXI_WRITE_PARITY_ERR_INJ 6
+
+/* Memory error injection mask */
+#define MEM_MSU_MASK			1
+
 /* Steering Control Register (MC_PKT_CTRL) */
 #define XE_MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
 #define XE_MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
@@ -50,7 +71,9 @@
 #define NODE_ID_UNCORRECTABLE_ERROR 1
 
 /* Error types for error counter */
-#define ERROR_ID_CORE_COMPUTE 1
+#define ERROR_ID_CORE_COMPUTE	1
+#define ERROR_ID_SOC_INTERNAL	2
+#define ERROR_ID_DEVICE_MEMORY	3
 
 /* Core Compute Correctable error injection */
 #define XE_L2_BANK_ERR_INJ 0xB1B4
@@ -67,8 +90,18 @@ enum {
 #define THRESHOLD_NONE 0
 #define THRESHOLD_ONE 1
 
+#define VRAM_BAD_PAGES		"vram_bad_pages"
+
 time_t event_timeout = 10 * 1000; /* 10 seconds */
 
+static char *fw_file;
+const char *help_str = "  --firmware | -f\t\tDG Diag firmware file\n";
+
+static struct option long_options[] = {
+	{"firmware", 0, 0, 'f'},
+	{ NULL, 0, 0, 0 }
+};
+
 static bool run_xe_compute_on_all_engines(int fd, bool state)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -288,6 +321,141 @@ static void ignore_aer_in_dmesg(void)
 
 static bool uncorr_error_recovered;
 
+/* Count the number of bad pages in VRAM from vram_bad_pages in debugfs */
+static int count_bad_pages(int fd)
+{
+	char buf[4096];
+	int count = 0;
+	char *line;
+
+	/* Read file into buf. It automatically null-terminates inside. */
+	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+	/* Check if the buffer is empty or could not be read */
+	if (buf[0] == '\0')
+		return 0;
+
+	/* Each entry line has format: "0x%08x : 0x%08x : %c\n" */
+	line = buf;
+	while ((line = strchr(line, '\n')) != NULL) {
+		count++;
+		line++;
+	}
+
+	/* Subtract the header line (max_pages : XXXX) */
+	if (count > 0)
+		count--;
+
+	return count;
+}
+
+/* Test mmap on VRAM */
+static void test_mmap(int fd)
+{
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t bo;
+	void *map;
+
+	bo = xe_bo_create(fd, 0, bo_size, vram_memory(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	map = xe_bo_map(fd, bo, bo_size);
+	strcpy(map, "Write some data to the BO!");
+
+	munmap(map, bo_size);
+
+	gem_close(fd, bo);
+}
+
+static void inject_ras_error(int fd,
+			     uint16_t block_id,
+			     uint16_t sub_block_id,
+			     uint16_t err_type,
+			     uint32_t params)
+{
+	char path[128], cmd[256] = {0};
+
+	igt_assert(igt_debugfs_path(fd, path, sizeof(path)));
+	snprintf(cmd, sizeof(cmd) - 1, "echo %u %u %u %u > %s/sc/ras_error_inject",
+		 block_id, sub_block_id, err_type, params, path);
+	igt_assert(system(cmd) == 0);
+}
+
+/**
+ * SUBTEST: mem-mb0-write-poison-err-injection
+ * Description: Verify memory MB0 write poison error injection
+ * Functionality: error injection
+ *
+ * SUBTEST: mem-mb1-write-poison-err-injection
+ * Description: Verify memory MB1 write poison error injection
+ * Functionality: error injection
+ *
+ * SUBTEST: mem-mb0-write-parity-err-injection
+ * Description: Verify memory MB0 write parity error injection
+ * Functionality: error injection
+ *
+ * SUBTEST: mem-mb1-write-parity-err-injection
+ * Description: Verify memory MB1 write parity error injection
+ * Functionality: error injection
+ *
+ * SUBTEST: mem-write-2bit-ecc-err-injection
+ * Description: Verify memory write 2-bit ECC error injection
+ * Functionality: error injection
+ */
+static void test_inject_memory_uncorr_errors(int fd,
+					     uint16_t block_id,
+					     uint16_t sub_block_id,
+					     uint16_t err_type,
+					     uint32_t params)
+{
+	int fw_handle;
+	struct igt_helper_process work_load = {};
+	uint32_t error_id = ERROR_ID_DEVICE_MEMORY;
+	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
+	uint32_t error_count_before_inj, error_count_after_inj;
+	uint32_t bad_pages_count_before_inj, bad_pages_count_after_inj;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_count_before_inj = get_counter(node_id, error_id);
+	bad_pages_count_before_inj = count_bad_pages(fd);
+
+	igt_fork_helper(&work_load) {
+		int iter, devnull = open("/dev/null", O_WRONLY);
+
+		if (devnull != -1) {
+			dup2(devnull, STDOUT_FILENO);
+			dup2(devnull, STDERR_FILENO);
+			close(devnull);
+		}
+		/* Run mmap test several times as a workload */
+		for (iter = 0; iter < 100; iter++)
+			test_mmap(fd);
+	}
+	inject_ras_error(fd, block_id, sub_block_id, err_type, params);
+	igt_wait_helper(&work_load);
+
+	sleep(3);
+	error_count_after_inj = get_counter(node_id, error_id);
+	bad_pages_count_after_inj = count_bad_pages(fd);
+
+	release_forcewake(fw_handle);
+
+	igt_assert_f(error_count_before_inj != UINT32_MAX &&
+		     error_count_after_inj != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     error_count_before_inj, error_count_after_inj);
+
+	igt_info("mem error counter: before injection=%u after injection=%u\n",
+		 error_count_before_inj, error_count_after_inj);
+	igt_info("Bad pages in VRAM: before injection=%u after injection=%u\n",
+		 bad_pages_count_before_inj, bad_pages_count_after_inj);
+	igt_assert_f(error_count_after_inj > error_count_before_inj,
+		     "Uncorrectable memory error injection test failed: "
+		     "error count before injection=%u after injection=%u\n",
+		     error_count_before_inj, error_count_after_inj);
+}
+
 /**
  * SUBTEST: inject_core_compute_uncorr_error
  * Description: Inject a Core Compute Uncorrectable error and verify
@@ -562,10 +730,35 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 	}
 }
 
-int igt_main()
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'f':
+		fw_file = optarg;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static bool load_dgdiag_firmware(void)
+{
+	bool ret = false;
+
+#ifdef HAVE_IGSC
+	if (xe_igsc_load_firmware(fw_file) == IGSC_SUCCESS)
+		ret = true;
+#endif
+	return ret;
+}
+
+int igt_main_args("f:", long_options, help_str, opt_handler, NULL)
 {
 	int fd;
 	struct xe_mmio mmio;
+	bool dgdiag_fw_present = false;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
@@ -579,6 +772,9 @@ int igt_main()
 		xe_mmio_access_init(fd, &mmio);
 		igt_require_f(xe_mmio_is_initialized(&mmio),
 			      "Failed to initialize Xe MMIO access\n");
+
+		if (fw_file)
+			dgdiag_fw_present = load_dgdiag_firmware();
 	}
 
 	igt_describe("Inject core compute uncorrectable error and run post-recovery workload.");
@@ -608,6 +804,52 @@ int igt_main()
 	igt_subtest("inject_core_compute_corr_error_once")
 		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
 
+	igt_describe("Verify memory MB0 write poison error injection");
+	igt_subtest("mem-mb0-write-poison-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_memory_uncorr_errors(fd,
+						 RAS_MEM_BLOCK,
+						 MEM_AXI_WRITE_SUB_BLOCK,
+						 MEM_MB0_AXI_WRITE_POISON_ERR_INJ,
+						 MEM_MSU_MASK);
+	}
+	igt_describe("Verify memory MB1 write poison error injection");
+	igt_subtest("mem-mb1-write-poison-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_memory_uncorr_errors(fd,
+						 RAS_MEM_BLOCK,
+						 MEM_AXI_WRITE_SUB_BLOCK,
+						 MEM_MB1_AXI_WRITE_POISON_ERR_INJ,
+						 MEM_MSU_MASK);
+	}
+	igt_describe("Verify memory MB0 write parity error injection");
+	igt_subtest("mem-mb0-write-parity-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_memory_uncorr_errors(fd,
+						 RAS_MEM_BLOCK,
+						 MEM_AXI_WRITE_SUB_BLOCK,
+						 MEM_MB0_AXI_WRITE_PARITY_ERR_INJ,
+						 MEM_MSU_MASK);
+	}
+	igt_describe("Verify memory MB1 write parity error injection");
+	igt_subtest("mem-mb1-write-parity-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_memory_uncorr_errors(fd,
+						 RAS_MEM_BLOCK,
+						 MEM_AXI_WRITE_SUB_BLOCK,
+						 MEM_MB1_AXI_WRITE_PARITY_ERR_INJ,
+						 MEM_MSU_MASK);
+	}
+	igt_describe("Verify memory write 2-bit ECC error injection");
+	igt_subtest("mem-write-2bit-ecc-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_memory_uncorr_errors(fd,
+						 RAS_MEM_BLOCK,
+						 MEM_WR_2BIT_ECC_SUB_BLOCK,
+						 MEM_WR_2BIT_ECC_ERR_INJ,
+						 MEM_MSU_MASK);
+	}
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..e8a5dcc1d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -442,6 +442,12 @@ extra_dependencies = {
         'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
+# Tests using the Intel GSC firmware update library (igsc). Only registered
+# when the igsc dependency (subproject or system) is available.
+if igsc.found()
+        extra_dependencies += {'xe_err_injection' : [ igsc ]}
+endif
+
 test_executables = []
 test_list = []
 testlist_files = []
-- 
2.43.0

