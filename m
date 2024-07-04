Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC90C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 16:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A2A10EA0E;
	Thu,  4 Jul 2024 16:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cClFPac1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D413A10EA0E
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720111485; x=1751647485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XINKBNRCkZBDDfXuIfamvN7CYxs6kXiRWnpmNgY1adQ=;
 b=cClFPac1QxKgwtLU0s5RGh6ueboX0P6xs5gU7ltnz+jS870prLVzpQsB
 SiYSCrdmBO0wJ1nw+FqD6BIRLR1x1HXmiA9MPBJr2mL9hcKctcZokTmR9
 2HfqT4FCTMF4Kf+3jSWUt6SlBt2UdskH5646qGy0VWfC0J2WQEySuQ1Zz
 TS71Xq9lAJYvNarPMCNKoJt4iI6h7DY2CrNYnWVFjA79Q2a/Kz103IAed
 LAOP05DeLCYtL2MUnSqd2nKcy7hoqF9OZ8O+if40vBbyyI56nqiOtcu10
 7RElWeMsPneS1qudjZTgEe+xz1KB94UmdQbz/DvNOCUEmyvY7NhgdKxMF g==;
X-CSE-ConnectionGUID: 0Y14iN6oQ5uZk/JNx1W/aQ==
X-CSE-MsgGUID: rTdp1P96TvO6Jg8NbN0V2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17543959"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17543959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 09:44:44 -0700
X-CSE-ConnectionGUID: M8EhJhmJTHm1iPxAAWfbwA==
X-CSE-MsgGUID: AWrKgcepQ2qEcO1B7boRAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51508266"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 09:44:41 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] lib/igt_device_scan: Skip attributes in subdirectories
Date: Thu,  4 Jul 2024 18:44:37 +0200
Message-Id: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Skip attributes in subdirectories as they are not used for filtering.
This change improves speed and reduces the impact of non-DRM related
component bugs on testing, such as ASPM issues.

Rename function is_on_blacklist to is_on_blocklist to promote more
inclusive language.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_device_scan.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 9a2da3d62..6473ca7ad 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -433,7 +433,7 @@ static enum dev_type __pci_devtype(uint16_t vendor, uint16_t device, const char
 /* Reading sysattr values can take time (even seconds),
  * we want to avoid reading such keys.
  */
-static bool is_on_blacklist(const char *what)
+static bool is_on_blocklist(const char *what)
 {
 	static const char *keys[] = { "config", "modalias", "modes",
 				      "resource",
@@ -442,16 +442,18 @@ static bool is_on_blacklist(const char *what)
 				      "resource0_wc", "resource1_wc", "resource2_wc",
 				      "resource3_wc", "resource4_wc", "resource5_wc",
 				      "uevent", NULL};
-	const char *key;
-	int i = 0;
+	const char **key;
 
 	if (what == NULL)
 		return false;
 
-	while ((key = keys[i++])) {
-		if (strcmp(key, what) == 0)
+	/* Skip attributes in subdirectories */
+	if (strchr(what, '/') != NULL)
+		return true;
+
+	for (key = keys; *key; key++)
+		if (strcmp(*key, what) == 0)
 			return true;
-	}
 
 	return false;
 
@@ -553,7 +555,7 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
 		const char *key = udev_list_entry_get_name(entry);
 		const char *value;
 
-		if (is_on_blacklist(key)) {
+		if (is_on_blocklist(key)) {
 			entry = udev_list_entry_get_next(entry);
 			continue;
 		}
-- 
2.31.1

