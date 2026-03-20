Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366BB108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB8F10EA6E;
	Fri, 20 Mar 2026 10:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHuxPr8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D34F10EA6E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003198; x=1805539198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4AIV3EWI/6ZoHXk0AOBz5jZOpDgG2dXU4v4YHdkbLw=;
 b=OHuxPr8xh3kilFrRM5mhnnqb7v+PJeBt80/IZwS6/MbFeQ2KH3m+WkeM
 IgUfdB25uTnHKH833gvxsx4K8MSJY+55f2FepGo05Jck8ORm5qIlVo2oa
 utyfw8rQPqNipAFFqUx2TULJJlbpOKmyKJtsR3E2es3oleWT9qZ+iC6ka
 KNDXiwfnrozOQ54Mn1IvrdceN1WWUrx0mEAAVkJux2ZBjYjx3dOataXeN
 BsVYDjB0ag1sR3jMP40nz9x2rgn2pzH0UKYoGvSH8qbYyRNyNs9o+K5p3
 LbF3j/DEE663+lYwSbhajNadfBePpvTNeQVbkUk3BERS1Jw0BC5iaApe2 Q==;
X-CSE-ConnectionGUID: FFimE0DJTIKRk7tubMjmzQ==
X-CSE-MsgGUID: 6mr0lGK5QjWpGiCpKXY3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74266448"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74266448"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:58 -0700
X-CSE-ConnectionGUID: 6hi2swPLS5C5tF2JnhOCIg==
X-CSE-MsgGUID: neu/URi/Rf2QgmoQKQD0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218619455"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 04/11] tests/intel/kms_joiner_helper: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Fri, 20 Mar 2026 12:39:24 +0200
Message-ID: <f7e70f621b40bb506691cd5b31fd138a1c5775d8.1774002591.git.jani.nikula@intel.com>
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

