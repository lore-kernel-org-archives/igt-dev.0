Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20548E9537A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC0E10E5CA;
	Wed,  4 Feb 2026 10:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOiyt3Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7010E1C3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770202678; x=1801738678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vp0f6WW5S6f2isOIqJMow+TFChyRHlGJjJgpEUkEHw0=;
 b=MOiyt3PlZH7OjoUs6j4cGjEjUWdTpNBmmmXlWM1gmlen8dfvvUn/EoE4
 Kik1/adD+x9hjo5O8Rzys80oB3nDoDzTiLyaUVWQDj1UkYEvrfXjkp585
 A79ifiVPjNxx1vVlHoQ1/FUzqpChA9oWmtiWBFwOWBH6RvZRW4E/oocbL
 7UpfI8cFjgyYpVKwjND4oPCuHfdwvyfPjGteEPCC7WpXL9rR04c3z3j1A
 S8PUzE1KZ8ASqDADwEa14LhYniv3c/poaaUOuzS5oKvIsiVB3DSzm96VK
 91//oECYvPK0j4c20tGOVKbehcFI5GsGIAQVi6trUpx5qpx9wX/V0OdHz A==;
X-CSE-ConnectionGUID: cPjz5F/OQpawyEF9JZB4fg==
X-CSE-MsgGUID: bhEYKTmcT+a0POlFM1T/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75007228"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75007228"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:57:58 -0800
X-CSE-ConnectionGUID: KJwZjEDsQyi3Z0/w0/lXww==
X-CSE-MsgGUID: 0MxpqW93THyiB0nmuyN+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="215110658"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:57:57 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/3] lib/xe_eudebug: Add retry mechanism in
 xe_eudebug_enable
Date: Wed,  4 Feb 2026 11:57:40 +0100
Message-Id: <20260204105742.13871-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204105742.13871-1-dominik.karol.piatkowski@intel.com>
References: <20260204105742.13871-1-dominik.karol.piatkowski@intel.com>
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

Add retry mechanism in xe_eudebug_enable to make sure the cleanup will
not fail due to race conditions. Abort on unsuccessful cleanup to not
leave the environment in potentially dirty state.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---

v2: Preserve skip behavior in xe_eudebug_enable

 lib/xe/xe_eudebug.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2387b74f8..f11f99725 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1838,7 +1838,7 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
  * Stores current eudebug feature state in @old if not NULL. Sets new eudebug
  * feature state to @new if not NULL. Asserts if both @old and @new are NULL.
  *
- * Returns: 0 on success, -1 on failure.
+ * Returns: 0 on success, -1 on failure, -2 on sysfs toggle read failure.
  */
 int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 {
@@ -1861,7 +1861,7 @@ int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 		return -1;
 
 	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
-		ret = -1;
+		ret = -2;
 		goto out;
 	}
 
@@ -1897,9 +1897,25 @@ out:
 bool xe_eudebug_enable(int fd, bool enable)
 {
 	bool old = false;
-	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+	int ret;
+
+	for (int i = 0; i < 10; i++) {
+		ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+
+		if (!ret)
+			break;
+
+		igt_skip_on_f(ret == -2, "xe_eudebug_enable: sysfs toggle read failure\n");
+
+		if (i < 9) {
+			igt_debug("xe_eudebug_enable: Failed, retrying...\n");
+
+			sleep(1);
+		}
+	}
 
-	igt_skip_on(ret);
+	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
+		       enable ? "enable" : "disable");
 
 	return old;
 }
-- 
2.34.1

