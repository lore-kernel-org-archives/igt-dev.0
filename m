Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AFAD2B950
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 16:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD4810E17B;
	Tue,  5 Nov 2024 16:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up+mJMJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4179B10E5F8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 16:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730822996; x=1762358996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IvPulX49yCkCJGOmCH7uXLfGMS2BOUovkEChDHNQ4A=;
 b=Up+mJMJTRt2FKY05aWkyi1Se5O7qM0Kwcu0XvFXL8V8pgtT6hxm+wsIv
 v5aM5Vl3zDFXEULuf6+ih5KS+69pIvZe2wAyKu3Qos/4cW8EgqVkW8OEB
 Gxh32hS93YKvzcefcC2pQ2OMTmN980x8tuUjvqNwDaxevhyxGMb96rEm/
 vfi7RmKQ5jniz6oHF58Bx/DCUHhpt3XqKXuuij4mZOPKT4v+cnJOmQi72
 ZSwctViGS0Ec6IBzUYyeweCeZsBKpGAR3icoJX/5C9DNZ7Vz+JQzhgKEA
 /XPOTOOSnYeXjz2IgWY55NVX8vEvO6UvB/rQDXfXpMghyVRTU5MWakdYW g==;
X-CSE-ConnectionGUID: Kl0hVJoiQlWam7Iu5+EGsw==
X-CSE-MsgGUID: IxgLgvBjTS64z/wJjDO0kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41175015"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="41175015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:09:56 -0800
X-CSE-ConnectionGUID: uEfPO7dCQ4Wj+3ApXWrypQ==
X-CSE-MsgGUID: QmbqWkLgRKKaRVZkJZbOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83969507"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 08:09:54 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 1/2] tests/chamelium/kms_chamelium_edid: Use extended
 flag to reduce the number of edid
Date: Tue,  5 Nov 2024 21:40:25 +0530
Message-Id: <20241105161026.1819884-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105161026.1819884-1-pranay.samala@intel.com>
References: <20241105161026.1819884-1-pranay.samala@intel.com>
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

Edid of 1920x1200 59.950 Hz mode is a redundant edid, shuffling
it with edid of 2560x1600 59.972 Hz mode to have all edid's coverage.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/monitor_edids/hdmi_edids.h       | 52 ++++++++++++++--------------
 tests/chamelium/kms_chamelium_edid.c | 28 ++++++++++++++-
 2 files changed, 53 insertions(+), 27 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 9d75cfa98..f6cfe82ff 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -250,23 +250,15 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "34353732323059575320000000fc0044"
 		  "454c4c20323430375746500a000000fd"
 		  "00384c1e5311000a2020202020200068" },
-	{ .name = "DEL_61462_DELL_U2410_HDMI",
-	  .edid = "00ffffffffffff0010ac16f04c4e4332"
-		  "1f13010380342078ea1ec5ae4f34b126"
-		  "0e5054a54b008180a940d100714f0101"
-		  "010101010101283c80a070b023403020"
-		  "360006442100001a000000ff00463532"
-		  "354d39375332434e4c0a000000fc0044"
-		  "454c4c2055323431300a2020000000fd"
-		  "00384c1e5111000a202020202020012e"
-		  "020329f15090050403020716011f1213"
-		  "14201511062309070767030c00100038"
-		  "2d83010000e3050301023a801871382d"
-		  "40582c450006442100001e011d801871"
-		  "1c1620582c250006442100009e011d00"
-		  "7251d01e206e28550006442100001e8c"
-		  "0ad08a20e02d10103e96000644210000"
-		  "1800000000000000000000000000003e" },
+	{ .name = "HWP_12442_HP_Z30i_HDMI",
+	  .edid = "00ffffffffffff0022f09a3001010101"
+		  "06180103804028782a1df5ae4f35b325"
+		  "0d5054a10800d100b30095008100a940"
+		  "8180d1c081c0e26800a0a0402e603020"
+		  "360081902100001a000000fd00324618"
+		  "621b000a202020202020000000fc0048"
+		  "50205a3330690a2020202020000000ff"
+		  "00434e34343036304742530a20200078" },
 	{ .name = "DTV_0_DTV_HDMI",
 	  .edid = "00ffffffffffff001296000001010101"
 		  "0c180103803a20780a0dc9a057479827"
@@ -507,15 +499,23 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "442100001e011d00bc52d01e20b82855"
 		  "4006442100001e8c0ad08a20e02d1010"
 		  "3e9600064421000018000000000000c1" },
-	{ .name = "HWP_12442_HP_Z30i_HDMI",
-	  .edid = "00ffffffffffff0022f09a3001010101"
-		  "06180103804028782a1df5ae4f35b325"
-		  "0d5054a10800d100b30095008100a940"
-		  "8180d1c081c0e26800a0a0402e603020"
-		  "360081902100001a000000fd00324618"
-		  "621b000a202020202020000000fc0048"
-		  "50205a3330690a2020202020000000ff"
-		  "00434e34343036304742530a20200078" },
+	{ .name = "DEL_61462_DELL_U2410_HDMI",
+	  .edid = "00ffffffffffff0010ac16f04c4e4332"
+		  "1f13010380342078ea1ec5ae4f34b126"
+		  "0e5054a54b008180a940d100714f0101"
+		  "010101010101283c80a070b023403020"
+		  "360006442100001a000000ff00463532"
+		  "354d39375332434e4c0a000000fc0044"
+		  "454c4c2055323431300a2020000000fd"
+		  "00384c1e5111000a202020202020012e"
+		  "020329f15090050403020716011f1213"
+		  "14201511062309070767030c00100038"
+		  "2d83010000e3050301023a801871382d"
+		  "40582c450006442100001e011d801871"
+		  "1c1620582c250006442100009e011d00"
+		  "7251d01e206e28550006442100001e8c"
+		  "0ad08a20e02d10103e96000644210000"
+		  "1800000000000000000000000000003e" },
 	{ .name = "HWP_12447_HP_Z24i_HDMI",
 	  .edid = "00ffffffffffff0022f09f3001010101"
 		  "1a180103803420782e3c50a7544da226"
diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8438f5f15..ca1f82227 100644
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
@@ -269,9 +272,18 @@ static void edid_stress_resolution(chamelium_data_t *data,
 	int i;
 	struct chamelium *chamelium = data->chamelium;
 	struct udev_monitor *mon = igt_watch_uevents();
+	enum intel_driver driver = get_intel_driver(data->drm_fd);
+
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
+	if (!extended && (driver == INTEL_DRIVER_XE || driver == INTEL_DRIVER_I915) &&
+	    is_intel_device(data->drm_fd))
+		edids_list_len = CI_LIMIT;
+
+	/* TODO: Make changes to check if we can get rid of extended flag and explore
+	 * if there is environment variable in CI when executing with igt_runner
+	 */
 
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
@@ -504,8 +516,22 @@ static void test_mode_timings(chamelium_data_t *data,
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

