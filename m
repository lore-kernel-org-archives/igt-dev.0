Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10C0108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0210EAD3;
	Fri, 20 Mar 2026 11:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFIeoYo1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DDC10EAD7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774006016; x=1805542016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9x8GLMUGOlTtSwBzwIggXuYnI8nQMKD5atVZXNChMXc=;
 b=XFIeoYo1u9QL588JOxZbPFsn2JH8W2gZdvfJEifVeOVFA6Ij80f9sFHj
 IKGef1qOPWLZgvpX+l8mQw0JHmVf0wsujB5SdM8fGXVpzZlv8v2o9f8q5
 bWBRmiH1L7KORJlCRW6fkxw63frJ8kUg8PvxdNcgBJuPxDWMY6kA3r13q
 kBZSZSmyz2vLOzWPotvbg0cTcEEM6+RUSgbkj6Y0X2QopSCZxHzehc0ue
 MXWUyNH5Bg4Mm0z9/HbvosQDu5kM1tOhapFVsNT13sPXJ4LYRWbW+4o7n
 T1wCWP/6iFVzpWd8ZilCrUivmuunRWjkqzUWdLAMpTQGi3wg2ETAiucBX g==;
X-CSE-ConnectionGUID: lus0It3JQHSKXC74na9MfA==
X-CSE-MsgGUID: vyiVu+M/TaGIVZZEUj8Wvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75162697"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75162697"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:41 -0700
X-CSE-ConnectionGUID: 4lyPANnDR8WCybYVztNCsQ==
X-CSE-MsgGUID: JES7s9PbRe224dKzCUn4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227390083"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 6/7] tests/amdgpu/amd_vrr_range:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:56 +0200
Message-ID: <b531dec3d486bcfa730d386799ef1cf91960a875.1774005763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
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

For amdpgu, crtc->crtc_index == crtc->pipe always. Use the generic and
GPU agnostic crtc->crtc_index instead of the vendor specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 9666ed320e35..cc3323df39ad 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -189,9 +189,9 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_output_t *output = &display->outputs[crtc->pipe];
+		igt_output_t *output = &display->outputs[crtc->crtc_index];
 
-		data->output[crtc->pipe] = output;
+		data->output[crtc->crtc_index] = output;
 	}
 
 	igt_display_reset(display);
-- 
2.47.3

