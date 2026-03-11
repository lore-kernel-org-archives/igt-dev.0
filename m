Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1821061206
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 11:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1010E88F;
	Wed, 11 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip4TPXRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2EB10E88F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773227226; x=1804763226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWBk23MwlY9/PP0KhBjTQeoeTpkbv4pM0eVZW/YUvm4=;
 b=ip4TPXRR476f/6xAJLCCQIyvNs9wUIshCWgh8f0zWjmVjd8EbB0q/JKx
 730+IlTj11c69b4rMySkxMg2Mos9oFfWSd6ilDkVsnU5nJlkPYJQNonqH
 VAuI4AD9pdrLghXNDpGfqm4/kRIrpD6OKTCpaS2OfBiku9qKLyg0xWhgq
 hUsafd+4u/mqNVfQ+ye8HEu/wYd3mhDWjNqbzj0YKYuVzO2dHWo97mRiw
 j+EtQelu0okgLgLHyH+lgJ5sLcqu1B5NVeLVwa/6qiuFriWX9SUBchBsC
 OQFX5Wi255BJXELJO7KC9F83ZM0oPRTmPKCiwStMWRpJUtaPjSZ1cH0bE Q==;
X-CSE-ConnectionGUID: 7R5Yry51RF+2i2Y2W/YJMA==
X-CSE-MsgGUID: TaFJbzDnQiaRzuaqsTvh8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85378248"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85378248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:07:06 -0700
X-CSE-ConnectionGUID: Di6RMFV/TlSxgsmK1WiAPw==
X-CSE-MsgGUID: Mv97S4M2QIK7WRl5C8X0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258344708"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:07:04 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 5/5] lib/xe/xe_eudebug: Get drm card sysfs path
Date: Wed, 11 Mar 2026 12:06:42 +0100
Message-ID: <20260311110636.798120-12-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260311110636.798120-7-christoph.manszewski@intel.com>
References: <20260311110636.798120-7-christoph.manszewski@intel.com>
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

Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Link: https://lore.kernel.org/r/20260220153748.210381-12-christoph.manszewski@intel.com
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index c722a968a..3bffda561 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1900,6 +1900,34 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
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
@@ -1961,7 +1989,7 @@ out:
  */
 bool xe_eudebug_enable(int fd, bool enable)
 {
-	char sysfs_path[PATH_MAX];
+	char card_name[NAME_MAX];
 	bool old = false;
 	int ret = 0;
 
@@ -1983,9 +2011,13 @@ bool xe_eudebug_enable(int fd, bool enable)
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

