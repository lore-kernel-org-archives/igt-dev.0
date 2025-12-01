Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81BD116F5
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5F10E155;
	Mon,  1 Dec 2025 17:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nc24Th/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55E10E435
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610400; x=1796146400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8fz5JTYb2kUyEY75yktQlR7vqPh7dodR0UHz9qGrHFU=;
 b=nc24Th/REWNn00qNEOIX9g8wuwB9DmA8E1dQy/ZeV5YAueJCbEibIoTa
 0493nGyijmWFiaNGFNtK0fdV0yGvBe6CXg0/NHabxVaRFUzACiMDReJKM
 2xMYP3oazyBQ3e/Ni75pqqFgU7s/HczmmWmlNpeGRqGO+BpN7mA7xOF/d
 zWz1jEwRdbTlB7IhtuYVeqbxf4tTWM3B0JJxmG412TgoH65sJ2ktVuitX
 vGPpjJG9vPzK0Y9eUt0uW1a3zBxk8OemldajzInmSNUfPwYvjFZOmm5n8
 DUNlnRAjbtYUW18iHWDvEHvvZ1YZ7Upqcg0xMmJtmAhuivbSuJvK4x7vP w==;
X-CSE-ConnectionGUID: /qL3wjpsQQq9ZodoKk1mYA==
X-CSE-MsgGUID: 4jNzfi0PTA6pKN8blxexDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89205475"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89205475"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:19 -0800
X-CSE-ConnectionGUID: sqDA48yaRGm7BLooXvXa3Q==
X-CSE-MsgGUID: +rb89v6xSS23i5+/QRs6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193248463"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:18 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v4 2/3] tools/intel_gpu_frequency: Change Intel card
 detection
Date: Mon,  1 Dec 2025 18:33:02 +0100
Message-ID: <20251201173305.111564-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
References: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
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

Change card detection by using directly sysfs. With this on
systems without Intel card or without any drm driver loaded,
instead of failing on assert it will print one of messages:

No Intel card found in /dev/dri

or

Cannot open /dev/dri/
Error: <errno>

when /dev/dri folder is not present.

v2: split out card detection to separate patch (Kamil)
v3: clarify description and error prints (Krzysztof)
v4: fix error reporting after fdopendir (Kamil)

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 122 +++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 999db756b..7a2ac89b9 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -22,6 +22,8 @@
  */
 
 #include <assert.h>
+#include <dirent.h>
+#include <fcntl.h>
 #include <getopt.h>
 #include <stdio.h>
 #include <time.h>
@@ -75,6 +77,115 @@ get_sysfs_path(const char *which)
 	return path;
 }
 
+/* Returns:
+ * 1 if Intel card was bound by i915 driver
+ * 0 otherwise
+ * -errno on error
+ */
+static int
+is_intel_card(int card)
+{
+	static const char fmt[] = "/sys/class/drm/card%d/device/driver/module/drivers";
+	char path[PATH_MAX];
+	struct dirent *entry;
+	int dirfd;
+	DIR *dirp;
+	int found = 0;
+
+	if (card < 0)
+		return -1;
+
+	sprintf(path, fmt, card);
+
+	dirfd = open(path, O_RDONLY | O_DIRECTORY);
+	if (dirfd < 0)
+		return -errno;
+
+	dirp = fdopendir(dirfd);
+	if (!dirp) {
+		int err = errno;
+
+		close(dirfd);
+		return -err;
+	}
+
+	while ((entry = readdir(dirp))) {
+		if (strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		if (strncmp(entry->d_name, "pci:", 4))
+			continue;
+
+		if (!strcmp(entry->d_name, "pci:i915")) {
+			found = 1;
+			break;
+		}
+	}
+
+	closedir(dirp);
+
+	return found;
+}
+
+static void __attribute__((noreturn))
+exit_error(const char *msg, int err)
+{
+	if (msg)
+		fprintf(stderr, "%s\n", msg);
+
+	if (err > 0)
+		fprintf(stderr, "Error: %d %s\n", err, strerror(err));
+
+	exit(EXIT_FAILURE);
+}
+
+static int
+get_intel_card(void)
+{
+	struct dirent *entry;
+	int intel_card = -1;
+	int dirfd, err;
+	DIR *dirp;
+
+	dirfd = open("/dev/dri/", O_RDONLY | O_DIRECTORY);
+	if (dirfd < 0)
+		exit_error("Cannot open /dev/dri/", errno);
+
+	dirp = fdopendir(dirfd);
+	if (!dirp) {
+		err = errno;
+		close(dirfd);
+		exit_error("Cannot open directory /dev/dri/", err);
+	}
+
+	while ((entry = readdir(dirp))) {
+		int num;
+
+		if (strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		if (entry->d_type == DT_DIR)
+			continue;
+
+		if (strncmp(entry->d_name, "card", 4))
+			continue;
+
+		if (sscanf(entry->d_name, "card%d", &num) != 1)
+			exit_error("Cannot parse card ID as integer", 0);
+
+		if (is_intel_card(num) > 0) {
+			intel_card = num;
+			break;
+		}
+	}
+
+	closedir(dirp);
+
+	return intel_card;
+}
+
 static void
 initialize_freq_info(struct freq_info *freq_info)
 {
@@ -317,10 +428,15 @@ int main(int argc, char *argv[])
 
 	parse_version_or_help(argc, argv);
 
+	device = get_intel_card();
+	if (device < 0)
+		exit_error("No Intel card found in /dev/dri\n", 0);
+
 	fd = __drm_open_driver(DRIVER_INTEL);
-	devid = intel_get_drm_devid(fd);
-	device = igt_device_get_card_index(fd);
-	close(fd);
+	if (fd >= 0) {
+		devid = intel_get_drm_devid(fd);
+		close(fd);
+	}
 
 	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
 	fail = write;
-- 
2.52.0

