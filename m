Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12993CD37B5
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 08:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAA610E37C;
	Mon, 11 May 2026 08:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8ojlUxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C5610E410
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778487308; x=1810023308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fKN77iI3ET4nZF9Ibh665Nj4+0rUsKaTCoWDkgq+ZMQ=;
 b=G8ojlUxAaSUeYxD8xyZyaHOMqVi7RsalIOAuBq5h66scnmLiTDiMV9jx
 tISDJ/kGoFPY+axtgG5f6pqwjrDwtsMZmO31ZQc0FePV4G5zW6tKrfUUd
 be9WUetYdG88YarfQ8FDxl6+tNTCK5LIhOY46h8Zw8qN3wWiXJcgqufo0
 Hx4Dn6JybeybPnVi0idq1NCU3/rn9w1CnyBzqXTU+BCGraCbXeMrJrbwz
 PVOKEvnxhFjpTzi91psmgXuCLo4ghxK6zAlCMuUfLqFhiMZbZI1vDFvYM
 y8jhO9bTLXPYlbh4MrCPJhAdgFpX33fjodLIkjX2G0GxBLfmyiNxP7q4n Q==;
X-CSE-ConnectionGUID: QaqpoBmIQfaGBCdjceoU4w==
X-CSE-MsgGUID: OlMbGbVVTG6jDcy4svereA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79351762"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79351762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:15:07 -0700
X-CSE-ConnectionGUID: ZCBRhFG9Q3+UIZ/vE4Zi/Q==
X-CSE-MsgGUID: TTSuAEm3TmelbVTQCZP3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="239211192"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 01:15:05 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Karthik B S <karthik.b.s@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
Date: Mon, 11 May 2026 13:41:17 +0530
Message-ID: <20260511081117.2315474-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

The premature-update detection window between the NONBLOCK atomic
commit and the CRC sample used a fixed 100ms sleep. On
high-refresh-rate panels this 100ms wait covers many vblank
intervals (~24 at 240 Hz vs ~6 at 60 Hz) and is long enough to let
the display engine enter PSR/DC5. A subsequent CRC read then comes
back as 0xffffffff (read from a powered-down well), causing the
test to fail spuriously on these panels.

Replace the fixed sleep with 2-vblank wait:

 - It is the minimum wait that guarantees one full vblank boundary
   has elapsed past the commit, so a same-vblank-latch bug in the
   driver still has a deterministic window to manifest before the
   CRC is sampled.
 - It scales with the panel refresh rate, keeping the wait short
   on high-refresh panels (~8 ms at 240 Hz, ~33 ms at 60 Hz).

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_explicit_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index 2ec9bf39d..d50a5af63 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -283,10 +283,10 @@ static void multiplane_atomic_fence_wait(data_t *data)
 		     "driver did not wait for all IN_FENCEs!");
 
 	/*
-	 * Wait briefly and verify display hasn't updated via CRC check.
-	 * In a buggy implementation, the display might update prematurely.
+	 * Wait 2 vblanks to catch premature latch bugs while
+	 * avoiding long idle windows that trigger PSR/DC power states.
 	 */
-	usleep(100000); /* 100ms */
+	igt_wait_for_vblank_count(data->crtc, 2);
 
 	/* Check if out fence signaled prematurely */
 	ret = sync_fence_status(out_fence);
-- 
2.43.0

