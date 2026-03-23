Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007BBEC01D4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975E010E23D;
	Mon, 23 Mar 2026 12:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLR2+UpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA95910E23D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 12:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774267594; x=1805803594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PUqGCpooQNOWFbprtxrjFiSzDnnHwqqCCvLiVHUkGt0=;
 b=FLR2+UpQpe28GS4H0lI5lrHnpkl94QVX67S7Hg4O8PFr2iFy/+KXUwuO
 pGq5wkd4nrlOYcO9kgd4cRtq+UhsS4dvFzYpyL6EaIEjK3kC02kB8aPug
 9CK7PiKK1U8UOdSJIouGg8R1jTapBN53TG6gjLHlEqxPLtAEkUfOcZ2Ts
 GRdlAhKr1Xxbdn4y+nIpauWxy/lNgCo8cEylHFFWwVR8YaP2Vo1tBttlh
 4lMFGYNIgLQrrlNnzpQ2DGVrovL48EXHnAJQ9gulgH2S/lJemaNIBOQEc
 V5QH+KO03YfK/7cwz2j5+BPOTTVCxjyeeoLbABoAnq9Khp9hd+hgO3aUO A==;
X-CSE-ConnectionGUID: OvJrNDCISLWioru8TV0NbQ==
X-CSE-MsgGUID: JdLrwFdHTjeD9gaj18C18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86736239"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86736239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:33 -0700
X-CSE-ConnectionGUID: Ig+4yWxES0i/m8Cfvlyesg==
X-CSE-MsgGUID: QGMSV/MFTZymFbUUHyy5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254481956"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 0/3] lib/kms: make for_each_crtc_with_single_output()
 independent of pipes
Date: Mon, 23 Mar 2026 14:06:23 +0200
Message-ID: <cover.1774267502.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

A slightly tricky series to make for_each_crtc_with_single_output()
independent of pipes, while retaining pipe order iteration on Intel
devices.

Jani Nikula (3):
  lib/kms: don't special case igt_get_single_output_for_crtc()
    implementation
  lib/kms: refactor for_each_crtc_with_single_output() to avoid
    igt_crtc_for_pipe()
  lib/kms: use CRTC index for __igt_output_crtc_populate()

 lib/igt_kms.c | 40 +++++++++++++++++++++++++++++++---------
 lib/igt_kms.h | 23 ++++++++++++++---------
 2 files changed, 45 insertions(+), 18 deletions(-)

-- 
2.47.3

