Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83476108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3953F10EA71;
	Fri, 20 Mar 2026 10:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YV1NyMvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02F410E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003208; x=1805539208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuZvOH9bNt+O6eE/gx6QvS4F2exkbvAn74sqFViywEU=;
 b=YV1NyMvrfYRqRuy8abTBnyP2ExzNI4zgku+d4d+l6CEgS15WmbqvqpZ7
 hat/BefuKUkH91kgVzSQjBK+tOJV87GmXv8dXvJin8Wk6WVQ5hfDbHu6R
 46Y8M5OjO2VSrq7Osjxa+TofdPGfr0XOqwwArBqrhaN0N+OJ5u3eWaMFc
 JnOSYk3lXvGuXidoMrCZ5fHAmOsgtSC+fzy+f2giexkIO3VO2NPJ1jX8h
 WPILgfd7BF4L9pRjDoDmOQ7bgJ3RIsq5rMnkoQ6hXejT9CkHx8o6Bu/8b
 TFK7V9MhOiNVd9+N97jrBZzbXu3exjm4CCYFPFJgrbruNZfYZhmHiK7rv w==;
X-CSE-ConnectionGUID: p/B4dSxhQC6KVp0E+nWYEQ==
X-CSE-MsgGUID: IFlL6hISTCiMaNvYNsoFlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75272796"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75272796"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:07 -0700
X-CSE-ConnectionGUID: pZGBgKVxQ/ilI0YppL1B/Q==
X-CSE-MsgGUID: zc7xU7DVQ/OKaCVC6HY40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253751184"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 06/11] tests/intel/kms_pipe_stress: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Fri, 20 Mar 2026 12:39:26 +0200
Message-ID: <7ef4c242a65526f3340f6d93f56f24492d07fe18.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
igt_crtc_for_pipe() by ensuring the test logic is sound. The follow-up
can change the check from crtc->valid to crtc != NULL with no functional
change here.

The test is a bit weird because the pipe (or just int i) is conflated
and used for more things than just the pipe. I think the test could use
some refactoring around these parts, but I'm unsure how exactly. I hope
this is the minimal fix that gets the job done for NULL returns from
igt_crtc_for_pipe().

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

