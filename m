Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536FC369B8
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 06:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6510E32A;
	Tue, 15 Apr 2025 06:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgZYkCps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A2210E34C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744698126; x=1776234126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3pKFPzUpjD3bKEsW9vHQJQAxKNNdT0znXyU6hmvfLJI=;
 b=NgZYkCpsDeN4qPaLURIDLSLFyIgf2GShURKuz94eLvoCnX/YpUa5DQ7H
 93rnVmRB2KZPg5A9wqk7XcfnDyEe9/f8Aquy2Sw9e99i0gvVRHH7WHu+z
 A/tbVycDwQXzdkXWLjXG4wmmHxasGMW9amRkd8BhShdJcuT1GiQVNSn69
 hyp3kSAhVGU37ddpR5/W1ZN9PPVbgHYhy7XbaE4SmR1Z9leJARKuErDZF
 gIzeMXqVwbRB/mLUf8TZw/wmW6EroJt9fIwTu994/oX2zMNrNaaiVHP0w
 wcBjpBa5paDtZ5O6WriRDcmfElZuE4SpdVAZqvklqzRs9zNQeGk9NNuZb Q==;
X-CSE-ConnectionGUID: Dq83V3kpTpeCHzIgsnCkmw==
X-CSE-MsgGUID: gnlrumoPRoWhcupehSZV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56367841"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56367841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:22:04 -0700
X-CSE-ConnectionGUID: bFg6rvxRQRyFrQcQCzo5dw==
X-CSE-MsgGUID: 8URUC7MeRfevfjTWojxKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129993265"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:22:02 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_color: force
 connector reprobe after plugging ports
Date: Tue, 15 Apr 2025 12:07:41 +0530
Message-Id: <20250415063742.3026718-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415063742.3026718-1-kunal1.joshi@intel.com>
References: <20250415063742.3026718-1-kunal1.joshi@intel.com>
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

Force reprobe connector status after plugging to assure
we always have DRM_MODE_CONNECTED status for the connector
before proceding with the test.

v2: use Closes tag (Swati)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 25 +++++++++++++++++++++----
 tests/meson.build                     |  2 +-
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 5f61bc2ec..bf6510969 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -31,6 +31,7 @@
  */
 
 #include "kms_color_helper.h"
+#include "kms_chamelium_helper.h"
 
 /**
  * SUBTEST: degamma
@@ -736,13 +737,29 @@ igt_main
 
 		if (!data.port_count)
 			igt_skip("No ports connected\n");
+
 		/*
-		 * We don't cause any harm by plugging
-		 * discovered ports, just incase they are not plugged
-		 * we currently skip in test_setup
+		 * The behavior differs based on the availability of port mappings:
+		 * - When using port mappings (chamelium_read_port_mappings),
+		 *   ports are not plugged
+		 * - During autodiscovery, all ports are plugged at the end.
+		 *
+		 * This quick workaround (unplug, plug, and re-probe the connectors)
+		 * prevents any ports from being unintentionally skipped in test_setup.
 		 */
-		for( i = 0; i < data.port_count; i++)
+		for(i = 0; i < data.port_count; i++) {
+			struct udev_monitor *mon;
+			int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+			chamelium_unplug(data.chamelium, data.ports[i]);
+			mon = igt_watch_uevents();
 			chamelium_plug(data.chamelium, data.ports[i]);
+			igt_assert(chamelium_wait_for_hotplug(mon, &timeout));
+			igt_cleanup_uevents(mon);
+			igt_assert_f(chamelium_reprobe_connector(&data.display,
+								 data.chamelium,
+								 data.ports[i]) == DRM_MODE_CONNECTED,
+								 "Output not connected\n");
+		}
 
 		kmstest_set_vt_graphics_mode();
 	}
diff --git a/tests/meson.build b/tests/meson.build
index 9224145cf..6f0beeb0a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -368,7 +368,7 @@ extra_sources = {
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
+	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.25.1

