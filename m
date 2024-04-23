Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9589C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A23D10ECB6;
	Tue, 23 Apr 2024 08:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBobaIV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D43310ECB6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862691; x=1745398691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SxFbSnxNAfSzOJUpC0fFpA/Fi1HeRp2L0hnSCeUfAXM=;
 b=VBobaIV5f9TJf4w3A8Hm0JbTjB+0L3boEIzyn3+zXVEQlWxcWtzZA/P4
 RnQo4/7oGqz2Am95BEgXIDjYR/LHdcqgC6k4+DgSh+RWHmD1TVOzVyyKA
 k7tD9NiYyae8BD9kM0GsGwFM86UU2KKrz673XB1H+pPA3iOffj4ul6pPh
 PruS2N+liBUwsG5+zcTvK53ooLsMU91k0xC2ojCVrO8Pmn874EhKAQpo+
 m1BcgJo7hBSWDdO+CKpqiZpxYIWH5ohDtkpjxybAojzY8C37G9f1xLwQc
 N1CZHQwhN0BHURi0SfQCsyJ7SrO0ykfFee6wBfj7f+JzGztjpFkVG+S0N A==;
X-CSE-ConnectionGUID: QpMnfqCBSRqYdbQx0jaoyA==
X-CSE-MsgGUID: aiyKgRVrRJy8i9esEO5K4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="26949873"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="26949873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:58:11 -0700
X-CSE-ConnectionGUID: qTa981Q/R0yQxOpv+jM85g==
X-CSE-MsgGUID: 3b6nQVizSkCZDW+hT2HeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24822970"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:58:10 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 6/6] benchmarks/gem_wsim: Option to list physical
 engines
Date: Tue, 23 Apr 2024 10:56:46 +0200
Message-Id: <20240423085646.6672-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
References: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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
index effe8a479..ae4e507ce 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2987,6 +2987,7 @@ static void print_help(void)
 "  -f <scale>        Scale factor for batch durations.\n"
 "  -F <scale>        Scale factor for delays.\n"
 "  -L                List GPUs.\n"
+"  -l                List physical engines.\n"
 "  -D <gpu>          One of the GPUs from -L.\n"
 	);
 }
@@ -3046,10 +3047,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
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
@@ -3072,11 +3105,14 @@ int main(int argc, char **argv)
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
@@ -3197,6 +3233,11 @@ int main(int argc, char **argv)
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

