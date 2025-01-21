Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879BC0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 11:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE92F10E58A;
	Tue, 21 Jan 2025 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flkzongi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F86F10E58A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737459033; x=1768995033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xEzEZEun2w4F6br/5FR6KKBhG+AckxSiZY2JQXS9yFQ=;
 b=flkzongiR8GGTMnouwR9xHkfaWFmNwN4HfN8d+a3NcgHoZQlbkspl4UX
 2X4VNRYObuQm/Z+71pNeftZZLgLu9NHJOnSsWtkA1XNPNRS+6F3m1qWlp
 f8QNCRs39WZaALpI1HfOLFcS8i8jzL8D+rRAF5/C3i5cezDV3Af1HRqRU
 M4a75Zz/sP4Iz0VYe9qHS85ZqdxOnUPEfSgVS5i9TrvcSEDBEq8IIkoeH
 gMiFHBrw1xXukchAm03Ddkq45iBaonehn12HTlIhiInCyR/gJUN3zj762
 6BL3z2hsQ7OX9eTAY99tbnBabEQ3Ttlqd2Cy/B4kgUjG/6rc58oq9UaIt g==;
X-CSE-ConnectionGUID: E3wWDKO5Sfaidtc51dliZA==
X-CSE-MsgGUID: 2npoQ4l7SmKrtWseUjViQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37564327"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37564327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 03:30:33 -0800
X-CSE-ConnectionGUID: L96FSByHRcavoAFJInuC3g==
X-CSE-MsgGUID: 3vpXmmlETv+ZY6Y+wEnVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107680691"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.113.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 03:30:29 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, stylon.wang@amd.com,
 Rodrigo.Siqueira@amd.com, ramadevi.gandi@intel.com, ryszard.knop@intel.com,
 sameer.lattannavar@intel.com, lucas.demarchi@intel.com,
 jani.saarinen@intel.com, katarzyna.piecielska@intel.com,
 matthew.d.roper@intel.com, gregory.f.germano@intel.com,
 clinton.a.taylor@intel.com, jianshui.yu@intel.com,
 balasubramani.vivekanandan@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with kmemleak
Date: Tue, 21 Jan 2025 12:29:43 +0100
Message-Id: <20250121112944.115491-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121112944.115491-1-peter.senna@linux.intel.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
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

Adds a simple library for interacting with kmemleak and add
unit testing for the library. There are two modes intended to
integrate with igt_runner:
- once: collect kmemleaks after all test completed
- each: collect kmemleaks after eachb test completes

To use the library include "igt_kmemleak.h", call
igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
following arguments:
  - const char *last_test: Name of the last lest or NULL
  - int resdirfd: file descriptor of the results directory
  - bool kmemleak_each: Are we scanning once or scanning after
    each test?

CC: stylon.wang@amd.com
CC: Rodrigo.Siqueira@amd.com>
CC: ramadevi.gandi@intel.com
CC: ryszard.knop@intel.com
CC: sameer.lattannavar@intel.com
CC: lucas.demarchi@intel.com
CC: jani.saarinen@intel.com
CC: katarzyna.piecielska@intel.com
CC: matthew.d.roper@intel.com
CC: gregory.f.germano@intel.com
CC: clinton.a.taylor@intel.com
CC: jianshui.yu@intel.com
CC: balasubramani.vivekanandan@intel.com
CC: jonathan.cavitt@intel.com

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_kmemleak.c       | 268 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kmemleak.h       |  15 +++
 lib/meson.build          |   1 +
 lib/tests/igt_kmemleak.c | 259 +++++++++++++++++++++++++++++++++++++
 lib/tests/meson.build    |   1 +
 5 files changed, 544 insertions(+)
 create mode 100644 lib/igt_kmemleak.c
 create mode 100644 lib/igt_kmemleak.h
 create mode 100644 lib/tests/igt_kmemleak.c

diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
new file mode 100644
index 000000000..ff9543b58
--- /dev/null
+++ b/lib/igt_kmemleak.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#include "igt_core.h"
+#include "igt_kmemleak.h"
+
+/* We can change the path for unit testing, see igt_kmemleak_init() */
+static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
+static bool igt_kmemleak_sync;
+
+#define MAX_WRITE_RETRIES 5
+/**
+ * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
+ * possible.
+ * @fd: The file descriptor to write to.
+ * @buf: Pointer to the data to write.
+ * @count: Total number of bytes to write.
+ *
+ * Returns the total number of bytes written on success, or -1 on failure.
+ */
+static ssize_t igt_kmemleak_write(int fd, const void *buf, size_t count)
+{
+	const char *ptr = buf;
+	size_t remaining = count;
+	ssize_t written;
+	int retries = 0;
+
+	while (remaining > 0) {
+		written = write(fd, ptr, remaining);
+		if (written > 0) {
+			ptr += written;
+			remaining -= written;
+		} else if (written == -1) {
+			if (errno == EINTR || errno == EAGAIN) {
+				/* Retry for recoverable errors */
+				if (++retries > MAX_WRITE_RETRIES) {
+					igt_warn("igt_write: Exceeded retry limit\n");
+					return -1;
+				}
+				continue;
+			} else {
+				/* Log unrecoverable error */
+				igt_warn("igt_write: unrecoverable write error");
+				return -1;
+			}
+		}
+	}
+	return count;
+}
+
+/**
+ * igt_kmemeak_cmd:
+ * @cmd: command to send to kmemleak
+ *
+ * Send a command to kmemleak.
+ *
+ * Returns: true if sending the command was successful, false otherwise.
+ */
+static bool igt_kmemleak_cmd(const char *cmd)
+{
+	int fp;
+	size_t wlen;
+	int cmdlen = strlen(cmd);
+
+	fp = open(igt_kmemleak_file, O_RDWR);
+	if (!fp)
+		return false;
+
+	wlen = igt_kmemleak_write(fp, cmd, cmdlen);
+	close(fp);
+
+	return wlen == cmdlen;
+}
+
+/**
+ * igt_kmemeak_clear:
+ *
+ * Trigger an immediate clear on kmemleak.
+ *
+ * Returns: true if sending the command to clear was successful, false
+ * otherwise.
+ */
+static bool igt_kmemleak_clear(void)
+{
+	return igt_kmemleak_cmd("clear");
+}
+
+/**
+ * igt_kmemeak_found_leaks:
+ *
+ * Check if kmemleak found any leaks by trying to read one byte from the
+ * kmemleak file.
+ *
+ * Returns: true if kmemleak found any leaks, false otherwise.
+ */
+static bool igt_kmemleak_found_leaks(void)
+{
+	FILE *fp;
+	char buf[1];
+	size_t rlen;
+
+	fp = fopen(igt_kmemleak_file, "r");
+	if (!fp)
+		return false;
+
+	rlen = fread(buf, 1, 1, fp);
+	fclose(fp);
+
+	if (rlen == 1)
+		lseek(fileno(fp), 0, SEEK_SET);
+
+	return rlen == 1;
+}
+
+/**
+ * igt_kmemeak_scan:
+ *
+ * Trigger an immediate scan on kmemleak.
+ *
+ * Returns: true if leaks are found. False on failure and when no leaks are
+ * found.
+ */
+static bool igt_kmemleak_scan(void)
+{
+	if (!igt_kmemleak_cmd("scan"))
+		return false;
+
+	/* kmemleak documentation states that "the memory scanning is only
+	 * performed when the /sys/kernel/debug/kmemleak file is read." Read
+	 * a byte to trigger the scan now.
+	 */
+	return igt_kmemleak_found_leaks();
+}
+
+/**
+ * igt_kmemleak_append_to:
+ * @last_test: last test name to append to the file
+ * @resdirfd: file descriptor of the results directory
+ * @kmemleak_each: Are we scanning once or scanning after each test?
+ *
+ * Append the kmemleak file to the result file adding a header indicating if
+ * the leaks are for all tests or for a single one.
+ *
+ * Returns: true if appending to the file was successful, false otherwise.
+ */
+static bool igt_kmemleak_append_to(const char *last_test, int resdirfd,
+				   bool kmemleak_each)
+{
+	const char *before = "kmemleaks found before running any test\n\n";
+	const char *once = "kmemleaks found after running all tests\n";
+	int kmemleakfd, resfilefd;
+	char buf[4096];
+	size_t rlen;
+
+	kmemleakfd = open(igt_kmemleak_file, O_RDONLY);
+	if (kmemleakfd < 0)
+		return false;
+
+	/* Seek back to first byte */
+	lseek(kmemleakfd, 0, SEEK_SET);
+
+	/* Open text file to append */
+	resfilefd = openat(resdirfd, KMEMLEAKRESFILENAME,
+			   O_RDWR | O_CREAT | O_APPEND, 0666);
+	if (!resfilefd) {
+		close(kmemleakfd);
+		return false;
+	}
+
+	/* This is the header added before the content of the kmemleak file */
+	if (kmemleak_each)
+		if (!last_test)
+			igt_kmemleak_write(resfilefd, before, strlen(before));
+		else {
+			/* Write \n\n last_test \n to buf */
+			snprintf(buf, sizeof(buf),
+				 "\n\nkmemleaks found after running %s:\n",
+				 last_test);
+
+			igt_kmemleak_write(resfilefd, buf, strlen(buf));
+			memset(buf, 0, sizeof(buf));
+		}
+	else
+		igt_kmemleak_write(resfilefd, once, strlen(once));
+
+	if (igt_kmemleak_sync)
+		fsync(resfilefd);
+
+	while ((rlen = read(kmemleakfd, buf, sizeof(buf))) > 0) {
+		if (igt_kmemleak_write(resfilefd, buf, rlen) != rlen) {
+			close(resfilefd);
+			close(kmemleakfd);
+			return false;
+		}
+		if (igt_kmemleak_sync)
+			fsync(resfilefd);
+	}
+
+	close(resfilefd);
+	close(kmemleakfd);
+
+	return true;
+}
+
+/**
+ * igt_kmemeak_init:
+ * @unit_test_kmemleak_file: path to kmemleak file for unit testing
+ * @sync: sync the kmemleak file often
+ *
+ * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
+ * if kmemleak file is present and readable. Also sets the igt_kmemleak_sync.
+ *
+ * Returns: true if kmemleak is enabled, false otherwise.
+ */
+bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync)
+{
+	FILE *fp;
+
+	igt_kmemleak_sync = sync;
+
+	if (unit_test_kmemleak_file)
+		snprintf(igt_kmemleak_file,
+			 sizeof(igt_kmemleak_file),
+			 "%s",
+			 unit_test_kmemleak_file);
+
+	fp = fopen(igt_kmemleak_file, "r");
+	if (!fp)
+		return false;
+
+	fclose(fp);
+
+	return true;
+}
+
+/**
+ * igt_kmemleak:
+ * @last_test: last test name to append to the file
+ * @resdirfd: file descriptor of the results directory
+ * @kmemleak_each: Are we scanning once or scanning after each test?
+ *
+ * This is the main function that should be called when integrating igt_kmemleak
+ * into igt_runner or elsewhere. There are two flows:
+ *  - run once: runs only once after all tests are completed
+ *  - run for each test: runs after every test
+ *
+ * Returns: true on success, false otherwise.
+ */
+bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_each)
+{
+	/* Scan to collect results */
+	if (igt_kmemleak_scan())
+		if (!igt_kmemleak_append_to(last_test, resdirfd, kmemleak_each))
+			return false;
+
+	if (kmemleak_each)
+		igt_kmemleak_clear();
+
+	return true;
+}
diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
new file mode 100644
index 000000000..a3c142827
--- /dev/null
+++ b/lib/igt_kmemleak.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef IGT_KMEMLEAK_H
+#define IGT_KMEMLEAK_H
+
+#include <stdbool.h>
+
+bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync);
+bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_each);
+
+#define KMEMLEAKRESFILENAME "kmemleak.txt"
+
+#endif /* IGT_KMEMLEAK_H */
diff --git a/lib/meson.build b/lib/meson.build
index 9fffdd3c6..7959dcacb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -97,6 +97,7 @@ lib_sources = [
 	'igt_dummyload.c',
 	'igt_store.c',
 	'uwildmat/uwildmat.c',
+	'igt_kmemleak.c',
 	'igt_kmod.c',
 	'igt_ktap.c',
 	'igt_panfrost.c',
diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
new file mode 100644
index 000000000..717ba2852
--- /dev/null
+++ b/lib/tests/igt_kmemleak.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <ctype.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <zlib.h>
+
+#include "igt.h"
+#include "igt_kmemleak.h"
+
+const char *kmemleak_file_example =
+"unreferenced object 0xffff888102a2e638 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
+"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
+" backtrace (crc 2df71a7e):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2ed18 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
+"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
+" backtrace (crc ec2a8bdc):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2ea58 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
+"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
+" backtrace (crc f911c0d1):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e428 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
+"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
+" backtrace (crc cb8aaffd):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e008 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
+"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
+" backtrace (crc 7f883e78):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
+"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
+"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
+" backtrace (crc 338c016):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e378 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
+"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
+" backtrace (crc 665fb8a7):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e798 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n"
+"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
+" backtrace (crc b7a23a1c):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
+" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
+" hex dump (first 32 bytes):\n"
+"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
+"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
+" backtrace (crc 14d67a9c):\n"
+"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
+"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
+"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
+"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
+"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
+"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
+"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
+"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
+"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
+"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
+"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
+"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
+"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
+"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
+"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
+
+static const char *igt_kmemleak_unit_testing_resdir = "/tmp";
+
+igt_main
+{
+	int resdirfd = 0;
+
+	igt_subtest_group {
+		igt_subtest("test_igt_kmemleak_init") {
+			char unit_testing_kmemleak_filepath[256] = "/tmp/igt_kmemleak_test_XXXXXX";
+			int written_bytes;
+			bool res;
+			int fd;
+
+			fd = mkstemp(unit_testing_kmemleak_filepath);
+			igt_assert(fd >= 0);
+
+			written_bytes = write(fd, kmemleak_file_example,
+					strlen(kmemleak_file_example));
+			igt_assert_eq(written_bytes, strlen(kmemleak_file_example));
+
+			close(fd);
+
+			res = igt_kmemleak_init(unit_testing_kmemleak_filepath, true);
+			igt_assert(res);
+		}
+		igt_fixture
+			igt_assert(resdirfd = open(igt_kmemleak_unit_testing_resdir,
+						   O_DIRECTORY | O_RDONLY));
+
+		igt_subtest("test_igt_kmemleak_once")
+			igt_assert(igt_kmemleak(NULL, resdirfd, false));
+
+		igt_fixture {
+			/* Delete the result file */
+			unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
+		}
+		igt_subtest("test_igt_kmemleak_each") {
+			igt_assert(igt_kmemleak("test_name_1", resdirfd, true));
+			igt_assert(igt_kmemleak("test_name_2", resdirfd, true));
+			igt_assert(igt_kmemleak("test_name_3", resdirfd, true));
+		}
+		igt_fixture {
+			close(resdirfd);
+		}
+	}
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 1ce19f63c..5c42408d5 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -16,6 +16,7 @@ lib_tests = [
         'igt_ktap_parser',
 	'igt_list_only',
 	'igt_invalid_subtest_name',
+	'igt_kmemleak',
 	'igt_nesting',
 	'igt_no_exit',
 	'igt_runnercomms_packets',
-- 
2.34.1

