Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54923CF857F
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDFE10E73E;
	Thu, 20 Nov 2025 10:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig4Y5xMB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAB410E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634791; x=1795170791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=As12aGddWGbf4pDHvIbniqD0pNdJ8Aes10uJZSyTScs=;
 b=Ig4Y5xMB8LlY+G1aRhzlS0Euuj2NjK81t/qB070aVRsoiB7o6cTNTe7m
 TOnyBHtZlxYHHYBvOtCmwUKGu3cebIcRz/msLSDMVht7ElONxaSVz0hvi
 wsjjYAbw5ckNbW0IgX6uSvsDqoZSutnUlDn2GWV7DMkK/NJi8PN7tqP24
 vFxtnMlOj578Jim8da/cqNFGY/N/6Yp8Y4lMqGcfgZbasz+j5Y4HMNJgQ
 b/1u/7b0OKrCuCuIyYL/bFrolPwDjHvGmgDgMDpHO9CDn3cmlyVP+duzb
 G1sfIn0JXQSq0Ka8PMs2SsWdkh8U+kudqG/C3OJGU788BGAvI/gp8sms+ g==;
X-CSE-ConnectionGUID: XMrXO0wESjaw4g+YnATA4g==
X-CSE-MsgGUID: Z1tAORNCT3awen/CYzgv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736632"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:33:11 -0800
X-CSE-ConnectionGUID: e1EtX5IHRlWsiLigPWF4Jg==
X-CSE-MsgGUID: oDH4XzxuQ7ewhH+bb9hqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="222259871"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:31:57 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v1 2/2] tools/intel_gpu_frequency: Allow printing by
 regular user
Date: Thu, 20 Nov 2025 11:31:38 +0100
Message-ID: <20251120103139.17169-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
References: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
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

Printing frequencies by non-root user is now not possible as it
ends up with an assert. However, reading corresponding sysfs as
non-priviliged user and printing frequencies is possible:

$ cd /sys/class/drm/card1/

$ ls -1 gt_*
gt_RP0_freq_mhz
gt_RP1_freq_mhz
gt_RPn_freq_mhz
gt_act_freq_mhz
gt_boost_freq_mhz
gt_cur_freq_mhz
gt_max_freq_mhz
gt_min_freq_mhz

$ cat gt_*
1300
350
100
0
1300
350
1300
100

Add such feature to this tool, with this:

$ ./intel_gpu_frequency
cur: 350 MHz
min: 100 MHz
RP1: 350 MHz
max: 1300 MHz

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_frequency.c | 132 +++++++++++++++++++++++++++++++++---
 1 file changed, 123 insertions(+), 9 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index a5c3eb092..bb46dfde9 100644
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
@@ -48,6 +50,7 @@ struct freq_info {
 	const char *name;
 	const char *mode;
 	FILE *filp;
+	FILE *fwritep;
 	char *path;
 };
 
@@ -75,6 +78,93 @@ get_sysfs_path(const char *which)
 	return path;
 }
 
+static int
+is_intel_card(int card)
+{
+	static const char fmt[] = "/sys/class/drm/card%d/device/driver/module/drivers";
+	char path[PATH_MAX];
+	struct dirent *entry;
+	int dirfd;
+	DIR *dirp;
+	int found = -1;
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
+		found = strcmp(entry->d_name + 4, "pci:i915");
+		break;
+	}
+
+	closedir(dirp);
+
+	return found ? -1 : 0;
+}
+
+static int
+get_intel_card(void)
+{
+	struct dirent *entry;
+	int intel_card = -1;
+	int dirfd;
+	DIR *dirp;
+
+	dirfd = open("/dev/dri/", O_RDONLY | O_DIRECTORY);
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
+			break; /* error */
+
+		if (is_intel_card(num)) {
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
@@ -83,8 +173,6 @@ initialize_freq_info(struct freq_info *freq_info)
 
 	freq_info->path = get_sysfs_path(freq_info->name);
 	assert(freq_info->path);
-	freq_info->filp = fopen(freq_info->path, freq_info->mode);
-	assert(freq_info->filp);
 }
 
 static void wait_freq_settle(void)
@@ -100,8 +188,16 @@ static void wait_freq_settle(void)
 static void set_frequency(struct freq_info *freq_info, int val)
 {
 	initialize_freq_info(freq_info);
-	rewind(freq_info->filp);
-	assert(fprintf(freq_info->filp, "%d", val) > 0);
+	errno = 0;
+	if (!(freq_info->fwritep))
+		freq_info->fwritep = fopen(freq_info->path, freq_info->mode);
+	if (!(freq_info->fwritep))
+		fprintf(stderr, "Error: cannot open %s with mode %s errno=%d\n",
+			freq_info->path, freq_info->mode, errno);
+
+	assert(freq_info->fwritep);
+	rewind(freq_info->fwritep);
+	assert(fprintf(freq_info->fwritep, "%d", val) > 0);
 
 	wait_freq_settle();
 }
@@ -111,6 +207,13 @@ static int get_frequency(struct freq_info *freq_info)
 	int val;
 
 	initialize_freq_info(freq_info);
+	errno = 0;
+	if (!(freq_info->filp))
+		freq_info->filp = fopen(freq_info->path, "r");
+	if (!(freq_info->filp))
+		fprintf(stderr, "Error: cannot open %s for reading, errno=%d\n",
+			freq_info->path, errno);
+	assert(freq_info->filp);
 	rewind(freq_info->filp);
 	assert(fscanf(freq_info->filp, "%d", &val)==1);
 
@@ -310,10 +413,17 @@ int main(int argc, char *argv[])
 
 	parse_version_or_help(argc, argv);
 
+	device = get_intel_card();
+	if (device < 0) {
+		fprintf(stderr, "No Intel card found in /dev/dri\n");
+		return EXIT_SUCCESS;
+	}
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
@@ -353,10 +463,14 @@ again:
 	}
 
 	for (i = 0; i < ARRAY_SIZE(targets); i++) {
-		if (info[i].filp) {
+		if (info[i].fwritep)
+			fclose(info[i].fwritep);
+
+		if (info[i].filp)
 			fclose(info[i].filp);
+
+		if (info[i].path)
 			free(info[i].path);
-		}
 	}
 
 	return EXIT_SUCCESS;
-- 
2.52.0

