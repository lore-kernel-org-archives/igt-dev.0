Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58A6C624C6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73010EA29;
	Tue,  1 Sep 2026 08:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+Qondgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B6410E3D4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788252419; x=1819788419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LxXSgcNgo9eGIyvSitbCA4EoH3pGlRulAfL4qE3g1NQ=;
 b=L+QondgvJRGvnjsDY/RdTEuqp1K/cDjX/SshLwZow28n2a7kUUH8MD7V
 6TsSQqyvNoFAmmgcCPGVn4ehzwJ1TQ1kp8CNoM2DEG1qZXeCVqDHNoAfR
 UU75WpOrhCtoFVfncDs40NuPZwSAYuazpm83Nedayf8D15w9bWFoPua6J
 NAny62VDFFBle7rDdII5edWG7QqW+XETl+vs1+yryZFirmbGMipVu+bcl
 LlVbD3PWUScD3Z7bcy/t7cmqalDWaUoMb56OR121oEl3vHMzeFIXJJ2eD
 0uJilFmyrHg7xF3u81/Hg/d5/q+J+oB6cLIWOz08ctFB/1LR8ph6YOC9R w==;
X-CSE-ConnectionGUID: a1OK99qmTT6zQwQQk9dlEA==
X-CSE-MsgGUID: POrerhfwSAS7ZWNmCAeRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92362978"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92362978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:58 -0700
X-CSE-ConnectionGUID: +4fBBC6jQOCnVU03DTWlTQ==
X-CSE-MsgGUID: G3+PrbI4TzOFopMgIBXn5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="292542319"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_joiner_helper: iterate CRTCs
 instead of pipes
Date: Tue,  1 Sep 2026 11:46:38 +0300
Message-ID: <a9a1b7c524e682ec6e1a8a7dd12534f661ac598a.1788252273.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788252273.git.jani.nikula@intel.com>
References: <cover.1788252273.git.jani.nikula@intel.com>
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

Reduce the direct pipe usage.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_joiner_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index da0ac7f624f3..5bacf6cb9e27 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -101,13 +101,14 @@ static enum pipe get_next_master_pipe(uint32_t pipe_mask)
  */
 void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
 {
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	*master_pipes = 0;
-	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
-		if (igt_crtc_for_pipe(display, pipe) && igt_crtc_for_pipe(display, pipe + 1)) {
-			*master_pipes |= BIT(pipe);
-			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
+
+	for_each_crtc(display, crtc) {
+		if (igt_crtc_for_pipe(display, crtc->pipe + 1)) {
+			*master_pipes |= BIT(crtc->pipe);
+			igt_info("Found master pipe %s\n", igt_crtc_name(crtc));
 		}
 	}
 }
-- 
2.47.3

