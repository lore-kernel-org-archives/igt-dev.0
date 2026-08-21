Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F6DC5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA9E10E097;
	Fri, 21 Aug 2026 12:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX1SL41t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B410E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316543; x=1818852543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Shxsc9Dxa7ulfbXn5wT1SKdRg/7O9ZeDnwnCSXehoK8=;
 b=hX1SL41texhwhN6UHIc5fDbw9wXfQKZ6gnNN0/CWGR19tFTBne5EI4dJ
 7VsxUHm/S/fs7mBTW5bgi8inVC4gyl8W0spmhc+9GEbXm+AaqgLnxGK4f
 YnpPCVlgSn1sZi5+K/YY7DFzfCC2mleE2DPMkATYoMFovDROM++85gW/P
 R1yjj7bD6fojcSdoZ0SwniuzD94owOMoA3cGbhdXWFeut9Sezg6F3PaG2
 leEC6QFkHHAb6jbt/LSSYS2GUYW5pD5AFbdCmhuDEhQ1X9GVZ2wsRHmiQ
 4HuJjKzpu3BT0+CYlbLEud0rCzi3Hj49xd0upposA6BL7M3IwI+QKjrFr g==;
X-CSE-ConnectionGUID: Msnvx88HQ5qSB1nqJi5WcA==
X-CSE-MsgGUID: f/n7CqzRQ2CBQf0wH2tMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632937"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:49:02 -0700
X-CSE-ConnectionGUID: kPk/5ah0Sb2DrenmC52m7Q==
X-CSE-MsgGUID: ZP+/oDOrSW6nwarG3WbiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188412"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:49:01 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 17/17] tests/kms_hdr: run on 3 outputs when testing
 suspend
Date: Fri, 21 Aug 2026 14:48:34 +0200
Message-ID: <20260821124834.1974029-18-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Each suspend test is executed per output. Limit number of outputs tested
to 3 by default. Add command-line option enabling execution on every
output.

v2->v3
- add patch

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e23d5e4691..95a7344ceb 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
 #define BACKLIGHT_PATH "/sys/class/backlight"
 
+#define OUTPUT_LIMIT 2
+
 /* HDR test formats: 10bpc + FP16 */
 static const uint32_t hdr_test_formats[] = {
 	DRM_FORMAT_XRGB2101010,
@@ -110,6 +112,7 @@ typedef struct data {
 	int w;
 	int h;
 	igt_fb_t afb;
+	bool all_outputs;
 } data_t;
 
 /* Common test cleanup. */
@@ -250,6 +253,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
+	int output_count = 0;
 
 	igt_display_reset(display);
 
@@ -273,6 +277,11 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 		}
 
+		if (!data->all_outputs && flags & TEST_SUSPEND && output_count > OUTPUT_LIMIT)
+			continue;
+
+		output_count++;
+
 		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
 					    crtc);
@@ -674,10 +683,27 @@ static void test_hdr(data_t *data, uint32_t flags)
 	}
 }
 
-int igt_main()
+static int opt_handler(int opt, int opt_index, void *opt_data)
 {
-	data_t data = {};
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':
+			data->all_outputs = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
 
+static const char help_str[] = "  -o \tRun on all outputs instead of 3 when testing suspend.\n";
+
+data_t data = {};
+
+int igt_main_args("o", NULL, help_str, opt_handler, &data)
+{
 	igt_fixture() {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
-- 
2.45.2

