Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778C1D711CA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3554010E8DD;
	Thu, 21 Nov 2024 10:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5pWHSXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4A10E8DD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732185059; x=1763721059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dn/nG/c8TAhYm/ryS5nxneJ2qmSQagd01k1YyyikGig=;
 b=e5pWHSXOyTx9mXkZFZY4GOPmGJD5Ezl5FFzYfHouMEmscEzBzIzREX1X
 2FnOQW3e6uApB/g3NBUYBGOpOKQQvO3mwhi2TwwHBLnGNAHB8JFG6BILs
 0XqCfYmyIeaUq7BjxeYaGRadkzUlFRarqQ0v7Vp3w0d/kpqe8cmI06Abk
 mlspqxeYdjwlU8Wt1iVF5roL87AxqckFllIcNTM7o62bGhFVSDwqmd/Ht
 rnmlU9sfnfDBbTyT8Sv7bKJ81RbgsGIkDw2++ctHGWlMjvH9zqshYa9g3
 JBFsWN9JJAQCa0dNwRll7zPFknmDlrbyfaEdQtCyyOPwVIp7H5UDXL9HK A==;
X-CSE-ConnectionGUID: unjb4rhFRCuXrsqksV/rjQ==
X-CSE-MsgGUID: LGB1t8x3T96kD6e42RsnnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43685040"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43685040"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:30:59 -0800
X-CSE-ConnectionGUID: HTPaw/VRSR+UWdEfAB7JUw==
X-CSE-MsgGUID: U0VrF8GVRICc3Dnr5aUomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90155571"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 02:30:58 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] Fix bigjoiner compatibility checks for connector
 modes
Date: Thu, 21 Nov 2024 16:15:54 +0530
Message-Id: <20241121104554.65366-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121104554.65366-1-jeevan.b@intel.com>
References: <20241121104554.65366-1-jeevan.b@intel.com>
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

fix bigjoiner compatibility checks by adding drm_fd argument.
added unsupported config checks for bigjoiner modes in display tests.

v2: remove unrelated change.

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

