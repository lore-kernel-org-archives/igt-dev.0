Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97BBCFC501
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CE610E8F7;
	Fri, 21 Nov 2025 19:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfz/Cw8C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB55F10E8F7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763753756; x=1795289756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MCDWu5tkHXN902J2Yi5ONqu3F2EC3zVQAGjxH7hyhEo=;
 b=nfz/Cw8CHP7yiZgkI1uoYIX2acQSK2AzkdEQdb4n0tUAfRIrjStSWDz4
 4bQI0uufEjvi0yQmC5Y95lu1MZV4YKLxBPIFXdjKTcpyxvMifWqJT9sVx
 9YDirZtp5rpGSOf1q30HSq58yf6WrUf96zsGYxoGqG3LlZyxj8QuYWFk8
 rbhejcLaoVu0ih6mtvL25e92vOWvKestZGwkxGiRwSBn14sPKDtuyNz+M
 GQdQ2fj5pWpSBusMa4EExQrfnPcRxv93CStYAmPqcT4nwjcU98iZr3x6N
 5thGekL+6VkxqunzGGdUWDWF1qFuw/d2McqJWlbjrqfVnK+lFx04Ao82+ A==;
X-CSE-ConnectionGUID: J+x7K/MoQZ+wnh+53jFv7A==
X-CSE-MsgGUID: fKIERmuaREqCani3hBs7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69720450"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69720450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:56 -0800
X-CSE-ConnectionGUID: m7rzMalyQayiPacjjDyw8Q==
X-CSE-MsgGUID: H2GOjy0gS4G4WsYjjrukXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191657033"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:54 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v2 2/3] tools/intel_gpu_frequency: Change Intel card
 detection
Date: Fri, 21 Nov 2025 20:35:23 +0100
Message-ID: <20251121193539.195005-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
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

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 120 +++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 3 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 999db756b..af939dbe0 100644
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
+ * 1 if Intel card with i915 driver binded
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
+		exit_error("Cannot open dir /dev/dri/", err);
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
+			exit_error("cannot parse integer", 0);
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

