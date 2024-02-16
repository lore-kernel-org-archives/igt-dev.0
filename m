Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4835C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 19:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DEA10EC94;
	Fri, 16 Feb 2024 19:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVnl5UbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ECD10EC8D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708110347; x=1739646347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aDoaJTAzjY4/bEbmg4VjqnQhNid8qaLmbwr9VdctAWo=;
 b=cVnl5UbRAyAXEZvp5fwWeSTcgaEp9+U6a7qTlbqCJMfLkPwk+Ecyz3u2
 rhpGp8q77hbPsgKiUOlc/q//64P23Xv3bYhn6pnri9/5Tq4AGs9tVBejY
 xBljmhkhRdKIxnIO1wTRlXSSU67O29s2mla9ioD1PZwOw8+G+Ke94tXLs
 jpL5P9ugoqhjMWaWSx0lo4WCpkTJ/A9RvxOIJ+CpEBO737I8/Ob4DDwxn
 dJXkyfVMUxs430uIesCjQB/esNszMIZBfpXBDfriAt4O3a4fFBdHrgLNc
 46CGlOgovzirHa/d0W1T+nxDr0fkydOWFaw7+GSCq/WMu4fYXHoI10aBV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="24717976"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="24717976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 11:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8606316"
Received: from unknown (HELO localhost) ([10.246.20.26])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 11:05:40 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4] lib/drmtest: drop legacy check from filtered opens
Date: Fri, 16 Feb 2024 20:05:34 +0100
Message-ID: <20240216190534.79086-1-kamil.konieczny@linux.intel.com>
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

For some multi-GPU tests user can check them on single-GPU board
with the help of repeating same card in --device option or
environment var IGT_DEVICE:

sudo IGT_DEVICE=pci:vendor=Intel,card=0\;pci:vendor=Intel,card=0 \
	build/tests/gem_basic --r multigpu-create-close

but is unable to use it due to current implementation of device
opening in function __drm_open_driver_another().

To allow this drop legacy check for already opened device when
using filters.

v2: improving description, using filtered_count var (Janusz)
  changing drmtest: to lib/drmtest: (Kamil)
  adding Lukasz Laguna to Cc: (Kamil)
v3: for out-of-bound index print debug, not a warning (Kamil)
v4: restored using filters number for filtered path and restored
  setting opened fds for legacy tests, changed description (Kamil)

Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..43e6c0158 100644
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
  *   * if there is no idx-th filter, goto 2
  *   * first device maching the filter is selected
- *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
- *   * otherwise open the device and return the fd
+ *   * open the device and return the fd
  *
  * 2. compatibility mode - open the first DRM device we can find that is not
  *    already opened for indexes 0..idx-1, searching up to 16 device nodes
@@ -526,12 +525,19 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
  */
 int __drm_open_driver_another(int idx, int chipset)
 {
+	int filter_count = igt_device_filter_count();
 	int fd = -1;
 
-	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
+	if (chipset != DRIVER_VGEM && idx < filter_count) {
 		struct igt_device_card card;
 		bool found;
 
+		if (idx < 0) {
+			igt_debug("Cannot open, index out of bounds: %d, filter_count=%d\n",
+				 idx, filter_count);
+			return -1;
+		}
+
 		found = __get_card_for_nth_filter(idx, &card);
 
 		if (!found) {
@@ -542,8 +548,6 @@ int __drm_open_driver_another(int idx, int chipset)
 		if (!found || !strlen(card.card))
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
 		else
 			fd = __open_driver_exact(card.card, chipset);
 
-- 
2.42.0

