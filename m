Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A6AEDA693
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 16:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5C010E083;
	Tue,  3 Mar 2026 16:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gbg/iyh2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B9710E083
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772553929; x=1804089929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S0j61k3Vnlfd70RrFgkO8lUCfsJXlb9R/nP5cNragYY=;
 b=Gbg/iyh2B6Rm0OopSH7i14QOcSjaIkRj28j/dKG5VuWs0d6rO9nJ1vAN
 OC5DZ7WOO4ZuCpCHwqhFXx5wop5ptV4EJ9TqeU21Abo1xe995nybZHlhd
 kGWfEx/ShMx1UvFNzN6AyWnSTQBpQVsBflmuaa8SEGI4NSY1FmIfaK8NF
 wYZvUrrRtwRx0wWuwO74etaWx97XcVNjMyDGulhQnX+xlHgpSnc4U8FR5
 Yuq4TTBF2HXG8d2whtbw1bEuMdbBqQNaypKs4nI1BhPuv5IMnRFZmxbd/
 mpLuU65P+HMeGqqUmJm++jB8Vmhlu8vPz1FAvmHJQycBotogeD1nvO2UA Q==;
X-CSE-ConnectionGUID: XnmrxKFwTkuOZyX0VvkUDw==
X-CSE-MsgGUID: 4IQzTFbmSnuAJeLPof/15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84940457"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84940457"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:05:28 -0800
X-CSE-ConnectionGUID: v1QDAJfDRHOVSxxrElZ/bw==
X-CSE-MsgGUID: E92HwR+DQtKtS0Cus+M/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215104645"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:05:26 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 0/2] Make pipe assignment joiner-aware
Date: Tue,  3 Mar 2026 21:56:21 +0530
Message-ID: <20260303162623.324721-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Sowmiya S (2):
  tests/kms_pipe_stress: make pipe assignment joiner-aware
  tests/intel/kms_pipe_stress: Clamp the source size to the FB bounds

 tests/intel/kms_pipe_stress.c | 212 +++++++++++++++++-----------------
 tests/meson.build             |   1 +
 2 files changed, 109 insertions(+), 104 deletions(-)

-- 
2.43.0

