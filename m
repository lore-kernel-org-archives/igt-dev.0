Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC5C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1336810E2CA;
	Thu, 10 Sep 2026 19:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H37I/Hhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B235E10E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066762; x=1820602762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/4kENarKEdNyBZQM4LqWm2zlkZgMdQx0LfUoFJ4qDs=;
 b=H37I/HhdPXL2zQS/yFh5b6V/wLrMjUCFK82ozJsfPCQda0w9ZKE3JZgy
 KCbyZlba+jS/WXzVn+Sf885jKGjLbSOk27NURHajSL3VrkvObkSkKS/zH
 tWSd0eaLlBNas8iUj6hMvfuTBWoqLflJhbVuAwuszlIb8KKQLeCVb9S9m
 JtUFsbF2Z6CfDXCMM7ZLwrHjtKE9keRncmowCBfGE/YS5rxkhzTHXvftj
 MLjfggn+Rfm06irjveH9nB7Ekrie22wPRU5kZgtXhu9Hx/YxXjYKoCkYg
 h2QhUlRwuLHQ+JIu+F439S4cyCamwuzj7FEK8oU+FFA+dVcSCGegaNP2z g==;
X-CSE-ConnectionGUID: 9eq+UVMuTFyfnzJshDna5A==
X-CSE-MsgGUID: IHOcVhjvSfadEq9rcHx6lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400086"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400086"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:22 -0700
X-CSE-ConnectionGUID: B8GUoBHQT8Ok6lwyZl0ETA==
X-CSE-MsgGUID: cuMM0pWjQzaA8eqNFvfAdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199497"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:21 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 08/17] tests/kms_psr: limit #outputs tested during
 suspend
Date: Thu, 10 Sep 2026 20:58:53 +0200
Message-ID: <20260910185902.2728276-9-michal.grzelak@intel.com>
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
- indent `case' at same level as switch (Mohammed)

v2->v3
- remove blank line (Mohammed)
- change output format of help string (Mohammed)

v1->v2
- s/OUTPUT_LIMIT/SUSPEND_OUTPUT_LIMIT/ (Mohammed)
- fix typos (Mohammed)
- fix off-by-one error (Mohammed)

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_psr.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 7b02dd2072..c8e3ed2e7b 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define SUSPEND_OUTPUT_LIMIT 2
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
+	case 'o':
+		data->all_outputs = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
 data_t data = {};
 
-int igt_main()
+const char *help_str =
+	"  -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n";
+
+int igt_main_args("o", NULL, help_str, opt_handler, &data)
 {
 	int z, y;
 	enum operations op;
@@ -945,10 +966,15 @@ int igt_main()
 				     "performed with suspend resume cycles");
 			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
 						   append_subtest_name[z]) {
+				int output_count = 0;
+
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
+					if (!data.all_outputs && output_count >= SUSPEND_OUTPUT_LIMIT)
+						continue;
+					output_count++;
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-- 
2.45.2

