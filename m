Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1370D70DED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 19:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C67510E040;
	Thu, 28 Nov 2024 19:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqwR+naV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EB110E040
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732820971; x=1764356971;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KHXoL6B+4CQ5BhV6Yk7PsoIP4rCfFyEAF8d/BbhJhZA=;
 b=SqwR+naVZltP2bGNrYLQ6UPe5YnaMXwOoFPxrjtHdfjWdg8M5B1T5vHS
 R++lr0FjQuJKm8wken07DpMCiRAkuoJVYr/Tg3LbgilDoS4Du2Vj6FJ4Y
 W4iz/lqoHxIEQyNPf7m31p8sWWyW8nlObh7VZLk/+w3tzsqwVZkrXxw9B
 GYxjBCykJXlVRl/HMQorvykelE+3j/P4KmocYNrPontu2edfs895yBfn3
 vkqkq0wl6/2maK0zyYTtlZawRnJZCqsXAskZK2Km45VamuRz+by3kPfzM
 zgCj2MLdsdbvv40NdMewGF3lOHwkamMH0rggEKqQKR7n56eJbY9PLCKpv g==;
X-CSE-ConnectionGUID: oNfgIuDRSQq+2KQ4B3v6Hw==
X-CSE-MsgGUID: FYVcTfObTZeuvaGkxV0biw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33193503"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33193503"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 11:09:30 -0800
X-CSE-ConnectionGUID: rR61IyA3SsW4KmqjSASMzg==
X-CSE-MsgGUID: 8E3SqC/lT6ifHSizJd7New==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="92486372"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Nov 2024 11:09:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Nov 2024 21:09:27 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/kms_invalid_mode: Attempt divide-by-zero in
 drm_mode_vrefresh()
Date: Thu, 28 Nov 2024 21:09:27 +0200
Message-ID: <20241128190927.26033-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a new subtest which attempts to invoke a div-by-zero via
an overflow in drm_mode_vrefresh() (found by syzbot).

v2: Fix the docs

Link: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 4fd644594ef9..1ebce4df3616 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -56,6 +56,7 @@
  * @zero-clock:       Clock as zero
  * @zero-hdisplay:    hdisplay as zero
  * @zero-vdisplay:    vdisplay as zero
+ * @overflow-vrefresh: vrefresh calculation overflow
  */
 
 IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
@@ -210,6 +211,20 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
 	return true;
 }
 
+static bool
+adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
+{
+	/*
+	 * htotal * vtotal * vscan == 2^32
+	 * overflow during vrefresh calculation
+	 */
+	mode->htotal = 32768;
+	mode->vtotal = 32768;
+	mode->vscan = 4;
+
+	return true;
+}
+
 static void
 test_output(data_t *data)
 {
@@ -285,6 +300,9 @@ static const struct {
 	{ .name = "bad-vtotal",
 	  .adjust_mode = adjust_mode_bad_vtotal,
 	},
+	{ .name = "overflow-vrefresh",
+	  .adjust_mode = adjust_mode_overflow_vrefresh,
+	},
 };
 
 static data_t data;
-- 
2.45.2

