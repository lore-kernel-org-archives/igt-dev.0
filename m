Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D6A105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7510EB6B;
	Fri, 13 Mar 2026 09:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6EQaY1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6D110EB6A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394377; x=1804930377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k81o4QT/ca78XFTclpAPtSaOcJwuP5WUsaAk8JsjcpE=;
 b=Y6EQaY1lMe51VJJkISCimyWKP7Wbv5QloL03DVtXhBTipfJiC9jCpcs7
 GHqkVLolPtyJjsKkYMV2vibAeLzXAv7PHdN3LcrHaP6Ki6blKiGUq7+3o
 9KQJdzx0XJWQs8lqi6shFyzZSKmk4iXkV3uzOER7VIVb7sK5jnYUmmk7i
 h1pf51OrnfrUtSGmQUFOscqbhCKMiyAEWA3jLp5ksH50C/wt6h7P9IRiT
 pgCvViu5x/G7ocBGUjbx6jzSWewkGKfDuB0qSCTIDLB3M5P+biVYVrc3h
 crl0Hxoy+Xp/U3NRT/Ehlnb92cA9ACDpMZIQe23k5ba5sZtDcKDtVhPv5 w==;
X-CSE-ConnectionGUID: Kb/w4RM+Qh2d0DlFxPGZTA==
X-CSE-MsgGUID: hqu3+rIJQDaKsTP9e/cwFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85854335"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="85854335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:57 -0700
X-CSE-ConnectionGUID: SiFUxEgdSuOb1Wx5PfhneA==
X-CSE-MsgGUID: NG1MfPaMS+Wh8BTjELtN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="220374211"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 5/8] lib/i915/fbc: make intel_fbc_max_plane_size() static
Date: Fri, 13 Mar 2026 11:31:57 +0200
Message-ID: <9676d88718edad5dde9ef3e87644be7a3566ff61.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
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

intel_fbc_max_plane_size() isn't used outside of intel_fbc.c, make it
static.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c | 2 +-
 lib/i915/intel_fbc.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index d6c34bb80f2d..9e5f91ddaaff 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -110,7 +110,7 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc)
  * Returns:
  * None
  */
-void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
+static void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
 {
 	const uint32_t dev_id = intel_get_drm_devid(fd);
 	const struct intel_device_info *info = intel_get_device_info(dev_id);
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 0245719dcf33..b4ba541b908b 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -16,7 +16,6 @@ enum psr_mode;
 bool intel_fbc_supported(igt_crtc_t *crtc);
 bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
 bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
-void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
 bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
 
-- 
2.47.3

