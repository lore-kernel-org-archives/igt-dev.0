Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D8C5DF89
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD810E4C4;
	Fri, 21 Aug 2026 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UReCcnNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EAB10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316525; x=1818852525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gHp/lOTzvC/fejKUhqkVpGkLTCip9EUfSClOTogKN58=;
 b=UReCcnNtHwe+HDi3QEXqIqmrTwtus6yWGeOgSOzulP6cAlekAFjFnYdk
 XtDPc6JMCutrXbdhzA3DvAtZ5B3dYpTEb9U4OyYNDg1DJR1hhBRRRC10E
 tfE89aB2xrKcFnTE8AIhnHmo9hXP9dNvCxDIv58b7SavVf48uEzFmIBbY
 9TgQf0f2sD+DBhHtxy0cu1iLDWzJLv8GR4yAyFfcJt89IKhkYqehLlk42
 gRkEAY/Y+/2Kntiwk70ptuU0unqJHYSTA6P8+wxBvxh5YvT7hV1SuEOq3
 hE21xAyDRldhg1z6xoBsYwqodL8+lYCpxyFJY4LlX0/DfwOWMX+D9MO0T A==;
X-CSE-ConnectionGUID: 32Q/l2ArT4y8ms21l/Z75Q==
X-CSE-MsgGUID: a4AJti7mQAOT8yq+CAoI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632912"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:44 -0700
X-CSE-ConnectionGUID: 5OOJ9panQuK41OcLsn5JwQ==
X-CSE-MsgGUID: wn4LvbyCSnmesZ4XU8RZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188346"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:43 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 04/17] tests/kms_async_flips: limit S/R to first and
 last CRTC
Date: Fri, 21 Aug 2026 14:48:21 +0200
Message-ID: <20260821124834.1974029-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
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

In order to increase tests performance limit suspend-resume's execution
to only first and last CRTC.

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
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

