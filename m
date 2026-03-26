Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5803910A62C0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3010E925;
	Thu, 26 Mar 2026 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keb0mgMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933810E925
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529645; x=1806065645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4AIV3EWI/6ZoHXk0AOBz5jZOpDgG2dXU4v4YHdkbLw=;
 b=keb0mgMlR9hH5mB27E6sy/sWI0MgbrX9D3yo9VbxLELJ2D98xOjMYhw6
 8ZV5++/Pw5xDFtoZhysX9mBVPqOSypRglzgBmvCcWgrAiFvvrdabx93pe
 nOm3eIbbEtj9dJreREdHFAmXfAci+rut/mRTaj+yV46ObcE/507BjGG8k
 mlgpc57y0qJ8iORrDNEN/qhXQCCV/XdXOaJkZ2LbSBzx0X2XOJnwC6Oan
 6Ge/Fec4Xb4YhbEOS02T3jUiYBh1gGGfL3cW+un+Zzb98t8IqwUDwpHHg
 NNJ1DnZD5Q0EF5zNHNE19Kw6AMCqHLFIaNuLX3P9dV7S93KX92TXr+oxW w==;
X-CSE-ConnectionGUID: qknvihNuR7K8H4e45jO1Vg==
X-CSE-MsgGUID: l5/y9wVZReStUxGSQMq4kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86275958"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86275958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:05 -0700
X-CSE-ConnectionGUID: KxbqxgnqS0OT4IqiatXlkA==
X-CSE-MsgGUID: HAFqzN+WTcaCoGqDGgjGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262907850"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:54:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t v3 3/5] tests/intel/kms_joiner_helper: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Thu, 26 Mar 2026 14:53:37 +0200
Message-ID: <bbc9d7e1c0ac2e7a71597a2894990362b6cbb102.1774529527.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774529527.git.jani.nikula@intel.com>
References: <cover.1774529527.git.jani.nikula@intel.com>
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

Assert that the pipe is really there during testing. Refactor the code
slightly to reduce duplication while at it.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound. The follow-up
can change the check from crtc->valid to crtc != NULL with no functional
change here.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

