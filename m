Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83BFD3B9B7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0810E922;
	Tue, 26 Nov 2024 16:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGdbZB/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E0710E922
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637738; x=1764173738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gy351v3tP4XyhJl9TLSMtQJ/474AAy6gcwXlCzpZPos=;
 b=PGdbZB/4N1NqAexnmch0cSPLyqDSD5qOZskooYdVl2tj8Q7B2k9nch2o
 tBpmdiH1lXclngqdTDedORr+JH/PMy/yQzjOahCGkT7Q+t65UbTFXZloz
 Mtay0NSm1uhOvfS/D7YKFR1gnumtQ3gqDqwMrqC+/2TjqOrLkuE4rI065
 KB1Y29kBS3HrxqWXT6ReR1xRe6trrEY/qfquvCxv1JjyNE6GhZdTHThEU
 s/7twnDlQq1PGrSNwWWNj54qtOW8bAynI2xbL096k7OF3eUwhhygo2coP
 gXa/8NKWo2rk8OTTVEQ5sf07zyXdgJLN0BB4+guxvI1zB/W6QS5i2ttXq w==;
X-CSE-ConnectionGUID: IIkqNEpSTJ+NuNANoUN/oA==
X-CSE-MsgGUID: GKB45q7HRpWgZGhEGFNmAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43468121"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43468121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:38 -0800
X-CSE-ConnectionGUID: dpDJMUjBRcqcNS34iTwacw==
X-CSE-MsgGUID: fW1cK2orTjCDABQffg2eCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129179969"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:37 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/5] tests: Update igt_bigjoiner_possible calls to
 include drm_fd
Date: Tue, 26 Nov 2024 22:00:19 +0530
Message-Id: <20241126163021.458991-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126163021.458991-1-jeevan.b@intel.com>
References: <20241126163021.458991-1-jeevan.b@intel.com>
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

Updated tests to pass drm_fd to igt_bigjoiner_possible.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 4 ++--
 tests/kms_flip.c          | 4 ++--
 tests/kms_setmode.c       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 889da42de..74e9d799a 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -166,11 +166,11 @@ static bool test_constraint(data_t *data)
 	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
 		return false;
 
-	if (igt_bigjoiner_possible(mode, max_dotclock)) {
+	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
 		for_each_connector_mode(data->output) {
 			mode = &data->output->config.connector->modes[j__];
 
-			if (igt_bigjoiner_possible(mode, max_dotclock))
+			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
 				continue;
 
 			igt_output_override_mode(data->output, mode);
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 88cd41083..3ad4d0afb 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1756,11 +1756,11 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				 o->kconnector[i - 1]->connector_type_id);
 
 		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
+		      igt_bigjoiner_possible(drm_fd, &o->kmode[i], max_dotclock)) &&
 		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
 		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
 		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
+				 igt_bigjoiner_possible(drm_fd, &o->kmode[i - 1], max_dotclock)) &&
 		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
 
 			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bc7b8fabb..d61cfeb9a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -736,11 +736,11 @@ static void test_one_combination(const struct test_config *tconf,
 			 *   - current & previous crtcs are consecutive
 			 */
 			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
-			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
+			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
 			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
 			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
 			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
-					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
+					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
-- 
2.25.1

