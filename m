Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9031BE7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974B10EAC4;
	Wed, 18 Dec 2024 05:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pt72Bzph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A4C10EAB4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498839; x=1766034839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=36BlyOXThtN4sC7WcAuoST9PWZZuoU3K9geR/yDNMsU=;
 b=Pt72BzphrzWCRO3g40aQDAqtm+H8iZijFGZB/Ja5igPJGnJ+KfEk+ZLN
 MZqDJaG9U5FDYpEyx3IQr5z0m8fyo4BNyzy+eJD71CEogKpIxvApxG6uU
 beWzSrZOk6rUIVR5T2eqQj0lNJk1QA1fOwdyejo/Xyi7grhmSbKg9xQQh
 r9Gv0d85bM1l28xHAygad54zDVB2k73Gx1mo/WAenLvBpFgveZ0b6tyhi
 z+YLYMJo8a9wjj3Qw4zdXODH3+/fKU2eiMjEVQp3g2AR0W5NOmMvUsTkR
 KH24K6uOcQhgcLpqYDzMBM1zH7YfwWQS0UeWQy+y34MWIM9PjGXR8Toqs A==;
X-CSE-ConnectionGUID: Bqnlm4/pTcmm+w2/jCIZHw==
X-CSE-MsgGUID: wff0kSnmQL+/oqnk52ntvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45649499"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45649499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
X-CSE-ConnectionGUID: S/byfcDIQSeRPHu+NuCeag==
X-CSE-MsgGUID: LoAZukHvRGKMB5F9a+0eqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102588177"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/4] lib/drmtest: Fix drm_close_driver()
Date: Tue, 17 Dec 2024 21:13:21 -0800
Message-ID: <20241218051324.2696557-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218051324.2696557-1-lucas.demarchi@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
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

When the driver is closed, make sure to invalidate the opened_devices,
otherwise it may later try use that info and wrongly detect the device
as "already opened". Also make sure that if the device can't even be stat'ed,
it should be considered as "already opened" since that fd refers to something
that already went away.

While at it fix some minor typos and coding style nearby.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/drmtest.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2dd4540b8..c541be132 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -377,7 +377,7 @@ err:
 static struct {
 	int fd;
 	struct stat stat;
-}_opened_fds[64];
+} _opened_fds[64];
 
 static int _opened_fds_count;
 
@@ -393,6 +393,20 @@ static void _set_opened_fd(int idx, int fd)
 	_opened_fds_count = idx+1;
 }
 
+static void _set_closed_fd(int fd)
+{
+	unsigned int idx;
+
+	for (idx = 0; idx < ARRAY_SIZE(_opened_fds); idx++) {
+		if (_opened_fds[idx].fd == fd) {
+			memset(&_opened_fds[idx].stat, 0,
+			       sizeof(_opened_fds[idx].stat));
+			_opened_fds[idx].fd = -1;
+			break;
+		}
+	}
+}
+
 static bool _is_already_opened(const char *path, int as_idx)
 {
 	struct stat new;
@@ -401,11 +415,10 @@ static bool _is_already_opened(const char *path, int as_idx)
 	assert(as_idx <= _opened_fds_count);
 
 	/*
-	 * we cannot even stat the device, so it's of no use - let's claim it's
-	 * already opened
+	 * we cannot even stat the device, so it's of no use
 	 */
 	if (igt_debug_on(stat(path, &new) != 0))
-		return true;
+		return false;
 
 	for (int i = 0; i < as_idx; ++i) {
 		/* did we cross filesystem boundary? */
@@ -605,10 +618,9 @@ int __drm_open_driver_another(int idx, int chipset)
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
 		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
+			igt_warn("card matching filter %d is already opened\n", idx);
 		else
 			fd = __open_driver_exact(card.card, chipset);
-
 	} else {
 		/* no filter for device idx, let's open whatever is available */
 		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
@@ -806,6 +818,8 @@ int __drm_close_driver(int fd)
 	if (is_xe_device(fd))
 		xe_device_put(fd);
 
+	_set_closed_fd(fd);
+
 	return close(fd);
 }
 
-- 
2.47.0

