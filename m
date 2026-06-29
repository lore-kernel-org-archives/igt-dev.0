Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDE7C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962EF10E7CE;
	Mon, 29 Jun 2026 09:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmWSGGIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513A010E7CD
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724455; x=1814260455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jvo/wNbf/YW4LVmWrBCQb/LOkMH5uXY14SE7Zs+6qvQ=;
 b=nmWSGGIisQWsidoUR1T5lRY8+O9qx/P3bshWYr6Jr3fJfl24jott+8qx
 sHwjJk+wb725bfOffHs8eTuq/4LbU69jxx+OOGWi/ENwzHbrnxQxokKFY
 5duabyTjE4vXUZfJSu/B6JDjQ/CJnDK88a5T5p4H5flZCWHbl93/o9LHJ
 EcVNpvXaQb57D5xZEfmTRM5X5eYk3XbK1xGZFBk6W4h7p8bmKmtpCoZnO
 TOioC06PlH8ZvfTdwzOVFp/Tar/IcWIuze2TJ8qikvomChgaWmbZT2COp
 iNEyQ3hhpjDkxt7RBWpJoNuAw60UF8OssYK2s9YVjs3JaW3tTX9dwGbma A==;
X-CSE-ConnectionGUID: eobrgBB6S/uRvBfMY5DjyQ==
X-CSE-MsgGUID: CplU6vRfRdOMfuWV+ySNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94556938"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94556938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:14:15 -0700
X-CSE-ConnectionGUID: a/+/RkSzR1+8QyvcVg3lMw==
X-CSE-MsgGUID: b7w+FESQScap09vABz+qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="249277754"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 29 Jun 2026 02:14:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/kms_pipe_crc_basic: limit execution of
 suspend tests
Date: Mon, 29 Jun 2026 11:13:50 +0200
Message-ID: <20260629091350.2706610-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260629091350.2706610-1-michal.grzelak@intel.com>
References: <20260629091350.2706610-1-michal.grzelak@intel.com>
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

Unless using extended run flag limit the execution of suspend tests to
first and last active CRTC. This helps with reducing default execution
time of the test which can lower number of hitting CI timeout.

Cc: Juha-Pekka Heikkilä <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_pipe_crc_basic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e1415452..50b8a580f0 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -428,6 +428,10 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if(!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
+				if (!extended && crtc->crtc_index != active_crtcs[0] &&
+				crtc->crtc_index != active_crtcs[last_crtc_index])
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name) {
-- 
2.45.2

