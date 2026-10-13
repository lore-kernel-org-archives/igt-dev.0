Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD94CC6B19
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EF910E51D;
	Tue, 13 Oct 2026 16:15:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0510E51D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907859; x=1823443859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNi0BeRg1aeYsyW51F3MyePIgXy2nuE8Emh6ocNUNRc=;
 b=dEMB/CFxrz2uhhqZevpbo66lTxLsByv+IxB3X+8mAHBW2gPwUuirmGJR
 BMYWgc/yMRGDGDhzDWCAiOyxDqstHiY6G21y0ENzaXtgS7Mu8J08v19jt
 FpOi+NKuaN9Gyxb8iZIRlwIYxRdJ9jeEU+/h5LZl8f1URCFdcz+Mf8k9a
 +T3eddXLXrvBn9PS7XGPt7jB4w3VyPLStpLPInFpdPLqCSvVNJ85CaDok
 KO2qhJ6Iytl7soI7iIxTnvbcRs3Av067v0XzJXe46gsOh8yjrsByPcx9G
 fOgEEvMQ5kjZI7T/5f+s0TIxPoLyrWU/vdE3E3R8tmjCQsZfQN+UMMr+z w==;
X-CSE-ConnectionGUID: rdFl6X0DQQ+dVTBAqTvgKg==
X-CSE-MsgGUID: 6T+d9SRNQRKIWmga0rNs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656309"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:59 -0700
X-CSE-ConnectionGUID: FjQA1OUcSrS8PjzMrOw8Xw==
X-CSE-MsgGUID: y/b9w0ZuTJmxXj39BvLnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096315"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:10:57 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 3/9] tests/kms_async_flips: limit #pipes tested
 during suspend
Date: Tue, 13 Oct 2026 18:10:07 +0200
Message-ID: <20261013161013.1364753-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
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

Test suspend on first and last pipe by default.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus set first
and last pipe as the only available in suspend resume case.

v7->v8
- use pipe mask (Jani)

v6->v7
- use hardware pipe instead of CRTC (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- use crtc instead of display->crtcs (Thasleem)
- use proper logic operator (Thasleem)

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a548c73cd9..1d930260c6 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -298,7 +298,9 @@ static bool set_available_hw_pipes(data_t *data)
 
 	for_each_crtc(&data->display, crtc) {
 		hw_pipe = crtc->hardware_pipe;
-		data->available_pipes[hw_pipe] = true;
+
+		if (data->suspend_resume)
+			data->available_pipes[hw_pipe] = true;
 
 		if (last_pipe < hw_pipe)
 			last_pipe = hw_pipe;
@@ -310,6 +312,9 @@ static bool set_available_hw_pipes(data_t *data)
 	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
 	        return false;
 
+	data->available_pipes[first_pipe] = true;
+	data->available_pipes[last_pipe] = true;
+
 	return true;
 }
 
@@ -1227,8 +1232,8 @@ int igt_main()
 
 	igt_describe("Verify the async flip functionality after suspend and resume cycle");
 	igt_subtest_with_dynamic("async-flip-suspend-resume") {
-		test_init_ops(&data);
 		data.suspend_resume = true;
+		test_init_ops(&data);
 		run_test(&data, test_async_flip);
 		data.suspend_resume = false;
 	}
-- 
2.45.2

