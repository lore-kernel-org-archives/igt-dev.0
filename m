Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520FAF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BB910E4A5;
	Mon, 16 Mar 2026 11:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lfy3Ti1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6624F10E4AB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659986; x=1805195986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lATQyFWKsU6YOKqmWakG29LEv61RSfR9HrWkvSvqmO0=;
 b=Lfy3Ti1BbgCmG3T6MgAUxKS+3aXA6UYXWtqvbAy5KnaJ5EOYGH8Y94+A
 QxcSFRuUnlCTPzedd3D+eqqM/ayRsbzLuJz/MsvCAWytzeN8UCU+R4Aem
 Ie1cuTTuDXfJa8VSA/GWThLHV6DA8KZY5LHynd2mBGdH4UZ2woBzdqSVK
 2+RVufuQk9IXHGK0KHvptg5reLOpfCj14b0W01kMzzTTiE6a4BGEU87Rn
 cnHSX9W7hv4abSCu/BzuXobsQm3V3ULdHJftZhbetbF2HljUovDdKOz49
 eoTdblI6BZtoIqwb26ucp2zBal0EpIfRvKncLhFRZ26tINDAug0epuAVi g==;
X-CSE-ConnectionGUID: zHABr8R7R7mTPR9TdaEbkA==
X-CSE-MsgGUID: eyT05qkBQ+uTGk7t83i5TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74859410"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74859410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:45 -0700
X-CSE-ConnectionGUID: JFxFUkgHSZmHAsR+tH/C8w==
X-CSE-MsgGUID: 5mqA8ilfS0yadD8o9D1KMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252401145"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 02/12] tests/amdgpu/amd_multidisplay_modeset: Prepare
 for returning NULL from igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:04 +0200
Message-ID: <3b9a58fa7b3865f1e57049a9c0bf68caa89f8684.1773659680.git.jani.nikula@intel.com>
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

AMD should always have enough CRTCs for the test. Assert this is the
case by checking the CRTC is valid.

This prepares for returning NULL for invalid pipes from
igt_crtc_for_pipe() by ensuring the test logic is sound.

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

