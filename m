Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B4C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782510E5B3;
	Mon, 13 Jul 2026 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mx2ui5uM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FC910E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932977; x=1815468977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bxa8/TgkAjHWQKFxNRTccmwSE28+tPkdXAGZLnN+9OA=;
 b=Mx2ui5uMh1BO77LX+LKkFZeDc/5ObGHovExEdifuAorI6+aYc6tA+P3w
 aqNdaCcsMKTrMnLyv49G0SO6zrbffri13W18InOdYuse+NCBVKg9yEwiV
 BJR3I8HhC6Tgs9c8AAXbF26eLnd4nHtLQUEWeQOVmfw5tct3/c+vwGMOe
 uO3R23E8bZvZ7CTGtAA/IjgXdDgXk7OU8PkSTQFhAEXQV7SszqT4t9+VR
 PLwE/j9h8+vdystaNgoJiYOeNxwDGnNFrFPAb3aDzKx1yfJ6NLLgX4/cJ
 w49rzgRbNbS24VFDnYkCWBF15fYOMJUsdR3EqEBx7lSl8NYk/eu5dwm+G Q==;
X-CSE-ConnectionGUID: CprSpM1ETu++ZOGwf88U3w==
X-CSE-MsgGUID: lIM3G5F3S+OJaXOFC2N9oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081331"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:17 -0700
X-CSE-ConnectionGUID: PW/cdYQeR+GILzMawmdPKQ==
X-CSE-MsgGUID: 5lLhPRh+SOSJiwuku/c+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385920"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:16 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 10/16] tests/kms_vblank: limit #outputs tested during
 suspend
Date: Mon, 13 Jul 2026 10:55:09 +0200
Message-ID: <20260713085515.463575-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_vblank.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733af15..7ad23da355 100644
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
@@ -516,6 +520,11 @@ static void run_subtests(data_t *data)
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
 				for_each_connected_output(&data->display, data->output) {
+					if (!all_outputs && (m->flags & SUSPEND) && output_count > OUTPUT_LIMIT) {
+						igt_info("Skipping output %s\n", data->output->name);
+						continue;
+					}
+
 					for_each_crtc(&data->display, crtc) {
 						if(!igt_crtc_connector_valid(crtc, data->output))
 							continue;
@@ -538,6 +547,8 @@ static void run_subtests(data_t *data)
 							run_test(data, f->func);
 						}
 					}
+
+					output_count++;
 				}
 			}
 
@@ -628,6 +639,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'o':
+			all_outputs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -636,9 +650,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
+	"  -o \tRun on all outputs. (By default subtests will run on three outputs)\n";
 
-int igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("eo", NULL, help_str, opt_handler, NULL)
 {
 	igt_crtc_t *crtc;
 	int fd;
-- 
2.45.2

