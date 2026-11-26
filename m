Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0A606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zwi8wQdn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF3F10E050;
	Thu, 26 Nov 2026 11:16:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A21122E8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795691748; x=1827227748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tScDr45xhYY4pyn5xMS1EHhcK7Vj3KSK/9lZ1N0+f1U=;
 b=Zwi8wQdnTIAU7HE87HG3Na3BPtRCzCDhDXTMRx28DnZjqGCA89NQgOZP
 x7bl0aDq0W3ywDFVV6jxWUNzvStCxUfa72ySup+1/IX7zCFwPk+c3ZKga
 lUQ+tMRCfTdzRqcEr36gW/VIKX/nhEvJJrUZ1P4tJAp8PLagoxNz2fJxI
 PW+7uuCQwm2y/M9c0l7GOCdexXCS2UMLYmbeLsJB/PAsAQgCryH8aXiVz
 cVAOom8qNAUHwOOfQE1iAV0uKnk96Q+QakfNWZiEyKF94ZQ7z+opooGQq
 upxXXr70lRkVCjESSpJRQdwGvxxhzmQr0TrdJRYYVdMAj1aB4f6+2YfoJ Q==;
X-CSE-ConnectionGUID: IqFwl0WBTqmR0Bqh+c9NLQ==
X-CSE-MsgGUID: tZ8so2cSTquNeriH682HJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4500040"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4500040"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:15:48 -0800
X-CSE-ConnectionGUID: 3mnl2FToRzuCO/VkccFhcw==
X-CSE-MsgGUID: uATm/Ro9Swir2K0slpqS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="13919179"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 03:15:46 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nitin.r.gote@intel.com, arvind.yadav@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V2] tests/xe: Add bad page decay reclaim coverage
Date: Thu, 26 Nov 2026 16:45:28 +0530
Message-ID: <20261126111527.3899889-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add coverage for VRAM bad page decay handling.

The new tests verify two scenarios:

- A soft-offlined page is reclaimed after the configured
  bad_page_decay_secs timeout expires.

- Re-injecting the same page before timeout promotes the page
  from SOFT to HARD offline status, preventing reclaim.

To keep the tests synchronized with the active kernel
configuration, the timeout is read from xe configfs instead of
being hardcoded. The tests derive their wait times from the
configured decay interval and skip with instructions when the
configuration is unsuitable for automated execution.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 279 +++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
index f1f7765b1..b4567221b 100644
--- a/tests/intel/xe_mempage_offline.c
+++ b/tests/intel/xe_mempage_offline.c
@@ -19,6 +19,7 @@
 #include <unistd.h>
 
 #include "igt.h"
+#include "igt_configfs.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
@@ -29,6 +30,7 @@
 #define FAULT_INJECT_DIR	"inject_mempage_offline"
 #define TRIGGER_FILE		"inject_mempage_offline_trigger"
 #define VRAM_BAD_PAGES		"vram_bad_pages"
+#define MAX_TRACKED_BAD_PAGES 10000
 
 static int count_bad_pages(int fd)
 {
@@ -106,6 +108,112 @@ static uint64_t get_last_bad_page_pfn(int fd)
 	return pfn;
 }
 
+static bool vram_bad_page_exists(int fd, uint64_t addr)
+{
+        char buf[4096];
+        char *line, *saveptr;
+        uint64_t found_addr;
+
+        __igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+        for (line = strtok_r(buf, "\n", &saveptr);
+             line;
+             line = strtok_r(NULL, "\n", &saveptr)) {
+
+                if (sscanf(line, "%lx", &found_addr) == 1 &&
+                    found_addr == addr)
+                        return true;
+        }
+
+        return false;
+}
+
+/* Snapshot every address currently listed in vram_bad_pages. */
+static int get_bad_page_pfns(int fd, uint64_t *pfns, int max)
+{
+        char buf[4096];
+        char *line, *saveptr;
+        uint64_t addr;
+        int count = 0;
+
+        __igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+        if (buf[0] == '\0')
+                return 0;
+
+        for (line = strtok_r(buf, "\n", &saveptr);
+             line && count < max;
+             line = strtok_r(NULL, "\n", &saveptr)) {
+                if (line[0] != '0' || line[1] != 'x')
+                        continue;
+                if (sscanf(line, "0x%lx", &addr) == 1)
+                        pfns[count++] = addr;
+        }
+
+        return count;
+}
+
+static bool pfn_in_list(const uint64_t *pfns, int count, uint64_t pfn)
+{
+        for (int i = 0; i < count; i++)
+                if (pfns[i] == pfn)
+                        return true;
+
+        return false;
+}
+
+static char bus_addr[32];
+
+static void set_bus_addr(int fd)
+{
+        struct pci_device *pci = igt_device_get_pci_device(fd);
+
+        snprintf(bus_addr, sizeof(bus_addr),
+                 "%04x:%02x:%02x.%d",
+                 pci->domain,
+                 pci->bus,
+                 pci->dev,
+                 pci->func);
+}
+
+static int get_bad_page_decay_secs(void)
+{
+        int configfs_fd;
+        int device_fd;
+        int val;
+        int ret;
+
+        configfs_fd = igt_configfs_open("xe");
+        igt_require(configfs_fd >= 0);
+
+        device_fd = openat(configfs_fd,
+                           bus_addr,
+                           O_RDONLY | O_DIRECTORY);
+
+        igt_require_f(device_fd >= 0,
+                      "No configfs entry for %s\n",
+                      bus_addr);
+
+        ret = igt_sysfs_scanf(device_fd,
+                              "bad_page_decay_secs",
+                              "%d",
+                              &val);
+
+        close(device_fd);
+        close(configfs_fd);
+
+        igt_require_f(ret == 1,
+                      "Failed reading bad_page_decay_secs\n");
+
+        return val;
+}
+
+static int decay_gc_wait_secs(int decay_secs)
+{
+        /* Must mirror KMD logic */
+        return max(decay_secs / 8, 60) + 5;
+}
+
 static void inject_fault(int fd)
 {
 	igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
@@ -114,6 +222,21 @@ static void inject_fault(int fd)
 	__igt_debugfs_write(fd, TRIGGER_FILE, "0", 1);
 }
 
+static void require_valid_decay_interval(int decay_interval)
+{
+	igt_require_f(decay_interval > 0 &&
+			decay_interval <= 300,
+			"bad_page_decay_secs=%d is not suitable for this test.\n"
+			"Please reconfigure and reprobe xe:\n"
+			"  echo %s > /sys/bus/pci/drivers/xe/unbind\n"
+			"  echo 30 > /sys/kernel/config/xe/%s/bad_page_decay_secs\n"
+			"  echo %s > /sys/bus/pci/drivers/xe/bind\n",
+			decay_interval,
+			bus_addr,
+			bus_addr,
+			bus_addr);
+}
+
 /**
  * SUBTEST: inject-single-page
  * Description: Inject a single VRAM page fault and verify it appears in vram_bad_pages
@@ -123,6 +246,17 @@ static void inject_fault(int fd)
  * SUBTEST: inject-duplicate-page
  * Description: Inject two pages and verify both appear in vram_bad_pages
  */
+/**
+ * SUBTEST: inject-and-noreclaim
+ * Description: Inject a duplicate VRAM page fault before patrol-scrubber time and
+ * verify it still appears in vram_bad_pages
+ */
+
+/**
+ * SUBTEST: inject-and-reclaim
+ * Description: Inject a page fault once and wait for patrol-scrubber cycle to
+ * completeverify, page should be reclaimed and not appear in vram_bad_pages
+ */
 
 int igt_main()
 {
@@ -188,6 +322,151 @@ int igt_main()
 		igt_assert_eq(after_count, initial_count + 1);
 	}
 
+	igt_subtest("inject-and-noreclaim")
+	{
+		uint64_t pfn;
+		char pfn_str[32];
+		int decay_interval;
+		int wait_time;
+		int debugfs_fd;
+		int ret;
+
+		set_bus_addr(fd);
+		decay_interval = get_bad_page_decay_secs();
+		require_valid_decay_interval(decay_interval);
+
+		wait_time =
+			decay_interval +
+			decay_gc_wait_secs(decay_interval);
+
+		igt_info("decay=%d wait=%d\n",
+				decay_interval, wait_time);
+
+		inject_fault(fd);
+
+		pfn = get_last_bad_page_pfn(fd);
+		igt_assert(pfn != 0);
+
+		sleep(max(decay_interval / 2, 1));
+
+		snprintf(pfn_str, sizeof(pfn_str),
+				"0x%llx",
+				(unsigned long long)pfn);
+
+		/* Reset / override the allowed fault count to 2 (or more) */
+		if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/times", O_WRONLY)) {
+			igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "2");
+		}
+		debugfs_fd = igt_debugfs_open(fd,
+				TRIGGER_FILE,
+				O_WRONLY);
+		igt_assert(debugfs_fd >= 0);
+
+		errno = 0;
+		ret = write(debugfs_fd,
+				pfn_str,
+				strlen(pfn_str));
+
+		igt_assert(ret > 0 || errno == EEXIST);
+
+		close(debugfs_fd);
+
+		sleep(wait_time);
+
+		/* HARD page should survive reclaim */
+		igt_assert(vram_bad_page_exists(fd, pfn));
+	}
+
+	igt_subtest("inject-and-reclaim")
+	{
+		int initial_count, after_count;
+		int decay_interval;
+		int wait_time;
+		uint64_t pfn;
+		uint64_t existing_pfns[MAX_TRACKED_BAD_PAGES];
+		int existing_count;
+		char pfn_str[32];
+		int debugfs_fd;
+		int ret;
+
+		set_bus_addr(fd);
+		decay_interval = get_bad_page_decay_secs();
+		require_valid_decay_interval(decay_interval);
+
+		wait_time =
+			decay_interval +
+			decay_gc_wait_secs(decay_interval);
+
+		igt_info("decay=%d wait=%d\n",
+				decay_interval, wait_time);
+
+		initial_count = count_bad_pages(fd);
+		existing_count = get_bad_page_pfns(fd, existing_pfns,
+				MAX_TRACKED_BAD_PAGES);
+
+		/*
+		 * Pick a valid PFN that is not already in vram_bad_pages.
+		 * Step downward from existing_pfns if bad pages already exist,
+		 * otherwise start from a valid base PFN.
+		 */
+		pfn = existing_count > 0 ? existing_pfns[0] - 1 : 0x100;
+		while (vram_bad_page_exists(fd, pfn) ||
+				pfn_in_list(existing_pfns, existing_count, pfn)) {
+			igt_assert(pfn > 1);
+			pfn--;
+		}
+
+		snprintf(pfn_str, sizeof(pfn_str),
+				"0x%llx",
+				(unsigned long long)pfn);
+
+		/* 1. Inject fault at the chosen non-colliding PFN */
+		if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/times", O_WRONLY))
+			igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "2");
+
+		debugfs_fd = igt_debugfs_open(fd,
+				TRIGGER_FILE,
+				O_WRONLY);
+		igt_assert(debugfs_fd >= 0);
+
+		errno = 0;
+		ret = write(debugfs_fd,
+				pfn_str,
+				strlen(pfn_str));
+		igt_assert(ret > 0);
+		close(debugfs_fd);
+
+		igt_assert(pfn != 0);
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+		igt_assert(vram_bad_page_exists(fd, pfn));
+
+		/* 2. Wait for decay + GC reclaim window */
+		sleep(wait_time);
+
+		/* SOFT page should be reclaimed */
+		igt_assert(!vram_bad_page_exists(fd, pfn));
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count);
+
+		/* 3. Re-trigger the exact same PFN after decay time is over */
+		debugfs_fd = igt_debugfs_open(fd,
+				TRIGGER_FILE,
+				O_WRONLY);
+		igt_assert(debugfs_fd >= 0);
+
+		errno = 0;
+		ret = write(debugfs_fd,
+				pfn_str,
+				strlen(pfn_str));
+		igt_assert(ret > 0);
+		close(debugfs_fd);
+
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+		igt_assert(vram_bad_page_exists(fd, pfn));
+	}
+
 	igt_fixture() {
 		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "0");
 		drm_close_driver(fd);
-- 
2.52.0

