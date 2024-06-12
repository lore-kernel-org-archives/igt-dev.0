Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AF3C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 10:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D479A10E821;
	Wed, 12 Jun 2024 10:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLllnwcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D19010E821
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718189930; x=1749725930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0sk/g2kUEbopLl9ByaziSjpfV/WGSE0cx+sfBs9pCOk=;
 b=RLllnwcyp83l2qWjUdGZ/Fzkl8XspIapfDWlKDNG0f2zJ01JsgrSDqZr
 82paVZIecl3LcoGHdxgyuu14wJ7L08h12+IpOi5cqIgrDg4rOVEyPswhc
 0BL0uypFFz3xB1J6ZobCqKcjyipi725dSh0uu1cJFDldbMSXzx/T90viA
 WwxfkQ+LODrbmt2yH1JRSdj0dDUIONzoiYGVpqTxmdbt1wn274CDVS1F2
 0iKPv6Rbjq0TcoB2DXplEkLkrwkryL6to9EQuV01Y7yY+9S9dvOMEWMYh
 4SW5r+NlPb2DMyjpKrs57u5PpKd1pZMYbt/MxHtHipl5PRQEtHwPaWHkn g==;
X-CSE-ConnectionGUID: lYvl/ieIS4yFMMdF0dVPcw==
X-CSE-MsgGUID: rGqLXKiJSKapQhooFbtPrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="12036472"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="12036472"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:50 -0700
X-CSE-ConnectionGUID: oD8cquNdRf+E7RizqhgVPg==
X-CSE-MsgGUID: cEnJ4PNWRVWxQrxGY0z+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39867171"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:58:48 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Date: Wed, 12 Jun 2024 16:36:45 +0530
Message-Id: <20240612110645.1110374-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612110645.1110374-1-jeevan.b@intel.com>
References: <20240612110645.1110374-1-jeevan.b@intel.com>
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

Add checks weather early transport if supported then
we check if early trasport is working.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c3e34aa0..e612b8266 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -168,6 +168,7 @@ typedef struct {
 	igt_plane_t *test_plane;
 	bool big_fb_test;
 	bool fbc_flag;
+	bool et_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -184,11 +185,23 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 {
 	bool supported = false;
 
+	data->et_flag = false;
+
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-						 PR_MODE_SEL_FETCH, data->output)) {
+						 PR_MODE_SEL_FETCH_ET, data->output)) {
+		supported = true;
+		data->psr_mode = PR_MODE_SEL_FETCH;
+		data->et_flag = true;
+	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							PR_MODE_SEL_FETCH, data->output)) {
 		supported = true;
 		data->psr_mode = PR_MODE_SEL_FETCH;
 	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							PSR_MODE_2_ET, data->output)) {
+		supported = true;
+		data->psr_mode = PSR_MODE_2;
+		data->et_flag = true;
+	} else	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							  PSR_MODE_2, data->output)) {
 		supported = true;
 		data->psr_mode = PSR_MODE_2;
@@ -916,6 +929,9 @@ static void run(data_t *data)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
 							  data->pipe),
 							  "FBC still disabled\n");
+	if (data->et_flag)
+		igt_assert_f(early_transport_check(data->debugfs_fd),
+			     "Early Trasport Disbaled\n");
 
 	data->screen_changes = 0;
 
-- 
2.25.1

