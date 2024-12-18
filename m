Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A927E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC20910EAC5;
	Wed, 18 Dec 2024 05:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwXLz+Q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2C710E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498839; x=1766034839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTnEiaD39bkTclkmMW1wQ3g30g3XWkPb2fL5fXhWFX0=;
 b=IwXLz+Q3I9PuSo8TJchRhlJ26HLPwtz0/8+xVe3rBGRegPc/hlpMZef8
 8Dj4TkWGKkJMM75u//J2P8MvauZl15wyaSlbMvc4i9n+SqYSEzIRHQ01W
 A8bwqYK1PbVrA4zUjyHqHKBKGI2ucaWbs052NA5EeEZ73bFjpqWKweiGk
 hwpEONczGwaAEtfb218ZPH/eg11V6EG/4bQD9o4foKUTHP8sZyXTGY+dr
 B2i2KOB+wCt3ojFOdkgpZFWxImGYTq2qWHHMJzZl1jptFLnW3AbgAFMSv
 ZdT7zM0npIYhLrnq1dYFPVQhouE8eDqvjWrvpCqNGZj5vLzcSUmw2fgAk g==;
X-CSE-ConnectionGUID: 3Us44q5YSkikmSA9eLig/w==
X-CSE-MsgGUID: yvY4Q/3xS/mqIZZQqFWNkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45649502"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45649502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
X-CSE-ConnectionGUID: 5Sdxl8E3Q5Cy56pHMw0sHQ==
X-CSE-MsgGUID: jL6NQhEiQT+nCNSHcY0qSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102588186"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs bind/unbind/reload
Date: Tue, 17 Dec 2024 21:13:24 -0800
Message-ID: <20241218051324.2696557-5-lucas.demarchi@intel.com>
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

There's no guarantee a card will end up with the same device node when
modules are loaded/unloaded and drivers bound/unbound. There's some
fundamental issue with the igt's the way it is and it's also puzzling
from the logs it looks like the device vanished from the bus, when in
reality is just the SW state out of sync with what the kernel is
exporting.

Re-scanning when trying to match a device is not expensive compared to
what most tests are doing, so simply force it to occur whenever trying
to match a card.

Example for xe_wedged:

	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129

	... [ wedge and rebind here ]

	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 8e2297087..956719fba 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
 	 * Scan devices in case the user hasn't yet,
 	 * but leave a decision on forced rescan on the user side.
 	 */
-	igt_devices_scan(false);
+	igt_devices_scan(true);
 
 	if (igt_device_filter_apply(filter) == false)
 		return false;
-- 
2.47.0

