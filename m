Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15160A2601
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 10:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YDqBzt0+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487410E5C9;
	Mon,  2 Nov 2026 10:00:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C0010E5A7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613540; x=1825149540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T3cGyAusYCH8OPRb+W1zy3fuN7RhbUVjZ5TO3EFqcvY=;
 b=YDqBzt0+OhlXFisthWH4pNTBe/+VhxrydFbS5sybxfBVP1GyMuDTyvsm
 O6fcnfuAJbwNIE20k5U7R7eld4hSf0LHX7OKDH5pPKnNx/uNDrPoALhBC
 sFSin/Y6TH6fKfEjj1U2WMZ2Bipxv0gXrs4YMrK6jqa4DEaGgEyejGTA6
 sLiMA9iqlkjRzhARD4dQa0bzgc/LAZK4yJfTy0ySzNNjlUy0t2lOqT13/
 2RTsGJFa1jTsv1ZEmCX4e7cA/10GyRoZKQWMUk75B/aSF7H51irZn2Mgt
 TasfyaemMkZVNurNYAbARQzboVWv+b9Y4QTmHvgoWcg0cN9lVoDpJQxg3 A==;
X-CSE-ConnectionGUID: BBDfle2cQOGb98SobYBsSQ==
X-CSE-MsgGUID: GjtqdJLOQtW5+aHyvmFSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2185799"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2185799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:58:59 -0800
X-CSE-ConnectionGUID: CqK9ioSpRYqg2bOkGIZAhw==
X-CSE-MsgGUID: s3drAGzuSmy5AZZnT7mn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6403805"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:58:56 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Validate root-port D3cold entry on
 system suspend
Date: Mon,  2 Nov 2026 15:28:02 +0530
Message-Id: <20261102095802.3419285-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102095802.3419285-1-karthik.poosa@intel.com>
References: <20261102095802.3419285-1-karthik.poosa@intel.com>
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

When D3cold is supported and allowed, check the root port's ACPI
transition log across system suspend and resume for a D0 -> D3cold
transition. Skip the transition assertion if the root port is already
in D3cold at suspend entry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Assisted-by: LLM
---
 tests/intel/xe_pm.c | 234 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 221 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 543f46f5b..2eb70a383 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -12,8 +12,10 @@
  */
 
 #include <dirent.h>
+#include <errno.h>
 #include <limits.h>
 #include <fcntl.h>
+#include <stdio.h>
 #include <string.h>
 #include <sys/ioctl.h>
 
@@ -63,6 +65,9 @@ typedef struct {
 
 uint64_t orig_threshold;
 int fw_handle = -1;
+static int fd_kmsg = -1;
+static char d3cold_kmsg_entry[512];
+static bool acpi_d3cold_debug_enabled_by_test;
 
 static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
 static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
@@ -192,6 +197,120 @@ static void cleanup_d3(device_t device)
 	dpms_on_off(device, DRM_MODE_DPMS_ON);
 }
 
+static int count_kmsg_entries(int kmsg, const char *entry)
+{
+	char buf[4096];
+	char *kmsg_entry, *p;
+	const unsigned char *src;
+	size_t entry_len = strlen(entry);
+	int count = 0;
+	ssize_t len;
+
+	igt_assert(entry_len <= (SIZE_MAX - 1) / 4);
+	kmsg_entry = malloc(4 * entry_len + 1);
+	igt_assert(kmsg_entry);
+
+	/* Match /dev/kmsg's escaping of backslashes and non-printable bytes. */
+	for (src = (const unsigned char *)entry, p = kmsg_entry; *src; src++) {
+		if (*src < ' ' || *src >= 127 || *src == '\\')
+			p += sprintf(p, "\\x%02x", (unsigned int)*src);
+		else
+			*p++ = *src;
+	}
+	*p = '\0';
+
+	errno = 0;
+	while ((len = read(kmsg, buf, sizeof(buf) - 1)) > 0) {
+		buf[len] = '\0';
+		if (strstr(buf, kmsg_entry)) {
+			igt_debug("Found dmesg entry: %s\n", buf);
+			count++;
+		}
+	}
+
+	free(kmsg_entry);
+
+	if (len == 0)
+		return count;
+
+	igt_assert_f(len == -1 && (errno == EAGAIN || errno == EWOULDBLOCK),
+		     "Unexpected /dev/kmsg read result len=%zd errno=%d\n", len, errno);
+
+	return count;
+}
+
+static void build_rp_d3cold_kmsg_str(struct pci_device *pci_root, char *buf, size_t len)
+{
+	char path[PATH_MAX], fw_path[256];
+	ssize_t n;
+	int fd;
+
+	snprintf(path, sizeof(path),
+		 "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/firmware_node/path",
+		 pci_root->domain, pci_root->bus, pci_root->dev, pci_root->func);
+
+	fd = open(path, O_RDONLY);
+	igt_require_fd(fd);
+	n = read(fd, fw_path, sizeof(fw_path) - 1);
+	igt_assert_lte(0, (int)n);
+	fw_path[n] = '\0';
+	if (n > 0 && fw_path[n - 1] == '\n')
+		fw_path[n - 1] = '\0';
+	close(fd);
+
+	snprintf(buf, len, "%s: PM: Power state change: D0 -> D3cold", fw_path);
+}
+
+#define ACPI_DYNDDBG_CONTROL "/sys/kernel/debug/dynamic_debug/control"
+#define ACPI_D3COLD_DYNDDBG_QUERY \
+	"file drivers/acpi/device_pm.c format \"Power state change: %s -> %s\""
+
+static bool acpi_d3cold_debug_is_enabled(void)
+{
+	char line[1024];
+	FILE *fp;
+	bool enabled = false;
+
+	fp = fopen(ACPI_DYNDDBG_CONTROL, "r");
+	if (!fp)
+		return false;
+
+	while (fgets(line, sizeof(line), fp)) {
+		char *message = strstr(line, "Power state change: %s -> %s");
+		char *flags = strchr(line, '=');
+
+		if (message && flags && flags < message && memchr(flags, 'p', message - flags)) {
+			enabled = true;
+			break;
+		}
+	}
+
+	fclose(fp);
+	return enabled;
+}
+
+static bool set_acpi_d3cold_debug(bool enable)
+{
+	FILE *fp;
+	int ret;
+
+	fp = fopen(ACPI_DYNDDBG_CONTROL, "w");
+	if (!fp)
+		return false;
+
+	ret = fprintf(fp, "%s %sp\n", ACPI_D3COLD_DYNDDBG_QUERY, enable ? "+" : "-");
+	if (fclose(fp))
+		return false;
+
+	return ret > 0;
+}
+
+static void restore_acpi_d3cold_debug(int sig)
+{
+	if (acpi_d3cold_debug_enabled_by_test)
+		set_acpi_d3cold_debug(false);
+}
+
 static bool in_d3(device_t device, enum igt_acpi_d_state state)
 {
 	uint16_t val;
@@ -228,6 +347,85 @@ static void close_fw_handle(int sig)
 	close(fw_handle);
 }
 
+static void close_d3cold_kmsg_handle(int sig)
+{
+	if (fd_kmsg < 0)
+		return;
+
+	close(fd_kmsg);
+	fd_kmsg = -1;
+}
+
+static void start_d3cold_kmsg_logging(void)
+{
+	igt_require_fd(fd_kmsg);
+	igt_assert_neq(lseek(fd_kmsg, 0, SEEK_END), -1);
+}
+
+static void check_d3cold_kmsg_count(void)
+{
+	int count;
+
+	igt_require_fd(fd_kmsg);
+	count = count_kmsg_entries(fd_kmsg, d3cold_kmsg_entry);
+	igt_info("Root port D3cold entry count=%d\n", count);
+	igt_assert_f(count > 0,
+		     "No root port D3cold entry detected during system suspend\n");
+}
+
+static bool d3cold_validation_enabled(device_t device)
+{
+	uint32_t d3cold_allowed;
+
+	if (!igt_pm_acpi_d3cold_supported(device.pci_root))
+		return false;
+
+	igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
+
+	return d3cold_allowed;
+}
+
+static void prepare_d3cold_kmsg(device_t device)
+{
+	igt_require_f(d3cold_validation_enabled(device),
+		      "D3Cold validation requires a D3Cold-capable root port and d3cold_allowed=1\n");
+
+	if (fd_kmsg < 0) {
+		build_rp_d3cold_kmsg_str(device.pci_root, d3cold_kmsg_entry,
+					 sizeof(d3cold_kmsg_entry));
+		fd_kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+		igt_require_fd(fd_kmsg);
+	}
+
+	if (!acpi_d3cold_debug_is_enabled()) {
+		igt_require_f(set_acpi_d3cold_debug(true),
+			      "ACPI D3Cold dynamic debug is unavailable\n");
+		acpi_d3cold_debug_enabled_by_test = true;
+		igt_require_f(acpi_d3cold_debug_is_enabled(),
+			      "Failed to enable ACPI D3Cold dynamic debug\n");
+	}
+}
+
+static void suspend_check_d3cold(device_t device, enum igt_suspend_state s_state,
+				 enum igt_suspend_test test)
+{
+	igt_require_f(d3cold_validation_enabled(device),
+		      "D3Cold validation requires a D3Cold-capable root port and d3cold_allowed=1\n");
+
+	if (igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D3Cold) {
+		igt_info("Root port already in D3cold at suspend entry; skip transition check\n");
+		igt_system_suspend_autoresume(s_state, test);
+		return;
+	}
+
+	prepare_d3cold_kmsg(device);
+
+	/* Seek to end before suspend so only new messages are scanned */
+	start_d3cold_kmsg_logging();
+	igt_system_suspend_autoresume(s_state, test);
+	check_d3cold_kmsg_count();
+}
+
 #define MAX_VMAS 2
 
 static void*
@@ -578,7 +776,7 @@ child_exec(void *arguments)
 static void
 test_exec(device_t device, int n_exec_queues, int n_execs,
 		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
-		  unsigned int flags)
+		  unsigned int flags, bool validate_d3cold)
 {
 	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
 				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
@@ -587,6 +785,10 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 	pthread_t threads[65]; /* MAX_ENGINES + 1 */
 	child_exec_args args;
 
+	if (validate_d3cold && n_execs > 1 && s_state != NO_SUSPEND) {
+		prepare_d3cold_kmsg(device);
+	}
+
 	xe_for_each_engine(device.fd_xe, eci) {
 		args.device = device;
 		args.eci = eci;
@@ -607,7 +809,10 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 	}
 
 	if (n_execs > 1 && s_state != NO_SUSPEND) {
-		igt_system_suspend_autoresume(s_state, test);
+		if (validate_d3cold)
+			suspend_check_d3cold(device, s_state, test);
+		else
+			igt_system_suspend_autoresume(s_state, test);
 
 		pthread_mutex_lock(&suspend_lock);
 		pthread_cond_broadcast(&suspend_cond);
@@ -845,7 +1050,7 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
 					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
-				igt_system_suspend_autoresume(s_state, test);
+				suspend_check_d3cold(device, s_state, test);
 			}
 		}
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
@@ -981,7 +1186,7 @@ int igt_main()
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
+		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0, false);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		has_runtime_pm = igt_setup_runtime_pm(device.fd_xe);
@@ -989,6 +1194,8 @@ int igt_main()
 		device.res = drmModeGetResources(device.fd_xe);
 
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		igt_install_exit_handler(close_d3cold_kmsg_handle);
+		igt_install_exit_handler(restore_acpi_d3cold_debug);
 		update_debug_mask_if_ci(DRM_UT_KMS);
 		errno = 0;
 	}
@@ -997,28 +1204,28 @@ int igt_main()
 		igt_subtest_f("%s-basic", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
-			igt_system_suspend_autoresume(s->state, test);
+			suspend_check_d3cold(device, s->state, test);
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			test_exec(device, 1, 2, s->state, NO_RPM, 0);
+			test_exec(device, 1, 2, s->state, NO_RPM, 0, true);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
 			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
 				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
-			igt_system_suspend_autoresume(s->state, test);
-			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0);
+			suspend_check_d3cold(device, s->state, test);
+			test_exec(device, 1, 2, NO_SUSPEND, NO_RPM, 0, false);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			test_exec(device, 16, 32, s->state, NO_RPM, 0);
+			test_exec(device, 16, 32, s->state, NO_RPM, 0, true);
 		}
 
 		for (const struct vm_op *op = vm_op; op->name; op++) {
 			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
-				test_exec(device, 16, 32, s->state, NO_RPM, op->flags);
+				test_exec(device, 16, 32, s->state, NO_RPM, op->flags, true);
 			}
 		}
 
@@ -1026,7 +1233,8 @@ int igt_main()
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 				igt_assert(setup_d3(device, d->state));
-				test_exec(device, 1, 2, s->state, NO_RPM, 0);
+				test_exec(device, 1, 2, s->state, NO_RPM, 0,
+					  d->state == IGT_ACPI_D3Cold);
 				cleanup_d3(device);
 			}
 		}
@@ -1050,7 +1258,7 @@ int igt_main()
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
-			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
+			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0, false);
 			cleanup_d3(device);
 		}
 
@@ -1065,7 +1273,7 @@ int igt_main()
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
-			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
+			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0, false);
 			cleanup_d3(device);
 		}
 
-- 
2.25.1

