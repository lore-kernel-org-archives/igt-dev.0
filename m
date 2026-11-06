Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22D606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/3KgnfJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355EA10E1B1;
	Fri,  6 Nov 2026 18:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A80410E204
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793988551; x=1825524551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RiAjnYxLK0wBjhDaNpRj/daKoqPiHzkeGasacfCC88Y=;
 b=N/3KgnfJn3SUUHgOjTma8L8A2cRD1/mgrMkOUSlYqDMrPLkc+e5td8Aq
 8xxXQdS8amABw90L4BO23wdyjZiwzeHa7ll30ztjUPxycOaYHE60q5OEb
 Q0JYns1MvwRgaNFhimzErkxhINPrTYEZiJnuz8wrq4hDRD9NgTZBEQ58Q
 LDbXwAzgAExkzJ593jy0QgaGLpzRIFiG9Kk/bR7y3NGHYG6VcbTMc7aUo
 J7L9b0tmBJZpkOoEBZZCvdzU+u5GNdPTPW1wv35P673kPFF+oE8g3CCXz
 gr+CbBr4CoHiVjoGjOrZLFQYQP5i4SFPOZ2/Z7V2UPQ3xqc/6n6IuY5/+ Q==;
X-CSE-ConnectionGUID: ThjsEZ7pSHaVzfqSEYSU8Q==
X-CSE-MsgGUID: nKZln3t7TZaMsffNNQ2r5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723920"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:10 -0800
X-CSE-ConnectionGUID: V5Nz8EG8QfeJD+EUA43MLA==
X-CSE-MsgGUID: D6+OfMXdSbqi3kkZQXUGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7362624"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:09 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v9 4/9] tests/kms_vblank: limit #outputs tested during
 suspend
Date: Fri,  6 Nov 2026 19:08:44 +0100
Message-ID: <20261106180849.156578-5-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

v3->v4
- reset output_count inside dynamic subtest (Thasleem)
- fix help string's description (Thasleem)

v1->v2
- fix off-by-one error (Thasleem)
- reset output_count before subtest (Thasleem)

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

