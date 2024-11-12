Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA62D41D55
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A2E10E55C;
	Tue, 12 Nov 2024 05:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BevmUug2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A5710E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 05:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731387850; x=1762923850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7HMdU6A6MUb3qctHwqkNfiw2c7MR17jPSQ8I/yqhO/Y=;
 b=BevmUug2U3aezICMQiiBdvgi3vo+PH295JCNXFEqvltjTmbh7sWBLaqu
 y0a/tGW1CJqOs3uYLYjrHmlsnfrybA1/cgVrPcO8r3eR1Rduo272rcP1s
 LV6VvgKAnYkCzjw4DlsW3SxlwUjn9CkmsRR9Ss/rTXdLayQTcSFwao7qz
 t5UwxDsNXox17js1ALmM6qHD7wBrPTIZXdhn/GQEIwI8LxTum3VU0HWS8
 poNeGZYoEhE0yMJQBUHg8c+l3EDZVV82S8yd5EPWYC9VeJCN0YKFwQOvO
 TTvF42wzEoCid6Ram/lytrlmGHLv8q6OphiFG+T/PA2L0i7zMrG6gqyXk Q==;
X-CSE-ConnectionGUID: pUL8kWOjR7CL66wYzf0vHQ==
X-CSE-MsgGUID: nG6/1QSuROGzxKr3OcbXcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35137108"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35137108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:04:10 -0800
X-CSE-ConnectionGUID: 4Vn5xroUR6qAgHGtX4l0zA==
X-CSE-MsgGUID: TfrNmO79RLOnA4mlznwFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="86836186"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2024 21:04:07 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v9 1/3] tests/chamelium/kms_chamelium_edid: Use extended
 flag to reduce the number of edid
Date: Tue, 12 Nov 2024 10:34:40 +0530
Message-Id: <20241112050442.1854319-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112050442.1854319-1-pranay.samala@intel.com>
References: <20241112050442.1854319-1-pranay.samala@intel.com>
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

This test iterates on all the available edids of HDMI.
Due to CI test timeut limitation, we are reducing the
number of edids to execute to avoid result as timeout.

Using extended flag to achieve this. The test will execute
only 25 edids when this flag is not used as CI doesnt uses
this flag.
In local execution to execute on all edids, we have to give
this flag at the runtime.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8438f5f15..5db8204d5 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -38,6 +38,7 @@
 #include <string.h>
 #include <stdatomic.h>
 #include <xf86drmMode.h>
+#include "drmtest.h"
 
 #include "config.h"
 #include "igt.h"
@@ -121,7 +122,9 @@
  * @suspend:      suspend
  */
 
+#define CI_LIMIT 25
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
+static bool extended;
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
 					      bool *link_status_failed)
@@ -269,9 +272,16 @@ static void edid_stress_resolution(chamelium_data_t *data,
 	int i;
 	struct chamelium *chamelium = data->chamelium;
 	struct udev_monitor *mon = igt_watch_uevents();
+
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
+	/* TODO: Make changes to check if we can get rid of extended flag and explore
+	 * if there is environment variable in CI when executing with igt_runner
+	 */
+
+	if (!extended && is_intel_device(data->drm_fd))
+		edids_list_len = CI_LIMIT;
 
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
@@ -504,8 +514,22 @@ static void test_mode_timings(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'e':
+		extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tExtended tests.\n";
+
 IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
-igt_main
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
-- 
2.34.1

