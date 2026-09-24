Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0B7C98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30BF10F38C;
	Thu, 24 Sep 2026 07:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bitwTicH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC68E10F37E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236258; x=1821772258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9EVDV2IkKiFjeAScI/Qa8wubWpZGpWViJtfWP2VaVN4=;
 b=bitwTicH0GOostKZnTbpw/BkU94rywWiliygJ5QFJHUt2P3+4uCVCEAw
 Q4aDaFmHJrdI/icW530KB7r5ANdE54oyVzgan/4rbTkjnrBTgEHXl7sO5
 TjhVefu8hHIX5p7GqX5nqs1XRo2nQk8ytPvK+iuDQxB+XxDVXbcrVK9XK
 ojbho9qnlMZ/jgJ6Dbr5JilyR7o1XV2wKTBe/FRDkELpNRKR3fSbm6a1a
 /Mz2LQnbkYe/2ElA6XD8OGSJShVNwwbGHoWYsI7s72CLcBdNbsaig2QVD
 nYifyBXMGyuJNdeDhm2k9E4/iS6fKgov4lYiQ7M7eiXUEuZ08NpM9pSva g==;
X-CSE-ConnectionGUID: nzHIiez9RwSDe2r+/K6ykA==
X-CSE-MsgGUID: Ed+DFJ8fRl+4ONSDgaTp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90119599"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90119599"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:58 -0700
X-CSE-ConnectionGUID: O1FHrpBYSUyea9zPI66p+A==
X-CSE-MsgGUID: LPKLDHDtTfGxH8PEZBGcnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311854744"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:57 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v6 3/7] tests/kms_vblank: limit #outputs tested during
 suspend
Date: Thu, 24 Sep 2026 09:50:15 +0200
Message-ID: <20260924075019.4151374-4-michal.grzelak@linux.intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
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

