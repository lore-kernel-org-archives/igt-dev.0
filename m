Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E9C47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116D10F1F5;
	Thu, 25 Jan 2024 18:36:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808CB10F1F5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706207811; x=1737743811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2m2OWliyCLiauYPy2FBJxgkMDSXjW//kk7eopsbh6DQ=;
 b=AhoK+u1VeXsPuTOVTMOoUUJBOzE8tcRarJFrlo2P95smGGTWScqQ6PxW
 nJM4IVDcR4SQj2cWTNQ5ynVYyRec4Emo83nj1WK00JR+HeNBG3TNAdxln
 zmN0lJPL4TrmWtkk1U17lohfUu7ag3RsHhNx7odE0EynHJTz7d4MHLCBI
 yCNmWR8JSTEGkr5ebYXnuVw31sX6hqWdb+QH96wa3VyMz0aoNKakTLqw0
 3XItdhUmqZapS5znzQBSGFpPGmrlKNmX/dBl5M0nWWueqPuZl3FWnZykI
 rvM9Lx28QxhSQNNgCM4j1aJuyflqMs+U6pGp95raYdU77iVlH3D46e8CB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20800798"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20800798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2340238"
Received: from unknown (HELO localhost) ([10.245.100.131])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:50 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 3/8] lib/drmtest: allow opening cards out of order
Date: Thu, 25 Jan 2024 19:36:26 +0100
Message-ID: <20240125183632.50422-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

