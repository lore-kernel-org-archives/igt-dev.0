Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FDC47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 20:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93F110E8B1;
	Tue, 23 Jan 2024 20:16:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC39B10E8B1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040960; x=1737576960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RVVBlKSPnZH5KxFUL4CcbDCSMpc/bLECF61hn8OhJFg=;
 b=ID+QPEwPVAkfiGod7XvKMIPF3ho4yZzEHIk3gb1V54ddF4xtxTTEii1C
 xvSoUsgPNZbHKfpN3o+iLsGUIecJ3lE+Ul6gTPMCUvjB0BiFXOZiUHIe7
 8+gEhAUofowDV/FqnZtbldTsjcGZtMxm0T1aNmzM4B0ngcMq1O1yqoAHC
 MzDEhm7u5yw8dyIt11nzrCCAcdmgjMP6Ttxs5HTD2JsMiYI1gFlfWyrMz
 CoCPAXJCTE+CY0M7Bak0tSHF7G7VJAKdUssXwJ3IErWdg3iLx6RiK8EJB
 BpVo1yshpg7uBICMDWOPkDC5Ge6d4wy5+n5LiGQWpqZ0MOYnGbcVippCd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8755504"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8755504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1663010"
Received: from unknown (HELO localhost) ([10.246.3.60])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:15:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1 3/8] lib/drmtest: allow opening cards out of order
Date: Tue, 23 Jan 2024 21:15:30 +0100
Message-ID: <20240123201535.108793-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
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

Current __drm_open_driver_another() implementation prevents
opening cards out of order, for example card 0 and card 3. Relax
that condition. While at this, add some more error checks and
prints and also allow user to open already opened card if the
index is the same.

While at this add also caching for names of opened cards.

Changes in __search_and_open() was suggested by Zbigniew.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 100 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 17 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 73d9159af..80809571b 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -315,42 +315,81 @@ err:
 static struct {
 	int fd;
 	struct stat stat;
+	char *fname;
 }_opened_fds[64];
 
 static int _opened_fds_count;
 
+static void _set_opened_fname(int idx, char *name)
+{
+	assert(idx < ARRAY_SIZE(_opened_fds));
+	assert(idx >= 0);
+
+	if (!name) {
+		if (_opened_fds[idx].fname)
+			free(_opened_fds[idx].fname);
+
+		_opened_fds[idx].fname = name;
+		return;
+	}
+
+	if (_opened_fds[idx].fname && !strcmp(name, _opened_fds[idx].fname))
+		return;
+
+	free(_opened_fds[idx].fname);
+	_opened_fds[idx].fname = strdup(name);
+}
+
 static void _set_opened_fd(int idx, int fd)
 {
 	assert(idx < ARRAY_SIZE(_opened_fds));
-	assert(idx <= _opened_fds_count);
+	assert(idx >= 0);
 
 	_opened_fds[idx].fd = fd;
 
 	assert(fstat(fd, &_opened_fds[idx].stat) == 0);
 
-	_opened_fds_count = idx+1;
+	for (int n = _opened_fds_count; n < idx; n++)
+		_opened_fds[n].fd = -1;
+
+	if (idx >= _opened_fds_count)
+		_opened_fds_count = idx + 1;
 }
 
-static bool _is_already_opened(const char *path, int as_idx)
+/* in *err returns -errno or index to _opened_fds[] */
+static bool _is_already_opened(const char *path, int as_idx, int *err)
 {
 	struct stat new;
 
 	assert(as_idx < ARRAY_SIZE(_opened_fds));
-	assert(as_idx <= _opened_fds_count);
+	assert(as_idx >= 0);
 
 	/*
 	 * we cannot even stat the device, so it's of no use - let's claim it's
 	 * already opened
 	 */
-	if (igt_debug_on(stat(path, &new) != 0))
+	if (igt_debug_on(stat(path, &new) != 0)) {
+		if (err)
+			*err = -errno;
+
 		return true;
+	}
+
+	if (err)
+		*err = 0;
+
+	for (int i = 0; i < _opened_fds_count && i < as_idx; ++i) {
+		if (_opened_fds[i].fd == -1)
+			continue;
 
-	for (int i = 0; i < as_idx; ++i) {
 		/* did we cross filesystem boundary? */
 		assert(_opened_fds[i].stat.st_dev == new.st_dev);
 
-		if (_opened_fds[i].stat.st_ino == new.st_ino)
+		if (_opened_fds[i].stat.st_ino == new.st_ino) {
+			*err = i;
+
 			return true;
+		}
 	}
 
 	return false;
@@ -359,23 +398,40 @@ static bool _is_already_opened(const char *path, int as_idx)
 static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
 {
 	const char *forced;
+	int err;
 
 	forced = forced_driver();
 	if (forced)
 		igt_debug("Force option used: Using driver %s\n", forced);
 
-	for (int i = 0; i < 16; i++) {
+	for (int i = 0, idx = -1; i < 16 && idx < as_idx; i++) {
 		char name[80];
-		int fd;
+		int fd = -1;
 
 		sprintf(name, "%s%u", base, i + offset);
 
-		if (_is_already_opened(name, as_idx))
-			continue;
+		if (_is_already_opened(name, as_idx, &err)) {
+			if (err < 0)
+				continue;
+
+			if (idx + 1 < as_idx) {
+				++idx;
+				continue;
+			}
+		}
 
-		fd = __drm_open_device(name, chipset);
-		if (fd != -1)
+		if (err >= 0)
+			fd = __drm_open_device(name, chipset);
+		if (fd != -1) {
+			++idx;
+			if (idx < as_idx) {
+				close(fd);
+				continue;
+			}
+
+			_set_opened_fname(as_idx, name);
 			return fd;
+		}
 	}
 
 	return -1;
@@ -542,11 +598,21 @@ int __drm_open_driver_another(int idx, int chipset)
 		if (!found || !strlen(card.card))
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
-		else
-			fd = __open_driver_exact(card.card, chipset);
+		else {
+			int ret;
 
+			if (_is_already_opened(card.card, idx, &ret))
+				if (ret >= 0 && idx != ret)
+					igt_warn("card maching filter %d is already opened at idx %d\nfilenames: %s::%s",
+						 idx, ret, card.card, _opened_fds[ret].fname);
+				else
+					fd = __open_driver_exact(card.card, chipset);
+			else
+				fd = __open_driver_exact(card.card, chipset);
+
+			if (fd != -1)
+				_set_opened_fname(idx, card.card);
+		}
 	} else {
 		/* no filter for device idx, let's open whatever is available */
 		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
-- 
2.42.0

