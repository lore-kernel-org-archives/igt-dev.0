Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C102606A323
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UBC4ejWF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72FA10E103;
	Wed, 28 Oct 2026 20:08:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A354210E103
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793217918; x=1824753918;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9a6KMcjAAb7gxsgUO2Kk0rw25Sx06/11F/h/c/ytyOg=;
 b=UBC4ejWF0j7qfgjeSF77zcljM9OFGdYMnDntFGbBZ1VLLcdwjN+/ZzCJ
 LwgKRSELdjrxa+ROVt3LE7U/FQMm5GIe8HcQH7PlN/qbVz8mXP5bAR23X
 RKfeVPwjODbKC+gtmKBkQsju69oZitaXtdAtiiwtZMTCOuOyGcbggwG7m
 OyDDmYj495KW3w1CHcWCWFWNY8nXEqNJlXn75w13XarSeEioBRLjbLuJj
 tRcFZg5ovKUc2MpuqfFI3IbOrrsDvc9V9258ACC4JlnICcR2n+SZ/gk+7
 fwrSYmFcKQHaiBAxcxVvisUP+A4BHCNOoGYaP4XV7f2JDNJ71BYMcZEV/ g==;
X-CSE-ConnectionGUID: ZmFinPFRTc+dzkL9qZ8J8g==
X-CSE-MsgGUID: ntQdY5bHS9GmFNSIPBPaGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1850476"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1850476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:05:12 -0700
X-CSE-ConnectionGUID: wsX0Q5E5RAmWRnRP880yIw==
X-CSE-MsgGUID: lUCcJa1wRNCfelUq3foYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5278515"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:05:11 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: rodrigo.vivi@intel.com, igt-dev@lists.freedesktop.org,
 frank.scarbrough@intel.com, david.e.box@linux.intel.com
Subject: [PATCH i-g-t v2 2/2] test/intel/xe_pmt: Support CRI PMT
Date: Wed, 28 Oct 2026 13:05:02 -0700
Message-ID: <20261028200500.4005780-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
References: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
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

Crescent Island (CRI) devices have the Platform Monitoring
Technology (PMT) support for the telemetry and crashlog
(type 1/version2) functions.

Add test support for the device.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/intel/xe_pmt.c | 259 ++++++++++++++++++++++++++++---------------
 1 file changed, 171 insertions(+), 88 deletions(-)

diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
index af5d470b5..ebd3fe3f6 100644
--- a/tests/intel/xe_pmt.c
+++ b/tests/intel/xe_pmt.c
@@ -8,6 +8,7 @@
 #include <fcntl.h>
 #include <limits.h>
 #include <string.h>
+#include <linux/limits.h>
 
 #include "igt.h"
 #include "igt_sysfs.h"
@@ -25,9 +26,9 @@
  * Description: Verify that the available PMT files (crashlog and telemetry)
  *   are created, are accessable, and respond as per design.
  *
- * SUBTEST: pmt-bmg-all
+ * SUBTEST: pmt-api
  * Description:
- *   Exercise the BMG PMT feature
+ *   Verify that the correct PMT sysfs file exist and verify access
  *
  */
 
@@ -40,16 +41,34 @@ IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files operatio
 #define TELEMETRY_DIR "telem"
 
 /* itemize the available instances for the specific device */
-enum bmg_crashlog_instances {
-	bmg_crashlog_punit = 0,
-	bmg_crashlog_oobmsm,
-	bmg_crashlog_max
+enum pmt_device {
+	PMT_DEVICE_BMG,
+	PMT_DEVICE_CRI,
 };
 
-enum bmg_telemety_instances {
-	bmg_telemetry_punit = 0,
-	bmg_telemetry_oobmsm,
-	bmg_telemetry_max
+struct pmt_device_info {
+	uint32_t max_crashlog;
+	uint32_t max_telem;
+};
+
+#define BMG_CRASHLOG_MAX	(2)
+#define BMG_TELEM_MAX		(2)
+
+#define CRI_CRASHLOG_MAX	(2)
+#define CRI_TELEM_MAX		(3)
+
+#define CRASHLOG_MAX		CRI_CRASHLOG_MAX
+#define TELEM_MAX		CRI_TELEM_MAX
+
+struct pmt_device_info device_info[] = {
+	[PMT_DEVICE_BMG] = {
+		.max_crashlog = BMG_CRASHLOG_MAX,
+		.max_telem = BMG_TELEM_MAX,
+	},
+	[PMT_DEVICE_CRI] = {
+		.max_crashlog = CRI_CRASHLOG_MAX,
+		.max_telem = CRI_TELEM_MAX,
+	},
 };
 
 static char dev_path[PATH_MAX];
@@ -59,13 +78,18 @@ static char work_path[PATH_MAX * 2];
  * In most case there should be a single instance of the crashlog and telemetry
  * directories. If DVSEC entries are not contiguous the structure will be different,
  * and the code will need to reflect the structure.
+ * vsec directory string size is sizeof(xxx_DIR) + idx.  For instance:
+ *    intel_vsec.crashlog.3
+ *    intel_vsec.telemetry.23
  */
-static char crashlog_vsec_dir[32];
-static char telemetry_vsec_dir[32];
+#define MAX_VSEC_DIR (32)
+
+static char crashlog_vsec_dir[MAX_VSEC_DIR];
+static char telemetry_vsec_dir[MAX_VSEC_DIR];
 
 /* This needs to be specific for each supported device */
-static char crashlog_dir[bmg_crashlog_max][32];
-static char telemetry_dir[bmg_telemetry_max][32];
+static char crashlog_dir[CRASHLOG_MAX][MAX_VSEC_DIR];
+static char telemetry_dir[TELEM_MAX][MAX_VSEC_DIR];
 
 /* telemetry file names */
 static const char *telem = "telem";
@@ -90,7 +114,7 @@ struct crashlog_v2_info {
 	int rearm_fd;
 	int trigger_fd;
 	u_int32_t guid;
-} bmg_info[bmg_crashlog_max];
+} crashlog_info[CRASHLOG_MAX];
 
 #define DEV_PATH_LEN 80
 
@@ -121,17 +145,22 @@ static char *device_sysfs_path(int fd, char *path)
 /*
  * Verify the PMT directory structure
  *
- * BMG PMT directory structure:
+ * BMG/CRI PMT directory structure:
  *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
  *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
  *
  * Note: different platforms could have a different pattern
  */
-static void test_pmt_directories(int dev_fd)
+static void test_pmt_directories(int dev_fd, enum pmt_device pmt_dev)
 {
 	struct dirent *ent;
-	int index;
+	uint32_t index;
 	DIR *dir;
+	uint32_t max_crashlog;
+	uint32_t max_telem;
+
+	max_crashlog = device_info[pmt_dev].max_crashlog;
+	max_telem = device_info[pmt_dev].max_telem;
 
 	igt_assert(device_sysfs_path(dev_fd, dev_path));
 
@@ -161,7 +190,7 @@ static void test_pmt_directories(int dev_fd)
 	/* find the crashlog<x> directory instances */
 	while ((ent = readdir(dir)) != NULL) {
 		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
-			if (index < bmg_crashlog_max)
+			if (index < max_crashlog)
 				strcpy(crashlog_dir[index], ent->d_name);
 			index++;
 		}
@@ -169,8 +198,9 @@ static void test_pmt_directories(int dev_fd)
 
 	closedir(dir);
 
-	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
-	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
+	igt_assert_f(index == max_crashlog, "unexpected crashlog entries: %d  vs expected: %d\n",
+		     index, max_crashlog);
+	for (int i = 0; i < max_crashlog && i < ARRAY_SIZE(crashlog_dir); i++)
 		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
 
 	/* verify telemetry directory structure */
@@ -182,7 +212,7 @@ static void test_pmt_directories(int dev_fd)
 	index = 0;
 	while ((ent = readdir(dir)) != NULL) {
 		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
-			if (index < bmg_telemetry_max)
+			if (index < max_telem)
 				strcpy(telemetry_dir[index], ent->d_name);
 			index++;
 		}
@@ -190,8 +220,9 @@ static void test_pmt_directories(int dev_fd)
 
 	closedir(dir);
 
-	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
-	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
+	igt_assert_f(index == max_telem, "unexpected telemetry entries: %d  vs expected: %d\n",
+		     index, max_telem);
+	for (int i = 0; i < max_telem && i < ARRAY_SIZE(telemetry_dir); i++)
 		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
 
 }
@@ -227,11 +258,11 @@ static void open_pmt_file(const char *path, const char *file, int *fd, int flags
 /*
  * verify that the expected telemetry file(s) are in place
  */
-static void test_pmt_telemetry_files(int dev_fd)
+static void test_pmt_telemetry_files(int dev_fd, enum pmt_device pmt_dev)
 {
 	int i;
 
-	for (i = 0; i < bmg_telemetry_max; i++) {
+	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
 		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
 			"intel_pmt", telemetry_dir[i]);
 		find_pmt_file(work_path, telem);
@@ -241,7 +272,7 @@ static void test_pmt_telemetry_files(int dev_fd)
 /*
  * verify that a read will be successful
  */
-static void test_pmt_telemetry_read_data(int dev_fd)
+static void test_pmt_telemetry_read_data(int dev_fd, enum pmt_device pmt_dev)
 {
 	char buf[64] = {};
 	u_int32_t *val;
@@ -252,7 +283,7 @@ static void test_pmt_telemetry_read_data(int dev_fd)
 	int len;
 	int i;
 
-	for (i = 0; i < bmg_telemetry_max; i++) {
+	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
 		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
 			"intel_pmt", telemetry_dir[i]);
 		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
@@ -278,29 +309,29 @@ static void test_pmt_telemetry_read_data(int dev_fd)
 /*
  * verify that the expected crashlog files are in place
  */
-static void test_pmt_crashlog_files(int dev_fd)
+static void test_pmt_crashlog_files(int dev_fd, enum pmt_device pmt_dev)
 {
 	char buf[64] = {};
 	int ret;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
 		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
 			crashlog_dir[i]);
 
-		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
-		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
-		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
-		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
-		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
-		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
-		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
-		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
+		open_pmt_file(work_path, clear, &crashlog_info[i].clear_fd, O_RDONLY);
+		open_pmt_file(work_path, consumed, &crashlog_info[i].consumed_fd, O_RDWR);
+		open_pmt_file(work_path, crashlog, &crashlog_info[i].crashlog_fd, O_RDONLY);
+		open_pmt_file(work_path, enable, &crashlog_info[i].enable_fd, O_RDWR);
+		open_pmt_file(work_path, error, &crashlog_info[i].error_fd, O_RDONLY);
+		open_pmt_file(work_path, dev_guid, &crashlog_info[i].guid_fd, O_RDONLY);
+		open_pmt_file(work_path, rearm, &crashlog_info[i].rearm_fd, O_RDWR);
+		open_pmt_file(work_path, trigger, &crashlog_info[i].trigger_fd, O_RDWR);
 
-		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
+		ret = pread(crashlog_info[i].guid_fd, buf, sizeof(buf), 0);
 		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
-		bmg_info[i].guid = strtol(buf, NULL, 16);
-		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
+		crashlog_info[i].guid = strtol(buf, NULL, 16);
+		igt_assert_f(crashlog_info[i].guid > 0, "failed to set guid for device %d\n", i);
 	}
 }
 
@@ -336,15 +367,15 @@ static bool verify_msg(int fd, const char *msg, const char *file) {
 /*
  * Set enable enable/disable bit and verify usage
  */
-static void test_pmt_crashlog_enable(int dev_fd)
+static void test_pmt_crashlog_enable(int dev_fd, enum pmt_device pmt_dev)
 {
 	u_int32_t guid;
 	int fd;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		fd = bmg_info[i].enable_fd;
-		guid = bmg_info[i].guid;
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		fd = crashlog_info[i].enable_fd;
+		guid = crashlog_info[i].guid;
 
 		/* force enable so we are in a known state */
 		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
@@ -365,14 +396,14 @@ static void test_pmt_crashlog_enable(int dev_fd)
  * The error bit is set when a crashlog fails in HW.  It is read only so only
  * need to verify that it is "0".
  */
-static void test_pmt_crashlog_error(int dev_fd)
+static void test_pmt_crashlog_error(int dev_fd, enum pmt_device pmt_dev)
 {
 	uint32_t guid;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		guid = bmg_info[i].guid;
-		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error),
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		guid = crashlog_info[i].guid;
+		igt_assert_f(verify_msg(crashlog_info[i].error_fd, DISABLE_MSG, error),
 			     "0x%x: error clear\n", guid);
 	}
 }
@@ -381,24 +412,65 @@ static void test_pmt_crashlog_error(int dev_fd)
  * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
  * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
  */
-static void test_pmt_crashlog_rearm(int dev_fd)
+static void test_pmt_crashlog_rearm(int dev_fd, size_t pmt_dev)
 {
 	uint32_t guid;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		guid = bmg_info[i].guid;
-		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm),
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		guid = crashlog_info[i].guid;
+		igt_assert_f(verify_msg(crashlog_info[i].rearm_fd, ENABLE_MSG, rearm),
 			     "0x%x: rearm set\n", guid);
 	}
 }
 
+/*
+ * Verify the crashlog data is in the initialized state
+ * 0xdeadbeef BMG PUINT/OOBMSM default, CRI PUNIT default
+ * 0xba0b6afe CRI OOBMSM default
+ */
+static void test_pmt_crashlog_inited(int dev_fd, enum pmt_device pmt_dev)
+{
+	char buf[64] = {};
+	u_int32_t guid;
+	int crashlog_fd;
+	int clear_fd;
+	int *val;
+	int len;
+	int i;
+
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		clear_fd = crashlog_info[i].clear_fd;
+		crashlog_fd = crashlog_info[i].crashlog_fd;
+		guid = crashlog_info[i].guid;
+
+		/* make sure the bit is clear */
+		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
+
+		len = read(crashlog_fd, buf, sizeof(buf));
+		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
+
+		val = (int *)buf;
+		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
+			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
+	}
+}
+
 //#define PMT_CRASHLOG_TRIGGER_ENABLE 1
 #if PMT_CRASHLOG_TRIGGER_ENABLE
+/*
+ * Triggering a Crashlog requires a power cycle to return the device to a usable
+ * state.
+ * This is very disruptive and doesn't necessarily verify much more than the
+ * current set of tests.
+ * Commentting out the trigger, consumed, clear path for "normal" testing.
+ * Compile flag so these tests can be done expclity.
+ */
+
 /*
  * Set the manual trigger bit and make sure the data is not 0xdeadbeef
  */
-static void test_pmt_crashlog_trigger(int dev_fd)
+static void test_pmt_crashlog_trigger(int dev_fd, size_t pmt_dev)
 {
 	char buf[64] = {};
 	u_int32_t *val;
@@ -408,10 +480,10 @@ static void test_pmt_crashlog_trigger(int dev_fd)
 	int len;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		crashlog_fd = bmg_info[i].crashlog_fd;
-		trigger_fd = bmg_info[i].trigger_fd;
-		guid = bmg_info[i].guid;
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		crashlog_fd = crashlog_info[i].crashlog_fd;
+		trigger_fd = crashlog_info[i].trigger_fd;
+		guid = crashlog_info[i].guid;
 
 		/* make sure the bit is clear */
 		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
@@ -431,7 +503,8 @@ static void test_pmt_crashlog_trigger(int dev_fd)
 
 		val = (u_int32_t *)buf;
 
-		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
+		igt_assert_f(*val != 0xdeadbeef && *val != 0xba0b6afe,
+			     "0x%x: invalid trigger value: : 0x%x\n", guid, *val);
 	}
 }
 
@@ -439,15 +512,15 @@ static void test_pmt_crashlog_trigger(int dev_fd)
  * After a crashlog has been "consumed" (read), setting this bit can be done.
  * Verify that it is set correctly.
  */
-static void test_pmt_crashlog_consumed(int dev_fd)
+static void test_pmt_crashlog_consumed(int dev_fd, enum pmt_device pmt_dev)
 {
 	uint32_t guid;
 	int fd;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		fd = bmg_info[i].consumed_fd;
-		guid = bmg_info[i].guid;
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		fd = crashlog_info[i].consumed_fd;
+		guid = crashlog_info[i].guid;
 
 		/* check, set, verify */
 		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
@@ -460,12 +533,12 @@ static void test_pmt_crashlog_consumed(int dev_fd)
 
 /*
  * Test the clear crashlog bit. After setting the crashlog data buffer should be
- * set to 0xdeadbeef.
+ * set to 0xdeadbeef or 0xba0b6afe.
  * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
  * file is the "standard" usage, so test that usage.
  * This bit cannot be cleared by software (i.e. reboot required).
  */
-static void test_pmt_crashlog_clear(int dev_fd)
+static void test_pmt_crashlog_clear(int dev_fd, enum pmt_device pmt_dev)
 {
 	char buf[64] = {};
 	u_int32_t guid;
@@ -476,11 +549,11 @@ static void test_pmt_crashlog_clear(int dev_fd)
 	int len;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
-		clear_fd = bmg_info[i].clear_fd;
-		crashlog_fd = bmg_info[i].crashlog_fd;
-		trigger_fd = bmg_info[i].trigger_fd;
-		guid = bmg_info[i].guid;
+	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
+		clear_fd = crashlog_info[i].clear_fd;
+		crashlog_fd = crashlog_info[i].crashlog_fd;
+		trigger_fd = crashlog_info[i].trigger_fd;
+		guid = crashlog_info[i].guid;
 
 		/* make sure the bit is clear */
 		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
@@ -496,39 +569,45 @@ static void test_pmt_crashlog_clear(int dev_fd)
 		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
 
 		val = (int *)buf;
-		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
+		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
+			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
 	}
 }
 #endif
 
 /**
- * SUBTEST: pmt-bmg-all
+ * SUBTEST: pmt-api
  * Description:
  *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
  *   individually unless you understand the underlying HW behavior.  Because of this behavior,
- *   all of the test will be done in order in one step.
+ *   all of the test will be done in order in one sub-test.
+ *
+ *   Crashlog will cause the GPU to be in an un-useful state.  Reseting to recover
+ *   is not yet fully defined.
  *   NOTE:
+ *     o PMT file info is accumulated from successful tests and is used in sequence
  *     o Testing MUST be done after a cold reset
  *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
  *
  *  Test category: functionality test
  */
-static void test_pmt_bmg(int fd)
+static void test_pmt_api(int fd, enum pmt_device pmt_dev)
 {
-	test_pmt_directories(fd);
+	test_pmt_directories(fd, pmt_dev);
 
-	test_pmt_telemetry_files(fd);
-	test_pmt_telemetry_read_data(fd);
+	test_pmt_telemetry_files(fd, pmt_dev);
+	test_pmt_telemetry_read_data(fd, pmt_dev);
 
-	test_pmt_crashlog_files(fd);
-	test_pmt_crashlog_error(fd);
-	test_pmt_crashlog_enable(fd);
-	test_pmt_crashlog_rearm(fd);
+	test_pmt_crashlog_files(fd, pmt_dev);
+	test_pmt_crashlog_error(fd, pmt_dev);
+	test_pmt_crashlog_enable(fd, pmt_dev);
+	test_pmt_crashlog_rearm(fd, pmt_dev);
+	test_pmt_crashlog_inited(fd, pmt_dev);
 
 #if PMT_CRASHLOG_TRIGGER_ENABLE
-	test_pmt_crashlog_trigger(fd);
-	test_pmt_crashlog_consumed(fd);
-	test_pmt_crashlog_clear(fd);
+	test_pmt_crashlog_trigger(fd, pmt_dev);
+	test_pmt_crashlog_consumed(fd, pmt_dev);
+	test_pmt_crashlog_clear(fd, pmt_dev);
 #endif
 }
 
@@ -536,25 +615,29 @@ int igt_main()
 {
 	const struct {
 		const char *name;
-		void (*func)(int);
+		void (*func)(int, enum pmt_device);
 	} funcs[] = {
-		{ "pmt-bmg-all", test_pmt_bmg },
+		{ "pmt-api", test_pmt_api },
 		{ }
 	}, *f;
 	int dev_fd;
+	enum pmt_device pmt_dev;
 
 	igt_fixture() {
 		uint16_t dev_id;
 
 		dev_fd = drm_open_driver(DRIVER_XE);
 		dev_id = intel_get_drm_devid(dev_fd);
-		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
+		igt_require_f(IS_BATTLEMAGE(dev_id) || IS_CRESCENTISLAND(dev_id),
+			      "PMT supported on BMG or CRI GPUs\n");
+
+		pmt_dev = IS_BATTLEMAGE(dev_id) ? PMT_DEVICE_BMG : PMT_DEVICE_CRI;
 	}
 
 	igt_describe("PMT access and API testing");
 	for (f = funcs; f->name; f++) {
 		igt_subtest_f("%s", f->name)
-			f->func(dev_fd);
+			f->func(dev_fd, pmt_dev);
 	}
 
 	igt_fixture()
-- 
2.43.0

