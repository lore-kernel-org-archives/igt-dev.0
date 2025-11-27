Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F282AD111A8
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 16:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AFE10E81E;
	Thu, 27 Nov 2025 16:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxcXp3yv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED9810E81E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764260908; x=1795796908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n6lkdvlVzxLS3e6FUNevT347opbcYucxAol6FKVx2dc=;
 b=OxcXp3yvklIuWjawbI5jSN9E1VmrAZvjLRSCh9BEsF0PEmgIqR9lcgDJ
 AOm9WByNnzZ4qQ8HbLzmhHGJoGNebJWau/7yKFL0BGKOs3OIu8oRqRh9j
 YYtcEFlxxZd0cbHjGsMt/lbeAa2OLB947ABUcHk9qbTZOzIST9LS3VVIf
 MXpk/DxQWuFZl9TKHb1jrwhv64tT9vO5V5Y0CEvQLZ4rGUSsksd2VAwMJ
 87t8DuPlE8wWaeuklyUBVb/RDFuu/S7V/7qXA2awbsryvTK3H833y+Uhg
 9Mb2/CIctAG7WYFaH023Ej5vM51/onl8FN5uChvQz9r+4gSMzwGWDdGkM g==;
X-CSE-ConnectionGUID: nJ78exRuTVuRLeFuWX2Sig==
X-CSE-MsgGUID: zzsho8KKQmKt8tsjDFW9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66204327"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66204327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:27 -0800
X-CSE-ConnectionGUID: 2Zw5cEPERR+cW6lhLm80MA==
X-CSE-MsgGUID: E1xj0ke6QVuLESuR3/81fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193363963"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:25 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v3 2/3] tools/intel_gpu_frequency: Change Intel card
 detection
Date: Thu, 27 Nov 2025 17:28:03 +0100
Message-ID: <20251127162806.173535-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127162806.173535-1-kamil.konieczny@linux.intel.com>
References: <20251127162806.173535-1-kamil.konieczny@linux.intel.com>
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

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 120 +++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 999db756b..10de4c707 100644
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
@@ -75,6 +77,113 @@ get_sysfs_path(const char *which)
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
+		close(dirfd);
+		return -errno;
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
@@ -317,10 +426,15 @@ int main(int argc, char *argv[])
 
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

