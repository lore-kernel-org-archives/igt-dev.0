Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4676AC56201
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A0210E7F5;
	Fri, 20 Feb 2026 15:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ID6jL5iJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509C10E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771601906; x=1803137906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zhWl5I1dGgJbd825k/B45KvEV7oOQxWJgFJuY9NWFw=;
 b=ID6jL5iJ1hn/2wNMnvL4my/t+gOOqxtXW8EU5RQavQSDFSGEL00rzjki
 IhJHB43hQQXGbiJF+eGp3pZbRAeiRyZFgGpzi71pKx9XRj7/sA0DCF6Qy
 W4JQCwRWmLQ4Gl7F5H/EF9P13jXHuDMAdJ5l3O1eT5m0WWMFCk7GhYaQv
 7KTc9jzfhATSAy1eXGNvZ0R4mKEQOc42b6F6LGMouwtm31PgbSJ/rFqi1
 atRRIQ+5GAKKqb0zzmGEKiXi16OQ+F5FSktyf8evMrBMtkVlKvNgVXx9O
 mE3Mm9xy7lNXvTxPM6A53Eyp6N4VBejBzQBQS+03ZNbKjzZtE+tbdAX1k A==;
X-CSE-ConnectionGUID: sBYkAAAiThyMIwxuNuT/2g==
X-CSE-MsgGUID: yyNBaD10SNSUMmcZCLpieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90105386"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90105386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:26 -0800
X-CSE-ConnectionGUID: ifBn0zJjRNGYC15ho/YsqA==
X-CSE-MsgGUID: 8XZzoecNQlCn0k21q9mwmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215007740"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:24 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
Date: Fri, 20 Feb 2026 16:37:54 +0100
Message-ID: <20260220153748.210381-12-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260220153748.210381-7-christoph.manszewski@intel.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
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
index a0caad2c3..37ce1e2ac 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1901,6 +1901,34 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
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
@@ -1962,7 +1990,7 @@ out:
  */
 bool xe_eudebug_enable(int fd, bool enable)
 {
-	char sysfs_path[PATH_MAX];
+	char card_name[NAME_MAX];
 	bool old = false;
 	int ret = 0;
 
@@ -1984,9 +2012,13 @@ bool xe_eudebug_enable(int fd, bool enable)
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

