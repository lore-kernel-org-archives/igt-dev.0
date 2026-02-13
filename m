Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F16EDF154
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57710E7D0;
	Fri, 13 Feb 2026 10:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7OnFwmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703E10E7D0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980357; x=1802516357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DvAGNUCQG9NHbc2bsV63F9g8pRq+JLPEp7UokV0gjUs=;
 b=S7OnFwmZio6n/SwuHf9Ka7a2xraSGA3e4meviyihmAdw5Mx7NP5TRuDc
 I7jQ8nozb7hwdZh2ZnZJJTuL6YtNsoZjnfZjvY6uAsedxziSiM3QicDH1
 8hsMJBMBC3W8rFAW5yl90i3yUVClUXE7iGg5q9tPiGSUsTs5mYoO19GiJ
 f0CYC3mp+Rd4shK7Ad6iFtdM8bXP9RZh4WllAU9K9w3sathpoQmiYPIdR
 V8AFijvoE1tr7WxtLB/S+XEDwhXqMA3xldOn8mo+rb0k4un9JQ8Q1bbQy
 yvXY+fOUgWaPVrU4PHMX8TyTo5VWka+6YZWTRi6B+WNA9Cff7c3k87QKs w==;
X-CSE-ConnectionGUID: pI/u2M11TH+xiVfqwBqx8A==
X-CSE-MsgGUID: gi0jcfu5TeyzbjNUMF32ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72258571"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72258571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:17 -0800
X-CSE-ConnectionGUID: 71wXY7zGTqGeMx8vniHGwQ==
X-CSE-MsgGUID: +ISeMBbvQOyjH2594ThbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="243489858"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:15 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 2/5] lib/xe/xe_eudebug: Modify toggle error handling
Date: Fri, 13 Feb 2026 11:58:58 +0100
Message-ID: <20260213105855.3790052-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260213105855.3790052-7-christoph.manszewski@intel.com>
References: <20260213105855.3790052-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Convert __xe_eudebug_enable_getset to use errno. Abort in
xe_eudebug_enable on error (other than -ENOENT) to not leave
the environment in potentially dirty state.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2387b74f8..41eed7614 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1829,6 +1829,7 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&em);
 }
 
+#define EU_DEBUG_TOGGLE "device/enable_eudebug"
 /**
  * __xe_eudebug_enable_getset
  * @fd: xe client
@@ -1838,13 +1839,12 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
  * Stores current eudebug feature state in @old if not NULL. Sets new eudebug
  * feature state to @new if not NULL. Asserts if both @old and @new are NULL.
  *
- * Returns: 0 on success, -1 on failure.
+ * Returns: 0 on success, -errno on failure.
  */
 int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 {
-	static const char * const fname = "enable_eudebug";
 	int ret = 0;
-	int sysfs, device_fd;
+	int sysfs;
 	bool val_before;
 	struct stat st;
 
@@ -1853,15 +1853,10 @@ int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 
 	sysfs = igt_sysfs_open(fd);
 	if (sysfs < 0)
-		return -1;
-
-	device_fd = openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
-	close(sysfs);
-	if (device_fd < 0)
-		return -1;
+		return -errno;
 
-	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
-		ret = -1;
+	if (!__igt_sysfs_get_boolean(sysfs, EU_DEBUG_TOGGLE, &val_before)) {
+		ret = -errno;
 		goto out;
 	}
 
@@ -1871,14 +1866,14 @@ int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 		*old = val_before;
 
 	if (new) {
-		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
-			igt_assert_eq(igt_sysfs_get_boolean(device_fd, fname), *new);
+		if (__igt_sysfs_set_boolean(sysfs, EU_DEBUG_TOGGLE, *new))
+			igt_assert_eq(igt_sysfs_get_boolean(sysfs, EU_DEBUG_TOGGLE), *new);
 		else
-			ret = -1;
+			ret = -errno;
 	}
 
 out:
-	close(device_fd);
+	close(sysfs);
 
 	return ret;
 }
@@ -1896,10 +1891,18 @@ out:
  */
 bool xe_eudebug_enable(int fd, bool enable)
 {
+	char sysfs_path[PATH_MAX];
 	bool old = false;
 	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
 
-	igt_skip_on(ret);
+	if (ret == -ENOENT) {
+		igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
+		igt_skip("'%s/" EU_DEBUG_TOGGLE
+			 "' sysfs attribute not found, EU DEBUG not supported\n", sysfs_path);
+	}
+
+	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
+		       enable ? "enable" : "disable");
 
 	return old;
 }
-- 
2.47.1

