Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B4C98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2594910F38D;
	Thu, 24 Sep 2026 07:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCDngetA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C831E10F37E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236265; x=1821772265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVbJzl/Ah7s8mcMtzuYEc0ZmtvY5VSuZcrzwCxxLPtQ=;
 b=iCDngetAqK9SqAShXno+0Ym8++o+GqVdcdPeRt3GhRavz4NiaKc7hnSR
 NC4Zxs/oI99pRwFI26HxdPRpAJsjtGdn40qCp7mx5sjRQ9ZONyPQDFESk
 sbrmwUEqicD4IiX8AI4cDYcsPNpmOOqZQkQCiGpCZKY/4vOQscCOLiikz
 rlZOB2OXQGv+LXlNBMiJpxng/4n1YjT3FAHExdbAx2t2BAuSPRIib2NbV
 flHnyClkcl5OXzBavu0E00tofBK+fKLvQ1Ca1TdPqHAgUdHgQDdIfebof
 fFCytIMgUFSGOWx/OfVrJK6DEtOk+Ppz2BLxrZRx3+gSLDmL59YhEa8aD g==;
X-CSE-ConnectionGUID: LjvSpcrpQfaFZaPgDiuDuw==
X-CSE-MsgGUID: /FnZ3ZSSQQOvgQDgYJeVfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90119613"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90119613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:51:05 -0700
X-CSE-ConnectionGUID: +UHgRwEeQEaUBhcUApmjBQ==
X-CSE-MsgGUID: WlfRACVgS8eSZW0ye/cgTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311854776"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:51:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v6 7/7] tests/kms_hdr: run on 3 outputs when testing
 suspend
Date: Thu, 24 Sep 2026 09:50:19 +0200
Message-ID: <20260924075019.4151374-8-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
References: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
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

v3->v4
- declare `data' as static (Mohammed)
- add parenthesis around check (Mohammed)

v2->v3
- add patch

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_hdr.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e23d5e4691..43f7191c75 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
 #define BACKLIGHT_PATH "/sys/class/backlight"
 
+#define OUTPUT_LIMIT 3
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
 
+		if (!data->all_outputs && (flags & TEST_SUSPEND) && output_count >= OUTPUT_LIMIT)
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
+static data_t data = {};
+
+int igt_main_args("o", NULL, help_str, opt_handler, &data)
+{
 	igt_fixture() {
 		data.fd = drm_open_driver_master(DRIVER_ANY);
 
-- 
2.45.2

