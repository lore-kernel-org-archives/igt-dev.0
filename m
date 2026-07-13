Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49012C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E310E5B3;
	Mon, 13 Jul 2026 09:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhWsicoZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42AE10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932975; x=1815468975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pibP3ZMQUfeyYsPZDCRvy7oTHNI9/wh5jJfQG0Ux1qE=;
 b=EhWsicoZncIlHsXHeDGvmoyKY600Q11/5+eyPcxQOgy046Pbv0TbfQTK
 b7JOX7G3KD1bMNjSYDvWKib/xU1Y2zbEVemQdZd0Ty/2nUPXYBMytpEc4
 aB6leeiTDv4hSWMLvrFuNMOrmLx0Yo7i9y1WdqTN018oc4lmTFNDUeS6a
 P/Ggs8GPlM7pykRkFt1HolDU4xVljZrPJ13DNmRCBo/aYu6/ZazGOr166
 EmvFXx0L2STFaSg1r45w7oWfn56UBXA25I02e1PFwe4ps89vFg1pZVV9D
 rT/Q1en23nxdbnEu4Qv9MwOHL8JgNP5QaA/EKnAd2F2dMHBCoZpwlDhT6 A==;
X-CSE-ConnectionGUID: 2P4AicOvTgCNLMagr975dA==
X-CSE-MsgGUID: b71z5pa/RgGgF8JTt5lljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081328"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:15 -0700
X-CSE-ConnectionGUID: GwI7ZQDfQjCR20h4hkR2yQ==
X-CSE-MsgGUID: j0YHZCFNTmCxMPAKnm0LEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385904"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 08/16] tests/kms_psr: limit #outputs tested during
 suspend
Date: Mon, 13 Jul 2026 10:55:07 +0200
Message-ID: <20260713085515.463575-9-michal.grzelak@intel.com>
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
 tests/intel/kms_psr.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 7b02dd2072..c3bd7d9f7f 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define OUTPUT_LIMIT 2
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -318,6 +320,7 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool fbc_flag;
+	bool all_outputs;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -767,9 +770,27 @@ static void dpms_off_on(data_t *data)
 				   DRM_MODE_DPMS_ON);
 }
 
+static int opt_handler(int opt, int opt_index, void *opt_data)
+{
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':
+			data->all_outputs  = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
 data_t data = {};
 
-int igt_main()
+const char *help_str =
+	" -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n)";
+
+int igt_main_args("o", NULL, help_str, opt_handler, &data)
 {
 	int z, y;
 	enum operations op;
@@ -785,6 +806,7 @@ int igt_main()
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
+	int output_count = 0;
 	bool fbc_chipset_support = false;
 
 	igt_fixture() {
@@ -949,6 +971,9 @@ int igt_main()
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
+					if (!data.all_outputs && output_count > OUTPUT_LIMIT)
+						continue;
+					output_count++;
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-- 
2.45.2

