Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD1CE9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 07:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70BD10E680;
	Thu, 19 Feb 2026 07:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFNf+Fb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B610E680
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771486992; x=1803022992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZEt2sk57AV9zVMk8lqy4yIpR7E44PsM0irHQg3ohSgI=;
 b=fFNf+Fb3gJKBZqhF377BesP+tHQptmziiWdn8j0SALT8VIauXEl7hthY
 WdHqf8MmKBHqMlLEejyyvrv03m8rsvH2L/t0Id8kuaMQ/6QX++6snZZge
 G86OsFCRxCXcBk90HWO4l70dvGkhzR3CjBmPWwP+4wZIQkskXVeL5mjZr
 Y2mlC6ixUmVb6yDNoBNKb5vjEzoSSDPKryiKtuhRnGv0k4MU8ca44BzjI
 yVikhfQd+ySVk2Ky2S5CyCrzmdmA4/uAHzrxBdnbpihVwtGavofzjjJDE
 YLRFGxOnyiBndBlsNcJRvqaLfUgUu4t65+LxWH8WMHrVHz7Gm1bCZws8r g==;
X-CSE-ConnectionGUID: qJtRcEbDSzaeyQxVVdCOgg==
X-CSE-MsgGUID: ///Pz5tMS6+6zegEpAOK7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72469628"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72469628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:43:12 -0800
X-CSE-ConnectionGUID: PHkmOg7BSxOTs24ws3ZAww==
X-CSE-MsgGUID: HdtvM+yGR0axnM6PLuoPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213528611"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 23:43:11 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/2] Make pipe assignment joiner-aware
Date: Thu, 19 Feb 2026 13:33:38 +0530
Message-ID: <20260219080349.139498-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

        kms_pipe_stress assumed a 1:1 output-to-pipe mapping (pipe++),
which breaks on joiner configurations where one output may consume multiple
consecutive pipes.

This patch series switch assignment to igt_assign_pipes_for_outputs() and
map outputs by their driving CRTC/pipe. Skip outputs that cannot be
assigned and continue when at least one output is valid.

Store highest_mode as owned copies to avoid stale connector mode pointers
after output refresh. Iterate stress/setup by assigned pipe(output_by_pipe)
instead of connected-output order. Keep progressive modeset flow by
clearing temporary CRTC mappings after assignment.

Use min_t(int, ...) for source size calculations to start scaling from a
size guaranteed to fit in the FB.

*** BLURB HERE ***

Sowmiya S (2):
  tests/kms_pipe_stress: make pipe assignment joiner-aware
    tests/meson.build: Join header file
  tests/intel/kms_pipe_stress: Clamp the source size to the FB bounds

 tests/intel/kms_pipe_stress.c | 209 ++++++++++++++++++----------------
 tests/meson.build             |   1 +
 2 files changed, 110 insertions(+), 100 deletions(-)

-- 
2.48.1

