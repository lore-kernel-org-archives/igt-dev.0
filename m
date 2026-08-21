Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3164FC5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FF210E097;
	Fri, 21 Aug 2026 12:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="javCShJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A433A10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316533; x=1818852533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YFA/hOxVuZz00mbVqztS5h0pc3Jk0b3VUD8GzRH+erQ=;
 b=javCShJTOfxSWpjnUf78o5bfv80LNxjQsa0hMlMcBoc5FfGXLOWLMX5a
 iCEMkTL0gs5J1t097SunbVZdguevC/zY1i+Es01zohgZ9Oi/ogGz+S4K0
 ejpUPX0ivEJ2Ta15LTSLCcy1kN6gSCbFIUraE9Dx/gpkJ7BAtQi1Fi4cI
 OcACzADXYONgYNEyLqcDq7YOyxmx7ADBJnyzfENkCrlsonh9nSa7/WRry
 eP5zCJCSprVv0HlSi1hAWv1P1ql8p+GRjmbBz0jwR12UvYndPUtcaxzGr
 K5xU829FOMXRCqQC4PfjgW14my/07Qifcetbu2/0gBuwrJNrGmCAKWcn7 Q==;
X-CSE-ConnectionGUID: 8kgoa8tFRSmWlELlcjbZAA==
X-CSE-MsgGUID: YwbNnM4RTPmg0lgmRAL5HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632927"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:53 -0700
X-CSE-ConnectionGUID: InS/Y3AeRkWLgzK8VpM31g==
X-CSE-MsgGUID: //WyX7vYSp6rxhlyLGXLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188377"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 10/17] tests/kms_vblank: limit #outputs tested during
 suspend
Date: Fri, 21 Aug 2026 14:48:27 +0200
Message-ID: <20260821124834.1974029-11-michal.grzelak@intel.com>
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

We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

v1->v2
- fix off-by-one error (Mohammed)
- reset output_count before subtest (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_vblank.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733af15..7995528c3f 100644
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
@@ -513,9 +517,16 @@ static void run_subtests(data_t *data)
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
+			output_count = 0;
+
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
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
 
@@ -545,6 +558,8 @@ static void run_subtests(data_t *data)
 			if (f->valid & NOHANG || m->flags & NOHANG)
 				continue;
 
+			output_count = 0;
+
 			igt_describe("Check if injected hang is working properly.");
 			igt_subtest_with_dynamic_f("%s-%s-hang", f->name, m->name) {
 				igt_hang_t hang;
@@ -628,6 +643,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'o':
+			all_outputs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -636,9 +654,10 @@ static int opt_handler(int opt, int opt_index, void *data)
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

