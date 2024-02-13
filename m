Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177BEC48260
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 17:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09EC10E39F;
	Tue, 13 Feb 2024 17:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcBb8lE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571010E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707847050; x=1739383050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Li5cP8l3soHPGThYUa9/S7UXQtc27fuSQuXezpB+Jj8=;
 b=TcBb8lE0+Iq74pHGCnx6P4qHfqOuRmH+/zGD2XoeERnGmoL3BE/kzSU5
 3/rrrOarOdOfkb+A8XfprYmm0IR9372N3BeAp5kFLWcGwgCXdzin8EFEX
 FmYm7v3vpo33S7tmrKDu3CubWznlAIaYlqv3NZauJExNUXbh01NN4U9Sd
 9E1PQ3hM0CkYPy3Q/MnTT0ideSX5FznAkGgBXM4Y0m9nNgzSx+QZ+NGYA
 u168fja4sURClNcIDqB3V7ryZtnXD8/y+FcrOs6Grm+kbcx0c1kdDS7eK
 Wqdu/FMeKVVKEI86JvJjGEOfF3/4HDd9OVc/zdwgEh0VaH1LuywuhQ+t3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396303235"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="396303235"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 09:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2919784"
Received: from unknown (HELO localhost) ([10.246.5.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 09:57:27 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Chris Wilson <chris@chris-wilson.co.uk>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1] drmtest: drop legacy path from filtered opens
Date: Tue, 13 Feb 2024 18:57:22 +0100
Message-ID: <20240213175722.40003-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Function __drm_open_driver_another() has two paths, first being
for filtered devices, second for non-filtered ones. Separate
them and do not fallback into legacy path when index for card
exceeds number of filtered devices. Use local opened fds table
only for legacy calls as this table can become stale after
driver reload. In filtered one do not use opened fds guards as
this is pointless, we already have info about card wanted by user
and we do not need to check if we ancounter already opened one.
Also allow opening the same device if user wants it, for example
with repeating same card number in --device or IGT_DEVICE:

sudo IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0 \
	build/tests/gem_basic --r multigpu-create-close

Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..307c44ef6 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -481,13 +481,12 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
  *
  * This function opens device in the following order:
  *
- * 1. when --device arguments are present:
+ * 1. when --device arguments are present or IGT_DEVICE env var is used:
  *   * device scanning is executed,
  *   * idx-th filter (starting with 0, filters are semicolon separated) is used
- *   * if there is no idx-th filter, goto 2
+ *   * if there is no idx-th filter fail with -1
  *   * first device maching the filter is selected
- *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
- *   * otherwise open the device and return the fd
+ *   * open the device and return the fd
  *
  * 2. compatibility mode - open the first DRM device we can find that is not
  *    already opened for indexes 0..idx-1, searching up to 16 device nodes
@@ -528,10 +527,17 @@ int __drm_open_driver_another(int idx, int chipset)
 {
 	int fd = -1;
 
-	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
+	if (chipset != DRIVER_VGEM && igt_device_filter_count()) {
+		int count = igt_device_filter_count();
 		struct igt_device_card card;
 		bool found;
 
+		if (idx < 0 || idx >= count) {
+			igt_warn("Cannot open, index into filter out of bounds: %d, count=%d\n",
+				 idx, count);
+			return -1;
+		}
+
 		found = __get_card_for_nth_filter(idx, &card);
 
 		if (!found) {
@@ -542,19 +548,17 @@ int __drm_open_driver_another(int idx, int chipset)
 		if (!found || !strlen(card.card))
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
 		else
 			fd = __open_driver_exact(card.card, chipset);
 
 	} else {
 		/* no filter for device idx, let's open whatever is available */
 		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
+		if (fd >= 0)
+			_set_opened_fd(idx, fd);
 	}
 
 	if (fd >= 0) {
-		_set_opened_fd(idx, fd);
-
 		/* Cache xe_device struct. */
 		if (is_xe_device(fd))
 			xe_device_get(fd);
-- 
2.42.0

