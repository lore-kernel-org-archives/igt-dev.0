Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DB8D11183
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 06:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A9B10E37D;
	Mon,  4 Nov 2024 06:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFnTYZIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9D610E37C
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730701172; x=1762237172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LbEJDquokNDXUQpRDiFg3ftdmYdJePCxMP6ZECImU3A=;
 b=GFnTYZIl0NFr7fGFNzqEjhZByaEDwADnQI+6NWmgKFFxKcvwjIBpz4xd
 WMVKUzWAMRrBttlvoD3hL7jmdh7r4mhgUOhHRGT47+O7yILS2FmliR7qL
 5XzfyhfYVGq+IpQumykYUfwGrY9VDDp81Mg5KiT/WutjofDJxGDGL7q0s
 noQt+wG5im08Xi67DUpxTB60JoJCWL3+TG+ReaXWzFUgRAQ/8okrC0opq
 WbA1DQv/F8a55nmT1BdaeeL/wpevP3SgHP/7Zlx7Exw1PJdgnRskf/BG6
 Rh1gMXmw6IAsZ6N5qlaURnkw61kdliPo7xa4SePwxQ6NNItd74nqDVCEk Q==;
X-CSE-ConnectionGUID: zpBMhnVeRc6IxM3tinO9Mg==
X-CSE-MsgGUID: cK5V6dtCSxKo84kfzjQfOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41017547"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41017547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 22:19:31 -0800
X-CSE-ConnectionGUID: V6qTw97PRWSCkBUfDAnVKg==
X-CSE-MsgGUID: zqtdSVjOSb2H5j8p2lw3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83082987"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 22:19:29 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 1/2] tests/chamelium/kms_chamelium_edid: Use extended
 flag to reduce the number of edid
Date: Mon,  4 Nov 2024 11:50:00 +0530
Message-Id: <20241104062001.1813180-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104062001.1813180-1-pranay.samala@intel.com>
References: <20241104062001.1813180-1-pranay.samala@intel.com>
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
 tests/chamelium/kms_chamelium_edid.c | 21 ++++++++++-
 2 files changed, 46 insertions(+), 27 deletions(-)

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
index 8438f5f15..00627d737 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -121,7 +121,9 @@
  * @suspend:      suspend
  */
 
+#define CI_LIMIT 25
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
+static bool extended;
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
 					      bool *link_status_failed)
@@ -273,6 +275,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
 			      data->ports, data->port_count);
 
 
+	if (!extended)
+		edids_list_len = CI_LIMIT;
+
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
 		drmModeModeInfo mode;
@@ -504,8 +509,22 @@ static void test_mode_timings(chamelium_data_t *data,
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

