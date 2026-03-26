Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA110A62C0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5524D10E92D;
	Thu, 26 Mar 2026 12:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfM1n/Vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AB010E928
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774529634; x=1806065634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hRmKg5VI1xYbPJzfEOVbfeQLmSLg1bPsbpk/zmSVKxU=;
 b=VfM1n/VmELTsyqmq+kv7HDqLpf7ehnVzAe+776zMBDiqnChWo+3rt13/
 j+tlEiRNllWbyfObNLJY4cgjwpqlDGdAKIXg83jrWd36mhSGQVveWVCfG
 0npwKcXwe3332vzMgO7OQA9kZXlnB113DkPbw5IACu9zmRHatW5UJfhPS
 gYre3zebMqDWJRKrPyKbLVZcFnokiw8QmWEKkA6rXwfDERv+vPVzfwzXB
 Hs7AAz2KU+nHULcV7BDqc8pHDlk3i0VTjsXyb/i+ox5d1J6Orz9XRHu2S
 /SX8nA9wx0GiyOfwiQhhMChHw2MPN68ObiuxlAwwC/DzeD5TVA4CufFwx w==;
X-CSE-ConnectionGUID: qWB0HtNGR8S80u8yDivBpQ==
X-CSE-MsgGUID: zDZSdGvrQhGc+KEPxR05uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86275939"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86275939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:53:54 -0700
X-CSE-ConnectionGUID: 6zAFEozsTN+7UfgwGNQMnA==
X-CSE-MsgGUID: NvUQyEOJTcmcV7cOaPPSQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262907744"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:53:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v3 1/5] tests/amdgpu/amd_multidisplay_modeset: Prepare
 for returning NULL from igt_crtc_for_pipe()
Date: Thu, 26 Mar 2026 14:53:35 +0200
Message-ID: <42c82fdc808ed80c3b3eebc8e2d324bf06c4cb87.1774529527.git.jani.nikula@intel.com>
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
index 98ca2c79470b..3aa7b3483a28 100644
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

