Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F157DC79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630510E2CA;
	Thu, 10 Sep 2026 19:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8GfeRDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953D010E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066765; x=1820602765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etf5tgCi+/hzXShxTofcWsTdrAFQmI0Hd4yGI3Y4Azw=;
 b=f8GfeRDPyioEQiXC3zqHVXuGpfn7UhSAT0C+63yfSTupSuNEscePEDOr
 GsGXb3q0eGJtrd64mm+Pt+voElj8C+dH/1H+XdZDRLEjW6p0o8bKTNqKt
 wbBRuUyPCXA+z6Y6aLWNOJoPMj28JEjnpw+LXrWtW5YYAk4LemoM0CVyO
 189dQPaVEWi7guiiVfXjY+6uoE8wdCeKl9UfjNaBVs4gkuCK+sMe6X5Ym
 WA/eaf8MBt8ncNOOuBs5EUHhhAj53x/G8bC/DBnE3+KDvLL0Ria0ugLeh
 3JDDNLWTnnredL9K29JtA4vR+jWTbiVkMfwApYRRDDPFs5wiY0oR9KjkE Q==;
X-CSE-ConnectionGUID: i9N1YcXEQwexPIpRgKrwOA==
X-CSE-MsgGUID: IvG4uhU0QsqOjUPOkcBRSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400089"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:25 -0700
X-CSE-ConnectionGUID: eRde7S4mRzi3rBWC65IcQw==
X-CSE-MsgGUID: nidObu8ETT+/nKTH5Il4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199510"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:24 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 10/17] tests/kms_vblank: limit #outputs tested during
 suspend
Date: Thu, 10 Sep 2026 20:58:55 +0200
Message-ID: <20260910185902.2728276-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910185902.2728276-1-michal.grzelak@intel.com>
References: <20260910185902.2728276-1-michal.grzelak@intel.com>
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

We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

v3->v4
- reset output_count inside dynamic subtest (Mohammed)
- fix help string's description (Mohammed)

v1->v2
- fix off-by-one error (Mohammed)
- reset output_count before subtest (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_vblank.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733af15..5a2ba8b491 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -109,7 +109,10 @@ typedef struct {
 #define RPM	0x80
 } data_t;
 
+#define OUTPUT_LIMIT 2
+
 static bool all_pipes;
+static bool all_outputs;
 static int active_crtcs[IGT_MAX_PIPES];
 static uint32_t last_crtc_index;
 
@@ -476,6 +479,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 static void run_subtests(data_t *data)
 {
 	igt_crtc_t *crtc;
+	int output_count = 0;
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -515,7 +519,14 @@ static void run_subtests(data_t *data)
 
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
+				output_count = 0;
+
 				for_each_connected_output(&data->display, data->output) {
+					if (!all_outputs && (m->flags & SUSPEND) && output_count >= OUTPUT_LIMIT) {
+						igt_info("Skipping output %s\n", data->output->name);
+						continue;
+					}
+
 					for_each_crtc(&data->display, crtc) {
 						if(!igt_crtc_connector_valid(crtc, data->output))
 							continue;
@@ -538,6 +549,8 @@ static void run_subtests(data_t *data)
 							run_test(data, f->func);
 						}
 					}
+
+					output_count++;
 				}
 			}
 
@@ -628,6 +641,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'o':
+			all_outputs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -636,9 +652,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
+	"  -o \tRun on all outputs. (By default subtests will run on two outputs)\n";
 
-int igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("eo", NULL, help_str, opt_handler, NULL)
 {
 	igt_crtc_t *crtc;
 	int fd;
-- 
2.45.2

