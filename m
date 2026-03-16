Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311A2F46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFAC10E4A6;
	Mon, 16 Mar 2026 11:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbiFHzea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464910E4C7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659994; x=1805195994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k2tcnqJ1LIPNbRBNCkkshQlkNJW2fB0rk0XFOoSwymw=;
 b=dbiFHzeaP/FdEdvrLBMwL+ugj6p6WHCHMJG/BaZts4f4XbUdO2a5qb7w
 9LOSBKicylkrc8dbtiEllui+K2lhTa6T5WM40HIy3b5V+lvxBf8lDHV0y
 JZWsA94Z9dgDczwN7N6DTclUfYg4oS0LSraMBQnjRVOZ29eXlN+D0jMVf
 gjAU303mqfR6Vl+v2lr1v3p0cmbvYQhev1B31O1XiNBaiVjnznG0FzHKf
 UN0NUHx3FtW6gc9VnpVvKBbzPQcwpQLf/dkgCGQ5/g79wPHuUFoBZJqGn
 XVemFRxZSF/mtd8XHOh1q7+YYbbIYd6rQrAsTMCyzOoiMuyNtBrB+85pQ w==;
X-CSE-ConnectionGUID: m5i15FnNS7aFZADAjRmqJg==
X-CSE-MsgGUID: XggKQGxzQtCbcCD0UgCO1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92240286"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92240286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:53 -0700
X-CSE-ConnectionGUID: GeHesS95QnGewI+TTkeb7A==
X-CSE-MsgGUID: Z2lqww7MQWWuUr0ev0Zmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226874347"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 07/12] tests/intel/kms_pipe_stress: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:09 +0200
Message-ID: <bf526c155c5eb41adc99f126fdd51f2cf38c40a6.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Ensure we only operate on valid CRTCs. Either assert or continue the
loop, depending on the case.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound.

The test is a bit weird because the pipe (or just int i) is conflated
and used for more things than just the pipe. I think the test could use
some refactoring around these parts, but I'm unsure how exactly. I hope
this is the minimal fix that gets the job done for NULL returns from
igt_crtc_for_pipe().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 85ab2ec50621..79538a2aca6e 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -579,6 +579,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, pipe);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(pipe));
 
 		igt_assert_f(crtc->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
@@ -740,6 +741,7 @@ static void destroy_framebuffers(struct data *data)
 			continue;
 
 		crtc = igt_crtc_for_pipe(display, i);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(i));
 
 		for (j = 0; j < MAX_PLANES; j++) {
 			if (data->fb[i * MAX_PLANES + j].fb_id) {
@@ -801,6 +803,8 @@ static void prepare_test(struct data *data)
 		igt_assert(data->highest_mode[i]);
 
 		crtc = igt_crtc_for_pipe(display, i);
+		if (!crtc->valid)
+			continue;
 
 		if (data->highest_mode[i]) {
 			igt_info("Using mode: \n");
-- 
2.47.3

