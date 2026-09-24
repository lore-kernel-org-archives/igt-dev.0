Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394EC98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71DF10F38C;
	Thu, 24 Sep 2026 07:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMgYFU8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170D010F37E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236257; x=1821772257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDOdG+1MhW082daTtuQoLM8wQa5QoInNcLzYZb9GYZs=;
 b=iMgYFU8gNisl+AmJxZXkUWu9yOhzM+s+P2gNLC0G0CTF1uGXvS5ANjg7
 ywnGI7n8YTXiYhXDjuEBBxLrw55+hmwnkuS6i2Ji9A1p4ZWglbrOpHNeh
 GS6a2nbP/RUHi9vwtEiWRCI1OosPMUgK+LPzgz1vC8FZ3RDA0ePUaJzU6
 e9qgv8BJar8Z3MFXVNDmg5z1X8p1HxA4MVHVJz12Ty+OrAIwpL96vQZMI
 VnSlZ7RudYcks18O0BJhBrl7ESAyST0UU8OmkMU51+DilixuugGTmXK3K
 /CFi8LPcy3nREbdqOCYrhwShyi1uf3x+pIwBsRSGGMomdxsz0GHCDIXvm A==;
X-CSE-ConnectionGUID: WTPlkya2Qq2BN6nV1jvMhA==
X-CSE-MsgGUID: e996VP/5QByH9Kp2B/LlZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90119597"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90119597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:56 -0700
X-CSE-ConnectionGUID: MUuGjJ8aSZyiPVWfm8YCPA==
X-CSE-MsgGUID: ihDw9NqhTwqqP08sunV6Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311854736"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:50:55 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v6 2/7] tests/kms_async_flips: limit #crtcs tested
 during suspend
Date: Thu, 24 Sep 2026 09:50:14 +0200
Message-ID: <20260924075019.4151374-3-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
References: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
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

Increase tests' performance by testing only 2 CRTCs by default.

Currently first and last CRTC coincide with first and last pipe. In
future this is likely to change due to pipe reordering. It should not
affect the test overall since the aim is to pick two arbitrary CRTCs.

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- use crtc instead of display->crtcs (Mohammed)
- use proper logic operator (Mohammed)

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8884efd8ba..f373dfcd95 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -873,6 +873,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
+	int idx;
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
@@ -885,6 +886,10 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			data->crtc = crtc;
 			igt_display_reset(display);
 
+			idx = crtc->crtc_index;
+			if (data->suspend_resume && idx != 0 && idx != display->n_crtcs - 1)
+				continue;
+
 			igt_output_set_crtc(data->output,
 					    crtc);
 			if (!intel_pipe_output_combo_valid(display))
-- 
2.45.2

