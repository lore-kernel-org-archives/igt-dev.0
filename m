Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62785C48BF8
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49C189FCE;
	Mon, 19 Feb 2024 17:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dixFKo1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942389FCE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708364141; x=1739900141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MK2/MkZ0nOJc3u3bRtbVIJG8YbrjSy1X96VUuSYbnSc=;
 b=dixFKo1tiqqHfZJuhQzF4Zo494bnEEdpzAACTYuxcqsU3hMs3L+kqHX2
 beW8Cnm2z/C+8xHDOZaqOi2PWop0Hu0l9helhHq5VBqlhIE61P2+plTTf
 dqGZ9JlNXURbb8sPp0XG0KGpm8YKGtOBnIr/CZUwSygM6rH1+9qqJYs6z
 tvih5lPTdFjzsRg0KkTKohMjJaaDd+NmRN+QIpyZjRb0wD8cWS6NjnBwW
 R3ixNMf5P3I55HD4ICLpQ5/nk1VuUBnpN/Jyv16qe5DQGCR/8yyOPa+l5
 yopvj4Nl9DnpwZ6H+5MFXh+PfOLXMUEk4EPQp5azbRkNlPFGHto1C1KhK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13078276"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13078276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:35:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4714581"
Received: from mkoper-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.80.95])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 09:35:38 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5] lib/drmtest: drop legacy check from filtered opens
Date: Mon, 19 Feb 2024 18:35:34 +0100
Message-ID: <20240219173534.38360-1-kamil.konieczny@linux.intel.com>
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
v5: drop check for negative idx (Janusz, Zbigniew)

Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..aa1096e96 100644
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
@@ -542,8 +541,6 @@ int __drm_open_driver_another(int idx, int chipset)
 		if (!found || !strlen(card.card))
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
 		else
 			fd = __open_driver_exact(card.card, chipset);
 
-- 
2.42.0

