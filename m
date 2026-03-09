Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B1F3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E45110E15A;
	Mon,  9 Mar 2026 14:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOqrbVrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99A10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066132; x=1804602132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=syswnTvrlSVExshTiK4eSgjqhX8pJ8IxCJWT2oQ7PjQ=;
 b=mOqrbVrna9Rmn0Lx0b7Lw9FtZk+IL2IT4sic3h5Yggvt3jpuNeLoOuHF
 o8O6gv+a+QF7Nkickwst8b/nbYzIRW4sIkaQjbKZFRLD/EWcMh93TAtBw
 JtSniXm/kZW6cM5EdmEJzwdgf5vtADqXSY6N4tSNoevHUXoCdxvlwcilq
 s+VfzdB1MRUiX0ajES2fj7nbzxDutAE08UsVXcCifooo29ZcsSBk6fYTo
 YKJIfhDO3roARe4hEkwe8uAAgcGyO3FORQppBB6GgVhG7+p0xkRuw1ZXX
 0PfJVM/GVQX5ZV7hfIeQ+0umcfvPO4gtmQroOtfNth+KKu1LjVoG2FLVq g==;
X-CSE-ConnectionGUID: 9OkfvdRXSxi83RNV48wwmw==
X-CSE-MsgGUID: 5sQwzI6CRiWK0KVWreeHeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="61659531"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61659531"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:11 -0700
X-CSE-ConnectionGUID: l+qb2v5URiOpKA+B7q0b7Q==
X-CSE-MsgGUID: CBYPMacxTx6QoIOcGCzeOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224211900"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 04/10] tests/kms_cursor_crc: use CRTC indexes instead of
 pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:38 +0200
Message-ID: <788880adc41b3640311190a8dbf794c6226d25e2.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

The test tracks "active" CRTCs in a dedicated array. This does not
depend on pipes in any way. Switch to using CRTC indexes instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_cursor_crc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index bd0226c4800f..1e062c38b668 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -165,8 +165,8 @@ typedef struct {
 } data_t;
 
 static bool extended;
-static enum pipe active_pipes[IGT_MAX_PIPES];
-static uint32_t last_pipe;
+static int active_crtcs[IGT_MAX_PIPES];
+static uint32_t last_crtc_index;
 
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
@@ -900,12 +900,12 @@ static bool valid_pipe_output_combo(data_t *data)
 static bool execution_constraint(igt_crtc_t *crtc)
 {
 	if (!extended &&
-	    crtc->pipe != active_pipes[0] &&
-	    crtc->pipe != active_pipes[last_pipe])
+	    crtc->crtc_index != active_crtcs[0] &&
+	    crtc->crtc_index != active_crtcs[last_crtc_index])
 		return true;
 
 	if (!extended && igt_run_in_simulation() &&
-	    crtc->pipe != active_pipes[0])
+	    crtc->crtc_index != active_crtcs[0])
 		return true;
 
 	return false;
@@ -1278,7 +1278,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		igt_crtc_t *crtc;
 
-		last_pipe = 0;
+		last_crtc_index = 0;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -1286,8 +1286,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require_output(&data.display);
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
-			active_pipes[last_pipe++] = crtc->pipe;
-		last_pipe--;
+			active_crtcs[last_crtc_index++] = crtc->crtc_index;
+		last_crtc_index--;
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
 		igt_assert(ret == 0 || errno == EINVAL);
-- 
2.47.3

