Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A8C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 14:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779CC10E4CF;
	Mon,  7 Apr 2025 14:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaCLaTdk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E110E4CF
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744037642; x=1775573642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TaVcw685Aqug/pXjN/FvdKCi7cy2CbzNsDP8II0OIb0=;
 b=EaCLaTdkqJbWp9AWXqTUQD+ZYfmTrCza89Lzt+KY7l5djul4VOOns4cW
 si5yd+ZPMvfJoB7/efR0FdB9ZOx2yZCUnnSRQO9XjcsTxj8TcQ4xgot3s
 evEX8p8DpGbdfgoInUUj/IE0b5u9xkXiKmYF7Nlsq4fQGio2+/2jzsKaX
 LcW3DgnahRtAL1tGrypkYbP/3O2hr9CEMvZrQNhv7aSi36LAo8AbgvZ0V
 3G4XBYjDCXhMMAfg0QPpJIbAU9jlQvmu6NBjbvIN+iiDqSShxzZoOGWmM
 uP/ZCsaXjB2PB1Hh3pQHh4z8JQXbFjwVFvG1mZT3VvuaBMw0ILSF1Cl7Q Q==;
X-CSE-ConnectionGUID: U+hlCjzyRryQ8YXbrxos+w==
X-CSE-MsgGUID: CchsdfWHRqKwUp/JAnlGFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45318589"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45318589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:54:02 -0700
X-CSE-ConnectionGUID: F10X6Hh9SxqTmQ3VXywTCA==
X-CSE-MsgGUID: OiyoJxkGReW1LfLPYy/RPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127729532"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:54:01 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_cursor_edge_walk: check for display and
 pipe CRC before cursor size
Date: Mon,  7 Apr 2025 14:45:04 +0000
Message-Id: <20250407144504.2907700-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
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

Currently igt_require_pipe_crc(), igt_display_require() and
igt_display_require_output() is called after trying to get cursor
width and height which leads to fails on configurations that do
not have display enabled.
Move igt_require_pipe_crc(), igt_display_require() and
igt_display_require_output() before getting cursor width and
height so instead test will skip on configurations without
display.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/kms_cursor_edge_walk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 858d1da9b..27bee4482 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -361,6 +361,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		igt_require_pipe_crc(data.drm_fd);
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
 		if (is_intel_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
 
@@ -372,11 +377,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_pipe_crc(data.drm_fd);
-
-		igt_display_require(&data.display, data.drm_fd);
-		igt_display_require_output(&data.display);
-
 		/* Get active pipes. */
 		last_pipe = 0;
 		for_each_pipe(&data.display, pipe)
-- 
2.34.1

