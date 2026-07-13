Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080AC44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5091C10E5AB;
	Mon, 13 Jul 2026 09:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA64ZW6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490D010E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932980; x=1815468980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CuFa8ZjNYiPh+iX4wnxbT4jU3Bo26UbaHXvKlImkGzY=;
 b=DA64ZW6fQYgrwxerZrHBtx7HMHkY/IG1wkeXWzgBYqm8HuqrvXqcdjE0
 19nJEaTvmr5fq9OejTwJk31jcHlCduJRPEI1MOqnEoadb+O3AFCxtA14f
 VjjiXQpX35LJZnSw+VcBTqnv8sfsYWcHxdZ+aKjR8uCx3BdOy6eaYvKY9
 9f8nT67AB6wQudIkzJJkghtN9REs/SAgCPOR+4E/1qk/XzhuHGVFRxFxq
 mtKmL0GMOezoQe2ga1h4OwbpKmmZr13qIPWPAJMGhoukPc34Zb14OtYyw
 MX+ahC7ZeDcAdPAAadJ2aYybYXLaKzVHZj2xeMpVx5Zy1bT9yxlxiUkp6 g==;
X-CSE-ConnectionGUID: 8h+dUFPzRfCMzjRXx2L4Sw==
X-CSE-MsgGUID: lXNZWXJXTDOBu5o1yhcbBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081335"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:20 -0700
X-CSE-ConnectionGUID: DRXbZLZ0R5WFPdomZsxQOg==
X-CSE-MsgGUID: trQdSxhOTE+AjqRxULLrxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385949"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:19 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 13/16] tests/kms_sharpness_filter: limit #crtcs
 tested during suspend
Date: Mon, 13 Jul 2026 10:55:12 +0200
Message-ID: <20260713085515.463575-14-michal.grzelak@intel.com>
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

We are iterating through each crtc while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

Limit number of tested crtcs to first and last. Test each crtc when
passing commandline parameter.

v1->v2
- remove unused vars (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index adec4a60c5..a8578cf4fc 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -233,6 +233,7 @@ static const struct subtest_entry {
 typedef struct {
 	int drm_fd;
 	bool limited;
+	bool all_crtcs;
 	bool all_outputs;
 	struct igt_fb fb[4];
 	igt_crtc_t *crtc;
@@ -635,6 +636,10 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			igt_output_set_crtc(data->output, data->crtc);
 
+			if (type == TEST_FILTER_SUSPEND && !data->all_crtcs && crtc->crtc_index != 0 &&
+						crtc->crtc_index != display->n_crtcs-1)
+					continue;
+
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
 			 * Remove this check once support is implemented.
@@ -776,6 +781,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'l':
 		data->limited = true;
 		break;
+	case 'c':
+		data->all_crtcs = true;
+		break;
 	case 'o':
 		data->all_outputs = true;
 		break;
@@ -788,11 +796,12 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
 static const char help_str[] =
 	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
-	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
+	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n"
+	"  --all-crtcs|-c\t\tExtend suspend tests for all crtcs\n";
 
 data_t data = {};
 
-int igt_main_args("lo", NULL, help_str, opt_handler, &data)
+int igt_main_args("loc", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.45.2

