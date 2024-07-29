Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B37AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 17:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07D10E45A;
	Mon, 29 Jul 2024 17:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bn/0zN4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73710E45A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722275655; x=1753811655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FiGlP0z0icX453lm3tdfHSLnu1rb+RDbGE7DLnDTJo=;
 b=bn/0zN4EfPvD+fqZLscxSdArfs56EKu5metQthTyxwcDFp+JHSuA7G/3
 hq5pT+t89u7NN2cYtCirpUnYfN9fTLQ5ZrFZ7NqsJ4wfW804DqOlCLDWt
 qNWzX0rJo/dzjHHEt1ExLR7ED+vFxaeafMwU9pX91m+aOvJBLMEFh9/5V
 mxctKWzIsEI+ZqjrrvlTa3wAB8CC0vx4YZ7kVSXW6/yfrB0Usj2V7PdJS
 tOEmWgK+ld+6EaF4j7FI0+hCl4DsUJOQoHWmRvMcfbF+RDHzAEMb7VfBe
 0pa2TxawYJhM/Qc+UmBC8Wv7TfYR7uxhK2nwJiaFyL9/1oKEFeZK/1SHb g==;
X-CSE-ConnectionGUID: YVL3JVktT32rw6hQTkMu/g==
X-CSE-MsgGUID: eM6+9hobTdOJk/NC7Z+NBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37527830"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="37527830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:54:15 -0700
X-CSE-ConnectionGUID: ycwzgsCVRMi7Q+2jHMXbLg==
X-CSE-MsgGUID: 7wrLEt+yTy61F/9W1ZphqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54141582"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:54:14 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tursulin@igalia.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 i-g-t 6/6] benchmarks/gem_wsim: Option to list physical
 engines
Date: Mon, 29 Jul 2024 19:52:19 +0200
Message-Id: <20240729175219.1636694-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
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

Added command line option (-l) to list physical engines.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 0c022f9ce..c4fd00a6a 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2989,6 +2989,7 @@ static void print_help(void)
 "  -f <scale>        Scale factor for batch durations.\n"
 "  -F <scale>        Scale factor for delays.\n"
 "  -L                List GPUs.\n"
+"  -l                List physical engines.\n"
 "  -D <gpu>          One of the GPUs from -L.\n"
 	);
 }
@@ -3048,10 +3049,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
 	return w_args;
 }
 
+static void list_engines(void)
+{
+	struct intel_engines *engines = query_engines();
+	int engine_class_count[NUM_ENGINE_CLASSES] = {};
+	unsigned int i;
+
+	for (i = 0; i < engines->nr_engines; ++i) {
+		igt_assert_lt(engines->engines[i].engine_class, NUM_ENGINE_CLASSES);
+		engine_class_count[engines->engines[i].engine_class]++;
+	}
+
+	for (i = 0; i < engines->nr_engines; ++i) {
+		if (engine_class_count[engines->engines[i].engine_class] > 1)
+			printf("%s%u",
+			       intel_engine_class_string(engines->engines[i].engine_class),
+			       engines->engines[i].engine_instance + 1);
+		else
+			printf("%s",
+			       intel_engine_class_string(engines->engines[i].engine_class));
+
+		if (is_xe && engines->engines[i].gt_id)
+			printf("-%u", engines->engines[i].gt_id);
+
+		if (verbose > 3)
+			printf(" [%d:%d:%d]", engines->engines[i].engine_class,
+			       engines->engines[i].engine_instance,
+			       engines->engines[i].gt_id);
+		printf("\n");
+	}
+}
+
 int main(int argc, char **argv)
 {
 	struct igt_device_card card = { };
 	bool list_devices_arg = false;
+	bool list_engines_arg = false;
 	unsigned int repeat = 1;
 	unsigned int clients = 1;
 	unsigned int flags = 0;
@@ -3074,11 +3107,14 @@ int main(int argc, char **argv)
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
+			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
 		switch (c) {
 		case 'L':
 			list_devices_arg = true;
 			break;
+		case 'l':
+			list_engines_arg = true;
+			break;
 		case 'D':
 			device_arg = strdup(optarg);
 			break;
@@ -3199,6 +3235,11 @@ int main(int argc, char **argv)
 	if (is_xe)
 		xe_device_get(fd);
 
+	if (list_engines_arg) {
+		list_engines();
+		goto out;
+	}
+
 	if (!nr_w_args) {
 		wsim_err("No workload descriptor(s)!\n");
 		goto err;
-- 
2.31.1

