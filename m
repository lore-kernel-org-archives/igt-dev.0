Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFDE108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6A10EA6E;
	Fri, 20 Mar 2026 10:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BolvgwKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF210EA6E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003183; x=1805539183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hkxktOk/9gyyqbx8nogqeaDpugkgUYN2eJRcnAQUhqQ=;
 b=BolvgwKntkPhNLnN3M92ljKWheWcKCIyQE2HUbVyObq3mT71yZ7fxPwP
 iBxKkSxfGYth3m71vAv4XuuLtzhAt+A36ftcVSocotAJPQquPlJrvqiGz
 QC6jrrjKneRS/CKeD491xflbu5frdiYVBXbYlOObXxgBlFuKn+XT2ThNT
 /FkP41J7Ziyox5WnspdDMpSqSOclY1MQKC9PlaWOMAY58eSnLpeIwf0w5
 jz/uYeb+9NAbaPMtoIUlxkWwUGCy3Yx5jL/F38Eaht39zk680BcsZqV+R
 apogfkjDGRslAMGgZXEC69e7bAKCHb0TTHHUUP1a7LQREEsZX9Hxv1FkM Q==;
X-CSE-ConnectionGUID: qvBXyaroQq6Zn7xFVa0bww==
X-CSE-MsgGUID: Po0UJ+FUTMOhFK8GgVP1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75159023"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75159023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:42 -0700
X-CSE-ConnectionGUID: w1/jpSgsRJOLqV8fCH81aw==
X-CSE-MsgGUID: uCnV7hXcS8O5bMguif07mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222473334"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:39:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 01/11] tests/amdgpu/amd_multidisplay_modeset: Prepare
 for returning NULL from igt_crtc_for_pipe()
Date: Fri, 20 Mar 2026 12:39:21 +0200
Message-ID: <28eded249f6309cc7fc82425007ecd414996b5d2.1774002591.git.jani.nikula@intel.com>
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

AMD should always have enough CRTCs for the test. Assert this is the
case by checking the CRTC returned from igt_crtc_for_pipe() is valid.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound. The follow-up
can change the check from crtc->valid to crtc != NULL with no functional
change here.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_multidisplay_modeset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 40d1e5d7f42b..ebcfea8ee35f 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -327,6 +327,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 
 			crtc = igt_crtc_for_pipe(display, j);
 
+			igt_assert_f(crtc->valid, "There is no pipe %s\n", kmstest_pipe_name(j));
+
 			igt_create_pattern_fb(data->fd, kmode->hdisplay,
 					kmode->vdisplay, DRM_FORMAT_XRGB8888,
 					0, (buf + j));
-- 
2.47.3

