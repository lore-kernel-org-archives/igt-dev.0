Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26A9FD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70D110EA4E;
	Fri, 27 Feb 2026 08:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCWw+uf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B410EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179639; x=1803715639;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k+dFduVX7YwU4SbcLKn9hv3w6Z6etyNA63sLBO1XIOw=;
 b=MCWw+uf48cueCr6uwPPgpgalkFIIb3mzi22j7FtXDaYccjTEDZ2XSglW
 6XbcwMUszl9LPh5MFyokacVwUEdhSF0HjlucaTZKGyvYFoUEEhIYdLzMD
 iB8P49HxU35PcvVMWGoF+/dpOS5bwMhUUA4mY9zMLYMpQWxRUR1B2HuRK
 7FD2sx9k43IMtj5c7kdSlRb7YEK2H52TsqSjj8QS+IMChRsEYSStIEWLC
 53MzrGmKeW7G9/Q+iEWgcvYML3vIb03EmRjI1ixyonwjhBMciGoM8CbwM
 6CfXkqboKjgk4GL/KTKnzxtVgzx5DrB/aEQ614TeIEYIPBw3AeNn8znF6 g==;
X-CSE-ConnectionGUID: BWjaIkR6QwiwLpGVBehUhQ==
X-CSE-MsgGUID: sb35v0ACSuSRj8abxRw7Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="98727096"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="98727096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:18 -0800
X-CSE-ConnectionGUID: FsoUFqXtSTqORG4bMrCfsQ==
X-CSE-MsgGUID: /yJKim4yRIWWG+U+QlLRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216065757"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:17 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/17] tests/kms: Use igt_crtc_name()
Date: Fri, 27 Feb 2026 10:06:41 +0200
Message-ID: <20260227080653.30389-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace a few leftover kmstest_pipe_name()s with
igt_crtc_name()

 #include "scripts/iterators.cocci"

@@
igt_crtc_t *CRTC;
@@
- kmstest_pipe_name(CRTC->pipe)
+ igt_crtc_name(CRTC)

@@
expression CRTC, PIPE;
@@
{...
CRTC = igt_crtc_for_pipe(..., PIPE);
<... when != PIPE = ...
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dsc_helper.c | 2 +-
 tests/kms_bw.c               | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 77165b41f4bc..29b998c2f1d9 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -93,7 +93,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t *output,
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
 	    (crtc->pipe == PIPE_A) && IS_GEN11(devid)) {
 		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n",
-			 kmstest_pipe_name(crtc->pipe), output->name);
+			 igt_crtc_name(crtc), output->name);
 		return false;
 	}
 
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 690e28958b38..577a0ec2f065 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -228,7 +228,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 		igt_plane_set_fb(data->primary[i], &buffer[i]);
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
-			 kmstest_pipe_name(i), igt_output_name(output), mode->name);
+			 igt_crtc_name(crtc), igt_output_name(output),
+			 mode->name);
 	}
 
 	ret = igt_display_try_commit_atomic(display,
-- 
2.52.0

