Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53052C5AD05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F142410E463;
	Fri,  7 Aug 2026 22:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6GKb1dt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF3510E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142875; x=1817678875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Hsa8xBFSiNoJxGKRmauteQ0R4UKrzw0TwOQ47iiSy4=;
 b=h6GKb1dtdqv+oFG//uXa33qgewjXFBuNImXu93NwUyWozYFlo/KSEgzL
 e7YSNCFnFeogTWpIwAANXRfwlTNkYmsNIdvT6mZLc5WHKeWrPhAJhh/3J
 aQpiyVRxaFfIkgNafVJbctgKYc0rMPBlqJIW4+AmwshcBy5lbOeAicyuB
 lVJATP1cbnhOcOU2+Kxhp93Ps9IT0dXa6hYzQaqU7UQPX57fSZyhJcfcX
 ebyJ+kTON2w8UMGB4eWI0VFgIFDOFw78W6nl/bkjjbsqVMov8BfEXyWKw
 gn8WVCFWScAnkfTFa4bRuU4nCIVqGKUv2SBOWkK+fok8sPjzzBBl3u7Gi A==;
X-CSE-ConnectionGUID: oHIEENg+R6+W4BHd6VTT8A==
X-CSE-MsgGUID: 9Zlg7X/mRxuIZr2/Uqq2tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835801"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:55 -0700
X-CSE-ConnectionGUID: b6dlrddZSiyisu0X+28pQQ==
X-CSE-MsgGUID: Uxj5YRn4STCWvxiNrPpGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655406"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 04/16] tests/kms_async_flips: limit S/R to first and
 last CRTC
Date: Sat,  8 Aug 2026 00:47:34 +0200
Message-ID: <20260807224746.3554064-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
MIME-Version: 1.0
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

In order to increase tests performance limit suspend-resume's execution
to only first and last CRTC.
---
 tests/kms_async_flips.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 03348d958d..5c143e71df 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -873,18 +873,23 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
+	int idx;
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
 	for_each_connected_output(display, data->output) {
 		for_each_crtc(&data->display, crtc) {
-			if(!igt_crtc_connector_valid(crtc, data->output))
+			if (!igt_crtc_connector_valid(crtc, data->output))
 				continue;
 
 			data->crtc = crtc;
 			igt_display_reset(display);
 
+			idx = display->crtcs->crtc_index;
+			if (data->suspend_resume && (idx != 0 || idx != display->n_crtcs - 1))
+				continue;
+
 			igt_output_set_crtc(data->output,
 					    crtc);
 			if (!intel_pipe_output_combo_valid(display))
-- 
2.45.2

