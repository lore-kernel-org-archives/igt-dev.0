Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D4EDF148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072AF10E7D0;
	Fri, 13 Feb 2026 10:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feYr4aU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AABD10E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980363; x=1802516363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KCQVXKCSwsWEQ71IVlXHHRrLmZmM93PHk5MQPtDb0xk=;
 b=feYr4aU5YUAYpAAgUyeEXx+GsduX3146ATxh/aKyhIpyALrbRpit2XQ/
 iom7p4V+x+pe2a4GZpdGA5KgX+dv76l4TP1yUKAbvUVwln7LK5SDR0ilA
 fo6gE5HGqum54Eh+TMMKorIQrYP4TLxjn/YdQ5gJlwhvv1ikgLOi5AWxp
 h3nYNcAYPxuXu4mBrZGl0BJDoFiPBCV88zQKPE6yDcVgntJXJ6B21RWuC
 xgPuXp2fMTCQgS+SW8QbVeD+G84T1CD/CEYSyz3aDmTEKH5a0na7yxzVV
 hwFAxyFFdV8gNiBaWLLzRgYdUo0B136oeEceCrE592TPopnGEyvaWCn8R g==;
X-CSE-ConnectionGUID: 74yXtl/ORYagORPQz0ppFw==
X-CSE-MsgGUID: cFG1OPQDTCCm7eyeturC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72258583"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72258583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:23 -0800
X-CSE-ConnectionGUID: LLloYvbjQ8OXH6BTLQQ46w==
X-CSE-MsgGUID: T/csPtbTQ0eR7tRclvTHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="243489894"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:21 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
Date: Fri, 13 Feb 2026 11:59:01 +0100
Message-ID: <20260213105855.3790052-12-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260213105855.3790052-7-christoph.manszewski@intel.com>
References: <20260213105855.3790052-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
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

Add helper function to get the card name as defined in the:
'/sys/class/drm/card<N>' path.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index fcd2b398a..c78c4f3a5 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1898,6 +1898,34 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 }
 
 #define EU_DEBUG_TOGGLE "device/enable_eudebug"
+
+static char *get_card_name(int fd, char *card_name, size_t len)
+{
+	char sysfs_path[PATH_MAX];
+	char link_target[PATH_MAX];
+	char *card_start;
+	ssize_t link_len;
+
+	if (!igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)))
+		return NULL;
+
+	link_len = readlink(sysfs_path, link_target, sizeof(link_target) - 1);
+	if (link_len < 0)
+		return NULL;
+
+	link_target[link_len] = '\0';
+
+	card_start = strstr(link_target, "card");
+	if (!card_start)
+		return NULL;
+
+	snprintf(card_name, len, "%s", card_start);
+	card_start = strchr(card_name, '/');
+	if (card_start)
+		*card_start = '\0';
+
+	return card_name;
+}
 /**
  * __xe_eudebug_enable_getset
  * @fd: xe client
@@ -1959,7 +1987,7 @@ out:
  */
 bool xe_eudebug_enable(int fd, bool enable)
 {
-	char sysfs_path[PATH_MAX];
+	char card_name[NAME_MAX];
 	bool old = false;
 	int ret = 0;
 
@@ -1981,9 +2009,13 @@ bool xe_eudebug_enable(int fd, bool enable)
 	}
 
 	if (ret == -ENOENT) {
-		igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
-		igt_skip("'%s/" EU_DEBUG_TOGGLE
-			 "' sysfs attribute not found, EU DEBUG not supported\n", sysfs_path);
+		if (get_card_name(fd, card_name, sizeof(card_name)))
+			igt_skip("'/sys/class/drm/%s/" EU_DEBUG_TOGGLE
+				 "' sysfs attribute not found, EU DEBUG not supported\n",
+				 card_name);
+		else
+			igt_skip("'" EU_DEBUG_TOGGLE
+				 "' sysfs attribute not found, EU DEBUG not supported\n");
 	}
 
 	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
-- 
2.47.1

