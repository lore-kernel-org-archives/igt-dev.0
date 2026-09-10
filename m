Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BA7C79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9224710E30B;
	Thu, 10 Sep 2026 20:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ed8RMbxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0095F10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071271; x=1820607271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Obt9iL4oonXGDZe6ddJ64Z7Lxt75ffTBGOYtX1BbIvY=;
 b=ed8RMbxzIgkbP2D50urCXDdgcoQh2fAKBmnIljdXFFjDmqoLua659CK5
 YNCWfb40hpsaMPOR6uooyJjVEqP2LOg2EONPNexPOu7DMjjU3gfxKmeZ3
 LDV2NNQSBohFeNqOtYgKjtXo6IBYresShM3Zv9CPBepV0HBGcDnC3PLVl
 Pk1n9mINVWx0lskbsLVsIl8LzvIo+WdcMt9rUprJNb3sUBNx5/wcSMiNN
 cjBoqrln6E03J0KncMx2KUovTCQnzyElJOhVzWg0vPJ6HuODd4OopMsBO
 zF8UK7QvuSQFao9HYfF3BnpKe6z29tsOJFPLkIdennegJNglt4iQUyPn6 g==;
X-CSE-ConnectionGUID: kXZtGmQDSfKDMbwxJcN0dw==
X-CSE-MsgGUID: 7kFAcUQKTtOYP/zipZ+mgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657258"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:31 -0700
X-CSE-ConnectionGUID: 2ywERcZCQHKbOLmY1u37zg==
X-CSE-MsgGUID: Jo7rM4AEReeKgixPDnK55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978189"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:30 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 04/17] tests/kms_async_flips: limit S/R to first and
 last CRTC
Date: Thu, 10 Sep 2026 22:14:00 +0200
Message-ID: <20260910201413.2730574-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910201413.2730574-1-michal.grzelak@intel.com>
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
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

v3->v4
- use crtc instead of display->crtcs (Mohammed)
- use proper logic operator (Mohammed)

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
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

