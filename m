Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0FCF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD9310E4A6;
	Mon, 16 Mar 2026 11:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XARN5s//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B190010E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659986; x=1805195986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Od0tLcyI5/PH6fu56nwwKvw2oNCa2rAjVYVNd8obvug=;
 b=XARN5s//Q6kowCpepYtVCVF3zhUPNFdIMNfEyFaHALhVqkpnyEDffavK
 Nrv9aM0YbKQLljBpt243GfzeAhIrSQ0z0KgxAKzj0ZhoanOA6UuA0/7kU
 Aksn6O/HshY8mGEY1G6AG1Wmjz8OqCfb2ehQHPHk5AwoiFAjANtl+JRX0
 d0rPZYZPas1kkvd74l42PvV1k2+XwE6WH8T+i33oVeBjSIHrWziJgKA6L
 E/RlC7HfJ2357MJW0QZdliWw8OfvkdMmZedL/cwOkXAUNJnNlfXR9nYEv
 s5P0THZcQ+R1RctxKetfkWX4w6jy3zZBYNlMWNizLITbkLyZ2hazHAaW/ A==;
X-CSE-ConnectionGUID: JsJ+dTpGQWqM6Ye4TuH+/A==
X-CSE-MsgGUID: zNcSAKRaTCaMfZF+GEU8Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74859412"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74859412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:45 -0700
X-CSE-ConnectionGUID: 1L0O1wxZQzSbQBBIiNUbHw==
X-CSE-MsgGUID: +vVr+zS0SrSdYZ8z6y7Kyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252401192"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 05/12] tests/intel/kms_joiner_helper: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:07 +0200
Message-ID: <1bcc9a551894a8fe5541a4f619364e0885b4c948.1773659680.git.jani.nikula@intel.com>
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

Assert that the pipe is really there during testing. Refactor the code
slightly to reduce duplication while at it.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_joiner_helper.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index 7dd87c5c36ea..724ce41a892b 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -141,6 +141,8 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	igt_output_t *out;
 
 	for (idx = 0; idx < num_outputs; idx++) {
+		igt_crtc_t *crtc;
+
 		out = outputs[idx];
 		needed = get_required_pipes(drm_fd, out);
 		if (needed < 0)
@@ -160,6 +162,9 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				needed, kmstest_pipe_name(start),
 				kmstest_pipe_name(start + needed - 1), out->name);
 
+		crtc = igt_crtc_for_pipe(out->display, start);
+		igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(start));
+
 		if (needed > 1) {
 			mp = get_next_master_pipe(BIT(start));
 
@@ -168,13 +173,10 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 						out->name);
 				return false;
 			}
-			igt_output_set_crtc(out,
-					    igt_crtc_for_pipe(out->display, start));
-			igt_debug("Using pipe %s as master.\n",
-					kmstest_pipe_name(start));
-		} else
-			igt_output_set_crtc(out,
-					    igt_crtc_for_pipe(out->display, start));
+			igt_debug("Using pipe %s as master.\n", igt_crtc_name(crtc));
+		}
+
+		igt_output_set_crtc(out, crtc);
 
 		for (i = 0; i < needed; i++)
 			*used_pipes_mask |= BIT(start + i);
-- 
2.47.3

