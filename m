Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D4DCA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 03:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0EE10E1F2;
	Fri, 29 Aug 2025 03:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJ5IJ+Yd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33FF10E1F2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 03:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756439779; x=1787975779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dF/30/fSeaq4nijp4nObgtQyi2XOcT/uHP/xFN1tE00=;
 b=oJ5IJ+YdPec0kNkqfCcSo22L/G/emVQ02sje3UP+ud62Mltj3kalaG64
 1gc6TDvr3ndc6eiif6HFg9klKMz6xO1o5X4IpwXcxT2Y+CUy2iNox3nCT
 8ara4L+M7JNmkgZT9O5IQl3K7IsytUE1YErgYEvQhZl3tCDPQdtj9a1/9
 ca+FtqsN48QNQOTdHlAo06BeZ5l10p4oHa+UPz08mZMUE0Mnz/bnn2x1w
 +yu2tzXb5to4mHTZ9cz7Ij2aeFDjzAo28EWL8uCprzyRpbnVyiEqsYRJq
 l8r5n6t2ZdMKBsaqF/08cGF3K7Em4DePGZefVXVgAEt1j/xtIQS13KFYd A==;
X-CSE-ConnectionGUID: UzzdIQcnQQm3AtijJdILSQ==
X-CSE-MsgGUID: F326upWRTt6SEZ5+dnC9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81314114"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81314114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 20:56:19 -0700
X-CSE-ConnectionGUID: DKdJzBamRuSsKo5s93eAmQ==
X-CSE-MsgGUID: bLgh4nYkRwyTEd7XBce4RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169808987"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 20:56:18 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_evict_ccs: This patch adjust object size
 as per VRAM
Date: Fri, 29 Aug 2025 03:56:09 +0000
Message-Id: <20250829035609.858784-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829035609.858784-1-sobin.thomas@intel.com>
References: <20250829035609.858784-1-sobin.thomas@intel.com>
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

v5: Fixed review comment for igt warnings and commit subject. [kamil]
    Fixed the condition for user provided max size value. [kamil]

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict_ccs.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 281d27015..16abba4ec 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -39,12 +39,14 @@ static struct param {
 	int vram_percent;
 	int min_size_kb;
 	int max_size_kb;
+	bool user_set_max_size;
 	bool verify;
 } params = {
 	.num_objs = 0,
 	.vram_percent = OVERCOMMIT_VRAM_PERCENT,
 	.min_size_kb = MIN_OBJ_KB,
 	.max_size_kb = MAX_OBJ_KB,
+	.user_set_max_size = false,
 };
 
 struct object {
@@ -343,6 +345,34 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
 }
 
+static void adjust_params_for_vram_size(uint64_t vram_size)
+{
+	uint64_t vram_mb = vram_size / (1024 * 1024);
+	int recommended_max_size_kb = 0;
+	int max_object_mb = vram_mb / MIN_OBJ_KB;
+
+	/* max_object_mb clamped between 2MB and 256MB */
+	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
+	recommended_max_size_kb = max_object_mb * 1024;
+
+	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
+		 vram_mb, params.vram_percent, max_object_mb);
+
+	if (params.user_set_max_size &&
+		params.max_size_kb > recommended_max_size_kb) {
+		igt_warn("User specified size (%dMB) may not be optimal for %"PRIu64"MB VRAM\n"
+				"(recommended size: %dMB)\n",
+				params.max_size_kb / 1024, vram_mb,
+				recommended_max_size_kb / 1024);
+
+	} else {
+		params.max_size_kb = recommended_max_size_kb;
+	}
+
+	igt_info("Final settings: %d%% VRAM, %dMB max object\n",
+		 params.vram_percent, params.max_size_kb / 1024);
+}
+
 static void evict_ccs(int fd, uint32_t flags, const struct param *param)
 {
 	struct config config;
@@ -440,6 +470,7 @@ static int opt_handler(int opt, int opt_index, void *data)
 		break;
 	case 'S':
 		params.max_size_kb = atoi(optarg);
+		params.user_set_max_size = true;
 		igt_debug("Max size kb: %d\n", params.max_size_kb);
 		break;
 	case 'V':
@@ -500,6 +531,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		adjust_params_for_vram_size(vram_size);
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-- 
2.34.1

